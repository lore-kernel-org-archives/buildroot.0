From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 19 Jan 2007 06:55:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/flex
Message-ID: <20070119145500.05EE64856A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-19 06:54:58 -0800 (Fri, 19 Jan 2007)
New Revision: 17381

Log:
- bump version


Added:
   trunk/buildroot/package/flex/flex-2.5.33-prog-ar.patch

Modified:
   trunk/buildroot/package/flex/flex.mk


Changeset:
Added: trunk/buildroot/package/flex/flex-2.5.33-prog-ar.patch
===================================================================
--- trunk/buildroot/package/flex/flex-2.5.33-prog-ar.patch	                        (rev 0)
+++ trunk/buildroot/package/flex/flex-2.5.33-prog-ar.patch	2007-01-19 14:54:58 UTC (rev 17381)
@@ -0,0 +1,22 @@
+diff -rup flex-2.5.33.orig/Makefile flex-2.5.33/Makefile
+--- flex-2.5.33.orig/Makefile	2007-01-18 17:29:32.000000000 +0100
++++ flex-2.5.33/Makefile	2007-01-18 18:28:29.000000000 +0100
+@@ -105,7 +105,6 @@ am__installdirs = "$(DESTDIR)$(libdir)" 
+ 	"$(DESTDIR)$(includedir)"
+ libLIBRARIES_INSTALL = $(INSTALL_DATA)
+ LIBRARIES = $(lib_LIBRARIES)
+-AR = ar
+ ARFLAGS = cru
+ libfl_a_AR = $(AR) $(ARFLAGS)
+ libfl_a_LIBADD =
+diff -rup flex-2.5.33.orig/Makefile.in flex-2.5.33/Makefile.in
+--- flex-2.5.33.orig/Makefile.in	2007-01-18 17:29:25.000000000 +0100
++++ flex-2.5.33/Makefile.in	2007-01-18 18:28:22.000000000 +0100
+@@ -105,7 +105,6 @@ am__installdirs = "$(DESTDIR)$(libdir)" 
+ 	"$(DESTDIR)$(includedir)"
+ libLIBRARIES_INSTALL = $(INSTALL_DATA)
+ LIBRARIES = $(lib_LIBRARIES)
+-AR = ar
+ ARFLAGS = cru
+ libfl_a_AR = $(AR) $(ARFLAGS)
+ libfl_a_LIBADD =

Modified: trunk/buildroot/package/flex/flex.mk
===================================================================
--- trunk/buildroot/package/flex/flex.mk	2007-01-19 14:17:34 UTC (rev 17380)
+++ trunk/buildroot/package/flex/flex.mk	2007-01-19 14:54:58 UTC (rev 17381)
@@ -3,10 +3,12 @@
 # flex
 #
 #############################################################
-FLEX_SOURCE:=flex_2.5.4a.orig.tar.gz
-FLEX_PATCH:=flex_2.5.4a-24.diff.gz
+FLEX_VERSION:=2.5.33
+FLEX_PATCH_VERSION:=10
+FLEX_SOURCE:=flex_$(FLEX_VERSION).orig.tar.gz
+FLEX_PATCH:=flex_$(FLEX_VERSION)-$(FLEX_PATCH_VERSION).diff.gz
 FLEX_SITE:=http://ftp.debian.org/debian/pool/main/f/flex
-FLEX_DIR:=$(BUILD_DIR)/flex-2.5.4
+FLEX_DIR:=$(BUILD_DIR)/flex-$(FLEX_VERSION)
 FLEX_CAT:=$(ZCAT)
 FLEX_BINARY:=flex
 FLEX_TARGET_BINARY:=usr/bin/flex
@@ -21,11 +23,16 @@
 
 $(FLEX_DIR)/.unpacked: $(DL_DIR)/$(FLEX_SOURCE) $(DL_DIR)/$(FLEX_PATCH)
 	$(FLEX_CAT) $(DL_DIR)/$(FLEX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	#toolchain/patch-kernel.sh $(FLEX_DIR) $(DL_DIR) $(FLEX_PATCH)
-	touch $(FLEX_DIR)/.unpacked
+ifneq ($(FLEX_PATCH),)
+	toolchain/patch-kernel.sh $(FLEX_DIR) $(DL_DIR) $(FLEX_PATCH)
+	if [ -d $(FLEX_DIR)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(FLEX_DIR) $(FLEX_DIR)/debian/patches \*.patch ; \
+	fi
+endif
+	touch $@
 
 $(FLEX_DIR)/.configured: $(FLEX_DIR)/.unpacked
-	(cd $(FLEX_DIR); autoconf; rm -rf config.cache; \
+	(cd $(FLEX_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		CFLAGS="$(TARGET_CFLAGS)" \
 		./configure \
@@ -43,13 +50,14 @@
 		--localstatedir=/var \
 		--mandir=/usr/man \
 		--infodir=/usr/info \
+		--includedir=$(TARGET_DIR)/usr/include \
 		$(DISABLE_NLS) \
 		$(DISABLE_LARGEFILE) \
 	);
-	touch $(FLEX_DIR)/.configured
+	touch $@
 
 $(FLEX_DIR)/$(FLEX_BINARY): $(FLEX_DIR)/.configured
-	$(MAKE) -C $(FLEX_DIR)
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(FLEX_DIR)
 
 $(TARGET_DIR)/$(FLEX_TARGET_BINARY): $(FLEX_DIR)/$(FLEX_BINARY)
 	$(MAKE1) \
