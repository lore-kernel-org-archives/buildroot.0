From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 29 Jul 2013 14:47:34 +0200
Subject: [Buildroot] [PATCH] mtd: add option to build mkfs.ubifs for
	target
In-Reply-To: <20130729021746.EF4355C127@zaphod.pbhware.com>
References: <20130729021746.EF4355C127@zaphod.pbhware.com>
Message-ID: <CAAXf6LU_GeZ+MNTiJMKuKVTmLROhj-BtUuinirFF6jS2kTVXVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Paul,

Thanks for contributing! See below for a small comment.

On Mon, Jul 29, 2013 at 4:11 AM, Paul B. Henson <henson@acm.org> wrote:
> Signed-off-by: Paul B. Henson <henson@acm.org>
> ---
>  package/mtd/Config.in |    6 ++++++
>  package/mtd/mtd.mk    |    7 +++++++
>  2 files changed, 13 insertions(+), 0 deletions(-)
>
> diff --git a/package/mtd/Config.in b/package/mtd/Config.in
> index ddc3737..2e13157 100644
> --- a/package/mtd/Config.in
> +++ b/package/mtd/Config.in
> @@ -54,6 +54,12 @@ config BR2_PACKAGE_MTD_MKFSJFFS2
>         select BR2_PACKAGE_ZLIB
>         select BR2_PACKAGE_LZO
>
> +config BR2_PACKAGE_MTD_MKFSUBIFS
> +       bool "mkfs.ubifs"
> +       select BR2_PACKAGE_ZLIB
> +       select BR2_PACKAGE_LZO
> +       select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> +
>  config BR2_PACKAGE_MTD_MTD_DEBUG
>         bool "mtd_debug"
>         default y
> diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
> index 994a73a..55fa727 100644
> --- a/package/mtd/mtd.mk
> +++ b/package/mtd/mtd.mk
> @@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_MTD_MKFSJFFS2),y)
>  MTD_DEPENDENCIES = zlib lzo
>  endif
>
> +ifeq ($(BR2_PACKAGE_MTD_MKFSUBIFS),y)
> +MTD_DEPENDENCIES += util-linux zlib lzo
> +endif
> +
>  ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  MTD_DEPENDENCIES += busybox
>  endif
> @@ -71,7 +75,10 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRMVOL)  += ubirmvol
>  MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIRSVOL)    += ubirsvol
>  MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)        += ubiupdatevol
>
> +MTD_TARGETS_UBIFS_$(BR2_PACKAGE_MTD_MKFSUBIFS) += mkfs.ubifs
> +
>  MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
> +MTD_TARGETS_y += $(addprefix mkfs.ubifs/,$(MTD_TARGETS_UBIFS_y))

I find it a bit overkill to use $(addprefix) for just one binary. My
suggestion would be to simply:
MTD_TARGETS_$(BR2_PACKAGE_MTD_MKFSUBIFS)          += mkfs.ubifs/mkfs.ubifs

Otherwise, the patch looks good.

Best regards,
Thomas
