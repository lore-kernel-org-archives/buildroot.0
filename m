From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 22:07:32 +0200
Subject: [Buildroot] [git commit] libtirpc: Fix build error due to missing
	stdint.h inclusion
Message-ID: <20170620200837.CB8AF81E76@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3998dc00ff26c4848b4439ba301502faf8f1995
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add patch to fix following error:
| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
|   if (len < (uintptr_t)xdrs->x_base) {
|              ^~~~~~~~~

This error occurs with the latest glibc master version (during the testing I had
glibc commit 92bd70fb85bce57ac47ba5d8af008736832c955a), but doesn't occur with
version 2.25.

Patch includes stdint.h to provide uintptr_t.

It has been submitted upstream:
https://sourceforge.net/p/libtirpc/mailman/message/35850276/

Signed-off-by: Dmitrii Kolesnichenko <dmitrii@synopsys.com>
[Thomas: reformat as Git formatted patch.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0008-include-stdint.h-for-uintptr_t.patch      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/libtirpc/0008-include-stdint.h-for-uintptr_t.patch b/package/libtirpc/0008-include-stdint.h-for-uintptr_t.patch
new file mode 100644
index 0000000..6203161
--- /dev/null
+++ b/package/libtirpc/0008-include-stdint.h-for-uintptr_t.patch
@@ -0,0 +1,31 @@
+From 18f8a605e176f0362da22fd1203eb7cedb136aaf Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 20 Jun 2017 22:06:35 +0200
+Subject: [PATCH] include stdint.h for uintptr_t
+
+Fixes
+| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
+|   if (len < (uintptr_t)xdrs->x_base) {
+|              ^~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Dmitrii Kolesnichenko <dmitrii@synopsys.com>
+---
+ src/xdr_sizeof.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/xdr_sizeof.c b/src/xdr_sizeof.c
+index d23fbd1..79d6707 100644
+--- a/src/xdr_sizeof.c
++++ b/src/xdr_sizeof.c
+@@ -39,6 +39,7 @@
+ #include <rpc/xdr.h>
+ #include <sys/types.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include "un-namespace.h"
+ 
+ /* ARGSUSED */
+-- 
+2.9.4
+
