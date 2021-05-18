From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 18 May 2021 13:36:48 +0200
Subject: [Buildroot] [PATCH 1/4] arch: move definition of KERNEL_ARCH to
 Config.in.<arch> files
In-Reply-To: <20210518113652.29609-1-patrickdepinguin@gmail.com>
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
Message-ID: <20210518113652.29609-2-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Similar to other arch-specific strings, the 'KERNEL_ARCH' variable can be
determined from Config.in.<arch> files.

Besides aligning with similar strings, this also means simplification: the
big 'sed' covers several architectures not even supported by Buildroot.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 Makefile                  | 17 +----------------
 arch/Config.in            |  3 +++
 arch/Config.in.arc        |  3 +++
 arch/Config.in.arm        |  4 ++++
 arch/Config.in.csky       |  3 +++
 arch/Config.in.m68k       |  3 +++
 arch/Config.in.microblaze |  3 +++
 arch/Config.in.mips       |  3 +++
 arch/Config.in.nds32      |  3 +++
 arch/Config.in.nios2      |  3 +++
 arch/Config.in.or1k       |  3 +++
 arch/Config.in.powerpc    |  3 +++
 arch/Config.in.riscv      |  3 +++
 arch/Config.in.s390x      |  3 +++
 arch/Config.in.sh         |  3 +++
 arch/Config.in.sparc      |  4 ++++
 arch/Config.in.x86        |  4 ++++
 arch/Config.in.xtensa     |  3 +++
 18 files changed, 55 insertions(+), 16 deletions(-)

diff --git a/Makefile b/Makefile
index c3305f46e9..7b6998fde6 100644
--- a/Makefile
+++ b/Makefile
@@ -433,22 +433,7 @@ QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
-
-KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
-	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
-	-e s/arcle/arc/ \
-	-e s/arceb/arc/ \
-	-e s/arm.*/arm/ -e s/sa110/arm/ \
-	-e s/aarch64.*/arm64/ \
-	-e s/nds32.*/nds32/ \
-	-e s/or1k/openrisc/ \
-	-e s/parisc64/parisc/ \
-	-e s/powerpc64.*/powerpc/ \
-	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
-	-e s/riscv.*/riscv/ \
-	-e s/sh.*/sh/ \
-	-e s/s390x/s390/ \
-	-e s/microblazeel/microblaze/)
+KERNEL_ARCH := $(call qstrip,$(BR2_KERNEL_ARCH))
 
 ZCAT := $(call qstrip,$(BR2_ZCAT))
 BZCAT := $(call qstrip,$(BR2_BZCAT))
diff --git a/arch/Config.in b/arch/Config.in
index 155403c363..7575acf48c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -326,6 +326,9 @@ config BR2_ARCH_NEEDS_GCC_AT_LEAST_10
 config BR2_ARCH
 	string
 
+config BR2_KERNEL_ARCH
+	string
+
 config BR2_ENDIAN
 	string
 
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f7a6d920b5..cc55c9e68f 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -62,6 +62,9 @@ config BR2_ARCH
 	default "arc"	if BR2_arcle
 	default "arceb"	if BR2_arceb
 
+config BR2_KERNEL_ARCH
+	default "arc"
+
 config BR2_arc
 	bool
 	default y if BR2_arcle || BR2_arceb
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 4c0910e4f8..0f50512fad 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -822,6 +822,10 @@ config BR2_ARCH
 	default "aarch64"	if BR2_aarch64
 	default "aarch64_be"	if BR2_aarch64_be
 
+config BR2_KERNEL_ARCH
+	default "arm"		if BR2_arm || BR2_armeb
+	default "arm64"		if BR2_aarch64 || BR2_aarch64_be
+
 config BR2_ENDIAN
 	default "LITTLE" if (BR2_arm || BR2_aarch64)
 	default "BIG"	 if (BR2_armeb || BR2_aarch64_be)
diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 7e2029f759..df9e7ab75b 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -39,6 +39,9 @@ config BR2_GCC_TARGET_FLOAT_ABI
 config BR2_ARCH
 	default "csky"
 
+config BR2_KERNEL_ARCH
+	default "csky"
+
 config BR2_ENDIAN
 	default "LITTLE"
 
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 275f47f1d3..7f3aec7232 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -1,6 +1,9 @@
 config BR2_ARCH
 	default "m68k"		if BR2_m68k
 
+config BR2_KERNEL_ARCH
+	default "m68k"
+
 config BR2_ENDIAN
 	default "BIG"
 
diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
index 5fe2906d40..52aa252a2c 100644
--- a/arch/Config.in.microblaze
+++ b/arch/Config.in.microblaze
@@ -2,6 +2,9 @@ config BR2_ARCH
 	default "microblazeel"  if BR2_microblazeel
 	default "microblaze"    if BR2_microblazebe
 
