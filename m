From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 10 Jul 2016 11:32:13 +0200
Subject: [Buildroot] [PATCH] dante: fix sparc compile issue
Message-ID: <20160710093213.GA32465@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/536d95a46ef9527c6ed38b397f7e1b33f4b7b5fe/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/dante/0001-fix-sparc-compile.patch | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 package/dante/0001-fix-sparc-compile.patch

diff --git a/package/dante/0001-fix-sparc-compile.patch b/package/dante/0001-fix-sparc-compile.patch
new file mode 100644
index 0000000..c4453bb
--- /dev/null
+++ b/package/dante/0001-fix-sparc-compile.patch
@@ -0,0 +1,23 @@
+Signal handling for sparc is broken, fix it.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+--- dante-1.4.1.orig/lib/tostring.c	2014-08-21 18:21:50.000000000 +0200
++++ dante-1.4.1/lib/tostring.c	2016-07-10 10:08:39.785662622 +0200
+@@ -1526,7 +1526,7 @@ signal2string(sig)
+          return "SIGKILL";
+ #endif /* SIGKILL */
+ 
+-#if (defined SIGLOST) && (!defined SIGABRT || SIGLOST != SIGABRT)
++#if (defined SIGLOST) && (!defined SIGABRT || SIGLOST != SIGABRT || SIGLOST != SIGPWR)
+       case SIGLOST:
+          return "SIGLOST";
+ #endif /* SIGLOST */
+@@ -1551,7 +1551,7 @@ signal2string(sig)
+          return "SIGPROF";
+ #endif /* SIGPROF */
+ 
+-#ifdef SIGPWR
++#if (defined SIGPWR) && SIGPWR != SIGLOST
+       case SIGPWR:
+          return "SIGPWR";
+ #endif /* SIGPWR */
-- 
2.1.4
