Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F9BC433EF
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:53:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D86C610EA
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 09:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3D86C610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1751A60F75;
	Thu,  7 Oct 2021 09:53:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDh6A5t80T2W; Thu,  7 Oct 2021 09:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C0DD60F74;
	Thu,  7 Oct 2021 09:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 177DC1BF873
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04CE4403A4
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 09:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5UmcLqnrMfsz for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 09:52:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5698B4039A
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 09:52:00 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id E5B7C40008;
 Thu,  7 Oct 2021 09:51:57 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 11:51:44 +0200
Message-Id: <20211007095147.688449-4-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
References: <20211007095147.688449-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 4/7] package/sunxi-mali-mainline: add support
 for different outputs
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Adds support for selecting one of the four display API supported: fbdev,
wayland, x11-dmabuf, x11-ump.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
Changes v2 -> v3:
 - Moved gbm.pc install into patch 5/7

 package/sunxi-mali-mainline/Config.in         | 26 +++++++++++++++++
 .../sunxi-mali-mainline.mk                    | 28 +++++++++++++++++--
 2 files changed, 51 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
index a2fb95bd79..31a9152407 100644
--- a/package/sunxi-mali-mainline/Config.in
+++ b/package/sunxi-mali-mainline/Config.in
@@ -17,6 +17,24 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "sunxi-mali-mainline"
 
+choice
+	prompt "Output"
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
+	bool "fbdev"
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
+	bool "wayland"
+	depends on BR2_PACKAGE_WAYLAND
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
+	bool "x11 dma-buf"
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_UMP
+	bool "x11 ump"
+
+endchoice
+
 choice
 	prompt "Version"
 	default BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
@@ -27,9 +45,17 @@ config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
 	bool "r6p2"
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
 	bool "r8p1"
+	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
 
 endchoice
 
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT
+	string
+	default "fbdev"		if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_FBDEV
+	default "wayland"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND
+	default "x11_dma_buf" 	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF
+	default "x11_ump"     	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_UMP
+
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION
 	string
 	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
index b46f572311..e058b5c3cd 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -21,22 +21,44 @@ else ifeq ($(BR2_aarch64),y)
 SUNXI_MALI_MAINLINE_ARCH=arm64
 endif
 
+SUNXI_MALI_MAINLINE_OUTPUT = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT))
+SUNXI_MALI_MAINLINE_LIB_SUBDIR = \
+	$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/$(SUNXI_MALI_MAINLINE_OUTPUT)
+
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_DMABUF)$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_X11_UMP),y)
+SUNXI_MALI_MAINLINE_INCLUDE_SUBDIR = include/x11
+else
+SUNXI_MALI_MAINLINE_INCLUDE_SUBDIR = \
+	include/$(SUNXI_MALI_MAINLINE_OUTPUT)
+define SUNXI_MALI_MAINLINE_FIXUP_EGL_PC
+	$(SED) "s/Cflags: /Cflags: -DMESA_EGL_NO_X11_HEADERS /" \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE_OUTPUT_WAYLAND),y)
+SUNXI_MALI_MAINLINE_DEPENDENCIES += wayland
+endif
+
+# FIXME: install gbm.pc conditionally
 define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
 
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
+	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_LIB_SUBDIR)/*.so* \
 		$(STAGING_DIR)/usr/lib/
-	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
+	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_INCLUDE_SUBDIR)/* \
+		$(STAGING_DIR)/usr/include/
 
 	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
 	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+	$(SUNXI_MALI_MAINLINE_FIXUP_EGL_PC)
 endef
 
 define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
+	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_LIB_SUBDIR)/*.so* \
 		$(TARGET_DIR)/usr/lib/
 endef
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
