Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500D5C433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:38:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2082611CE
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 06:38:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2082611CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD1D7400D4;
	Thu,  4 Nov 2021 06:38:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ES1iNu9kWx7I; Thu,  4 Nov 2021 06:38:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 79A2A40110;
	Thu,  4 Nov 2021 06:38:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DD5A1BF3F7
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B9FB40110
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 06:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BGG8NzKhHIl for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 06:38:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0986.aruba.it (smtpcmd0986.aruba.it [62.149.156.86])
 by smtp2.osuosl.org (Postfix) with ESMTP id 950A2400D4
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 06:38:13 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id iWO0mF3Xmsfk3iWO3m7Xl0; Thu, 04 Nov 2021 07:38:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636007891; bh=bqdjA5PeCxZKzyQAUHXgXCXnkHswx6w5sf6wKANbxX4=;
 h=From:To:Subject:Date:MIME-Version;
 b=TtMQrbNeG/YZiBUJDRloH+2DKfUbRR5pSFGT/aM2d85GbzIGJJ935E1p5KxH2aOhe
 bD8lA3awMe83zuBGas5z4CD6HpkgqIKnvwG8RNoeQDrQEboU+9KvPW0wcEubeq8BuR
 Me4jzr+IFKNXcxEbnQtrCUGkoamf1vYOE4BsFZ5r+IxNrk8MEbKlkzEiahYp82E6W3
 LWuySs9dudcRQyBDhmN0Gp02/hWc3td4bgEruvsHXFh2dMgnzfyMHZzWVilb+JzXGF
 9u/HEaNGtLpyB35Jm1DcjDIt6rTgsEQtnVHaLztKPk94EKN8Uno9C63LzSZ9X71KM3
 AJLRHJX7CMvZQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  4 Nov 2021 07:38:07 +0100
Message-Id: <20211104063807.139604-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
References: <20211104063807.139604-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFJpFcCFgQGGbOLHXErt37tY11bJKz5SUllqozY2s2Y2cKn7r2/jULKHmPD1TDPd3y+AOLJ7tcRkLw4LV9g6SZOzMACy+33OOlnLObl6I/tdMJJ+7qCU
 iS30ulUmXGyRUJwoxuPMRa8JsAWgkAoi8yb4mUWFYZ4VuslnhUGBsdS+wWagDfiVzFcV4WfQtZT73QXZeLI0cQetnRRpUGlL2yDHz1PF/Zkim+8lubNzYCi+
 Y7IDH6cjrfemiBQqcfpRRsRxLMj+W1ABQgHkkFPMBY4yTTuf3+C749f/grHSKJBT3rdXa3m5vLcA42rhzpvwi68CPP7LAOQ1qe9PfSSiRhasWO7MvZrhreWp
 YZbsXd7ltS5ywPZoYt1IqiAxo+Ft3xTukvweIcqFBsG7xYSBZccB4uJMttiP3yVq2ZmEnSMC/zyVDaoy3qvWlfkH8A/N1q9fjCX2FraCJMKVyy2TFjtslGKC
 SxiJ9aWkLBkSu14fiENnrknECBS0TVpXC+XMrvkut+qJd1mUIoNOjHA/+bjjoaymUIBnVEzLaLKxbhoA
Subject: [Buildroot] [PATCH 2/2] package/sunxi-mali-utgard-driver: rename
 from sunxi-mali-mainline-driver
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

This package provides a Mali kernel driver for Sunxi Mali Utgard GPUs. The
trailing -mainline is historical and was used at a time when there was
two packages providing this driver. The "non-upstream" package has
been removed some time ago so before adding new packages bringing
support for other ARM Mali GPU versions or implementations, rename
sunxi-mali-mainline-driver into sunxi-mali-utgard-driver.

