From: Alan Ott <alan@softiron.co.uk>
Date: Wed, 14 Oct 2015 17:51:22 -0400
Subject: [Buildroot] [PATCH 4/5] gtest: Upgrade to GitHub HEAD
In-Reply-To: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
References: <1444859483-2268-1-git-send-email-alan@softiron.co.uk>
Message-ID: <1444859483-2268-5-git-send-email-alan@softiron.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Google Code is being shut down. The google code site which hosts the
source .zip for gtest references github.com/google/googletest, but that
repo does not have the same code underneath the versioned tags as the
google code repo.  For this reason It was decided by Peter Korsgaard and I
to upgrade to the current HEAD. The current HEAD is laid out
differently (with gtest and gmock combined into the same repo).

Change the GTEST_SITE to this new github repo, fix the version, fix the
paths, and remove the custom extraction commands.

Signed-off-by: Alan Ott <alan@softiron.co.uk>
---
 package/gtest/gtest.hash |  4 ++--
 package/gtest/gtest.mk   | 19 ++++++++-----------
 2 files changed, 10 insertions(+), 13 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 8ff79cb..af6a25a 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,2 +1,2 @@
-# From http://code.google.com/p/googletest/downloads/detail?name=gtest-1.7.0.zip&can=2&q=
-sha1	f85f6d2481e2c6c4a18539e391aa4ea8ab0394af	gtest-1.7.0.zip
+# Locally computed:
+sha256	58d1b6118176b527301c03010b7cb709b7c4b729078a55e4bb3341dfb40f5834	gtest-7f4448f40b3f3f16a75787c016139511579367ed.tar.gz
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index da08621..6894f73 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -5,13 +5,14 @@
 ################################################################################
 
 # Make sure this remains the same version as the gmock one
-GTEST_VERSION = 1.7.0
-GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
-GTEST_SITE = http://googletest.googlecode.com/files
+GTEST_VERSION = 7f4448f40b3f3f16a75787c016139511579367ed
+# The above revision must remain the same as the gmock package
+GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3c
 GTEST_LICENSE_FILES = LICENSE
+GTEST_SUBDIR = googletest
 
 # While it is possible to build gtest as shared library, using this gtest shared
 # library requires to set some special configure option in the project using
@@ -22,15 +23,11 @@ GTEST_LICENSE_FILES = LICENSE
 # the gtest sources.
 GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
-define GTEST_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
-endef
-
 define GTEST_INSTALL_STAGING_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
-	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
+	$(INSTALL) -D -m 0755 $(@D)/$(GTEST_SUBDIR)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
+	$(INSTALL) -D -m 0755 $(@D)/$(GTEST_SUBDIR)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
 	$(INSTALL) -d -m 0755 $(STAGING_DIR)/usr/include/gtest/
-	cp -rp $(@D)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
+	cp -rp $(@D)/$(GTEST_SUBDIR)/include/gtest/* $(STAGING_DIR)/usr/include/gtest/
 	# Generate the gtest-config script manually, since the CMake
 	# build system is not doing it.
 	sed 's%@PACKAGE_TARNAME@%gtest%;\
@@ -42,7 +39,7 @@ define GTEST_INSTALL_STAGING_CMDS
 		s%@bindir@%$(STAGING_DIR)/usr/bin%;\
 		s%@PTHREAD_CFLAGS@%%;\
 		s%@PTHREAD_LIBS@%-lpthread%;' \
-		$(@D)/scripts/gtest-config.in \
+		$(@D)/$(GTEST_SUBDIR)/scripts/gtest-config.in \
 		> $(STAGING_DIR)/usr/bin/gtest-config
 	chmod +x $(STAGING_DIR)/usr/bin/gtest-config
 endef
-- 
2.1.4
