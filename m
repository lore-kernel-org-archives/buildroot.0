From: Andreas Naumann <dev@andin.de>
Date: Mon, 19 Nov 2018 15:27:59 +0100
Subject: [Buildroot] [PATCH next v4 6/6] core: implement per-package SDK
 and target
In-Reply-To: <20181119114806.4fb9d98b@windsurf.home>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
 <de9da9af-71f4-cfe2-f691-5aae17e3ca0a@andin.de>
 <20181116144735.19585727@windsurf>
 <CAAXf6LWM0dcCJSVTSerox320PWKkpPcOXORF2cTaWfHitgRguQ@mail.gmail.com>
 <20181116195741.GV10271@scaer> <10c54101-3264-eefb-58d0-4770ef723717@mind.be>
 <20181119114806.4fb9d98b@windsurf.home>
Message-ID: <f37598b6-ac9b-42cc-7f7a-b60a6a1b6d2b@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 19.11.18 um 11:48 schrieb Thomas Petazzoni:
> Hello,
> 
> On Sun, 18 Nov 2018 22:55:26 +0100, Arnout Vandecappelle wrote:
> 
>>> Yes, we got bitten pretty hard when preparing the kconfig infra. But
>>> what can we remember from an almost-5-year old work initiated after
>>> FOSDEM? ;-)
>>>    
>>>> The goal is that one can run 'make foo-menuconfig' from a clean tree,
>>>> without first processing (downloading, building, ...) the dependencies
>>>> of foo first.
>>>> If you put this stuff in the configure step of foo, you are bound byi
>>>> its dependencies. There may be other reasons too, not sure.
>>>
>>> I am all in favour of simplifying it if it can be made simpler by adding
>>> an official extra 'prepare' step, that exists for all types of package
>>> infras. This we'd have 4 levels of dependencies:
>>>
>>>   1- download dependencies
>>>   2- extract dependencies
>>>   3- prepare dependencies
>>>   4- configure dependencies
>>
>>   I think your mixing two things here. The "prepare" that ThomasP is talking
>> about is really the PPD creation. The additional step for autoreconf or kconfig
>> is something else - it's a step with commands that are defined by the package
>> (infra).
> 
> I don't think Yann is mixing things here. Indeed we are using the word
> "prepare" for two different things: preparing the PPD folder, and
> "doing some stuff before the configure step".
> 
> For the PPD folder, some preparation currently occurs at the download
> step (for download dependencies), some preparation occurs at the
> extract step (for the extract dependencies) and some preparation occurs
> at the configuration step (for the normal dependencies).
> 
> The issue with the kconfig infrastructure is that it creates a new type
> of dependency called "kconfig dependency", which should be ready to do
> all the kconfig-related activities, but that we want separate from the
> normal "configure dependencies" because we want to be able to do "make
> linux-menuconfig" or "make busybox-menuconfig" without having to wait
> for their dependencies to build.
> 
> So what Yann is proposing is that instead of having this "kconfig
> dependency" stuff be shoe-horned into the dependency chain by
> pkg-kconfig.mk, we should promote it to a new step in the build steps.
> By the lack of better naming, Yann named that step "prepare", but it
> has nothing to do with "preparing PPD".
> 
> Indeed, what we would do is:
> 
>   1. Download step
>      Prepare PPD with download dependencies
>      Do the normal download stuff
> 
>   2. Extract step
>      Prepare PPD with extract dependencies
>      Do the normal extract stuff
> 
>   3. Patch step
>      Prepare PPD with patch dependencies
>      Do the normal patch stuff
> 
>   4. Prepare step
>      Prepare PPD with the prepare dependencies
>      Do the prepare stuff (i.e only the kconfig stuff for now)
> 
>   5. Configure step
>      Prepare PPD with the normal dependencies
>      Do the normal configure stuff
> 
> Does that clarify Yann's proposal ?
> 
> I personally find it OK, even though it's a bit annoying to introduce
> yet another step just for the sake of pkg-kconfig.
> 
> Also: I would not move autoreconf into this prepare step, but keep it
> as it is today, within the configure step. I don't (today at least) see
> the point/usefulness of moving the autoreconf into this prepare step.

This is basically what i have done, but without explicitely introducing 
separate kconfig-dependencies, I hope this is readable:

 From cf583d9ed09c667f24f526edf890d81b374e1d83 Mon Sep 17 00:00:00 2001
From: Andreas Naumann <anaumann@ultratronik.de>
Date: Wed, 14 Nov 2018 17:27:31 +0100
Subject: [PATCH v2 1/1] core: Move per-package host preparation into 
separate
  step

Unfortunately, the kconfig infrastructure is running the 'make 
xxx_defconfig'
step before the configure-step is "officially" started. This is due to
the kconfig_fixup target.
This however requires availability of the toolchain and other prerequisites,
so this patch introduces an intermediate target to prepare the per-package
host dir.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
  package/pkg-generic.mk | 19 +++++++++++++++----
  package/pkg-kconfig.mk |  2 +-
  2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 8ec5e8db73..3014c13846 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -232,11 +232,18 @@ $(foreach dir,$(call qstrip,$(BR2_GLOBAL_PATCH_DIR)),\
  	$(if $(wildcard $(dir)),,\
  		$(error BR2_GLOBAL_PATCH_DIR contains nonexistent directory $(dir))))

