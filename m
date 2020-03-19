From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 19 Mar 2020 18:49:42 +0100
Subject: [Buildroot] [PATCH v2 2/2] fs/erofs: add support for creating
 EROFS rootfs image
In-Reply-To: <20200316015838.15183-2-hsiangkao@aol.com>
References: <20200316015838.15183-1-hsiangkao@aol.com>
 <20200316015838.15183-2-hsiangkao@aol.com>
Message-ID: <20200319174942.GF10025@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gao, All,

On 2020-03-16 09:58 +0800, Gao Xiang spake thusly:
> This patch makes possible to create rootfs image using
> EROFS filesystem.
> 
> Signed-off-by: Gao Xiang <hsiangkao@aol.com>
> ---
[--SNIP--]
> diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
> new file mode 100644
> index 0000000000..dad2498a15
> --- /dev/null
> +++ b/fs/erofs/Config.in
> @@ -0,0 +1,24 @@
> +config BR2_TARGET_ROOTFS_EROFS
> +	bool "erofs root filesystem"
> +	select BR2_PACKAGE_HOST_EROFS_UTILS
> +	help
> +	  Build a EROFS root filesystem. If you enable this option,
> +	  you probably want to enable the erofs-utils package too.

Since erofs is a read-only filesystem, and since erofs-utils only
provide an mkfs tool, I don't see how erofs-utils would be useful on the
target. So I've dropped that part from the help text.

> +if BR2_TARGET_ROOTFS_EROFS
> +
> +choice
> +	prompt "Compression algorithm"
> +	default BR2_TARGET_ROOTFS_EROFS_LZ4HC
> +	help
> +	  Select the primary compression algorithm to use when
> +	  generating EROFS filesystem image.
> +
> +config BR2_TARGET_ROOTFS_EROFS_NONE
> +	bool "none"
> +
> +config BR2_TARGET_ROOTFS_EROFS_LZ4HC
> +	bool "lz4hc"

Do you envision adding other compression schemes? As far as I can see,
the erofs-utils as well as the linux driver only ever supports lz4 (and
I think you are well aware of that ;-) ).

I know the other filesystems (squashfs, jffs2...) have a choice about
the compression method, but for those ther are two or more such
possibilities, so it makes sense they have a choice. For erofs, not so
much.

As such, I have dropped the choice altogether, and just kept the single
boolean to enable compression.

Applied to master with the above changes. Thanks!

Regards,
Yann E. MORIN.

> +endchoice
> +endif # BR2_TARGET_ROOTFS_EROFS
> diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
> new file mode 100644
> index 0000000000..58559d4833
> --- /dev/null
> +++ b/fs/erofs/erofs.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# Build the EROFS root filesystem image
> +#
> +################################################################################
> +
> +ROOTFS_EROFS_DEPENDENCIES = host-erofs-utils
> +
> +ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
> +ROOTFS_EROFS_ARGS += -zlz4hc
> +endif
> +
> +define ROOTFS_EROFS_CMD
> +	$(HOST_DIR)/bin/mkfs.erofs $(ROOTFS_EROFS_ARGS) $@ $(TARGET_DIR)
> +endef
> +
> +$(eval $(rootfs))
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
