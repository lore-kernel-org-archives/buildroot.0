From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 20 Jun 2007 05:10:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/gettext
Message-ID: <20070620121049.9FA4748606@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-20 05:10:48 -0700 (Wed, 20 Jun 2007)
New Revision: 18866

Log:
- bump version


Modified:
   trunk/buildroot/package/gettext/gettext-error_print_progname.patch
   trunk/buildroot/package/gettext/gettext.mk


Changeset:
Modified: trunk/buildroot/package/gettext/gettext-error_print_progname.patch
===================================================================
--- trunk/buildroot/package/gettext/gettext-error_print_progname.patch	2007-06-20 12:00:54 UTC (rev 18865)
+++ trunk/buildroot/package/gettext/gettext-error_print_progname.patch	2007-06-20 12:10:48 UTC (rev 18866)
@@ -1,11 +1,13 @@
-diff -ur gettext-0.14.6/gettext-tools/lib/error.h gettext-0.14.6-patched/gettext-tools/lib/error.h
---- gettext-0.14.6/gettext-tools/lib/error.h	2005-05-20 16:03:42.000000000 -0500
-+++ gettext-0.14.6-patched/gettext-tools/lib/error.h	2007-01-13 20:57:24.422168053 -0600
-@@ -50,7 +50,7 @@
+--- gettext-0.16.1.oorig/gettext-tools/gnulib-lib/error.h	2006-11-27 18:14:50.000000000 +0100
++++ gettext-0.16.1/gettext-tools/gnulib-lib/error.h	2007-06-20 13:29:32.000000000 +0200
+@@ -50,7 +50,10 @@ extern void error_at_line (int __status,
  /* If NULL, error will flush stdout, then print on stderr the program
     name, a colon and a space.  Otherwise, error will call this
     function without parameters instead.  */
 -extern DLL_VARIABLE void (*error_print_progname) (void);
++#ifndef __UCLIBC__
++extern DLL_VARIABLE
++#endif
 +void (*error_print_progname) (void);
  
  /* This variable is incremented each time `error' is called.  */

Modified: trunk/buildroot/package/gettext/gettext.mk
===================================================================
--- trunk/buildroot/package/gettext/gettext.mk	2007-06-20 12:00:54 UTC (rev 18865)
+++ trunk/buildroot/package/gettext/gettext.mk	2007-06-20 12:10:48 UTC (rev 18866)
@@ -3,7 +3,7 @@
 # gettext
 #
 #############################################################
-GETTEXT_VER:=0.14.6
+GETTEXT_VER:=0.16.1
 GETTEXT_SOURCE:=gettext-$(GETTEXT_VER).tar.gz
 GETTEXT_SITE:=http://ftp.gnu.org/pub/gnu/gettext
 GETTEXT_DIR:=$(BUILD_DIR)/gettext-$(GETTEXT_VER)
@@ -19,7 +19,7 @@
 $(GETTEXT_DIR)/.unpacked: $(DL_DIR)/$(GETTEXT_SOURCE)
 	$(GETTEXT_CAT) $(DL_DIR)/$(GETTEXT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 	toolchain/patch-kernel.sh $(GETTEXT_DIR) package/gettext/ gettext\*.patch
-	touch $(GETTEXT_DIR)/.unpacked
+	touch $@
 
 ifeq ($(strip $(BR2_TOOLCHAIN_EXTERNAL)),y)
 IGNORE_EXTERNAL_GETTEXT:=--with-included-gettext
@@ -101,8 +101,9 @@
 		--infodir=/usr/info \
 		--disable-libasprintf \
 		$(IGNORE_EXTERNAL_GETTEXT) \
+		$(OPENMP) \
 	);
-	touch $(GETTEXT_DIR)/.configured
+	touch $@
 
 $(GETTEXT_DIR)/$(GETTEXT_BINARY): $(GETTEXT_DIR)/.configured
 	$(MAKE) CC=$(TARGET_CC) -C $(GETTEXT_DIR)
@@ -120,7 +121,7 @@
 	rm -f $(STAGING_DIR)/bin/autopoint $(STAGING_DIR)/bin/envsubst
 	rm -f $(STAGING_DIR)/bin/gettext.sh $(STAGING_DIR)/bin/gettextize
 	rm -f $(STAGING_DIR)/bin/msg* $(STAGING_DIR)/bin/?gettext
-	touch -c $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
+	touch -c $@
 
 gettext: uclibc pkgconfig $(STAGING_DIR)/$(GETTEXT_TARGET_BINARY)
 
