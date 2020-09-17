From: Alexander Egorenkov <egorenar@linux.ibm.com>
Date: Thu, 17 Sep 2020 06:07:51 +0200
Subject: [Buildroot] [PATCH v4 01/12] arch: add the basic IBM s390x and Z
 arch support
In-Reply-To: <20200917040802.846896-1-egorenar@linux.ibm.com>
References: <20200917040802.846896-1-egorenar@linux.ibm.com>
Message-ID: <20200917040802.846896-2-egorenar@linux.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 DEVELOPERS           |  3 +++
 Makefile             |  1 +
 arch/Config.in       | 14 ++++++++++++++
 arch/Config.in.s390x | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 arch/Config.in.s390x

diff --git a/DEVELOPERS b/DEVELOPERS
index c5124f97ef..2285694f66 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -146,6 +146,9 @@ N:	Alexander Egorenkov <egorenar-dev@posteo.net>
 F:	package/makedumpfile/
 F:	package/multipath-tools/
 
+N:	Alexander Egorenkov <egorenar@linux.ibm.com>
+F:	arch/Config.in.s390x
+
 N:	Alexander Kurz <akurz@blala.de>
 F:	package/minimodem/
 
diff --git a/Makefile b/Makefile
index 9648fa58d8..384bfe3fe9 100644
--- a/Makefile
+++ b/Makefile
@@ -445,6 +445,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 	-e s/riscv.*/riscv/ \
 	-e s/sh.*/sh/ \
+	-e s/s390x/s390/ \
 	-e s/microblazeel/microblaze/)
 
 ZCAT := $(call qstrip,$(BR2_ZCAT))
diff --git a/arch/Config.in b/arch/Config.in
index 0707c076e2..eb9b6007c9 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -219,6 +219,16 @@ config BR2_riscv
 	  https://riscv.org/
 	  https://en.wikipedia.org/wiki/RISC-V
 
+config BR2_s390x
+	bool "s390x"
+	select BR2_ARCH_IS_64
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+	help
+	  s390x is a big-endian architecture made by IBM.
+	  http://www.ibm.com/
+	  http://en.wikipedia.org/wiki/IBM_System/390
+
 config BR2_sh
 	bool "SuperH"
 	select BR2_ARCH_HAS_MMU_OPTIONAL
@@ -457,6 +467,10 @@ if BR2_riscv
 source "arch/Config.in.riscv"
 endif
 
+if BR2_s390x
+source "arch/Config.in.s390x"
+endif
+
 if BR2_sh
 source "arch/Config.in.sh"
 endif
diff --git a/arch/Config.in.s390x b/arch/Config.in.s390x
new file mode 100644
index 0000000000..39d2f58aa9
--- /dev/null
+++ b/arch/Config.in.s390x
@@ -0,0 +1,34 @@
+
+choice
+	prompt "Target Architecture Variant"
+	depends on BR2_s390x
+	help
+	  Specific CPU variant to use
+
+config BR2_s390x_z13
+	bool "z13"
+	depends on BR2_s390x
+
+config BR2_s390x_z14
+	bool "z14"
+	depends on BR2_s390x
+
+config BR2_s390x_z15
+	bool "z15"
+	depends on BR2_s390x
+
+endchoice
+
+config BR2_ARCH
+	default "s390x"	if BR2_s390x
+
+config BR2_ENDIAN
+	default "BIG"
+
+config BR2_GCC_TARGET_ARCH
+	default "arch11" if BR2_s390x_z13
+	default "arch12" if BR2_s390x_z14
+	default "arch13" if BR2_s390x_z15
+
+config BR2_READELF_ARCH_NAME
+	default "IBM S/390"	if BR2_s390x
-- 
2.26.2
