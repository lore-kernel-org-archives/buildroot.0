From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 15 May 2007 04:23:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lsof
Message-ID: <20070515112347.61BCF48022@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-05-15 04:23:46 -0700 (Tue, 15 May 2007)
New Revision: 18621

Log:
- bump version


Added:
   trunk/buildroot/package/lsof/lsof-remove-susvlegacy-funcs.patch

Modified:
   trunk/buildroot/package/lsof/lsof-makefile.patch
   trunk/buildroot/package/lsof/lsof-noportmap.patch
   trunk/buildroot/package/lsof/lsof-uclibc.patch
   trunk/buildroot/package/lsof/lsof.mk


Changeset:
Modified: trunk/buildroot/package/lsof/lsof-makefile.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-makefile.patch	2007-05-15 09:45:21 UTC (rev 18620)
+++ trunk/buildroot/package/lsof/lsof-makefile.patch	2007-05-15 11:23:46 UTC (rev 18621)
@@ -1,6 +1,6 @@
 diff -ru lsof_4.77.orig/lsof_4.77_src/lib/Makefile.skel lsof_4.77/lsof_4.77_src/lib/Makefile.skel
 --- lsof_4.77.orig/lsof_4.77_src/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
-+++ lsof_4.77/lsof_4.77_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
++++ lsof_4.77/lsof_4.78_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
 @@ -21,8 +21,8 @@
  all:	${LIB}
  

Modified: trunk/buildroot/package/lsof/lsof-noportmap.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-noportmap.patch	2007-05-15 09:45:21 UTC (rev 18620)
+++ trunk/buildroot/package/lsof/lsof-noportmap.patch	2007-05-15 11:23:46 UTC (rev 18621)
@@ -1,5 +1,5 @@
 --- lsof_4.77/lsof_4.77_src/print.orig.c	2006-08-23 13:37:43.000000000 -0600
-+++ lsof_4.77/lsof_4.77_src/print.c	2006-08-23 13:38:29.000000000 -0600
++++ lsof_4.77/lsof_4.78_src/print.c	2006-08-23 13:38:29.000000000 -0600
 @@ -148,6 +148,7 @@
  static void
  fill_portmap()

Added: trunk/buildroot/package/lsof/lsof-remove-susvlegacy-funcs.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-remove-susvlegacy-funcs.patch	                        (rev 0)
+++ trunk/buildroot/package/lsof/lsof-remove-susvlegacy-funcs.patch	2007-05-15 11:23:46 UTC (rev 18621)
@@ -0,0 +1,12 @@
+diff -rdup lsof_4.78.orig/lsof_4.78_src/dialects/linux/machine.h lsof_4.78/lsof_4.78_src/dialects/linux/machine.h
+--- lsof_4.78.orig/lsof_4.78_src/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
++++ lsof_4.78/lsof_4.78_src/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
+@@ -616,6 +616,6 @@
+  * zeromem is a macro that uses bzero or memset.
+  */
+ 
+-#define	zeromem(a, l)	bzero(a, l)
++#define	zeromem(a, l)	memset(a, 0, l)
+ 
+ #endif	/* !defined(LSOF_MACHINE_H) */
+

Modified: trunk/buildroot/package/lsof/lsof-uclibc.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-uclibc.patch	2007-05-15 09:45:21 UTC (rev 18620)
+++ trunk/buildroot/package/lsof/lsof-uclibc.patch	2007-05-15 11:23:46 UTC (rev 18621)
@@ -1,6 +1,6 @@
 diff -ru lsof_4.77.orig/lsof_4.77_src/dialects/linux/dlsof.h lsof_4.77/lsof_4.77_src/dialects/linux/dlsof.h
 --- lsof_4.77.orig/lsof_4.77_src/dialects/linux/dlsof.h	2006-03-28 00:57:14.000000000 +0200
-+++ lsof_4.77/lsof_4.77_src/dialects/linux/dlsof.h	2006-11-29 14:03:07.000000000 +0100
++++ lsof_4.77/lsof_4.78_src/dialects/linux/dlsof.h	2006-11-29 14:03:07.000000000 +0100
 @@ -49,7 +49,7 @@
  #include <unistd.h>
  #include <netinet/in.h>

Modified: trunk/buildroot/package/lsof/lsof.mk
===================================================================
--- trunk/buildroot/package/lsof/lsof.mk	2007-05-15 09:45:21 UTC (rev 18620)
+++ trunk/buildroot/package/lsof/lsof.mk	2007-05-15 11:23:46 UTC (rev 18621)
@@ -3,10 +3,11 @@
 # lsof
 #
 #############################################################
-LSOF_SOURCE:=lsof_4.77.tar.bz2
+LSOF_VERSION:=4.78
+LSOF_SOURCE:=lsof_$(LSOF_VERSION).tar.bz2
 LSOF_SITE:=ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/
 LSOF_CAT:=$(BZCAT)
-LSOF_DIR:=$(BUILD_DIR)/lsof_4.77
+LSOF_DIR:=$(BUILD_DIR)/lsof_$(LSOF_VERSION)
 LSOF_BINARY:=lsof
 LSOF_TARGET_BINARY:=bin/lsof
 
@@ -27,33 +28,33 @@
 
 $(LSOF_DIR)/.unpacked: $(DL_DIR)/$(LSOF_SOURCE)
 	$(LSOF_CAT) $(DL_DIR)/$(LSOF_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	(cd $(LSOF_DIR);tar xf lsof_4.77_src.tar;rm -f lsof_4.77_src.tar)
+	(cd $(LSOF_DIR);tar xf lsof_$(LSOF_VERSION)_src.tar;rm -f lsof_$(LSOF_VERSION)_src.tar)
 	toolchain/patch-kernel.sh $(LSOF_DIR) package/lsof/ \*.patch
 	touch $(LSOF_DIR)/.unpacked
 
 $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
-	(cd $(LSOF_DIR)/lsof_4.77_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" ./Configure linux)
+	(cd $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" ./Configure linux)
 	touch $(LSOF_DIR)/.configured
 
-$(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
+$(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
 ifeq ($(UCLIBC_HAS_WCHAR),)
-	$(SED) 's,^#define[ 	]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(LSOF_DIR)/lsof_4.77_src/machine.h
-	$(SED) 's,^#define[ 	]*WIDECHARINCL.*,,' $(LSOF_DIR)/lsof_4.77_src/machine.h
+	$(SED) 's,^#define[ 	]*HASWIDECHAR.*,#undef HASWIDECHAR,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
+	$(SED) 's,^#define[ 	]*WIDECHARINCL.*,,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
 endif
 ifeq ($(UCLIBC_HAS_LOCALE),)
-	$(SED) 's,^#define[ 	]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(LSOF_DIR)/lsof_4.77_src/machine.h
+	$(SED) 's,^#define[ 	]*HASSETLOCALE.*,#undef HASSETLOCALE,' $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/machine.h
 endif
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_DIR)/lsof_4.77_src
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src
 
-$(TARGET_DIR)/$(LSOF_TARGET_BINARY): $(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY)
-	cp $(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY) $@
+$(TARGET_DIR)/$(LSOF_TARGET_BINARY): $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY)
+	cp $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src/$(LSOF_BINARY) $@
 	$(STRIP) $@
 
 lsof: uclibc $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
 
 lsof-clean:
 	-rm -f $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
-	-$(MAKE) -C $(LSOF_DIR)/lsof_4.77_src clean
+	-$(MAKE) -C $(LSOF_DIR)/lsof_$(LSOF_VERSION)_src clean
 
 lsof-dirclean:
 	rm -rf $(LSOF_DIR)
