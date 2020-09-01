From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Sep 2020 21:57:21 +0200
Subject: [Buildroot] [git commit branch/next] package/nvidia-tegra23: remove
 package
Message-ID: <20200901200452.66E33818A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6b2355fef06897bba7cec5bde04863feb443137b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Current X.org X server is incompatible with this driver.

We no longer support unmaintainted versions of X.org X server.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                                   |  6 ++
 DEVELOPERS                                         |  2 -
 package/Config.in                                  |  1 -
 package/nvidia-tegra23/Config.in                   | 38 -------------
 .../nvidia-tegra23-binaries/Config.in              | 26 ---------
 .../nvidia-tegra23/nvidia-tegra23-binaries/egl.pc  | 10 ----
 .../nvidia-tegra23/nvidia-tegra23-binaries/gles.pc | 10 ----
 .../nvidia-tegra23-binaries/glesv2.pc              | 10 ----
 .../nvidia-tegra23-binaries.hash                   |  3 -
 .../nvidia-tegra23-binaries.mk                     | 64 ----------------------
 .../nvidia-tegra23/nvidia-tegra23-codecs/Config.in |  7 ---
 .../nvidia-tegra23-codecs.hash                     |  3 -
 .../nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk | 32 -----------
 package/nvidia-tegra23/nvidia-tegra23.mk           | 18 ------
 support/scripts/pkg-stats                          |  1 -
 15 files changed, 6 insertions(+), 225 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4234ed5b35..d36988c10a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2020.11"
 
+config BR2_PACKAGE_NVIDIA_TEGRA23
+	bool "nvidia-tegra23 package removed"
+	select BR2_LEGACY
+	help
+	  Current X.org server is incompatible with this driver.
+
 config BR2_GDB_VERSION_8_1
 	bool "gdb 8.1.x has been removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b86e5f8169..86446b9a64 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1915,8 +1915,6 @@ F:	package/libgit2/
 
 N:	Nicolas Serafini <nicolas.serafini@sensefly.com>
 F:	package/exiv2/
-F:	package/nvidia-tegra23/nvidia-tegra23-binaries/
-F:	package/nvidia-tegra23/nvidia-tegra23-codecs/
 F:	package/ofono/
 
 N:	Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>
diff --git a/package/Config.in b/package/Config.in
index b1df81d7f1..682c94db15 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -500,7 +500,6 @@ endmenu
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
-	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
 	source "package/ofono/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/nvidia-tegra23/Config.in b/package/nvidia-tegra23/Config.in
