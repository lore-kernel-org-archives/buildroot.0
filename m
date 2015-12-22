From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Dec 2015 21:52:11 +0100
Subject: [Buildroot] [git commit] ltrace: add patch to fix build on sparc
Message-ID: <20151222205302.152E4826C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88511ccf4a6e0338cbfd8dc985b9ebcda5d0e6b2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Due to a missing header inclusion, the build of ltrace of sparc fails
with the following error:

plt.c: In function 'sym2addr':
plt.c:33:12: error: dereferencing pointer to incomplete type
  return sym->enter_addr;
            ^
plt.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
 }

This commit fixes that by adding a patch to the ltrace code base.

Fixes:

  http://autobuild.buildroot.org/results/55c/55ce618dbe1b2867e5738d90afb2eb67c19200e4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0002-sparc-add-missing-library.h-include.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/ltrace/0002-sparc-add-missing-library.h-include.patch b/package/ltrace/0002-sparc-add-missing-library.h-include.patch
new file mode 100644
index 0000000..01f1f2e
--- /dev/null
+++ b/package/ltrace/0002-sparc-add-missing-library.h-include.patch
@@ -0,0 +1,36 @@
+From 4e58f53b7886420d002e5919f279acd6d7c4afd1 Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Tue, 22 Dec 2015 21:47:45 +0100
+Subject: [PATCH] sparc: add missing library.h include
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the following build failure on sparc:
+
+plt.c: In function ???sym2addr???:
+plt.c:33:12: error: dereferencing pointer to incomplete type
+  return sym->enter_addr;
+            ^
+plt.c:34:1: warning: control reaches end of non-void function [-Wreturn-type]
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ sysdeps/linux-gnu/sparc/plt.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sysdeps/linux-gnu/sparc/plt.c b/sysdeps/linux-gnu/sparc/plt.c
+index 3d2e589..959eed1 100644
+--- a/sysdeps/linux-gnu/sparc/plt.c
++++ b/sysdeps/linux-gnu/sparc/plt.c
+@@ -21,6 +21,7 @@
+ #include <gelf.h>
+ #include "proc.h"
+ #include "common.h"
++#include "library.h"
+ 
+ GElf_Addr
+ arch_plt_sym_val(struct ltelf *lte, size_t ndx, GElf_Rela * rela) {
+-- 
+2.6.4
+
