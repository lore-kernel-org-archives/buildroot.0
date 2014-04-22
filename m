From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 22 Apr 2014 23:27:28 +0200
Subject: [Buildroot] [PATCH] evtest: bump version to 1.31
Message-ID: <1398202048-28811-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- update version to 1.31
- change download url to official repository
- remove evtest-capture support (dropped since 1.31)
- change broken project URL to official repository

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/evtest/Config.in | 14 +-------------
 package/evtest/evtest.mk | 22 +++++-----------------
 2 files changed, 6 insertions(+), 30 deletions(-)

diff --git a/package/evtest/Config.in b/package/evtest/Config.in
index 77821c4..1087217 100644
--- a/package/evtest/Config.in
+++ b/package/evtest/Config.in
@@ -6,16 +6,4 @@ config BR2_PACKAGE_EVTEST
 	  device. It then monitors the device and displays all the
 	  events layer events generated.
 
-	  http://www.freedesktop.org/wiki/Evtest
-
-if BR2_PACKAGE_EVTEST
-
-config BR2_PACKAGE_EVTEST_CAPTURE
-	bool "evtest-capture"
-	select BR2_PACKAGE_LIBXML2
-	help
-	  evtest-capture captures the information and events from the
-	  input device specified on the command line and writes it to
-	  the xml file given.
-
-endif
+	  http://cgit.freedesktop.org/evtest
diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
index 2a87553..e3ff9d6 100644
--- a/package/evtest/evtest.mk
+++ b/package/evtest/evtest.mk
@@ -4,25 +4,13 @@
 #
 ################################################################################
 
-EVTEST_VERSION = 1.30
-EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.bz2
-# no official upstream tarball
-EVTEST_SITE = http://pkgs.fedoraproject.org/repo/pkgs/evtest/evtest-1.30.tar.bz2/27c0902839babfd07136f232c63c895c/
+EVTEST_VERSION = 1.31
+EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.gz
+EVTEST_SITE = http://cgit.freedesktop.org/evtest/snapshot
 EVTEST_LICENSE = GPLv2
 EVTEST_LICENSE_FILES = COPYING
 EVTEST_DEPENDENCIES = host-pkgconf
-
-ifeq ($(BR2_PACKAGE_EVTEST_CAPTURE),y)
-EVTEST_DEPENDENCIES += libxml2
-else
-# evtest-capture will unconditionally be built/installed if libxml2 is present
-define EVTEST_REMOVE_EVTEST_CAPTURE
-	rm -rf $(TARGET_DIR)/usr/bin/evtest-capture \
-	       $(TARGET_DIR)/usr/share/evtest \
-	       $(TARGET_DIR)/usr/share/man/man1/evtest-capture.1
-endef
-
-EVTEST_POST_INSTALL_TARGET_HOOKS += EVTEST_REMOVE_EVTEST_CAPTURE
-endif
+# needed because source package contains no generated files
+EVTEST_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.8.1.4
