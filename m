From: Cam Hutchison <camh@xdna.net>
Date: Sun, 19 Jul 2015 07:52:36 -0000
Subject: [Buildroot] [RFC] Building an overlay image without a skeleton
References: <6dcf.55a84e6b.55e01@xdna.net>
Message-ID: <18e2.55ab5744.4069d@xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Does anyone know why this does not show up in patchwork? Too much
rambling up-front? No Signed-off by?

Since I was just looking for discussion, I'm more curious that
concerned. Presumably if I follow the posting patches guide in the
docco, it will show up in patchwork?


Cam Hutchison <camh@xdna.net> writes:

>tldr: I want to build an rootfs image that can be used as an overlay for
>another buildroot image.

>The recent churn in skeleton handling has prompted me to post this. In
>particular, Thomas Petazzoni's recent comment on a skeleton thread:

>> My personal preference would be to ultimately get rid of the custom
>> skeleton thing. We have been encouraging rootfs overlay and post-build
>> scripts since quite a while in the Buildroot manual [...]

>I've been running with a local patch whenever I use buildroot since
>about 5 years ago that allows me to build an image in phases. My
>original motivation was for a client I set up with buildroot who did not
>want all the developers to be building the toolchain, bootloader, kernel
>and os-leve portions of the image each time. Most of the devs were
>working on custom applications to be deployed on the board, but some
>others worked on the different parts of the image.

>I achieved this by splitting the build into the toolchain, which used
>the internal buildroot toolchain but was installed externally. The other
>phases used this toolchain as an external toolchain.

>Each of the phases builds a part of the rootfs image and each phase
>contains only the parts of the rootfs image relevant to that phase. The
>final phase uses the skeleton and overlays to combine them into a final
>image. The devs all share the interim overlays and the one or two devs
>responsible to the non-final images can build and update them as
>necessary when they'll next be included in the final build.

>I found this phased approach to be so useful that I used it myself for
>my personal projects on buildroot. So I've been carrying some patches
>that allow me to do this, and with the recent skeleton changes and
>discussion, it is perhaps time to share what I've done.

>Basically I've added an option, BR2_BUILD_OVERLAY_ONLY, that effectively
>deselects BR2_PACKAGE_SKELETON. I've wrapped parts of the skeleton
>makefile in ifeq ($(BR2_PACKAGE_SKELETON),y) and some other parts of the
>build in ifneq ($(BR2_BUILD_OVERLAY_ONLY),y).

>I have another bit not part of the attached patch which is a shell
>script - install-overlay - that does the copying of the overlay into the
>target. It handles overlay directories (as the current buildroot does)
>as well as (compressed) tarballs and a text list of overlays that
>recursively applies the overlays contained in the list.

>Is this something that the buildroot devs thing may be more generally
>useful? If the approach reasonable?

>If overlays are a preferred approach over custom skeletons, perhaps
>some tooling to help build overlays might be useful.

>One future direction I am heading (still some way off) is to use this
>build-overlay feature to build containers that contain just one app, but
>that will need some thought as to how build deps between the base and
>the container overlay work (as well as ldconfig stuff).

>I'd appreciate your comments.

>Note: I've only just updated this patch from two years ago. It seems to
>work with my test builds, but it is possible I've missed something.


>commit 59a1720159119ca36709b6977005188355f94e57
>Author: Cam Hutchison <camh@xdna.net>
>Date:   Fri Jul 17 09:21:17 2015 +1000

>    overlay: Add an option to build an overlay image.
>    
>    An overlay rootfs image contains just what was built for the selected
>    options, and excludes the skeleton and other system files placed into
>    the rootfs. The build image is suitable to use as an overlay for another
>    build.

