From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:21:00 +0200
Subject: [Buildroot] [PATCH 1/5] gettext: remove option to build statically
In-Reply-To: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
References: <cover.1342732829.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a2c4c97c620841e1f0d504cf60ff33c02e048f05.1342732829.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/Config.in  |   12 ------------
 package/gettext/gettext.mk |    9 ---------
 2 files changed, 21 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index fabfe1e..0ee4065 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -12,18 +12,6 @@ config BR2_PACKAGE_GETTEXT
 comment "gettext requires a toolchain with WCHAR support"
 	depends on BR2_NEEDS_GETTEXT && !BR2_USE_WCHAR
 
-config BR2_PACKAGE_GETTEXT_STATIC
-	bool "Use libgettext.a instead of libgettext.so.*"
-	depends on BR2_PACKAGE_GETTEXT
-	depends on BR2_arm
-	help
-	  The GNU `gettext' utilities are a set of tools that provide a
-	  framework to help other GNU packages produce multi-lingual
-	  messages.
-
-	  http://www.gnu.org/software/gettext/
-
-
 config BR2_PACKAGE_LIBINTL
 	bool "libintl"
 	depends on BR2_NEEDS_GETTEXT
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 9778007..20bd672 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -11,11 +11,7 @@ GETTEXT_CAT:=$(ZCAT)
 GETTEXT_BINARY:=gettext-runtime/src/gettext
 GETTEXT_TARGET_BINARY:=usr/bin/gettext
 
-ifeq ($(BR2_PACKAGE_GETTEXT_STATIC),y)
-LIBINTL_TARGET_BINARY:=usr/lib/libintl.a
-else
 LIBINTL_TARGET_BINARY:=usr/lib/libintl.so
-endif
 
 $(DL_DIR)/$(GETTEXT_SOURCE):
 	 $(call DOWNLOAD,$(GETTEXT_SITE)/$(GETTEXT_SOURCE))
@@ -147,11 +143,6 @@ $(TARGET_DIR)/usr/lib/libintl.so: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 		libgettext*.so*.la libintl*.so*.la)
 	touch -c $@
 
-$(TARGET_DIR)/usr/lib/libintl.a: $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
-	cp -dpf $(STAGING_DIR)/usr/lib/libgettext*.a $(TARGET_DIR)/usr/lib/
-	cp -dpf $(STAGING_DIR)/usr/lib/libintl*.a $(TARGET_DIR)/usr/lib/
-	touch -c $@
-
 libintl: $(TARGET_DIR)/$(LIBINTL_TARGET_BINARY)
 
 #############################################################
-- 
1.7.9.5
