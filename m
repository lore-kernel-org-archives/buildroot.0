From: Julien Boibessot <julien.boibessot@free.fr>
Date: Tue, 21 Dec 2010 10:09:31 +0100
Subject: [Buildroot] [PATCH] Add UBI image generation support.
In-Reply-To: <1292922317-29202-1-git-send-email-julien.boibessot@free.fr>
References: <1292922317-29202-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <4D106ECB.5060605@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sorry but the patch comment doesn't want to go inside the mail (my fault)...
Here it is:

UBI images are generated from UBIFS one (with ubinize tool) and are used
by bootloaders (eg U-Boot) to write UBIFS images directly on bare NAND
FLASH (see http://www.linux-mtd.infradead.org/faq/ubi.html)

julien.boibessot at free.fr a ?crit :
> From: Julien Boibessot <julien.boibessot@armadeus.com>
>
>
> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> Signed-off-by: Nicolas Colombain <nicolas.colombain@armadeus.com>
> ---
>  fs/ubi/Config.in   |   22 ++++++++++++++++++++++
>  fs/ubi/ubi.mk      |   24 ++++++++++++++++++++++++
>  fs/ubi/ubinize.cfg |    7 +++++++
>  fs/ubifs/Config.in |    2 ++
>  4 files changed, 55 insertions(+), 0 deletions(-)
>  create mode 100644 fs/ubi/Config.in
>  create mode 100644 fs/ubi/ubi.mk
>  create mode 100644 fs/ubi/ubinize.cfg
>
> diff --git a/fs/ubi/Config.in b/fs/ubi/Config.in
> new file mode 100644
> index 0000000..b4433f7
> --- /dev/null
> +++ b/fs/ubi/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_TARGET_ROOTFS_UBI
> +	depends on BR2_TARGET_ROOTFS_UBIFS
> +	bool "generate ubi image"
> +	help
> +	  Build a UBI image of the UBIFS root filesystem.
> +
> +config BR2_TARGET_ROOTFS_UBI_PEBSIZE
> +	hex "UBI physical erase block size"
> +	depends on BR2_TARGET_ROOTFS_UBI
> +	default 0x20000
> +	help
> +	  Tells ubinize that physical eraseblock size of the flash chip the UBI
> +	  image is created for is 0x20000 (by default).
> +
> +config BR2_TARGET_ROOTFS_UBI_SUBSIZE
> +	int "UBI sub-page size"
> +	depends on BR2_TARGET_ROOTFS_UBI
> +	default 512
> +	help
> +	  Tells ubinize that the flash supports sub-pages and sub-page size is
> +	  512 bytes (by default).
> +
> diff --git a/fs/ubi/ubi.mk b/fs/ubi/ubi.mk
> new file mode 100644
> index 0000000..71e41c3
> --- /dev/null
> +++ b/fs/ubi/ubi.mk
> @@ -0,0 +1,24 @@
> +#############################################################
> +#
> +# Build the UBI root filesystem image
> +#
> +#############################################################
> +
> +UBI_UBINIZE_OPTS := -m $(BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE)
> +UBI_UBINIZE_OPTS += -p $(BR2_TARGET_ROOTFS_UBI_PEBSIZE)
> +ifneq ($(BR2_TARGET_ROOTFS_UBI_SUBSIZE),0)
> +UBI_UBINIZE_OPTS += -s $(BR2_TARGET_ROOTFS_UBI_SUBSIZE)
> +endif
> +
> +
> +ROOTFS_UBI_DEPENDENCIES = rootfs-ubifs
> +
> +define ROOTFS_UBI_CMD
> +	cp fs/ubi/ubinize.cfg . ;\
> +	echo "image=$$@fs" \
> +		>> ./ubinize.cfg ;\
> +	$(HOST_DIR)/usr/sbin/ubinize -o $$@ $(UBI_UBINIZE_OPTS) ubinize.cfg ;\
> +	rm ubinize.cfg
> +endef
> +
> +$(eval $(call ROOTFS_TARGET,ubi))
> diff --git a/fs/ubi/ubinize.cfg b/fs/ubi/ubinize.cfg
> new file mode 100644
> index 0000000..6515271
> --- /dev/null
> +++ b/fs/ubi/ubinize.cfg
> @@ -0,0 +1,7 @@
> +[ubifs]
> +mode=ubi
> +vol_id=0
> +vol_type=dynamic
> +vol_name=rootfs
> +vol_alignment=1
> +vol_flags=autoresize
> diff --git a/fs/ubifs/Config.in b/fs/ubifs/Config.in
> index bcf409c..e150f9b 100644
> --- a/fs/ubifs/Config.in
> +++ b/fs/ubifs/Config.in
> @@ -77,3 +77,5 @@ config BR2_TARGET_ROOTFS_UBIFS_LZMA
>  
>  endchoice
>  
> +source "fs/ubi/Config.in"
> +
>   
