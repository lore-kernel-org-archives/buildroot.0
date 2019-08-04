From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Aug 2019 16:42:47 +0200
Subject: [Buildroot] [PATCH 1/1] Makefile: add $BINARIES_DIR dependency
 to target-post-image target
In-Reply-To: <20190712160925.6027-1-bgenerous@impinj.com>
References: <20190712160925.6027-1-bgenerous@impinj.com>
Message-ID: <20190804144247.GC25437@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brent, All,

Thanks for your contribution.

On 2019-07-12 16:10 +0000, Brent Generous spake thusly:
> Without this dependency, there is no guarantee that the $BINARIES_DIR
> has been created before this point. This can cause commands that intend
> to copy a file into $BINARIES_DIR to instead copy to a file named
> $BINARIES_DIR, causing later commands to create this directory to fail.
> 
> A comment above the target for $BINARIES_DIR mentions "do NOT list these
> as dependencies anywhere else". It wasn't clear from the git history why
> that should be the case. This seems like the correct way to handle the
> dependency on this directory.

We've discussed this today during the developpers meeting, andwe
concluded that the real solution would be to create the directory right
before calling the post-image scripts. I've respun a v2:

    https://patchwork.ozlabs.org/patch/1141759/

Can you confirm this also fixes your issue?

Regards,
Yann E. MORIN.

> Signed-off-by: Brent Generous <bgenerous@impinj.com>
> ---
>  Makefile | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c98a0ed87e..2ea7220484 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -606,7 +606,6 @@ BR2_SDK_PREFIX ?= $(GNU_TARGET_NAME)_sdk-buildroot
>  sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
>  	@$(call MESSAGE,"Generating SDK tarball")
>  	$(if $(BR2_SDK_PREFIX),,$(error BR2_SDK_PREFIX can not be empty))
> -	$(Q)mkdir -p $(BINARIES_DIR)
>  	$(TAR) czf "$(BINARIES_DIR)/$(BR2_SDK_PREFIX).tar.gz" \
>  		--owner=0 --group=0 --numeric-owner \
>  		--transform='s#^$(patsubst /%,%,$(HOST_DIR))#$(BR2_SDK_PREFIX)#' \
> @@ -810,7 +809,7 @@ endif # merged /usr
>  	touch $(TARGET_DIR)/usr
>  
>  .PHONY: target-post-image
> -target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
> +target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize | $(BINARIES_DIR)
>  	@rm -f $(ROOTFS_COMMON_TAR)
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
> -- 
> 2.17.2
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
