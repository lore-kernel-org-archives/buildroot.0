From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 12 May 2013 10:55:24 -0300
Subject: [Buildroot] [PATCH 3/3] gawk: bump to version 4.1.0
In-Reply-To: <1368366924-11330-1-git-send-email-gustavo@zacarias.com.ar>
References: <1368366924-11330-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1368366924-11330-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gawk/Config.in                               |  1 +
 ...no-versioned.patch => gawk-01-no-versioned.patch} |  0
 package/gawk/gawk.mk                                 | 20 ++++++++++----------
 3 files changed, 11 insertions(+), 10 deletions(-)
 rename package/gawk/{gawk-no-versioned.patch => gawk-01-no-versioned.patch} (100%)

diff --git a/package/gawk/Config.in b/package/gawk/Config.in
index 82c970f..7b49667 100644
--- a/package/gawk/Config.in
+++ b/package/gawk/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_GAWK
 	bool "gawk"
 	depends on BR2_USE_WCHAR
+	depends on !BR2_PREFER_STATIC_LIB
 	help
 	  A special-purpose programming language which is data driven
 	  rather than procedural.  Allows for simple data-reformatting jobs
diff --git a/package/gawk/gawk-no-versioned.patch b/package/gawk/gawk-01-no-versioned.patch
similarity index 100%
rename from package/gawk/gawk-no-versioned.patch
rename to package/gawk/gawk-01-no-versioned.patch
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 366dea7..b26430e 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,10 +4,10 @@
 #
 #############################################################
 
-GAWK_VERSION = 4.0.1
+GAWK_VERSION = 4.1.0
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
-GAWK_TARGET_BINS = awk gawk igawk pgawk
-GAWK_LICENSE = GPLv3
+GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
+GAWK_LICENSE = GPLv3+
 GAWK_LICENSE_FILES = COPYING
 
 # Prefer full-blown gawk over busybox awk
@@ -15,7 +15,7 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 GAWK_DEPENDENCIES += busybox
 endif
 
-# we don't have a host-busybox
+# We don't have a host-busybox
 HOST_GAWK_DEPENDENCIES =
 
 define GAWK_CREATE_SYMLINK
@@ -24,13 +24,13 @@ endef
 
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
 
-define GAWK_UNINSTALL_TARGET_CMDS
-	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, $(GAWK_TARGET_BINS))
-	rm -f $(TARGET_DIR)/usr/share/info/gawk*.info
-	rm -f $(TARGET_DIR)/usr/share/man/man*/*gawk.1
-	rm -rf $(TARGET_DIR)/usr/libexec/awk
-	rm -rf $(TARGET_DIR)/usr/share/awk
+# Assume we support shared libs
+# The check isn't cross-compile friendly and it's mandatory anyway
+define GAWK_DISABLE_SHARED_CHECK
+	$(SED) 's/ check-for-shared-lib-support//' $(@D)/extension/Makefile.in
 endef
 
+GAWK_POST_PATCH_HOOKS += GAWK_DISABLE_SHARED_CHECK
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.1.5
