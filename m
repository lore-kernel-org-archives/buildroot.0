From: Steve Kenton <skenton@ou.edu>
Date: Sat, 13 Dec 2014 18:07:51 -0600
Subject: [Buildroot] [PATCH] freetype: add some dependencies
Message-ID: <548CD4D7.1090808@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

freetype needs fenv.h which is not available on uClibc except for x86, add dependencies

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
Modeled on the python-numpy solution to the same fenv.h problem
diff -ru buildroot/package/freetype/Config.in buildroot.modified/package/freetype/Config.in
--- buildroot/package/freetype/Config.in	2014-12-13 17:45:34.547751176 -0600
+++ buildroot.modified/package/freetype/Config.in	2014-12-13 17:43:32.723748839 -0600
@@ -1,5 +1,8 @@
 config BR2_PACKAGE_FREETYPE
 	bool "freetype"
+	# freetype needs fenv.h. Available for all architectures in
+	# glibc, but only for x86 and x86-64 in uClibc.
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_i386 || BR2_x86_64
 	help
 	  a free, high-quality and portable font engine.
