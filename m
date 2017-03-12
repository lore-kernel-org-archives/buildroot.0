From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Mar 2017 21:27:41 +0100
Subject: [Buildroot] [PATCH v2 2/2] Makefile: add check of binaries
 architecture
In-Reply-To: <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489340983-11806-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489340983-11806-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <aa76136f-f6cb-0746-319c-c71f0812cc26@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-03-17 18:49, Thomas Petazzoni wrote:

[snip]
> +READELF_ARCH_NAME = $(call qstrip,$(BR2_READELF_ARCH_NAME))
> +
> +ifneq ($(READELF_ARCH_NAME),)

 We set it for all arches, so this is never empty. Except when we forget to set
it, but in that case we probably want this thing to be executed so we notice.

> +define CHECK_BIN_ARCH
> +	support/scripts/check-bin-arch $(TARGET_DIR) \
> +		$(TARGET_CROSS) "$(READELF_ARCH_NAME)"
> +endef
> +TARGET_FINALIZE_HOOKS += CHECK_BIN_ARCH
> +endif

 It would be nice to do it immediately after package install, so it becomes a
package error rather than some post-build error that is more difficult to
localise. Of course, with Yann's suggestion it would still report which package
was the culprit, but I don't think it would show up in the autobuild results
under the right package.

 To avoid too much overhead rechecking files all the time, it could be done as
part of step_pkg_size_end which iterates over the files installed in target for
that particular package. It would make the code a little more complicated,
though, and perhaps also slower.

> +
>  $(TARGETS_ROOTFS): target-finalize
>  
>  target-finalize: $(PACKAGES)
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> new file mode 100755
> index 0000000..cb29ded
> --- /dev/null
> +++ b/support/scripts/check-bin-arch
> @@ -0,0 +1,33 @@
> +#!/bin/bash
> +
> +# This script looks at all files in the target filesystem, and for
> +# those that are ELF files, verifies that they have been built for the
> +# correct architecture.
> +
> +TARGET_DIR=$1

 Top-level Makefile already exports TARGET_DIR, so no need to pass it as an
argument. And it's not as if this script is meant to be ran outside of the build.

> +TARGET_CROSS=$2
> +READELF_ARCH_NAME=$3

 This could also be grepped out of BR2_CONFIG, like mkusers does it.
> +
> +exitcode=0
> +
> +# In order to avoid matching firmware files that could have the ELF
> +# format, but for other architectures, we only look in bin, lib, sbin,
> +# usr/bin, usr/lib and usr/sbin
> +for f in $(find ${TARGET_DIR}/{usr/,}{bin,lib,sbin} -type f) ; do
> +    # Skip non-ELF files
> +    if ! file -b ${f} | grep -q "ELF " ; then

 As observed by Wolfgang in the context of rpath sanitisation, file is pretty
inefficient. We came to the conclusion that the most efficient is just checking
the first 4 bytes (0x7f 0x45 0x4c 0x46). Since it is also needed for the rpath
sanitisation, perhaps we should have a common script, or even compiled code, to
do this check.

 Note however that just checking the first 4 bytes gives a bunch of false
positives, so we'd have to ignore errors from readelf as well.


> +	continue
> +    fi
> +
> +    # Get architecture using readelf
> +    farchname=$(${TARGET_CROSS}readelf -h ${f} | \
> +		       grep '^  Machine:' | \
> +		       sed 's/^  Machine: *\(.*\)/\1/')

 Why not the simpler sed -n '/^  Machine: *\(.*\)/s//\1/p' instead of the extra
grep?


 Regards,
 Arnout

> +
> +    if test "${farchname}" != "${READELF_ARCH_NAME}" ; then
> +	echo "ERROR: ${f} architecture is '${farchname}', should be '${READELF_ARCH_NAME}'"
> +	exitcode=1
> +    fi
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