>diff --git a/Makefile b/Makefile
>index 531ac5d..fed5b79 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -591,6 +591,7 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> 		xargs -r $(STRIPCMD) $(STRIP_STRIP_DEBUG)
> endif
> 
>+ifneq ($(BR2_BUILD_OVERLAY_ONLY),y)
> 	mkdir -p $(TARGET_DIR)/etc
> 	# Mandatory configuration file and auxiliary cache directory
> 	# for recent versions of ldconfig
>@@ -617,6 +618,7 @@ endif
> 		rsync -a --ignore-times $(RSYNC_VCS_EXCLUSIONS) \
> 			--chmod=u=rwX,go=rX --exclude .empty --exclude '*~' \
> 			$(d)/ $(TARGET_DIR)$(sep))
>+endif
> 
> 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> 		$(call MESSAGE,"Executing post-build script $(s)"); \
>diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
>index d1d6711..f8ff8ed 100644
>--- a/package/pkg-generic.mk
>+++ b/package/pkg-generic.mk
>@@ -409,9 +409,11 @@ $(2)_DEPENDENCIES ?= $$(filter-out host-skeleton host-toolchain $(1),\
> 	$$(patsubst host-host-%,host-%,$$(addprefix host-,$$($(3)_DEPENDENCIES))))
> endif
> ifeq ($(4),target)
>+ifeq ($(BR2_PACKAGE_SKELETON),y)
> ifneq ($(1),skeleton)
> $(2)_DEPENDENCIES += skeleton
> endif
>+endif
> ifeq ($$($(2)_ADD_TOOLCHAIN_DEPENDENCY),YES)
> $(2)_DEPENDENCIES += toolchain
> endif
>diff --git a/package/skeleton/Config.in b/package/skeleton/Config.in
>index d25147b..2ec6617 100644
>--- a/package/skeleton/Config.in
>+++ b/package/skeleton/Config.in
>@@ -1,5 +1,5 @@
> config BR2_PACKAGE_SKELETON
> 	bool
>-	default y
>+	default y if !BR2_BUILD_OVERLAY_ONLY
> 	help
> 	  The basic skeleton for your rootfs.
>diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
>index 48e7085..6c8f3e7 100644
>--- a/package/skeleton/skeleton.mk
>+++ b/package/skeleton/skeleton.mk
>@@ -7,6 +7,7 @@
> # source included in buildroot
> SKELETON_SOURCE =
> 
>+ifeq ($(BR2_PACKAGE_SKELETON),y)
> # The skeleton can't depend on the toolchain, since all packages depends on the
> # skeleton and the toolchain is a target package, as is skeleton.
> # Hence, skeleton would depends on the toolchain and the toolchain would depend
>@@ -157,4 +158,6 @@ endif # BR2_INIT_BUSYBOX || BR2_INIT_SYSV
> 
> endif # BR2_ROOTFS_SKELETON_DEFAULT
> 
>+endif # BR2_PACKAGE_SKELETON
>+
> $(eval $(generic-package))
>diff --git a/system/Config.in b/system/Config.in
>index fad829d..13281a6 100644
>--- a/system/Config.in
>+++ b/system/Config.in
>@@ -1,5 +1,22 @@
> menu "System configuration"
> 
>+config BR2_BUILD_OVERLAY_ONLY
>+	bool "Build an overlay-only image"
>+	default n
>+	help
>+	  Build an image to use as an overlay for another build.
>+
>+	  Buildroot supports customizing the target root filesystem
>+	  with overlays, which are parallel directory trees overlaid
>+	  over the root filesystem that buildroot builds.
>+
>+	  If you select yes here, buildroot will build such an image
>+	  overlay without the skeleton parts of the image so that it
>+	  can be overlayed over a standard buildroot rootfs image.
>+	  The post-build and post-image scripts will still be run.
>+
>+if !BR2_BUILD_OVERLAY_ONLY
>+
> config BR2_TARGET_GENERIC_HOSTNAME
> 	string "System hostname"
> 	default "buildroot"
>@@ -409,6 +426,8 @@ config BR2_ROOTFS_OVERLAY
> 	  They are copied as-is into the rootfs, excluding files ending with
> 	  ~ and .git, .svn and .hg directories.
> 
>+endif # !BR2_BUILD_OVERLAY_ONLY
>+
> config BR2_ROOTFS_POST_BUILD_SCRIPT
> 	string "Custom scripts to run before creating filesystem images"
> 	default ""
>diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
>index fcb033c..448809a 100644
>--- a/toolchain/toolchain-external/toolchain-external.mk
>+++ b/toolchain/toolchain-external/toolchain-external.mk
>@@ -741,11 +741,13 @@ endef
> # Even though we're installing things in both the staging, the host
> # and the target directory, we do everything within the
> # install-staging step, arbitrarily.
>+ifneq ($(BR2_BUILD_OVERLAY_ONLY),y)
> define TOOLCHAIN_EXTERNAL_INSTALL_TARGET_CMDS
> 	$(TOOLCHAIN_EXTERNAL_INSTALL_TARGET_LIBS)
> 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FDPIC)
> 	$(TOOLCHAIN_EXTERNAL_INSTALL_BFIN_FLAT)
> 	$(TOOLCHAIN_EXTERNAL_FIXUP_UCLIBCNG_LDSO)
> endef
>+endif
> 
> $(eval $(generic-package))
>_______________________________________________
>buildroot mailing list
>buildroot at busybox.net
>http://lists.busybox.net/mailman/listinfo/buildroot
