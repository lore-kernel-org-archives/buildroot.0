From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Nov 2018 15:08:39 +0100
Subject: [Buildroot] [PATCH next v4 3/6] Makefile: rework main directory
 creation logic
In-Reply-To: <20181115210946.GR10271@scaer>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-4-thomas.petazzoni@bootlin.com>
 <20181115210946.GR10271@scaer>
Message-ID: <20181116150839.0369b1dd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Nov 2018 22:09:46 +0100, Yann E. MORIN wrote:

> I don't think we do need anything special to create HOST_DIR,
> STAGING_DIR and TARGET_DIR: 
> 
>   - host-skeleton is the first package to run, and that one does ensure
>     the existence of $(HOST_DIR) by the mere act of creating it (which
>     it cirrently does not do, but should)
> 
>   - skeleton is the first package to install in target/ and staging, and
>     currently the skeleton-custom and skeleton-init-common should both
>     create target/ and staging/

So, what you suggest is to remove the following hunks from my patch ?

@@ -238,6 +239,7 @@ $(BUILD_DIR)/%/.stamp_built::
 $(BUILD_DIR)/%/.stamp_host_installed:
 	@$(call step_start,install-host)
 	@$(call MESSAGE,"Installing to host directory")
+	@mkdir -p $(HOST_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_HOOKS),$(call $(hook))$(sep))
@@ -267,6 +269,7 @@ $(BUILD_DIR)/%/.stamp_host_installed:
 $(BUILD_DIR)/%/.stamp_staging_installed:
 	@$(call step_start,install-staging)
 	@$(call MESSAGE,"Installing to staging directory")
+	@mkdir -p $(STAGING_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_STAGING_CMDS)
 	$(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
@@ -298,6 +301,7 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 # Install to images dir
 $(BUILD_DIR)/%/.stamp_images_installed:
 	@$(call step_start,install-image)
+	@mkdir -p $(BINARIES_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_IMAGES_HOOKS),$(call $(hook))$(sep))
 	@$(call MESSAGE,"Installing to images directory")
 	+$($(PKG)_INSTALL_IMAGES_CMDS)
@@ -309,6 +313,7 @@ $(BUILD_DIR)/%/.stamp_images_installed:
 $(BUILD_DIR)/%/.stamp_target_installed:
 	@$(call step_start,install-target)
 	@$(call MESSAGE,"Installing to target")
+	@mkdir -p $(TARGET_DIR)
 	$(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
 	+$($(PKG)_INSTALL_TARGET_CMDS)
 	$(if $(BR2_INIT_SYSTEMD),\

Is this what you mean ?

> > +host-finalize: $(HOST_DIR_SYMLINK)
> > +
> > +.PHONY: staging-finalize
> > +staging-finalize:
> > +	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging
> > +
> >  .PHONY: target-finalize
> > -target-finalize: $(PACKAGES)
> > +target-finalize: $(PACKAGES) host-finalize  
> 
> Shouldn't we ensure that host-finalize be done before staging-finalize
> too?

Why so ?

> We would also need to ensure that packages are all installed before
> running staging-finalize.
> 
> So,=maybe we need to add:
> 
>     staging-finalize: $(PACKAGES) host-finalize

Same, we don't really need all packages to be installed just to create
that dummy symlink.

In fact, maybe I should go one step further: STAGING_DIR is part of
HOST_DIR, so maybe I should simply create this compatibility "staging"
symlink as part of "host-finalize".

I.e:

STAGING_DIR_SYMLINK := $(BASE_DIR)/staging
$(STAGING_DIR_SYMLINK): $(BASE_DIR)
	@ln -snf $(STAGING_DIR) $(BASE_DIR)/staging

host-finalize: $(HOST_DIR_SYMLINK) $(STAGING_DIR_SYMLINK

What do you think about this idea ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
