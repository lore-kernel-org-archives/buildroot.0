From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 19 Jul 2021 22:35:17 +0200
Subject: [Buildroot] [PATCH] fs/erofs: add big pcluster support
In-Reply-To: <20210714145528.25255-1-hsiangkao@aol.com>
References: <20210714145528.25255-1-hsiangkao.ref@aol.com>
 <20210714145528.25255-1-hsiangkao@aol.com>
Message-ID: <20210719203517.GB1464219@scaer>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Gao, All,

On 2021-07-14 22:55 +0800, Gao Xiang via buildroot spake thusly:
> This enables EROFS big pcluster images for buildroot.
> 
> Signed-off-by: Gao Xiang <hsiangkao@aol.com>
> ---
>  fs/erofs/Config.in | 10 ++++++++++
>  fs/erofs/erofs.mk  |  4 ++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
> index d7360edeabfd..7619037c4775 100644
> --- a/fs/erofs/Config.in
> +++ b/fs/erofs/Config.in
> @@ -11,4 +11,14 @@ config BR2_TARGET_ROOTFS_EROFS_LZ4HC
>  	help
>  	  Use lz4 high-compression to compress data in the filesystem.
>  
> +config BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE
> +	int "pcluster size"
> +	default 0
> +	help
> +	  Specify the maximum size of physical cluster in bytes for
> +	  the big pcluster feature in order to get much better
> +	  compression ratios (thus better sequential read performance
> +	  for common storage devices), which has been introduced since
> +	  Linux 5.13.

I was wondering if we had to constrain that variable somehow, so I
looked at the code.

As far as I understand, this must be a multiple of EROFS_BLKSIZ:

  297         case 'C':
  298             i = strtoull(optarg, &endptr, 0);
  299             if (*endptr != '\0' ||
  300                 i < EROFS_BLKSIZ || i % EROFS_BLKSIZ) {
  301                 erofs_err("invalid physical clustersize %s",

EROFS_BLKSIZ is defined as (1U << LOG_BLOCK_SIZE)

LOG_BLOCK_SIZE is defined as (12).

So BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE must be a multiple of 4KiB.

Which happens to look awfully like PAGE_SIZE on most architectures.

And bingo, there is this:

   34 /* no obvious reason to support explicit PAGE_SIZE != 4096 for now */
   35 #if PAGE_SIZE != 4096
   36 #error incompatible PAGE_SIZE is already defined
   37 #endif

OK, so guess what? Here are a few good reasons to support page size !=
4096 ;-)

In Buildroot@least, I knew of:

    BR2_ARC_PAGE_SIZE_8K
    BR2_ARC_PAGE_SIZE_16K

And if one goes to the kernel tree:

    config ARM64_PAGE_SHIFT
        int
        default 16 if ARM64_64K_PAGES
        default 14 if ARM64_16K_PAGES
        default 12

mips has even more page sizes available:

    arch/mips/include/asm/page.h:#define PAGE_SHIFT 12
    arch/mips/include/asm/page.h:#define PAGE_SHIFT 13
    arch/mips/include/asm/page.h:#define PAGE_SHIFT 14
    arch/mips/include/asm/page.h:#define PAGE_SHIFT 15
    arch/mips/include/asm/page.h:#define PAGE_SHIFT 16

And so on... ;-)

However, except for ARC, we do not have other page-size settings in
Buildroot (ARC is special); for all other achs, we do not have the info,
and if it exists, it is confined to the kernel configuration.

So, for Buildroot, we have one (really, two) cases where erofs would not
be usable: non-4K ARC settings.

And thus I was wondering is we should exclude erofs from the selection
in that case:

    config BR2_TARGET_ROOTFS_EROFS
        depends on !BR2_arc || BR2_ARC_PAGE_SIZE_4K

However, this is not related to this patch, as the situation is already
broken in such a case already...

So: applied to master, thanks.

Regards,
Yann E. MORIN.

>  endif # BR2_TARGET_ROOTFS_EROFS
> diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
> index 58559d483340..0e9d4401a939 100644
> --- a/fs/erofs/erofs.mk
> +++ b/fs/erofs/erofs.mk
> @@ -10,6 +10,10 @@ ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
>  ROOTFS_EROFS_ARGS += -zlz4hc
>  endif
>  
> +ifneq ($(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE),0)
> +ROOTFS_EROFS_ARGS += -C$(strip $(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE))
> +endif
> +
>  define ROOTFS_EROFS_CMD
>  	$(HOST_DIR)/bin/mkfs.erofs $(ROOTFS_EROFS_ARGS) $@ $(TARGET_DIR)
>  endef
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
