From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 23:22:40 +0200
Subject: [Buildroot] [PATCH v2 06/13] package/skeleton-init-openrc: add
 support to remount rootfs as rw
In-Reply-To: <20190512195550.24457-6-michal.lyszczek@bofc.pl>
References: <20190512195550.24457-1-michal.lyszczek@bofc.pl>
 <20190512195550.24457-6-michal.lyszczek@bofc.pl>
Message-ID: <20190518232240.4f92819f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 12 May 2019 21:55:43 +0200
Micha? ?yszczek <michal.lyszczek@bofc.pl> wrote:

> diff --git a/package/skeleton-init-openrc/skeleton-init-sysv.mk b/package/skeleton-init-openrc/skeleton-init-sysv.mk
> index 5ee2192093..bbe80071ae 100644
> --- a/package/skeleton-init-openrc/skeleton-init-sysv.mk
> +++ b/package/skeleton-init-openrc/skeleton-init-sysv.mk
> @@ -15,8 +15,23 @@ SKELETON_INIT_OPENRC_DEPENDENCIES = skeleton-init-common
>  
>  SKELETON_INIT_OPENRC_PROVIDES = skeleton
>  
> +ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
> +# Comment /dev/root entry in fstab. When openrc does not find fstab entry for
> +# "/", it will try to remount "/" as "rw".
> +define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
> +	$(SED) '/^ *\/dev\/root.*$$/s~^~#~' $(TARGET_DIR)/etc/fstab
> +endef
> +else
> +# Uncomment /dev/root entry in fstab which has "ro" option so openrc notices
> +# it and doesn't remount root to rw.
> +define SKELETON_INIT_OPENRC_ROOT_RO_OR_RW
> +	$(SED) '/^# *\/dev\/root.*$$/s~^#\+~~' $(TARGET_DIR)/etc/fstab
> +endef
> +endif # BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW

Why are you handling the ro/rw rootfs topic from skeleton-init-sysv.mk,
but the getty topic is handled from openrc.mk (in PATCH 04/13). It
doesn't seem very consistent.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
