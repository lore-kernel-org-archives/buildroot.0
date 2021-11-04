Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA241C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:38:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6BED6008E
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6BED6008E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63C1F6064B;
	Thu,  4 Nov 2021 06:38:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BBEAvATPeV-I; Thu,  4 Nov 2021 06:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D087460840;
	Thu,  4 Nov 2021 06:38:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57DD01BF3F7
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B1CE8104D
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OIpz5plS2z9q for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 06:38:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2281881004
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 06:38:12 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id iWO0mF3Xmsfk3iWO2m7Xke; Thu, 04 Nov 2021 07:38:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636007891; bh=IVamc0fe9uytvSV4opOf5fm046GAbSWxJywWiNdbMHQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=eK3SDe6qXfaSB/tHwZjjG1AyZtg/DnaG/XAGz1AzhVwZROJM1erzYt0RL26RsA4Tf
 /m6MyI6i9+aqq9qnWLy99ZegBqcxN4zyXOrWjHV7ZaRmcUmf7sS9GmuR99wF2QWyXO
 ucd9VAfYuvv7VDQhnUeN/lssspdFN8F6rMniQLDuxwr4d/D+2e7zfjFHp89/6Tt3el
 3Pkbd9yda4i8Y6XHG2zleQodWmebfCxZGzJlUxS3JYDVhUY8/O2E3eR+Mmdmsjrhh3
 ZW6dOmGmoS4lcCB9Jgxy/psTPbRlnCHvp0I67DCscUXAEcGbZHYw9Vkhn67HnzM8+Q
 oirtWCZGBQLmw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 07:38:06 +0100
Message-Id: <20211104063807.139604-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
References: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFJpFcCFgQGGbOLHXErt37tY11bJKz5SUllqozY2s2Y2cKn7r2/jULKHmPD1TDPd3y+AOLJ7tcRkLw4LV9g6SZOzMACy+33OOlnLObl6I/tdMJJ+7qCU
 iS30ulUmXGyRUJwoxuPMRa8JsAWgkAoi8yb4mUWFYZ4VuslnhUGBsdS+wWagDfiVzFcV4WfQtZT73QXZeLI0cQetnRRpUGlL2yDHz1PF/Zkim+8lubNzYCi+
 Y7IDH6cjrfemiBQqcfpRRsRxLMj+W1ABQgHkkFPMBY4yTTuf3+C749f/grHSKJBT3rdXa3m5vLcA42rhzpvwi68CPP7LAOQ1qe9PfSSiRhasWO7MvZrhreWp
 YZbsXd7ltS5ywPZoYt1IqiAxo+Ft3xTukvweIcqFBsG7xYSBZccB4uJMttiP3yVq2ZmEnSMC/zyVDaoy3qvWlfkH8A/N1q9fjCX2FraCJMKVyy2TFjtslGKC
 SxiJ9aWkLBkSu14fiENnrknECBS0TVpXC+XMrvkut+qJd1mUIoNOjHA/+bjjoaymUIBnVEzLaLKxbhoA
Subject: [Buildroot] [PATCH 1/2] package/sunxi-mali-utgard: rename from
 sunxi-mali-mainline
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
Cc: Julien Olivain <ju.o@free.fr>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Miquel Raynal <miquel.raynal@bootlin.com>

This package provides Mali libraries for Sunxi Mali Utgard GPUs. The
trailing -mainline is historical and was used at a time when there was
two packages providing these libraries. The "non-upstream" package has
been removed some time ago so before adding new packages bringing
support for other ARM Mali GPU versions or implementations, rename
sunxi-mali-mainline into sunxi-mali-utgard.

