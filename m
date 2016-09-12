From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 22:25:34 +0200
Subject: [Buildroot] [PATCH 2/2] xvisor: new package
In-Reply-To: <1473705627-32589-3-git-send-email-eric.le.bihan.dev@free.fr>
References: <1473705627-32589-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1473705627-32589-3-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <20160912222534.524d4f84@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Sep 2016 20:40:27 +0200, Eric Le Bihan wrote:
> This new package provides Xvisor, an open-source type-1 hypervisor,
> which aims at providing a monolithic, light-weight, portable, and
> flexible virtualization solution.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Overall this looks good. A few minor comments below.


> diff --git a/package/xvisor/0002-openconf-do-not-check-stdin.patch b/package/xvisor/0002-openconf-do-not-check-stdin.patch
> new file mode 100644
> index 0000000..34b350d
> --- /dev/null
> +++ b/package/xvisor/0002-openconf-do-not-check-stdin.patch
> @@ -0,0 +1,58 @@
> +From 6b49c1dbe0ac43e39eec97a7e79cf5fb995747dc Mon Sep 17 00:00:00 2001
> +From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Date: Mon, 12 Sep 2016 21:49:55 +0530
> +Subject: [PATCH] openconf: do not check stdin
> +
> +Do not check if stdin is redirected when ask_silent is true, so the
> +`yes` program can be used to answer the questions about new values.
> +
> +Example:
> +
> +  yes "" | make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- oldconfig
> +
> +Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> +Signed-off-by: Anup Patel <anup@brainfault.org>

There's no "olddefconfig" target like in modern kconfig ?

> +config BR2_PACKAGE_XVISOR_CREATE_UBOOT_IMAGE
> +	bool "Create U-Boot image of Xvisor"
> +	default n

This line is useless, options default to n by default.

> +	depends on BR2_arm
> +	select BR2_PACKAGE_HOST_UBOOT_TOOLS
> +	help
> +	  Create an image file of Xvisor loadable from Das U-Boot.
> +
> +config BR2_PACKAGE_XVISOR_BUILD_TEST_DTB
> +	bool "Build test device-tree blobs"
> +	default n

Ditto.

> +XVISOR_KCONFIG_DOTCONFIG = $(XVISOR_DIR)/build/openconf/.config

Change this to:

XVISOR_KCONFIG_DOTCONFIG = build/openconf/.config

following the change I suggested for PATCH 1/2.

Otherwise, looks good. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
