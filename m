From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 22:55:53 +0200
Subject: [Buildroot] [git commit] gtest: retrieve package from github
Message-ID: <20160906211731.4A63881F74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cd962b3bcb842985369cb276e6cba0f8b15289c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://googletest.googlecode.com/files is no more available, so update
gtest.mk and gtest.hash to retrieve googletest source code as a tar.gz
(and not a zip) from github as https://googletest.googlecode.com is now
a redirection to https://github.com/google/googletest.

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gtest/gtest.hash | 4 ++--
 package/gtest/gtest.mk   | 9 ++-------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/gtest/gtest.hash b/package/gtest/gtest.hash
index 8ff79cb..79e31e4 100644
--- a/package/gtest/gtest.hash
+++ b/package/gtest/gtest.hash
@@ -1,2 +1,2 @@
-# From http://code.google.com/p/googletest/downloads/detail?name=gtest-1.7.0.zip&can=2&q=
-sha1	f85f6d2481e2c6c4a18539e391aa4ea8ab0394af	gtest-1.7.0.zip
+# Locally computed:
+sha256	f73a6546fdf9fce9ff93a5015e0333a8af3062a152a9ad6bcb772c96687016cc	gtest-release-1.7.0.tar.gz
diff --git a/package/gtest/gtest.mk b/package/gtest/gtest.mk
index 11aa7e9..eb30905 100644
--- a/package/gtest/gtest.mk
+++ b/package/gtest/gtest.mk
@@ -5,9 +5,8 @@
 ################################################################################
 
 # Make sure this remains the same version as the gmock one
-GTEST_VERSION = 1.7.0
-GTEST_SOURCE = gtest-$(GTEST_VERSION).zip
-GTEST_SITE = http://googletest.googlecode.com/files
+GTEST_VERSION = release-1.7.0
+GTEST_SITE = $(call github,google,googletest,$(GTEST_VERSION))
 GTEST_INSTALL_STAGING = YES
 GTEST_INSTALL_TARGET = NO
 GTEST_LICENSE = BSD-3c
@@ -22,10 +21,6 @@ GTEST_LICENSE_FILES = LICENSE
 # the gtest sources.
 GTEST_CONF_OPTS = -DBUILD_SHARED_LIBS=OFF
 
-define GTEST_EXTRACT_CMDS
-	$(UNZIP) $(DL_DIR)/$(GTEST_SOURCE) -d $(BUILD_DIR)
-endef
-
 define GTEST_INSTALL_STAGING_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libgtest.a $(STAGING_DIR)/usr/lib/libgtest.a
 	$(INSTALL) -D -m 0755 $(@D)/libgtest_main.a $(STAGING_DIR)/usr/lib/libgtest_main.a
