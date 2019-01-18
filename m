From: Louis-Paul Cordier <lpdev@cordier.org>
Date: Fri, 18 Jan 2019 21:10:42 +0100
Subject: [Buildroot] [PATCH 3/6] intel-mediasdk: new package.
In-Reply-To: <20190118201045.13947-1-lpdev@cordier.org>
References: <20190118201045.13947-1-lpdev@cordier.org>
Message-ID: <20190118201045.13947-4-lpdev@cordier.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Louis-Paul Cordier <lpdev@cordier.org>
---
 package/Config.in                          |  1 +
 package/intel-mediasdk/Config.in           | 15 +++++++
 package/intel-mediasdk/intel-mediasdk.hash |  2 +
 package/intel-mediasdk/intel-mediasdk.mk   | 48 ++++++++++++++++++++++
 package/intel-mediasdk/intel-mediasdk.sh   |  4 ++
 package/intel-mediasdk/libmfx.pc           |  9 ++++
 6 files changed, 79 insertions(+)
 create mode 100644 package/intel-mediasdk/Config.in
 create mode 100644 package/intel-mediasdk/intel-mediasdk.hash
 create mode 100644 package/intel-mediasdk/intel-mediasdk.mk
 create mode 100755 package/intel-mediasdk/intel-mediasdk.sh
 create mode 100644 package/intel-mediasdk/libmfx.pc

diff --git a/package/Config.in b/package/Config.in
index f80d5b69d9..51d272df55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1267,6 +1267,7 @@ menu "Graphics"
 	source "package/imlib2/Config.in"
 	source "package/intel-gmmlib/Config.in"
 	source "package/intel-mediadriver/Config.in"
+	source "package/intel-mediasdk/Config.in"
 	source "package/irrlicht/Config.in"
 	source "package/jasper/Config.in"
 	source "package/jpeg/Config.in"
diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
new file mode 100644
index 0000000000..cfed061027
--- /dev/null
+++ b/package/intel-mediasdk/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_INTEL_MEDIASDK
+	bool "intel-mediasdk"
+	depends on BR2_x86_64
+	select BR2_PACKAGE_INTEL_MEDIADRIVER
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_INTEL
+	help
+	  Intel(R) Media SDK provides an API to access
+	  hardware-accelerated video decode, encode and filtering on
+	  Intel? platforms with integrated graphics.
+
+	  Supported video encoders: HEVC, AVC, MPEG-2, JPEG
+	  Supported Video decoders: HEVC, AVC, VP8, MPEG-2, VC1, JPEG
+	  Supported video pre-processing filters: Color Conversion,
+	  Deinterlace, Denoise, Resize, Rotate, Composition
diff --git a/package/intel-mediasdk/intel-mediasdk.hash b/package/intel-mediasdk/intel-mediasdk.hash
new file mode 100644
index 0000000000..e7081ae7d2
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 46f54f22e5a9cf41f1a6ab55346a0513ed02b2e99d41f9d178c6820d378922e3  intel-mediasdk-18.3.1.tar.gz
diff --git a/package/intel-mediasdk/intel-mediasdk.mk b/package/intel-mediasdk/intel-mediasdk.mk
new file mode 100644
index 0000000000..ee9f05f852
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# intel-mediasdk
+#
+################################################################################
+
+# Resources for building the MediaSDK:
+# - https://software.intel.com/en-us/articles/build-and-debug-open-source-media-stack
+
+INTEL_MEDIASDK_VERSION = 18.3.1
+INTEL_MEDIASDK_SITE = http://github.com/Intel-Media-SDK/MediaSDK/archive
+INTEL_MEDIASDK_LICENSE = MIT
+INTEL_MEDIASDK_LICENSE_FILES = COPYING
+
+INTEL_MEDIASDK_INSTALL_STAGING = YES
+INTEL_MEDIASDK_DEPENDENCIES += intel-mediadriver
+INTEL_MEDIASDK_DEPENDENCIES += libdrm
+
+define INTEL_MEDIASDK_PRE_CONFIGURE_FIXUP
+	# We need to copy MFX headers into staging dir due to a bug into FindMFX.cmake.
+	cp $(@D)/api/include/* $(STAGING_DIR)/usr/include
+endef
+
+define INTEL_MEDIASDK_POST_INSTALL_STAGING_HEADERFIX
+	# Some programs need to have the MFX headers under usr/include/mfx folder (like FFMpeg).
+	mkdir -p $(STAGING_DIR)/usr/include/mfx
+	cp $(STAGING_DIR)/usr/include/mfx*.h $(STAGING_DIR)/usr/include/mfx/
+endef
+
+define INTEL_MEDIASDK_INSTALL_TARGET_CMDS
+    # Copy runtimes.
+	cp -a $(STAGING_DIR)/usr/lib/libmfx* $(TARGET_DIR)/lib
+
+    # Copy plugins.
+	cp -r $(STAGING_DIR)/usr/lib/mfx/ $(TARGET_DIR)/usr/lib/mfx/
+
+	# Copy plugin parameters & samples.
+	cp -r $(STAGING_DIR)/usr/share/mfx $(TARGET_DIR)/usr/share/
+
+	# Set environment configuration.
+	mkdir -p $(TARGET_DIR)/etc/profile.d
+	cp package/intel-mediasdk/intel-mediasdk.sh $(TARGET_DIR)/etc/profile.d/
+endef
+
+INTEL_MEDIASDK_PRE_CONFIGURE_HOOKS += INTEL_MEDIASDK_PRE_CONFIGURE_FIXUP
+INTEL_MEDIASDK_POST_INSTALL_STAGING_HOOKS += INTEL_MEDIASDK_POST_INSTALL_STAGING_HEADERFIX
+
+$(eval $(cmake-package))
diff --git a/package/intel-mediasdk/intel-mediasdk.sh b/package/intel-mediasdk/intel-mediasdk.sh
new file mode 100755
index 0000000000..06150f2eb9
--- /dev/null
+++ b/package/intel-mediasdk/intel-mediasdk.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+# add libva driver path/name exporting for intel media solution
+export LIBVA_DRIVERS_PATH=/lib/dri/
+export LIBVA_DRIVER_NAME=iHD
diff --git a/package/intel-mediasdk/libmfx.pc b/package/intel-mediasdk/libmfx.pc
new file mode 100644
index 0000000000..963b15a496
--- /dev/null
+++ b/package/intel-mediasdk/libmfx.pc
@@ -0,0 +1,9 @@
+prefix=/opt/intel/mediasdk
+exec_prefix=${prefix}
+libdir=${prefix}/lib/lin_x64
+includedir=${prefix}/include
+Name: libmfx
+Description: Intel Media Server Studio SDK
+Version: 18.3.1
+Libs: -L${libdir} -lmfx -lva -lstdc++ -ldl -lva-drm -ldrm
+Cflags: -I${includedir} -I/usr/include/libdrm
\ No newline at end of file
-- 
2.20.1
