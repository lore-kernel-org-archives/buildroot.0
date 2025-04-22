Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34AC7C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C025A6102F;
	Tue, 22 Apr 2025 21:15:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HbO9cmBM-iB; Tue, 22 Apr 2025 21:15:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A2D61025
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2A2D61025;
	Tue, 22 Apr 2025 21:15:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5FC319F
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:15:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4F7340861
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2efvQN1mz6te for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D394040CC4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D394040CC4
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:15:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9F718617B; Tue, 22 Apr 2025 21:15:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 23:15:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 631ab85437d2a3a7291eae687da2f5c5af21caa4
X-Git-Newrev: b59d64c50d3d8bd486ac72a4c71bc3a9dd08e420
X-Patchwork-Hint: ignore
Message-Id: <20250422211536.B9F718617B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-mc-binary: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=b59d64c50d3d8bd486ac72a4c71bc3a9dd08e420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a package which deploys the NXP MC (Management Complex) firmware
to the target. This is necessary for NXP DPAA2 SoCs (LS1088A, LS2080A,
LS2088A, LX2160A).

The MC firmware is deployed by default to the $O/images/ folder, where
it can be used by post-build scripts. Additionally, if
BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH is specified and if the
board mcinitcmd is written as such as to pick it up, it is optionally
deployed to the filesystem.

The API exposed by the MC firmware respects backwards compatibility
principles, which means that the latest firmware version can always be
(and should always be) used on a platform, irrespective of the Linux,
U-Boot, RCW and restool versions, even though the latest features might
not be used by older API consumers.

In terms of forwards compatibility, old MC firmware versions can be
used as long as the qoriq-restool package is built with a
MC_VERSION_COMPATIBLE variable (located in its Makefile, signifying
"minimum compatible version") older than, or equal to it.

If the use of qoriq-restool is not desired (networking objects are
statically created by the DPL), old MC firmware versions are supported
by U-Boot and the Linux kernel with a limited feature set. Thus, it
is still possible to an extent to use firmware versions older than
MC_VERSION_COMPATIBLE.

According to the upstream maintainer, the latest MC firmware version
is identified by the fact that it is always located at the HEAD of the
"master" branch:
https://lore.kernel.org/buildroot/482493f17e63d2b4cb285b50049ed8e6@free.fr/T/#m62c3ec04ba546ac9b0a194d13bc35fedeaa9deb0
Currently, the latest MC firmware version is 10.39.0. This version
should be in sync with the qoriq-mc-utils package.

At this stage, the latest lf-6.12.3-1.0.0 NXP BSP has qoriq-restool with
an MC_VERSION_COMPATIBLE='10.32.0', which means that it supports this MC
firmware version.
https://github.com/nxp-qoriq/restool/blob/lf-6.12.3-1.0.0/Makefile#L23

Note that the MC firmware also used to be distributed through
linux-firmware:
https://web.git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/dpaa2/mc?h=20250311
I don't know what was the reason for doing that, but it stopped being
updated and the versions there are quite old.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/qoriq-mc-binary/Config.in            | 55 ++++++++++++++++++++++++++++
 package/qoriq-mc-binary/qoriq-mc-binary.hash |  3 ++
 package/qoriq-mc-binary/qoriq-mc-binary.mk   | 30 +++++++++++++++
 5 files changed, 90 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9cfdbcc662..9496feaaf1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3388,6 +3388,7 @@ F:	configs/ts5500_defconfig
 
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
+F:	package/qoriq-mc-binary/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 413d30174f..6b4011a2b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -451,6 +451,7 @@ menu "Firmware"
 	source "package/qcom-db410c-firmware/Config.in"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
