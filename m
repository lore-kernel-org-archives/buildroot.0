From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:24:10 +0200
Subject: [Buildroot] [git commit] package/nvidia-tegra23-binaries: new
	package
Message-ID: <20150426202425.167EE818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a78c1258fb09b6d8b203c9680dd2761852f8c670
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a new package for all libraries and drivers
provided by Nvidia Linux4Tegra release 16.5.

We have intermediate .mk and Config.in, because those values will be
shared with the codecs package, to come in a follow-up patch, like we
have for the Freescale stuff.

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
[yann.morin.1998 at free.fr:
  - split jpeg into its own patch
  - split codecs and gstreamer plugins out into their own packages
  - do not patch for .pc files, just bundle them in $(@D)
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ben Ben <carmazen84@gmail.com>

[Thomas:
  - don't select BR2_PACKAGE_XLIB_LIBXT, there is no reference to it
    in <pkg>_DEPENDENCIES, and it doesn't seem to be used by any
    library.
  - select BR2_PACKAGE_XLIB_LIBX11, which is referenced by the .mk
    file, and is actually used by the pre-built .so files.
  - do not select BR2_PACKAGE_XLIB_LIBXV, since it isn't used by the
    X.org libraries/drivers, but only the Gstreamer ones.
  - remove 'NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET = YES', it is not
    needed since it is the default.
  - remove the definitions of NVIDIA_TEGRA23_BINARIES_FIRMWARE,
    NVIDIA_TEGRA23_BINARIES_LIBRARIES and
    NVIDIA_TEGRA23_BINARIES_PKGCONFIG, these are very long, and not
    really needed: just copy all the firmware, libraries and .pc files
    with a simple 'cp -dpfr'.]

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/nvidia-tegra23/Config.in                   |   37 +++++++++++
 .../nvidia-tegra23-binaries/Config.in              |   26 ++++++++
 .../nvidia-tegra23/nvidia-tegra23-binaries/egl.pc  |   10 +++
 .../nvidia-tegra23/nvidia-tegra23-binaries/gles.pc |   10 +++
 .../nvidia-tegra23-binaries/glesv2.pc              |   10 +++
 .../nvidia-tegra23-binaries.hash                   |    3 +
 .../nvidia-tegra23-binaries.mk                     |   68 ++++++++++++++++++++
 package/nvidia-tegra23/nvidia-tegra23.mk           |   18 +++++
 9 files changed, 183 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index da185be..4e20e4d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -378,6 +378,7 @@ endif
 	source "package/nanocom/Config.in"
 	source "package/neard/Config.in"
 	source "package/nvidia-driver/Config.in"
+	source "package/nvidia-tegra23/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
diff --git a/package/nvidia-tegra23/Config.in b/package/nvidia-tegra23/Config.in
new file mode 100644
index 0000000..28c99c7
--- /dev/null
+++ b/package/nvidia-tegra23/Config.in
@@ -0,0 +1,37 @@
+menuconfig BR2_PACKAGE_NVIDIA_TEGRA23
+	bool "nvidia-tegra23"
+	depends on BR2_cortex_a9
+	depends on BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
+	help
+	  Install NVidia proprietary blobs to drive Tegra2 or Tegra3
+	  GPUs found in some mobile-targeted ARM SoCs.
+
+if BR2_PACKAGE_NVIDIA_TEGRA23
+
+choice
+	prompt "Tegra platform"
+	help
+	  Select the SOC platform.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA2
+	bool "Tegra 2"
+	help
+	  NVIDIA Tegra 2 is a dual-core Cortex-A9 without NEON.
+
+config BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3
+	bool "Tegra 3"
+	depends on BR2_ARM_CPU_HAS_NEON
+	help
+	  NVIDIA Tegra 3 is a quad-core Cortex-A9 with NEON.
+
+endchoice
+
+source "package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in"
+endif
+
+comment "nvidia-tegra23 needs Xorg <= 1.14 and a (e)glibc toolchain w/ EABIhf"
+	depends on BR2_cortex_a9
+	depends on !BR2_ARM_EABIHF || !BR2_TOOLCHAIN_USES_GLIBC \
+		|| !BR2_PACKAGE_XORG7 || !BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
new file mode 100644
index 0000000..d2b6223
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+	bool "nvidia-tegra23 binaries"
+	select BR2_PACKAGE_MESA3D_HEADERS
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENMAX
+	help
+	  Those packages provide libraries, drivers and firmware that comes from
+	  NVIDIA Linux For Tegra.
+
+	  https://developer.nvidia.com/linux-tegra
+
+if BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "nvidia-tegra23-binaries"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "nvidia-tegra23-binaries"
+
+config BR2_PACKAGE_PROVIDES_LIBOPENMAX
+	default "nvidia-tegra23-binaries"
+
+endif
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc b/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc
new file mode 100644
index 0000000..3af7eec
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/egl.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=/usr/lib
+includedir=/usr/include
+
+Name: egl
+Description: EGL implementation
+Version: 1
+Cflags: -I${includedir}/EGL
+Libs: -L${libdir} -lEGL
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc b/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc
new file mode 100644
index 0000000..91387c9
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/gles.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=/usr/lib
+includedir=/usr/include
+
+Name: glesv2
+Description: OpenGL ES 1.1 implementation
+Version: 1.1
+Cflags: -I${includedir}/GLES
+Libs: -L${libdir} -lGLESv1_CM
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc b/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc
new file mode 100644
index 0000000..356a1cb
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/glesv2.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=/usr/lib
+includedir=/usr/include
+
+Name: glesv2
+Description: OpenGL ES 2 implementation
+Version: 2
+Cflags: -I${includedir}/GLESv2
+Libs: -L${libdir} -lGLESv2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
new file mode 100644
index 0000000..50c3cda
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.hash
@@ -0,0 +1,3 @@
+# From https://developer.nvidia.com/linux-tegra-rel-16
+sha1 295dcd63b2f122c2d99f07fcc083db9adb8ac178 Tegra20_Linux_R16.5_armhf.tbz2
+sha1 6be645c20d81d518856bc8520ef4c2472d57eaef Tegra30_Linux_R16.5_armhf.tbz2
diff --git a/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
new file mode 100644
index 0000000..1d6c0f8
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23-binaries/nvidia-tegra23-binaries.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# nvidia-tegra23-binaries
+#
+################################################################################
+
+NVIDIA_TEGRA23_BINARIES_VERSION = $(NVIDIA_TEGRA23_VERSION)
+NVIDIA_TEGRA23_BINARIES_SITE = $(NVIDIA_TEGRA23_SITE)
+NVIDIA_TEGRA23_BINARIES_SOURCE = $(NVIDIA_TEGRA23_BASE)_R$(NVIDIA_TEGRA23_BINARIES_VERSION)_armhf.tbz2
+
+NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of NVIDIA Software
+NVIDIA_TEGRA23_BINARIES_LICENSE_FILES = nv_tegra/LICENSE
+
+NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
+
+# Those are not really needed to build nvidia-tegra23-binaries, but
+# will be needed by packages who link against libraries provided by
+# nvidia-tegra23-binaries.
+
+NVIDIA_TEGRA23_BINARIES_DEPENDENCIES = mesa3d-headers \
+	xlib_libX11 xlib_libXext
+
+NVIDIA_TEGRA23_BINARIES_PROVIDES = libegl libgles libopenmax
+
+NVIDIA_TEGRA23_BINARIES_DRV = \
+	nv_tegra/nvidia_drivers/usr/lib/xorg/modules/drivers/tegra_drv.abi$(BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI).so
+
+define NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
+	$(INSTALL) -d $(@D)/nv_tegra/nvidia_drivers
+	$(call suitable-extractor,$(@D)/nv_tegra/nvidia_drivers.tbz2) \
+		$(@D)/nv_tegra/nvidia_drivers.tbz2 | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D)/nv_tegra/nvidia_drivers/ $(TAR_OPTIONS) -
+	$(INSTALL) -d $(@D)/nv_tegra/nv_sample_apps/nvgstapps
+	$(call suitable-extractor,$(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2) \
+		$(@D)/nv_tegra/nv_sample_apps/nvgstapps.tbz2 | \
+	$(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D)/nv_tegra/nv_sample_apps/nvgstapps/ $(TAR_OPTIONS) -
+endef
+NVIDIA_TEGRA23_BINARIES_POST_EXTRACT_HOOKS += NVIDIA_TEGRA23_BINARIES_EXTRACT_FURTHER
+
+define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
+	mkdir -p $(1)/usr/lib
+	cp -dpfr $(@D)/nv_tegra/nvidia_drivers/usr/lib/*.so $(1)/usr/lib/
+	(cd $(1)/usr/lib; \
+		ln -sf libGLESv2.so.2 libGLESv2.so; \
+		ln -sf libGLESv1_CM.so.1 libGLESv1_CM.so; \
+		ln -sf libEGL.so.1 libEGL.so \
+	)
+endef
+
+define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(STAGING_DIR))
+	mkdir -p $(STAGING_DIR)/usr/lib/pkgconfig/
+	cp -dpfr package/nvidia-tegra23/nvidia-tegra23-binaries/*.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/
+endef
+
+define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
+	$(call NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(TARGET_DIR))
+	mkdir -p $(TARGET_DIR)/lib/firmware/
+	cp -dpfr $(@D)/nv_tegra/nvidia_drivers/lib/firmware/*.bin \
+		$(TARGET_DIR)/lib/firmware/
+	$(INSTALL) -D -m 0644 $(@D)/nv_tegra/nvidia_drivers/etc/nv_tegra_release \
+		$(TARGET_DIR)/etc/nv_tegra_release
+	$(INSTALL) -D -m 0644 $(@D)/$(NVIDIA_TEGRA23_BINARIES_DRV) \
+		$(TARGET_DIR)/usr/lib/xorg/modules/drivers/tegra_drv.so
+endef
+
+$(eval $(generic-package))
diff --git a/package/nvidia-tegra23/nvidia-tegra23.mk b/package/nvidia-tegra23/nvidia-tegra23.mk
new file mode 100644
index 0000000..b97d0cc
--- /dev/null
+++ b/package/nvidia-tegra23/nvidia-tegra23.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# nvidia-tegra23
+#
+################################################################################
+
+NVIDIA_TEGRA23_VERSION = 16.5
+
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA2),y)
+NVIDIA_TEGRA23_SITE = http://developer.download.nvidia.com/mobile/tegra/l4t/r16.5.0/ventana_release_armhf
+NVIDIA_TEGRA23_BASE = Tegra20_Linux
+endif
+ifeq ($(BR2_PACKAGE_NVIDIA_TEGRA23_TEGRA3),y)
+NVIDIA_TEGRA23_SITE = http://developer.download.nvidia.com/mobile/tegra/l4t/r16.5.0/cardhu_release_armhf
+NVIDIA_TEGRA23_BASE = Tegra30_Linux
+endif
+
+include $(sort $(wildcard package/nvidia-tegra23/*/*.mk))
