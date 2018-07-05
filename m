From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Thu,  5 Jul 2018 08:57:54 +0200
Subject: [Buildroot] [PATCH 2/3] ti-sgx-{km, um,
 demos}: bump from SDK 02.00 to SDK 04.00
In-Reply-To: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
References: <1530773875-19452-1-git-send-email-tolvupostur@gmail.com>
Message-ID: <1530773875-19452-2-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixed build and added license file hashes.
Depends on new package ti-sgx-libgbm.

Jumps from branch am4/k4.1 to ti-img-sgx/1.14.3699939/k4.9

Signed-off-by: Einar Jon Gunnarsson <tolvupostur@gmail.com>
---
 Config.in.legacy                       | 18 ++++++++++++++++++
 package/ti-sgx-demos/ti-sgx-demos.hash |  3 ++-
 package/ti-sgx-demos/ti-sgx-demos.mk   | 20 ++++++++++++++++----
 package/ti-sgx-km/Config.in            | 23 ++++++++++-------------
 package/ti-sgx-km/ti-sgx-km.hash       |  3 ++-
 package/ti-sgx-km/ti-sgx-km.mk         | 22 ++++++++++------------
 package/ti-sgx-um/Config.in            |  3 ++-
 package/ti-sgx-um/S80ti-sgx            | 14 --------------
 package/ti-sgx-um/powervr.ini          |  4 ++--
 package/ti-sgx-um/ti-sgx-um.hash       |  3 ++-
 package/ti-sgx-um/ti-sgx-um.mk         | 32 +++++++++++++++++++++++++-------
 11 files changed, 89 insertions(+), 56 deletions(-)
 delete mode 100644 package/ti-sgx-um/S80ti-sgx

diff --git a/Config.in.legacy b/Config.in.legacy
index 9743ebd..2349d5e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -296,6 +296,15 @@ config BR2_PACKAGE_TI_SGX_AM4430
 	  BR2_PACKAGE_TI_SGX_AM4430 has been renamed to
 	  BR2_PACKAGE_TI_SGX_KM_AM4430.
 
+# Note: BR2_PACKAGE_TI_SGX_KM_AM4430 is still referenced from
+# package/ti-sgx-km/Config.in
+config BR2_PACKAGE_TI_SGX_KM_AM4430
+	bool "ti-sgx-km AM4430 option removed"
+	select BR2_LEGACY
+	help
+	  The AM4430 option has been replaced by AM437X
+	  in the 4.9 kernel.
+
 # Note: BR2_PACKAGE_TI_SGX_AM5430 is still referenced from
 # package/ti-sgx-km/Config.in
 config BR2_PACKAGE_TI_SGX_AM5430
@@ -306,6 +315,15 @@ config BR2_PACKAGE_TI_SGX_AM5430
 	  BR2_PACKAGE_TI_SGX_AM5430 has been renamed to
 	  BR2_PACKAGE_TI_SGX_KM_AM5430.
 
+# Note: BR2_PACKAGE_TI_SGX_KM_AM5430 is still referenced from
+# package/ti-sgx-km/Config.in
+config BR2_PACKAGE_TI_SGX_KM_AM5430
+	bool "ti-sgx-km AM5430 option removed"
+	select BR2_LEGACY
+	help
+	  The AM5430 option has been replaced by AM57X
+	  in the 4.9 kernel.
+
 config BR2_PACKAGE_JANUS_AUDIO_BRIDGE
 	bool "janus-gateway audio-bridge option renamed"
 	select BR2_LEGACY
diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index 43acf91..2b8be48 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 9d1d4da2c2b35303e239f99eb4003b8b206078a682aa083d5fb831ee4197f3bf ti-sgx-demos-f24650bc8243b25c23d6a0a502ed79fc472ac424.tar.gz
+sha256 32e6887fbed83bd937bf9761ee51adc5253c22161d7d6b720713cecaf0c212fc ti-sgx-demos-f09e59b2467cb0a5b88b6329fe35527cf65ed6e9.tar.gz
+sha256 052741ea66a4a48e0ef8cab259d2dc136e7cf52fda694af8d1fe9bd28abe333b LegalNotice.txt
diff --git a/package/ti-sgx-demos/ti-sgx-demos.mk b/package/ti-sgx-demos/ti-sgx-demos.mk
index 80af79b..8e56b40 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.mk
+++ b/package/ti-sgx-demos/ti-sgx-demos.mk
@@ -4,15 +4,27 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_DEMOS_VERSION = f24650bc8243b25c23d6a0a502ed79fc472ac424
+# This corresponds to SDK 04.00.00.00
+TI_SGX_DEMOS_VERSION = f09e59b2467cb0a5b88b6329fe35527cf65ed6e9
 TI_SGX_DEMOS_SITE = git://git.ti.com/graphics/img-pvr-sdk.git
 TI_SGX_DEMOS_LICENSE = Imagination Technologies License Agreement
 TI_SGX_DEMOS_LICENSE_FILES = LegalNotice.txt
 
+# Wayland demos seem to need at least X11
+TI_SGX_DEMOS_SUBDIR = NullWS
+
+# The full demo folder is +100MB, so limit to 5 like in SDK 02.00.00.00
+TI_SGX_DEMOS_BINARIES = OGLES2ChameleonMan \
+	OGLES2FilmTV \
+	OGLES2MagicLantern \
+	OGLES2ParticleSystem \
+	OGLES2BinaryShader
+
 define TI_SGX_DEMOS_INSTALL_TARGET_CMDS
-	cp -dpfr $(@D)/targetfs/Examples/Advanced/OGLES* \
-		$(TARGET_DIR)/usr/bin/
+	for i in $(TI_SGX_DEMOS_BINARIES) ; do \
+		cp -dpfr $(@D)/targetfs/Examples/Advanced/$(TI_SGX_DEMOS_SUBDIR)/$$i \
+			$(TARGET_DIR)/usr/bin/ ; \
+	done
 endef
 
 $(eval $(generic-package))
diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
index 348efde..2997faf 100644
--- a/package/ti-sgx-km/Config.in
+++ b/package/ti-sgx-km/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TI_SGX_KM
 	select BR2_LINUX_NEEDS_MODULES
 	help
 	  Kernel modules for TI CPUs with SGX GPU.
-	  This package supports AM335x, AM437x, AM4430 and AM5430.
+	  This package supports AM33xx, AM43xx and AM57xx.
 	  It builds the kernel module and the user space binaries.
 	  For older CPUs or kernels use the ti-gfx package.
 
@@ -22,8 +22,10 @@ choice
 	prompt "Target"
 	default BR2_PACKAGE_TI_SGX_KM_AM335X if BR2_PACKAGE_TI_SGX_AM335X # legacy
 	default BR2_PACKAGE_TI_SGX_KM_AM437X if BR2_PACKAGE_TI_SGX_AM437X # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM4430 if BR2_PACKAGE_TI_SGX_AM4430 # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM5430 if BR2_PACKAGE_TI_SGX_AM5430 # legacy
+	default BR2_PACKAGE_TI_SGX_KM_AM437X if BR2_PACKAGE_TI_SGX_AM4430    # legacy
+	default BR2_PACKAGE_TI_SGX_KM_AM437X if BR2_PACKAGE_TI_SGX_KM_AM4430 # legacy
+	default BR2_PACKAGE_TI_SGX_KM_AM57X  if BR2_PACKAGE_TI_SGX_AM5430    # legacy
+	default BR2_PACKAGE_TI_SGX_KM_AM57X  if BR2_PACKAGE_TI_SGX_KM_AM5430 # legacy
 	default BR2_PACKAGE_TI_SGX_KM_AM335X
 	help
 	  Select the SOC for which you would like to install drivers.
@@ -31,22 +33,17 @@ choice
 config BR2_PACKAGE_TI_SGX_KM_AM335X
 	bool "AM335x"
 	help
-	  AM335x CPU
+	  All AM33xx derivatives
 
 config BR2_PACKAGE_TI_SGX_KM_AM437X
 	bool "AM437x"
 	help
-	  AM437x CPU
+	  All AM43xx derivatives
 
-config BR2_PACKAGE_TI_SGX_KM_AM4430
-	bool "AM4430"
+config BR2_PACKAGE_TI_SGX_KM_AM57X
+	bool "AM57x"
 	help
