From: Dmitrii Kolesnichenko <Dmitrii.Kolesnichenko@synopsys.com>
Date: Thu, 15 Jun 2017 21:05:17 +0300
Subject: [Buildroot] [PATCH] libtirpc: Fix build error due to missing
	stdint.h inclusion
Message-ID: <20170615180517.17185-1-dmitrii@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix following error:
| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
|   if (len < (uintptr_t)xdrs->x_base) {
|              ^~~~~~~~~

It includes stdint.h to provide uintptr_t.

This patch has been submitted upstream:
https://sourceforge.net/p/libtirpc/mailman/libtirpc-devel/

Signed-off-by: Dmitrii Kolesnichenko <dmitrii@synopsys.com>
---
 ...ild-error-due-to-missing-stdint.h-include.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libtirpc/0008-Fix-build-error-due-to-missing-stdint.h-include.patch

diff --git a/package/libtirpc/0008-Fix-build-error-due-to-missing-stdint.h-include.patch b/package/libtirpc/0008-Fix-build-error-due-to-missing-stdint.h-include.patch
new file mode 100644
index 0000000..ccb0dff
--- /dev/null
+++ b/package/libtirpc/0008-Fix-build-error-due-to-missing-stdint.h-include.patch
@@ -0,0 +1,26 @@
+Fixes
+| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
+|   if (len < (uintptr_t)xdrs->x_base) {
+|              ^~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@...>
+---
+Upstream-Status: Pending
+
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
+2.13.0
-- 
1.8.3.1
