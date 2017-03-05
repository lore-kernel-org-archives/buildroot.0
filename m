From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:09:02 +0100
Subject: [Buildroot] [git commit] gtest/gmock: bump to version 1.8.0
Message-ID: <20170305211429.430ED81F77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a9c6311f8fd4464b5555773589f587338f694a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GTest version 1.8.0 includes gmock so merge both packages inside gtest

In this merge:

- Add gmock as a suboption of gtest (BR2_PACKAGE_GTEST_GMOCK)
  following advice from Arnout Vandecappelle
- Add BR2_PACKAGE_GMOCK as a legacy entry, selecting BR2_PACKAGE_GTEST
  and BR2_PACKAGE_GTEST_GMOCK.
- Use cmake to install libraries and headers and add missing files
  (gtest.pc, gtest-config, gmock.pc) in
  GTEST_POST_INSTALL_STAGING_HOOKS instead of redefining
  GTEST_INSTALL_STAGING_CMDS
- Remove patch on Python as gmock/gtest now supports python 3.0
  (commit 456fc2b5c4e9ebf05a5987dfe1ff0ac9ffeb53cc)
- Add the correct license in HOST_GTEST_LICENSE as all python code in
  googlemock/scripts/generator is licensed under Apache-2.0 and not
  BSD-3c
- Fix URL of gtest project in Config.in
- Remove the gmock entry from DEVELOPERS
- Install gmock_gen directly, instead of as a symlink to gmock_gen.py

Notice that any external package that depends on gmock will cause an
immediate build termination because make doesn't know how to build
gmock. Since the user has just removed gmock from the legacy menu, it
should be quite obvious what needs to be done.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - Use += instead of = when assigning a value to <pkg>_DEPENDENCIES in
   conditional
 - Remove comment about the "tricky logic" around BUILD_GTEST and
   BUILD_GMOCK
 - Move GTEST_GMOCK_INSTALL_MISSING_FILE inside
   the ($(BR2_PACKAGE_GTEST_GMOCK),y) condition.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                           |  8 ++++
 DEVELOPERS                                 |  1 -
 package/Config.in                          |  1 -
 package/gmock/0001-force-use-python2.patch | 20 ----------
 package/gmock/Config.in                    | 32 ---------------
 package/gmock/gmock.hash                   |  2 -
 package/gmock/gmock.mk                     | 64 ------------------------------
 package/gtest/Config.in                    | 30 +++++++++++++-
 package/{gmock => gtest}/gmock.pc          |  2 +-
 package/gtest/gtest.hash                   |  2 +-
 package/gtest/gtest.mk                     | 59 ++++++++++++++++++++++-----
 package/gtest/gtest.pc                     |  2 +-
 12 files changed, 90 insertions(+), 133 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4962b92..1f3d09b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,14 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.05"
 
+config BR2_PACKAGE_GMOCK
+	bool "gmock merged into gtest package"
+	select BR2_LEGACY
+	select BR2_PACKAGE_GTEST
+	select BR2_PACKAGE_GTEST_GMOCK
+	help
+	  GMock is now a suboption of the GTest package.
+
 config BR2_GLIBC_VERSION_2_22
 	bool "glibc 2.22 removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 16f05fb..c7f85d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -287,7 +287,6 @@ N:	Carlo Caione <carlo.caione@gmail.com>
 F:	package/sunxi-boards/
 
 N:	Carlos Santos <casantos@datacom.ind.br>
-F:	package/gmock/
 F:	package/gtest/
 F:	package/libpam-radius-auth/
 F:	package/libpam-tacplus/
diff --git a/package/Config.in b/package/Config.in
index e1f0823..536b551 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1329,7 +1329,6 @@ menu "Other"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
-	source "package/gmock/Config.in"
 	source "package/gmp/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
