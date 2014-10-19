From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 21:49:25 +0200
Subject: [Buildroot] [PATCH 2/2] package/liblog4c-localtime: Fix build with
	BR2_ENABLE_DEBUG=yes
In-Reply-To: <1413748165-2732-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413748165-2732-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413748165-2732-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
init.c:39:20: fatal error: mcheck.h: No such file or directory

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../liblog4c-localtime/liblog4c-0003-debug.patch   |   37 ++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/liblog4c-localtime/liblog4c-0003-debug.patch

diff --git a/package/liblog4c-localtime/liblog4c-0003-debug.patch b/package/liblog4c-localtime/liblog4c-0003-debug.patch
new file mode 100644
index 0000000..80b00cf
--- /dev/null
+++ b/package/liblog4c-localtime/liblog4c-0003-debug.patch
@@ -0,0 +1,37 @@
+Fix build with BR2_ENABLE_DEBUG=yes
+
+Fixes
+init.c:39:20: fatal error: mcheck.h: No such file or directory
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr log4c-localtime-1.0.org/src/log4c/init.c log4c-localtime-1.0/src/log4c/init.c
+--- log4c-localtime-1.0.org/src/log4c/init.c	2011-09-06 15:37:02.000000000 +0200
++++ log4c-localtime-1.0/src/log4c/init.c	2014-10-19 21:39:29.000000000 +0200
+@@ -35,7 +35,7 @@
+ #include <layout_type_basic_r.h>
+ #include <layout_type_dated_r.h>
+ 
+-#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__)
++#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__) && !defined(__UCLIBC__)
+ #include <mcheck.h>
+ #endif
+ 
+@@ -100,7 +100,7 @@
+     sd_debug("log4c_init[");
+   
+     /* activate GLIBC allocation debugging */
+-#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__)
++#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__) && !defined(__UCLIBC__)
+     mtrace();
+ #endif
+   
+@@ -278,7 +280,7 @@
+ 	log4c_dump_all_instances(stderr);
+     }
+ #endif
+-#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__)
++#if defined(__LOG4C_DEBUG__) && defined(__GLIBC__) && !defined(__UCLIBC__)
+     muntrace();
+ #endif
+   
-- 
1.7.10.4
