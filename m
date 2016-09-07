From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed,  7 Sep 2016 20:16:59 -0300
Subject: [Buildroot] [PATCH v2] gtest/gmock: bump to version 1.8.0
In-Reply-To: <1473286853-23560-1-git-send-email-casantos@datacom.ind.br>
References: <1473286853-23560-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1473290219-27701-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Version 1.8.0 now includes gmock so merge gmock package inside gtest.

In this merge:
 - Add gmock as a suboption of gtest (BR2_PACKAGE_GTEST_GMOCK)
   following advice from Arnout Vandecappelle
 - Make gmock a virtual package that selects BR2_PACKAGE_GTEST and
   BR2_PACKAGE_GTEST_GMOCK, to provide backward compatibility
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

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

---
Changes v1 -> v2
  - Add mirtual package for host-gmock, as pointed-out by Arnout
    Vandecappelle.

Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/gmock/0001-force-use-python2.patch | 20 ----------
 package/gmock/Config.in                    | 26 +++++--------
 package/gmock/gmock.hash                   |  2 -
 package/gmock/gmock.mk                     | 60 +-----------------------------
 package/gtest/Config.in                    | 28 +++++++++++++-
 package/{gmock => gtest}/gmock.pc          |  2 +-
 package/gtest/gtest.hash                   |  2 +-
 package/gtest/gtest.mk                     | 52 +++++++++++++++++++++-----
 package/gtest/gtest.pc                     |  2 +-
 9 files changed, 84 insertions(+), 110 deletions(-)
 delete mode 100644 package/gmock/0001-force-use-python2.patch
 delete mode 100644 package/gmock/gmock.hash
 rename package/{gmock => gtest}/gmock.pc (93%)

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
index ec3eb92..c2b36f3 100644
--- a/package/gmock/Config.in
+++ b/package/gmock/Config.in
@@ -1,31 +1,23 @@
 config BR2_PACKAGE_GMOCK
 	bool "gmock"
 	select BR2_PACKAGE_GTEST
+	select BR2_PACKAGE_GTEST_GMOCK
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	help
-	  Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
-	  specifics in mind, Google C++ Mocking Framework (or Google Mock for
-	  short) is a library for writing and using C++ mock classes.
+	  This virtual package provides backward compatibility for
+	  packages that depend on the old "gmock" package, whose
+	  functionality is provided by "gtest", now.
 
-	  Google Mock:
+if BR2_PACKAGE_GMOCK
 
-	    * lets you create mock classes trivially using simple macros,
-	    * supports a rich set of matchers and actions,
-	    * handles unordered, partially ordered, or completely ordered
-	      expectations,
-	    * is extensible by users, and
-	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
-	      Symbian.
+config BR2_PACKAGE_PROVIDES_GMOCK
+	string
+	default "gtest"
 
-	    http://code.google.com/p/googlemock/
-
-	  There are both host and target packages. The target one has include
-	  files required to compile the tests and the static libraries required
-	  to link/run them. The host package installs gmock_gen, a Python script
-	  used to generate code mocks.
+endif
 
 comment "gmock needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
deleted file mode 100644
index 2b71739..0000000
--- a/package/gmock/gmock.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally computed
-sha256 26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b  gmock-1.7.0.zip
diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
index 4f04422..70a006c 100644
--- a/package/gmock/gmock.mk
+++ b/package/gmock/gmock.mk
@@ -4,61 +4,5 @@
 #
 ################################################################################
 
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
+$(eval $(virtual-package))
+$(eval $(host-virtual-package))
diff --git a/package/gtest/Config.in b/package/gtest/Config.in
index c07f13b..3b0b5d5 100644
--- a/package/gtest/Config.in
+++ b/package/gtest/Config.in
@@ -19,7 +19,33 @@ config BR2_PACKAGE_GTEST
 	  This package allows running testsuites on the target which
 	  might be advantageous in certain cases.
 
-	  http://code.google.com/p/googletest/
+	  https://github.com/google/googletest
+
+if BR2_PACKAGE_GTEST
+
+config BR2_PACKAGE_GTEST_GMOCK
+	bool "Build the C++ mocking framework (gmock)"
+	help
+	  Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
+	  specifics in mind, Google C++ Mocking Framework (or Google Mock for
+	  short) is a library for writing and using C++ mock classes.
+
+	  Google Mock:
+
+	    * lets you create mock classes trivially using simple macros,
+	    * supports a rich set of matchers and actions,
+	    * handles unordered, partially ordered, or completely ordered
+	      expectations,
+	    * is extensible by users, and
+	    * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
+	      Symbian.
+
+	  There are both host and target packages. The target one has include
+	  files required to compile the tests and the static libraries required
+	  to link/run them. The host package installs gmock_gen, a Python script
+	  used to generate code mocks.
+
+endif # BR2_PACKAGE_GTEST
 
 comment "gtest needs a toolchain w/ C++, wchar, threads"
 	depends on BR2_USE_MMU
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
index eb30905..249971e 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,13 +4,27 @@
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
+GTEST_LICENSE_FILES += googlemock/LICENSE
+GTEST_DEPENDENCIES = host-gtest
+
+HOST_GTEST_LICENSE = Apache-2.0
+HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
+HOST_GTEST_DEPENDENCIES = host-python
+else
+# By default, gtest also builds gmock
+GTEST_SUBDIR = googletest
+endif
+
+HOST_GTEST_GMOCK_PYTHONPATH = \
+        $(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
@@ -21,11 +35,7 @@ GTEST_LICENSE_FILES = LICENSE
 # the gtest sources.
 GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
-define GTEST_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
-	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
-	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
-	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
+define GTEST_INSTALL_MISSING_FILES
 	$(INSTALL) -D -m 0644 package/gtest/gtest.pc \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gtest.pc
 	# Generate the gtest-config script manually, since the CMake
@@ -39,9 +49,33 @@ define GTEST_INSTALL_STAGING_CMDS
 		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
 		s%@PTHREAD_CFLAGS@%%;\
 		s%@PTHREAD_LIBS@%-lpthread%;' \
-		$(@D)/scripts/gtest-config.in \
+		$(@D)/googletest/scripts/gtest-config.in \
 		> $(STAGING_DIR)/usr/bin/gtest-config
 	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
 endef
 
+GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_INSTALL_MISSING_FILES
+
+ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
+define GTEST_GMOCK_INSTALL_MISSING_FILE
+	$(INSTALL) -D -m 0755 package/gtest/gmock.pc \
+		$(STAGING_DIR)/usr/lib/pkgconfig/gmock.pc
+endef
+
+GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_GMOCK_INSTALL_MISSING_FILE
+
+define HOST_GTEST_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
+		$(HOST_DIR)/usr/bin/gmock_gen.py
+	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
+	cp -rp $(@D)/googlemock/scripts/generator/cpp \
+		$(HOST_GTEST_GMOCK_PYTHONPATH)
+endef
+endif
+
 $(eval $(cmake-package))
+ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
+# The host package does not build anything, just installs gmock_gen stuff, so
+# it does not need to be a host-cmake-package.
+$(eval $(host-generic-package))
+endif
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
-- 
2.7.4
