From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:43:31 +0200
Subject: [Buildroot] [git commit] ipmiutil: fix musl build issues
Message-ID: <20150929174343.21A688077E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9c2858df147c7827aa2fb405bdc05183ccf9eb1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patches fixing a number of build failures under musl.

The first patch fixes the following autobuild failures:
http://autobuild.buildroot.net/results/bc8/bc8f97f0739e5b842057fdf60eb9309c3e30fac1/
http://autobuild.buildroot.net/results/937/937163f988bb3680630544f6c0ed45b18bc83511/
http://autobuild.buildroot.net/results/862/862af4c6be4b78e65528195305653eedac4163c6/

and others.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../ipmiutil/0004-avoid-wchar-t-redefinition.patch |   19 ++++++++++++++
 .../0005-add-missing-param.h-header-include.patch  |   24 ++++++++++++++++++
 .../0006-add-missing-sys-select.h-include.patch    |   26 ++++++++++++++++++++
 3 files changed, 69 insertions(+), 0 deletions(-)

diff --git a/package/ipmiutil/0004-avoid-wchar-t-redefinition.patch b/package/ipmiutil/0004-avoid-wchar-t-redefinition.patch
new file mode 100644
index 0000000..63a5927
--- /dev/null
+++ b/package/ipmiutil/0004-avoid-wchar-t-redefinition.patch
@@ -0,0 +1,19 @@
+Avoid wchar_t redefinition
+
+The musl C library does not define _WCHAR_T. Check also for compiler defined
+__WCHAR_TYPE__.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+diff -Nuar ipmiutil-2.9.5-orig/util/imb_api.h ipmiutil-2.9.5/util/imb_api.h
+--- ipmiutil-2.9.5-orig/util/imb_api.h	2014-11-04 19:46:11.000000000 +0200
++++ ipmiutil-2.9.5/util/imb_api.h	2015-09-29 07:49:40.799063825 +0300
+@@ -49,7 +49,7 @@
+ /* DOS defines wchar_t in stdlib.h */
+ #else 
+  // defined(LINUX) | defined(SOLARIS)
+-#ifndef _WCHAR_T
++#if !defined(_WCHAR_T) && !defined(__WCHAR_TYPE__)
+ #define _WCHAR_T
+ typedef long    wchar_t;
+ #endif
diff --git a/package/ipmiutil/0005-add-missing-param.h-header-include.patch b/package/ipmiutil/0005-add-missing-param.h-header-include.patch
new file mode 100644
index 0000000..30bc47b
--- /dev/null
+++ b/package/ipmiutil/0005-add-missing-param.h-header-include.patch
@@ -0,0 +1,24 @@
+Add missing linux/param.h header include
+
+Fixes the following build failure under musl:
+
+mem_if.c: In function ???MapPhysicalMemory???:
+mem_if.c:337:36: error: ???EXEC_PAGESIZE??? undeclared (first use in this function)
+  ulDiff = (ULONG)(tdStartAddress % EXEC_PAGESIZE);
+                                    ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+diff -Nuar ipmiutil-2.9.5-orig/util/mem_if.c ipmiutil-2.9.5/util/mem_if.c
+--- ipmiutil-2.9.5-orig/util/mem_if.c	2014-11-04 19:46:11.000000000 +0200
++++ ipmiutil-2.9.5/util/mem_if.c	2015-09-29 08:08:31.800459775 +0300
+@@ -65,6 +65,9 @@
+ #include <sys/param.h>
+ #include <sys/mman.h>
+ #include <sys/ioctl.h>
++#ifdef __linux__
++#include <linux/param.h>
++#endif
+ #endif
+ #if defined(SOLARIS) || defined(BSD)
+ #define EXEC_PAGESIZE     4096
diff --git a/package/ipmiutil/0006-add-missing-sys-select.h-include.patch b/package/ipmiutil/0006-add-missing-sys-select.h-include.patch
new file mode 100644
index 0000000..a0cba20
--- /dev/null
+++ b/package/ipmiutil/0006-add-missing-sys-select.h-include.patch
@@ -0,0 +1,26 @@
+Add missing sys/select.h include
+
+POSIX.1-2001 requires sys/select.h for select(). Fixes the following build
+failure under musl:
+
+ipmimv.c: In function ???ipmicmd_mv???:
+ipmimv.c:345:5: error: unknown type name ???fd_set???
+     fd_set readfds;
+     ^
+ipmimv.c:346:20: error: storage size of ???tv??? isn???t known
+     struct timeval tv;
+                    ^
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+
+diff -Nuar ipmiutil-2.9.5-orig/util/ipmimv.c ipmiutil-2.9.5/util/ipmimv.c
+--- ipmiutil-2.9.5-orig/util/ipmimv.c	2014-11-04 19:46:11.000000000 +0200
++++ ipmiutil-2.9.5/util/ipmimv.c	2015-09-29 09:16:08.862828679 +0300
+@@ -62,6 +62,7 @@
+ #include <time.h>
+ #include <errno.h>
+ #include <sys/ioctl.h>
++#include <sys/select.h>
+ #if defined(MACOS)
+ #include <sys/time.h>
+ #else
