From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 23:47:23 +0200
Subject: [Buildroot] [git commit] libev: add patch to fix build on SPARCv8
Message-ID: <20150808214824.818AE7FFE6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb9502a7e01fc340145d8e91aea5466a7d2d0913
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a mistake in a compile time conditional, SPARCv9 code was being
compiled in libev on a SPARCv8 system. A newly added patch fixes this,
which fixes the following build failure:

  http://autobuild.buildroot.net/results/55d6190b60a08c9bc4d659cf009df52388db676a/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libev/0001-fix-sparcv8-condition.patch |   29 ++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/package/libev/0001-fix-sparcv8-condition.patch b/package/libev/0001-fix-sparcv8-condition.patch
new file mode 100644
index 0000000..d411f83
--- /dev/null
+++ b/package/libev/0001-fix-sparcv8-condition.patch
@@ -0,0 +1,29 @@
+Fix SPARCv8 condition
+
+The define provided by the compiler on SPARCv8 is __sparc_v8__ and not
+__sparcv8. From a SPARCv8 gcc:
+
+$ sparc-linux-gcc --version
+sparc-linux-gcc (Buildroot 2015.08-git-00497-ge110081) 4.9.3
+[...]
+$ sparc-linux-gcc -dM -E - < /dev/null | grep sparc
+#define sparc 1
+#define __sparc__ 1
+#define __sparc 1
+#define __sparc_v8__ 1
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/ev.c
+===================================================================
+--- a/ev.c
++++ b/ev.c
+@@ -649,7 +649,7 @@
+       #define ECB_MEMORY_FENCE         __asm__ __volatile__ ("dmb"      : : : "memory")
+     #elif __aarch64__
+       #define ECB_MEMORY_FENCE         __asm__ __volatile__ ("dmb ish"  : : : "memory")
+-    #elif (__sparc || __sparc__) && !__sparcv8
++    #elif (__sparc || __sparc__) && !__sparc_v8__
+       #define ECB_MEMORY_FENCE         __asm__ __volatile__ ("membar #LoadStore | #LoadLoad | #StoreStore | #StoreLoad" : : : "memory")
+       #define ECB_MEMORY_FENCE_ACQUIRE __asm__ __volatile__ ("membar #LoadStore | #LoadLoad"                            : : : "memory")
+       #define ECB_MEMORY_FENCE_RELEASE __asm__ __volatile__ ("membar #LoadStore             | #StoreStore")
