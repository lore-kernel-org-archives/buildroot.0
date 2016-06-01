From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Jun 2016 17:08:36 +0200
Subject: [Buildroot] [PATCH next 4/4] uboot-tools: fix FIT support and
 make it optional
In-Reply-To: <1464791982-10166-5-git-send-email-casantos@datacom.ind.br>
References: <1462736800-9552-1-git-send-email-casantos@datacom.ind.br>
 <1464791982-10166-1-git-send-email-casantos@datacom.ind.br>
 <1464791982-10166-5-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160601170836.3733dbcb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  1 Jun 2016 11:39:42 -0300, Carlos Santos wrote:

> diff --git a/Config.in.legacy b/Config.in.legacy
> index a0a2059..3f565e8 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,22 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2016.08"
>  
> +config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT
> +	bool "FIT support in uboot-tools has been refactored"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_DTC
> +	select BR2_PACKAGE_DTC_PROGRAMS
> +	select BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT
> +	select BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT
> +	select BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
> +	select BR2_PACKAGE_HOST_DTC
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT

I did not review the entire patch, but those last two lines look
incorrect. The purpose of the
BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE_FIT_SIGNATURE_SUPPORT option was to
enable support for FIT signature in the *target* variant of
uboot-tools. Hence, I don't see why you are selecting host-dtc and FIT
support in the host variant of uboot-tools.

> diff --git a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
> new file mode 100644
> index 0000000..5404e4f
> --- /dev/null
> +++ b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
> @@ -0,0 +1,93 @@
> +From ddcd6cd622889a2d74d0a16efae8e3b2d098f717 Mon Sep 17 00:00:00 2001
> +From: Carlos Santos <casantos@datacom.ind.br>
> +Date: Sun, 8 May 2016 11:11:39 -0300
> +Subject: [PATCH] Make FIT support really optional
> +
> +Due to some mistakes in the source code, it was not possible to really
> +turn FIT support off. This commit fixes the problem by means of the
> +following changes:
> +
> +- Enclose "bootm_host_load_image" and "bootm_host_load_images" between
> +  checks for CONFIG_FIT_SIGNATURE, in common/bootm.c.
> +
> +- Enclose the declaration of "bootm_host_load_images" between checks for
> +  CONFIG_FIT_SIGNATURE, in common/bootm.h.
> +
> +- Condition the compilation and linking of fit_common.o fit_image.o
> +  image-host.o common/image-fit.o to CONFIG_FIT=y, in tools/Makefile.
> +
> +Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

It would be good to mention the upstream status of this patch. At least
so that I remember instead of asking you again and again if it has been
sent upstream :-)

I'll do a full review later on. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
