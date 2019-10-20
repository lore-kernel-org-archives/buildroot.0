From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 20 Oct 2019 14:31:19 -0600
Subject: [Buildroot] [PATCH 1/1] package/libselinux: fix build with python
 3.8
Message-ID: <20191020203119.99538-1-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/839e81c5b968c47842b4d0c25b902397af8ea5a5

Details:
 - https://bugs.python.org/issue36721
 - https://github.com/python/cpython/commit/7efc526e5cfb929a79c192ac2dcf7eb78d3a4401

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libselinux/libselinux.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
index c707c8a25e..75f01a84b7 100644
--- a/package/libselinux/libselinux.mk
+++ b/package/libselinux/libselinux.mk
@@ -33,7 +33,7 @@ endif
 ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBSELINUX_DEPENDENCIES += python3 host-swig
-LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)m
+LIBSELINUX_PYINC = -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else ifeq ($(BR2_PACKAGE_PYTHON),y)
 LIBSELINUX_DEPENDENCIES += python host-swig
@@ -47,6 +47,11 @@ LIBSELINUX_MAKE_OPTS += \
 	PYSITEDIR=$(TARGET_DIR)/usr/lib/$(LIBSELINUX_PYLIBVER)/site-packages \
 	SWIG_LIB="$(HOST_DIR)/share/swig/$(SWIG_VERSION)/"
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBSELINUX_MAKE_OPTS += \
+	PYLIBS="`$(STAGING_DIR)/usr/bin/python3-config --libs --embed`"
+endif
+
 LIBSELINUX_MAKE_INSTALL_TARGETS += install-pywrap
 
 # dependencies are broken and result in file truncation errors at link
@@ -84,7 +89,7 @@ HOST_LIBSELINUX_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 HOST_LIBSELINUX_DEPENDENCIES += host-python3
-HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)m/
+HOST_LIBSELINUX_PYINC = -I$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)/
 HOST_LIBSELINUX_PYLIBVER = python$(PYTHON3_VERSION_MAJOR)
 else
 HOST_LIBSELINUX_DEPENDENCIES += host-python
-- 
2.20.1