deleted file mode 100644
index 9c9fd198d9..0000000000
--- a/package/nvidia-tegra23/Config.in
+++ /dev/null
@@ -1,38 +0,0 @@
-menuconfig BR2_PACKAGE_NVIDIA_TEGRA23
-	bool "nvidia-tegra23"
-	depends on BR2_cortex_a9
-	depends on BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
-	depends on BR2_PACKAGE_XORG7
-	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
-	help
-	  Install NVidia proprietary blobs to drive Tegra2 or Tegra3
-	  GPUs found in some mobile-targeted ARM SoCs.
-
-if BR2_PACKAGE_NVIDIA_TEGRA23
-
-choice
-	prompt "Tegra platform"
-	help
-	  Select the SOC platform.
-
-config BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA2
-	bool "Tegra 2"
-	help
-	  NVIDIA Tegra 2 is a dual-core Cortex-A9 without NEON.
-
-config BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3
-	bool "Tegra 3"
-	depends on BR2_ARM_CPU_HAS_NEON
-	help
-	  NVIDIA Tegra 3 is a quad-core Cortex-A9 with NEON.
-
-endchoice
-
-source "package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in"
-source "package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in"
-endif
-
-comment "nvidia-tegra23 needs Xorg <= 1.14 and a glibc toolchain w/ EABIhf"
-	depends on BR2_cortex_a9
-	depends on !BR2_ARM_EABIHF || !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
deleted file mode 100644
index 0c09051b6a..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
-	bool "nvidia-tegra23 binaries"
-	select BR2_PACKAGE_MESA3D_HEADERS
-	select BR2_PACKAGE_XLIB_LIBX11
-	select BR2_PACKAGE_XLIB_LIBXEXT
-	select BR2_PACKAGE_HAS_LIBEGL
-	select BR2_PACKAGE_HAS_LIBGLES
-	select BR2_PACKAGE_HAS_LIBOPENMAX
-	help
-	  Those packages provide libraries, drivers and firmware that
-	  comes from NVIDIA Linux For Tegra.
-
-	  https://developer.nvidia.com/linux-tegra
-
-if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
-
-config BR2_PACKAGE_PROVIDES_LIBEGL
-	default "nvidia-tegra23-binaries"
-
-config BR2_PACKAGE_PROVIDES_LIBGLES
-	default "nvidia-tegra23-binaries"
-
-config BR2_PACKAGE_PROVIDES_LIBOPENMAX
-	default "nvidia-tegra23-binaries"
-
-endif
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc b/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc
deleted file mode 100644
index 3af7eecc01..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=/usr/lib
-includedir=/usr/include
-
-Name: egl
-Description: EGL implementation
-Version: 1
-Cflags: -I${includedir}/EGL
-Libs: -L${libdir} -lEGL
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc b/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc
deleted file mode 100644
index 91387c9793..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=/usr/lib
-includedir=/usr/include
-
-Name: glesv2
-Description: OpenGL ES 1.1 implementation
-Version: 1.1
-Cflags: -I${includedir}/GLES
-Libs: -L${libdir} -lGLESv1_CM
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc b/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc
deleted file mode 100644
index 356a1cba4f..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc
+++ /dev/null
@@ -1,10 +0,0 @@
-prefix=/usr
-exec_prefix=${prefix}
-libdir=/usr/lib
-includedir=/usr/include
-
-Name: glesv2
-Description: OpenGL ES 2 implementation
-Version: 2
-Cflags: -I${includedir}/GLESv2
-Libs: -L${libdir} -lGLESv2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
deleted file mode 100644
index 50c3cda645..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://developer.nvidia.com/linux-tegra-rel-16
-sha1 295dcd63b2f122c2d99f07fcc083db9adb8ac178 Tegra20_Linux_R16.5_armhf.tbz2
-sha1 6be645c20d81d518856bc8520ef4c2472d57eaef Tegra30_Linux_R16.5_armhf.tbz2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
deleted file mode 100644
index ed3c5a78b4..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
+++ /dev/null
@@ -1,64 +0,0 @@
-################################################################################
-#
-# nvidia-tegra23-binaries
-#
-################################################################################
-
-NVIDIA_TEGRA23_BINARIES_VERSION = $(NVIDIA_TEGRA23_VERSION)
-NVIDIA_TEGRA23_BINARIES_SITE = $(NVIDIA_TEGRA23_SITE)
-NVIDIA_TEGRA23_BINARIES_SOURCE = $(NVIDIA_TEGRA23_BASE)_R$(NVIDIA_TEGRA23_BINARIES_VERSION)_armhf.tbz2
-
-NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of NVIDIA Software
-NVIDIA_TEGRA23_BINARIES_LICENSE_FILES = nv_tegra/LICENSE
-
-NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
-
-# Those are not really needed to build nvidia-tegra23-binaries, but
-# will be needed by packages who link against libraries provided by
-# nvidia-tegra23-binaries.
-
-NVIDIA_TEGRA23_BINARIES_DEPENDENCIES = mesa3d-headers \
-	xlib_libX11 xlib_libXext
-
-NVIDIA_TEGRA23_BINARIES_PROVIDES = libegl libgles libopenmax
-
-NVIDIA_TEGRA23_BINARIES_DRV = \
-	nv_tegra/nvidia_drivers/usr/lib/xorg/modules/drivers/tegra_drv.abi$(BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI).so
-
-define NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
-	$(INSTALL) -d $(@D)/nv_tegra/nvidia_drivers
-	$(call suitable-extractor,$(@D)/nv_tegra/nvidia_drivers.tbz2) \
-		$(@D)/nv_tegra/nvidia_drivers.tbz2 | \
-	$(TAR) --strip-components=0 -C $(@D)/nv_tegra/nvidia_drivers/ $(TAR_OPTIONS) -
-endef
-NVIDIA_TEGRA23_BINARIES_POST_EXTRACT_HOOKS += NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
-
-define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
-	mkdir -p $(1)/usr/lib
-	cp -dpfr $(@D)/nv_tegra/nvidia_drivers/usr/lib/*.so $(1)/usr/lib/
-	(cd $(1)/usr/lib; \
-		ln -sf libGLESv2.so.2 libGLESv2.so; \
-		ln -sf libGLESv1_CM.so.1 libGLESv1_CM.so; \
-		ln -sf libEGL.so.1 libEGL.so \
-	)
-endef
-
-define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
-	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(STAGING_DIR))
-	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
-	cp -dpfr package/nvidia-tegra23/nvidia-tegra23-binaries/*.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/
-endef
-
-define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
-	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(TARGET_DIR))
-	mkdir -p $(TARGET_DIR)/lib/firmware/
-	cp -dpfr $(@D)/nv_tegra/nvidia_drivers/lib/firmware/*.bin \
-		$(TARGET_DIR)/lib/firmware/
-	$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nvidia_drivers/etc/nv_tegra_release \
-		$(TARGET_DIR)/etc/nv_tegra_release
-	$(INSTALL) -D -m 0644 $(@D)/$(NVIDIA_TEGRA23_BINARIES_DRV) \
-		$(TARGET_DIR)/usr/lib/xorg/modules/drivers/tegra_drv.so
-endef
-
-$(eval $(generic-package))
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in b/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
deleted file mode 100644
index df9de69dc4..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-codecs/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_NVIDIA_TEGRA23_CODECS
-	bool "nvidia-tegra23 codecs"
-	depends on BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
-	help
-	  NVIDIA Tegra restricted codecs from Linux For Tegra 16.5.
-
-	  https://developer.nvidia.com/linux-tegra-rel-16
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
deleted file mode 100644
index 9b5c61496f..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# From https://developer.nvidia.com/linux-tegra-rel-16
-sha1 540e89d5462537cd59c8a86efdb786b3b4310868 Tegra20_Linux-codecs_R16.5_armhf.tbz2
-sha1 3637efe808f25594e3cdc2756aef6e0274ab70f4 Tegra30_Linux-codecs_R16.5_armhf.tbz2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk b/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
deleted file mode 100644
index 2885021c58..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23-codecs/nvidia-tegra23-codecs.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# nvidia-tegra23-codecs
-#
-################################################################################
-
-NVIDIA_TEGRA23_CODECS_VERSION = $(NVIDIA_TEGRA23_VERSION)
-NVIDIA_TEGRA23_CODECS_SOURCE = $(NVIDIA_TEGRA23_BASE)-codecs_R$(NVIDIA_TEGRA23_CODECS_VERSION)_armhf.tbz2
-NVIDIA_TEGRA23_CODECS_SITE = $(NVIDIA_TEGRA23_SITE)
-NVIDIA_TEGRA23_CODECS_LICENSE = NVIDIA(r) Tegra(r) Software License Agreement
-NVIDIA_TEGRA23_CODECS_LICENSE_FILES = Tegra_Software_License_Agreement-Tegra-Linux-codecs.txt
-NVIDIA_TEGRA23_CODECS_REDISTRIBUTE = NO
-
-# The archive contains an archive with the firmware codecs
-define NVIDIA_TEGRA23_CODECS_EXTRACT_CMDS
-	$(INSTALL) -d $(@D)
-	$(call suitable-extractor,$(NVIDIA_TEGRA23_CODECS_SOURCE)) \
-		$(NVIDIA_TEGRA23_CODECS_DL_DIR)/$(NVIDIA_TEGRA23_CODECS_SOURCE) | \
-	$(TAR) --strip-components=0 -C $(@D) $(TAR_OPTIONS) -
-	$(INSTALL) -d $(@D)/restricted_codecs
-	$(call suitable-extractor,$(@D)/restricted_codecs.tbz2) \
-		$(@D)/restricted_codecs.tbz2 | \
-	$(TAR) --strip-components=0 -C $(@D)/restricted_codecs/ $(TAR_OPTIONS) -
-endef
-
-define NVIDIA_TEGRA23_CODECS_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/lib/firmware/
-	cp -dpfr $(@D)/restricted_codecs/lib/firmware/*.axf \
-		$(TARGET_DIR)/lib/firmware/
-endef
-
-$(eval $(generic-package))
diff --git a/package/nvidia-tegra23/nvidia-tegra23.mk b/package/nvidia-tegra23/nvidia-tegra23.mk
deleted file mode 100644
index b97d0ccac4..0000000000
--- a/package/nvidia-tegra23/nvidia-tegra23.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# nvidia-tegra23
-#
-################################################################################
-
-NVIDIA_TEGRA23_VERSION = 16.5
-
-ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA2),y)
-NVIDIA_TEGRA23_SITE = http://developer.download.nvidia.com/mobile/tegra/l4t/r16.5.0/ventana_release_armhf
-NVIDIA_TEGRA23_BASE = Tegra20_Linux
-endif
-ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3),y)
-NVIDIA_TEGRA23_SITE = http://developer.download.nvidia.com/mobile/tegra/l4t/r16.5.0/cardhu_release_armhf
-NVIDIA_TEGRA23_BASE = Tegra30_Linux
-endif
-
-include $(sort $(wildcard package/nvidia-tegra23/*/*.mk))
diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
index be586a2c2e..fceb28839b 100755
--- a/support/scripts/pkg-stats
+++ b/support/scripts/pkg-stats
@@ -296,7 +296,6 @@ def get_pkglist(npackages, package_list):
                      "package/x11r7/x11r7.mk",
                      "package/doc-asciidoc.mk",
                      "package/pkg-.*.mk",
-                     "package/nvidia-tegra23/nvidia-tegra23.mk",
                      "toolchain/toolchain-external/pkg-toolchain-external.mk",
                      "toolchain/toolchain-external/toolchain-external.mk",
                      "toolchain/toolchain.mk",
