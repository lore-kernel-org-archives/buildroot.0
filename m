From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu,  8 Sep 2016 13:58:03 -0300
Subject: [Buildroot] [PATCH] gmock: download from github and convert to a
	cmake-package
In-Reply-To: <983781693.3690991.1473290568772.JavaMail.zimbra@datacom.ind.br>
References: <983781693.3690991.1473290568772.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1473353883-10762-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://googlemock.googlecode.com/files is no more available, so update
gmock.mk and gmock.hash to retrieve googlemock source code as a tar.gz
(and not a zip) from github as https://googlemock.googlecode.com is now
a redirection to https://github.com/google/googlemock.

The new tarball does not contain autotools stuff, so gmock was converted
to a cmake package, using a trick to find the gtest build directory. It
would be possible to extract the gtest source in the gmock directory or
somewhere under $(STAGING_DIR) but this trick would be even uglier.

Based on the work by Fabrice Fontaine on gtest and on comments made by
Thomas Petazzoni and Arnout Vandecappelle.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/gmock/0001-force-use-python2.patch |  4 ++--
 package/gmock/0002-fix-gtest-path.patch    | 15 ++++++++++++
 package/gmock/Config.in                    |  2 +-
 package/gmock/gmock.hash                   |  2 +-
 package/gmock/gmock.mk                     | 37 +++++++++++-------------------
 5 files changed, 32 insertions(+), 28 deletions(-)
 create mode 100644 package/gmock/0002-fix-gtest-path.patch

diff --git a/package/gmock/0001-force-use-python2.patch b/package/gmock/0001-force-use-python2.patch
index 5dcb231..12f7c23 100644
--- a/package/gmock/0001-force-use-python2.patch
+++ b/package/gmock/0001-force-use-python2.patch
@@ -2,8 +2,8 @@ Force use of Python 2 even when Python 3 is the default Python interpreter.
 
 Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 
---- ./gtest/scripts/fuse_gtest_files.py.orig	2013-09-18 14:48:30.000000000 -0300
-+++ ./gtest/scripts/fuse_gtest_files.py	2015-07-22 15:42:53.291591205 -0300
+--- ./scripts/fuse_gmock_files.py.orig	2013-09-18 14:48:30.000000000 -0300
++++ ./scripts/fuse_gmock_files.py	2015-07-22 15:42:53.291591205 -0300
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python2
diff --git a/package/gmock/0002-fix-gtest-path.patch b/package/gmock/0002-fix-gtest-path.patch
new file mode 100644
index 0000000..4314270
--- /dev/null
+++ b/package/gmock/0002-fix-gtest-path.patch
@@ -0,0 +1,15 @@
+Help the GMock build to locate the GTest source code
+
+Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
+
+--- ./CMakeLists.txt.orig	2013-09-18 21:32:04.000000000 -0300
++++ ./CMakeLists.txt	2016-09-08 11:10:51.519780433 -0300
+@@ -15,7 +15,7 @@
+ if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/gtest/CMakeLists.txt")
+   set(gtest_dir gtest)
+ else()
+-  set(gtest_dir ../gtest)
++  set(gtest_dir ../gtest-${GTEST_VERSION})
+ endif()
+ 
+ # Defines pre_project_set_up_hermetic_build() and set_up_hermetic_build().
diff --git a/package/gmock/Config.in b/package/gmock/Config.in
index ec3eb92..895fbc9 100644
--- a/package/gmock/Config.in
+++ b/package/gmock/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_GMOCK
 	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
 	      Symbian.
 
-	    http://code.google.com/p/googlemock/
+	    https://github.com/google/googlemock/
 
 	  There are both host and target packages. The target one has include
 	  files required to compile the tests and the static libraries required
diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
index 2b71739..5f9befc 100644
--- a/package/gmock/gmock.hash
+++ b/package/gmock/gmock.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b  gmock-1.7.0.zip
+sha256 3f20b6acb37e5a98e8c4518165711e3e35d47deb6cdb5a4dd4566563b5efd232  gmock-release-1.7.0.tar.gz
diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
index 4f04422..e317e91 100644
--- a/package/gmock/gmock.mk
+++ b/package/gmock/gmock.mk
@@ -5,9 +5,8 @@
 ################################################################################
 
 # Make sure this remains the same version as the gtest one
-GMOCK_VERSION = 1.7.0
-GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
-GMOCK_SITE = http://googlemock.googlecode.com/files
+GMOCK_VERSION = release-1.7.0
+GMOCK_SITE = $(call github,google,googlemock,$(GMOCK_VERSION))
 GMOCK_INSTALL_STAGING = YES
 GMOCK_INSTALL_TARGET = NO
 GMOCK_LICENSE = BSD-3c
@@ -24,41 +23,31 @@ HOST_GMOCK_PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-pac
 #   "Google Mock can be used as a DLL, but the same DLL must contain Google
 #    Test as well.  See Google Test's README file for instructions on how to
 #    set up necessary compiler settings".
-GMOCK_CONF_OPTS = --enable-static --disable-shared
+GMOCK_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
-define GMOCK_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
-endef
+# This is used to help the GMock build to find the GTest source code. Passing
+# GTEST_VERSION covers the case in which GTEST_OVERRIDE_SRCDIR is set, because
+# GTEST_VERSION will be "custom" instead of "release-1.7.0".
+GMOCK_CONF_OPTS += -DGTEST_VERSION=$(GTEST_VERSION)
 
-# We can't use the default rule for autotools-package staging because it fails
-# because it tries to rebuild/install gtest stuff and fails after this error:
-#    "'make install' is dangerous and not supported. Instead, see README for
-#      how to integrate Google Test into your build system."
+# We can't use the default install rule for cmake-package because there is no
+# 'install' target in the CMake-based build.
 define GMOCK_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
-	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
+	$(INSTALL) -D -m 0755 $(@D)/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
+	$(INSTALL) -D -m 0755 $(@D)/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
 	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
 	$(INSTALL) -D -m 0755 package/gmock/gmock.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
 endef
 
-# Unzipping inside $(@D) and moving everything from the created subdirectory is
-# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
-# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
-define HOST_GMOCK_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
-	mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
-	rmdir $(@D)/gmock-$(GMOCK_VERSION)
-endef
-
 define HOST_GMOCK_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
 	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
 	cp -rp $(@D)/scripts/generator/cpp $(HOST_GMOCK_PYTHONPATH)
 endef
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
 # The host package does not build anything, just installs gmock_gen stuff, so
-# it does not need to be a host-autotools-package.
+# it does not need to be a host-cmake-package.
 $(eval $(host-generic-package))
-- 
2.7.4
