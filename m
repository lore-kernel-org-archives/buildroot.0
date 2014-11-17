From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Nov 2014 22:39:33 +0100
Subject: [Buildroot] [PATCH v3 2/5] Makefile: don't depend on current
 skeleton/overlay permissions
In-Reply-To: <1416244750-24256-3-git-send-email-guido@vanguardiasur.com.ar>
References: <1416244750-24256-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416244750-24256-3-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20141117213933.GF12473@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guido, All,

On 2014-11-17 14:19 -0300, Guido Mart?nez spake thusly:
> We use 'rsync -a' to copy the skeleton and overlays, so the target ends
> up with the exact same permissions as on the repo. The problem is we
> don't track these permissions, since Git doesn't allow for that (except
> for the exec bit). This means users with different umasks at the time of
> cloning could end up with different target permissions.
> 
> Fix this by using --chmod on rsync calls so we don't depend on the
> current permission set for the skeleton and overlays. We do depend on
> the exec bit, but that's fine since that one is tracked by Git.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 5ad8235..9c79dd9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -489,7 +489,7 @@ RSYNC_VCS_EXCLUSIONS = \
>  $(BUILD_DIR)/.root:
>  	mkdir -p $(TARGET_DIR)
>  	rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> -		--chmod=Du+w --exclude .empty --exclude '*~' \
> +		--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  		$(TARGET_SKELETON)/ $(TARGET_DIR)/
>  	$(INSTALL) -m 0644 support/misc/target-dir-warning.txt $(TARGET_DIR_WARNING_FILE)
>  	@ln -snf lib $(TARGET_DIR)/$(LIB_SYMLINK)
> @@ -625,7 +625,7 @@ endif
>  	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
>  		$(call MESSAGE,"Copying overlay $(d)"); \
>  		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> -			--chmod=Du+w --exclude .empty --exclude '*~' \
> +			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
>  			$(d)/ $(TARGET_DIR)$(sep))
>  
>  	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> -- 
> 2.1.3
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
