From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jan 2021 23:00:44 +0100
Subject: [Buildroot] [PATCH v2] fs/cpio: add zstd as compression option
In-Reply-To: <20210110190559.1434055-1-salvador.joseluis@gmail.com>
References: <20210110111217.GP3044608@scaer>
 <20210110190559.1434055-1-salvador.joseluis@gmail.com>
Message-ID: <20210116230044.219ee827@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Jan 2021 20:05:59 +0100
Jos? Luis Salvador Rufo <salvador.joseluis@gmail.com> wrote:

> U-Boot mkimage zstd is available since v2020.10:
> https://gitlab.denx.de/u-boot/u-boot/-/commit/26073f9ed3ab0aaf3c2a2b433fecb30a95a067d6
> 
> Signed-off-by: Jos? Luis Salvador Rufo <salvador.joseluis@gmail.com>

Thanks, I have applied, with one change, see below.

> ---
>  fs/common.mk      | 5 +++++
>  fs/cpio/Config.in | 5 +++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 84e13d1b7e..da008ef9e8 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -154,6 +154,11 @@ ifeq ($(BR2_REPRODUCIBLE),)
>  ROOTFS_$(2)_COMPRESS_CMD += -T $(PARALLEL_JOBS)
>  endif
>  endif
> +ifeq ($(BR2_TARGET_ROOTFS_$(2)_ZSTD),y)
> +ROOTFS_$(2)_DEPENDENCIES += host-zstd
> +ROOTFS_$(2)_COMPRESS_EXT = .zst
> +ROOTFS_$(2)_COMPRESS_CMD = zstd --ultra -22 -z -f -T$(PARALLEL_JOBS)

To me, it felt a bit extreme to use the --ultra -22 level, which is
documented as requiring a lot of memory, both for compression and
uncompression. So I changed to just -19 instead.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
