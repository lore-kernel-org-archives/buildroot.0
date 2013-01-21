From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Tue, 22 Jan 2013 01:38:25 +0200
Subject: [Buildroot] [PATCH 3/3] initramfs: add support for LZO and XZ
 compression methods
In-Reply-To: <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
References: <1358808943-17063-1-git-send-email-gustavo@zacarias.com.ar>
 <1358808943-17063-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <50FDD171.60804@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo

22.1.2013 0:55, Gustavo Zacarias kirjoitti:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  fs/common.mk      |  8 +++++++-
>  fs/cpio/Config.in | 18 ++++++++++++++----
>  2 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/fs/common.mk b/fs/common.mk
> index 8b5b2f2..0c171fc 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -39,7 +39,7 @@ ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
>  define ROOTFS_TARGET_INTERNAL
>  
>  # extra deps
> -ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma)
> +ROOTFS_$(2)_DEPENDENCIES += host-fakeroot host-makedevs $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZMA),host-lzma) $$(if $$(BR2_TARGET_ROOTFS_$(2)_LZO),host-lzop) $$(if $$(BR2_TARGET_ROOTFS_$(2)_XZ),host-xz)
>  
>  $$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
>  	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
> @@ -70,6 +70,12 @@ endif
>  ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZMA),y)
>  	$$(LZMA) -9 -c $$@ > $$@.lzma
>  endif
> +ifeq ($$(BR2_TARGET_ROOTFS_$(2)_LZO),y)
> +	$$(LZOP) -9 -c $$@ > $$@.lzo
> +endif
> +ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
> +	$$(XZ) -9 -c $$@ > $$@.xz
> +endif

You will probably need --check=crc32 with that xz-compression.
I have had difficulties booting linux 3.3.1 kernel (don't know about
later versions)
with xz-compressed initramfs without that option.

Regards
Stefan
