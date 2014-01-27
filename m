From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 08:09:47 +0100
Subject: [Buildroot] [PATCH 1/1] Makefile: move skeleton overlay
 installations before strip step
In-Reply-To: <1390530729-1830-1-git-send-email-danomimanchego123@gmail.com>
References: <1390530729-1830-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <52E6063B.1060700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/01/14 03:32, Danomi Manchego wrote:
> Nothing prevents the skeleton overlays from having pre-built

  Small nit: it's not a skeleton overlay, but a rootfs overlay (I first 
thought you were talking about the skeleton, which is copied _before_ the 
build).

> executables or libraries in them.  Therefore, we should install
> the overlays prior to stripping, so that any such pre-built stuff
> gets stripped too.

  I'm not sure if I agree with this change. I like the current situation 
where the rootfs-overlay is really copied verbatim and you can trust it. 
If there are binaries in there, we can assume that the user has the 
cross-compiler available to strip them if he wants that.

  That said, I can't think of a situation where it would be really 
essential that the binaries are not stripped, and anyway in that case it 
is still possible to use BR2_STRIP_EXCLUDE_*. So I don't feel very 
strongly about this.

  Regards,
  Arnout

>
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>   Makefile |   13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9dfb1e0..9235c31 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -513,6 +513,13 @@ ifeq ($(BR2_PACKAGE_PYTHON_PYC_ONLY),y)
>   	find $(TARGET_DIR)/usr/lib/ -name '*.py' -print0 | xargs -0 rm -f
>   endif
>   	rm -rf $(TARGET_DIR)/usr/lib/luarocks
> +
> +	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
> +		$(call MESSAGE,"Copying overlay $(d)"); \
> +		rsync -a $(RSYNC_VCS_EXCLUSIONS) \
> +			--exclude .empty --exclude '*~' \
> +			$(d)/ $(TARGET_DIR)$(sep))
> +
>   	$(STRIP_FIND_CMD) | xargs $(STRIPCMD) 2>/dev/null || true
>   	if test -d $(TARGET_DIR)/lib/modules; then \
>   		find $(TARGET_DIR)/lib/modules -type f -name '*.ko' | \
> @@ -545,12 +552,6 @@ endif
>   		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
>   	) >  $(TARGET_DIR)/etc/os-release
>
> -	@$(foreach d, $(call qstrip,$(BR2_ROOTFS_OVERLAY)), \
> -		$(call MESSAGE,"Copying overlay $(d)"); \
> -		rsync -a $(RSYNC_VCS_EXCLUSIONS) \
> -			--exclude .empty --exclude '*~' \
> -			$(d)/ $(TARGET_DIR)$(sep))
> -
>   	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
>   		$(call MESSAGE,"Executing post-build script $(s)"); \
>   		$(USER_HOOKS_EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
