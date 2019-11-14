From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 14 Nov 2019 09:42:12 -0300
Subject: [Buildroot] [PATCH/next v2 2/5] package/ti-sgx-{km, um,
 demos}: bump to latest TI version
In-Reply-To: <20191114124215.12985-1-unixmania@gmail.com>
References: <20191114124215.12985-1-unixmania@gmail.com>
Message-ID: <20191114124215.12985-3-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lothar Felten <lothar.felten@gmail.com>

ti-sgx-um

- Bump the version that matches TI SDK 06.00.00.07 plus one pull request
  that updates the EGL/GLES headers required to build qt5base.
- Rewrite the init script, following the current template and using the
  pvrsrvctl command (pvrsrvinit does not exit anymore).
- Remove powervr.ini, no longer used in the TI SDK.
- Select and add a dependency on wayland, or else packages that link to
  libEGL (e.g. cairo) fail to link due to a missing libwayland-server.

ti-sgx-demos

- Bump the version that matches TI SDK 06.00.00.07 plus one pull request
  (matching ti-sgx-um).

ti-sgx-km

- Bump the version that matches TI SDK 06.00.00.07.

The buildroot package only supports the target am335x. Support for other
boards can be added by adding menu entries to select the correct target
product.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
Changes v1->v2:
- Do not install the init script provided by TI.
- Bump ti-sgx-um for EGL/GLES headers for qt5base, or else it breaks:
  qeglfskmsgbmintegration.cpp: In member function ?virtual void* QEglFSKmsGbmIntegration::createDisplay(EGLNativeDisplayType)?:
  qeglfskmsgbmintegration.cpp:85:60: error: invalid conversion from ?EGLNativeDisplayType? {aka ?int?} to ?void*? [-fpermissive]
           display = getPlatformDisplay(EGL_PLATFORM_GBM_KHR, nativeDisplay, nullptr);
- Bump ti-sgx-demos to match ti-sgx-um
- Select/depend on wayland (or else packages depending on ti-sgx-um fail
  to build due to missing libwayland-server).
- Update the init script
- Update commit message
---
 package/ti-sgx-demos/ti-sgx-demos.hash        |  2 +-
 package/ti-sgx-demos/ti-sgx-demos.mk          |  6 +-
 package/ti-sgx-km/Config.in                   | 37 +----------
 package/ti-sgx-km/ti-sgx-km.hash              |  2 +-
 package/ti-sgx-km/ti-sgx-km.mk                | 22 ++-----
 ...-Makefile-do-not-install-init-script.patch | 39 +++++++++++
 package/ti-sgx-um/Config.in                   |  3 +
 package/ti-sgx-um/S80ti-sgx                   | 64 +++++++++++++++----
 package/ti-sgx-um/powervr.ini                 |  6 --
 package/ti-sgx-um/ti-sgx-um.hash              |  2 +-
 package/ti-sgx-um/ti-sgx-um.mk                | 19 +++---
 11 files changed, 117 insertions(+), 85 deletions(-)
 create mode 100644 package/ti-sgx-um/0001-Makefile-do-not-install-init-script.patch
 delete mode 100644 package/ti-sgx-um/powervr.ini

diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index 43acf9102a..2ad0546895 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 9d1d4da2c2b35303e239f99eb4003b8b206078a682aa083d5fb831ee4197f3bf ti-sgx-demos-f24650bc8243b25c23d6a0a502ed79fc472ac424.tar.gz
+sha256 1324115da376bc8108923c596a3c4d8df24a968395461df11e0b715764a942d4  ti-sgx-demos-bb8b74cdd1323e76697b3eb2258f863b15fee287.tar.gz
diff --git a/package/ti-sgx-demos/ti-sgx-demos.mk b/package/ti-sgx-demos/ti-sgx-demos.mk
index 80af79b983..862483516c 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.mk
+++ b/package/ti-sgx-demos/ti-sgx-demos.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_DEMOS_VERSION = f24650bc8243b25c23d6a0a502ed79fc472ac424
+# This correpsonds to SDK 06.00.00.07 plus one pull request
+TI_SGX_DEMOS_VERSION = bb8b74cdd1323e76697b3eb2258f863b15fee287
 TI_SGX_DEMOS_SITE = git://git.ti.com/graphics/img-pvr-sdk.git
 TI_SGX_DEMOS_LICENSE = Imagination Technologies License Agreement
 TI_SGX_DEMOS_LICENSE_FILES = LegalNotice.txt
 
 define TI_SGX_DEMOS_INSTALL_TARGET_CMDS
-	cp -dpfr $(@D)/targetfs/Examples/Advanced/OGLES* \
+	cp -dpfr $(@D)/targetfs/arm/Examples/Advanced/Wayland/OGLES* \
 		$(TARGET_DIR)/usr/bin/
 endef
 
diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
index 348efdeb82..1e49a538fc 100644
--- a/package/ti-sgx-km/Config.in
+++ b/package/ti-sgx-km/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TI_SGX_KM
 	select BR2_LINUX_NEEDS_MODULES
 	help
 	  Kernel modules for TI CPUs with SGX GPU.