Add a legacy entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: rebase on master. Rename SUNXI_MALI_MAINLINE_REV to
SUNXI_MALI_UTGARD_REV in sunxi-mali-mailine-driver.mk and
BR2_PACKAGE_SUNXI_MALI_MAINLINE to BR2_PACKAGE_SUNXI_UTGARD in
sunxi-mali-mainline-driver/Config.in to respect bisectability]
---
 Config.in.legacy                              | 30 ++++++++++++
 DEVELOPERS                                    |  2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |  2 +-
 configs/olimex_a20_olinuxino_lime_defconfig   |  2 +-
 docs/manual/adding-packages-virtual.txt       |  2 +-
 package/Config.in                             |  2 +-
 package/glslsandbox-player/Config.in          |  4 +-
 .../glslsandbox-player/glslsandbox-player.mk  |  2 +-
 package/qt5/qt5base/qt5base.mk                |  2 +-
 package/sunxi-mali-mainline-driver/Config.in  |  4 +-
 .../sunxi-mali-mainline-driver.mk             |  6 +--
 package/sunxi-mali-mainline/Config.in         | 42 ----------------
 .../sunxi-mali-mainline.mk                    | 49 -------------------
 package/sunxi-mali-utgard/Config.in           | 43 ++++++++++++++++
 .../egl.pc                                    |  0
 .../glesv2.pc                                 |  0
 .../sunxi-mali-utgard.hash}                   |  2 +-
 .../sunxi-mali-utgard/sunxi-mali-utgard.mk    | 49 +++++++++++++++++++
 18 files changed, 137 insertions(+), 106 deletions(-)
 delete mode 100644 package/sunxi-mali-mainline/Config.in
 delete mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.mk
 create mode 100644 package/sunxi-mali-utgard/Config.in
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/egl.pc (100%)
 rename package/{sunxi-mali-mainline => sunxi-mali-utgard}/glesv2.pc (100%)
 rename package/{sunxi-mali-mainline/sunxi-mali-mainline.hash => sunxi-mali-utgard/sunxi-mali-utgard.hash} (70%)
 create mode 100644 package/sunxi-mali-utgard/sunxi-mali-utgard.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 24d0dc1d51..a209537423 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,36 @@ endif
 
 ###############################################################################
 
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	bool "sunxi-mali-mainline package was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD
+	help
+	  Since the removal of the sunxi-mali package, the
+	  sunxi-mali-mainline package that coexisted became the only
+	  package to provide Mali blobs. The "-mainline" suffix being
+	  undescriptive nowadays and before adding new packages bringing
+	  Mali support for other SoCs/GPU flavors, it is clearer to
+	  rename it SUNXI_MALI_UTGARD.
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
+	bool "sunxi-mali-mainline-r6p2 was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	help
+	  The sunxi-mali-mainline package has been renamed
+	  sunxi-mali-utgard, the suboptions of this package have also
+	  been renamed accordingly.
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
+	bool "sunxi-mali-mainline-r8p1 was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+	help
+	  The sunxi-mali-mainline package has been renamed
+	  sunxi-mali-utgard, the suboptions of this package have also
+	  been renamed accordingly.
+
 comment "Legacy options removed in 2021.11"
 
 config BR2_PACKAGE_MROUTED_RSRR
diff --git a/DEVELOPERS b/DEVELOPERS
index efc7344856..6f3afd639d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1065,8 +1065,8 @@ F:	package/libnss/
 F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
-F:	package/sunxi-mali-mainline/
 F:	package/sunxi-mali-mainline-driver/
+F:	package/sunxi-mali-utgard/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	toolchain/
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index ed279326bc..d0ebeb53a3 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
 
 # Filesystem
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index cd88a2d19a..000071b11c 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
 
 # Filesystem
diff --git a/docs/manual/adding-packages-virtual.txt b/docs/manual/adding-packages-virtual.txt
index 6326bb5455..722e6e3771 100644
--- a/docs/manual/adding-packages-virtual.txt
+++ b/docs/manual/adding-packages-virtual.txt
@@ -13,7 +13,7 @@ the provider used in the rootfs.
 For example, 'OpenGL ES' is an API for 2D and 3D graphics on embedded systems.
 The implementation of this API is different for the 'Allwinner Tech Sunxi' and
 the 'Texas Instruments OMAP35xx' platforms. So +libgles+ will be a virtual
-package and +sunxi-mali+ and +ti-gfx+ will be the providers.
+package and +sunxi-mali-utgard+ and +ti-gfx+ will be the providers.
 
 ==== +virtual-package+ tutorial
 
diff --git a/package/Config.in b/package/Config.in
index c23755a421..1006161497 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -568,8 +568,8 @@ endmenu
 	source "package/statserial/Config.in"
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
-	source "package/sunxi-mali-mainline/Config.in"
 	source "package/sunxi-mali-mainline-driver/Config.in"
