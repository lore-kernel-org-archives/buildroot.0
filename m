From: Nylon Chen <nylon7@andestech.com>
Date: Thu, 7 Mar 2019 10:11:23 +0800
Subject: [Buildroot] [PATCH v3 1/3] arch: add support for Andes 32-bit(nds32)
In-Reply-To: <20190307021125.8530-1-nylon7@andestech.com>
References: <20190307021125.8530-1-nylon7@andestech.com>
Message-ID: <20190307021125.8530-2-nylon7@andestech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit provides basic support for the Andes 32-bit(nds32) architecture.

Signed-off-by: Che-Wei Chuang <cnoize@andestech.com>
Signed-off-by: Greentime Hu <greentime@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 DEVELOPERS           |  3 +++
 arch/Config.in       | 12 ++++++++++++
 arch/Config.in.nds32 | 19 +++++++++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/Config.in.nds32

diff --git a/DEVELOPERS b/DEVELOPERS
index c17ba6db99..06a20c68b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1605,6 +1605,9 @@ F:	package/trousers/
 N:	Norbert Lange <nolange79@gmail.com>
 F:	package/tcf-agent/
 
+N:	Nylon Chen <nylon7@andestech.com>
+F:	arch/Config.in.nds32
+
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
 
diff --git a/arch/Config.in b/arch/Config.in
index f50760a0cf..d82803c828 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -154,6 +154,14 @@ config BR2_mips64el
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
+config BR2_nds32
+	bool "nds32"
+	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
+	select BR2_ARCH_HAS_MMU_MANDATORY
+	help
+	  nds32 is a 32-bit architecture developed by Andes Technology.
+	  https://en.wikipedia.org/wiki/Andes_Technology
+
 config BR2_nios2
 	bool "Nios II"
 	select BR2_ARCH_HAS_MMU_MANDATORY
@@ -419,6 +427,10 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
 source "arch/Config.in.mips"
 endif
 
+if BR2_nds32
+source "arch/Config.in.nds32"
+endif
+
 if BR2_nios2
 source "arch/Config.in.nios2"
 endif
diff --git a/arch/Config.in.nds32 b/arch/Config.in.nds32
new file mode 100644
index 0000000000..38b1c2d4eb
--- /dev/null
+++ b/arch/Config.in.nds32
@@ -0,0 +1,19 @@
+config BR2_ARCH
+	default "nds32"
+
+config BR2_ANDES_NDS32_FPU
+	bool "Enable FPU coprocessor"
+	help
+	  You can say y here if your Andes CPU have a Floating-Point Coprocessor
+	  or if you need FPU support for your user-space programs.
+
+config BR2_GCC_TARGET_ARCH
+	default "v3"  if !BR2_ANDES_NDS32_FPU
+	default "v3f" if BR2_ANDES_NDS32_FPU
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_READELF_ARCH_NAME
+	default "Andes Technology compact code size embedded RISC processor family"
+
-- 
2.18.0
