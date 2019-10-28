From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 28 Oct 2019 12:17:09 +0100
Subject: [Buildroot] [PATCH v2, 1/1] package/libselinux: fix build with fts.h
Message-ID: <20191028111709.18054-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 3fce6f1c150dbe4be58d083008ca8dbe7257836e added
PKG_PYTHON_DISTUTILS_ENV to LIBSELINUX_MAKE_OPTS which has the side
effect of adding CFLAGS without filtering out -D_FILE_OFFSET_BITS=64.
This raises the following build failure:

In file included from selinux_restorecon.c:17:0:
/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/fts.h:41:3: error: #error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
 # error "<fts.h> cannot be used with -D_FILE_OFFSET_BITS==64"
   ^

Fix this by adding a PKG_PYTHON_DISTUTILS_PYTHON_ENV to use it within
libselinux. This will avoid overriding CFLAGS and LDFLAGS

Fixes:
 - http://autobuild.buildroot.net/results/a9cd6f09725f39256c892584b4f533b2de96c410

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Add PKG_PYTHON_DISTUTILS_PYTHON_ENV instead of filtering
   PKG_PYTHON_DISTUTIL_ENV

 package/libselinux/libselinux.mk |  2 +-
 package/pkg-python.mk            | 15 +++++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index dd68ad9298..654a9e2ec5 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -40,7 +40,7 @@ LIBSELINUX_PYLIBVER = python$(PYTHON_VERSION_MAJOR)
 endif
 
 LIBSELINUX_MAKE_OPTS += \
-	$(PKG_PYTHON_DISTUTILS_ENV) \
+	$(PKG_PYTHON_DISTUTILS_PYTHON_ENV) \
 	PYTHON=$(LIBSELINUX_PYLIBVER)
 
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index be1ce071df..ffc2d6548d 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -25,12 +25,7 @@ $(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MA
 endef
 
 # Target distutils-based packages
-PKG_PYTHON_DISTUTILS_ENV = \
-	PATH=$(BR_PATH) \
-	CC="$(TARGET_CC)" \
-	CFLAGS="$(TARGET_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS)" \
-	LDSHARED="$(TARGET_CROSS)gcc -shared" \
+PKG_PYTHON_DISTUTILS_PYTHON_ENV = \
 	PYTHONPATH="$(if $(BR2_PACKAGE_PYTHON3),$(PYTHON3_PATH),$(PYTHON_PATH))" \
 	PYTHONNOUSERSITE=1 \
 	_PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
@@ -38,6 +33,14 @@ PKG_PYTHON_DISTUTILS_ENV = \
 	_python_prefix=/usr \
 	_python_exec_prefix=/usr
 
+PKG_PYTHON_DISTUTILS_ENV = \
+	PATH=$(BR_PATH) \
+	CC="$(TARGET_CC)" \
+	CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" \
+	LDSHARED="$(TARGET_CROSS)gcc -shared" \
+	$(PKG_PYTHON_DISTUTILS_PYTHON_ENV)
+
 PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
 	--executable=/usr/bin/python
 
-- 
2.23.0
