From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jan 2017 11:40:06 +1300
Subject: [Buildroot] [PATCH v6] dieharder: new package
In-Reply-To: <1485087282-26931-1-git-send-email-julien@vdg.name>
References: <1485087282-26931-1-git-send-email-julien@vdg.name>
Message-ID: <20170124114006.67ab47db@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot for all your iterations. It looks mostly good, but I have
a few questions, see below.

On Sun, 22 Jan 2017 13:14:42 +0100, Julien Viard de Galbert wrote:

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 91e82ac..75c8e71 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -868,6 +868,9 @@ F:	package/qt5/
>  N:	Julien Floret <julien.floret@6wind.com>
>  F:	package/lldpd/
>  
> +N:	Julien Viard de Galbert <julien@vdg.name>
> +F:	package/dieharder/
> +

This should be in a separate patch, so that backporting the new package
to an older version of Buildroot doesn't cause a conflict in the
DEVELOPERS file.

> diff --git a/package/dieharder/0002-Do-not-install-includes.patch b/package/dieharder/0002-Do-not-install-includes.patch
> new file mode 100644
> index 0000000..6ece2a9
> --- /dev/null
> +++ b/package/dieharder/0002-Do-not-install-includes.patch
> @@ -0,0 +1,28 @@
> +From 9ee8200a6dec6aca7f4f37c46ca95ac1cb38306c Mon Sep 17 00:00:00 2001
> +From: Julien Viard de Galbert <julien@vdg.name>
> +Date: Sat, 14 Jan 2017 14:08:07 +0100
> +Subject: [PATCH] Do not install includes
> +
> +We don't want include files on the target
> +
> +Signed-off-by: Julien Viard de Galbert <julien@vdg.name>

Why is this patch needed?

Header files are automatically removed from the target filesystem by
the target-finalize logic in the main Buildroot Makefile. So there is
no need to add special code in packages to remove header files.

Regarding the other patches, could you submit them to the upstream
project? They all make sense for upstream I believe.

> +DIEHARDER_VERSION = 3.31.1
> +DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder
> +DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
> +DIEHARDER_STRIP_COMPONENTS = 2
> +DIEHARDER_LICENSE = GPLv2 with beverage clause

Interesting license :)

> +DIEHARDER_LICENSE_FILES = COPYING
> +DIEHARDER_DEPENDENCIES = gsl host-libtool
> +
> +# Fix m4 links to points to the ones in staging (provided by libtool hence
> +# the patch dependency).
> +define DIEHARDER_POST_PATCH_FIXUP
> +	for m in $(@D)/m4/*; do \
> +		l=$$(readlink $$m) ;\
> +		rm $$m ;\
> +		ln -s $(HOST_DIR)$$l $$m ;\
> +	done
> +endef
> +DIEHARDER_POST_PATCH_HOOKS += DIEHARDER_POST_PATCH_FIXUP

This looks weird. I haven't looked at the package in details though.
Could you explain a bit more what's going on.

> +
> +# Ensure the libtool version is updated,

Why?

> +# also make _CONF_ENV works instead of _CONF_OPTS for endiannes

I don't see what this means. _CONF_ENV works regardless of whether
AUTORECONF is YES or NO.

> +DIEHARDER_AUTORECONF = YES
> +
> +# fix endiannes detection

endianness with two 's' at the end, see
https://en.wikipedia.org/wiki/Endianness.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
