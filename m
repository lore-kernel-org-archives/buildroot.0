From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 4 Feb 2019 17:30:18 +0100
Subject: [Buildroot] [git commit] arch/mips: add (Marvell) Octeon III
 processor
Message-ID: <20190204163131.58E6D82641@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18b8d360bb920c415fb875f721ecae886c316db9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The compiler recognizes a specific 'march' value for Octeon III processors,
so create a 'Target Architecture Variant' entry for it in the target menu.

Note: support for '-march=octeon3' was added in gcc 5.x. However, the
official compiler provided by Marvell (Cavium Networks) uses gcc 4.7.x (and
supports -march=octeon3 via their own modifications). For this reason, no
line 'select BR2_ARCH_NEEDS_GCC_AT_LEAST_5' is added.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.mips | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index b8567c56b8..7f7aa63f06 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -129,6 +129,13 @@ config BR2_mips_octeon2
 	help
 	  Marvell (formerly Cavium Networks) Octeon II CN60XX
 	  processors.
+config BR2_mips_octeon3
+	bool "Octeon III"
+	depends on BR2_ARCH_IS_64
+	select BR2_MIPS_CPU_MIPS64R3
+	help
+	  Marvell (formerly Cavium Networks) Octeon III CN7XXX
+	  processors.
 config BR2_mips_p6600
 	bool "P6600"
 	depends on BR2_ARCH_IS_64
@@ -156,6 +163,7 @@ endchoice
 config BR2_MIPS_SOFT_FLOAT
 	bool "Use soft-float"
 	default y
+	depends on !BR2_mips_octeon3 # hard-float only
 	select BR2_SOFT_FLOAT
 	help
 	  If your target CPU does not have a Floating Point Unit (FPU)
@@ -249,6 +257,7 @@ config BR2_GCC_TARGET_ARCH
 	default "mips64r6"	if BR2_mips_64r6
 	default "i6400"		if BR2_mips_i6400
 	default "octeon2"	if BR2_mips_octeon2
+	default "octeon3"	if BR2_mips_octeon3
 	default "p6600"		if BR2_mips_p6600
 
 config BR2_MIPS_OABI32
