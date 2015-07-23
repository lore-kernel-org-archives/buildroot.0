From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 23 Jul 2015 17:39:30 -0300
Subject: [Buildroot] [PATCH V3 1/1] gmock: new package
In-Reply-To: <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
References: <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <1437683970-38663-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
specifics in mind, Google C++ Mocking Framework (or Google Mock for
short) is a library for writing and using C++ mock classes.

Google Mock:

  * lets you create mock classes trivially using simple macros,
  * supports a rich set of matchers and actions,
  * handles unordered, partially ordered, or completely ordered
    expectations,
  * is extensible by users, and
  * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
    Symbian.

  http://code.google.com/p/googlemock/

There are both host and target packages. The target one has include
files required to compile the tests and the static libraries required
to link/run them. The host package installs gmock_gen, a Python script
used to generate code mocks.

Notice that GMock 1.7.0 requires the Python 2 host package even if
Python 3 is selected as a target package.

Signed-off-by: Marcelo Barbosa <marcelo.barbosa@datacom.ind.br>
Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
---
 package/Config.in                                 |  1 +
 package/gmock/0001-fuse_gtest_files-python2.patch |  8 ++++
 package/gmock/0002-gmock_gen-python2.patch        |  8 ++++
 package/gmock/Config.in                           | 31 +++++++++++++
 package/gmock/gmock.hash                          |  2 +
 package/gmock/gmock.mk                            | 56 +++++++++++++++++++++++
 package/gtest/gtest.mk                            |  1 +
 7 files changed, 107 insertions(+)
 create mode 100644 package/gmock/0001-fuse_gtest_files-python2.patch
 create mode 100644 package/gmock/0002-gmock_gen-python2.patch
 create mode 100644 package/gmock/Config.in
 create mode 100644 package/gmock/gmock.hash
 create mode 100644 package/gmock/gmock.mk

diff --git a/package/Config.in b/package/Config.in
index 9942e3a..c95bfe6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1042,6 +1042,7 @@ menu "Other"
 	source "package/gflags/Config.in"
 	source "package/glibmm/Config.in"
 	source "package/glm/Config.in"
+	source "package/gmock/Config.in"
 	source "package/gmp/Config.in"
 	source "package/gsl/Config.in"
 	source "package/gtest/Config.in"
diff --git a/package/gmock/0001-fuse_gtest_files-python2.patch b/package/gmock/0001-fuse_gtest_files-python2.patch
new file mode 100644
index 0000000..dc0096e
--- /dev/null
+++ b/package/gmock/0001-fuse_gtest_files-python2.patch
@@ -0,0 +1,8 @@
+--- ./gtest/scripts/fuse_gtest_files.py.orig	2013-09-18 14:48:30.000000000 -0300
++++ ./gtest/scripts/fuse_gtest_files.py	2015-07-22 15:42:53.291591205 -0300
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python2
+ #
+ # Copyright 2009, Google Inc.
+ # All rights reserved.
diff --git a/package/gmock/0002-gmock_gen-python2.patch b/package/gmock/0002-gmock_gen-python2.patch
new file mode 100644
index 0000000..9015a22
--- /dev/null
+++ b/package/gmock/0002-gmock_gen-python2.patch
@@ -0,0 +1,8 @@
+--- ./scripts/generator/gmock_gen.py.orig	2013-09-18 14:50:15.000000000 -0300
++++ ./scripts/generator/gmock_gen.py	2015-07-22 17:06:51.071815634 -0300
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python2
+ #
+ # Copyright 2008 Google Inc. All Rights Reserved.
+ #
diff --git a/package/gmock/Config.in b/package/gmock/Config.in
new file mode 100644
index 0000000..d792945
--- /dev/null
+++ b/package/gmock/Config.in
@@ -0,0 +1,31 @@
+config BR2_PACKAGE_GMOCK
+	bool "gmock"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
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
+	    http://code.google.com/p/googlemock/
+
+	  There are both host and target packages. The target one has include
+	  files required to compile the tests and the static libraries required
+	  to link/run them. The host package installs gmock_gen, a Python script
+	  used to generate code mocks.
+
+comment "gmock needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
new file mode 100644
index 0000000..2b71739
--- /dev/null
+++ b/package/gmock/gmock.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b  gmock-1.7.0.zip
diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
new file mode 100644
index 0000000..aad2183
--- /dev/null
+++ b/package/gmock/gmock.mk
@@ -0,0 +1,56 @@
+################################################################################
+#
+# gmock
+#
+################################################################################
+
+# Make sure this remains the same version as the gtest one
+GMOCK_VERSION = 1.7.0
+GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
+GMOCK_SITE = http://googlemock.googlecode.com/files
+GMOCK_INSTALL_STAGING = YES
+GMOCK_INSTALL_TARGET = NO
+GMOCK_LICENSE = BSD-3c
+GMOCK_LICENSE_FILES = LICENSE
+GMOCK_DEPENDENCIES = gtest host-gmock
+
+# GMock 1.7.0 relies on Python 2.7 syntax which is NOT compatible with Python3.
+HOST_GMOCK_DEPENDENCIES = host-python
+HOST_GMOCK_PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+
+GMOCK_CONF_OPTS = --enable-static --disable-shared
+
+define GMOCK_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
+endef
+
+# We can't use the default rule for autotools-package staging because it fails
+# because it tries to rebuild/install gtest stuff and fails after this error:
+#    "'make install' is dangerous and not supported. Instead, see README for
+#      how to integrate Google Test into your build system."
+define GMOCK_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
+	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
+	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
+	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
+endef
+
+# Unzipping inside $(@D) and moving everything from the created subdirectory is
+# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
+# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
+define HOST_GMOCK_EXTRACT_CMDS
+	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
+	mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
+	rmdir $(@D)/gmock-$(GMOCK_VERSION)
+endef
+
+define HOST_GMOCK_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
+	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
+	cp -rp $(@D)/scripts/generator/cpp $(HOST_GMOCK_PYTHONPATH)
+endef
+
+$(eval $(autotools-package))
+# The host package does not build anything, just installs gmock_gen stuff, so
+# it does not need to be a host-autotools-package.
+$(eval $(host-generic-package))
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 562acf0..da08621 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,6 +4,7 @@
 #
 ################################################################################
 
+# Make sure this remains the same version as the gmock one
 GTEST_VERSION = 1.7.0
 GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
 GTEST_SITE = http://googletest.googlecode.com/files
-- 
1.8.3.1