Add a legacy entry.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Giulio: rebase on master. Add legacy entry instead of substituting the
blob's one]
---
 Config.in.legacy                              | 12 ++++++
 DEVELOPERS                                    |  2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig  |  2 +-
 configs/olimex_a20_olinuxino_lime_defconfig   |  2 +-
 package/Config.in                             |  2 +-
 .../sunxi-mali-mainline-driver.mk             | 41 -------------------
 .../Config.in                                 | 16 ++++----
 .../sunxi-mali-utgard-driver.hash}            |  2 +-
 .../sunxi-mali-utgard-driver.mk               | 41 +++++++++++++++++++
 9 files changed, 66 insertions(+), 54 deletions(-)
 delete mode 100644 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
 rename package/{sunxi-mali-mainline-driver => sunxi-mali-utgard-driver}/Config.in (67%)
 rename package/{sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash => sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash} (66%)
 create mode 100644 package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a209537423..1aac28382a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,18 @@ endif
 
 ###############################################################################
 
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
+	bool "sunxi-mali-mainline-driver package was renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER
+	help
+	  Since the removal of the sunxi-mali-driver package, the
+	  sunxi-mali-mainline-driver package that coexisted became the
+	  only package to provide the Sunxi Mali driver. The "-mainline"
+	  suffix being undescriptive nowadays and before adding new
+	  packages bringing Mali support for other SoCs/GPU flavors, it
+	  is clearer to rename it SUNXI_MALI_UTGARD_DRIVER.
+
 config BR2_PACKAGE_SUNXI_MALI_MAINLINE
 	bool "sunxi-mali-mainline package was renamed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 6f3afd639d..46b294852a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1065,8 +1065,8 @@ F:	package/libnss/
 F:	package/minicom/
 F:	package/nfs-utils/
 F:	package/python-uvloop/
-F:	package/sunxi-mali-mainline-driver/
 F:	package/sunxi-mali-utgard/
+F:	package/sunxi-mali-utgard-driver/
 F:	package/trace-cmd/
 F:	package/udisks/
 F:	toolchain/
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index d0ebeb53a3..f84a7ec7d1 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -33,7 +33,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
 BR2_PACKAGE_SUNXI_MALI_UTGARD=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 000071b11c..5cb36f46a3 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -33,7 +33,7 @@ BR2_LINUX_KERNEL_INSTALL_TARGET=y
 # sunxi packages
 BR2_PACKAGE_SUNXI_TOOLS=y
 BR2_PACKAGE_SUNXI_MALI_UTGARD=y
-BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER=y
+BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
diff --git a/package/Config.in b/package/Config.in
index 1006161497..9201376dcf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -568,8 +568,8 @@ endmenu
 	source "package/statserial/Config.in"
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
-	source "package/sunxi-mali-mainline-driver/Config.in"
 	source "package/sunxi-mali-utgard/Config.in"
+	source "package/sunxi-mali-utgard-driver/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
deleted file mode 100644
index 6782ca7fc2..0000000000
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
+++ /dev/null
@@ -1,41 +0,0 @@
-################################################################################
-#
-# sunxi-mali-mainline-driver
-#
-################################################################################
-
-SUNXI_MALI_MAINLINE_DRIVER_VERSION = e4a91c95096bb31450b556fcb13f3c4ba79f60b4
-SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
-SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
-SUNXI_MALI_MAINLINE_DRIVER_LICENSE = GPL-2.0
-SUNXI_MALI_MAINLINE_DRIVER_LICENSE_FILES = LICENSE
-
-SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
-	$(LINUX_MAKE_FLAGS) \
-	KDIR=$(LINUX_DIR)
-
-define SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
-	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
-	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
-		$(@D)/build.sh
-endef
-
-SUNXI_MALI_MAINLINE_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_MAINLINE_DRIVER_USE_APPLY_PATCHES
-
-define SUNXI_MALI_MAINLINE_DRIVER_BUILD_CMDS
-	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -b
-endef
-
-define SUNXI_MALI_MAINLINE_DRIVER_INSTALL_TARGET_CMDS
-	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
-		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -i
-endef
-
-define SUNXI_MALI_MAINLINE_DRIVER_LINUX_CONFIG_FIXUPS
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CMA)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DMA_CMA)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
-endef
-
-$(eval $(generic-package))
diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-utgard-driver/Config.in
similarity index 67%
rename from package/sunxi-mali-mainline-driver/Config.in
rename to package/sunxi-mali-utgard-driver/Config.in
index 236470db53..244283f44d 100644
--- a/package/sunxi-mali-mainline-driver/Config.in
+++ b/package/sunxi-mali-utgard-driver/Config.in
@@ -1,22 +1,22 @@
-comment "sunxi-mali-mainline-driver needs a Linux kernel to be built"
+comment "sunxi-mali-utgard-driver needs a Linux kernel to be built"
 	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD
 	depends on !BR2_LINUX_KERNEL
 
