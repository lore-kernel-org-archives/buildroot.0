Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44E3C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 21:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DF8640944;
	Tue, 22 Apr 2025 21:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8-TSF-13NjYw; Tue, 22 Apr 2025 21:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16BFD406D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 16BFD406D9;
	Tue, 22 Apr 2025 21:52:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E72C91BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CD26D411A1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id am-PrWzXNR3z for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 21:52:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D3595401A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3595401A2
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 21:52:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B89A0861BE; Tue, 22 Apr 2025 21:52:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Apr 2025 23:52:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3154fd8ee1b51b245d63bbab06c71bf8185819a2
X-Git-Newrev: 4440f8a24521c91a80cbff6166d9afe98d8190e2
X-Patchwork-Hint: ignore
Message-Id: <20250422215226.B89A0861BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-mc-utils: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=4440f8a24521c91a80cbff6166d9afe98d8190e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The configuration files for the MC firmware binary are distributed
through a separate repository on GitHub, and need a different package.
They are licensed differently than the firmware itself, and unlike the
firmware, they are customizable.

There are two ways for a board to use this package - similar to
qoriq-rcw. If it is an NXP reference board or if the example files
otherwise work fine with it, it is recommended to set the _INTREE
variables to select a pre-existing DPL and DPC. Otherwise, if it is a
custom board, the best solution is to just provide the DPL and DPC dts
files in board/, and set the _CUSTOM_PATH variables to point to them.

There are also two ways to deploy to the target.

Traditionally in NXP BSPs, U-Boot loads the MC firmware, DPL and DPC
from given offsets in the storage medium (outside of the filesystem).
But this is not hardcoded and it doesn't have to be the case - the
mcinitcmd U-Boot environment variable is freely customizable. What can
also be done, and is done for the LX2160A-RDB, is to deploy multiple DPL
and DPC files (all the files available for a board) to a folder of the
rootfs, and just have two symlinks: dpl.dtb and dpc.dtb which point to
the currently active files. This makes easier the processes of
upgrading, downgrading and keeping multiple file versions.

Nonetheless, the "traditional" method of deploying to the target is also
possible. The selected DPL and DPC files are deployed to the "images"
folder and are freely usable with genimage or other post-image scripts.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/qoriq-mc-utils/Config.in           | 76 ++++++++++++++++++++++++++++++
 package/qoriq-mc-utils/qoriq-mc-utils.hash |  3 ++
 package/qoriq-mc-utils/qoriq-mc-utils.mk   | 44 +++++++++++++++++
 5 files changed, 125 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 9496feaaf1..2862dd7b49 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3389,6 +3389,7 @@ F:	configs/ts5500_defconfig
 N:	Vladimir Oltean <olteanv@gmail.com>
 F:	package/qoriq-ddr-phy-binary/
 F:	package/qoriq-mc-binary/
+F:	package/qoriq-mc-utils/
 
 N:	Volkov Viacheslav <sv99@inbox.ru>
 F:	package/v4l2grab/
diff --git a/package/Config.in b/package/Config.in
index 6b4011a2b5..27ee4b4c32 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -452,6 +452,7 @@ menu "Firmware"
 	source "package/qoriq-ddr-phy-binary/Config.in"
 	source "package/qoriq-fm-ucode/Config.in"
 	source "package/qoriq-mc-binary/Config.in"
+	source "package/qoriq-mc-utils/Config.in"
 	source "package/rcw-smarc-sal28/Config.in"
 	source "package/rpi-firmware/Config.in"
 	source "package/sunxi-boards/Config.in"
