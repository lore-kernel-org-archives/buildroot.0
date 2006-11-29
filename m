From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 04:59:56 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lsof
Message-ID: <20061129125956.DB9B74857F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 04:59:56 -0800 (Wed, 29 Nov 2006)
New Revision: 16718

Log:
- compile against the cross toolchain, not the host


Added:
   trunk/buildroot/package/lsof/lsof-makefile.patch
   trunk/buildroot/package/lsof/lsof-uclibc.patch

Modified:
   trunk/buildroot/package/lsof/lsof.mk


Changeset:
Added: trunk/buildroot/package/lsof/lsof-makefile.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-makefile.patch	2006-11-29 12:17:26 UTC (rev 16717)
+++ trunk/buildroot/package/lsof/lsof-makefile.patch	2006-11-29 12:59:56 UTC (rev 16718)
@@ -0,0 +1,14 @@
+diff -ru lsof_4.77.orig/lsof_4.77_src/lib/Makefile.skel lsof_4.77/lsof_4.77_src/lib/Makefile.skel
+--- lsof_4.77.orig/lsof_4.77_src/lib/Makefile.skel	2001-02-13 03:12:22.000000000 +0100
++++ lsof_4.77/lsof_4.77_src/lib/Makefile.skel	2006-11-29 13:51:44.000000000 +0100
+@@ -21,8 +21,8 @@
+ all:	${LIB}
+ 
+ ${LIB}:	${OBJ}
+-	${AR}
+-	${RANLIB}
++	${AR} cr ${LIB} ${OBJ}
++	${RANLIB} ${LIB}
+ 
+ clean:	FRC
+ 	rm -f ${LIB} ${OBJ} errs Makefile.bak a.out core

Added: trunk/buildroot/package/lsof/lsof-uclibc.patch
===================================================================
--- trunk/buildroot/package/lsof/lsof-uclibc.patch	2006-11-29 12:17:26 UTC (rev 16717)
+++ trunk/buildroot/package/lsof/lsof-uclibc.patch	2006-11-29 12:59:56 UTC (rev 16718)
@@ -0,0 +1,12 @@
+diff -ru lsof_4.77.orig/lsof_4.77_src/dialects/linux/dlsof.h lsof_4.77/lsof_4.77_src/dialects/linux/dlsof.h
+--- lsof_4.77.orig/lsof_4.77_src/dialects/linux/dlsof.h	2006-03-28 00:57:14.000000000 +0200
++++ lsof_4.77/lsof_4.77_src/dialects/linux/dlsof.h	2006-11-29 14:03:07.000000000 +0100
+@@ -49,7 +49,7 @@
+ #include <unistd.h>
+ #include <netinet/in.h>
+ 
+-# if	defined(GLIBCV)
++# if	defined(GLIBCV) || defined __UCLIBC__
+ #include <netinet/tcp.h>
+ # else	/* !defined(GLIBCV) */
+ #include <linux/tcp.h>

Modified: trunk/buildroot/package/lsof/lsof.mk
===================================================================
--- trunk/buildroot/package/lsof/lsof.mk	2006-11-29 12:17:26 UTC (rev 16717)
+++ trunk/buildroot/package/lsof/lsof.mk	2006-11-29 12:59:56 UTC (rev 16718)
@@ -10,6 +10,14 @@
 LSOF_BINARY:=lsof
 LSOF_TARGET_BINARY:=bin/lsof
 
+BR2_LSOF_CFLAGS:=
+ifeq ($(BR2_LARGEFILE),)
+BR2_LSOF_CFLAGS+=-U_FILE_OFFSET_BITS
+endif
+ifeq ($(UCLIBC_HAS_IPV6),)
+BR2_LSOF_CFLAGS+=-UHASIPv6
+endif
+
 $(DL_DIR)/$(LSOF_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(LSOF_SITE)/$(LSOF_SOURCE)
 
@@ -24,14 +32,15 @@
 	touch $(LSOF_DIR)/.unpacked
 
 $(LSOF_DIR)/.configured: $(LSOF_DIR)/.unpacked
-	(cd $(LSOF_DIR)/lsof_4.77_src; echo n | CC="$(CC)" CFLAGS="$(CFLAGS)" ./Configure linux)
+	(cd $(LSOF_DIR)/lsof_4.77_src; echo n | $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" ./Configure linux)
 	touch $(LSOF_DIR)/.configured
 
 $(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY): $(LSOF_DIR)/.configured
-	$(MAKE) CC=$(TARGET_CC) -C $(LSOF_DIR)/lsof_4.77_src
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) DEBUG="$(TARGET_CFLAGS) $(BR2_LSOF_CFLAGS)" -C $(LSOF_DIR)/lsof_4.77_src
 
 $(TARGET_DIR)/$(LSOF_TARGET_BINARY): $(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY)
-	cp -a $(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY) $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
+	cp $(LSOF_DIR)/lsof_4.77_src/$(LSOF_BINARY) $@
+	$(STRIP) $@
 
 lsof: uclibc $(TARGET_DIR)/$(LSOF_TARGET_BINARY)
 
