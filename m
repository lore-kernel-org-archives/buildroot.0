From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Aug 2018 00:10:13 +0200
Subject: [Buildroot] [PATCH v2,
 1/2] Add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
Message-ID: <20180817221014.32681-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS variable and use
it in BR2_TOOLCHAIN_HAS_GCC_BUG_64735
This new variable will be used to select boost atomic when lock-free
atomic ints are not available

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 toolchain/Config.in | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3a53a32a6d..ed9b59df46 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -73,13 +73,19 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615
 # exception_ptr, nested_exception, and future from libstdc++ are not
 # available for architectures not supporting always lock-free atomic
 # ints before GCC 7
+config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
+	bool
+	default y
+	depends on !BR2_nios2
+	depends on !BR2_ARM_CPU_ARMV4
+	depends on !BR2_ARM_CPU_ARMV5
+	depends on !BR2_sparc_v8
+	depends on !BR2_m68k_cf5208
+
 config BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 	bool
-	default y if BR2_nios2
-	default y if BR2_ARM_CPU_ARMV4
-	default y if BR2_ARM_CPU_ARMV5
-	default y if BR2_sparc_v8
-	default y if BR2_m68k_cf5208
+	default y
+	depends on !BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=85180. This bug no
-- 
2.14.1
