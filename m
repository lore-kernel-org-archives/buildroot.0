From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 13 Dec 2012 23:25:53 +0100
Subject: [Buildroot] [git commit] arch/Config.in.arm: Add
	BR2_ARM_CPU_HAS_NEON similar to how mmx/sse is handled on x86
Message-ID: <20121213230620.8169F9A1F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f9da98c85d661578e0f40d81fac53aa65bd08fbb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NEON support is optional on A5/A9, so let the user choose if SoC has it /
wants to use it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 arch/Config.in.arm |   21 +++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b65b4ac..806b196 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -1,3 +1,11 @@
+# arm cpu features
+config BR2_ARM_CPU_HAS_NEON
+	bool
+
+# for some cores, NEON support is optional
+config BR2_ARM_CPU_MAYBE_HAS_NEON
+	bool
+
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_arm || BR2_armeb
@@ -31,12 +39,16 @@ config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 config BR2_cortex_a5
 	bool "cortex-A5"
+	select BR2_ARM_CPU_MAYBE_HAS_NEON
 config BR2_cortex_a8
 	bool "cortex-A8"
+	select BR2_ARM_CPU_HAS_NEON
 config BR2_cortex_a9
 	bool "cortex-A9"
+	select BR2_ARM_CPU_MAYBE_HAS_NEON
 config BR2_cortex_a15
 	bool "cortex-A15"
+	select BR2_ARM_CPU_HAS_NEON
 config BR2_sa110
 	bool "sa110"
 config BR2_sa1100
@@ -64,6 +76,15 @@ config BR2_ARM_OABI
 	depends on !BR2_GCC_VERSION_4_7_X
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
 config BR2_ARCH
 	default "arm"	if BR2_arm
 	default "armeb"	if BR2_armeb
