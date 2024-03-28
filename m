Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B06F6C54E64
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 14:10:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DBEA40988;
	Thu, 28 Mar 2024 14:10:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2O6uH1y7ZTn4; Thu, 28 Mar 2024 14:10:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C4F415A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C4F415A0;
	Thu, 28 Mar 2024 14:10:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C58051BF3ED
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 14:10:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B225F822A4
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 14:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eq38YEEsDfpz for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 14:10:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=heiko.thiery@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2326082281
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2326082281
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2326082281
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 14:10:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33ed4dd8659so1356949f8f.0
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 07:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711635004; x=1712239804;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6VOXM9uQWkp0lSGH5QSfOGQPmSzdrnOv5H+ECByRSuo=;
 b=lJk/VaLuFWTwePWG2Tb07a6Zz4EO23WAONx/oMuXFEXdSSaE1JeJKGTYxmeZcqr7VQ
 dz5Q3cyc1Qp2yf12Vr8dgO2Hz19feh+g3xdQE+qlvD1K+xWtlHgk3pL/cjPTEFQyj8ok
 BQNLti5JoItfXdJpe4fsgn/U4md/J65NQM7sMLjom8J39Y+KrB5EFiJmqQgL6rd9eFVe
 sRXdPhb+hFJWpUfGlnStAl/5p1rfQDZZAXJ6sgKlDs9P3otK5hm3FVCtzwqFXcvfw7r3
 3RDOqOUq5Ic5TG9DQbvyrI+woBra4v3cnysEBIr7Yd26Ou4fR86xnt705lbEzyZP0TYd
 4L6g==
X-Gm-Message-State: AOJu0Yy3wAaYeGJJ7Odw4B8oquetJVvSSQAU+MenKoHl0Xb/8GIBDZ1Z
 AoXoWSZmtCWb0qRfYWV8G3wv68oez1aSRCZkE1r4PwtbLRlf+7oVWajob++A
X-Google-Smtp-Source: AGHT+IFMS9KjbF4GP/4hKyGwaWqDk5VNzPLInIg/vKr6DlDVUYw2mG3TFp/08NopHEt1xTWw3u5fcg==
X-Received: by 2002:adf:eb0d:0:b0:33e:7fc4:1518 with SMTP id
 s13-20020adfeb0d000000b0033e7fc41518mr2344952wrn.8.1711635004071; 
 Thu, 28 Mar 2024 07:10:04 -0700 (PDT)
Received: from hthiery.kontron.local ([213.135.10.150])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4002000000b00341ce4a3bd6sm1855246wrp.13.2024.03.28.07.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 07:10:03 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 15:09:20 +0100
Message-Id: <20240328140919.157664-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711635004; x=1712239804; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6VOXM9uQWkp0lSGH5QSfOGQPmSzdrnOv5H+ECByRSuo=;
 b=RcrSytdPsVHYBCmgR+x0ZRknYp91iXJic8xgWs0R0U4Y71HwL2zwi+pJe6uXmrgJ/e
 T8G8eutq8/aAQ+A4J3RTwqfKIT/T6OCiZTmnuStbcyjuS2o5dOgR5j+TUa3+kFwhZV5t
 lMylzX+hRuhEFL3POFOaxUzJIUU3xYrgYII5joQwNIq53ERMj7GJ3ewlMe69CawmzVVF
 C2a7QcfIDgjlOjWaBxUsPq9D5nDv+3x+uClZXsqTeMOmBJxxk0u4vElz6BcofLnyxk2S
 lln3tU0V6cWuJ4orLA5a0KfPLDasQ63irHpnW6JUUaTfr3WAGYjoyaezVkDigqZIjpgP
 Ni4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RcrSytdP
Subject: [Buildroot] [PATCH v2] Add
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
BR2_ROOTFS_POST_SCRIPT_ARGS is still passed to the scripts. But now you
can add specfic arguments from the new config option.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---

v2:
 - now add the specific arguments after the ones from BR2_ROOTFS_POST_SCRIPT_ARGS
 - reword the docu
 - reword the commit message

 Makefile                              | 12 +++++--
 docs/manual/customize-post-image.adoc |  5 +++
 docs/manual/customize-rootfs.adoc     |  6 ++++
 fs/common.mk                          |  2 +-
 system/Config.in                      | 52 +++++++++++++++++++++++----
 5 files changed, 67 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 91973cca60..a7d9f9149c 100644
--- a/Makefile
+++ b/Makefile
@@ -584,7 +584,9 @@ $(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
 prepare: $(BUILD_DIR)/buildroot-config/auto.conf
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT)), \
 		$(call MESSAGE,"Executing pre-build script $(s)"); \
-		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(TARGET_DIR) \
+		$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
+		$(call qstrip,$(BR2_ROOTFS_PRE_BUILD_SCRIPT_ARGS))$(sep))

 .PHONY: world
 world: target-post-image
@@ -801,7 +803,9 @@ endif # merged /usr

 	$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
 		@$(call MESSAGE,"Executing post-build script $(s)")$(sep) \
-		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(Q)$(EXTRA_ENV) $(s) $(TARGET_DIR) \
+		$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
+		$(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT_ARGS))$(sep))

 	touch $(TARGET_DIR)/usr

@@ -819,7 +823,9 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize staging-finalize
 	$(Q)mkdir -p $(BINARIES_DIR)
 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT)), \
 		$(call MESSAGE,"Executing post-image script $(s)"); \
-		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
+		$(EXTRA_ENV) $(s) $(BINARIES_DIR) \
+		$(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS)) \
+		$(call qstrip,$(BR2_ROOTFS_POST_IMAGE_SCRIPT_ARGS))$(sep))

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
index 33ca69b933..1bb4c89b36 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -695,20 +695,60 @@ config BR2_ROOTFS_POST_IMAGE_SCRIPT

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
