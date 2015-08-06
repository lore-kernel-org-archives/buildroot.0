From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Aug 2015 09:08:15 +0200
Subject: [Buildroot] [git commit] package/bdwgc: musl build failure
Message-ID: <20150806070823.4076680429@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7df8f06d0864dd90d0c79b0215089cd25f13ff13
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/1ed/1edb5e7dab88d3fefca533ab56f7ddc7dd5411d2/

Upstream removed unused code which was causing musl compilation issues.

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...include-sigcontext.h-and-asm-sigcontext.h.patch |   61 ++++++++++++++++++++
 1 files changed, 61 insertions(+), 0 deletions(-)

diff --git a/package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch b/package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch
new file mode 100644
index 0000000..40c9063
--- /dev/null
+++ b/package/bdwgc/0002-Do-not-include-sigcontext.h-and-asm-sigcontext.h.patch
@@ -0,0 +1,61 @@
+From c887470e0e3310c81ecdb7e736bc5d2ead45db2a Mon Sep 17 00:00:00 2001
+From: Ivan Maidanski <ivmai@mail.ru>
+Date: Mon, 6 Apr 2015 20:06:47 +0300
+Subject: [PATCH 1/1] Do not include sigcontext.h and asm/sigcontext.h (these
+ Linux headers define sigcontext which is no longer used as replaced with
+ ucontext_t in GC 7.0alpha1)
+
+* os_dep.c: Do not include linux/version.h (do not test
+LINUX_VERSION_CODE), asm/signal.h, sigcontext.h, asm/sigcontext.h
+since struct sigcontext not used in GC v7+.
+
+Signed-off-by: Brendan Heading <brendanheading@gmail.com>
+Upstream-status: backport
+---
+ os_dep.c | 30 ------------------------------
+ 1 file changed, 30 deletions(-)
+
+diff --git a/os_dep.c b/os_dep.c
+index f62d4ed..a1bafbd 100644
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