diff --git a/package/gmock/0001-force-use-python2.patch b/package/gmock/0001-force-use-python2.patch
deleted file mode 100644
index 5dcb231..0000000
--- a/package/gmock/0001-force-use-python2.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Force use of Python 2 even when Python 3 is the default Python interpreter.
-
-Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
-
---- ./gtest/scripts/fuse_gtest_files.py.orig	2013-09-18 14:48:30.000000000 -0300
-+++ ./gtest/scripts/fuse_gtest_files.py	2015-07-22 15:42:53.291591205 -0300
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python2
- #
- # Copyright 2009, Google Inc.
- # All rights reserved.
---- ./scripts/generator/gmock_gen.py.orig	2013-09-18 14:50:15.000000000 -0300
-+++ ./scripts/generator/gmock_gen.py	2015-07-22 17:06:51.071815634 -0300
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python2
- #
- # Copyright 2008 Google Inc. All Rights Reserved.
- #
diff --git a/package/gmock/Config.in b/package/gmock/Config.in
deleted file mode 100644
index ec3eb92..0000000
--- a/package/gmock/Config.in
+++ /dev/null
@@ -1,32 +0,0 @@
-config BR2_PACKAGE_GMOCK
-	bool "gmock"
-	select BR2_PACKAGE_GTEST
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_USE_MMU # fork()
-	help
-	  Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
-	  specifics in mind, Google C++ Mocking Framework (or Google Mock for
-	  short) is a library for writing and using C++ mock classes.
-
-	  Google Mock:
-
-	    * lets you create mock classes trivially using simple macros,
-	    * supports a rich set of matchers and actions,
-	    * handles unordered, partially ordered, or completely ordered
-	      expectations,
-	    * is extensible by users, and
-	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
-	      Symbian.
-
-	    http://code.google.com/p/googlemock/
-
-	  There are both host and target packages. The target one has include
-	  files required to compile the tests and the static libraries required
-	  to link/run them. The host package installs gmock_gen, a Python script
-	  used to generate code mocks.
-
-comment "gmock needs a toolchain w/ C++, wchar, threads"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
deleted file mode 100644
index 2b71739..0000000
--- a/package/gmock/gmock.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b  gmock-1.7.0.zip
diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
deleted file mode 100644
index 4f04422..0000000
--- a/package/gmock/gmock.mk
+++ /dev/null
@@ -1,64 +0,0 @@
-################################################################################
-#
-# gmock
-#
-################################################################################
-
-# Make sure this remains the same version as the gtest one
-GMOCK_VERSION = 1.7.0
-GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
-GMOCK_SITE = http://googlemock.googlecode.com/files
-GMOCK_INSTALL_STAGING = YES
-GMOCK_INSTALL_TARGET = NO
-GMOCK_LICENSE = BSD-3c
-GMOCK_LICENSE_FILES = LICENSE
-GMOCK_DEPENDENCIES = gtest host-gmock
-
-# GMock 1.7.0 relies on Python 2.7 syntax which is NOT compatible with Python3.
-HOST_GMOCK_DEPENDENCIES = host-python
-HOST_GMOCK_PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
-
-# Static linking is required in order to keep the GMock package completely
-# separated from GTest. According to GMock's README file:
-#
-#   "Google Mock can be used as a DLL, but the same DLL must contain Google
-#    Test as well.  See Google Test's README file for instructions on how to
-#    set up necessary compiler settings".
-GMOCK_CONF_OPTS = --enable-static --disable-shared
-
-define GMOCK_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
-endef
-
-# We can't use the default rule for autotools-package staging because it fails
-# because it tries to rebuild/install gtest stuff and fails after this error:
-#    "'make install' is dangerous and not supported. Instead, see README for
-#      how to integrate Google Test into your build system."
-define GMOCK_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
-	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
-	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
-	$(INSTALL) -D -m 0755 package/gmock/gmock.pc \
-		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
-endef
-
-# Unzipping inside $(@D) and moving everything from the created subdirectory is
-# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
-# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
-define HOST_GMOCK_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
-	mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
-	rmdir $(@D)/gmock-$(GMOCK_VERSION)
-endef
-
-define HOST_GMOCK_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
-	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
-	cp -rp $(@D)/scripts/generator/cpp $(HOST_GMOCK_PYTHONPATH)
-endef
-
-$(eval $(autotools-package))
-# The host package does not build anything, just installs gmock_gen stuff, so
-# it does not need to be a host-autotools-package.
-$(eval $(host-generic-package))
diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index 355b736..3f1f385 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -21,6 +21,34 @@ config BR2_PACKAGE_GTEST
 
 	  https://github.com/google/googletest
 
