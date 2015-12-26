From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Dec 2015 17:05:41 +0100
Subject: [Buildroot] [PATCH 1/5 v2] arch/arm: reorder NEON option
In-Reply-To: <cover.1451145472.git.yann.morin.1998@free.fr>
References: <cover.1451145472.git.yann.morin.1998@free.fr>
Message-ID: <e7af4f193e9040506b443d979133a3e4ec64dd67.1451145472.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stating whether to use the NEON extensions when it is optional in the
CPU really is completing the definition of the CPU we've just selected.

Move the ENABLE_NEON option just after the choice of the CPU variant,
and before any "software" option (ABI/VFP).

This will make sense in a moment, when we introduce a similar option for
enabling an optional VFP unit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 67ff384..feac16d 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -185,6 +185,15 @@ config BR2_iwmmxt
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 endchoice
 
+config BR2_ARM_ENABLE_NEON
+	bool "Enable NEON SIMD extension support"
+	depends on BR2_ARM_CPU_MAYBE_HAS_NEON
+	select BR2_ARM_CPU_HAS_NEON
+	help
+	  For some CPU cores, the NEON SIMD extension is optional.
+	  Select this option if you are certain your particular
+	  implementation has NEON support and you want to use it.
+
 choice
 	prompt "Target ABI"
 	depends on BR2_arm || BR2_armeb
@@ -240,15 +249,6 @@ config BR2_ARM_EABIHF
 
 endchoice
 
-config BR2_ARM_ENABLE_NEON
-	bool "Enable NEON SIMD extension support"
-	depends on BR2_ARM_CPU_MAYBE_HAS_NEON
-	select BR2_ARM_CPU_HAS_NEON
-	help
-	  For some CPU cores, the NEON SIMD extension is optional.
-	  Select this option if you are certain your particular
-	  implementation has NEON support and you want to use it.
-
 choice
 	prompt "Floating point strategy"
 	depends on BR2_ARM_EABI || BR2_ARM_EABIHF
-- 
1.9.1
