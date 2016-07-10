From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Jul 2016 15:17:36 +0200
Subject: [Buildroot] [git commit] dante: fix sparc compile issue
Message-ID: <20160710131745.B9F2081780@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e160b4a510b65478e315a9c05472801570c5c8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/536d95a46ef9527c6ed38b397f7e1b33f4b7b5fe/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dante/0001-fix-sparc-compile.patch | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/package/dante/0001-fix-sparc-compile.patch b/package/dante/0001-fix-sparc-compile.patch
new file mode 100644
index 0000000..a23e2e2
--- /dev/null
+++ b/package/dante/0001-fix-sparc-compile.patch
@@ -0,0 +1,24 @@
+Signal handling for sparc is broken, fix it.
+
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+
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