+if BR2_PACKAGE_GTEST
+
+config BR2_PACKAGE_GTEST_GMOCK
+	bool "gmock"
+	help
+	  Inspired by jMock, EasyMock, and Hamcrest, and designed with
+	  C++'s specifics in mind, Google C++ Mocking Framework (or
+	  Google Mock for short) is a library for writing and using C++
+	  mock classes.
+
+	  Google Mock:
+
+	    * lets you create mock classes trivially using simple
+	      macros, supports a rich set of matchers and actions,
+	    * handles unordered, partially ordered, or completely
+	      ordered expectations,
+	    * is extensible by users, and
+	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW,
+	      and Symbian.
+
+	  There are both host and target packages. The target one has
+	  include files required to compile the tests and the static
+	  libraries required to link/run them. The host package installs
+	  gmock_gen, a Python script used to generate code mocks.
+
+endif # BR2_PACKAGE_GTEST
+
 comment "gtest needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/gmock/gmock.pc b/package/gtest/gmock.pc
similarity index 93%
rename from package/gmock/gmock.pc
rename to package/gtest/gmock.pc
index 2f90068..4c72354 100644
--- a/package/gmock/gmock.pc
+++ b/package/gtest/gmock.pc
@@ -5,7 +5,7 @@ includedir=${prefix}/include
 
 Name: gmock
 Description: Google C++ Mocking Framework
-Version: 1.7.0
+Version: 1.8.0
 Libs: -L${libdir} -lgmock
 Libs.private: -lpthread
 Cflags: -I${includedir}
diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 79e31e4..474008d 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	f73a6546fdf9fce9ff93a5015e0333a8af3062a152a9ad6bcb772c96687016cc	gtest-release-1.7.0.tar.gz
+sha256	58a6f4277ca2bc8565222b3bbd58a177609e9c488e8a72649359ba51450db7d8	gtest-release-1.8.0.tar.gz
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index eb30905..329179d 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,13 +4,29 @@
 #
 ################################################################################
 
-# Make sure this remains the same version as the gmock one
-GTEST_VERSION = release-1.7.0
+GTEST_VERSION = release-1.8.0
 GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3c
-GTEST_LICENSE_FILES = LICENSE
+GTEST_LICENSE_FILES = googletest/LICENSE
+
+ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
+GTEST_DEPENDENCIES += host-gtest
+endif
+
+HOST_GTEST_LICENSE = Apache-2.0
+HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
+HOST_GTEST_DEPENDENCIES += host-python3
+else
+HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
+HOST_GTEST_DEPENDENCIES += host-python
+endif
+
+HOST_GTEST_GMOCK_PYTHONPATH = \
+	$(HOST_DIR)/usr/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
 
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
@@ -21,11 +37,15 @@ GTEST_LICENSE_FILES = LICENSE
 # the gtest sources.
 GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
-define GTEST_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
-	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
-	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
+GTEST_CONF_OPTS += -DBUILD_GTEST=ON
+
+ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
+GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
+else
+GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
+endif
+
+define GTEST_INSTALL_MISSING_FILES
 	$(INSTALL) -D -m 0644 package/gtest/gtest.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
 	# Generate the gtest-config script manually, since the CMake
@@ -39,9 +59,30 @@ define GTEST_INSTALL_STAGING_CMDS
 		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
 		s%@PTHREAD_CFLAGS@%%;\
 		s%@PTHREAD_LIBS@%-lpthread%;' \
-		$(@D)/scripts/gtest-config.in \
+		$(@D)/googletest/scripts/gtest-config.in \
 		> $(STAGING_DIR)/usr/bin/gtest-config
 	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
 endef
 
+GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_MISSING_FILES
+
+ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
+define GTEST_GMOCK_INSTALL_MISSING_FILE
+	$(INSTALL) -D -m 0644 package/gtest/gmock.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
+endef
+
+GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_GMOCK_INSTALL_MISSING_FILE
+endif
+
+define HOST_GTEST_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
+		$(HOST_DIR)/usr/bin/gmock_gen
+	cp -rp $(@D)/googlemock/scripts/generator/cpp \
+		$(HOST_GTEST_GMOCK_PYTHONPATH)
+endef
+
 $(eval $(cmake-package))
+# The host package does not build anything, just installs gmock_gen stuff, so
+# it does not need to be a host-cmake-package.
+$(eval $(host-generic-package))
diff --git a/package/gtest/gtest.pc b/package/gtest/gtest.pc
index b7a8aa4..594e79d 100644
--- a/package/gtest/gtest.pc
+++ b/package/gtest/gtest.pc
@@ -5,7 +5,7 @@ includedir=${prefix}/include
 
 Name: gtest
 Description: Google C++ Testing Framework
-Version: 1.7.0
+Version: 1.8.0
 Libs: -L${libdir} -lgtest
 Libs.private: -lpthread
 Cflags: -I${includedir}
