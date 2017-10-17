From: Anisse Astier <anisse@astier.eu>
Date: Tue, 17 Oct 2017 17:53:53 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <1508170801-31062-1-git-send-email-anisse@astier.eu>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
Message-ID: <20171017155353.GB6368@bifrost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 16, 2017 at 06:20:01PM +0200, Anisse Astier wrote:
> This includes a new support script that helps parsing *_CMDS recipes,
> ensuring everything is forwarded.
> 
> See also: http://repo.or.cz/buildroot-gz.git/commitdiff/833e8fa7c7437931f1356b5b03a6b3810a3db586
> Latest discussion: http://lists.busybox.net/pipermail/buildroot/2017-October/204159.html
> 
> Signed-off-by: Anisse Astier <anisse@astier.eu>
> ---
> 
> This is a proof of concept and does not log everything yet, but should work.
> 
> 
>  package/pkg-generic.mk             | 54 ++++++++++++++++++++--------------
>  support/scripts/recipe-forward-log | 59 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+), 22 deletions(-)
>  create mode 100755 support/scripts/recipe-forward-log
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index cca94ba..335e2be 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -137,6 +137,8 @@ endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_user
>  endif
>  
> +exportvar = $(eval export $(1))
> +
>  ################################################################################
>  # Implicit targets -- produce a stamp file for each step of a package build
>  ################################################################################
> @@ -166,12 +168,13 @@ $(BUILD_DIR)/%/.stamp_actual_downloaded:
>  $(BUILD_DIR)/%/.stamp_extracted:
>  	@$(call step_start,extract)
>  	@$(call MESSAGE,"Extracting")
> -	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook))$(sep))
> +	$(foreach hook,$($(PKG)_PRE_EXTRACT_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
>  	$(Q)mkdir -p $(@D)
> -	$($(PKG)_EXTRACT_CMDS)
> +	@$(call exportvar,$(PKG)_EXTRACT_CMDS)
> +	$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_EXTRACT_CMDS"
>  # some packages have messed up permissions inside
>  	$(Q)chmod -R +rw $(@D)
> -	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook))$(sep))
> +	$(foreach hook,$($(PKG)_POST_EXTRACT_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
>  	@$(call step_end,extract)
>  	$(Q)touch $@
>  
> @@ -223,9 +226,10 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
>  $(BUILD_DIR)/%/.stamp_configured:
>  	@$(call step_start,configure)
>  	@$(call MESSAGE,"Configuring")
> -	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> -	$($(PKG)_CONFIGURE_CMDS)
> -	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
> +	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
> +	@$(call exportvar,$(PKG)_CONFIGURE_CMDS)
> +	$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_CONFIGURE_CMDS"
> +	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
>  	@$(call step_end,configure)
>  	$(Q)touch $@
>  
> @@ -233,9 +237,10 @@ $(BUILD_DIR)/%/.stamp_configured:
>  $(BUILD_DIR)/%/.stamp_built::
>  	@$(call step_start,build)
>  	@$(call MESSAGE,"Building")
> -	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook))$(sep))
> -	+$($(PKG)_BUILD_CMDS)
> -	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook))$(sep))
> +	$(foreach hook,$($(PKG)_PRE_BUILD_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))
> +	@$(call exportvar,$(PKG)_BUILD_CMDS)
> +	+$(TOPDIR)/support/scripts/recipe-forward-log "$($(PKG)_LOGFILE)" "$$$(PKG)_BUILD_CMDS"
> +	$(foreach hook,$($(PKG)_POST_BUILD_HOOKS),$(call $(hook)) >> $($(PKG)_LOGFILE) 2>&1 $(sep))

Side-note: before this, every use of +$(PKG)_XXX_CMDS wouldn't use the
make jobserver feature for anything but the first command of a multiline
_CMDS variable. This is a small issue since $(MAKE) seems to be used in
all packages.

Regards,

Anisse
