From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 10 Dec 2020 21:47:29 +0100
Subject: [Buildroot] [PATCH 3/3] package/ti-sgx-{km,
 um}: bump to SDK 06.01.00.08 versions
In-Reply-To: <cover.1607633239.git.yann.morin.1998@free.fr>
References: <cover.1607633239.git.yann.morin.1998@free.fr>
Message-ID: <363c64941420fb48c6692b94ec6fc422ef67540f.1607633239.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Currently, the ti-sgx packages and the beaglebone_qt5_defconfig do
not work with KMS nor Weston. What's worse, is the latest SDK version
06.03.00.106 (as of this commit) of these packages is broken and does
not correctly support KMS, and attempting to run KMS applications
results in eglfs initialization failures. As such, bumping these
packages to the version before 06.03.00.106 is the best option.

Because of the above problems, several packages must change at the
same time to ensure this patch does not break any other packages:

  - ti-sgx-libgbm
    - dropped, merged into ti-sgx-um, see below

  - ti-sgx-um:
    - bump the version that matches TI SDK 06.01.00.08.
    - demove select BR2_PACKAGE_TI_SGX_LIBGBM in Config.in, as the libgbm
      package merges ti-sgx-libgbm with this package.

  - ti-sgx-km:
    - bump the version that matches TI SDK 06.01.00.08.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Tested-by: Markus <zehnder@live.com>
