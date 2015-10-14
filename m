From: Alan Ott <alan@softiron.co.uk>
Date: Wed, 14 Oct 2015 17:51:23 -0400
Subject: [Buildroot] [PATCH 5/5] gmock: Upgrade to GitHub HEAD
In-Reply-To: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
Message-ID: <1444859483-2268-6-git-send-email-alan@softiron.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is being shut down. The google code site which hosts the
source .zip for gmock references github.com/google/googletest, but that
repo does not have the same code underneath the versioned tags as the
google code repo.  For this reason It was decided by Peter Korsgaard and I
to upgrade to the current HEAD. The current HEAD is laid out
differently (with gtest and gmock combined into the same repo).

Change the GMOCK_SITE to this new github repo, fix the version, fix the
paths, and remove the custom extraction commands.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
---
 package/gmock/0001-force-use-python2.patch |  8 ++++----
 package/gmock/gmock.hash                   |  4 ++--
 package/gmock/gmock.mk                     | 31 ++++++++++--------------------
 3 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/package/gmock/0001-force-use-python2.patch b/package/gmock/0001-force-use-python2.patch
index 5dcb231..b975bc3 100644
--- a/package/gmock/0001-force-use-python2.patch
+++ b/package/gmock/0001-force-use-python2.patch
@@ -2,16 +2,16 @@ Force use of Python 2 even when Python 3 is the default Python interpreter.
 
 Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 
---- ./gtest/scripts/fuse_gtest_files.py.orig	2013-09-18 14:48:30.000000000 -0300
-+++ ./gtest/scripts/fuse_gtest_files.py	2015-07-22 15:42:53.291591205 -0300
+--- ./googletest/scripts/fuse_gtest_files.py.orig	2013-09-18 14:48:30.000000000 -0300
++++ ./googletest/scripts/fuse_gtest_files.py	2015-07-22 15:42:53.291591205 -0300
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python2
  #
  # Copyright 2009, Google Inc.
  # All rights reserved.
---- ./scripts/generator/gmock_gen.py.orig	2013-09-18 14:50:15.000000000 -0300
-+++ ./scripts/generator/gmock_gen.py	2015-07-22 17:06:51.071815634 -0300
+--- ./googlemock/scripts/generator/gmock_gen.py.orig	2013-09-18 14:50:15.000000000 -0300
++++ ./googlemock/scripts/generator/gmock_gen.py	2015-07-22 17:06:51.071815634 -0300
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python2
diff --git a/package/gmock/gmock.hash b/package/gmock/gmock.hash
index 2b71739..f830abf 100644
--- a/package/gmock/gmock.hash
+++ b/package/gmock/gmock.hash
@@ -1,2 +1,2 @@
-# Locally computed
-sha256 26fcbb5925b74ad5fc8c26b0495dfc96353f4d553492eb97e85a8a6d2f43095b  gmock-1.7.0.zip
+# Locally computed:
+sha256	58d1b6118176b527301c03010b7cb709b7c4b729078a55e4bb3341dfb40f5834	gmock-7f4448f40b3f3f16a75787c016139511579367ed.tar.gz
diff --git a/package/gmock/gmock.mk b/package/gmock/gmock.mk
index a0351d0..e94d086 100644
--- a/package/gmock/gmock.mk
+++ b/package/gmock/gmock.mk
@@ -5,14 +5,16 @@
 ################################################################################
 
 # Make sure this remains the same version as the gtest one
-GMOCK_VERSION = 1.7.0
-GMOCK_SOURCE = gmock-$(GMOCK_VERSION).zip
-GMOCK_SITE = http://googlemock.googlecode.com/files
+GMOCK_VERSION = 7f4448f40b3f3f16a75787c016139511579367ed
+# The above revision must remain the same as the gtest package
+GMOCK_SITE = $(call github,google,googletest,$(GMOCK_VERSION))
 GMOCK_INSTALL_STAGING = YES
 GMOCK_INSTALL_TARGET = NO
 GMOCK_LICENSE = BSD-3c
 GMOCK_LICENSE_FILES = LICENSE
 GMOCK_DEPENDENCIES = gtest host-gmock
+GMOCK_AUTORECONF = YES
+GMOCK_SUBDIR = googlemock
 
 # GMock 1.7.0 relies on Python 2.7 syntax which is NOT compatible with Python3.
 HOST_GMOCK_DEPENDENCIES = host-python
@@ -26,34 +28,21 @@ HOST_GMOCK_PYTHONPATH=$(HOST_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-pac
 #    set up necessary compiler settings".
 GMOCK_CONF_OPTS = --enable-static --disable-shared
 
-define GMOCK_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(BUILD_DIR)
-endef
-
 # We can't use the default rule for autotools-package staging because it fails
 # because it tries to rebuild/install gtest stuff and fails after this error:
 #    "'make install' is dangerous and not supported. Instead, see README for
 #      how to integrate Google Test into your build system."
 define GMOCK_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
-	$(INSTALL) -D -m 0755 $(@D)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
+	$(INSTALL) -D -m 0755 $(@D)/$(GMOCK_SUBDIR)/lib/.libs/libgmock.a $(STAGING_DIR)/usr/lib/libgmock.a
+	$(INSTALL) -D -m 0755 $(@D)/$(GMOCK_SUBDIR)/lib/.libs/libgmock_main.a $(STAGING_DIR)/usr/lib/libgmock_main.a
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gmock/
-	cp -rp $(@D)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
-endef
-
-# Unzipping inside $(@D) and moving everything from the created subdirectory is
-# required because unzipping directly in $(BUILD_DIR) would cause host-gmock to
-# overwrite the gmock subdir instead of unzipping in a host-gmock subdir.
-define HOST_GMOCK_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GMOCK_SOURCE) -d $(@D)
-	mv $(@D)/gmock-$(GMOCK_VERSION)/* $(@D)
-	rmdir $(@D)/gmock-$(GMOCK_VERSION)
+	cp -rp $(@D)/$(GMOCK_SUBDIR)/include/gmock/* $(STAGING_DIR)/usr/include/gmock/
 endef
 
 define HOST_GMOCK_INSTALL_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
+	$(INSTALL) -D -m 0755 $(@D)/$(GMOCK_SUBDIR)/scripts/generator/gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen.py
 	ln -sf gmock_gen.py $(HOST_DIR)/usr/bin/gmock_gen
-	cp -rp $(@D)/scripts/generator/cpp $(HOST_GMOCK_PYTHONPATH)
+	cp -rp $(@D)/$(GMOCK_SUBDIR)/scripts/generator/cpp $(HOST_GMOCK_PYTHONPATH)
 endef
 
 $(eval $(autotools-package))
-- 
2.1.4
