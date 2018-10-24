From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2018 16:36:16 +0200
Subject: [Buildroot] [PATCH] fs: allow filesystems to set the name of
 their output file
In-Reply-To: <20181024010149.3970-1-casantos@datacom.com.br>
References: <20181021132626.GA23085@scaer>
 <20181024010149.3970-1-casantos@datacom.com.br>
Message-ID: <20181024143616.GA31663@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-10-23 22:01 -0300, Carlos Santos spake thusly:
> Some filesystems may want to tweak their output names, rather than using
> the fixed "rootfs.foo" scheme. Add a ROOTFS_FOO_IMAGE_NAME variable for
> this purpose and document it.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
> NOTE: https://patchwork.ozlabs.org/patch/927116/ must be upated to
> document this.
> ---
>  fs/common.mk | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 453da6010a..22ca56a1ff 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -106,6 +106,7 @@ rootfs-common-show-depends:
>  # all variable references except the arguments must be $$-quoted.
>  define inner-rootfs
>  
> +ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)
>  ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
>  ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
>  
> @@ -140,10 +141,10 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
>  ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
>  endif
>  
> -$$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
> -$$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
> -$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
> -	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
> +$$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): ROOTFS=$(2)

This unfortunately does not work when the filesystem gets 'imaginative'
when setting that variable.

For example, I tweaked the ext2 fs in Buildroot to remove the current
hook, and replacing it with a conditionally set name:

    diff --git a/fs/ext2/ext2.mk b/fs/ext2/ext2.mk
    index 6bb4b1c7f8..923ccdca2f 100644
    --- a/fs/ext2/ext2.mk
    +++ b/fs/ext2/ext2.mk
    @@ -40,7 +40,13 @@ ifneq ($(BR2_TARGET_ROOTFS_EXT2_GEN),2)
     define ROOTFS_EXT2_SYMLINK
     	ln -sf rootfs.ext2$(ROOTFS_EXT2_COMPRESS_EXT) $(BINARIES_DIR)/rootfs.ext$(BR2_TARGET_ROOTFS_EXT2_GEN)$(ROOTFS_EXT2_COMPRESS_EXT)
     endef
    -ROOTFS_EXT2_POST_GEN_HOOKS += ROOTFS_EXT2_SYMLINK
    +#ROOTFS_EXT2_POST_GEN_HOOKS += ROOTFS_EXT2_SYMLINK
     endif
     
    +ROOTFS_EXT2_IMAGE_NAME = \
    +	$(if $(BR2_TARGET_ROOTFS_EXT2_2r0),rootfs.ext2) \
    +	$(if $(BR2_TARGET_ROOTFS_EXT2_2r1),rootfs.ext2) \
    +	$(if $(BR2_TARGET_ROOTFS_EXT2_3),rootfs.ext3) \
    +	$(if $(BR2_TARGET_ROOTFS_EXT2_4),rootfs.ext4)
    +
     $(eval $(rootfs))

And then, the variable gets a leading sapce, unfortunately.

So, you need to qstrip the variable before using it, probably going with
an intermediate variable (in the fs infrastructure):

    ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)
    ROOTFS_$(2)_FINAL_IMAGE_NAME = $$(call qstrip,$$(ROOTFS_$()_IMAGE_NAME))

and then use ROOTFS_$(2)_FINAL_IMAGE_NAME to generate the rules...

Regards,
Yann E. MORIN.

> +$$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
> +$$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
> +	@$$(call MESSAGE,"Generating filesystem image $$(ROOTFS_$(2)_IMAGE_NAME)")
>  	rm -rf $$(ROOTFS_$(2)_DIR)
>  	mkdir -p $$(ROOTFS_$(2)_DIR)
>  	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
> @@ -164,7 +165,7 @@ endif
>  rootfs-$(1)-show-depends:
>  	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
>  
> -rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
> +rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME)
>  
>  .PHONY: rootfs-$(1) rootfs-$(1)-show-depends
>  
> -- 
> 2.17.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
