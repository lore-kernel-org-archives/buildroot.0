From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 17 May 2018 14:56:56 +0200
Subject: [Buildroot] [PATCH v2] libgpiod: bump version to v1.1
Message-ID: <20180517125656.31922-1-brgl@bgdev.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a minor release the main feature of which are the
object-oriented bindings for C++ and Python3. Other than that there's
a couple bug-fixes and minor improvements all around.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
v1 -> v2:
- install bindings conditionally based on already selected dependencies
  rather than adding new Config options

 package/libgpiod/libgpiod.hash |  2 +-
 package/libgpiod/libgpiod.mk   | 20 ++++++++++++++++++--
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/package/libgpiod/libgpiod.hash b/package/libgpiod/libgpiod.hash
index 9ed4b59ab9..1d217f6048 100644
--- a/package/libgpiod/libgpiod.hash
+++ b/package/libgpiod/libgpiod.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/libs/libgpiod/sha256sums.asc
-sha256 972924195367f5fb045c023d65340c4b7dfc8764499516be446553865208dedc  libgpiod-1.0.1.tar.xz
+sha256 9758466468a7ef3f5e30c182c1303abef6241e665cda4d82a64328a7474838c1  libgpiod-1.1.tar.xz
 # Hash for license file
 sha256 ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING
diff --git a/package/libgpiod/libgpiod.mk b/package/libgpiod/libgpiod.mk
index 7f8fa4b7dd..8c9429b81b 100644
--- a/package/libgpiod/libgpiod.mk
+++ b/package/libgpiod/libgpiod.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-LIBGPIOD_VERSION = 1.0.1
+LIBGPIOD_VERSION = 1.1
 LIBGPIOD_SOURCE = libgpiod-$(LIBGPIOD_VERSION).tar.xz
 LIBGPIOD_SITE = https://www.kernel.org/pub/software/libs/libgpiod
 LIBGPIOD_LICENSE = LGPL-2.1+
 LIBGPIOD_LICENSE_FILES = COPYING
 LIBGPIOD_INSTALL_STAGING = YES
-
 LIBGPIOD_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBGPIOD_TOOLS),y)
@@ -19,4 +18,21 @@ else
 LIBGPIOD_CONF_OPTS += --disable-tools
 endif
 
+ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
+LIBGPIOD_CONF_OPTS += --enable-bindings-cxx
+else
+LIBGPIOD_CONF_OPTS += --disable-bindings-cxx
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBGPIOD_CONF_OPTS += --enable-bindings-python
+LIBGPIOD_DEPENDENCIES += python3 host-python3
+LIBGPIOD_CONF_ENV += \
+	PYTHON=$(HOST_DIR)/bin/python3 \
+	PYTHON_CPPFLAGS="`$(STAGING_DIR)/usr/bin/python3-config --includes`" \
+	PYTHON_LIBS="`$(STAGING_DIR)/usr/bin/python3-config --ldflags`"
+else
+LIBGPIOD_CONF_OPTS += --disable-bindings-python
+endif
+
 $(eval $(autotools-package))
-- 
2.17.0
