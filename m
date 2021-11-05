Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0FAC433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:18:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C07F96112D
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 22:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C07F96112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 988B96F949;
	Fri,  5 Nov 2021 22:18:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Klqm8wfycSF; Fri,  5 Nov 2021 22:18:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59F296F942;
	Fri,  5 Nov 2021 22:18:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B1061C1135
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 280076F935
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jAeIcNOeSnD for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 22:18:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp3.osuosl.org (Postfix) with ESMTP id D313C616F4
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 22:18:04 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id j7X7mGJ7s5cjnj7X9m4SPq; Fri, 05 Nov 2021 23:18:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636150683; bh=yd+HldWTfhciniwjBpPwLdTkiL0Iu6kTQBY9DBwAlt4=;
 h=From:To:Subject:Date:MIME-Version;
 b=WXoXu2YidnwJtX7pTvZGw0R2gknoOjD1PYcEUZuWBMacYnPwS6XqFBx86Ru8VA/39
 3QHK/XhCtuohj9VZ1wruN2a4fzAp7lrhqHrCU7s8TVdJLYEQLBs4TI9Sio2cTuZOcd
 8jZS5UT9dMAJF/lEAjoJD9C27T5UODs2RTKzHewc5+0s03rtBz94qoF+RIDIFDlliV
 Gp64KX0/P3VHSq9y/d42NGH1JH1FF+gShTddrC9w9TW2C8oeqphMjU+IQEntq3njwr
 6ax1bjhutG+w/Fe53Olc0aIG/QbwQUPWGqM0aNTWzFlWQDJyE7USkPKDnkIyRAlgfJ
 rjiT94GOhdD/w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 23:17:56 +0100
Message-Id: <20211105221800.1451167-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
References: <e20b07ab-2d45-1d04-d426-e740d20f8f67@lucaceresoli.net>
 <20211105221800.1451167-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPhBM14PQSPVxppgvUBdukMA1xyGm/HGno3E0+W+V+UwhhBYrQGaVwN50r1ncrqUds76tu2r2L70uPW0F2AHwG0vxpliAVA5PIhZ2dSqjsYKaxr2K3cW
 GSQZCqVmXFhCv2IQGSbgq2ECtZck6tVcxFkZLqubIAjBJ3fJkCa66yJeHAwNaoJXrHJC9FHKBBXO4RFQNmRZ4garLzUWv7rzFcQfFrec33vt1076waUAPlOG
 XxyVuc+a8IIJiD4AWguLfw7SzDQC8q01Xa36TWgaFnwCHbwqH75GD/z8TfcKn7BkzadPFGg8W/74acNqm0a3wpdkcBoCLXTZj0ebaw1HhEmC0yn1PpuDU2pi
 lcOEAuRa89lfUoeCwzJZ1CluEWXCLj5zCSoL4nTsYMrR3YNWga3kBsfWWqXo40zvc2w922hbl7CsdnPMYgX9OyJ1l5lzZL7BtlbULe1sFMkIQwz70cXnMfQe
 Ef36MwUW8lDGTmLtCoEP+otxKuM6z0PBttXH2uk/fQ8lOBb2D1BHWNF+BgVWqXABHYxDPS0hoJ5rIL+fDV35MCp1rOb2fWrTcmvRzw==
Subject: [Buildroot] [PATCH v2 1/5] package/sunxi-mali-utgard: rename from
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
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
[Build tested only]
Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 Config.in.legacy                              | 30 ++++++++++++
 DEVELOPERS                                    |  2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |  4 +-
 configs/olimex_a20_olinuxino_lime_defconfig   |  4 +-
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
 18 files changed, 139 insertions(+), 108 deletions(-)
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
index 9d0e92b564..7eda2cf197 100644
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
index ed279326bc..319ac48c58 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -8,7 +8,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Toolchain
-# glibc is needed for sunxi-mali-mainline-package.
+# glibc is needed for sunxi-mali-utgard package.
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
 # System configuration
@@ -32,7 +32,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD=y
 BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
 
 # Filesystem
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index cd88a2d19a..4cec5689ca 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -8,7 +8,7 @@ BR2_ARM_FPU_NEON_VFPV4=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
 
 # Toolchain
-# glibc is needed for sunxi-mali-mainline-package.
+# glibc is needed for sunxi-mali-utgard package.
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
 
 # System configuration
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