-config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
-	bool "sunxi-mali-mainline-driver"
+config BR2_PACKAGE_SUNXI_MALI_UTGARD_DRIVER
+	bool "sunxi-mali-utgard-driver"
 	default y
 	depends on BR2_PACKAGE_SUNXI_MALI_UTGARD # runtime
 	depends on BR2_LINUX_KERNEL
 	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
 	help
 	  This package builds and installs the Linux kernel driver for
-	  the Mali GPU on Allwinner platforms, compatible with recent
-	  Linux kernels (>= 4.4). Note that it should be installed
-	  together with the corresponding userspace OpenGL libraries,
-	  which are provided as binaries only at:
+	  the Mali Utgard GPU on Allwinner platforms, compatible with
+	  recent Linux kernels (>= 4.4). Note that it should be
+	  installed together with the corresponding userspace OpenGL
+	  libraries, which are provided as binaries only at:
 	  https://github.com/bootlin/mali-blobs
 
-	  sunxi-mali-mainline-driver requires a Linux kernel >= 4.4
+	  sunxi-mali-utgard-driver requires a Linux kernel >= 4.4
 	  with the following options enabled:
 
 	  - CONFIG_CMA
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
similarity index 66%
rename from package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
rename to package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
index f08e80f114..4b276fecb7 100644
--- a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0197271dbf503e866dd4873091f61bb3de1f2c3031701aac1ba205d1e2f267ac  sunxi-mali-mainline-driver-e4a91c95096bb31450b556fcb13f3c4ba79f60b4.tar.gz
+sha256  0197271dbf503e866dd4873091f61bb3de1f2c3031701aac1ba205d1e2f267ac  sunxi-mali-utgard-driver-e4a91c95096bb31450b556fcb13f3c4ba79f60b4.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
new file mode 100644
index 0000000000..5f9090f492
--- /dev/null
+++ b/package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# sunxi-mali-utgard-driver
+#
+################################################################################
+
+SUNXI_MALI_UTGARD_DRIVER_VERSION = e4a91c95096bb31450b556fcb13f3c4ba79f60b4
+SUNXI_MALI_UTGARD_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_UTGARD_DRIVER_VERSION))
+SUNXI_MALI_UTGARD_DRIVER_DEPENDENCIES = linux
+SUNXI_MALI_UTGARD_DRIVER_LICENSE = GPL-2.0
+SUNXI_MALI_UTGARD_DRIVER_LICENSE_FILES = LICENSE
+
+SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS = \
+	$(LINUX_MAKE_FLAGS) \
+	KDIR=$(LINUX_DIR)
+
+define SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
+	ln -sf $(SUNXI_MALI_UTGARD_REV)/series $(@D)/patches
+	$(SED) 's|quilt push -a|$(TOPDIR)/support/scripts/apply-patches.sh . ../patches|' \
+		$(@D)/build.sh
+endef
+
+SUNXI_MALI_UTGARD_DRIVER_POST_PATCH_HOOKS += SUNXI_MALI_UTGARD_DRIVER_USE_APPLY_PATCHES
+
+define SUNXI_MALI_UTGARD_DRIVER_BUILD_CMDS
+	cd $(@D) && $(SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS) \
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -b
+endef
+
+define SUNXI_MALI_UTGARD_DRIVER_INSTALL_TARGET_CMDS
+	cd $(@D) && $(SUNXI_MALI_UTGARD_DRIVER_MAKE_OPTS) \
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_UTGARD_REV) -j $(PARALLEL_JOBS) -i
+endef
+
+define SUNXI_MALI_UTGARD_DRIVER_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CMA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DMA_CMA)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM)
+endef
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
