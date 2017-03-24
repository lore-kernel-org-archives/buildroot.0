From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 24 Mar 2017 22:35:31 +0100
Subject: [Buildroot] [PATCH 1/4] fs/ext2: Remove support for
 auto-calculation of rootfs size
In-Reply-To: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <556f2471-1875-0497-61b9-c47dad22dee7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-03-17 17:20, S?bastien Szymanski wrote:
> Auto-calculation of the rootfs size cannot be done in a reliable way as
> it depends on the host filesystem and is broken on non ext4 host. [1] [2]
> So let the user specify the size he wants for his rootfs.
> 
> [1] https://bugs.busybox.net/show_bug.cgi?id=8831
> [2] https://bugs.busybox.net/show_bug.cgi?id=9496
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

 Small comments below, but

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>  Config.in.legacy        | 14 ++++++++++++++
>  fs/ext2/Config.in       | 12 ++----------
>  fs/ext2/ext2.mk         |  1 -
>  package/mke2img/mke2img | 20 +-------------------
>  4 files changed, 17 insertions(+), 30 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 4e14a98..dfd4d67 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -145,6 +145,20 @@ endif
>  ###############################################################################
>  comment "Legacy options removed in 2017.05"
>  
> +config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
> +	int "extra size in blocks has been removed"
> +	default 0
> +	help
> +	  Since the support for auto calculation of the filesystem size has been

 Line too long, wrap at 72 columns (where tab counts for 8).

> +	  removed, this option is now useless and must be 0.
> +	  You may want to check that BR2_TARGET_ROOTFS_EXT2_BLOCKS matchs
                                                                   matches

> +	  your needs.
> +
> +config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS_WRAP
> +	bool
> +	default y if BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS != 0
> +	select BR2_LEGACY

 Great solution!

> +
>  config BR2_PACKAGE_SYSTEMD_KDBUS
>  	bool "systemd-kdbus has been removed"
>  	select BR2_LEGACY
> diff --git a/fs/ext2/Config.in b/fs/ext2/Config.in
> index b8eeed2..2f22762 100644
> --- a/fs/ext2/Config.in
> +++ b/fs/ext2/Config.in
> @@ -45,21 +45,13 @@ config BR2_TARGET_ROOTFS_EXT2_LABEL
>  	string "filesystem label"
>  
>  config BR2_TARGET_ROOTFS_EXT2_BLOCKS
> -	int "exact size in blocks (leave at 0 for auto calculation)"
> -	default 0
> +	int "exact size in blocks"
> +	default 65536

 I think this default is quite useless: it is too large for a 64M card, and
wastes a lot of space on a 128M card. So setting it to 60M or 120M would be more
appropriate.

 Regards,
 Arnout

>  
>  config BR2_TARGET_ROOTFS_EXT2_INODES
>  	int "exact number of inodes (leave at 0 for auto calculation)"
>  	default 0
>  
> -config BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS
> -	int "extra size in blocks" if BR2_TARGET_ROOTFS_EXT2_BLOCKS = 0
> -	default 0
> -	help
> -	  Enter here the number of extra blocks of free space you
> -	  want on your filesystem. By default, Buildroot will not
> -	  leave much space free.
> -
>  config BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES
>  	int "extra inodes" if BR2_TARGET_ROOTFS_EXT2_INODES = 0
>  	default 0
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index cfb34c4..30f1d17 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -9,7 +9,6 @@ EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
>  ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)
>  EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
>  endif
> -EXT2_OPTS += -B $(BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS)
>  
>  ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
>  EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
> diff --git a/package/mke2img/mke2img b/package/mke2img/mke2img
> index c2e0d02..b773aa9 100755
> --- a/package/mke2img/mke2img
> +++ b/package/mke2img/mke2img
> @@ -17,14 +17,12 @@ main() {
>      # Default values
>      gen=2
>      rev=1
> -    nb_extra_blocks=0
>      nb_extra_inodes=0
>  
> -    while getopts :hb:B:i:I:r:d:o:G:R:l:u: OPT; do
> +    while getopts :hb:i:I:r:d:o:G:R:l:u: OPT; do
>          case "${OPT}" in
>          h)  help; exit 0;;
>          b)  nb_blocks=${OPTARG};;
> -        B)  nb_extra_blocks=${OPTARG};;
>          i)  nb_inodes=${OPTARG};;
>          I)  nb_extra_inodes=${OPTARG};;
>          r)  nb_res_blocks=${OPTARG};;
> @@ -64,22 +62,6 @@ main() {
>      fi
>      nb_inodes=$((nb_inodes+nb_extra_inodes))
>  
> -    # calculate needed blocks
> -    if [ -z "${nb_blocks}" ]; then
> -        # size ~= superblock, block+inode bitmaps, inodes (8 per block),
> -        # blocks; we scale inodes / blocks with 10% to compensate for
> -        # bitmaps size + slack
> -        nb_blocks=$(du -s -k "${root_dir}" |sed -r -e 's/[[:space:]]+.*$//')
> -        nb_blocks=$((500+(nb_blocks+nb_inodes/8)*11/10))
> -        if [ ${gen} -ge 3 ]; then
> -            # we add 1300 blocks (a bit more than 1 MiB, assuming 1KiB blocks)
> -            # for the journal
> -            # Note: I came to 1300 blocks after trial-and-error checks. YMMV.
> -            nb_blocks=$((nb_blocks+1300))
> -        fi
> -    fi
> -    nb_blocks=$((nb_blocks+nb_extra_blocks))
> -
>      # Upgrade to rev1 if needed
>      if [ ${rev} -ge 1 ]; then
>          tune2fs_O_opts+=",filetype,sparse_super"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