-	  This package supports AM335x, AM437x, AM4430 and AM5430.
+	  This package supports AM335x only.
 	  It builds the kernel module and the user space binaries.
 	  For older CPUs or kernels use the ti-gfx package.
 
@@ -16,38 +16,3 @@ config BR2_PACKAGE_TI_SGX_KM
 
 	  http://git.ti.com/graphics/omap5-sgx-ddk-linux
 
-if BR2_PACKAGE_TI_SGX_KM
-
-choice
-	prompt "Target"
-	default BR2_PACKAGE_TI_SGX_KM_AM335X if BR2_PACKAGE_TI_SGX_AM335X # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM437X if BR2_PACKAGE_TI_SGX_AM437X # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM4430 if BR2_PACKAGE_TI_SGX_AM4430 # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM5430 if BR2_PACKAGE_TI_SGX_AM5430 # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM335X
-	help
-	  Select the SOC for which you would like to install drivers.
-
-config BR2_PACKAGE_TI_SGX_KM_AM335X
-	bool "AM335x"
-	help
-	  AM335x CPU
-
-config BR2_PACKAGE_TI_SGX_KM_AM437X
-	bool "AM437x"
-	help
-	  AM437x CPU
-
-config BR2_PACKAGE_TI_SGX_KM_AM4430
-	bool "AM4430"
-	help
-	  AM4430 CPU
-
-config BR2_PACKAGE_TI_SGX_KM_AM5430
-	bool "AM5430"
-	help
-	  AM5430 CPU
-
-endchoice
-
-endif
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index 7f7e0acd4d..2bb5e55f6e 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 47728ff8fc48827116cc042efa777a22a83dd4bd17c494e2a53b8c204ca59624 ti-sgx-km-2b7523d07a13ab704a24a7664749551f4a13ed32.tar.gz
+sha256 f1505f38f9e82f958673bb1755e65090bdbc513a68d41640561d9d491bc4b0e3 ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d.tar.gz
diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index 0e1bc33902..6e1f3fa40e 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
+# This correpsonds to SDK 06.00.00.07
+TI_SGX_KM_VERSION = 4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d
 TI_SGX_KM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-linux.git
 TI_SGX_KM_LICENSE = GPL-2.0
 TI_SGX_KM_LICENSE_FILES = GPL-COPYING
@@ -15,19 +15,11 @@ TI_SGX_KM_DEPENDENCIES = linux
 TI_SGX_KM_MAKE_OPTS = \
 	$(LINUX_MAKE_FLAGS) \
 	KERNELDIR=$(LINUX_DIR) \
-	PVR_NULLDRM=1
-
-ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
-TI_SGX_KM_PLATFORM_NAME = omap335x
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM437X),y)
-TI_SGX_KM_PLATFORM_NAME = omap437x
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM4430),y)
-TI_SGX_KM_PLATFORM_NAME = omap4430
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_5430),y)
-TI_SGX_KM_PLATFORM_NAME = omap5430
-endif
-
-TI_SGX_KM_SUBDIR = eurasia_km/eurasiacon/build/linux2/$(TI_SGX_KM_PLATFORM_NAME)_linux
+	TARGET_PRODUCT=$(TI_SGX_KM_PLATFORM_NAME)
+
+TI_SGX_KM_PLATFORM_NAME = ti335x
+
+TI_SGX_KM_SUBDIR = eurasia_km/eurasiacon/build/linux2/omap_linux
 
 define TI_SGX_KM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
