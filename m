Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175F7C4338F
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4D6F60FA0
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:42:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4D6F60FA0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFDD0404EF;
	Tue, 17 Aug 2021 08:42:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r8-irwMq1SAR; Tue, 17 Aug 2021 08:42:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 539CE4052F;
	Tue, 17 Aug 2021 08:42:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B2F081BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2B67404C4
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hx9NnqnibXGj for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:40:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC6B84025A
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:40:17 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id 309321BF20D;
 Tue, 17 Aug 2021 08:40:14 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:25 +0200
Message-Id: <20210817083930.3718711-12-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 11/16] package/pkg-generic.mk: fix
 per-package <pkg>-{reconfigure, rebuild, reinstall}
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Many overwrites are detected on <pkg>-{reconfigure,rebuild,reinstall}.
Indeed, files previously installed by a package were detected as
overwritten on next reconfigure, rebuild or reinstall.

To avoid this, we recreate per-package host and target dir from
scratch as it was done during the first configure step.

In order not to duplicate the code, this commit shares common code
in prepare-pre-configure macro.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
Changes v1 to v2:
 - Avoid code duplication using prepare-pre-configure macro

Changes v2 to v3:
None

 package/pkg-generic.mk | 40 ++++++++++++++++++++++++++++++----------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 4226cfe0dc..fb219b8ec7 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -217,6 +217,21 @@ define REMOVE_CONFLICTING_USELESS_FILES_IN_TARGET
 	$(call remove-conflicting-useless-files,$(TARGET_DIR))
 endef
 
+# Function to prepare package
+
+define prepare-pre-configure
+	@$(call pkg_final_rsync_before,$(TARGET_DIR))
+	@$(call pkg_final_rsync_before,$(HOST_DIR),-host)
+	@$(call pkg_size_before,$(TARGET_DIR))
+	@$(call pkg_size_before,$(STAGING_DIR),-staging)
+	@$(call pkg_size_before,$(HOST_DIR),-host)
+	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
+	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
+	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
+	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
+	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
+endef
+
 ################################################################################
 # Implicit targets -- produce a stamp file for each step of a package build
 ################################################################################
@@ -314,16 +329,7 @@ $(BUILD_DIR)/%/.stamp_configured:
 	@$(call MESSAGE,"Configuring")
 	$(Q)mkdir -p $(HOST_DIR) $(TARGET_DIR) $(STAGING_DIR) $(BINARIES_DIR)
 	$(call prepare-per-package-directory,$($(PKG)_FINAL_DEPENDENCIES))
-	@$(call pkg_final_rsync_before,$(TARGET_DIR))
-	@$(call pkg_final_rsync_before,$(HOST_DIR),-host)
-	@$(call pkg_size_before,$(TARGET_DIR))
-	@$(call pkg_size_before,$(STAGING_DIR),-staging)
-	@$(call pkg_size_before,$(HOST_DIR),-host)
-	$(call fixup-libtool-files,$(NAME),$(HOST_DIR))
-	$(call fixup-libtool-files,$(NAME),$(STAGING_DIR))
-	$(foreach hook,$($(PKG)_POST_PREPARE_HOOKS),$(call $(hook))$(sep))
-	@$(call pkg_detect_overwrite_before,$(TARGET_DIR))
-	@$(call pkg_detect_overwrite_before,$(HOST_DIR),-host)
+	$(call prepare-pre-configure)
 	$(foreach hook,$($(PKG)_PRE_CONFIGURE_HOOKS),$(call $(hook))$(sep))
 	$($(PKG)_CONFIGURE_CMDS)
 	$(foreach hook,$($(PKG)_POST_CONFIGURE_HOOKS),$(call $(hook))$(sep))
@@ -488,6 +494,13 @@ define pkg-graph-depends
 		$$(GRAPHS_DIR)/$$(@).dot
 endef
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define empty-per-package-directory
+	rm -rf $(HOST_DIR) $(TARGET_DIR)
+	mkdir -p $(HOST_DIR) $(TARGET_DIR)
+endef
+endif
+
 ################################################################################
 # inner-generic-package -- generates the make targets needed to build a
 # generic package
@@ -1092,6 +1105,8 @@ $(1)-all-legal-info:	$$(foreach p,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(p)-all-lega
 
 $(1)-dirclean:		$$($(2)_TARGET_DIRCLEAN)
 
+$(1)-clean-for-reinstall: PKG=$(2)
+$(1)-clean-for-reinstall: NAME=$(1)
 $(1)-clean-for-reinstall:
 ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 			rm -f $$($(2)_TARGET_RSYNC)
@@ -1101,6 +1116,11 @@ endif
 			rm -f $$($(2)_TARGET_INSTALL_TARGET)
 			rm -f $$($(2)_TARGET_INSTALL_IMAGES)
 			rm -f $$($(2)_TARGET_INSTALL_HOST)
+			$$(call empty-per-package-directory)
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_DOWNLOAD_DEPENDENCIES))
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_EXTRACT_DEPENDENCIES))
+			$$(call prepare-per-package-directory,$$($(2)_FINAL_DEPENDENCIES))
+			$$(call prepare-pre-configure)
 
 $(1)-reinstall:		$(1)-clean-for-reinstall $(1)
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
