From: tpetazzoni at uclibc.org <tpetazzoni@uclibc.org>
Date: Tue, 11 Nov 2008 11:38:11 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fontconfig
Message-ID: <20081111193811.0A5833C9C7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: tpetazzoni
Date: 2008-11-11 11:38:10 -0800 (Tue, 11 Nov 2008)
New Revision: 24003

Log:
Add a parallel compilation fix for fontconfig

This patch adds a patch to fix bug
https://bugs.freedesktop.org/show_bug.cgi?id=16464 affecting parallel
compilation of fontconfig.

The patch is the one proposed in the bugzilla entry, available at
https://bugs.freedesktop.org/attachment.cgi?id=17294.

Without this patch, the compilation (at BR2_JLEVEL > 1) of fontconfig
sometimes fails with:

In file included from fc-case.c:25:
../src/fcint.h:118:21: error: fcalias.h: No such file or directory

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>



Added:
   trunk/buildroot/package/fontconfig/fontconfig-2.6.0-parallel-compilation-fix.patch

Modified:
   trunk/buildroot/package/fontconfig/fontconfig.mk


Changeset:
Added: trunk/buildroot/package/fontconfig/fontconfig-2.6.0-parallel-compilation-fix.patch
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig-2.6.0-parallel-compilation-fix.patch	                        (rev 0)
+++ trunk/buildroot/package/fontconfig/fontconfig-2.6.0-parallel-compilation-fix.patch	2008-11-11 19:38:10 UTC (rev 24003)
@@ -0,0 +1,26 @@
+---
+ fc-case/Makefile.am |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+Index: fontconfig-2.6.0/fc-case/Makefile.am
+===================================================================
+--- fontconfig-2.6.0.orig/fc-case/Makefile.am
++++ fontconfig-2.6.0/fc-case/Makefile.am
+@@ -36,6 +36,8 @@
+ 
+ noinst_MANS=fc-case.man
+ 
++noinst_HEADERS=$(TARG)
++
+ fc_case_SRCS= \
+ 	fc-case.c \
+ 	fccaseint.h \
+@@ -52,7 +54,7 @@
+ 
+ ALIAS_FILES = fcalias.h fcaliastail.h
+ 
+-BUILT_SOURCES = $(ALIAS_FILES) $(TARG)
++BUILT_SOURCES = $(ALIAS_FILES)
+ 
+ $(ALIAS_FILES): 
+ 	touch $(ALIAS_FILES)

Modified: trunk/buildroot/package/fontconfig/fontconfig.mk
===================================================================
--- trunk/buildroot/package/fontconfig/fontconfig.mk	2008-11-11 19:00:32 UTC (rev 24002)
+++ trunk/buildroot/package/fontconfig/fontconfig.mk	2008-11-11 19:38:10 UTC (rev 24003)
@@ -6,7 +6,7 @@
 FONTCONFIG_VERSION = 2.6.0
 FONTCONFIG_SOURCE = fontconfig-$(FONTCONFIG_VERSION).tar.gz
 FONTCONFIG_SITE = http://fontconfig.org/release
-FONTCONFIG_AUTORECONF = NO
+FONTCONFIG_AUTORECONF = YES
 FONTCONFIG_INSTALL_STAGING = YES
 FONTCONFIG_INSTALL_TARGET = YES
 
