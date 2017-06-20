From: Dmitrii Kolesnichenko <Dmitrii.Kolesnichenko@synopsys.com>
Date: Tue, 20 Jun 2017 11:51:46 +0300
Subject: [Buildroot] [PATCH v3] libtirpc: Fix build error due to missing
	stdint.h inclusion
In-Reply-To: <20170619213140.731daabb@windsurf.home>
Message-ID: <20170620085146.8558-1-dmitrii@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add patch to fix following error:
| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
|   if (len < (uintptr_t)xdrs->x_base) {
|              ^~~~~~~~~

This error occurs with the latest glibc master version, but doesn't occur with
version 2.25.

Patch includes stdint.h to provide uintptr_t.

It has been submitted upstream:
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
@@ -0,0 +1,27 @@
+Fixes
+| ../../libtirpc-1.0.1/src/xdr_sizeof.c:93:13: error: 'uintptr_t' undeclared (first use in this function); did you mean '__intptr_t'?
+|   if (len < (uintptr_t)xdrs->x_base) {
+|              ^~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@...>
+Signed-off-by: Dmitrii Kolesnichenko <dmitrii@synopsys.com>
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