+	source "package/qoriq-mc-binary/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-binary/Config.in b/package/qoriq-mc-binary/Config.in
new file mode 100644
index 0000000000..6008b6c456
--- /dev/null
+++ b/package/qoriq-mc-binary/Config.in
@@ -0,0 +1,55 @@
+config BR2_PACKAGE_QORIQ_MC_BINARY
+	bool "qoriq-mc-binary"
+	help
+	  The Management Complex (MC) is a key component of the
+	  networking subsystem named DPAA2 (Data Path Acceleration
+	  Architecture, second version) in some NXP Layerscape SoCs.
+
+	  The MC coprocessor runs a closed-source, NXP-supplied
+	  firmware image that simplifies and abstracts the allocation
+	  and configuration of the networking hardware primitives into
+	  DPAA2 "objects".
+
+	  https://github.com/nxp-qoriq/qoriq-mc-binary
+
+if BR2_PACKAGE_QORIQ_MC_BINARY
+choice
+	prompt "QorIQ MC firmware target"
+	help
+	  Select the target SoC for the QorIQ MC firmware.
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS1088A
+	bool "ls1088a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2080A
+	bool "ls2080a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2088A
+	bool "ls2088a"
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+	bool "lx2160a"
+
+endchoice
+
+config BR2_QORIQ_MC_BINARY_PLATFORM
+	string
+	default "ls1088a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS1088A
+	default "ls2080a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2080A
+	default "ls2088a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LS2088A
+	default "lx2160a" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+
+config BR2_QORIQ_MC_BINARY_SUBDIR
+	string
+	default "lx216xa" if BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_LX2160A
+	default BR2_QORIQ_MC_BINARY_PLATFORM
+
+config BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH
+	string "Path on target to install MC firmware"
+	help
+	  The MC firmware can optionally be deployed to the target
+	  filesystem at the path specified here. This is useful if
+	  the mcinitcmd U-Boot environment variable is configured
+	  to load the MC firmware from the filesystem.
+
+endif
diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.hash b/package/qoriq-mc-binary/qoriq-mc-binary.hash
new file mode 100644
index 0000000000..ccddff28cd
--- /dev/null
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  912ad8effd5c7b08eb277719b1e021b8b1fe4022dc3d961b419562e1d2d7a860  qoriq-mc-binary-10.39.0.tar.gz
+sha256  7733839334c6c820f01f76bff7ee9b60411effdcee8b6017e1d5bcacbdb432f6  LICENSE
diff --git a/package/qoriq-mc-binary/qoriq-mc-binary.mk b/package/qoriq-mc-binary/qoriq-mc-binary.mk
new file mode 100644
index 0000000000..68f00eda20
--- /dev/null
+++ b/package/qoriq-mc-binary/qoriq-mc-binary.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# qoriq-mc-binary
+#
+################################################################################
+
+QORIQ_MC_BINARY_VERSION = 10.39.0
+QORIQ_MC_BINARY_SITE = $(call github,nxp-qoriq,qoriq-mc-binary,mc_release_$(QORIQ_MC_BINARY_VERSION))
+QORIQ_MC_BINARY_LICENSE = NXP Binary EULA
+QORIQ_MC_BINARY_LICENSE_FILES = LICENSE
+QORIQ_MC_BINARY_INSTALL_IMAGES = YES
+
+QORIQ_MC_BINARY_PLATFORM = $(call qstrip,$(BR2_QORIQ_MC_BINARY_PLATFORM))
+QORIQ_MC_BINARY_SUBDIR = $(call qstrip,$(BR2_QORIQ_MC_BINARY_SUBDIR))
+QORIQ_MC_BINARY_BIN = mc_$(QORIQ_MC_BINARY_PLATFORM)_$(QORIQ_MC_BINARY_VERSION).itb
+QORIQ_MC_BINARY_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_BINARY_TARGET_INSTALL_PATH))
+
+ifeq ($(QORIQ_MC_BINARY_TARGET_INSTALL_PATH),)
+QORIQ_MC_BINARY_INSTALL_TARGET = NO
+endif
+
+define QORIQ_MC_BINARY_INSTALL_IMAGES_CMDS
+	$(INSTALL) -D $(@D)/$(QORIQ_MC_BINARY_SUBDIR)/$(QORIQ_MC_BINARY_BIN) $(BINARIES_DIR)/mc.itb
+endef
+
+define QORIQ_MC_BINARY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D $(@D)/$(QORIQ_MC_BINARY_SUBDIR)/$(QORIQ_MC_BINARY_BIN) $(TARGET_DIR)/$(QORIQ_MC_BINARY_INSTALL_PATH)/mc.itb
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