[yann.morin.1998 at free.fr:
  - actually switch qt5base to use ti-sgx-um
  - split the beaglebone config changes to their own patch
  - split the ti-sgx-demos changes to their own patch
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                              |  7 ++++
 package/Config.in                             |  1 -
 package/qt5/qt5base/qt5base.mk                |  4 +--
 package/ti-sgx-km/ti-sgx-km.hash              |  4 +--
 package/ti-sgx-km/ti-sgx-km.mk                |  4 +--
 ...-Add-missing-sys-sysmacros.h-include.patch | 25 ---------------
 package/ti-sgx-libgbm/Config.in               | 12 -------
 package/ti-sgx-libgbm/ti-sgx-libgbm.hash      |  3 --
 package/ti-sgx-libgbm/ti-sgx-libgbm.mk        | 32 -------------------
 package/ti-sgx-um/Config.in                   |  1 -
 package/ti-sgx-um/ti-sgx-um.hash              |  4 +--
 package/ti-sgx-um/ti-sgx-um.mk                |  4 +--
 12 files changed, 17 insertions(+), 84 deletions(-)
 delete mode 100644 package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
 delete mode 100644 package/ti-sgx-libgbm/Config.in
 delete mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.hash
 delete mode 100644 package/ti-sgx-libgbm/ti-sgx-libgbm.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 91689291c9..6d8acadf9c 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2021.02"
 
+config BR2_PACKAGE_TI_SGX_LIBGBM
+	bool "ti-sgx-libgbm support removed"
+	select BR2_LEGACY
+	help
+	  TI has merged the ti-sgx-libgbm package with the ti-sgx-um
+	  package
+
 config BR2_PACKAGE_IPSEC_TOOLS
 	bool "ipsec-tools package was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 39c91645ad..dc7139a49a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -554,7 +554,6 @@ endmenu
 	source "package/ti-gfx/Config.in"
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
-	source "package/ti-sgx-libgbm/Config.in"
 	source "package/ti-sgx-um/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index 4cd5980f0b..e2015c3432 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -76,9 +76,9 @@ QT5BASE_DEPENDENCIES += mesa3d
 else ifeq ($(BR2_PACKAGE_GCNANO_BINARIES),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += gcnano-binaries
-else ifeq ($(BR2_PACKAGE_TI_SGX_LIBGBM),y)
+else ifeq ($(BR2_PACKAGE_TI_SGX_UM),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
-QT5BASE_DEPENDENCIES += ti-sgx-libgbm
+QT5BASE_DEPENDENCIES += ti-sgx-um
 else ifeq ($(BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL),y)
 QT5BASE_CONFIGURE_OPTS += -gbm
 QT5BASE_DEPENDENCIES += imx-gpu-viv
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index 1fd07d7467..2fd3b56b1e 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 f1505f38f9e82f958673bb1755e65090bdbc513a68d41640561d9d491bc4b0e3  ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d.tar.gz
-sha256 e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4  eurasia_km/GPL-COPYING
+sha256  ea70356dd0fd7f904f6d6046c4090c7d6d0126e13039db746c75bb6e666864d8  ti-sgx-km-cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9.tar.gz
+sha256  e9d660547691b2a9232850fd43aac16d40fd063023166fd27162020c30dc2bd4  eurasia_km/GPL-COPYING
diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index ae294c300a..25f1f83ca7 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 06.00.00.07
-TI_SGX_KM_VERSION = 4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d
+# This correpsonds to SDK 06.01.00.08
+TI_SGX_KM_VERSION = cf7f48cb30abfd5df7a60c9bf4bbb1dde0d496d9
 TI_SGX_KM_SITE = http://git.ti.com/git/graphics/omap5-sgx-ddk-linux.git
 TI_SGX_KM_SITE_METHOD = git
 TI_SGX_KM_LICENSE = GPL-2.0
diff --git a/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch b/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
deleted file mode 100644
index 2863c93bed..0000000000
--- a/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From e3a3f3655956265eb4f3b866d445a9d19e613594 Mon Sep 17 00:00:00 2001
-From: Lothar Felten <lothar.felten@gmail.com>
-Date: Thu, 14 Nov 2019 23:37:07 -0300
-Subject: [PATCH] Add missing sys/sysmacros.h include
-
-Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
----
- gbm.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gbm.c b/gbm.c
-index 7bc5880..e360da7 100644
---- a/gbm.c
-+++ b/gbm.c
-@@ -36,6 +36,7 @@
- 
- #include <sys/types.h>
- #include <sys/stat.h>
-+#include <sys/sysmacros.h>
- #include <unistd.h>
- #include <errno.h>
- 
--- 
-2.18.1
-
diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
deleted file mode 100644
index 2c679e2046..0000000000
--- a/package/ti-sgx-libgbm/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_TI_SGX_LIBGBM
-	bool "ti-sgx-libgbm"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_LIBDRM
-	help
-	  TI SGX libgbm variant.
-
-	  https://git.ti.com/cgit/glsdk/libgbm
-
-comment "ti-sgx-libgbm needs udev and a toolchain w/ threads"
-	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.hash b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
deleted file mode 100644
index 32af5ad5ae..0000000000
--- a/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256 85e3eafcd06caccd8c4cea3081b1406ae51c07e19541ac19b9c33a5b41fec82d  ti-sgx-libgbm-c5ddc6a37bb78ac753b317b17d890d1f7338dea6.tar.gz
-sha256 58fe00de76ae5d533e1c562950e1848682c03155a653d76870cf0a3c59be8b4c  gbm.h
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
deleted file mode 100644
index 00a0716e21..0000000000
--- a/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
+++ /dev/null
@@ -1,32 +0,0 @@
-################################################################################
-#
-# ti-sgx-libgbm
-#
-################################################################################
-
-# This correpsonds to SDK 06.00.00.07
-TI_SGX_LIBGBM_VERSION = c5ddc6a37bb78ac753b317b17d890d1f7338dea6
-TI_SGX_LIBGBM_SITE = http://git.ti.com/git/glsdk/libgbm.git
-TI_SGX_LIBGBM_SITE_METHOD = git
-TI_SGX_LIBGBM_LICENSE = MIT
-TI_SGX_LIBGBM_LICENSE_FILES = gbm.h
-TI_SGX_LIBGBM_INSTALL_STAGING = YES
-TI_SGX_LIBGBM_AUTORECONF = YES
-
-TI_SGX_LIBGBM_DEPENDENCIES = libdrm udev
-
-define TI_SGX_LIBGBM_INSTALL_TARGET_OPTS
-	PREFIX=/usr \
-	STRIP=/bin/true \
-	DESTDIR=$(TARGET_DIR) \
-	install
-endef
-
-define TI_SGX_LIBGBM_INSTALL_STAGING_OPTS
-	PREFIX=/usr \
-	STRIP=/bin/true \
-	DESTDIR=$(STAGING_DIR) \
-	install
-endef
-
-$(eval $(autotools-package))
diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index ee87d46aa4..6a8b7e87e3 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -17,7 +17,6 @@ config BR2_PACKAGE_TI_SGX_UM
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
-	select BR2_PACKAGE_TI_SGX_LIBGBM
 	select BR2_PACKAGE_LIBFFI
 	select BR2_PACKAGE_WAYLAND
 	help
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index ff54ecbd6d..8e8c5ff328 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 cb1373a6335af3d3741c6b11cf217afc8bdbe182642229df359c38e3ccfc5866  ti-sgx-um-2a2e5bb090ced870d73ed4edbc54793e952cc6d8.tar.gz
-sha256 368c306246c9130b5c90a6fef2f80085f70b6225b3f552654a288c0f39fc1531  TI-Linux-Graphics-DDK-UM-Manifest.doc
+sha256  4d293a4170e2fd28852680830dacd8f575b12037f3e15bcf599232f6ccbf6deb  ti-sgx-um-909e237baf47d0bde006ff25552f5403fd7e359d.tar.gz
+sha256  368c306246c9130b5c90a6fef2f80085f70b6225b3f552654a288c0f39fc1531  TI-Linux-Graphics-DDK-UM-Manifest.doc
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index 0e26d057c1..30d1ef81f0 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 06.00.00.07 plus one pull request
-TI_SGX_UM_VERSION = 2a2e5bb090ced870d73ed4edbc54793e952cc6d8
+# This correpsonds to SDK 06.01.00.08
+TI_SGX_UM_VERSION = 909e237baf47d0bde006ff25552f5403fd7e359d
 TI_SGX_UM_SITE = http://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git
 TI_SGX_UM_SITE_METHOD = git
 TI_SGX_UM_LICENSE = TI TSPA License
-- 
2.25.1
