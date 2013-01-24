From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 22:41:55 +0100
Subject: [Buildroot] [RFC v1 03/14] generic infrastructure: out of tree
 build support
In-Reply-To: <1358725943-31485-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358725943-31485-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5101AAA3.4030507@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 00:52, Thomas Petazzoni wrote:
[snip]
>   # Patch
>   #
>   # The RAWNAME variable is the lowercased package name, which allows to
>   # find the package directory (typically package/<pkgname>) and the
>   # prefix of the patches
> -$(BUILD_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
> -$(BUILD_DIR)/%/.stamp_patched:
> +$(SRC_DIR)/%/.stamp_patched: NAMEVER = $(RAWNAME)-$($(PKG)_VERSION)
> +$(SRC_DIR)/%/.stamp_patched:
>   	@$(call MESSAGE,"Patching $($(PKG)_DIR_PREFIX)/$(RAWNAME)")
>   	$(foreach hook,$($(PKG)_PRE_PATCH_HOOKS),$(call $(hook))$(sep))
>   	$(foreach p,$($(PKG)_PATCH),support/scripts/apply-patches.sh $(@D) $(DL_DIR) $(p)$(sep))
> @@ -100,9 +81,15 @@ $(BUILD_DIR)/%/.stamp_patched:
>   	)
>   	$(foreach hook,$($(PKG)_POST_PATCH_HOOKS),$(call $(hook))$(sep))

  Ouch, we forgot something: there may be a HOST_FOO_PRE_PATCH_HOOKS, 
HOST_FOO_PATCH or HOST_FOO_POST_PATCH_HOOKS that is different from its 
non-host equivalent... Perhaps there should be a check that they are the 
same (or the host version is not defined).


>   	$(Q)touch $@
> +	chmod a-w -R $(@D)

  I would do this before touching the stamp file.

[snip]
> +# Handle the SOURCE_CHECK and SHOW_EXTERNAL_DEPS cases for overriden
> +# packages
> +$(BUILD_DIR)/%/.stamp_override_sourced:
> +ifeq ($(DL_MODE),SOURCE_CHECK)
> +	test -d $($(PKG)_SRCDIR)
> +else ifeq ($(DL_MODE),SHOW_EXTERNAL_DEPS)
> +	echo "file://$($(PKG)_SRCDIR)"
> +else
> +	@true # Nothing to do to source a local package
> +endif

  Why did you move this down? It was better when it was close to the rest 
of the source stuff.

> +
>   ################################################################################
>   # inner-generic-package -- generates the make targets needed to build a
>   # generic package
> @@ -215,11 +218,10 @@ else
>     $(2)_VERSION = $(subst /,_,$($(2)_VERSION))
>   endif
>
> -$(2)_BASE_NAME	=  $(1)-$$($(2)_VERSION)
> +$(2)_BASE_NAME	   =  $$($(2)_NAME)-$$($(2)_VERSION)
> +$(2)_RAW_BASE_NAME = $$($(2)_RAWNAME)-$$($(2)_VERSION)

  Whitespace seems to be a bit messed up here. Or it could just be the 
mixing of tabs and spaces.

>   $(2)_DL_DIR	=  $$(DL_DIR)/$$($(2)_BASE_NAME)
> -$(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)

  Err, $(PKG)_DIR is used in a lot of places: barebox, uboot, linux, 
ocf-linux, rtai, xenomai, bash, busybox, host-dbus, dhcp, dmalloc, 
dnsmasq, fbv, file, hostapd, ... OK I'm tired of typing all this, just do
git grep '[A-Z0-9]_DIR\b' -- \*.mk | sed 
's/\(TARGET\|HOST\|STAGING\|DL\)_DIR//g' | grep '[A-Z0-9]_DIR\b'

  I think these should be fixed up first in separate patches (as far as 
possible). It's not always clear whether they should be changed into the 
SRCDIR or BUILDDIR.


  Regards,
  Arnout

> -$(2)_SRCDIR		       = $$($(2)_DIR)
> -$(2)_BUILDDIR		       ?= $$($(2)_SRCDIR)
> +$(2)_BUILDDIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
>
>   ifneq ($$($(2)_OVERRIDE_SRCDIR),)
>   $(2)_VERSION = custom
[snip]



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
