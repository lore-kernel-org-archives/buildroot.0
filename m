From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri,  7 Nov 2014 16:57:52 +0100
Subject: [Buildroot] [PATCH 2/4] gpu-amd-bin-mx51: new package
In-Reply-To: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
References: <1415375874-17331-1-git-send-email-jezz@sysmic.org>
Message-ID: <1415375874-17331-3-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Freescale libraries, headers and executables for the
AMD GPU on the i.MX51, containing OpenGL/ES, OpenVG
and EGL support.

Tested using:
    mx5loco_defconfig:
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_PACKAGE_QT5=y
    BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
    BR2_PACKAGE_QT5BASE_EXAMPLES=y
    BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
    BR2_PACKAGE_QT5BASE_EGLFS=y
    BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
    BR2_PACKAGE_QT5BASE_GIF=y
    BR2_PACKAGE_QT5BASE_JPEG=y
    BR2_PACKAGE_QT5BASE_PNG=y
    BR2_PACKAGE_QT5QUICKCONTROLS=y
    BR2_PACKAGE_FREESCALE_IMX=y
    BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53=y
    BR2_PACKAGE_GPU_AMD_BIN_MX51=y

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/freescale-imx/Config.in                    |  1 +
 package/freescale-imx/gpu-amd-bin-mx51/Config.in   | 54 ++++++++++++++++++
 package/freescale-imx/gpu-amd-bin-mx51/egl.pc      | 10 ++++
 package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc   | 10 ++++
 .../gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk           | 66 ++++++++++++++++++++++
 package/freescale-imx/gpu-amd-bin-mx51/vg.pc       | 10 ++++
 6 files changed, 151 insertions(+)
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/Config.in
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/egl.pc
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
 create mode 100644 package/freescale-imx/gpu-amd-bin-mx51/vg.pc

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 71b7f0b..6ed99fe 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -47,6 +47,7 @@ source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
 source "package/freescale-imx/libz160/Config.in"
+source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 endif
 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/Config.in b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
