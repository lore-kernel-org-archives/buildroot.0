From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri, 22 Mar 2013 18:27:20 +0200
Subject: [Buildroot] [PATCH 1/1] Added package Gutenprint
Message-ID: <1363969640-7547-1-git-send-email-olivier.schonken@gmail.com>
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
Comments - This package made it very difficult in terms of cross-
compilation.  A lot of utilities need to be built and run at build
time, and also links against the gutenprint library that was compiled.
The autoconf files are also not a lot of use to change to 
CC_FOR_BUILD for the relevant utilities.  This submission is not my
best I am afraid, but I'm putting it out there in the hope that someone
can make it better, and at the very least maybe use or benefit from it.
 package/Config.in                        |    1 +
 package/gutenprint/Config.in             |   13 ++++++
 package/gutenprint/gutenprint-patch.diff |   27 ++++++++++++
 package/gutenprint/gutenprint.mk         |   66 ++++++++++++++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 package/gutenprint/Config.in
 create mode 100644 package/gutenprint/gutenprint-patch.diff
 create mode 100644 package/gutenprint/gutenprint.mk

diff --git a/package/Config.in b/package/Config.in
index 3c052b4..095aa8a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -642,6 +642,7 @@ source "package/ctorrent/Config.in"
 source "package/conntrack-tools/Config.in"
 source "package/cups/Config.in"
 source "package/foomatic-filters/Config.in"
+source "package/gutenprint/Config.in"
 source "package/hplip/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/dhcp/Config.in"
diff --git a/package/gutenprint/Config.in b/package/gutenprint/Config.in
new file mode 100644
index 0000000..653aadb
--- /dev/null
+++ b/package/gutenprint/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GUTENPRINT
+	bool "gutenprint"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_PACKAGE_CUPS
+	help
+	  Gutenprint, formerly named Gimp-Print, is a suite of printer
+          drivers that may be used with most common UNIX print spooling
+          systems, including CUPS, lpr, LPRng, or others
+
+	  http://gimp-print.sourceforge.net/
+
+comment "gutenprint requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/gutenprint/gutenprint-patch.diff b/package/gutenprint/gutenprint-patch.diff
new file mode 100644
index 0000000..46b7572
--- /dev/null
+++ b/package/gutenprint/gutenprint-patch.diff
@@ -0,0 +1,27 @@
+From dd6346ec813a550b3e3b41433261cd3d98d07fad Mon Sep 17 00:00:00 2001
+From: Olivier Schonken <olivier.schonken@gmail.com>
+Date: Fri, 22 Mar 2013 17:14:53 +0200
+Subject: [PATCH] Removed execution of extract strings
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
+---
+ src/xml/Makefile.am |    4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/xml/Makefile.am b/src/xml/Makefile.am
+index 5e09896..b6b0f78 100644
+--- a/src/xml/Makefile.am
++++ b/src/xml/Makefile.am
+@@ -52,10 +52,6 @@ all-local: xmli18n-tmp.h xml-stamp
+
+
+ xmli18n-tmp.h: xml-stamp extract-strings
+-	-rm -f $@ $@.tmp
+-	./extract-strings `cat xml-stamp | sed -e 's;^;$(srcdir)/;'` > $@.tmp
+-	mv $@.tmp $@
+-
+
+ dist-hook: xmli18n-tmp.h xml-stamp
+ # xmli18n-tmp.h is needed by po/POTFILES.in at dist time
+--
+1.7.10.4
diff --git a/package/gutenprint/gutenprint.mk b/package/gutenprint/gutenprint.mk
new file mode 100644
index 0000000..9f43092
--- /dev/null
+++ b/package/gutenprint/gutenprint.mk
@@ -0,0 +1,66 @@
+#############################################################
+#
+# gutenprint
+#
+#############################################################
+
+GUTENPRINT_VERSION = 5.2.9
+GUTENPRINT_SITE = http://downloads.sourceforge.net/gimp-print/gutenprint-5.2/$(GUTENPRINT_VERSION)
+GUTENPRINT_SOURCE = gutenprint-$(GUTENPRINT_VERSION).tar.bz2
+GUTENPRINT_LIBTOOL_PATCH = YES
+GUTENPRINT_AUTORECONF = YES
+#host-gutenprint is needed to generate XML as part of compilation
+#the program that generates the xml also links against libgutenprint
+#thus it makes more sense to build a host package and a target package
+GUTENPRINT_DEPENDENCIES = cups host-gutenprint
+HOST_GUTENPRINT_DEPENDENCIES = #Needed to override GUTENPRINT_DEPENDENCIES
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
+define GUTENPRINT_FIX_PRE_CONFIGURE
+	mkdir -p $(@D)/m4local
+	cp $(HOST_DIR)/usr/include/xmli18n-tmp.h $(@D)/src/xml/
+endef
+GUTENPRINT_PRE_CONFIGURE_HOOKS += GUTENPRINT_FIX_PRE_CONFIGURE
+
+#This patch should only be applied to the gutenprint sources
+define GUTENPRINT_PATCH_REMOVE_XML_HOOK
+	support/scripts/apply-patches.sh $(@D) $($(PKG)_DIR_PREFIX)$(RAWNAME) gutenprint-patch.diff
+endef
+GUTENPRINT_PRE_PATCH_HOOKS += GUTENPRINT_PATCH_REMOVE_XML_HOOK
+
+define GUTENPRINT_POST_INSTALL_TARGET_FIXUP
+	mkdir -p $(TARGET_DIR)/usr/share/gutenprint/5.2
+	cp -rf $(HOST_DIR)/usr/share/gutenprint/5.2/xml $(TARGET_DIR)/usr/share/gutenprint/5.2
+endef
+GUTENPRINT_POST_INSTALL_TARGET_HOOKS += GUTENPRINT_POST_INSTALL_TARGET_FIXUP
+
+define HOST_GUTENPRINT_POST_BUILD_TARGET_FIXUP
+	cp $(@D)/src/xml/xmli18n-tmp.h $(HOST_DIR)/usr/include
+endef
+HOST_GUTENPRINT_POST_BUILD_HOOKS += HOST_GUTENPRINT_POST_BUILD_TARGET_FIXUP
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
1.7.10.4
