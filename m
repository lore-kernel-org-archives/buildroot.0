From: Arnar Mar Sig <antab@valka.is>
Date: Tue, 1 Apr 2008 23:54:43 +0000
Subject: [Buildroot] [PATCH] Add PCRE package
Message-ID: <595E5642-5206-4581-8BFD-FA507D1AFE67@valka.is>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds PCRE package. PCRE is needed to compile lighttpd with  
mod_rewrite. Tested on AVR32


diff -purN buildroot-upstream/package/Config.in buildroot-mine/package/ 
Config.in
--- buildroot-upstream/package/Config.in        2008-03-31  
05:39:21.000000000 +0000
+++ buildroot-mine/package/Config.in    2008-04-01 23:35:37.000000000  
+0000
@@ -52,6 +52,7 @@ source "package/mpfr/Config.in"
source "package/libtool/Config.in"
source "package/m4/Config.in"
source "package/mpatrol/Config.in"
+source "package/pcre/Config.in"
source "package/pkgconfig/Config.in"
source "package/readline/Config.in"
source "package/valgrind/Config.in"
diff -purN buildroot-upstream/package/pcre/Config.in buildroot-mine/ 
package/pcre/Config.in
--- buildroot-upstream/package/pcre/Config.in   1970-01-01  
00:00:00.000000000 +0000
+++ buildroot-mine/package/pcre/Config.in       2008-04-01  
23:34:50.000000000 +0000
@@ -0,0 +1,5 @@
+config BR2_PACKAGE_PCRE
+       bool "pcre"
+       default n
+       help
+         Perl Compatible Regular Expressions
diff -purN buildroot-upstream/package/pcre/pcre.mk buildroot-mine/ 
package/pcre/pcre.mk
--- buildroot-upstream/package/pcre/pcre.mk     1970-01-01  
00:00:00.000000000 +0000
+++ buildroot-mine/package/pcre/pcre.mk 2008-04-01 23:34:50.000000000  
+0000
@@ -0,0 +1,18 @@
+#############################################################
+#
+# PCRE
+#
+#############################################################
+PCRE_VERSION = 7.6
+PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
+PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
+PCRE_INSTALL_STAGING = YES
+PCRE_INSTALL_TARGET = YES
+
+PCRE_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+        --build=$(GNU_HOST_NAME) --prefix=/usr \
+        --includedir=/usr/include
+
+PCRE_DEPENDENCIES = uclibc
+
+$(eval $(call AUTOTARGETS,package,pcre))
