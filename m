From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Nov 2018 19:18:45 +0100
Subject: [Buildroot] [PATCH] fs: allow filesystems to set the name of
 their output file
In-Reply-To: <20181103220946.7976-1-casantos@datacom.com.br>
References: <20181103133452.GA24754@scaer>
 <20181103220946.7976-1-casantos@datacom.com.br>
Message-ID: <20181130181845.GC18074@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-11-03 19:09 -0300, Carlos Santos spake thusly:
> Some filesystems may want to tweak their output names, rather than using
> the fixed "rootfs.foo" scheme. Add a ROOTFS_FOO_IMAGE_NAME variable for
> this purpose.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

I was a bit reluctant at replying to this third iteration, but as Thomas
asked for my opinion on IRC, here is my review...

I'll say it blundly: this patch does not work. It can't possibly have
been tested as-is.

> ---
> Supersedes: https://patchwork.ozlabs.org/patch/988843/
> Supersedes: https://patchwork.ozlabs.org/patch/988446/
> ---
> Changes v1->v2:
> - Prevent leading space when the filesystem gets 'imaginative', as
>   pointed by Yann Morin.
> Changes v2->v3:
> - Fix typo and use strip instead of qstrip, as spotted by Yann Morin.
> 
> NOTE: https://patchwork.ozlabs.org/patch/927116/ must be upated to
> document this.
> ---
>  fs/common.mk | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index 453da6010a..175c3aca13 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -106,6 +106,8 @@ rootfs-common-show-depends:
>  # all variable references except the arguments must be $$-quoted.
>  define inner-rootfs
>  
> +ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)
> +ROOTFS_$(2)_FINAL_IMAGE_NAME = $$(call strip,$$(ROOTFS_$(2)_IMAGE_NAME))

'strip' is not a macro, it is a built-in, so $(call)-ing it expands to
an empty string, so...

>  ROOTFS_$(2)_DIR = $$(FS_DIR)/$(1)
>  ROOTFS_$(2)_TARGET_DIR = $$(ROOTFS_$(2)_DIR)/target
>  
> @@ -140,10 +142,10 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
>  ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
>  endif
>  
> -$$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
> -$$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
> -$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
> -	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
> +$$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): ROOTFS=$(2)
> +$$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
> +$$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)

... these rules thus all have just $$(BINARIES_DIR) as their target, so
that doe not work very nicely...

> +	@$$(call MESSAGE,"Generating filesystem image $$(ROOTFS_$(2)_FINAL_IMAGE_NAME)")
>  	rm -rf $$(ROOTFS_$(2)_DIR)
>  	mkdir -p $$(ROOTFS_$(2)_DIR)
>  	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
> @@ -164,7 +166,7 @@ endif
>  rootfs-$(1)-show-depends:
>  	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
>  
> -rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
> +rootfs-$(1): $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME)

... except maybe because of that?

Anyway, that is still an incorrect patch...

Regards,
Yann E. MORIN.

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
