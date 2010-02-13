From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 13 Feb 2010 16:13:59 +0100
Subject: [Buildroot] [PATCH 3/3] Bump TCL version and switch to the
	autotools infrastructure
In-Reply-To: <cover.1266074036.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266074036.git.thomas.petazzoni@free-electrons.com>
Message-ID: <155667c237ac77ba64d984feb01dbad34ff1189d.1266074036.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The version of TCL is bumped from 8.4.9 to 8.4.19, which fixes the
build breakage reported by Maxime Ripard <maxime.ripard@anandra.org>
on January, 6th, 2010.

The tcl-strtod patch is kept since it is still needed, the two other
patches are no longer useful.

At the same time, the package is converted to the autotools
infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../{tcl-strtod.patch => tcl-8.4.19-strtod.patch}  |    0
 package/tcl/tcl-configure-syntax-error.patch       |   42 ---------------
 package/tcl/tcl-strstr.patch                       |   11 ----
 package/tcl/tcl.mk                                 |   56 +++-----------------
 4 files changed, 8 insertions(+), 101 deletions(-)
 rename package/tcl/{tcl-strtod.patch => tcl-8.4.19-strtod.patch} (100%)
 delete mode 100644 package/tcl/tcl-configure-syntax-error.patch
 delete mode 100644 package/tcl/tcl-strstr.patch

diff --git a/package/tcl/tcl-strtod.patch b/package/tcl/tcl-8.4.19-strtod.patch
similarity index 100%
rename from package/tcl/tcl-strtod.patch
rename to package/tcl/tcl-8.4.19-strtod.patch
diff --git a/package/tcl/tcl-configure-syntax-error.patch b/package/tcl/tcl-configure-syntax-error.patch
deleted file mode 100644
index b22e974..0000000
--- a/package/tcl/tcl-configure-syntax-error.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-diff -ur tcl8.4.9/unix/configure tcl8.4.9-patched/unix/configure
---- tcl8.4.9/unix/configure	2004-12-06 18:23:45.000000000 -0600
-+++ tcl8.4.9-patched/unix/configure	2006-07-06 21:02:18.884355250 -0500
-@@ -2131,7 +2131,7 @@
- 	    # results, and the version is kept in special file).
- 	
- 	    if test -r /etc/.relid -a "X`uname -n`" = "X`uname -s`" ; then
--		system=MP-RAS-`awk '{print }' /etc/.relid'`
-+		system=MP-RAS-`awk '{print }' /etc/.relid`
- 	    fi
- 	    if test "`uname -s`" = "AIX" ; then
- 		system=AIX-`uname -v`.`uname -r`
-@@ -7322,7 +7322,7 @@
- 	    # results, and the version is kept in special file).
- 	
- 	    if test -r /etc/.relid -a "X`uname -n`" = "X`uname -s`" ; then
--		system=MP-RAS-`awk '{print }' /etc/.relid'`
-+		system=MP-RAS-`awk '{print }' /etc/.relid`
- 	    fi
- 	    if test "`uname -s`" = "AIX" ; then
- 		system=AIX-`uname -v`.`uname -r`
-diff -ur tcl8.4.9/unix/tcl.m4 tcl8.4.9-patched/unix/tcl.m4
---- tcl8.4.9/unix/tcl.m4	2004-12-06 18:23:45.000000000 -0600
-+++ tcl8.4.9-patched/unix/tcl.m4	2006-07-06 21:02:35.653403250 -0500
-@@ -844,7 +844,7 @@
- 	    # results, and the version is kept in special file).
- 	
- 	    if test -r /etc/.relid -a "X`uname -n`" = "X`uname -s`" ; then
--		system=MP-RAS-`awk '{print $3}' /etc/.relid'`
-+		system=MP-RAS-`awk '{print $3}' /etc/.relid`
- 	    fi
- 	    if test "`uname -s`" = "AIX" ; then
- 		system=AIX-`uname -v`.`uname -r`
-@@ -2190,7 +2190,7 @@
- 	    # results, and the version is kept in special file).
- 	
- 	    if test -r /etc/.relid -a "X`uname -n`" = "X`uname -s`" ; then
--		system=MP-RAS-`awk '{print $3}' /etc/.relid'`
-+		system=MP-RAS-`awk '{print $3}' /etc/.relid`
- 	    fi
- 	    if test "`uname -s`" = "AIX" ; then
- 		system=AIX-`uname -v`.`uname -r`
diff --git a/package/tcl/tcl-strstr.patch b/package/tcl/tcl-strstr.patch
deleted file mode 100644
index 3bed414..0000000
--- a/package/tcl/tcl-strstr.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- tcl8.4.9/compat/strstr.c	2002-01-26 03:10:08.000000000 +0200
-+++ tcl8.4.9/compat/strstr.c	2005-05-30 06:53:40.000000000 +0300
-@@ -33,6 +33,8 @@
-  *----------------------------------------------------------------------
-  */
- 
-+#include <unistd.h>
-+
- char *
- strstr(string, substring)
-     register char *string;	/* String to search. */
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index a30cce2..edcc441 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -3,66 +3,26 @@
 # TCL8.4
 #
 #############################################################
