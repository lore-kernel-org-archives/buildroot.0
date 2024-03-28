Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13DB3C54E67
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 12:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 426B2402DC;
	Thu, 28 Mar 2024 12:28:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F-BLIanbHNVP; Thu, 28 Mar 2024 12:28:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C61A440523
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C61A440523;
	Thu, 28 Mar 2024 12:28:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59E8D1BF3C3
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 12:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 464D1402E8
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 12:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x1Zngf1JK0f3 for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 12:28:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A79B5402EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79B5402EB
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A79B5402EB
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 12:28:49 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-41543b772e6so6727275e9.2
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 05:28:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711628927; x=1712233727;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sS3MtXZdADhO1IZOV4jByiwe+q4ZHuGHYYiYzETtpDc=;
 b=MCKDDbxj5+GLfKaURunsdDkOIiZUr0banlObYeaQ1y19fH57Zf5degI6KramKRBrs4
 s0rB52C8HMs1mz9s9RTEwfVYiNX/5xIDyY7SX2AVSUDG5mzZBzCvjDL5FEFda8hyROI9
 3hv5gQj2mXWTwZqTRxcJ/o365402EfHGj2Tk/PDgzxG3sl9F1zA9j2J74F/lsnRLyAUy
 d8Yg3lOSMt1BbWrMYRLaD5/7tw6rWNA0ao3Xa6uhYSeEmg3J8b92CbX1oWUMG0YwkIO7
 mJbLZWvVOdLnG0TzYdKSFODnUT87wAvkfUAwOJwb3Fs8TVlQaE0n3Bq2aDoiVRRM17cQ
 QUNg==
X-Gm-Message-State: AOJu0YyG5rnbip5YHQARR+ORP5uBKhptSTvfwOfTHpFHg2UJM8Q9z7xJ
 nNhKB1IbZ/oz4UxXCgICWiALq8TgKnvgCMbwIZ3jsu/xS/vTKYd2PB0ktFx2
X-Google-Smtp-Source: AGHT+IHc3whvp9SvbZ1H7OTDHCGUv1v1LHSRfSi/Jdz5jpCpIQbaMgYIxdxUaeX//ug4bm1lJhPulA==
X-Received: by 2002:a5d:46c4:0:b0:33e:7fbd:5a1f with SMTP id
 g4-20020a5d46c4000000b0033e7fbd5a1fmr2562675wrs.62.1711628926804; 
 Thu, 28 Mar 2024 05:28:46 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 bp8-20020a5d5a88000000b00343300a4eb8sm1302960wrb.49.2024.03.28.05.28.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 05:28:46 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 13:28:19 +0100
Message-Id: <20240328122818.139194-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711628927; x=1712233727; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sS3MtXZdADhO1IZOV4jByiwe+q4ZHuGHYYiYzETtpDc=;
 b=a/sYMkaMhZQM2E5A5BI2L7tEKNalLFdAo1ojiCjuKGdnrizF58DzHeYtiRAenAIAer
 ArWIYTup6EL5Ez7EgF5I5R+JfnjWphRHnYzhA8L1G8pwRjvOLnhhiwUnVfsX/S2GMnmU
 mkEEq33GS1JDP6+n/pACPnpbyth39eAbcj2g6aDypfzqLDeu6l1w4ICEUb0Xeoz24LVH
 8aIYxo/NLlN3XGDezJTtBYUXgbYuFf6QpF/bpOa2+9QsEKNQqVN1aHdXks6MbCEDNADw
 faiMUkGDB8gHCn3cIjwiUZWiIzifp30whxyPR776B3br7uaKSPU/DfvkfszHRLmT2837
 CzJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=a/sYMkaM
Subject: [Buildroot] [PATCH] Add
 BR2_ROOTFS_POST_{PRE_BUILD|POST_BUILD|FAKEROOT|IMAGE}_SCRIPT_ARGS
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michael Walle <michael@walle.cc>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

You only can specify one list of arguments that are passed to several
scripts (BR2_ROOTFS_PRE_BUILD_SCRIPT, BR2_ROOTFS_POST_BUILD_SCRIPT,
BR2_ROOTFS_POST_FAKEROOT_SCRIPT and BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS).

So you have to be careful that the arguments for these scripts do not collide.

To allow specifiying dedicated arguments to each of the script the new
config options are introduced. For backward compatibility the value of
BR2_ROOTFS_POST_SCRIPT_ARGS is passed to the scripts in case the
specific argument values are not present.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 Makefile                              |  9 ++--
 docs/manual/customize-post-image.adoc |  5 +++
 docs/manual/customize-rootfs.adoc     |  6 +++
 fs/common.mk                          |  2 +-
 system/Config.in                      | 64 ++++++++++++++++++++++++---
 5 files changed, 76 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 91973cca60..b2fd3e881b 100644
--- a/Makefile
+++ b/Makefile
@@ -584,7 +584,8 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing pre-build script $(s)"); \
-		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) \
+		$(if $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)))$(sep))
 
 .PHONY: world
 world: target-post-image
