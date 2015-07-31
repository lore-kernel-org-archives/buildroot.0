From: Brendan Heading <brendanheading@gmail.com>
Date: Fri, 31 Jul 2015 13:22:17 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/bdwgc: musl build failure
Message-ID: <1438345337-2947-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes http://autobuild.buildroot.net/results/1ed/1edb5e7dab88d3fefca533ab56f7ddc7dd5411d2/

Upstream removed unused code which was causing compilation issues.
Signed-off-by: Brendan Heading <brendanheading@gmail.com>

---
v1 -> v2 - updated to use a backported change from upstream.
---
 package/bdwgc/0002-bdwgc-musl-compile-error.patch | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 package/bdwgc/0002-bdwgc-musl-compile-error.patch

diff --git a/package/bdwgc/0002-bdwgc-musl-compile-error.patch b/package/bdwgc/0002-bdwgc-musl-compile-error.patch
new file mode 100644
index 0000000..8f74c7c
--- /dev/null
+++ b/package/bdwgc/0002-bdwgc-musl-compile-error.patch
@@ -0,0 +1,58 @@
+From 212c6c87aa893e101eabbfc46158b7b562f7f21c Mon Sep 17 00:00:00 2001
+From: Brendan Heading <brendanheading@gmail.com>
+Date: Fri, 31 Jul 2015 13:00:58 +0100
+Subject: [PATCH 1/1] bdwgc: musl compile error
+
+Upstream had removed the need for sigcontext and removed the offending
+code, so backport this change here.
+
+Upstream-status: backport
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+---
+ os_dep.c | 30 ------------------------------
+ 1 file changed, 30 deletions(-)
+
+diff --git a/os_dep.c b/os_dep.c
+index 08c501d..54eed52 100644
+--- a/os_dep.c
++++ b/os_dep.c
+@@ -16,36 +16,6 @@
+ 
+ #include "private/gc_priv.h"
+ 
+-#if defined(LINUX) && !defined(POWERPC) && !defined(NO_SIGCONTEXT_H)
+-# include <linux/version.h>
+-# if (LINUX_VERSION_CODE <= 0x10400)
+-    /* Ugly hack to get struct sigcontext_struct definition.  Required  */
+-    /* for some early 1.3.X releases.  Will hopefully go away soon.     */
+-    /* in some later Linux releases, asm/sigcontext.h may have to       */
+-    /* be included instead.                                             */
+-#   define __KERNEL__
+-#   include <asm/signal.h>
+-#   undef __KERNEL__
+-# else
+-    /* Kernels prior to 2.1.1 defined struct sigcontext_struct instead of */
+-    /* struct sigcontext.  libc6 (glibc2) uses "struct sigcontext" in     */
+-    /* prototypes, so we have to include the top-level sigcontext.h to    */
+-    /* make sure the former gets defined to be the latter if appropriate. */
+-#   include <features.h>
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
+-# endif
+-#endif /* LINUX && !POWERPC */
+-
+ #if !defined(OS2) && !defined(PCR) && !defined(AMIGA) && !defined(MACOS) \
+     && !defined(MSWINCE) && !defined(__CC_ARM)
+ # include <sys/types.h>
+-- 
+2.4.3
+
-- 
2.4.3
