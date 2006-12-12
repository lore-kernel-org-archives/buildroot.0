From: andersen at uclibc.org <andersen@uclibc.org>
Date: Tue, 12 Dec 2006 14:16:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  dmalloc
Message-ID: <20061212221641.99E66485AC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-12 14:16:41 -0800 (Tue, 12 Dec 2006)
New Revision: 16859

Log:
add dmalloc


Added:
   trunk/buildroot/package/dmalloc/
   trunk/buildroot/package/dmalloc/Config.in
   trunk/buildroot/package/dmalloc/dmalloc-mips.patch
   trunk/buildroot/package/dmalloc/dmalloc.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2006-12-12 22:13:41 UTC (rev 16858)
+++ trunk/buildroot/package/Config.in	2006-12-12 22:16:41 UTC (rev 16859)
@@ -41,6 +41,7 @@
 source "package/directfb/Config.in"
 source "package/distcc/Config.in"
 source "package/dm/Config.in"
+source "package/dmalloc/Config.in"
 source "package/dmraid/Config.in"
 source "package/dnsmasq/Config.in"
 source "package/dropbear/Config.in"

Added: trunk/buildroot/package/dmalloc/Config.in
===================================================================
--- trunk/buildroot/package/dmalloc/Config.in	2006-12-12 22:13:41 UTC (rev 16858)
+++ trunk/buildroot/package/dmalloc/Config.in	2006-12-12 22:16:41 UTC (rev 16859)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DMALLOC
+	bool "dmalloc"
+	default n
+	help
+	  A debug memory allocation library which is a drop in replacement for
+	  the system's malloc, realloc, calloc, free and other memory management
+	  routines while providing powerful debugging facilities configurable at
+	  runtime.
+
+	  http://dmalloc.com/

Added: trunk/buildroot/package/dmalloc/dmalloc-mips.patch
===================================================================
--- trunk/buildroot/package/dmalloc/dmalloc-mips.patch	2006-12-12 22:13:41 UTC (rev 16858)
+++ trunk/buildroot/package/dmalloc/dmalloc-mips.patch	2006-12-12 22:16:41 UTC (rev 16859)
@@ -0,0 +1,43 @@
+--- dmalloc/configure	2006-09-01 18:28:51.000000000 -0700
++++ dmalloc-mips/configure	2006-09-01 18:49:07.000000000 -0700
+@@ -6114,7 +6114,7 @@
+ echo $ECHO_N "checking return.h macros work... $ECHO_C" >&6
+ if test "$cross_compiling" = yes; then
+    cat >>confdefs.h <<\_ACEOF
+-#define RETURN_MACROS_WORK 0
++#define RETURN_MACROS_WORK 1
+ _ACEOF
+  echo "$as_me:$LINENO: result: no" >&5
+ echo "${ECHO_T}no" >&6
+--- dmalloc/return.h	2004-10-19 07:51:21.000000000 -0700
++++ dmalloc-mips/return.h	2006-09-08 21:52:43.000000000 -0700
+@@ -106,26 +106,16 @@
+ /*************************************/
+ 
+ /*
+- * For DEC Mips machines running Ultrix
++ * For Mips machines running Linux
+  */
+ #if __mips
+ 
+ /*
+- * I have no idea how to get inline assembly with the default cc.
+- * Anyone know how?
+- */
+-
+-#if 0
+-
+-/*
+  * NOTE: we assume here that file is global.
+  *
+- * $31 is the frame pointer.  $2 looks to be the return address but maybe
+- * not consistently.
++ * $31 is the return address.
+  */
+-#define GET_RET_ADDR(file)	asm("sw $2, file")
+-
+-#endif
++#define GET_RET_ADDR(file)	asm("sw $31, %0" : "=m" (file))
+ 
+ #endif /* __mips */
+ 

Added: trunk/buildroot/package/dmalloc/dmalloc.mk
===================================================================
--- trunk/buildroot/package/dmalloc/dmalloc.mk	2006-12-12 22:13:41 UTC (rev 16858)
+++ trunk/buildroot/package/dmalloc/dmalloc.mk	2006-12-12 22:16:41 UTC (rev 16859)
@@ -0,0 +1,76 @@
+#############################################################
+#
+# dmalloc
+#
+#############################################################
+DMALLOC_VER:=5.4.2
+DMALLOC_SOURCE:=dmalloc-$(DMALLOC_VER).tgz
+DMALLOC_SITE:=http://dmalloc.com/releases
+DMALLOC_DIR:=$(BUILD_DIR)/dmalloc-$(DMALLOC_VER)
+DMALLOC_CAT:=zcat
+DMALLOC_BINARY:=dmalloc
+DMALLOC_TARGET_BINARY:=usr/bin/dmalloc
+
+$(DL_DIR)/$(DMALLOC_SOURCE):
+	 $(WGET) -P $(DL_DIR) $(DMALLOC_SITE)/$(DMALLOC_SOURCE)
+
+dmalloc-source: $(DL_DIR)/$(DMALLOC_SOURCE)
+
+$(DMALLOC_DIR)/.unpacked: $(DL_DIR)/$(DMALLOC_SOURCE)
+	$(DMALLOC_CAT) $(DL_DIR)/$(DMALLOC_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(DMALLOC_DIR) package/dmalloc dmalloc\*.patch
+	$(SED) 's/^ac_cv_page_size=0$$/ac_cv_page_size=12/' $(DMALLOC_DIR)/configure
+	$(SED) 's/(ld -/($${LD-ld} -/' $(DMALLOC_DIR)/configure
+	$(SED) 's/'\''ld -/"$${LD-ld}"'\'' -/' $(DMALLOC_DIR)/configure
+	touch $(DMALLOC_DIR)/.unpacked
+
+$(DMALLOC_DIR)/.configured: $(DMALLOC_DIR)/.unpacked
+	(cd $(DMALLOC_DIR); rm -rf config.cache; \
+		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="-g $(TARGET_CFLAGS)" \
+		LDFLAGS="-g" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--enable-threads \
+		--enable-shlib \
+	);
+	touch $(DMALLOC_DIR)/.configured
+
+$(DMALLOC_DIR)/$(DMALLOC_BINARY): $(DMALLOC_DIR)/.configured
+	$(MAKE) -C $(DMALLOC_DIR)
+
+$(TARGET_DIR)/$(DMALLOC_TARGET_BINARY): $(DMALLOC_DIR)/$(DMALLOC_BINARY)
+	$(MAKE)	prefix=$(STAGING_DIR)/usr \
+		exec_prefix=$(TARGET_DIR)/usr \
+		libdir=$(STAGING_DIR)/usr/lib \
+		shlibdir=$(TARGET_DIR)/usr/lib \
+		includedir=$(STAGING_DIR)/include \
+		-C $(DMALLOC_DIR) install
+	(cd $(STAGING_DIR)/usr/lib; \
+		mv libdmalloc*.so $(TARGET_DIR)/usr/lib);
+	touch $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
+
+dmalloc: uclibc $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
+
+dmalloc-clean: 
+	rm -f $(TARGET_DIR)/usr/lib/libdmalloc*
+	rm -f $(STAGING_DIR)/usr/lib/libdmalloc*
+	rm -f $(STAGING_DIR)/include/dmalloc.h
+	rm -f $(TARGET_DIR)/$(DMALLOC_TARGET_BINARY)
+	$(MAKE) -C $(DMALLOC_DIR) clean
+
+dmalloc-dirclean: 
+	rm -rf $(DMALLOC_DIR)
+
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_DMALLOC)),y)
+TARGETS+=dmalloc
+endif