-	  AM4430 CPU
-
-config BR2_PACKAGE_TI_SGX_KM_AM5430
-	bool "AM5430"
-	help
-	  AM5430 CPU
+	  All DRA7xx / AM57xx derivatives
 
 endchoice
 
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index 7f7e0ac..f02ddce 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 47728ff8fc48827116cc042efa777a22a83dd4bd17c494e2a53b8c204ca59624 ti-sgx-km-2b7523d07a13ab704a24a7664749551f4a13ed32.tar.gz
+sha256 c9023eb01d611be71bada4903645b60dea4529b8276a7827db48fbd2bae27583 ti-sgx-km-0086977380d3320d70a3abc78b95fa0641427073.tar.gz
+sha256 e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4 eurasia_km/GPL-COPYING
diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index 0e1bc33..ed827ef 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
+# This corresponds to SDK 04.00.00.00
+TI_SGX_KM_VERSION = 0086977380d3320d70a3abc78b95fa0641427073
 TI_SGX_KM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-linux.git
 TI_SGX_KM_LICENSE = GPL-2.0
-TI_SGX_KM_LICENSE_FILES = GPL-COPYING
+TI_SGX_KM_LICENSE_FILES = eurasia_km/GPL-COPYING
 
 TI_SGX_KM_DEPENDENCIES = linux
 
@@ -17,25 +17,23 @@ TI_SGX_KM_MAKE_OPTS = \
 	KERNELDIR=$(LINUX_DIR) \
 	PVR_NULLDRM=1
 
+TI_SGX_KM_PLATFORM_NAME = omap
+
 ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
-TI_SGX_KM_PLATFORM_NAME = omap335x
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM437X),y)
-TI_SGX_KM_PLATFORM_NAME = omap437x
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM4430),y)
-TI_SGX_KM_PLATFORM_NAME = omap4430
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_5430),y)
-TI_SGX_KM_PLATFORM_NAME = omap5430
+TI_SGX_KM_MAKE_ENV += TARGET_PRODUCT=ti335x
+else ifeq ($(BR2_PACKAGE_TI_KM_SGX_AM437X),y)
+TI_SGX_KM_MAKE_ENV += TARGET_PRODUCT=ti437x
 endif
 
 TI_SGX_KM_SUBDIR = eurasia_km/eurasiacon/build/linux2/$(TI_SGX_KM_PLATFORM_NAME)_linux
 
 define TI_SGX_KM_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
+	$(TI_SGX_KM_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
 		-C $(@D)/$(TI_SGX_KM_SUBDIR)
 endef
 
 define TI_SGX_KM_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
+	$(TI_SGX_KM_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
 		DISCIMAGE=$(TARGET_DIR) \
 		kbuild_install -C $(@D)/$(TI_SGX_KM_SUBDIR)
 endef
diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index 8e1e4fb..e27e500 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -15,9 +15,10 @@ config BR2_PACKAGE_TI_SGX_UM
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
+	select BR2_PACKAGE_TI_SGX_LIBGBM
 	help
 	  Graphics libraries for TI CPUs with SGX5xx GPU.
-	  This package supports AM335x, AM437x, AM4430 and AM5430.
+	  This package supports AM33xx, AM43xx and AM54xx.
 	  For older CPUs or kernels use the ti-gfx package.
 
 	  http://git.ti.com/graphics/omap5-sgx-ddk-um-linux
diff --git a/package/ti-sgx-um/S80ti-sgx b/package/ti-sgx-um/S80ti-sgx
deleted file mode 100644
index 8cae52f..0000000
--- a/package/ti-sgx-um/S80ti-sgx
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-case "$1" in
-  start)
-	printf "Initializing SGX graphics driver "
-	/usr/bin/pvrsrvinit
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-  ;;
-  stop)
-  ;;
-  *)
-    echo "Usage: $0 {start|stop}"
-    exit 1
-  ;;
-esac
diff --git a/package/ti-sgx-um/powervr.ini b/package/ti-sgx-um/powervr.ini
index fc92d45..229d143 100644
--- a/package/ti-sgx-um/powervr.ini
+++ b/package/ti-sgx-um/powervr.ini
@@ -1,6 +1,6 @@
 [default]
