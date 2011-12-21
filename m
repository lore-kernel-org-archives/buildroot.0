From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Dec 2011 08:12:47 +0100
Subject: [Buildroot] [PATCH 5 of 5 v5] dependencies: build a host-tar if
	no suitable tar can be found
In-Reply-To: <5ee5358c709c54f31926.1324025236@devws108>
References: <patchbomb.1324025231@devws108>
 <5ee5358c709c54f31926.1324025236@devws108>
Message-ID: <201112210812.47310.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 16 December 2011 09:52:29 Thomas De Schampheleire wrote:
> Some toolchains, like the one built with buildroot itself, use hardlinks (for
> example to link between the c++ and g++ binary). Unpacking such a toolchain
> with the --strip-components options does not work correctly if the system tar
> is too old (<1.17). Even recent releases of RedHat/CentOS still ship with
> tar 1.15.
> 
> This patch checks for a suitable tar version (tar 1.17+) on the host system,
> and adds host-tar to the host dependencies if none can be found.
> 
> host-tar is download and extracted as cpio.gz instead of tar.gz, to prevent
> chicken-egg problem.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> v1/v2 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


[snip]
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -13,3 +13,15 @@ TAR_DEPENDENCIES += busybox
>  endif
>  
>  $(eval $(call AUTOTARGETS))
> +
> +# host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem
> +# of needing tar to build tar.
> +HOST_TAR_SOURCE = tar-$(TAR_VERSION).cpio.gz
> +define HOST_TAR_EXTRACT_CMDS
> +	mkdir -p $(HOST_TAR_DIR)
> +	cd $(HOST_TAR_DIR) && \
> +		$(INFLATE.gz) $(DL_DIR)/$(HOST_TAR_SOURCE) | cpio -i
> +	mv $(HOST_TAR_DIR)/tar-$(TAR_VERSION)/* $(HOST_TAR_DIR)
> +	rmdir $(HOST_TAR_DIR)/tar-$(TAR_VERSION)
> +endef
> +$(eval $(call AUTOTARGETS,host))

 It is indeed much simpler this way!

 One small remark: we usually use $(@D) rather than $($(PKG)_DIR).

> diff --git a/support/dependencies/check-host-tar.mk b/support/dependencies/check-host-tar.mk
> new file mode 100644
> --- /dev/null
> +++ b/support/dependencies/check-host-tar.mk
> @@ -0,0 +1,9 @@
> +TAR ?= tar
> +
> +ifeq (,$(call suitable-host-package,tar,$(TAR)))
> +  DEPENDENCIES_HOST_PREREQ += host-tar
> +  TAR = $(HOST_DIR)/usr/bin/tar
> +endif
> +
> +# Since TAR is at least 1.17, it will certainly support --strip-components
> +TAR_STRIP_COMPONENTS = --strip-components
> diff --git a/support/dependencies/check-host-tar.sh b/support/dependencies/check-host-tar.sh
> new file mode 100755
> --- /dev/null
> +++ b/support/dependencies/check-host-tar.sh
> @@ -0,0 +1,35 @@
> +#!/bin/sh
> +
> +candidate="$1"
> +
> +tar=`which $candidate`
> +if [ ! -x "$tar" ]; then
> +	tar=`which tar`
> +	if [ ! -x "$tar" ]; then
> +		# echo nothing: no suitable tar found
> +		exit 1
> +	fi
> +fi
> +
> +# Output of 'tar --version' examples:
> +# tar (GNU tar) 1.15.1
> +# tar (GNU tar) 1.25
> +version=`$tar --version | head -n 1 | sed 's/^.*\s\([0-9]\+\.\S\+\).*$/\1/'`
> +major=`echo "$version" | cut -d. -f1`
> +minor=`echo "$version" | cut -d. -f2`
> +bugfix=`echo "$version" | cut -d. -f3`
> +
> +# Minimal version = 1.17 (previous versions do not correctly unpack archives
> +# containing hard-links if the --strip-components option is used).
> +major_min=1
> +minor_min=17
> +if [ $major -gt $major_min ]; then
> +	echo $tar
> +else
> +	if [ $major -eq $major_min -a $minor -ge $minor_min ]; then
> +		echo $tar
> +	else
> +		# echo nothing: no suitable tar found
> +		exit 1
> +	fi
> +fi

 You could use the same sorting trick that you use in patch 2/5, but then
using host sort:

version=`echo -e '${MINIMAL_VERSION}\n${version}' | sort -n`
if [ "$version" != "${MINIMAL_VERSION}" ]; then
  exit 1
else
  echo $tar
fi

(completely untested, of course).

 But don't count this as a requirement to get my Acked-by :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