+# Prepare per-package host dir for configure
+$(BUILD_DIR)/%/.stamp_configure_prepared:
+	@$(call step_start,configure_prepared)
+	@$(call MESSAGE,"Prepare per-package host")
+	$(call prepare-per-package-folder,$($(PKG)_FINAL_DEPENDENCIES))
+	@$(call step_end,configure_prepared)
+	$(Q)touch $@
+
  # Configure
  $(BUILD_DIR)/%/.stamp_configured:
  	@$(call step_start,configure)
  	@$(call MESSAGE,"Configuring")
-	$(call prepare-per-package-folder,$($(PKG)_FINAL_DEPENDENCIES))
  	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
  	$($(PKG)_CONFIGURE_CMDS)
  	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -663,6 +670,7 @@ $(2)_TARGET_INSTALL_STAGING = 
$$($(2)_DIR)/.stamp_staging_installed
  $(2)_TARGET_INSTALL_IMAGES =	$$($(2)_DIR)/.stamp_images_installed
  $(2)_TARGET_INSTALL_HOST =      $$($(2)_DIR)/.stamp_host_installed
  $(2)_TARGET_BUILD =		$$($(2)_DIR)/.stamp_built
+$(2)_TARGET_CONFIGURE_PREP =	$$($(2)_DIR)/.stamp_configure_prepared
  $(2)_TARGET_CONFIGURE =		$$($(2)_DIR)/.stamp_configured
  $(2)_TARGET_RSYNC =	        $$($(2)_DIR)/.stamp_rsynced
  $(2)_TARGET_PATCH =		$$($(2)_DIR)/.stamp_patched
@@ -756,7 +764,8 @@ $$($(2)_TARGET_BUILD):	$$($(2)_TARGET_CONFIGURE)
  # dependency by using |.

  $(1)-configure:			$$($(2)_TARGET_CONFIGURE)
-$$($(2)_TARGET_CONFIGURE):	| $$($(2)_FINAL_DEPENDENCIES)
+$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_CONFIGURE_PREP)
+$$($(2)_TARGET_CONFIGURE_PREP): | $$($(2)_FINAL_DEPENDENCIES)

  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | prepare
  $$($(2)_TARGET_SOURCE) $$($(2)_TARGET_RSYNC): | dependencies
@@ -768,7 +777,7 @@ ifeq ($$($(2)_OVERRIDE_SRCDIR),)
  #  extract
  #  patch
  #  configure
-$$($(2)_TARGET_CONFIGURE):	$$($(2)_TARGET_PATCH)
+$$($(2)_TARGET_CONFIGURE_PREP):	$$($(2)_TARGET_PATCH)

  $(1)-patch:		$$($(2)_TARGET_PATCH)
  $$($(2)_TARGET_PATCH):	$$($(2)_TARGET_EXTRACT)
@@ -807,7 +816,7 @@ else

  # Use an order-only dependency so the "<pkg>-clean-for-rebuild" rule
  # can remove the stamp file without triggering the configure step.
-$$($(2)_TARGET_CONFIGURE): | $$($(2)_TARGET_RSYNC)
+$$($(2)_TARGET_CONFIGURE_PREP): | $$($(2)_TARGET_RSYNC)

  $(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)

@@ -878,6 +887,7 @@ $(1)-rebuild:		$(1)-clean-for-rebuild $(1)

  $(1)-clean-for-reconfigure: $(1)-clean-for-rebuild
  			rm -f $$($(2)_TARGET_CONFIGURE)
+			rm -f $$($(2)_TARGET_CONFIGURE_PREP)

  $(1)-reconfigure:	$(1)-clean-for-reconfigure $(1)

@@ -889,6 +899,7 @@ $$($(2)_TARGET_INSTALL_IMAGES):		PKG=$(2)
  $$($(2)_TARGET_INSTALL_HOST):		PKG=$(2)
  $$($(2)_TARGET_BUILD):			PKG=$(2)
  $$($(2)_TARGET_CONFIGURE):		PKG=$(2)
+$$($(2)_TARGET_CONFIGURE_PREP):		PKG=$(2)
  $$($(2)_TARGET_RSYNC):			SRCDIR=$$($(2)_OVERRIDE_SRCDIR)
  $$($(2)_TARGET_RSYNC):			PKG=$(2)
  $$($(2)_TARGET_PATCH):			PKG=$(2)
diff --git a/package/pkg-kconfig.mk b/package/pkg-kconfig.mk
index d6c95b897e..5567df01d6 100644
--- a/package/pkg-kconfig.mk
+++ b/package/pkg-kconfig.mk
@@ -128,7 +128,7 @@ $$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $(1)-patch
  # Some packages may need additional tools to be present by the time their
  # kconfig structure is parsed (e.g. the linux kernel may need to call to
  # the compiler to test its features).
-$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): | $$($(2)_KCONFIG_DEPENDENCIES)
+$$($(2)_DIR)/$$($(2)_KCONFIG_DOTCONFIG): $$($(2)_TARGET_CONFIGURE_PREP) 
| $$($(2)_KCONFIG_DEPENDENCIES)

  # In order to get a usable, consistent configuration, some fixup may 
be needed.
  # The exact rules are specified by the package .mk file.
-- 
2.19.1




> 
> Best regards,
> 
> Thomas
> 