-#defaul library without double buffering:
-WindowSystem=libpvrDRMWSEGL_FRONT.so
+#default library:
+#WindowSystem=libpvrws_WAYLAND.so
 #alternative library, slower but with double buffering
 #WindowSystem=libpvrDRMWSEGL.so
 DisableHWTQTextureUpload=1
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index a6a0566..e7bae03 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,2 +1,3 @@
 # Locally computed:
-sha256 c17f23d255cff8fe72fc3f5cae3d7550e387af07d036954b4f08e573379406d0 ti-sgx-um-e15f1543bab4de9e8927a2c4934addf3fd16ffcb.tar.gz
+sha256 c6d9cfc4806d44f8dd73abe52ca0a292d004e68886ba1657ca5ac39ec1ab0025 ti-sgx-um-358fe42d34a7570896e5d1639869da564ddd0484.tar.gz
+sha256 733aedfdd192ef955f775f820729ac8ee5d26f7cfefd4c6bcbae80e68b7062dc TI-Linux-Graphics-DDK-UM-Manifest.doc
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index d5c50a0..c252ea1 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -4,22 +4,33 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_UM_VERSION = e15f1543bab4de9e8927a2c4934addf3fd16ffcb
+# This correpsonds to SDK 04.00.00.00
+TI_SGX_UM_VERSION = 358fe42d34a7570896e5d1639869da564ddd0484
 TI_SGX_UM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git
 TI_SGX_UM_LICENSE = TI TSPA License
-TI_SGX_UM_LICENSE_FILES = OMAP5-Linux-Graphics-DDK-UM-Manifest.doc
+TI_SGX_UM_LICENSE_FILES = TI-Linux-Graphics-DDK-UM-Manifest.doc
 TI_SGX_UM_INSTALL_STAGING = YES
 
 # ti-sgx-um is a egl/gles provider only if libdrm is installed
 TI_SGX_UM_DEPENDENCIES = libdrm
+# ti-sgx-libgbm must be built before QT to find EGL
+TI_SGX_UM_DEPENDENCIES += ti-sgx-libgbm
+
+# NOTE: TI_SGX_UM is intentionally using TI_SGX_KM variables
+ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
+TI_SGX_UM_MAKE_ENV += TARGET_PRODUCT=ti335x
+else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM437X),y)
+TI_SGX_UM_MAKE_ENV += TARGET_PRODUCT=ti437x
+else # BR2_PACKAGE_TI_SGX_KM_AM57X
+TI_SGX_UM_MAKE_ENV += TARGET_PRODUCT=jacinto6evm
+endif
 
 define TI_SGX_UM_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) install
+	$(TI_SGX_UM_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) install
 endef
 
 define TI_SGX_UM_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) install
+	$(TI_SGX_UM_MAKE_ENV) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) install
 endef
 
 # libs use the following file for configuration
@@ -28,11 +39,18 @@ define TI_SGX_UM_INSTALL_CONF
 		$(TARGET_DIR)/etc/powervr.ini
 endef
 
-TI_SGX_UM_POST_INSTALL_TARGET_HOOKS += TI_SGX_UM_INSTALL_CONF
+# Many binaries depend on libGLESv2.so.1, but libGLESv2.so.2 is installed
+define TI_SGX_UM_INSTALL_FIX_MESA_STYLE_SYMLINK
+	cp -dpf $(TARGET_DIR)/usr/lib/libGLESv2.so.2 $(TARGET_DIR)/usr/lib/libGLESv2.so.1
+endef
+
+TI_SGX_UM_POST_INSTALL_TARGET_HOOKS += TI_SGX_UM_INSTALL_CONF TI_SGX_UM_INSTALL_FIX_MESA_STYLE_SYMLINK
 
+# sysV file has the wrong name. Copy it from staging and delete the installed one
 define TI_SGX_UM_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/ti-sgx-um/S80ti-sgx \
+	$(INSTALL) -D -m 0755 $(STAGING_DIR)/etc/init.d/rc.pvr \
 		$(TARGET_DIR)/etc/init.d/S80ti-sgx
+	$(RM) $(TARGET_DIR)/etc/init.d/rc.pvr
 endef
 
 $(eval $(generic-package))
-- 
2.7.4