new file mode 100644
index 0000000..86038b8
--- /dev/null
+++ b/package/freescale-imx/gpu-amd-bin-mx51/Config.in
@@ -0,0 +1,54 @@
+comment "gpu-amd-bin-mx51 needs an (e)glibc toolchain w/ C++"
+	depends on BR2_arm
+	depends on (!BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP)
+
+config BR2_PACKAGE_GPU_AMD_BIN_MX51
+	bool "gpu-amd-bin-mx51"
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	select BR2_PACKAGE_HAS_LIBOPENVG
+	depends on BR2_arm # Only relevant for i.MX5
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  Freescale libraries, headers and executables for the
+	  AMD GPU on the i.MX51, containing OpenGL/ES, OpenVG
+	  and EGL support.
+
+if BR2_PACKAGE_GPU_AMD_BIN_MX51
+
+choice
+	prompt "Output option"
+	help
+	  There are two versions of this library: one for
+	  direct framebuffer access, one for X11 rendering.
+	  Choose here which version to install.
+
+config BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_X11
+	depends on BR2_PACKAGE_XORG7
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XLIB_LIBX11
+	select BR2_PACKAGE_XLIB_LIBXEXT
+	select BR2_PACKAGE_XLIB_LIBXRENDER
+	select BR2_PACKAGE_XLIB_LIBXDMCP
+	select BR2_PACKAGE_XLIB_LIBXAU
+	bool "X11"
+
+comment "X11 backend needs Xorg package"
+	depends on !BR2_PACKAGE_XORG7
+
+config BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_FB
+	bool "Framebuffer"
+
+endchoice
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "gpu-amd-bin-mx51"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "gpu-amd-bin-mx51"
+
+config BR2_PACKAGE_PROVIDES_LIBOPENVG
+	default "gpu-amd-bin-mx51"
+
+endif
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/egl.pc b/package/freescale-imx/gpu-amd-bin-mx51/egl.pc
new file mode 100644
index 0000000..b0ff229
--- /dev/null
+++ b/package/freescale-imx/gpu-amd-bin-mx51/egl.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: egl
+Description: Freescale amd-gpu-bin-mx51 implementation of EGL
+Version: 7.11.0
+Libs: -L${libdir} -lEGL
+Cflags: -I${includedir}
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc b/package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc
new file mode 100644
index 0000000..6f9b7fc
--- /dev/null
+++ b/package/freescale-imx/gpu-amd-bin-mx51/glesv2.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: glesv2
+Description: Freescale amd-gpu-bin-mx51 implementation of OpenGL ESv2
+Version: 7.11.0
+Libs: -L${libdir} -lGLESv2
+Cflags: -I${includedir}
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
new file mode 100644
index 0000000..b4f0da4
--- /dev/null
+++ b/package/freescale-imx/gpu-amd-bin-mx51/gpu-amd-bin-mx51.mk
@@ -0,0 +1,66 @@
+#############################################################
+#
+# gpu-amd-bin-mx51
+#
+#############################################################
+GPU_AMD_BIN_MX51_VERSION = 11.09.01
+GPU_AMD_BIN_MX51_SITE = $(FREESCALE_IMX_SITE)
+ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_FB),y)
+GPU_AMD_BIN_MX51_SOURCE = amd-gpu-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION).bin
+else
+GPU_AMD_BIN_MX51_SOURCE = amd-gpu-x11-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION).bin
+GPU_AMD_BIN_MX51_DEPENDENCIES = libxcb xlib_libX11 xlib_libXext \
+	xlib_libXrender xlib_libXau xlib_libXdmcp
+endif
+GPU_AMD_BIN_MX51_PROVIDES = libegl libgles libopenvg
+GPU_AMD_BIN_MX51_LICENSE = Freescale Semiconductor Software License Agreement
+GPU_AMD_BIN_MX51_INSTALL_STAGING = YES
+
+# No license file is included in the archive; we could extract it from
+# the self-extractor, but that's just too much effort.
+# This is a legal minefield: the EULA specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+GPU_AMD_BIN_MX51_REDISTRIBUTE = NO
+
+# The archive is a shell-self-extractor of a bzipped tar. Output directory 
+# depends of version of source.
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info.
+define GPU_AMD_BIN_MX51_EXTRACT_CMDS
+	(cd $(@D); \
+		sh $(DL_DIR)/$(GPU_AMD_BIN_MX51_SOURCE) --force --auto-accept)
+	mv $(@D)/amd-gpu*-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)/* $(@D)
+	rmdir $(@D)/amd-gpu*-bin-mx51-$(GPU_AMD_BIN_MX51_VERSION)
+endef
+
+define GPU_AMD_BIN_MX51_BUILD_CMDS
+	$(SED) 's/_LINUX/__linux__/g' $(@D)/usr/include/*/*.h
+endef
+
+# eglplatform_1.4.h contains X11 compatible headers
+ifeq ($(BR2_PACKAGE_GPU_AMD_BIN_MX51_OUTPUT_FB),)
+define GPU_AMD_BIN_MX51_FIXUP_EGL_HEADERS
+	rm $(STAGING_DIR)/usr/include/EGL/eglplatform.h
+	mv $(STAGING_DIR)/usr/include/EGL/eglplatform_1.4.h $(STAGING_DIR)/usr/include/EGL/eglplatform.h
+endef
+endif
+
+define GPU_AMD_BIN_MX51_INSTALL_STAGING_CMDS
+	$(INSTALL) -d $(STAGING_DIR)/usr/lib/pkgconfig
+	$(INSTALL) -m 644 package/freescale-imx/gpu-amd-bin-mx51/*.pc $(STAGING_DIR)/usr/lib/pkgconfig/
+	$(INSTALL) -m 644 $(@D)/usr/lib/lib* $(STAGING_DIR)/usr/lib/
+	cp -r $(@D)/usr/include/* $(STAGING_DIR)/usr/include
+	$(GPU_AMD_BIN_MX51_FIXUP_EGL_HEADERS)
+endef
+
+define GPU_AMD_BIN_MX51_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 $(@D)/usr/lib/lib*so* $(TARGET_DIR)/usr/lib/
+endef
+
+define GPU_AMD_BIN_MX51_DEVICES
+	/dev/gsl_kmod c 640 0 0 249 0 1 4
+endef
+
+$(eval $(generic-package))
diff --git a/package/freescale-imx/gpu-amd-bin-mx51/vg.pc b/package/freescale-imx/gpu-amd-bin-mx51/vg.pc
new file mode 100644
index 0000000..8fe956e
--- /dev/null
+++ b/package/freescale-imx/gpu-amd-bin-mx51/vg.pc
@@ -0,0 +1,10 @@
+prefix=/usr
+exec_prefix=${prefix}
+libdir=${exec_prefix}/lib
+includedir=${prefix}/include
+
+Name: vg
+Description: Freescale amd-gpu-bin-mx51 implementation of OpenVG
+Version: 1.1
+Libs: -L${libdir} -lOpenVG
+Cflags: -I${includedir}/
-- 
1.9.1
