From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  8 Sep 2017 09:35:07 +0200
Subject: [Buildroot] [PATCH] qt: add patch fixing build failure on ARMv8 in
	32-bit mode
Message-ID: <20170908073507.6009-1-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt package currently fails to build on ARMv8 cores in 32-bit mode
(for example, if you select ARM and then Cortex-A53), because the ARM
atomic operation implementation in Qt checks if we're on ARMv7, then
on ARMv6, and otherwise falls back to an ARMv5 implementation. The
latter uses the swp instruction, which doesn't exist on ARMv8, causing
a build failure.

To solve this, we simply add a patch that uses the ARMv7 atomic
operations for ARMv8-A.

There is no autobuilder reference because we don't have any ARMv8
32-bit configuration in the autobuilders.

Cc: <ivychend@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
Peter: this should go to 2017.02.x, the problem was reported on IRC by
ivychend who is using 2017.02.5.
---
 ...-arch-qatomic_arm.h-fix-build-on-ARMv8-32.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 package/qt/0013-src-corelib-arch-qatomic_arm.h-fix-build-on-ARMv8-32.patch

diff --git a/package/qt/0013-src-corelib-arch-qatomic_arm.h-fix-build-on-ARMv8-32.patch b/package/qt/0013-src-corelib-arch-qatomic_arm.h-fix-build-on-ARMv8-32.patch
new file mode 100644
index 0000000000..645041acfe
--- /dev/null
+++ b/package/qt/0013-src-corelib-arch-qatomic_arm.h-fix-build-on-ARMv8-32.patch
@@ -0,0 +1,37 @@
+From 2281fa50f6e13278d3fd4f028377b8249b7b3cdb Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 8 Sep 2017 09:06:54 +0200
+Subject: [PATCH] src/corelib/arch/qatomic_arm.h: fix build on ARMv8 32-bit
+
+The Qt build fails on ARMv8 32-bit because it falls back to using the
+ARMv5 code that uses the swp instruction, which no longer exists:
+
+/tmp/ccSxVIzw.s: Assembler messages:
+/tmp/ccSxVIzw.s:127: Error: swp{b} use is obsoleted for ARMv8 and later
+/tmp/ccSxVIzw.s:190: Error: swp{b} use is obsoleted for ARMv8 and later
+
+So, this commit adjusts the ARM atomic code to assume ARMv8 is similar
+to ARMv7.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/corelib/arch/qatomic_arm.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/corelib/arch/qatomic_arm.h b/src/corelib/arch/qatomic_arm.h
+index 77cd66f272..e011929d3e 100644
+--- a/src/corelib/arch/qatomic_arm.h
++++ b/src/corelib/arch/qatomic_arm.h
+@@ -47,7 +47,8 @@ QT_BEGIN_HEADER
+ #if defined(__ARM_ARCH_7__) \
+     || defined(__ARM_ARCH_7A__) \
+     || defined(__ARM_ARCH_7R__) \
+-    || defined(__ARM_ARCH_7M__)
++    || defined(__ARM_ARCH_7M__) \
++    || defined(__ARM_ARCH_8A__)
+ # define QT_ARCH_ARMV7
+ QT_BEGIN_INCLUDE_HEADER
+ # include "QtCore/qatomic_armv7.h"
+-- 
+2.13.5
+
-- 
2.13.5