@@ -801,7 +802,8 @@ endif # merged /usr
 
 	$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		@$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
-		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) \
+		$(if $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)))$(sep))
 
 	touch $(TARGET_DIR)/usr
 
@@ -819,7 +821,8 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	$(Q)mkdir -p $(BINARIES_DIR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(BINARIES_DIR) \
+		$(if $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS)),$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)))$(sep))
 
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
index 37eafac4f7..b3fdc28f1d 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -182,7 +182,7 @@ $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): $$(ROOTFS_$(2)_DEPENDENCIES)
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
 	$$(foreach s,$$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT)),\
 		echo "echo '$$(TERM_BOLD)>>>   Executing fakeroot script $$(s)$$(TERM_RESET)'" >> $$(FAKEROOT_SCRIPT); \
-		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(BR2_ROOTFS_POST_SCRIPT_ARGS) >> $$(FAKEROOT_SCRIPT)$$(sep))
+		echo $$(EXTRA_ENV) $$(s) $$(TARGET_DIR) $$(if $$(call qstrip,$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS)),$$(BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS),$$(BR2_ROOTFS_POST_SCRIPT_ARGS)) >> $$(FAKEROOT_SCRIPT)$$(sep))
 
 	$$(foreach hook,$$(ROOTFS_$(2)_PRE_GEN_HOOKS),\
 		$$(call PRINTF,$$($$(hook))) >> $$(FAKEROOT_SCRIPT)$$(sep))
diff --git a/system/Config.in b/system/Config.in
index 33ca69b933..1a0b904a4b 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -695,20 +695,72 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT
 
 config BR2_ROOTFS_POST_SCRIPT_ARGS
 	string "Extra arguments passed to custom scripts"
-	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
+	depends on BR2_ROOTFS_PRE_BUILD_SCRIPT != "" \
+	        || BR2_ROOTFS_POST_BUILD_SCRIPT != "" \
 		|| BR2_ROOTFS_POST_FAKEROOT_SCRIPT != "" \
 		|| BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
 	help
-	  Pass these additional arguments to each post-build or
-	  post-image scripts.
+	  Pass these additional arguments to each pre-build, post-build,
+	  post-fakeroot and post-image scripts.
 
 	  Note that all the post-build and post-image scripts will be
 	  passed the same set of arguments, you can not pass different
 	  arguments to each script.
 
 	  Note also, as stated in their respective help text, that the
-	  first argument to each post-build or post-image script is the
-	  target directory / images directory. The arguments in this
-	  option will be passed *after* those.
+	  first argument to each script is the target directory / images
+	  directory. The arguments in this option will be passed *after* those.
+
+config BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS
+	string "Extra arguments passed to BR2_ROOTFS_PRE_BUILD_SCRIPT"
+	depends on BR2_ROOTFS_PRE_BUILD_SCRIPT != ""
+	help
+	  Pass these additional arguments to the pre-build script.
+
+	  Note that BR2_ROOTFS_POST_SCRIPT_ARGS is ignored for pre-build
+	  scripts if this option is set.
+
+	  Note also, as stated in the respective help text, that the
+	  first argument to each script is the target directory.
+	  The arguments in this option will be passed *after* those.
+
+config BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS
+	string "Extra arguments passed to BR2_ROOTFS_POST_BUILD_SCRIPT"
+	depends on BR2_ROOTFS_POST_BUILD_SCRIPT != ""
+	help
+	  Pass these additional arguments to the post-build script.
+
+	  Note that BR2_ROOTFS_POST_SCRIPT_ARGS is ignored for post-build
+	  scripts if this option is set.
+
+	  Note also, as stated in the respective help text, that the
+	  first argument to each script is the target directory.
+	  The arguments in this option will be passed *after* those.
+
+config BR2_ROOTFS_POST_FAKEROOT_SCRIPT_ARGS
+	string "Extra arguments passed to BR2_ROOTFS_POST_FAKEROOT_SCRIPT"
+	depends on BR2_ROOTFS_POST_FAKEROOT_SCRIPT != ""
+	help
+	  Pass these additional arguments to the post-fakeroot script.
+
+	  Note that BR2_ROOTFS_POST_SCRIPT_ARGS is ignored for post-fakeroot
+	  scripts if this option is set.
+
+	  Note also, as stated in the respective help text, that the
+	  first argument to each script is the target directory.
+	  The arguments in this option will be passed *after* those.
+
+config BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS
+	string "Extra arguments passed to POST_IMAGE_SCRIPT"
+	depends on BR2_ROOTFS_POST_IMAGE_SCRIPT != ""
+	help
+	  Pass these additional arguments to the post-image script.
+
+	  Note that BR2_ROOTFS_POST_SCRIPT_ARGS is ignored for post-image
+	  scripts if this option is set.
+
+	  Note also, as stated in the respective help text, that the
+	  first argument to each script is the images directory.
+	  The arguments in this option will be passed *after* those.
 
 endmenu
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
