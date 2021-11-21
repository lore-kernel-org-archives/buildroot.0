Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B33C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F6EB4021D;
	Mon,  6 Dec 2021 18:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iha0nnG37qIX; Mon,  6 Dec 2021 18:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D660401EF;
	Mon,  6 Dec 2021 18:28:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 19C691BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 289F960D79
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ohwfBcNXZFmE for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7BE2C60D64
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 25BE881504; Mon,  6 Dec 2021 18:07:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 21 Nov 2021 22:25:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d55b228cb39b34164de8026da0642f2c7079cb82
X-Git-Newrev: a5cb09bf621e252091c5eba3982c568c3e4e5adc
X-Patchwork-Hint: ignore
Message-Id: <20211206180741.25BE881504@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: add support for
 mkeficapsule
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
Content-Type: multipart/mixed; boundary="===============6279116600543295075=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6279116600543295075==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a5cb09bf621e252091c5eba3982c568c3e4e5adc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mkeficapsule U-Boot tool can be used to generate UEFI capsule binaries.
Add an option to cross-build it and install it to the target filesystem.
Also, build it and install it unconditionally to the host dir.

Signed-off-by: Vincent Stehlé <vincent.stehle@arm.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/Config.in      |  8 ++++++++
 package/uboot-tools/uboot-tools.mk | 19 ++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/package/uboot-tools/Config.in b/package/uboot-tools/Config.in
index 681f87b45f..e8bbf3a16e 100644
--- a/package/uboot-tools/Config.in
+++ b/package/uboot-tools/Config.in
@@ -66,6 +66,14 @@ config BR2_PACKAGE_UBOOT_TOOLS_MKIMAGE
 	  The mkimage tool from Das U-Boot bootloader, which allows
 	  generation of U-Boot images in various formats.
 
+config BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE
+	bool "mkeficapsule"
+	help
+	  Install the mkeficapsule tool on the target system
+
+	  The mkeficapsule tool from Das U-Boot bootloader, which allows
+	  generation of UEFI capsule binaries.
+
 config BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE
 	bool "mkenvimage"
 	help
diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 81f60963ec..37e329a2af 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -22,6 +22,8 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	touch $(@D)/include/generated/autoconf.h
+	mkdir -p $(@D)/include/asm
+	touch $(@D)/include/asm/linkage.h
 endef
 
 UBOOT_TOOLS_MAKE_OPTS = CROSS_COMPILE="$(TARGET_CROSS)" \
@@ -40,6 +42,10 @@ UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x
 UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE),y)
+UBOOT_TOOLS_MAKE_OPTS += CONFIG_EFI_HAVE_CAPSULE_SUPPORT=y
+endif
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_CHECK_SIGN),y)
 define UBOOT_TOOLS_INSTALL_FIT_CHECK_SIGN
 	$(INSTALL) -m 0755 -D $(@D)/tools/fit_check_sign $(TARGET_DIR)/usr/bin/fit_check_sign
@@ -59,6 +65,12 @@ define UBOOT_TOOLS_INSTALL_MKIMAGE
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKEFICAPSULE),y)
+define UBOOT_TOOLS_INSTALL_MKEFICAPSULE
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkeficapsule $(TARGET_DIR)/usr/bin/mkeficapsule
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_MKENVIMAGE),y)
 define UBOOT_TOOLS_INSTALL_MKENVIMAGE
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(TARGET_DIR)/usr/bin/mkenvimage
@@ -85,6 +97,7 @@ endef
 
 define UBOOT_TOOLS_INSTALL_TARGET_CMDS
 	$(UBOOT_TOOLS_INSTALL_MKIMAGE)
+	$(UBOOT_TOOLS_INSTALL_MKEFICAPSULE)
 	$(UBOOT_TOOLS_INSTALL_MKENVIMAGE)
 	$(UBOOT_TOOLS_INSTALL_FWPRINTENV)
 	$(UBOOT_TOOLS_INSTALL_DUMPIMAGE)
@@ -98,11 +111,14 @@ define HOST_UBOOT_TOOLS_CONFIGURE_CMDS
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
 	touch $(@D)/include/generated/autoconf.h
+	mkdir -p $(@D)/include/asm
+	touch $(@D)/include/asm/linkage.h
 endef
 
 HOST_UBOOT_TOOLS_MAKE_OPTS = HOSTCC="$(HOSTCC)" \
 	HOSTCFLAGS="$(HOST_CFLAGS)" \
-	HOSTLDFLAGS="$(HOST_LDFLAGS)"
+	HOSTLDFLAGS="$(HOST_LDFLAGS)" \
+	CONFIG_EFI_HAVE_CAPSULE_SUPPORT=y
 
 ifeq ($(BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT),y)
 HOST_UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT=y CONFIG_MKIMAGE_DTC_PATH=dtc
@@ -193,6 +209,7 @@ endef
 
 define HOST_UBOOT_TOOLS_INSTALL_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkimage $(HOST_DIR)/bin/mkimage
+	$(INSTALL) -m 0755 -D $(@D)/tools/mkeficapsule $(HOST_DIR)/bin/mkeficapsule
 	$(INSTALL) -m 0755 -D $(@D)/tools/mkenvimage $(HOST_DIR)/bin/mkenvimage
 	$(INSTALL) -m 0755 -D $(@D)/tools/dumpimage $(HOST_DIR)/bin/dumpimage
 	$(HOST_UBOOT_TOOLS_INSTALL_ENVIMAGE)

--===============6279116600543295075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6279116600543295075==--