+	source "package/sunxi-mali-utgard/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/glslsandbox-player/Config.in b/package/glslsandbox-player/Config.in
index 02d4c442ed..2d15a7e270 100644
--- a/package/glslsandbox-player/Config.in
+++ b/package/glslsandbox-player/Config.in
@@ -55,7 +55,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_SCRIPTS
 
 choice
 	prompt "Native windowing system"
-	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI  if BR2_PACKAGE_SUNXI_MALI_UTGARD
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X if BR2_PACKAGE_MALI_T76X
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_RPI   if BR2_PACKAGE_RPI_USERLAND
 	default BR2_PACKAGE_GLSLSANDBOX_PLAYER_SDL2  if BR2_PACKAGE_SDL2_OPENGLES
@@ -73,7 +73,7 @@ config BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS
 
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI
 	bool "Allwinner ARM/Mali Frame Buffer"
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD
 
 config BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X
 	bool "ARM/Mali T76x Frame Buffer"
diff --git a/package/glslsandbox-player/glslsandbox-player.mk b/package/glslsandbox-player/glslsandbox-player.mk
index 1578608a42..c5fbf062b7 100644
--- a/package/glslsandbox-player/glslsandbox-player.mk
+++ b/package/glslsandbox-player/glslsandbox-player.mk
@@ -42,7 +42,7 @@ ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_KMS),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += libdrm
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=kms
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI),y)
-GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-mainline
+GLSLSANDBOX_PLAYER_DEPENDENCIES += sunxi-mali-utgard
 GLSLSANDBOX_PLAYER_CONF_OPTS += --with-native-gfx=mali
 else ifeq ($(BR2_PACKAGE_GLSLSANDBOX_PLAYER_MALI_T76X),y)
 GLSLSANDBOX_PLAYER_DEPENDENCIES += mali-t76x
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 9da3de468a..7c52b7a0fe 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -262,7 +262,7 @@ endif
 ifeq ($(BR2_PACKAGE_IMX_GPU_VIV),y)
 # use vivante backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_viv
-else ifeq ($(BR2_PACKAGE_SUNXI_MALI_MAINLINE),y)
+else ifeq ($(BR2_PACKAGE_SUNXI_MALI_UTGARD),y)
 # use mali backend
 QT5BASE_EGLFS_DEVICE = EGLFS_DEVICE_INTEGRATION = eglfs_mali
 endif
diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
index 90bc308bc5..236470db53 100644
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ b/package/sunxi-mali-mainline-driver/Config.in
@@ -1,11 +1,11 @@
 comment "sunxi-mali-mainline-driver needs a Linux kernel to be built"
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD
 	depends on !BR2_LINUX_KERNEL
 
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
 	bool "sunxi-mali-mainline-driver"
 	default y
-	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE # runtime
+	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD # runtime
 	depends on BR2_LINUX_KERNEL
 	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
index feffaa7ae6..6782ca7fc2 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -15,7 +15,7 @@ SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
 	KDIR=$(LINUX_DIR)
 
 define SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
-	ln -sf $(SUNXI_MALI_MAINLINE_REV)/series $(@D)/patches
+	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
 	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
 		$(@D)/build.sh
 endef
@@ -24,12 +24,12 @@ SUNXI_MALI_MAINLINE_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_DRIVER_USE_AP
 
 define SUNXI_MALI_MAINLINE_DRIVER_BUILD_CMDS
 	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -b
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -b
 endef
 
 define SUNXI_MALI_MAINLINE_DRIVER_INSTALL_TARGET_CMDS
 	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -j $(PARALLEL_JOBS) -i
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -i
 endef
 
 define SUNXI_MALI_MAINLINE_DRIVER_LINUX_CONFIG_FIXUPS
