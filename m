From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Mar 2017 23:10:08 +0100
Subject: [Buildroot] [PATCH v3 2/2] Makefile: add check of binaries
	architecture
In-Reply-To: <1489355729-13364-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1489355729-13364-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1489355729-13364-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170312221008.GI3739@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-03-12 22:55 +0100, Thomas Petazzoni spake thusly:
> As shown recently by the firejail example, it is easy to miss that a
> package builds and installs binaries without actually cross-compiling
> them: they are built for the host architecture instead of the target
> architecture.
> 
> This commit adds a small helper script, check-bin-arch, called as a
> GLOBAL_INSTRUMENTATION_HOOKS at the end of the target installation of
> each package, to verify that the files installed by this package have
> been built for the correct architecture.
[--SNIP--]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index e8a8021..71e3033 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -87,6 +87,14 @@ define step_pkg_size
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
>  
> +define check_bin_arch
> +	$(if $(filter end-install-target,$(1)-$(2)),\
> +		support/scripts/check-bin-arch $(3) \
> +			$(BUILD_DIR)/packages-file-list.txt $(TARGET_CROSS))

Also pass $(BR2_READELF_ARCH_NAME) directly from here, since we have it
in the Makefile, which would allow you...

> +endef
> +
> +GLOBAL_INSTRUMENTATION_HOOKS += check_bin_arch
> +
>  # This hook checks that host packages that need libraries that we build
>  # have a proper DT_RPATH or DT_RUNPATH tag
>  define check_host_rpath
> diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
> new file mode 100755
> index 0000000..4c94abe
> --- /dev/null
> +++ b/support/scripts/check-bin-arch
> @@ -0,0 +1,39 @@
> +#!/bin/bash
> +
> +PACKAGE=$1
> +PACKAGE_FILE_LIST=$2
> +TARGET_CROSS=$3
> +
> +exitcode=0
> +
> +READELF_ARCH_NAME=$(sed -r -e "/^BR2_READELF_ARCH_NAME=\"(.+)\"$/!d; s//\1/;" ${BR2_CONFIG})

... to get rid of this ugly code. ;-)

> +PKG_FILES=$(sed -r -e "/^${PACKAGE},(.+)$/!d; s//\1/;" ${PACKAGE_FILE_LIST})
> +
> +for f in ${PKG_FILES} ; do
> +	# Skip firmware files, they could be ELF files for other
> +	# architectures
> +	if [[ "${f}" =~ ^\./(usr/)?lib/firmware/.* ]]; then
> +		continue
> +	fi
> +
> +	# Get architecture using readelf
> +	arch=$(${TARGET_CROSS}readelf -h "${TARGET_DIR}/${f}" 2>&1 | \

As already said, runn that with LC_ALL=C.

> +		       sed -r -e '/^  Machine: +(.+)/!d; s//\1/;')
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
> +	printf 'ERROR: %s (from %s) architecture is %s, should be %s\n' \

The grammar is not nice here. What about:

    "ERROR: architecture for %s (from %s) is %s, should be %s\n"

Otherwise, looks good. :-)

Regards,
Yann E. MORIN.

> +	       "${f}" "${PACKAGE}" "${arch}" "${READELF_ARCH_NAME}"
> +
> +	exitcode=1
> +done
> +
> +exit ${exitcode}
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
