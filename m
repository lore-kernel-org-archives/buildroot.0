From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 30 Mar 2017 22:27:33 +0200
Subject: [Buildroot] [PATCH 3/4] package/mke2img: remove unused package
In-Reply-To: <1490372432-879-3-git-send-email-sebastien.szymanski@armadeus.com>
References: <1490372432-879-1-git-send-email-sebastien.szymanski@armadeus.com>
 <1490372432-879-3-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <479ead55-2692-a77d-fcef-0d0737ab4031@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-03-17 17:20, S?bastien Szymanski wrote:
> Now that we use mkfs to generate ext filesystem image, call mkfs
> directly from fs/ext2/ext2.mk and remove mke2img package.

 "and" in the commit log is a flag that something is up: you're doing two
things, so it should be two patches. First let fs/ext2 use the new script, then
remove mke2img.

 But when you look at it that way, patch 2 becomes pretty useless. Since patch 2
anyway largely rewrites the script entirely, I would just drop it and
immediately call mke2fs directly from the .mk file.

[snip]
> diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
> index 30f1d17..3872e52 100644
> --- a/fs/ext2/ext2.mk
> +++ b/fs/ext2/ext2.mk
> @@ -4,32 +4,33 @@
>  #
>  ################################################################################
>  
> -EXT2_OPTS = -G $(BR2_TARGET_ROOTFS_EXT2_GEN) -R $(BR2_TARGET_ROOTFS_EXT2_REV)
> +EXT2_OPTS = -d $(TARGET_DIR)
> +EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_REV)
>  
> -ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)),0)

 This should have been removed in patch 1. Without the auto-calculation, if no
size is given, genext2fs will fail I think. Well, with size 0 it will also fail,
but probably with a more obvious error message.


> -EXT2_OPTS += -b $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)
> +NB_INODES := $(strip $(BR2_TARGET_ROOTFS_EXT2_INODES))

 Why do you need := here?

> +ifeq ($(NB_INODES),0)
> +NB_INODES = $(shell echo $$(($$(find $(TARGET_DIR) | wc -l) + 400)))

 Not sure, but perhaps also drop this autocalculation of number of inodes?
mke2fs will use a number of inodes depending on the filesystem size, which is
possibly more useful than this autocalculation... Anyway, can be done in a later
patch.

 If you do keep NB_INODES, it's not needed to go through $(shell...), you can
just do

NB_INODES = $$(( $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES) + \
	`find $(TARGET_DIR) | wc -l` + 400 ))

(Note that we prefer `` over $() to reduce the double-dollaring.)

 Also, the variable name should be prefixed with EXT2_.


>  endif
> -
> -ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_INODES)),0)
> -EXT2_OPTS += -i $(BR2_TARGET_ROOTFS_EXT2_INODES)
> -endif
> -EXT2_OPTS += -I $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES)
> +EXT2_OPTS += -N $(shell echo $$(($(NB_INODES) + $(BR2_TARGET_ROOTFS_EXT2_EXTRA_INODES))))

 Easier to include this calculation above, so just -N $(NB_INODES) here.

>  
>  ifneq ($(strip $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)),0)
> -EXT2_OPTS += -r $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
> +EXT2_OPTS += -m $(BR2_TARGET_ROOTFS_EXT2_RESBLKS)
>  endif
>  
> +EXT2_OPTS += -O ^64bit
> +EXT2_OPTS += -T small -F
> +
>  # qstrip results in stripping consecutive spaces into a single one. So the
>  # variable is not qstrip-ed to preserve the integrity of the string value.
>  EXT2_LABEL := $(subst ",,$(BR2_TARGET_ROOTFS_EXT2_LABEL))
>  ifneq ($(EXT2_LABEL),)
> -EXT2_OPTS += -l "$(EXT2_LABEL)"
> +EXT2_OPTS += -L "$(EXT2_LABEL)"
>  endif
>  
> -ROOTFS_EXT2_DEPENDENCIES = host-mke2img
> +ROOTFS_EXT2_DEPENDENCIES = host-e2fsprogs
>  
>  define ROOTFS_EXT2_CMD
> -	PATH=$(BR_PATH) mke2img -d $(TARGET_DIR) $(EXT2_OPTS) -o $@
> +	PATH=$(BR_PATH) mkfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN) $(EXT2_OPTS) $@ $(BR2_TARGET_ROOTFS_EXT2_BLOCKS)

 I have a slight preference to use mke2fs -t extX rather than mkfs.extX (which
allows adding the GEN option to EXT2_OPTS), but that's just personal preference.


 Regards,
 Arnout

>  endef
>  
>  rootfs-ext2-symlink:

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
