From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Jun 2020 09:57:25 +0200
Subject: [Buildroot] [PATCH] fs: squashfs: Add config option to pass
 mksquashfs cmdln paramters.
In-Reply-To: <20200612133249.4127906-1-heiko@sntech.de>
References: <20200612133249.4127906-1-heiko@sntech.de>
Message-ID: <20200614075725.GD2346@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-06-12 15:32 +0200, Heiko Stuebner spake thusly:
> From: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> 
> This can be use to specify additional command line argument to
> mksquashfs (e.g. -nopad). The implementation is inspired by
> a similar mechanism for ext file system images.

What kind of options do you expect to need to pass?

Usually, I'd prefer we have common options directly mapped to entries in
the menuconfig, and keep this kind of "pass-through" options for more
exotic options.

For example, if we are looking at the compression options, I'd like we
add a config option like

    config BR2_TARGET_ROOTFS_SQUASHFS_EXTRA_COMPRESS
        bool "high-compression"
        depends on !BR2_TARGET_ROOTFS_SQUASHFS4_LZMA # No option
        help
          Say 'y' to compress even further, at the expense of
          compression time.

          For example:
            - for gzip, this enables all the -Xstrategy
            - for lz4, this enables -Xhc
            - for lzo, this enables -Xcompression-level 9
            - for xz, this chooses appropriate -Xbcj filters
            - for zstd, this enables -Xcompression-level 22

And maybe a few other such options, eventually adding the
BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS for corner-cases only.

> Signed-off-by: Christoph Muellner <christoph.muellner@theobroma-systems.com>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
> ---
>  fs/squashfs/Config.in   | 11 +++++++++++
>  fs/squashfs/squashfs.mk |  8 +++++++-
>  2 files changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> index dde2097cb7..789b2cd24a 100644
> --- a/fs/squashfs/Config.in
> +++ b/fs/squashfs/Config.in
> @@ -5,6 +5,16 @@ config BR2_TARGET_ROOTFS_SQUASHFS
>  
>  if BR2_TARGET_ROOTFS_SQUASHFS
>  
> +config BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS
> +	string "additional mksquashfs options"
> +	default ""
> +	help
> +	  Specify a space-separated list of mksquashfs options, including
> +	  any squashfs filesystem features.
> +
> +	  For more information about the mke2fs options, see the manual

s/mke2fs/mksquashfs/

> +	  page mksquashfs(1).
> +
>  choice
>  	prompt "Compression algorithm"
>  	default BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
> @@ -31,4 +41,5 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_ZSTD
>  	bool "zstd"
>  
>  endchoice
> +
>  endif
> diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
> index 34ab048603..4bc6b338b0 100644
> --- a/fs/squashfs/squashfs.mk
> +++ b/fs/squashfs/squashfs.mk
> @@ -6,7 +6,13 @@
>  
>  ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
>  
> -ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
> +SQUASHFS_MKFS_OPTS = $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS))

Keep the vairalbes prefixed with ROOTFS_ here, to avoid clashing with
the package namespace: SQUASHFS_MKFS_OPTS by name would be a variable of
the "squashfs" package.

> +ROOTFS_SQUASHFS_ARGS = \
> +	-noappend \
> +	-processors \
> +	$(PARALLEL_JOBS) \

$(PARALLEL_JOBS) is a parameter to the --processor option, so it should
be on the same line.

However, I don;t think you need to introduce an intermediate variable:

    ROOTFS_SQUASHFS_ARGS = \
        -noappend \
        -processors $(PARALLEL_JOBS) \
        $(call qstrip,$(BR2_TARGET_ROOTFS_SQUASHFS_MKFS_OPTIONS))

Regards,
Yann E. MORIN.

> +	$(SQUASHFS_MKFS_OPTS)
>  
>  ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
>  ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
> -- 
> 2.26.2
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
