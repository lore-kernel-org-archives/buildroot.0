From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Nov 2011 23:31:39 +0000
Subject: [Buildroot] [PATCH 3 of 5 RFC] dependencies: build a host-tar
	if no suitable tar can be found
In-Reply-To: <bd9622b6331d3350b82e.1320911668@devws108>
References: <patchbomb.1320911665@devws108>
 <bd9622b6331d3350b82e.1320911668@devws108>
Message-ID: <201111152331.39741.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 10 November 2011 19:31:58 Thomas De Schampheleire wrote:
> Some toolchains, like the one built with buildroot itself, use hardlinks (for
> example to link between the c++ and g++ binary). Unpacking such a toolchain
> with the --strip-components options does not work correctly if the system tar
> is too old (<1.17). Even recent releases of RedHat/CentOS still ship with
> tar 1.15.
> 
> This patch checks for a suitable tar version (tar 1.17+) on the host system,
> and adds host-tar to the host dependencies if none can be found.
> 
> TAR is redefined to HOST_TAR, except when extracting host-tar (this is a
> chicken-and-egg problem), so that all packages use the host-tar if no suitable
> tar was found.
> 
> Along with this patch, the definition of TAR_STRIP_COMPONENTS was moved to
> check-host-tar.mk.

 Since tar >= 1.17 is required, this can be removed.

> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> 
> ---
>  package/Makefile.package.in              |  12 ------------
>  package/tar/tar.mk                       |   4 ++++
>  toolchain/dependencies/check-host-tar.mk |  24 ++++++++++++++++++++++++
>  toolchain/dependencies/check-host-tar.sh |  29 +++++++++++++++++++++++++++++
>  4 files changed, 57 insertions(+), 12 deletions(-)
> 
> diff --git a/package/Makefile.package.in b/package/Makefile.package.in
> --- a/package/Makefile.package.in
> +++ b/package/Makefile.package.in
> @@ -235,18 +235,6 @@ define DOWNLOAD
>  	exit 1
>  endef
>  
> -# Utility programs used to build packages
> -TAR ?= tar
> -
> -# Automatically detect tar --strip-path/components option
> -TAR_STRIP_COMPONENTS := \
> -  $(shell $(TAR) --help | grep strip-path > /dev/null ; \
> -  if test $$? = 0 ; then \
> -   echo '--strip-path' ; \
> -  else \
> -   echo '--strip-components' ; \
> -  fi)
> -
>  # Needed for the foreach loops to loop over the list of hooks, so that
>  # each hook call is properly separated by a newline.
>  define sep
> diff --git a/package/tar/tar.mk b/package/tar/tar.mk
> --- a/package/tar/tar.mk
> +++ b/package/tar/tar.mk
> @@ -8,3 +8,7 @@ TAR_VERSION = 1.26
>  TAR_SITE = $(BR2_GNU_MIRROR)/tar
>  
>  $(eval $(call AUTOTARGETS))
> +
> +TAR := $(SYSTEM_TAR) # We need a real tar to extract tar

 Here you still need the TAR_STRIP_COMPONENTS, because SYSTEM_TAR
may be < 1.15.

> +$(eval $(call AUTOTARGETS,host))
> +TAR := $(HOST_TAR)
> diff --git a/toolchain/dependencies/check-host-tar.mk b/toolchain/dependencies/check-host-tar.mk
> new file mode 100644
> --- /dev/null
> +++ b/toolchain/dependencies/check-host-tar.mk
> @@ -0,0 +1,24 @@
> +TAR ?= tar
> +SYSTEM_TAR := $(TAR)
 Add a comment why this has to be :=, e.g.

# TAR will be overridden again when tar itself is extracted, so we must
# finalize the value of SYSTEM_TAR.

> +
> +ifneq (,$(call suitable-host-package,tar))
> +  HOST_TAR := $(TAR)
 I would write
  HOST_TAR = $(SYSTEM_TAR)
(no := is needed in that case).

> +
> +  # Automatically detect tar --strip-path/components option
> +  # --strip-path was renamed to --strip-components in tar 1.15
> +  TAR_STRIP_COMPONENTS := \
> +    $(shell $(TAR) --help | grep strip-path > /dev/null ; \
> +    if test $$? = 0 ; then \
> +     echo '--strip-path' ; \
> +    else \
> +     echo '--strip-components' ; \
> +    fi)
> +
> +else
> +  DEPENDENCIES_HOST_PREREQ += host-tar
> +  HOST_TAR := $(HOST_DIR)/usr/bin/tar
> +  TAR_STRIP_COMPONENTS := --strip-components

 = is fine for these two assignments.

> +
> +endif
> +
> +TAR := $(HOST_TAR)

 Also here = should be OK.

> diff --git a/toolchain/dependencies/check-host-tar.sh b/toolchain/dependencies/check-host-tar.sh
> new file mode 100755
> --- /dev/null
> +++ b/toolchain/dependencies/check-host-tar.sh
> @@ -0,0 +1,29 @@
> +#!/bin/sh
> +
> +tar=`which tar`
> +if [ -z "$tar" ]; then
> +	return
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
> +		false
> +		# echo nothing: no suitable tar found
> +	fi
> +fi
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
