From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  8 Jul 2021 16:59:46 +0200
Subject: [Buildroot] [PATCH] package/gtest: bump to version 1.11.0
Message-ID: <20210708145946.854654-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python is removed as dependency.
gtest uses python for self-tests which are not run by buildroot,
and the remaining scripts are not used by the build, and aren't
maintained or supported.

Special handling for gtest-config and gmock-config is removed aswell,
the CMake Buildsystem now does take care of those.

Installation of the python gmock generator scripts is conditional upon
host-python[3]. Since this is one of the unsupported + unmaintained
scripts, installation probably should be gutted completely.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/gtest/gtest.hash |  4 +--
 package/gtest/gtest.mk   | 53 ++++++----------------------------------
 2 files changed, 10 insertions(+), 47 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 082c597780..d21fea7142 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	9dc9157a9a1551ec7a7e43daea9a694a0bb5fb8bec81235d8a1e6ef64c716dcb	gtest-1.10.0.tar.gz
-sha256	9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138	googletest/LICENSE
+sha256  b4870bf121ff7795ba20d20bcdd8627b8e088f2d1dab299a031c1034eddc93d5  gtest-1.11.0.tar.gz
+sha256  9702de7e4117a8e2b20dafab11ffda58c198aede066406496bef670d40a22138  LICENSE
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index f8b2339d7e..994f63ec2d 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GTEST_VERSION = 1.10.0
+GTEST_VERSION = 1.11.0
 GTEST_SITE = $(call github,google,googletest,release-$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
@@ -20,15 +20,12 @@ endif
 HOST_GTEST_LICENSE = Apache-2.0
 HOST_GTEST_LICENSE_FILES = googlemock/scripts/generator/LICENSE
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-HOST_GTEST_PYTHON_VERSION = $(PYTHON3_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python3
-else
-HOST_GTEST_PYTHON_VERSION = $(PYTHON_VERSION_MAJOR)
-HOST_GTEST_DEPENDENCIES += host-python
-endif
-
 HOST_GTEST_GMOCK_PYTHONPATH = \
-	$(HOST_DIR)/lib/python$(HOST_GTEST_PYTHON_VERSION)/site-packages
+	$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
+else ifeq ($(BR2_PACKAGE_PYTHON),y)
+HOST_GTEST_GMOCK_PYTHONPATH = \
+	$(HOST_DIR)/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
+endif
 
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
@@ -48,54 +45,20 @@ endif
 
 GTEST_CONF_OPTS += -DBUILD_GTEST=ON
 
-# Generate the gtest-config script manually, since the CMake build system is
-# not doing it.
-define GTEST_INSTALL_GTEST_CONFIG
-	sed 's%@PACKAGE_TARNAME@%gtest%;\
-		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
-		s%@prefix@%$(STAGING_DIR)/usr%;\
-		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
-		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
-		s%@includedir@%$(STAGING_DIR)/usr/include%;\
-		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
-		s%@PTHREAD_CFLAGS@%%;\
-		s%@PTHREAD_LIBS@%-lpthread%;' \
-		$(@D)/googletest/scripts/gtest-config.in \
-		> $(STAGING_DIR)/usr/bin/gtest-config
-	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
-endef
-GTEST_POST_INSTALL_STAGING_HOOKS = GTEST_INSTALL_GTEST_CONFIG
-
 ifeq ($(BR2_PACKAGE_GTEST_GMOCK),y)
 GTEST_CONF_OPTS += -DBUILD_GMOCK=ON
-
-# Generate the gmock-config script manually, since the CMake build system is
-# not doing it.
-define GTEST_INSTALL_GMOCK_CONFIG
-	sed 's%@PACKAGE_TARNAME@%gmock%;\
-		s%@PACKAGE_VERSION@%$(GTEST_VERSION)%;\
-		s%@prefix@%$(STAGING_DIR)/usr%;\
-		s%@exec_prefix@%$(STAGING_DIR)/usr%;\
-		s%@libdir@%$(STAGING_DIR)/usr/lib%;\
-		s%@includedir@%$(STAGING_DIR)/usr/include%;\
-		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
-		s%@PTHREAD_CFLAGS@%%;\
-		s%@PTHREAD_LIBS@%-lpthread%;' \
-		$(@D)/googlemock/scripts/gmock-config.in \
-		> $(STAGING_DIR)/usr/bin/gmock-config
-	chmod +x $(STAGING_DIR)/usr/bin/gmock-config
-endef
-GTEST_POST_INSTALL_STAGING_HOOKS += GTEST_INSTALL_GMOCK_CONFIG
 else
 GTEST_CONF_OPTS += -DBUILD_GMOCK=OFF
 endif
 
+ifneq ($(HOST_GTEST_GMOCK_PYTHONPATH),)
 define HOST_GTEST_INSTALL_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/googlemock/scripts/generator/gmock_gen.py \
 		$(HOST_DIR)/bin/gmock_gen
 	cp -rp $(@D)/googlemock/scripts/generator/cpp \
 		$(HOST_GTEST_GMOCK_PYTHONPATH)
 endef
+endif
 
 $(eval $(cmake-package))
 # The host package does not build anything, just installs gmock_gen stuff, so
-- 
2.30.2
