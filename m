From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Dec 2019 14:46:41 +0100
Subject: [Buildroot] [git commit] package/ti-sgx-libgbm: new package
Message-ID: <20191230133719.20F518E822@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb7fb9bda659a6a0ee6ed8161451db706f57f228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A custom ti version of libgbm for SGX graphics accelerator, required by
the binary libraries of the ti-sgx-um package.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
Signed-off-by: Carlos Santos <unixmania@gmail.com>
[Thomas:
 - fix LICENSE variable, as noticed by Yegor
 - fix alphabetic ordering in package/Config.in
 - add missing select BR2_PACKAGE_LIBDRM in Config.in, and the
   corresponding dependencies
 - add missing depends on BR2_PACKAGE_HAS_UDEV in Config.in
 - use gbm.h as license file, instead of extracting the first 26 lines
   of the header file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 .../0001-Add-missing-sys-sysmacros.h-include.patch | 25 +++++++++++++++++
 package/ti-sgx-libgbm/Config.in                    | 12 ++++++++
 package/ti-sgx-libgbm/ti-sgx-libgbm.hash           |  3 ++
 package/ti-sgx-libgbm/ti-sgx-libgbm.mk             | 32 ++++++++++++++++++++++
 6 files changed, 74 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7308439f06..3f040f7021 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1427,6 +1427,7 @@ N:	Lothar Felten <lothar.felten@gmail.com>
 F:	board/bananapi/bananapi-m2-ultra/
 F:	configs/bananapi_m2_ultra_defconfig
 F:	package/ti-sgx-demos/
+F:	package/ti-sgx-libgbm/
 F:	package/ti-sgx-km/
 F:	package/ti-sgx-um/
 
diff --git a/package/Config.in b/package/Config.in
index 888373422f..05a4e87ae7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -545,6 +545,7 @@ endmenu
 	source "package/ti-gfx/Config.in"
 	source "package/ti-sgx-demos/Config.in"
 	source "package/ti-sgx-km/Config.in"
+	source "package/ti-sgx-libgbm/Config.in"
 	source "package/ti-sgx-um/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
diff --git a/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch b/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
new file mode 100644
index 0000000000..2863c93bed
--- /dev/null
+++ b/package/ti-sgx-libgbm/0001-Add-missing-sys-sysmacros.h-include.patch
@@ -0,0 +1,25 @@
+From e3a3f3655956265eb4f3b866d445a9d19e613594 Mon Sep 17 00:00:00 2001
+From: Lothar Felten <lothar.felten@gmail.com>
+Date: Thu, 14 Nov 2019 23:37:07 -0300
+Subject: [PATCH] Add missing sys/sysmacros.h include
+
+Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
+---
+ gbm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gbm.c b/gbm.c
+index 7bc5880..e360da7 100644
+--- a/gbm.c
++++ b/gbm.c
+@@ -36,6 +36,7 @@
+ 
+ #include <sys/types.h>
+ #include <sys/stat.h>
++#include <sys/sysmacros.h>
+ #include <unistd.h>
+ #include <errno.h>
+ 
+-- 
+2.18.1
+
diff --git a/package/ti-sgx-libgbm/Config.in b/package/ti-sgx-libgbm/Config.in
new file mode 100644
index 0000000000..2c679e2046
--- /dev/null
+++ b/package/ti-sgx-libgbm/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_TI_SGX_LIBGBM
+	bool "ti-sgx-libgbm"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBDRM
+	help
+	  TI SGX libgbm variant.
+
+	  https://git.ti.com/cgit/glsdk/libgbm
+
+comment "ti-sgx-libgbm needs udev and a toolchain w/ threads"
+	depends on !BR2_PACKAGE_HAS_UDEV || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.hash b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
new file mode 100644
index 0000000000..32af5ad5ae
--- /dev/null
+++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 85e3eafcd06caccd8c4cea3081b1406ae51c07e19541ac19b9c33a5b41fec82d  ti-sgx-libgbm-c5ddc6a37bb78ac753b317b17d890d1f7338dea6.tar.gz
+sha256 58fe00de76ae5d533e1c562950e1848682c03155a653d76870cf0a3c59be8b4c  gbm.h
diff --git a/package/ti-sgx-libgbm/ti-sgx-libgbm.mk b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
new file mode 100644
index 0000000000..00a0716e21
--- /dev/null
+++ b/package/ti-sgx-libgbm/ti-sgx-libgbm.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# ti-sgx-libgbm
+#
+################################################################################
+
+# This correpsonds to SDK 06.00.00.07
+TI_SGX_LIBGBM_VERSION = c5ddc6a37bb78ac753b317b17d890d1f7338dea6
+TI_SGX_LIBGBM_SITE = http://git.ti.com/git/glsdk/libgbm.git
+TI_SGX_LIBGBM_SITE_METHOD = git
+TI_SGX_LIBGBM_LICENSE = MIT
+TI_SGX_LIBGBM_LICENSE_FILES = gbm.h
+TI_SGX_LIBGBM_INSTALL_STAGING = YES
+TI_SGX_LIBGBM_AUTORECONF = YES
+
+TI_SGX_LIBGBM_DEPENDENCIES = libdrm udev
+
+define TI_SGX_LIBGBM_INSTALL_TARGET_OPTS
+	PREFIX=/usr \
+	STRIP=/bin/true \
+	DESTDIR=$(TARGET_DIR) \
+	install
+endef
+
+define TI_SGX_LIBGBM_INSTALL_STAGING_OPTS
+	PREFIX=/usr \
+	STRIP=/bin/true \
+	DESTDIR=$(STAGING_DIR) \
+	install
+endef
+
+$(eval $(autotools-package))
