Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49149C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:04:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7041E61159
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 13:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7041E61159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F34583486;
	Tue, 21 Sep 2021 13:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sNKEXIu4l4_B; Tue, 21 Sep 2021 13:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7562E8330B;
	Tue, 21 Sep 2021 13:04:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8FF7F1BF995
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FAB1402A0
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 13:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hq-XP9kBuDB4 for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 13:03:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36EC2401F3
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:03:34 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 2E79324000A;
 Tue, 21 Sep 2021 13:03:31 +0000 (UTC)
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 15:03:22 +0200
Message-Id: <20210921130326.3462783-6-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
References: <20210921130326.3462783-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/8] package/sunxi-mali-mainline: add support
 for different outputs
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Adds support for selecting one of the four display API supported: fbdev,
wayland, x11-dmabuf, x11-ump.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 package/sunxi-mali-mainline/Config.in         | 26 ++++++++++++++++
 .../sunxi-mali-mainline.mk                    | 30 +++++++++++++++++--
 2 files changed, 53 insertions(+), 3 deletions(-)

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
index b46f572311..e9091b05a2 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
@@ -21,22 +21,46 @@ else ifeq ($(BR2_aarch64),y)
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
+	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/gbm.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gbm.pc
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
