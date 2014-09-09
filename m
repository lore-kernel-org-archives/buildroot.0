From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Sep 2014 23:41:29 +0200
Subject: [Buildroot] [PATCH] czmq: add patch to fix build issue with recent
	glibc
Message-ID: <1410298889-16889-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

glibc 2.20 is now warning when _BSD_SOURCE is used (as it's replaced
by _DEFAULT_SOURCE), and czmq has the bad idea of forcing the usage of
-Werror, causing build issues with the recent NIOS II toolchain based
on glibc 2.20.

This commit adds a patch to czmq to fix that. The patch has been
submitted upstream.

Fixes:

  http://autobuild.buildroot.org/results/64a/64a7eef2155248146e7f3a55e85fe60bc5b67791/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...se-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/czmq/czmq-0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch

diff --git a/package/czmq/czmq-0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch b/package/czmq/czmq-0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch
new file mode 100644
index 0000000..cef187a
--- /dev/null
+++ b/package/czmq/czmq-0001-Use-_DEFAULT_SOURCE-instead-of-_BSD_SOURCE.patch
@@ -0,0 +1,53 @@
+From 04be584035b4d9b6a61fd748b6d21c92c6bb9694 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 9 Sep 2014 23:36:10 +0200
+Subject: [PATCH] Use _DEFAULT_SOURCE instead of _BSD_SOURCE
+
+Since glibc 2.20, using _BSD_SOURCE triggers a warning, and since czmq
+uses -Werror, it aborts the build:
+
+  CC       zchunk.lo
+In file included from /home/thomas/projets/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/ctype.h:25:0,
+                 from ../include/czmq_prelude.h:203,
+                 from ../include/czmq.h:19,
+                 from zauth.c:25:
+/home/thomas/projets/buildroot/output/host/usr/nios2-buildroot-linux-gnu/sysroot/usr/include/features.h:148:3: error: #warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE" [-Werror=cpp]
+ # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
+   ^
+
+See the glibc 2.20 release notes, https://lwn.net/Articles/611162/,
+explaining the change about _BSD_SOURCE:
+
+* The _BSD_SOURCE and _SVID_SOURCE feature test macros are no longer
+  supported; they now act the same as _DEFAULT_SOURCE (but generate a
+  warning).  Except for cases where _BSD_SOURCE enabled BSD interfaces that
+  conflicted with POSIX (support for which was removed in 2.19), the
+  interfaces those macros enabled remain available when compiling with
+  _GNU_SOURCE defined, with _DEFAULT_SOURCE defined, or without any feature
+  test macros defined.
+
+Submitted upstream: https://github.com/zeromq/czmq/pull/648
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ include/czmq_prelude.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/include/czmq_prelude.h b/include/czmq_prelude.h
+index 8b4b53d..f77add2 100644
+--- a/include/czmq_prelude.h
++++ b/include/czmq_prelude.h
+@@ -152,8 +152,8 @@
+ #   ifndef __NO_CTYPE
+ #   define __NO_CTYPE                   //  Suppress warnings on tolower()
+ #   endif
+-#   ifndef _BSD_SOURCE
+-#   define _BSD_SOURCE                  //  Include stuff from 4.3 BSD Unix
++#   ifndef _DEFAULT_SOURCE
++#   define _DEFAULT_SOURCE                  //  Include stuff from 4.3 BSD Unix
+ #   endif
+ #elif (defined (Mips))
+ #   define __UTYPE_MIPS
+-- 
+2.0.0
+
-- 
2.0.0
