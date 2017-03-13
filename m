From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Mar 2017 23:19:01 +0100
Subject: [Buildroot] [PATCH v4 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <1489357076-31990-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489357076-31990-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489357076-31990-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <8764cb7e-0547-8bd2-3075-ff3534cb1f93@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-03-17 23:17, Thomas Petazzoni wrote:
> As shown recently by the firejail example, it is easy to miss that a
> package builds and installs binaries without actually cross-compiling
> them: they are built for the host architecture instead of the target
> architecture.
> 
> This commit adds a small helper script, check-bin-arch, called as a
> GLOBAL_INSTRUMENTATION_HOOKS at the end of the target installation of
> each package, to verify that the files installed by this package have
> been built for the correct architecture.
> 
> Being called as a GLOBAL_INSTRUMENTATION_HOOKS allows the build to error
> out right after the installation of the faulty package, and therefore
> get autobuilder error detection properly assigned to this specific
> package.
> 
> Example output with the firejail package enabled, when building for an
> ARM target:
> 
> ERROR: ./usr/lib/firejail/libconnect.so (from firejail) architecture is Advanced Micro Devices X86-64, should be ARM
> ERROR: ./usr/bin/firejail (from firejail) architecture is Advanced Micro Devices X86-64, should be ARM
> ERROR: ./usr/lib/firejail/libtrace.so (from firejail) architecture is Advanced Micro Devices X86-64, should be ARM
> ERROR: ./usr/lib/firejail/libtracelog.so (from firejail) architecture is Advanced Micro Devices X86-64, should be ARM
> ERROR: ./usr/lib/firejail/ftee (from firejail) architecture is Advanced Micro Devices X86-64, should be ARM
> ERROR: ./usr/lib/firejail/faudit (from firejail) architecture is Advanced Micro Devices X86-64, should be ARM
> ERROR: ./usr/bin/firemon (from firejail) architecture is Advanced Micro Devices X86-64, should be ARM
> ERROR: ./usr/bin/firecfg (from firejail) architecture is Advanced Micro Devices X86-64, should be ARM
> package/pkg-generic.mk:306: recipe for target '/home/thomas/projets/buildroot/output/build/firejail-0.9.44.8/.stamp_target_installed' failed
> make[1]: *** [/home/thomas/projets/buildroot/output/build/firejail-0.9.44.8/.stamp_target_installed] Error 1
> 
> Many thanks to Yann E. Morin and Arnout Vandecappelle for their reviews
> and suggestions.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

 I almost gave my Ack, but there's still an issue... I also have a bunch of nits
so the big issue is marked with [!!].

> ---

[snip]
> +# Relies on step_pkg_size, so must be after
> +define check_bin_arch
> +	$(if $(filter end-install-target,$(1)-$(2)),\
> +		support/scripts/check-bin-arch $(3) \
> +			$(BUILD_DIR)/packages-file-list.txt \
> +			$(TARGET_READELF) \
> +			$(BR2_READELF_ARCH_NAME))

 Yann's coding style, which is followed in most of our shell scripts, is to give
arguments a flag if they are not something like a list of files. That makes it a
lot more transparent what is happening. So in this case, you could have e.g. -p
<package> -l <packages-file-list> -r <readelf> -a <arch>.

 Also, we usually do "$(call qstrip,$(BR2_READELF_ARCH_NAME))" to be sure the ""
are there. Though honestly there is not so much reason to do that - the only
valid reason is for variables that are overridden on the command line, but for
this particular one we really don't need to support commandline override :-).


> +endef
> +
> +GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
> +
>  # This hook checks that host packages that need libraries that we build
>  # have a proper DT_RPATH or DT_RUNPATH tag
>  define check_host_rpath
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> new file mode 100755
> index 0000000..63d941f
> --- /dev/null
> +++ b/support/scripts/check-bin-arch
> @@ -0,0 +1,39 @@
> +#!/bin/bash
> +
> +PACKAGE=$1
> +PACKAGE_FILE_LIST=$2
> +TARGET_READELF=$3
> +READELF_ARCH_NAME=$4
> +
> +exitcode=0
> +
> +PKG_FILES=$(sed -r -e "/^${PACKAGE},(.+)$/!d; s//\1/;" ${PACKAGE_FILE_LIST})

 Fighting Yann on this one: I really find the "/.../s//\1/p" construct easier to
parse than "/.../!d; s//\1/". Yes, found a bikeshed!

> +
> +for f in ${PKG_FILES} ; do
> +	# Skip firmware files, they could be ELF files for other
> +	# architectures
> +	if [[ "${f}" =~ ^\./(usr/)?lib/firmware/.* ]]; then
> +		continue
> +	fi
> +
> +	# Get architecture using readelf
> +	arch=$(LC_ALL=C ${TARGET_READELF} -h "${TARGET_DIR}/${f}" 2>&1 | \
> +		       sed -r -e '/^  Machine: +(.+)/!d; s//\1/;')

 [!!] Since we now do this before the finalize step, TARGET_DIR is still full of
.a files. These contain several ELF files, so readelf -h will print several ELF
headers, so this will not match. We can safely assume that all ELF files in a .a
are going to be for the same target, so just pipe into head -1.

 I tested that, so with that fixed, you can add my
 Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


> +
> +	# If no architecture found, assume it was not an ELF file
> +	if test "${arch}" = "" ; then
> +		continue
> +	fi
> +
> +	# Architecture is correct
> +	if test "${arch}" = "${READELF_ARCH_NAME}" ; then
> +		continue
> +	fi
> +
> +	printf 'ERROR: architecture for %s (from %s) is %s, should be %s\n' \
                                           ^^^^^^^^^
 Since this is now called per-package, it isn't necessary any more to say from
which package it comes.

 Regards,
 Arnout

> +	       "${f}" "${PACKAGE}" "${arch}" "${READELF_ARCH_NAME}"
> +
> +	exitcode=1
> +done
> +
> +exit ${exitcode}
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
