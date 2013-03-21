From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Mar 2013 08:25:52 +0100
Subject: [Buildroot] [PATCH v2] rework patch model
In-Reply-To: <1363518489-1065-1-git-send-email-spdawson@gmail.com>
References: <1363518489-1065-1-git-send-email-spdawson@gmail.com>
Message-ID: <514AB600.1020009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/03/13 12:08, spdawson at gmail.com wrote:
> From: Simon Dawson <spdawson@gmail.com>
>
> At the Buildroot Developers Meeting (4-5 February 2013, in Brussels) a change
> to the patch logic was discussed. See
>
> http://elinux.org/Buildroot:DeveloperDaysFOSDEM2013
>
> for details. In summary:
>
> * For patches stored in the package directory, if package/<pkg>/<version>/ does exist, apply package/<pkg>/<version>/*.patch, otherwise, apply package/<pkg>/*.patch

  I wonder if perhaps I made a mistake while writing the report... Did we 
really agree to apply package/<pkg>/*.patch instead of
package/<pkg>/<pkg>-*.patch?

  Now that I think about it: I wouldn't mind, actually, the <pkg>- prefix 
is pretty redundant and it sits in the way of creating patches with 
git-format-patch. Should we then also change our patch naming policy?

> * For patches stored in the global patches directory, if $(GLOBAL_PATCH_DIR)/<pkg>/<version>/ does exist, apply $(GLOBAL_PATCH_DIR)/<pkg>/<version>/*.patch, otherwise, apply $(GLOBAL_PATCH_DIR)/<pkg>/*.patch
>
> This patch adds the new BR2_GLOBAL_PATCH_DIR configuration item, and reworks
> the generic package infrastructure to implement the new patch logic.

  For clarity, I would have split up this patch into two patches:

1. Remove the $(NAMEVER).patch way of specifying versioned patches.
2. Add the GLOBAL_PATCH_DIR option.

  But it's no biggy, since the first patch is rather trivial. Still, I 
would mention this removal of the $(NAMEVER).patch explicitly in the 
commit message.

  Note that this patch will break any remaining packages that still have 
both $(NAMEVER).patch and $(RAWNAME).patch patches. So watch your 
autobuilders! There are still more than 200 $(NAMEVER).patch files:
find package -name *-[0-9].[0-9]*.patch


[snip]
> diff --git a/docs/manual/customize-packages.txt b/docs/manual/customize-packages.txt
> new file mode 100644
> index 0000000..9e158c7
> --- /dev/null
> +++ b/docs/manual/customize-packages.txt
> @@ -0,0 +1,23 @@
> +// -*- mode:doc -*- ;
> +
> +[[packages-custom]]
> +Customizing packages
> +~~~~~~~~~~~~~~~~~~~~
> +
> +It is sometimes useful to apply 'extra' patches to packages - over and
> +above those provided in Buildroot. This might be used to support custom
> +features in a project, for example, or when working on a new architecture.
> +
> +The +BR2_GLOBAL_PATCH_DIR+ configuration file option can be
> +used to specify a directory containing global package patches.
> +
> +For a specific version <version> of a specific package <pkg>, patches
> +are applied as follows.
> +
> +First, the default Buildroot patch set for the package is applied.
> +
> +If the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg>/<version> exists, then
> +all *.patch files in the directory will be applied.
> +
> +Otherwise, if the directory $(BR2_GLOBAL_PATCH_DIR)/<pkg> exists, then
> +all *.patch files in the directory will be applied.

  Could be nice to add:

The patches are applied in alphabetical order (the order of 'ls' in the C 
locale). Therefore, it is advisable to name patches 
<num>-<description>.patch, where <num> is a 4-digit numerical value that 
enforces the order.

> diff --git a/docs/manual/customize.txt b/docs/manual/customize.txt
> index 3b1a5a7..0456ef1 100644
> --- a/docs/manual/customize.txt
> +++ b/docs/manual/customize.txt
> @@ -15,3 +15,5 @@ include::customize-kernel-config.txt[]
>   include::customize-toolchain.txt[]
>
>   include::customize-store.txt[]
> +
> +include::customize-packages.txt[]
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 57b0fd0..db0b025 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -82,21 +82,21 @@ endif
>   # find the package directory (typically package/<pkgname>) and the
>   # prefix of the patches
>   $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
> +$(BUILD_DIR)/%/.stamp_patched: PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))/$(RAWNAME)

  Since GLOBAL_PATCH_DIR defaults to the empty string, this will by 
default look in /$(RAWNAME). Fortunately we don't have a package called 
etc or tmp or something similar, but you can imagine the weird fallout 
waiting to happen...  So, this should be something like:

GLOBAL_PATCH_DIR = $(call qstrip,$(BR2_GLOBAL_PATCH_DIR))

PATCH_BASE_DIRS = $($(PKG)_DIR_PREFIX)/$(RAWNAME) \
    $(if $(GLOBAL_PATCH_DIR),$(GLOBAL_PATCH_DIR)/$(RAWNAME))

>   $(BUILD_DIR)/%/.stamp_patched:
>   	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
>   	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
>   	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
>   	$(Q)( \
> -	if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME); then \
> -	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER)*.patch*)"; then \
> -	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
> -	  else \
> -	    support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME) $(RAWNAME)\*.patch $(RAWNAME)\*.patch.$(ARCH) || exit 1; \
> -	    if test -d $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER); then \
> -	      support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)/$(RAWNAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
> +	for D in $(PATCH_BASE_DIRS); do \

  Since this is the only place where PATCH_BASE_DIRS is used, I don't see 
much point of creating a variable for it.

  Also, if you remove the /$(RAWNAME) from the base dirs list and add it 
to the uses of $${D} below, then you remove the need for the 
GLOBAL_PATCH_DIRS condition.


  Regards,
  Arnout

> +	  if test -d $${D}; then \
> +	    if test -d $${D}/$($(PKG)_VERSION); then \
> +	      support/scripts/apply-patches.sh $(@D) $${D}/$($(PKG)_VERSION) \*.patch \*.patch.$(ARCH) || exit 1; \
> +	    else \
> +	      support/scripts/apply-patches.sh $(@D) $${D} \*.patch \*.patch.$(ARCH) || exit 1; \
>   	    fi; \
>   	  fi; \
> -	fi; \
> +	done; \
>   	)
>   	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))
>   	$(Q)touch $@
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
