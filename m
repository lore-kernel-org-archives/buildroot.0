From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Nov 2014 14:56:37 +0100
Subject: [Buildroot] [git commit] dovecot: fix static build
Message-ID: <20141114135716.7F648B1488@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8d4942cc41c7ca6899596e91bb3426b82defc083
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch removing reference to MODULE_SUFFIX when it is undefined.

Fixes:
http://autobuild.buildroot.net/results/c68/c6844bbffff1cd4f738a5fced011d28f73c90b16/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dovecot/0002-fix-static-build.patch |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/dovecot/0002-fix-static-build.patch b/package/dovecot/0002-fix-static-build.patch
new file mode 100644
index 0000000..be646bc
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
