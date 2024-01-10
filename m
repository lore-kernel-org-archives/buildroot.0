Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DBDC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 21:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58CC8400C1;
	Wed, 10 Jan 2024 21:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58CC8400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vx23JZmYx416; Wed, 10 Jan 2024 21:33:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37D98436D7;
	Wed, 10 Jan 2024 21:33:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37D98436D7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B41EC1BF2CA
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DA544158F
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 21:33:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA544158F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SOYHa4303oQN for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 21:33:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DEE141511
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 21:33:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DEE141511
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68C5485E0D; Wed, 10 Jan 2024 21:33:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 22:33:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9d8497e79de3ced144877ba6ee38cc5b7181aaeb
X-Git-Newrev: 6fc32c5697c5eb99c7eb4607e39eb192b9f1cf43
X-Patchwork-Hint: ignore
Message-Id: <20240110213324.68C5485E0D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sunxi-mali-utgard: support the
 wayland driver
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6fc32c5697c5eb99c7eb4607e39eb192b9f1cf43
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a choice to allow using the Wayland variant of the r6p2 Mali driver.
When selected, the package is marked as provider for libgbm as
libMali.so includes the symbols and a libgbm.so symlink is installed;
and both BR2_PACKAGE_HAS_{LIBGBM,LIBEGL_WAYLAND} are selected
accordingly.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-utgard/Config.in            | 29 ++++++++++++++++++++++++++
 package/sunxi-mali-utgard/sunxi-mali-utgard.mk | 19 ++++++++++++++---
 2 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
index 59ac21f5ab..f70a6f645c 100644
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
@@ -38,6 +41,32 @@ config BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION
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
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_WAYLAND
+	bool "wayland"
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	select BR2_PACKAGE_HAS_LIBEGL_WAYLAND
+	select BR2_PACKAGE_HAS_LIBGBM
+	select BR2_PACKAGE_WAYLAND
+
+comment "wayland support requires version r6p2"
+	depends on !BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
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
index f693667955..cd03ad62f7 100644
--- a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
+++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
@@ -14,6 +14,7 @@ SUNXI_MALI_UTGARD_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
 SUNXI_MALI_UTGARD_LICENSE_FILES = $(SUNXI_MALI_UTGARD_EULA_NO_SPACES)
 
 SUNXI_MALI_UTGARD_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION))
+SUNXI_MALI_UTGARD_PLATFORM = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_UTGARD_PLATFORM))
 
 ifeq ($(BR2_arm),y)
 SUNXI_MALI_UTGARD_ARCH=arm
@@ -24,9 +25,9 @@ endif
 define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
 	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
 
-	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(SUNXI_MALI_UTGARD_PLATFORM)/*.so* \
 		$(STAGING_DIR)/usr/lib/
-	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
+	cp -rf $(@D)/include/$(SUNXI_MALI_UTGARD_PLATFORM)/* $(STAGING_DIR)/usr/include/
 
 	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/egl.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
@@ -34,9 +35,21 @@ define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
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
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/$(SUNXI_MALI_UTGARD_PLATFORM)/*.so* \
 		$(TARGET_DIR)/usr/lib/
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