+config BR2_KERNEL_ARCH
+	default "microblaze"
+
 config BR2_ENDIAN
 	default "LITTLE" if BR2_microblazeel
 	default "BIG"	 if BR2_microblazebe
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 619456c2d5..b4923f8484 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -235,6 +235,9 @@ config BR2_ARCH
 	default "mips64"	if BR2_mips64
 	default "mips64el"	if BR2_mips64el
 
+config BR2_KERNEL_ARCH
+	default "mips"
+
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_mipsel || BR2_mips64el
 	default "BIG"		if BR2_mips || BR2_mips64
diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
index 322ff49f2e..61fc346260 100644
--- a/arch/Config.in.nds32
+++ b/arch/Config.in.nds32
@@ -1,6 +1,9 @@
 config BR2_ARCH
 	default "nds32le"
 
+config BR2_KERNEL_ARCH
+	default "nds32"
+
 config BR2_GCC_TARGET_ARCH
 	default "v3"
 
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
index aae435fa17..c77b1a1c59 100644
--- a/arch/Config.in.nios2
+++ b/arch/Config.in.nios2
@@ -1,6 +1,9 @@
 config BR2_ARCH
 	default "nios2"
 
+config BR2_KERNEL_ARCH
+	default "nios2"
+
 config BR2_ENDIAN
 	default "LITTLE"
 
diff --git a/arch/Config.in.or1k b/arch/Config.in.or1k
index abdf498fb8..ef1bded453 100644
--- a/arch/Config.in.or1k
+++ b/arch/Config.in.or1k
@@ -1,6 +1,9 @@
 config BR2_ARCH
 	default "or1k"
 
+config BR2_KERNEL_ARCH
+	default "openrisc"
+
 config BR2_ENDIAN
 	default "BIG"
 
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index ba56c9c721..33b2471cf9 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -157,6 +157,9 @@ config BR2_ARCH
 	default "powerpc64"	if BR2_powerpc64
 	default "powerpc64le"	if BR2_powerpc64le
 
+config BR2_KERNEL_ARCH
+	default "powerpc"
+
 config BR2_ENDIAN
 	default "BIG"    if BR2_powerpc || BR2_powerpc64
 	default "LITTLE" if BR2_powerpc64le
diff --git a/arch/Config.in.riscv b/arch/Config.in.riscv
index 1fc20e5de7..e8b6ddc833 100644
--- a/arch/Config.in.riscv
+++ b/arch/Config.in.riscv
@@ -116,6 +116,9 @@ config BR2_ARCH
 	default "riscv32" if !BR2_ARCH_IS_64
 	default "riscv64" if BR2_ARCH_IS_64
 
+config BR2_KERNEL_ARCH
+	default "riscv"
+
 config BR2_ENDIAN
 	default "LITTLE"
 
diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
index ad866b421e..bf4b70f957 100644
--- a/arch/Config.in.s390x
+++ b/arch/Config.in.s390x
@@ -17,6 +17,9 @@ endchoice
 config BR2_ARCH
 	default "s390x"	if BR2_s390x
 
+config BR2_KERNEL_ARCH
+	default "s390"
+
 config BR2_ENDIAN
 	default "BIG"
 
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index b5cce18e22..fde42dfce2 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -24,6 +24,9 @@ config BR2_ARCH
 	default "sh4a"		if BR2_sh4a
 	default "sh4aeb"	if BR2_sh4aeb
 
+config BR2_KERNEL_ARCH
+	default "sh"
+
 config BR2_ENDIAN
 	default "LITTLE"	if BR2_sh4 || BR2_sh4a
 	default "BIG"		if BR2_sh2a || BR2_sh4eb || BR2_sh4aeb
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 4c4dc61745..b91df6892b 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -21,6 +21,10 @@ config BR2_ARCH
 	default "sparc"	if BR2_sparc
 	default "sparc64" if BR2_sparc64
 
+config BR2_KERNEL_ARCH
+	default "sparc"	if BR2_sparc
+	default "sparc64" if BR2_sparc64
+
 config BR2_ENDIAN
 	default "BIG"
 
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 7aae3cafb7..88ac9cdc44 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -266,6 +266,10 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_athlon_4
 	default "x86_64"	if BR2_x86_64
 
+config BR2_KERNEL_ARCH
+	default "i386"		if !BR2_x86_64
+	default "x86_64"	if BR2_x86_64
+
 config BR2_ENDIAN
 	default "LITTLE"
 
diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
index a79d906985..acc340eca6 100644
--- a/arch/Config.in.xtensa
+++ b/arch/Config.in.xtensa
@@ -48,6 +48,9 @@ config BR2_ENDIAN
 config BR2_ARCH
 	default "xtensa"	if BR2_xtensa
 
+config BR2_KERNEL_ARCH
+	default "xtensa"
+
 config BR2_READELF_ARCH_NAME
 	default "Tensilica Xtensa Processor"
 
-- 
2.26.3
