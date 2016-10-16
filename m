From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 18:14:05 +0200
Subject: [Buildroot] [PATCH 3/3] inadyn: bump to version 2.0
In-Reply-To: <20161013034247.21603-3-bluemrp9@gmail.com>
References: <20161013034247.21603-1-bluemrp9@gmail.com>
 <20161013034247.21603-3-bluemrp9@gmail.com>
Message-ID: <20161016181405.1da39967@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Oct 2016 20:42:47 -0700, Ryan Coe wrote:
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

This is almost ready to go, but since I had some comments on PATCH 2/3,
I'll give you the few minor comments I had on this patch as well.

> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7a23c78..bd85c3b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1260,6 +1260,7 @@ F:	package/python-pysnmp-mibs/
>  F:	package/python-tornado/
>  
>  N:	Ryan Coe <bluemrp9@gmail.com>
> +F:	package/inadyn/
>  F:	package/libite/

The change to the DEVELOPERS file should be part of a separate patch.

> diff --git a/package/inadyn/Config.in b/package/inadyn/Config.in
> index 65f6851..55894ae 100644
> --- a/package/inadyn/Config.in
> +++ b/package/inadyn/Config.in
> @@ -1,4 +1,6 @@
>  config BR2_PACKAGE_INADYN
> +	select BR2_PACKAGE_LIBCONFUSE
> +	select BR2_PACKAGE_LIBITE

Please put the select below the "depends on". As explained in the
Buildroot documentation, we try to be consistent across all packages,
by using the following order:

	bool
	depends on ...
	depends on ...
	select ...
	select ...

> -INADYN_VERSION = 1.99.12
> -INADYN_SITE = https://github.com/troglobit/inadyn/releases/download/$(INADYN_VERSION)
> -INADYN_SOURCE = inadyn-$(INADYN_VERSION).tar.xz
> +INADYN_VERSION = v2.0
> +INADYN_SITE = $(call github,troglobit,inadyn,$(INADYN_VERSION))
>  INADYN_LICENSE = GPLv2+
>  INADYN_LICENSE_FILES = COPYING
> +INADYN_AUTORECONF = YES
> +
> +# Needed for autoreconf to work properly, see ./autogen.sh
> +define INADYN_FIXUP_M4_DIR
> +	mkdir $(@D)/m4
> +endef
> +INADYN_POST_EXTRACT_HOOKS += INADYN_FIXUP_M4_DIR
> +
> +INADYN_DEPENDENCIES += host-pkgconf libconfuse libite

Minor detail, but could you move this DEPENDENCIES line earlier, i.e
right after the AUTORECONF = YES line, and use the = sign rather than
+= ?

I've marked your patches 2/3 and 3/3 as "Changes Requested" in our
patch tracking system. So could you send an updated version that takes
into account the review comments? Otherwise, we will forget about those
patches as they are no longer in our TODO-list of patches to be applied.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
