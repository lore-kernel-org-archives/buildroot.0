From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:16:45 +0100
Subject: [Buildroot] [git commit] arch/arm: reorder NEON option
Message-ID: <20151227112454.12521822B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b64bcbf5f2cb066e8dd819a762f779d0015a68f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Stating whether to use the NEON extensions when it is optional in the
CPU really is completing the definition of the CPU we've just selected.

Move the ENABLE_NEON option just after the choice of the CPU variant,
and before any "software" option (ABI/VFP).

This will make sense in a moment, when we introduce a similar option for
enabling an optional VFP unit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