diff --git a/package/qoriq-mc-utils/Config.in b/package/qoriq-mc-utils/Config.in
new file mode 100644
index 0000000000..7444aef4c3
--- /dev/null
+++ b/package/qoriq-mc-utils/Config.in
@@ -0,0 +1,76 @@
+config BR2_PACKAGE_QORIQ_MC_UTILS
+	bool "qoriq-mc-utils"
+	select BR2_PACKAGE_HOST_DTC
+	help
+	  The Management Complex (MC) is a key component of the
+	  networking subsystem named DPAA2 (Data Path Acceleration
+	  Architecture, second version) in some NXP Layerscape SoCs.
+
+	  The MC firmware is configured through two distinct files
+	  named DPL and DPC, which are customizable by the end user.
+	  Example configuration files for NXP reference boards are
+	  distributed through this package, and are frequently patched
+	  to produce the configuration required in other scenarios.
+
+	  https://github.com/nxp-qoriq/mc-utils
+	  # sign in required
+	  https://www.nxp.com/webapp/Download?colCode=DPAA2UM
+
+if BR2_PACKAGE_QORIQ_MC_UTILS
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPC_CUSTOM_PATH
+	string "Data Path Configuration (DPC) custom file paths"
+	help
+	  The DPC file contains the settings defining the behavior
+	  of the MC firmware. Its structure follows the device
+	  tree syntax and is compiled to a device tree blob.
+
+	  This option defines a space-separated list of device
+	  tree source (DTS) file names, specified without
+	  the trailing .dts. It should be used when the NXP
+	  qoriq-mc-utils repository does not contain an adequate
+	  DPC for the platform, and is preferable to patching
+	  the package.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE
+	string "Data Path Configuration (DPC) in-tree files"
+	help
+	  This option defines a space-separated list of device
+	  tree source (DTS) files relative to the "config/"
+	  folder of the qoriq-mc-utils repository, specified
+	  without the trailing .dts. It should be used when NXP
+	  provides an adequate DPC for the platform.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPL_CUSTOM_PATH
+	string "Data Path Layout (DPL) custom file paths"
+	help
+	  The DPL file contains a description of the initial
+	  networking objects created by the MC firmware when it
+	  boots. Its structure follows the device tree syntax
+	  and is compiled to a device tree blob.
+
+	  This option defines a space-separated list of device
+	  tree source (DTS) files, specified without the
+	  trailing .dts. It should be used when the NXP
+	  qoriq-mc-utils repository does not contain an
+	  adequate DPL for the platform, and is preferable to
+	  patching the package.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE
+	string "Data Path Layout (DPL) in-tree files"
+	help
+	  This option defines a space-separated list of device
+	  tree source (DTS) files relative to the "config/"
+	  folder of the qoriq-mc-utils repository, specified
+	  without the trailing .dts. It should be used when NXP
+	  provides an adequate DPL for the platform.
+
+config BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH
+	string "Path on target to install DPL and DPC files"
+	help
+	  The DPL and DPC files can optionally be deployed to
+	  the target at the path specified here. This is useful
+	  if the mcinitcmd U-Boot environment variable is
+	  configured to apply the DPL and DPC from the filesystem.
+
+endif
diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.hash b/package/qoriq-mc-utils/qoriq-mc-utils.hash
new file mode 100644
index 0000000000..f0234b9d1f
--- /dev/null
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  1d3f4a6b2661cff9cfb5d4fcba3b181eb6febdd88a127fa069e306f51d778fc5  qoriq-mc-utils-10.39.0.tar.gz
+sha256  7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17  LICENSE
diff --git a/package/qoriq-mc-utils/qoriq-mc-utils.mk b/package/qoriq-mc-utils/qoriq-mc-utils.mk
new file mode 100644
index 0000000000..29a0d3c560
--- /dev/null
+++ b/package/qoriq-mc-utils/qoriq-mc-utils.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# qoriq-mc-utils
+#
+################################################################################
+
+QORIQ_MC_UTILS_VERSION = 10.39.0
+QORIQ_MC_UTILS_SITE = $(call github,nxp-qoriq,mc-utils,mc_release_$(QORIQ_MC_UTILS_VERSION))
+QORIQ_MC_UTILS_LICENSE = BSD-3-Clause
+QORIQ_MC_UTILS_INSTALL_IMAGES = YES
+QORIQ_MC_UTILS_DEPENDENCIES = host-dtc
+
+QORIQ_MC_UTILS_DPC_FILES = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC_CUSTOM_PATH))
+QORIQ_MC_UTILS_DPC_INTREE = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPC_INTREE))
+QORIQ_MC_UTILS_DPL_FILES = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_CUSTOM_PATH))
+QORIQ_MC_UTILS_DPL_INTREE = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_DPL_INTREE))
+QORIQ_MC_UTILS_INSTALL_PATH = $(call qstrip,$(BR2_PACKAGE_QORIQ_MC_UTILS_TARGET_INSTALL_PATH))
+
+ifeq ($(QORIQ_MC_UTILS_TARGET_INSTALL_PATH),)
+QORIQ_MC_UTILS_INSTALL_TARGET = NO
+endif
+
+define QORIQ_MC_UTILS_INSTALL_FILES
+	$(foreach file, $(QORIQ_MC_UTILS_DPC_FILES) $(QORIQ_MC_UTILS_DPL_FILES), \
+		PATH=$(BR_PATH) dtc -I dts -O dtb $(file).dts -o $(1)/$(notdir $(file)).dtb
+	)
+	$(foreach file, $(QORIQ_MC_UTILS_DPC_INTREE) $(QORIQ_MC_UTILS_DPL_INTREE), \
+		$(INSTALL) -D $(@D)/config/$(file).dtb $(1)/$(notdir $(file)).dtb
+	)
+endef
+
+define QORIQ_MC_UTILS_BUILD_CMDS
+	PATH=$(BR_PATH) $(MAKE) -C $(@D)/config/
+endef
+
+define QORIQ_MC_UTILS_INSTALL_IMAGES_CMDS
+	$(call QORIQ_MC_UTILS_INSTALL_FILES,$(BINARIES_DIR))
+endef
+
+define QORIQ_MC_UTILS_INSTALL_TARGET_CMDS
+	$(call QORIQ_MC_UTILS_INSTALL_FILES,$(TARGET_DIR)/$(QORIQ_MC_UTILS_INSTALL_PATH))
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
