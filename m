From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 13 Nov 2014 20:08:11 +0200
Subject: [Buildroot] [PATCH] dovecot: fix static build
Message-ID: <3b0aedc38538637a502da2d96c7a5455972ef134.1415902091.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a patch removing reference to MODULE_SUFFIX when it is undefined.

Fixes:
http://autobuild.buildroot.net/results/c68/c6844bbffff1cd4f738a5fced011d28f73c90b16/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/dovecot/0002-fix-static-build.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/dovecot/0002-fix-static-build.patch

diff --git a/package/dovecot/0002-fix-static-build.patch b/package/dovecot/0002-fix-static-build.patch
new file mode 100644
index 000000000000..be646bc6a46e
--- /dev/null
+++ b/package/dovecot/0002-fix-static-build.patch
@@ -0,0 +1,24 @@
+Fix static build
+
+MODULE_SUFFIX is undefined when building statically; don't used it.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: sent upstream
+(http://dovecot.org/pipermail/dovecot/2014-November/098694.html)
+
+diff -Nuar dovecot-2.2.15-orig/src/lib/module-dir.c dovecot-2.2.15/src/lib/module-dir.c
+--- dovecot-2.2.15-orig/src/lib/module-dir.c	2014-10-18 00:10:15.000000000 +0300
++++ dovecot-2.2.15/src/lib/module-dir.c	2014-11-13 19:27:29.417786313 +0200
+@@ -621,7 +621,11 @@
+ 	if (*p == '_')
+ 		fname = p + 1;
+ 
++#ifdef MODULE_SUFFIX
+ 	p = strstr(fname, MODULE_SUFFIX);
++#else
++	p = NULL;
++#endif
+ 	if (p == NULL)
+ 		return fname;
+ 
-- 
2.1.1
