From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 17 Mar 2013 22:16:16 +0200
Subject: [Buildroot] [PATCH 1/1] Added package Gutenprint
Message-ID: <1363551377-4459-1-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gutenprint, formerly named Gimp-Print, is a suite of printer
drivers that may be used with most common UNIX print spooling
systems, including CUPS, lpr, LPRng, or others

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in                             |    1 +
 package/gutenprint/Config.in                  |   10 +++++
 package/gutenprint/gutenprint-patchmake.patch |   25 +++++++++++++
 package/gutenprint/gutenprint.mk              |   49 +++++++++++++++++++++++++
 4 files changed, 85 insertions(+)
 create mode 100644 package/gutenprint/Config.in
 create mode 100644 package/gutenprint/gutenprint-patchmake.patch
 create mode 100644 package/gutenprint/gutenprint.mk

diff --git a/package/Config.in b/package/Config.in
index f8866a5..6ab171a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -636,6 +636,7 @@ source "package/conntrack-tools/Config.in"
 menu "cups (common unix printing system)"
 source "package/cups/Config.in"
 source "package/foomatic-filters/Config.in"
+source "package/gutenprint/Config.in"
 source "package/hplip/Config.in"
 endmenu #cups
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/gutenprint/Config.in b/package/gutenprint/Config.in
new file mode 100644
index 0000000..f54f001
--- /dev/null
+++ b/package/gutenprint/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_GUTENPRINT
+	bool "gutenprint"
+	depends on BR2_PACKAGE_CUPS
+	help
+	  Gutenprint, formerly named Gimp-Print, is a suite of printer
+          drivers that may be used with most common UNIX print spooling
+          systems, including CUPS, lpr, LPRng, or others
+
+	  http://gimp-print.sourceforge.net/
+
diff --git a/package/gutenprint/gutenprint-patchmake.patch b/package/gutenprint/gutenprint-patchmake.patch
new file mode 100644
index 0000000..f71be61
--- /dev/null
+++ b/package/gutenprint/gutenprint-patchmake.patch
@@ -0,0 +1,25 @@
+From 893d788f5d0e8aa29ba2c3ffdf5cab8c2e6424b4 Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Wed, 13 Feb 2013 22:45:33 +0200
+Subject: [PATCH] changed Makefile.in
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ src/Makefile.in |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 9c0d149..b690823 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -318,7 +318,6 @@ AM_CPPFLAGS = -I$(top_srcdir)/include -I$(top_builddir)/include $(LOCAL_CPPFLAGS
+ GUTENPRINTUI_LIBS = $(top_builddir)/src/gutenprintui/libgutenprintui.la
+ SUBDIRS = \
+ 	main					\
+-	xml					\
+ 	gutenprintui2				\
+ 	escputil				\
+ 	gimp2					\
+-- 
+1.7.9.5
+
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
new file mode 100644
index 0000000..c24523b
--- /dev/null
+++ b/package/gutenprint/gutenprint.mk
@@ -0,0 +1,49 @@
+#############################################################
+#
+# gutenprint
+#
+#############################################################
+GUTENPRINT_VERSION = 5.2.9
+GUTENPRINT_SITE = http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
+GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
+GUTENPRINT_DEPENDENCIES = cups host-gutenprint
+HOST_GUTENPRINT_DEPENDENCIES = #Needed to not depend on host-cups
+
+HOST_GUTENPRINT_CONF_OPT = --disable-libgutenprintui2 \
+                           --disable-samples \
+                           --without-gimp2 \
+                           --without-doc \
+                           --disable-nls \
+                           --disable-nls-macos \
+                           --without-foomatic \
+                           --without-foomatic3 \
+                           --disable-escputil \
+                           --disable-test \
+                           --disable-testpattern
+
+GUTENPRINT_CONF_OPT =      --disable-libgutenprintui2 \
+                           --disable-samples \
+                           --without-gimp2 \
+                           --without-doc \
+                           --disable-nls \
+                           --disable-nls-macos \
+                           --without-foomatic \
+                           --without-foomatic3 \
+                           --prefix=/usr \
+                           --disable-escputil \
+                           --disable-test \
+                           --disable-testpattern \
+                           --with-cups="/usr" \
+                           --with-sysroot="$(STAGING_DIR)" \
+                           --disable-cups-ppds
+                                
+
+define GUTENPRINT_POST_INSTALL_TARGET_FIXUP
+	mkdir -p $(TARGET_DIR)/usr/share/gutenprint/5.2
+        cp -rf $(HOST_DIR)/usr/share/gutenprint/5.2/xml $(TARGET_DIR)/usr/share/gutenprint/5.2
+endef
+GUTENPRINT_POST_INSTALL_TARGET_HOOKS += GUTENPRINT_POST_INSTALL_TARGET_FIXUP
+
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
