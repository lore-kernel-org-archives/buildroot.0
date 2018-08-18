From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 Aug 2018 14:32:07 +0200
Subject: [Buildroot] [git commit] toolchain: add
 BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS hidden option
Message-ID: <20180818153838.B4F768D5CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f6f910cc9978910ebab5e088cb7c3870371b382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS variable and
use it in BR2_TOOLCHAIN_HAS_GCC_BUG_64735.

This new variable will be used to select boost atomic when lock-free
atomic ints are not available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 37 +++++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 10 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3a53a32a6d..ad02af5215 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -69,18 +69,35 @@ comment "Toolchain Generic Options"
 config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
 	bool
 
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735
-# exception_ptr, nested_exception, and future from libstdc++ are not
-# available for architectures not supporting always lock-free atomic
-# ints before GCC 7
+# Atomic types can be:
+#  - never lock-free
+#  - sometimes lock-free
+#  - always lock-free
+# see https://en.cppreference.com/w/c/atomic/ATOMIC_LOCK_FREE_consts
+#
+# On most architectures, gcc provides "always lock-free" atomic types,
+# but a few architectures are limited to "sometimes lock-free"
+# types. This hidden option allows to know if the architecture
+# provides "always lock-free" atomic types.
+config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	bool
+	default y
+	depends on !BR2_nios2
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_ARM_CPU_ARMV5
+	depends on !BR2_sparc_v8
+	depends on !BR2_m68k_cf5208
+
+# Prior to gcc 7.x, exception_ptr, nested_exception and future from
+# libstdc++ would only be provided on architectures that support
+# always lock-free atomic ints. See
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=64735. This issue has
+# been removed in GCC 7.x, where exception propagation is now
+# supported without lock-free atomic int.
 config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	bool
-	default y if BR2_nios2
-	default y if BR2_ARM_CPU_ARMV4
-	default y if BR2_ARM_CPU_ARMV5
-	default y if BR2_sparc_v8
-	default y if BR2_m68k_cf5208
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
+	default y if !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS && \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
 # longer exists in gcc 8.x.
