From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 20 Sep 2012 21:26:42 +0200
Subject: [Buildroot] [git commit] gettext: remove option to build statically
Message-ID: <20120920195431.BE6F9996BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=300cd640ecc6aa54c43ffeb1fc6aa4750c70885b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
CC: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/gettext/Config.in  |   12 ------------
 package/gettext/gettext.mk |    9 ---------
 2 files changed, 0 insertions(+), 21 deletions(-)

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
