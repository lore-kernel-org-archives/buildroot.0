Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF79CD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 20:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B5AE400B5;
	Thu, 28 Mar 2024 20:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3hP_ZTdaaWM8; Thu, 28 Mar 2024 20:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 153AA41807
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 153AA41807;
	Thu, 28 Mar 2024 20:48:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 875291BF2F6
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 20:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73DD182951
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 20:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxmfocUvPKZK for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 20:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 793D782605
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 793D782605
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 20:48:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1750384455; Thu, 28 Mar 2024 20:48:30 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 21:47:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 96b3295ca1fc00973fa2754dafb80fe6db23f48f
X-Git-Newrev: b7cc572208f4723e16c3e7a9971fcbe4df988f53
X-Patchwork-Hint: ignore
Message-Id: <20240328204830.1750384455@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Add
 BR2_ROOTFS_{PRE_BUILD|POST_{BUILD|FAKEROOT|IMAGE}}_SCRIPT_ARGS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7cc572208f4723e16c3e7a9971fcbe4df988f53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, one may only specify one list of arguments that are passed to
several scripts (BR2_ROOTFS_PRE_BUILD_SCRIPT, BR2_ROOTFS_POST_BUILD_SCRIPT,
BR2_ROOTFS_POST_FAKEROOT_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS).

So one has to be careful that the arguments for these scripts do noti
collide.

To allow specifiying dedicated arguments to each type of scripts, new
config options are introduced. For backward compatibility the value of
BR2_ROOTFS_POST_SCRIPT_ARGS is still passed to the scripts. But now one
can add specific arguments from the new config option.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
[yann.morin.1998@free.fr:
  - mention common args in help texts
  - slight coding style beautification
  - slight rewording in commit log
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile                              | 15 ++++++++--
 docs/manual/customize-post-image.adoc |  5 ++++
 docs/manual/customize-rootfs.adoc     |  6 ++++
 fs/common.mk                          |  2 +-
 system/Config.in                      | 54 +++++++++++++++++++++++++++++++++--
 5 files changed, 75 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 91973cca60..d1caec63b5 100644
--- a/Makefile
+++ b/Makefile
@@ -584,7 +584,10 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing pre-build script $(s)"); \
-		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) \
+			$(TARGET_DIR) \
+			$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
+			$(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS))$(sep))
 
 .PHONY: world
 world: target-post-image
@@ -801,7 +804,10 @@ endif # merged /usr
 
 	$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		@$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
-		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(Q)$(EXTRA_ENV) $(s) \
+			$(TARGET_DIR) \
+			$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
+			$(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS))$(sep))
 
 	touch $(TARGET_DIR)/usr
 
@@ -819,7 +825,10 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	$(Q)mkdir -p $(BINARIES_DIR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) \
+			$(BINARIES_DIR) \
+			$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
+			$(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS))$(sep))
 
 .PHONY: source
 source: $(foreach p,$(PACKAGES),$(p)-all-source)
diff --git a/docs/manual/customize-post-image.adoc b/docs/manual/customize-post-image.adoc
index 5308093d06..1f11cf915f 100644
--- a/docs/manual/customize-post-image.adoc
+++ b/docs/manual/customize-post-image.adoc
@@ -26,6 +26,11 @@ arguments will be passed to the script too. All the scripts will be
 passed the exact same set of arguments, it is not possible to pass
 different sets of arguments to each script.
 
+Note that the arguments from +BR2_ROOTFS_POST_SCRIPT_ARGS+ will also be
+passed to post-build and post-fakeroot scripts. If you want to use
+arguments that are only used for the post-image scripts you can use
++BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS+.
+
 Again just like for the post-build scripts, the scripts have access to
 the environment variables +BR2_CONFIG+, +HOST_DIR+, +STAGING_DIR+,
 +TARGET_DIR+, +BUILD_DIR+, +BINARIES_DIR+, +CONFIG_DIR+ and
diff --git a/docs/manual/customize-rootfs.adoc b/docs/manual/customize-rootfs.adoc
index d5d8b9288f..1384c1d2d3 100644
--- a/docs/manual/customize-rootfs.adoc
+++ b/docs/manual/customize-rootfs.adoc
@@ -56,6 +56,12 @@ The post-build scripts are run with the main Buildroot tree as current
   passed to the script too. All the scripts will be passed the exact
   same set of arguments, it is not possible to pass different sets of
   arguments to each script.
+
+  Note that the arguments from +BR2_ROOTFS_POST_SCRIPT_ARGS+ will also be
+  passed to post-image and post-fakeroot scripts. If you want to use
+  arguments that are only used for the post-build scripts you can use
+  +BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS+.
+
 +
 In addition, you may also use these environment variables:
 
diff --git a/fs/common.mk b/fs/common.mk
index 37eafac4f7..2f3f8bcc7e 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -182,7 +182,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
-		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
+		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) $$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
 
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
diff --git a/system/Config.in b/system/Config.in
index e590a8a3ff..3fb17ed1c6 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -708,8 +708,56 @@ config BR2_ROOTFS_POST_SCRIPT_ARGS
 	  arguments to each script.
 
 	  Note also, as stated in their respective help text, that the
-	  first argument to each post-build or post-image script is the
-	  target directory / images directory. The arguments in this
-	  option will be passed *after* those.
+	  first argument to each script is the target directory / images
+	  directory. The arguments in this option will be passed *after*
+	  those.
+
+config BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS
+	string "Extra arguments passed to BR2_ROOTFS_PRE_BUILD_SCRIPT"
+	depends on BR2_ROOTFS_PRE_BUILD_SCRIPT != ""
+	help
+	  Pass these additional arguments to the pre-build script.
+
+	  Note also, as stated in the respective help text, that the
+	  first argument to each script is the target directory, then
+	  the common arguments specified in BR2_ROOTFS_POST_SCRIPT_ARGS
+	  above, and then the arguments in this option will be passed
+	  *after* those.
+
+config BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS
+	string "Extra arguments passed to BR2_ROOTFS_POST_BUILD_SCRIPT"
+	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != ""
+	help
+	  Pass these additional arguments to the post-build script.
+
+	  Note also, as stated in the respective help text, that the
+	  first argument to each script is the target directory, then
+	  the common arguments specified in BR2_ROOTFS_POST_SCRIPT_ARGS
+	  above, and then the arguments in this option will be passed
+	  *after* those.
+
+config BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS
+	string "Extra arguments passed to BR2_ROOTFS_POST_FAKEROOT_SCRIPT"
+	depends on BR2_ROOTFS_POST_FAKEROOT_SCRIPT != ""
+	help
+	  Pass these additional arguments to the post-fakeroot script.
+
+	  Note also, as stated in the respective help text, that the
+	  first argument to each script is the target directory, then
+	  the common arguments specified in BR2_ROOTFS_POST_SCRIPT_ARGS
+	  above, and then the arguments in this option will be passed
+	  *after* those.
+
+config BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS
+	string "Extra arguments passed to POST_IMAGE_SCRIPT"
+	depends on BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
+	help
+	  Pass these additional arguments to the post-image script.
+
+	  Note also, as stated in the respective help text, that the
+	  first argument to each script is the images directory, then
+	  the common arguments specified in BR2_ROOTFS_POST_SCRIPT_ARGS
+	  above, and then the arguments in this option will be passed
+	  *after* those.
 
 endmenu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
