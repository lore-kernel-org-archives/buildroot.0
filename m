Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C88C6FD18
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 21:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E329B60E59;
	Sun, 23 Apr 2023 21:40:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E329B60E59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nGrXurHk3YtY; Sun, 23 Apr 2023 21:40:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C4D160E33;
	Sun, 23 Apr 2023 21:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C4D160E33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B1F831C2B11
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 21:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9865A60E33
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 21:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9865A60E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrW1zbG3brhK for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 21:40:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBD060A6D
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBBD060A6D
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 21:40:18 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqhRP-00AYkr-Ka; Sun, 23 Apr 2023 23:40:15 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 9e213048;
 Sun, 23 Apr 2023 21:40:14 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 00:40:14 +0300
Message-Id: <20230423214014.2963361-1-aperez@igalia.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5TPaiYAvZYTSDYFrjIS7Uy0FvfTj91ylSIVovFEO89I=; b=USY9yAPz+tvUAdI871KSJzBRcI
 aR3vdaHOij63VNJkr0ZQ0MQnoY94PrjN4JvfOx06s0IyVo7sIGcu755W1+f0SVCO2NXsItGa/wY5R
 cTnxcHN6EPJWaifitlSLy8N7ea8vfcv7hq10Q6lRAAbHXqmyfInpFSSo9163czED2RC1muhSGzLli
 wuVChPTNl2gBi0fO3FdjcC+9fIu5ge1ks/FmNPB7C4aziNiPNYz5H0BCKPHZDcNQ9T+oBktumHWXK
 PwH9ss2/MQthOB6Tc09Zklor7GEU2AOIfR9QGrYD54YzDWPIsH+Uq4e+gSUi4B7Lox10uROZsTky3
 MEwXQpJg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=USY9yAPz
Subject: [Buildroot] [PATCH] package/sunxi-mali-utgard: support the wayland
 driver
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a choice to allow using the Wayland variant of the Mali driver. When
selected, the package is marked as provider for libgbm as libMali.so
includes the symbols and a libgbm.so symlink is installed; and both
BR2_PACKAGE_HAS_{LIBGBM,LIBEGL_WAYLAND} are selected accordingly.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/sunxi-mali-utgard/Config.in           | 23 +++++++++++++++++++
 .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 18 ++++++++++++---
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
index 59ac21f5ab..0856f220fd 100644
--- a/package/sunxi-mali-utgard/Config.in
+++ b/package/sunxi-mali-utgard/Config.in
@@ -18,6 +18,9 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "sunxi-mali-utgard"
 
+config BR2_PACKAGE_PROVIDES_LIBGBM
+	default "sunxi-mali-utgard" if BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
+
 choice
 	prompt "Version"
 	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2 if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2 # legacy
@@ -38,6 +41,26 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION
 	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
 	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
 
+choice
+	prompt "Platform"
+	default BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
+	help
+	  Select the target EGL platform.
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
+	bool "fbdev"
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
+	bool "wayland"
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_HAS_LIBGBM
+
+endchoice
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM
+	string
+	default "fbdev" if BR2_PACKAGE_SUNXI_MALI_UTGARD_FBDEV
+	default "wayland" if BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
+
 endif
 
 comment "sunxi-mali-utgard needs an EABIhf glibc toolchain"
diff --git a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
index f693667955..23c6e8ec6e 100644
--- a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
+++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
@@ -24,9 +24,9 @@ endif
 define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
 
-	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/*.so* \
 		$(STAGING_DIR)/usr/lib/
-	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
+	cp -rf $(@D)/include/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/* $(STAGING_DIR)/usr/include/
 
 	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
@@ -34,9 +34,21 @@ define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
 		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
 endef
 
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND),y)
+define SUNXI_MALI_UTGARD_INSTALL_FIXUP_STAGING_PC_FILES
+	sed -e '/^Cflags:/s/$$/ -DWL_EGL_PLATFORM/' \
+		-e '/^Requires:/s/$$/ wayland-client wayland-server/' \
+		-i $(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	sed -e '/^Requires:/s/$$/ wayland-client wayland-server/' \
+		-i $(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+SUNXI_MALI_UTGARD_POST_INSTALL_TARGET_HOOKS += SUNXI_MALI_UTGARD_INSTALL_FIXUP_STAGING_PC_FILES
+SUNXI_MALI_UTGARD_DEPENDENCIES += wayland
+endif
+
 define SUNXI_MALI_UTGARD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM)/*.so* \
 		$(TARGET_DIR)/usr/lib/
 endef
 
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
