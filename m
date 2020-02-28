From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 28 Feb 2020 18:30:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/libtirpc: fix build with gcc 10
Message-ID: <20200228173052.5128-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 ...ltiple-definiton-with-gcc-fno-common.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/libtirpc/0005-Avoid-multiple-definiton-with-gcc-fno-common.patch

diff --git a/package/libtirpc/0005-Avoid-multiple-definiton-with-gcc-fno-common.patch b/package/libtirpc/0005-Avoid-multiple-definiton-with-gcc-fno-common.patch
new file mode 100644
index 0000000000..35846bb6e2
--- /dev/null
+++ b/package/libtirpc/0005-Avoid-multiple-definiton-with-gcc-fno-common.patch
@@ -0,0 +1,48 @@
+From daed7eedba73907730241c5262a5c16c7abedb6f Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Tue, 21 Jan 2020 11:49:35 -0500
+Subject: [PATCH 1/2] Avoid multiple-definiton with gcc -fno-common
+
+GCC 10 enables -fno-common by default.
+
+Fixes: https://bugs.gentoo.org/705896
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+[ upstream status: daed7eedba73907730241c5262a5c16c7abedb6f ]
+---
+ src/rpc_com.h | 3 +--
+ src/svc.c     | 3 +++
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/rpc_com.h b/src/rpc_com.h
+index 10bec79..76badef 100644
+--- a/src/rpc_com.h
++++ b/src/rpc_com.h
+@@ -61,8 +61,7 @@ void __xprt_unregister_unlocked(SVCXPRT *);
+ void __xprt_set_raddr(SVCXPRT *, const struct sockaddr_storage *);
+ 
+ 
+-SVCXPRT **__svc_xports;
+-int __svc_maxrec;
++extern int __svc_maxrec;
+ 
+ #ifdef __cplusplus
+ }
+diff --git a/src/svc.c b/src/svc.c
+index b59467b..6db164b 100644
+--- a/src/svc.c
++++ b/src/svc.c
+@@ -57,6 +57,9 @@
+ 
+ #define max(a, b) (a > b ? a : b)
+ 
++static SVCXPRT **__svc_xports;
++int __svc_maxrec;
++
+ /*
+  * The services list
+  * Each entry represents a set of procedures (an rpc program).
+-- 
+2.25.1
+
-- 
2.25.1