diff --git a/package/ti-sgx-um/0001-Makefile-do-not-install-init-script.patch b/package/ti-sgx-um/0001-Makefile-do-not-install-init-script.patch
new file mode 100644
index 0000000000..7509d4ef9d
--- /dev/null
+++ b/package/ti-sgx-um/0001-Makefile-do-not-install-init-script.patch
@@ -0,0 +1,39 @@
+From afb92e4b1cd05388f519868215d0e8a4672ebb0e Mon Sep 17 00:00:00 2001
+From: Carlos Santos <unixmania@gmail.com>
+Date: Sun, 10 Nov 2019 22:44:44 -0300
+Subject: [PATCH] Makefile: do not install init script
+
+Use a custom one, made for Buildroot, instead.
+
+Signed-off-by: Carlos Santos <unixmania@gmail.com>
+---
+ Makefile | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 649111a..19016f3 100755
+--- a/Makefile
++++ b/Makefile
+@@ -3,7 +3,6 @@ TARGET_PRODUCT ?= jacinto6evm
+ SRCDIR = ./targetfs/${TARGET_PRODUCT}
+ 
+ prefix = /usr
+-etcdir = /etc
+ bindir = ${prefix}/bin
+ incdir = ${prefix}/include
+ libdir = ${prefix}/lib
+@@ -11,11 +10,9 @@ libdir = ${prefix}/lib
+ all:
+ 
+ install: 
+-	mkdir -p ${DESTDIR}${etcdir}
+ 	mkdir -p ${DESTDIR}${bindir}
+ 	mkdir -p ${DESTDIR}${incdir}
+ 	mkdir -p ${DESTDIR}${libdir}
+-	cp -ar ${SRCDIR}/etc/* ${DESTDIR}${etcdir}
+ 	cp -ar ${SRCDIR}/bin/* ${DESTDIR}${bindir}
+ 	cp -ar ${SRCDIR}/include/* ${DESTDIR}${incdir}
+ 	cp -ar ${SRCDIR}/lib/* ${DESTDIR}${libdir}
+-- 
+2.18.1
+
diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index 8e1e4fb270..3710ac0e07 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -15,6 +15,9 @@ config BR2_PACKAGE_TI_SGX_UM
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
+	select BR2_PACKAGE_TI_SGX_LIBGBM
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_WAYLAND
 	help
 	  Graphics libraries for TI CPUs with SGX5xx GPU.
 	  This package supports AM335x, AM437x, AM4430 and AM5430.
diff --git a/package/ti-sgx-um/S80ti-sgx b/package/ti-sgx-um/S80ti-sgx
index 8cae52fd6e..2630a0576a 100644
--- a/package/ti-sgx-um/S80ti-sgx
+++ b/package/ti-sgx-um/S80ti-sgx
@@ -1,14 +1,56 @@
 #!/bin/sh
+
+pvrsrvkm_ko="/lib/modules/$(/bin/uname -r)/extra/pvrsrvkm.ko"
+
+pvr_loaded() {
+	/sbin/lsmod | /bin/grep -q '^\<pvrsrvkm\>'
+}
+
+pvr_load() {
+	/sbin/insmod "$pvrsrvkm_ko" > /dev/null 2>&1
+}
+
+start() {
+	printf 'Loading pvrsrvkm module: '
+	pvr_loaded || pvr_load
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		printf 'Starting PowerVR services: '
+		/usr/bin/pvrsrvctl --start --no-module > /dev/null 2>&1
+		status=$?
+	fi
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Starting PowerVR services: '
+	/usr/bin/pvrsrvctl --stop > /dev/null 2>&1
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
 case "$1" in
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
+	start|stop|restart)
+		"$1";;
+	reload)
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
diff --git a/package/ti-sgx-um/powervr.ini b/package/ti-sgx-um/powervr.ini
deleted file mode 100644
index fc92d45d50..0000000000
--- a/package/ti-sgx-um/powervr.ini
+++ /dev/null
@@ -1,6 +0,0 @@
-[default]
-#defaul library without double buffering:
-WindowSystem=libpvrDRMWSEGL_FRONT.so
-#alternative library, slower but with double buffering
-#WindowSystem=libpvrDRMWSEGL.so
-DisableHWTQTextureUpload=1
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index a6a0566469..d543350757 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 c17f23d255cff8fe72fc3f5cae3d7550e387af07d036954b4f08e573379406d0 ti-sgx-um-e15f1543bab4de9e8927a2c4934addf3fd16ffcb.tar.gz
+sha256 cb1373a6335af3d3741c6b11cf217afc8bdbe182642229df359c38e3ccfc5866  ti-sgx-um-2a2e5bb090ced870d73ed4edbc54793e952cc6d8.tar.gz
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index d5c50a0166..242f58270e 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -4,28 +4,25 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_UM_VERSION = e15f1543bab4de9e8927a2c4934addf3fd16ffcb
+# This correpsonds to SDK 06.00.00.07 plus one pull request
+TI_SGX_UM_VERSION = 2a2e5bb090ced870d73ed4edbc54793e952cc6d8
 TI_SGX_UM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git
 TI_SGX_UM_LICENSE = TI TSPA License
 TI_SGX_UM_LICENSE_FILES = OMAP5-Linux-Graphics-DDK-UM-Manifest.doc
 TI_SGX_UM_INSTALL_STAGING = YES
+TI_SGX_UM_TARGET=ti335x
 
 # ti-sgx-um is a egl/gles provider only if libdrm is installed
-TI_SGX_UM_DEPENDENCIES = libdrm
+TI_SGX_UM_DEPENDENCIES = libdrm wayland
 
 define TI_SGX_UM_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) \
+		TARGET_PRODUCT=$(TI_SGX_UM_TARGET) install
 endef
 
 define TI_SGX_UM_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) install
-endef
-
-# libs use the following file for configuration
-define TI_SGX_UM_INSTALL_CONF
-	$(INSTALL) -D -m 0644 package/ti-sgx-um/powervr.ini \
-		$(TARGET_DIR)/etc/powervr.ini
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) \
+		TARGET_PRODUCT=$(TI_SGX_UM_TARGET) install
 endef
 
 TI_SGX_UM_POST_INSTALL_TARGET_HOOKS += TI_SGX_UM_INSTALL_CONF
-- 
2.18.1
