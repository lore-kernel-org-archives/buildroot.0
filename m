From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 22 Mar 2018 22:34:10 +0100
Subject: [Buildroot] [PATCH 2/2] fs/squashfs: enable squashfs to
 generate a verity hashtable
In-Reply-To: <1521752805-17690-2-git-send-email-ben.whitten@gmail.com>
References: <1521752805-17690-1-git-send-email-ben.whitten@gmail.com>
 <1521752805-17690-2-git-send-email-ben.whitten@gmail.com>
Message-ID: <20180322213410.GD4580@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ben, All,

On 2018-03-22 21:06 +0000, Ben Whitten spake thusly:
> For those times that you want to verify that your readonly filesystem
> hasn't been tampered we can generate a dm-verity hash table.
> The root hash is enclosed in .table file and must be secured else where.

I don't think this should belong to the squashfs filesystem.

From what I understand, veritysetup is filesystem-agnostic, and can do
the hash checksums on any image (even a r/w filesystem as long as it is
mounted r/o for example).

My position is that this should be done in a post-image script.

Otherwise, we'd have to add support for other types of similar concepts:
someone will want to crypto-sign the images, then someone will want to
encrypt the image, then... then...

The post-image scripts are there to fill this fuctionality: do local
fixups and tweaks after the images have been generated.

Of course, this is only my position. Others may disagree... But IIRC we
already had a similar discussion in the past, and the conclusion was to
move such tings in a post-image script, so...

Regards,
Yann E. MORIN.

> Signed-off-by: Ben Whitten <ben.whitten@gmail.com>
> ---
>  fs/squashfs/Config.in   |  6 ++++++
>  fs/squashfs/squashfs.mk | 10 ++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> index ca9ddb2..d435249 100644
> --- a/fs/squashfs/Config.in
> +++ b/fs/squashfs/Config.in
> @@ -28,4 +28,10 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_XZ
>  	bool "xz"
>  
>  endchoice
> +
> +config BR2_TARGET_ROOTFS_SQUASHFS_VERITY
> +	bool "Generate verity hashtable"
> +	help
> +	  As squashfs is readonly it is possible to generate a dm-verity
> +	  hashtable for use in verified boot systems.
>  endif
> diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
> index 51abd5d..8fe09c8 100644
> --- a/fs/squashfs/squashfs.mk
> +++ b/fs/squashfs/squashfs.mk
> @@ -5,6 +5,9 @@
>  ################################################################################
>  
>  ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
> +ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_VERITY),y)
> +ROOTFS_SQUASHFS_DEPENDENCIES += host-cryptsetup
> +endif
>  
>  ROOTFS_SQUASHFS_ARGS = -noappend -processors $(PARALLEL_JOBS)
>  
> @@ -24,4 +27,11 @@ define ROOTFS_SQUASHFS_CMD
>  	$(HOST_DIR)/bin/mksquashfs $(TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)
>  endef
>  
> +ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS_VERITY),y)
> +define ROOTFS_SQUASHFS_VERITY
> +	$(HOST_DIR)/sbin/veritysetup format $@ $@.verity > $@.verity.table
> +endef
> +ROOTFS_SQUASHFS_POST_GEN_HOOKS += ROOTFS_SQUASHFS_VERITY
> +endif
> +
>  $(eval $(rootfs))
> -- 
> 2.7.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
