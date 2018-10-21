From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Oct 2018 15:26:26 +0200
Subject: [Buildroot] [RFC] fs: allow passing the image file name to
 inner-rootfs
In-Reply-To: <20180622023105.27865-1-casantos@datacom.com.br>
References: <20180622023105.27865-1-casantos@datacom.com.br>
Message-ID: <20181021132626.GA23085@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Carlos, All,

On 2018-06-21 23:31 -0300, Carlos Santos spake thusly:
> Suppose that you want to create a filesystem image containing only the
> /var/lib subtree. That would something like this on a br2-external:
[--SNIP--]
> This can be achieved by passing a third argument to inner-rootfs with
> the desired file name:
>     rootfs-var-lib = $(call inner-rootfs,var-lib-$(pkgname),VAR_LIB_$(call UPPERCASE,$(pkgname)),rootfs-var-lib.$(pkgname))

We've discussed this patch during the developers days, and we came to
the conclusion that this should be better done by allowing filesystems
to provide the name of their output file as a variable, something like:

    ROOTFS_FOOBAR_IMAGE_NAME = my-own-filesystem.data

Then the infrastructure would do:

    ROOTFS_$(2)_IMAGE_NAME ?= rootfs.$(1)

    $$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): ROOTFS=$(2)
    $$(BINARIES_DIR)/$$(ROOTFS_$(2)_IMAGE_NAME): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
    [...and so on...]

Using a variable is more inline with how we handle this kind of
customisations in Buildrooot, and allows one to continue calling the
'rootfs' macro instad of the 'rootfs-inner' one (which, as its name
implies, is an inner macro, aka purely for internal use, not public).

Besides, the commit log was seen as too decorelated from the actual
change. It is not needed to explain the 'sub-tree-only' case, and just
state that some filesystems may want to tweak their output name, rather
than the current scheme.

Regards,
Yann E. MORIN.

> Signed-off-by: Carlos Santos <casantos@datacom.com.br>
> ---
>  fs/common.mk | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/common.mk b/fs/common.mk
> index abf35418cb..2380c1dd3f 100644
> --- a/fs/common.mk
> +++ b/fs/common.mk
> @@ -139,10 +139,10 @@ ROOTFS_$(2)_COMPRESS_EXT = .xz
>  ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
>  endif
>  
> -$$(BINARIES_DIR)/rootfs.$(1): ROOTFS=$(2)
> -$$(BINARIES_DIR)/rootfs.$(1): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
> -$$(BINARIES_DIR)/rootfs.$(1): $$(ROOTFS_$(2)_DEPENDENCIES)
> -	@$$(call MESSAGE,"Generating root filesystem image rootfs.$(1)")
> +$$(BINARIES_DIR)/$(3): ROOTFS=$(2)
> +$$(BINARIES_DIR)/$(3): FAKEROOT_SCRIPT=$$(ROOTFS_$(2)_DIR)/fakeroot
> +$$(BINARIES_DIR)/$(3): $$(ROOTFS_$(2)_DEPENDENCIES)
> +	@$$(call MESSAGE,"Generating root filesystem image $(3)")
>  	rm -rf $$(ROOTFS_$(2)_DIR)
>  	mkdir -p $$(ROOTFS_$(2)_DIR)
>  	echo '#!/bin/sh' > $$(FAKEROOT_SCRIPT)
> @@ -163,7 +163,7 @@ endif
>  rootfs-$(1)-show-depends:
>  	@echo $$(ROOTFS_$(2)_DEPENDENCIES)
>  
> -rootfs-$(1): $$(BINARIES_DIR)/rootfs.$(1)
> +rootfs-$(1): $$(BINARIES_DIR)/$(3)
>  
>  .PHONY: rootfs-$(1) rootfs-$(1)-show-depends
>  
> @@ -181,6 +181,6 @@ endif
>  endef
>  
>  # $(pkgname) also works well to return the filesystem name
> -rootfs = $(call inner-rootfs,$(pkgname),$(call UPPERCASE,$(pkgname)))
> +rootfs = $(call inner-rootfs,$(pkgname),$(call UPPERCASE,$(pkgname)),rootfs.$(pkgname))
>  
>  include $(sort $(wildcard fs/*/*.mk))
> -- 
> 2.17.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
