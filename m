From: Brendan Heading <brendanheading@gmail.com>
Date: Wed, 29 Jul 2015 00:45:26 +0100
Subject: [Buildroot] [PATCH 1/1] package/bdwgc: musl build failure
Message-ID: <1438127126-7488-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/1ed/1edb5e7dab88d3fefca533ab56f7ddc7dd5411d2/

bdwgc attempts to detect older __GLIBC__ versions but does not account
for ths case when __GLIBC__ is not defined.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 package/bdwgc/0002-bdwgc-fix-musl-build.patch | 52 +++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/bdwgc/0002-bdwgc-fix-musl-build.patch

diff --git a/package/bdwgc/0002-bdwgc-fix-musl-build.patch b/package/bdwgc/0002-bdwgc-fix-musl-build.patch
new file mode 100644
index 0000000..a15d44d
--- /dev/null
+++ b/package/bdwgc/0002-bdwgc-fix-musl-build.patch
@@ -0,0 +1,52 @@
+[PATCH] bdwgc: fix musl build
+
+This is because musl does not define __GLIBC__. Some logic in os_deps.c
+designed to detect and handle old versions of glibc only makes sense
+if glibc is in use; this patch therefore checks to ensure __GLIBC__
+is defined first.
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+Upstream-status: submitted
+
+---
+ os_dep.c | 24 +++++++++++++-----------
+ 1 file changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/os_dep.c b/os_dep.c
+index 08c501d..a9a3386 100644
+--- a/os_dep.c
++++ b/os_dep.c
+@@ -32,17 +32,19 @@
+     /* prototypes, so we have to include the top-level sigcontext.h to    */
+     /* make sure the former gets defined to be the latter if appropriate. */
+ #   include <features.h>
+-#   if 2 <= __GLIBC__
+-#     if 2 == __GLIBC__ && 0 == __GLIBC_MINOR__
+-        /* glibc 2.1 no longer has sigcontext.h.  But signal.h          */
+-        /* has the right declaration for glibc 2.1.                     */
+-#       include <sigcontext.h>
+-#     endif /* 0 == __GLIBC_MINOR__ */
+-#   else /* __GLIBC__ < 2 */
+-      /* libc5 doesn't have <sigcontext.h>: go directly with the kernel   */
+-      /* one.  Check LINUX_VERSION_CODE to see which we should reference. */
+-#     include <asm/sigcontext.h>
+-#   endif /* __GLIBC__ < 2 */
++#   ifdef __GLIBC__
++#     if 2 <= __GLIBC__
++#       if 2 == __GLIBC__ && 0 == __GLIBC_MINOR__
++          /* glibc 2.1 no longer has sigcontext.h.  But signal.h          */
++          /* has the right declaration for glibc 2.1.                     */
++#         include <sigcontext.h>
++#       endif /* 0 == __GLIBC_MINOR__ */
++#     else /* __GLIBC__ < 2 */
++        /* libc5 doesn't have <sigcontext.h>: go directly with the kernel   */
++        /* one.  Check LINUX_VERSION_CODE to see which we should reference. */
++#       include <asm/sigcontext.h>
++#     endif /* __GLIBC__ < 2 */
++#   endif /* __GLIBC__ */
+ # endif
+ #endif /* LINUX && !POWERPC */
+ 
+-- 
+2.4.3
+
-- 
2.4.3
