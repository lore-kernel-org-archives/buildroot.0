Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17CE3C27C77
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 21:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B9D8115A;
	Sat, 15 Jun 2024 21:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fy09y3eXur-K; Sat, 15 Jun 2024 21:19:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD01481185
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD01481185;
	Sat, 15 Jun 2024 21:19:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE08E1BF86B
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D83A380FEF
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 21:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JnWLhUDLqxpm for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 21:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE82280F52
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE82280F52
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 21:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A687F84686; Sat, 15 Jun 2024 21:19:15 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Jun 2024 23:09:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 106e43e3036f4c71419c698445ab979e3f32007a
X-Git-Newrev: a6648ad8dacc4d40ead5e54aeb5be9969b1e8529
X-Patchwork-Hint: ignore
Message-Id: <20240615211915.A687F84686@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/xilinx-prebuilt: new boot package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a6648ad8dacc4d40ead5e54aeb5be9969b1e8529
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add a new boot package for downloading prebuilt firmware for Xilinx
versal and zynqmp evaluation boards.

It solves the problem of being able to verify the hash when downloading a
prebuilt zynqmp pmufw.elf binary.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Reviewed-by: Brandon Maier <brandon.maier@collins.com>
[yann.morin.1998@free.fr:
  - move the hash file to the package dir, not the board dir
  - move board name after familly choice
  - add default board name for each family
  - qstrip the Kconfig strings before use
  - introduce XILINX_PREBUILT_BOARD_DIR to simplify paths
  - explain the *.pdi glob
  - simplify non-versal install
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                |  2 ++
 boot/Config.in                            |  1 +
 boot/xilinx-prebuilt/Config.in            | 48 +++++++++++++++++++++++++++++++
 boot/xilinx-prebuilt/xilinx-prebuilt.hash |  2 ++
 boot/xilinx-prebuilt/xilinx-prebuilt.mk   | 43 +++++++++++++++++++++++++++
 5 files changed, 96 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 52a7572d41..75642ed77f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2336,8 +2336,10 @@ F:	package/qt5/qt5opcua/
 
 N:	Neal Frager <neal.frager@amd.com>
 F:	board/versal/
+F:	board/xilinx/
 F:	board/zynq/
 F:	board/zynqmp/
+F:	boot/xilinx-prebuilt/
 F:	configs/versal_vck190_defconfig
 F:	configs/zynq_zc702_defconfig
 F:	configs/zynq_zc706_defconfig
diff --git a/boot/Config.in b/boot/Config.in
index 14e0ca65fa..25a50265d2 100644
--- a/boot/Config.in
+++ b/boot/Config.in
@@ -21,5 +21,6 @@ source "boot/ti-k3-boot-firmware/Config.in"
 source "boot/ti-k3-r5-loader/Config.in"
 source "boot/uboot/Config.in"
 source "boot/vexpress-firmware/Config.in"
+source "boot/xilinx-prebuilt/Config.in"
 
 endmenu
diff --git a/boot/xilinx-prebuilt/Config.in b/boot/xilinx-prebuilt/Config.in
new file mode 100644
index 0000000000..7c992e6de3
--- /dev/null
+++ b/boot/xilinx-prebuilt/Config.in
@@ -0,0 +1,48 @@
+config BR2_TARGET_XILINX_PREBUILT
+	bool "xilinx-prebuilt"
+	depends on BR2_aarch64
+	help
+	  Pre-built firmware files for Xilinx boards.
+
+	  https://github.com/Xilinx/soc-prebuilt-firmware
+
+if BR2_TARGET_XILINX_PREBUILT
+
+config BR2_TARGET_XILINX_PREBUILT_VERSION
+	string "prebuilt version"
+	default "xilinx_v2024.1"
+	help
+	  Release version of Xilinx firmware.
+	  Must be xilinx_v2023.1 or newer.
+
+choice
+	bool "family variant"
+	default BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+
+config BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+	bool "zynqmp"
+
+config BR2_TARGET_XILINX_PREBUILT_KRIA
+	bool "kria"
+
+config BR2_TARGET_XILINX_PREBUILT_VERSAL
+	bool "versal"
+
+endchoice
+
+config BR2_TARGET_XILINX_PREBUILT_FAMILY
+	string
+	default "zynqmp" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+	default "kria" if BR2_TARGET_XILINX_PREBUILT_KRIA
+	default "versal" if BR2_TARGET_XILINX_PREBUILT_VERSAL
+
+config BR2_TARGET_XILINX_PREBUILT_BOARD
+	string "board name"
+	default "zcu102" if BR2_TARGET_XILINX_PREBUILT_ZYNQMP
+	default "kr260" if BR2_TARGET_XILINX_PREBUILT_KRIA
+	default "vck190" if BR2_TARGET_XILINX_PREBUILT_VERSAL
+	help
+	  Name of Xilinx target board.
+	  Used for installing the appropriate firmware.
+
+endif # BR2_TARGET_XILINX_PREBUILT
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
new file mode 100644
index 0000000000..c955cd79f5
--- /dev/null
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.mk b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
new file mode 100644
index 0000000000..eb78ed10cd
--- /dev/null
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# xilinx-prebuilt
+#
+################################################################################
+
+XILINX_PREBUILT_VERSION = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_VERSION))
+XILINX_PREBUILT_SITE = $(call github,Xilinx,soc-prebuilt-firmware,$(XILINX_PREBUILT_VERSION))
+XILINX_PREBUILT_LICENSE = MIT
+XILINX_PREBUILT_LICENSE_FILES = LICENSE
+XILINX_PREBUILT_INSTALL_TARGET = NO
+XILINX_PREBUILT_INSTALL_IMAGES = YES
+
+XILINX_PREBUILT_FAMILY = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_FAMILY))
+XILINX_PREBUILT_BOARD = $(call qstrip,$(BR2_TARGET_XILINX_PREBUILT_BOARD))
+
+XILINX_PREBUILT_BOARD_DIR = $(@D)/$(XILINX_PREBUILT_BOARD)-$(XILINX_PREBUILT_FAMILY)
+
+ifeq ($(BR2_TARGET_XILINX_PREBUILT_VERSAL),y)
+# We need the *.pdi glob, because the file has different names for the
+# different boards, but htere is only one, and it has to be named
+# vpl_gen_fixed.pdi when installed.
+define XILINX_PREBUILT_INSTALL_VERSAL
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/plm.elf \
+		$(BINARIES_DIR)/plm.elf
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/psmfw.elf \
+		$(BINARIES_DIR)/psmfw.elf
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/*.pdi \
+		$(BINARIES_DIR)/vpl_gen_fixed.pdi
+endef
+else # BR2_TARGET_XILINX_PREBUILT_VERSAL
+define XILINX_PREBUILT_INSTALL_OTHERS
+	$(INSTALL) -D -m 0755 $(XILINX_PREBUILT_BOARD_DIR)/pmufw.elf \
+		$(BINARIES_DIR)/pmufw.elf
+endef
+endif # BR2_TARGET_XILINX_PREBUILT_VERSAL
+
+define XILINX_PREBUILT_INSTALL_IMAGES_CMDS
+	$(XILINX_PREBUILT_INSTALL_VERSAL)
+	$(XILINX_PREBUILT_INSTALL_OTHERS)
+endef
+
+$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
