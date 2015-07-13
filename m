From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 13 Jul 2015 13:35:53 +0200
Subject: [Buildroot] [PATCH v4 2/9] Makefile: don't depend on current
 skeleton/overlay permissions
In-Reply-To: <1416586748-12936-3-git-send-email-guido@vanguardiasur.com.ar>
References: <1416586748-12936-1-git-send-email-guido@vanguardiasur.com.ar>
 <1416586748-12936-3-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <55A3A299.4070206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/21/14 17:19, Guido Mart?nez wrote:
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

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It may break existings setup that rely on these permissions to be kept, but
since that's anyway not a good idea, let's keep it this way. However, I'll
follow up with a release not that explains the issue.

 Regards,
 Arnout

> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index eeb1412..5880bbb 100644
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
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
