From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 11 Aug 2015 22:37:09 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: add sparc64 architecture support
Message-ID: <20150811203709.GA9885@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce sparc64 architecture to buildroot.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 arch/Config.in                          |   12 +++++++++++-
 arch/Config.in.sparc                    |    9 +++++++--
 toolchain/toolchain-buildroot/Config.in |    3 ++-
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/Config.in b/arch/Config.in
index 875f412..4cdd54e 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -217,6 +217,16 @@ config BR2_sparc
 	  http://www.oracle.com/sun
 	  http://en.wikipedia.org/wiki/Sparc
 
+config BR2_sparc64
+	bool "SPARC64"
+	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	help
+	  SPARC (from Scalable Processor Architecture) is a RISC instruction
+	  set architecture (ISA) developed by Sun Microsystems.
+	  http://www.oracle.com/sun
+	  http://en.wikipedia.org/wiki/Sparc
+
 config BR2_x86_64
 	bool "x86_64"
 	select BR2_ARCH_IS_64
@@ -388,7 +398,7 @@ if BR2_sh || BR2_sh64
 source "arch/Config.in.sh"
 endif
 
-if BR2_sparc
+if BR2_sparc || BR2_sparc64
 source "arch/Config.in.sparc"
 endif
 
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index cc10e8d..faf4a11 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -1,7 +1,8 @@
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_sparc
-	default BR2_sparc_v8
+	depends on BR2_sparc || BR2_sparc64
+	default BR2_sparc_v8 if BR2_sparc
+	default BR2_sparc_v9 if BR2_sparc64
 	help
 	  Specific CPU variant to use
 
@@ -9,10 +10,13 @@ config BR2_sparc_v8
 	bool "v8"
 config BR2_sparc_leon3
 	bool "leon3"
+config BR2_sparc_v9
+	bool "v9"
 endchoice
 
 config BR2_ARCH
 	default "sparc"	if BR2_sparc
+	default "sparc64" if BR2_sparc64
 
 config BR2_ENDIAN
 	default "BIG"
@@ -20,3 +24,4 @@ config BR2_ENDIAN
 config BR2_GCC_TARGET_CPU
 	default "leon3"		if BR2_sparc_leon3
 	default "v8"		if BR2_sparc_v8
+	default "ultrasparc"	if BR2_sparc_v9
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 6d74819..17dba36 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -67,7 +67,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_mipsel      || BR2_mips64     || BR2_mips64el|| \
 		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
 		   BR2_sh          || BR2_sh64       || BR2_sparc   || \
-		   BR2_x86_64      || BR2_microblaze || BR2_nios2
+		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze || \
+		   BR2_nios2
 	depends on BR2_USE_MMU
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_powerpc_SPE
-- 
1.7.10.4