diff --git a/package/sunxi-mali-mainline/Config.in b/package/sunxi-mali-mainline/Config.in
deleted file mode 100644
index a2fb95bd79..0000000000
--- a/package/sunxi-mali-mainline/Config.in
+++ /dev/null
@@ -1,42 +0,0 @@
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE
-	bool "sunxi-mali-mainline"
-	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
-	depends on BR2_TOOLCHAIN_USES_GLIBC
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	help
-	  Install userspace Allwinner OpenGL libraries.
-
-	  https://github.com/bootlin/mali-blobs
-
-if BR2_PACKAGE_SUNXI_MALI_MAINLINE
-
-config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "sunxi-mali-mainline"
-
-config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "sunxi-mali-mainline"
-
-choice
-	prompt "Version"
-	default BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	help
-	  Select the version of the userspace module.
-
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	bool "r6p2"
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
-	bool "r8p1"
-
-endchoice
-
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION
-	string
-	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R6P2
-	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_MAINLINE_R8P1
-
-endif
-
-comment "sunxi-mali needs an EABIhf glibc toolchain"
-	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk b/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
deleted file mode 100644
index b46f572311..0000000000
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-################################################################################
-#
-# sunxi-mali-mainline
-#
-################################################################################
-
-SUNXI_MALI_MAINLINE_VERSION = 418f55585e76f375792dbebb3e97532f0c1c556d
-SUNXI_MALI_MAINLINE_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_MAINLINE_VERSION))
-SUNXI_MALI_MAINLINE_INSTALL_STAGING = YES
-SUNXI_MALI_MAINLINE_PROVIDES = libegl libgles
-SUNXI_MALI_MAINLINE_LICENSE = Allwinner End User Licence Agreement
-SUNXI_MALI_MAINLINE_EULA_ORIGINAL = EULA\ for\ Mali\ 400MP\ _AW.pdf
-SUNXI_MALI_MAINLINE_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
-SUNXI_MALI_MAINLINE_LICENSE_FILES = $(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
-
-SUNXI_MALI_MAINLINE_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_MAINLINE_REVISION))
-
-ifeq ($(BR2_arm),y)
-SUNXI_MALI_MAINLINE_ARCH=arm
-else ifeq ($(BR2_aarch64),y)
-SUNXI_MALI_MAINLINE_ARCH=arm64
-endif
-
-define SUNXI_MALI_MAINLINE_INSTALL_STAGING_CMDS
-	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
-
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
-		$(STAGING_DIR)/usr/lib/
-	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
-
-	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/egl.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
-	$(INSTALL) -D -m 0644 package/sunxi-mali-mainline/glesv2.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
-endef
-
-define SUNXI_MALI_MAINLINE_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -rf $(@D)/$(SUNXI_MALI_MAINLINE_REV)/$(SUNXI_MALI_MAINLINE_ARCH)/fbdev/*.so* \
-		$(TARGET_DIR)/usr/lib/
-endef
-
-define SUNXI_MALI_MAINLINE_FIXUP_LICENSE_FILE
-	mv $(@D)/$(SUNXI_MALI_MAINLINE_EULA_ORIGINAL) $(@D)/$(SUNXI_MALI_MAINLINE_EULA_NO_SPACES)
-endef
-
-SUNXI_MALI_MAINLINE_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_FIXUP_LICENSE_FILE
-
-$(eval $(generic-package))
diff --git a/package/sunxi-mali-utgard/Config.in b/package/sunxi-mali-utgard/Config.in
new file mode 100644
index 0000000000..ff49ea03f1
--- /dev/null
+++ b/package/sunxi-mali-utgard/Config.in
@@ -0,0 +1,43 @@
+config BR2_PACKAGE_SUNXI_MALI_UTGARD
+	bool "sunxi-mali-utgard"
+	depends on BR2_aarch64 || (BR2_ARM_EABIHF && BR2_arm)
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Install userspace Allwinner OpenGL libraries for Mali
+	  Utgard GPUs.
+
+	  https://github.com/bootlin/mali-blobs
+
+if BR2_PACKAGE_SUNXI_MALI_UTGARD
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "sunxi-mali-utgard"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "sunxi-mali-utgard"
+
+choice
+	prompt "Version"
+	default BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	help
+	  Select the version of the userspace module.
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	bool "r6p2"
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+	bool "r8p1"
+
+endchoice
+
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION
+	string
+	default "r6p2"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R6P2
+	default "r8p1"	if BR2_PACKAGE_SUNXI_MALI_UTGARD_R8P1
+
+endif
+
+comment "sunxi-mali-utgard needs an EABIhf glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
diff --git a/package/sunxi-mali-mainline/egl.pc b/package/sunxi-mali-utgard/egl.pc
similarity index 100%
rename from package/sunxi-mali-mainline/egl.pc
rename to package/sunxi-mali-utgard/egl.pc
diff --git a/package/sunxi-mali-mainline/glesv2.pc b/package/sunxi-mali-utgard/glesv2.pc
similarity index 100%
rename from package/sunxi-mali-mainline/glesv2.pc
rename to package/sunxi-mali-utgard/glesv2.pc
diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-utgard/sunxi-mali-utgard.hash
similarity index 70%
rename from package/sunxi-mali-mainline/sunxi-mali-mainline.hash
rename to package/sunxi-mali-utgard/sunxi-mali-utgard.hash
index 96d8251f16..c86b927ea5 100644
--- a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
+++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b5e7e8f9f2886ed0b273f72ea16ae4868711726fe33e3d80ef24e86269c90fd2  sunxi-mali-mainline-418f55585e76f375792dbebb3e97532f0c1c556d.tar.gz
+sha256  b5e7e8f9f2886ed0b273f72ea16ae4868711726fe33e3d80ef24e86269c90fd2  sunxi-mali-utgard-418f55585e76f375792dbebb3e97532f0c1c556d.tar.gz
 sha256  8a06bcae44a41a886f339b4338422415a786787f113e9ed6456ae117104a0b6a  EULA_for_Mali_400MP_AW.pdf
diff --git a/package/sunxi-mali-utgard/sunxi-mali-utgard.mk b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
new file mode 100644
index 0000000000..f693667955
--- /dev/null
+++ b/package/sunxi-mali-utgard/sunxi-mali-utgard.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# sunxi-mali-utgard
+#
+################################################################################
+
+SUNXI_MALI_UTGARD_VERSION = 418f55585e76f375792dbebb3e97532f0c1c556d
+SUNXI_MALI_UTGARD_SITE = $(call github,bootlin,mali-blobs,$(SUNXI_MALI_UTGARD_VERSION))
+SUNXI_MALI_UTGARD_INSTALL_STAGING = YES
+SUNXI_MALI_UTGARD_PROVIDES = libegl libgles
+SUNXI_MALI_UTGARD_LICENSE = Allwinner End User Licence Agreement
+SUNXI_MALI_UTGARD_EULA_ORIGINAL = EULA\ for\ Mali\ 400MP\ _AW.pdf
+SUNXI_MALI_UTGARD_EULA_NO_SPACES = EULA_for_Mali_400MP_AW.pdf
+SUNXI_MALI_UTGARD_LICENSE_FILES = $(SUNXI_MALI_UTGARD_EULA_NO_SPACES)
+
+SUNXI_MALI_UTGARD_REV = $(call qstrip,$(BR2_PACKAGE_SUNXI_MALI_UTGARD_REVISION))
+
+ifeq ($(BR2_arm),y)
+SUNXI_MALI_UTGARD_ARCH=arm
+else ifeq ($(BR2_aarch64),y)
+SUNXI_MALI_UTGARD_ARCH=arm64
+endif
+
+define SUNXI_MALI_UTGARD_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/lib $(STAGING_DIR)/usr/include
+
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+		$(STAGING_DIR)/usr/lib/
+	cp -rf $(@D)/include/fbdev/* $(STAGING_DIR)/usr/include/
+
+	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/egl.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/egl.pc
+	$(INSTALL) -D -m 0644 package/sunxi-mali-utgard/glesv2.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/glesv2.pc
+endef
+
+define SUNXI_MALI_UTGARD_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/lib
+	cp -rf $(@D)/$(SUNXI_MALI_UTGARD_REV)/$(SUNXI_MALI_UTGARD_ARCH)/fbdev/*.so* \
+		$(TARGET_DIR)/usr/lib/
+endef
+
+define SUNXI_MALI_UTGARD_FIXUP_LICENSE_FILE
+	mv $(@D)/$(SUNXI_MALI_UTGARD_EULA_ORIGINAL) $(@D)/$(SUNXI_MALI_UTGARD_EULA_NO_SPACES)
+endef
+
+SUNXI_MALI_UTGARD_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_FIXUP_LICENSE_FILE
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