-TCL_VERSION:=8.4.9
+TCL_VERSION:=8.4.19
 TCL_SOURCE:=tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/tcl
-TCL_DIR:=$(BUILD_DIR)/tcl$(TCL_VERSION)
-
-$(DL_DIR)/$(TCL_SOURCE):
-	$(call DOWNLOAD,$(TCL_SITE),$(TCL_SOURCE))
-
-$(TCL_DIR)/.source: $(DL_DIR)/$(TCL_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(TCL_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(TCL_DIR) package/tcl/ tcl\*.patch
-	touch $(TCL_DIR)/.source
-
-$(TCL_DIR)/.configured: $(TCL_DIR)/.source
-	(cd $(TCL_DIR)/unix; rm -f config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		--sysconfdir=/etc \
+TCL_SUBDIR = unix
+TCL_CONF_OPT = \
 		--enable-shared \
 		--disable-symbols \
 		--disable-langinfo \
-		--disable-framework \
-	)
-	touch $(TCL_DIR)/.configured
+		--disable-framework
 
-$(TCL_DIR)/unix/libtcl8.4.so: $(TCL_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(TCL_DIR)/unix
-
-$(TARGET_DIR)/usr/lib/libtcl8.4.so: $(TCL_DIR)/unix/libtcl8.4.so
-	$(MAKE) INSTALL_ROOT=$(TARGET_DIR) -C $(TCL_DIR)/unix install
+define TCL_POST_INSTALL_CLEANUP
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtcl8.4.so
-	rm -Rf $(TARGET_DIR)/usr/man
 	-if [ "$(BR2_PACKAGE_TCL_DEL_ENCODINGS)" == "y" ]; then \
 	rm -Rf $(TARGET_DIR)/usr/lib/tcl8.4/encoding/*; \
 	fi
 	-if [ "$(BR2_PACKAGE_TCL_SHLIB_ONLY)" == "y" ]; then \
 	rm -f $(TARGET_DIR)/usr/bin/tclsh8.4; \
 	fi
+endef
 
-tcl: $(TARGET_DIR)/usr/lib/libtcl8.4.so
-
-tcl-source: $(DL_DIR)/$(TCL_SOURCE)
-
-tcl-clean:
-	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(TCL_DIR)/unix uninstall
-	-$(MAKE) -C $(TCL_DIR)/unix clean
+TCL_POST_INSTALL_TARGET_HOOKS += TCL_POST_INSTALL_CLEANUP
 
-tcl-dirclean:
-	rm -rf $(TCL_DIR)
-
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_TCL),y)
-TARGETS+=tcl
-endif
+$(eval $(call AUTOTARGETS,package,tcl))
-- 
1.6.3.3
