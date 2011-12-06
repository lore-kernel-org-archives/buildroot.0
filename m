From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 6 Dec 2011 18:23:36 +0100
Subject: [Buildroot] [PATCH 2 of 3 v2] dependencies: build a host-tar if
	no suitable tar can be found
In-Reply-To: <d4b15640ce2d3ab89835.1322053785@devws108>
References: <patchbomb.1322053783@devws108>
 <d4b15640ce2d3ab89835.1322053785@devws108>
Message-ID: <201112061823.36798.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 23 November 2011 14:59:59 Thomas De Schampheleire wrote:
> diff --git a/toolchain/dependencies/check-host-tar.mk b/toolchain/dependencies/check-host-tar.mk
> new file mode 100644
> --- /dev/null
> +++ b/toolchain/dependencies/check-host-tar.mk
> @@ -0,0 +1,32 @@
> +TAR ?= tar
> +
> +# To extract tar, we always need a real (system) tar. Provide the necessary
> +# definitions here to avoid cluttering package/tar/tar.mk .
> +# TAR will be overridden again when the tar .mk file is included, so we must
> +# finalize the value of SYSTEM_TAR by using :=
> +SYSTEM_TAR := $(TAR)
> +# Automatically detect tar --strip-path/components option
> +# --strip-path was renamed to --strip-components in tar 1.15
> +SYSTEM_TAR_STRIP_COMPONENTS := \
> +    $(shell $(SYSTEM_TAR) --help | grep strip-path > /dev/null ; \
> +    if test $$? = 0 ; then \
> +     echo '--strip-path' ; \
> +    else \
> +     echo '--strip-components' ; \
> +    fi)

 This can move inside the ifneq below, with a 
SYSTEM_TAR_STRIP_COMPONENTS := $(HOST_TAR_STRIP_COMPONENTS)
in the else (and moving that one up of course).

> +
> +# Determine correct HOST_TAR
> +ifneq (,$(call suitable-host-package,tar))
> +  HOST_TAR = $(SYSTEM_TAR)
> +else
> +  DEPENDENCIES_HOST_PREREQ += host-tar
> +  HOST_TAR = $(HOST_DIR)/usr/bin/tar
> +endif
> +
> +# Since HOST_TAR is at least 1.17, it will certainly support --strip-components
> +HOST_TAR_STRIP_COMPONENTS = --strip-components
> +
> +# Set definitions used by all .mk files included after this one and before
> +# package/tar/tar.mk
> +TAR = $(HOST_TAR)
> +TAR_STRIP_COMPONENTS = $(HOST_TAR_STRIP_COMPONENTS)
> diff --git a/toolchain/dependencies/check-host-tar.sh b/toolchain/dependencies/check-host-tar.sh
> new file mode 100755
> --- /dev/null
> +++ b/toolchain/dependencies/check-host-tar.sh
> @@ -0,0 +1,29 @@
> +#!/bin/sh
> +
> +tar=`which tar`

 This contradicts the TAR ?= tar in check-host-tar.mk: if the user provided
their own tar version, it isn't checked and host-tar will still be built...
I guess $TAR should be given as an argument to this script.

> +if [ -z "$tar" ]; then
> +	return
> +fi

 This could be a [ ! -x "$tar" ]
and it should be exit 1, not return.

 Regards,
 Arnout


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
> 

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111206/4fce0ba6/attachment.html>
