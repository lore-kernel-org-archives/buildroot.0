From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 14:30:11 +0100
Subject: [Buildroot] [PATCH 1/5] arch: improve definition of gcc mtune, mcpu,
	etc.
In-Reply-To: <cover.1352986210.git.thomas.petazzoni@free-electrons.com>
References: <cover.1352986210.git.thomas.petazzoni@free-electrons.com>
Message-ID: <8ef94365af539b190e9525a10c5b642dc7108cb9.1352986210.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Yann E. Morin, there is a better way than our current
big Config.in.common to define the gcc mtune, mcpu, march,
etc. values. We can split the setting of those values in each
architecture file, which makes a lot more sense.

Therefore, the Config.in file now creates empty kconfig variables
BR2_ARCH, BR2_ENDIAN, BR2_GCC_TARGET_TUNE, BR2_GCC_TARGET_ARCH,
BR2_GCC_TARGET_ABI and BR2_GCC_TARGET_CPU. The values of those
variables are set by the individual Config.in.<arch> files. This is
possible because such files are now only conditionally included
depending on the top-level architecture that has been selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in            |   59 ++++++++++-
 arch/Config.in.aarch64    |    5 +
 arch/Config.in.arm        |   52 ++++++++++
 arch/Config.in.avr32      |    5 +
 arch/Config.in.bfin       |    6 ++
 arch/Config.in.common     |  245 ---------------------------------------------
 arch/Config.in.m68k       |   21 ++++
 arch/Config.in.microblaze |   10 ++
 arch/Config.in.mips       |   25 +++++
 arch/Config.in.powerpc    |   45 +++++++++
 arch/Config.in.sh         |   17 ++++
 arch/Config.in.sparc      |   31 ++++++
 arch/Config.in.x86        |   89 ++++++++++++++++
 13 files changed, 361 insertions(+), 249 deletions(-)
 create mode 100644 arch/Config.in.aarch64
 create mode 100644 arch/Config.in.avr32
 delete mode 100644 arch/Config.in.common
 create mode 100644 arch/Config.in.m68k
 create mode 100644 arch/Config.in.microblaze

diff --git a/arch/Config.in b/arch/Config.in
index 4d1f81f..b326cb5 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -147,15 +147,66 @@ config BR2_x86_64
 
 endchoice
 
-config BR2_microblaze
-	bool
-	default y if BR2_microblazeel || BR2_microblazebe
+# The following string values are defined by the individual
+# Config.in.$ARCH files
+config BR2_ARCH
+	string
 
+config BR2_ENDIAN
+	string
+
+config BR2_GCC_TARGET_TUNE
+	string
+
+config BR2_GCC_TARGET_ARCH
+	string
+
+config BR2_GCC_TARGET_ABI
+	string
+
+config BR2_GCC_TARGET_CPU
+	string
+
+if BR2_arm || BR2_armeb
 source "arch/Config.in.arm"
+endif
+
+if BR2_aarch64
+source "arch/Config.in.aarch64"
+endif
+
+if BR2_avr32
+source "arch/Config.in.avr32"
+endif
+
+if BR2_bfin
 source "arch/Config.in.bfin"
+endif
+
+if BR2_m68k
+source "arch/Config.in.m68k"
+endif
+
+if BR2_microblazeel || BR2_microblazebe
+source "arch/Config.in.microblaze"
+endif
+
+if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
 source "arch/Config.in.mips"
+endif
+
+if BR2_powerpc
 source "arch/Config.in.powerpc"
+endif
+
+if BR2_sh || BR2_sh64
 source "arch/Config.in.sh"
+endif
+
+if BR2_sparc
 source "arch/Config.in.sparc"
+endif
+
+if BR2_i386 || BR2_x86_64
 source "arch/Config.in.x86"
-source "arch/Config.in.common"
+endif
diff --git a/arch/Config.in.aarch64 b/arch/Config.in.aarch64
new file mode 100644
index 0000000..4c68a37
--- /dev/null
+++ b/arch/Config.in.aarch64
@@ -0,0 +1,5 @@
+config BR2_ARCH
+	default "aarch64"	if BR2_aarch64
+
+config BR2_ENDIAN
+	default "LITTLE"
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 8d9db3c..2acedc4 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -60,3 +60,55 @@ config BR2_ARM_OABI
 	depends on !BR2_GCC_VERSION_4_7_X
 endchoice
 
+config BR2_ARCH
+	default "arm"	if BR2_arm
+	default "armeb"	if BR2_armeb
+
+config BR2_ENDIAN
+	default "LITTLE" if BR2_arm
+	default "BIG"	 if BR2_armeb
+
+config BR2_GCC_TARGET_TUNE
+	default arm600		if BR2_arm600
+	default arm610		if BR2_arm610
+	default arm620		if BR2_arm620
+	default arm7tdmi	if BR2_arm7tdmi
+	default arm7tdmi	if BR2_arm720t
+	default arm7tdmi	if BR2_arm740t
+	default arm920		if BR2_arm920
+	default arm920t		if BR2_arm920t
+	default arm922t		if BR2_arm922t
+	default arm926ej-s	if BR2_arm926t
+	default arm1136j-s	if BR2_arm1136j_s
+	default arm1136jf-s	if BR2_arm1136jf_s
+	default arm1176jz-s	if BR2_arm1176jz_s
+	default arm1176jzf-s	if BR2_arm1176jzf_s
+	default cortex-a8	if BR2_cortex_a8
+	default cortex-a9	if BR2_cortex_a9
+	default strongarm110	if BR2_sa110
+	default strongarm1100	if BR2_sa1100
+	default xscale		if BR2_xscale
+	default iwmmxt		if BR2_iwmmxt
+
+config BR2_GCC_TARGET_ARCH
+	default armv4t		if BR2_arm7tdmi
+	default armv3		if BR2_arm610
+	default armv3		if BR2_arm710
+	default armv4t		if BR2_arm720t
+	default armv4t		if BR2_arm920t
+	default armv4t		if BR2_arm922t
+	default armv5te		if BR2_arm926t
+	default armv5t		if BR2_arm10t
+	default armv6j		if BR2_arm1136jf_s
+	default armv6zk		if BR2_arm1176jz_s
+	default armv6zk		if BR2_arm1176jzf_s
+	default armv7-a		if BR2_cortex_a8
+	default armv7-a		if BR2_cortex_a9
+	default armv4		if BR2_sa110
+	default armv4		if BR2_sa1100
+	default armv5te		if BR2_xscale
+	default iwmmxt		if BR2_iwmmxt
+
+config BR2_GCC_TARGET_ABI
+	default apcs-gnu	if BR2_ARM_OABI
+	default aapcs-linux	if BR2_ARM_EABI
diff --git a/arch/Config.in.avr32 b/arch/Config.in.avr32
new file mode 100644
index 0000000..ebf8454
--- /dev/null
+++ b/arch/Config.in.avr32
@@ -0,0 +1,5 @@
+config BR2_ARCH
+       default "avr32"
+
+config BR2_ENDIAN
+       default "BIG"
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
index 1823bde..0b137ae 100644
--- a/arch/Config.in.bfin
+++ b/arch/Config.in.bfin
@@ -8,3 +8,9 @@ config BR2_BFIN_FLAT
 	bool "FLAT"
 	select BR2_PREFER_STATIC_LIB
 endchoice
+
+config BR2_ARCH
+	default "bfin"
+
+config BR2_ENDIAN
+        default "LITTLE"
diff --git a/arch/Config.in.common b/arch/Config.in.common
deleted file mode 100644
index 1ed9929..0000000
--- a/arch/Config.in.common
+++ /dev/null
@@ -1,245 +0,0 @@
-config BR2_ARCH
-	string
-	default "arm"		if BR2_arm
-	default "armeb"		if BR2_armeb
-	default "aarch64"       if BR2_aarch64
-	default "avr32"		if BR2_avr32
-	default "bfin"		if BR2_bfin
-	default "i386"		if BR2_x86_i386
-	default "i486"		if BR2_x86_i486
-	default "i586"		if BR2_x86_i586
-	default "i586"		if BR2_x86_pentium_mmx
-	default "i586"		if BR2_x86_geode
-	default "i586"		if BR2_x86_c3
-	default "i686"		if BR2_x86_c32
-	default "i586"		if BR2_x86_winchip_c6
-	default "i586"		if BR2_x86_winchip2
-	default "i686"		if BR2_x86_i686
-	default "i686"		if BR2_x86_pentium2
-	default "i686"		if BR2_x86_pentium3
-	default "i686"		if BR2_x86_pentium4
-	default "i686"		if BR2_x86_pentium_m
-	default "i686"		if BR2_x86_pentiumpro
-	default "i686"		if BR2_x86_prescott
-	default "i686"		if BR2_x86_nocona && BR2_i386
-	default "i686"		if BR2_x86_core2 && BR2_i386
-	default "i686"		if BR2_x86_atom && BR2_i386
-	default "i686"		if BR2_x86_opteron && BR2_i386
-	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
-	default "i686"		if BR2_x86_barcelona && BR2_i386
-	default "i686"		if BR2_x86_k6
-	default "i686"		if BR2_x86_k6_2
-	default "i686"		if BR2_x86_athlon
-	default "i686"		if BR2_x86_athlon_4
-	default "x86_64"	if BR2_x86_64
-	default "m68k"		if BR2_m68k
-	default "microblaze"	if BR2_microblaze
-	default "mips"		if BR2_mips
-	default "mipsel"	if BR2_mipsel
-	default "mips64"	if BR2_mips64
-	default "mips64el"	if BR2_mips64el
-	default "powerpc"	if BR2_powerpc
-	default "sh2"		if BR2_sh2
-	default "sh2a"		if BR2_sh2a
-	default "sh3"		if BR2_sh3
-	default "sh3eb"		if BR2_sh3eb
-	default "sh4"		if BR2_sh4
-	default "sh4eb"		if BR2_sh4eb
-	default "sh4a"		if BR2_sh4a
-	default "sh4aeb"	if BR2_sh4aeb
-	default "sh64"		if BR2_sh64
-	default "sparc"		if BR2_sparc
-
-
-config BR2_ENDIAN
-	string
-	default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || BR2_mips64el || \
-			    BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_x86_64 || BR2_sh64 || \
-			    BR2_microblazeel
-	default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || BR2_mips64 || \
-			    BR2_powerpc || BR2_sh2 || BR2_sh2a || \
-			    BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc || \
-			    BR2_microblazebe
-
-config BR2_GCC_TARGET_TUNE
-	string
-	default i386		if BR2_x86_i386
-	default i486		if BR2_x86_i486
-	default i586		if BR2_x86_i586
-	default pentium-mmx	if BR2_x86_pentium_mmx
-	default i686		if BR2_x86_i686
-	default pentiumpro	if BR2_x86_pentiumpro
-	default pentium-m	if BR2_x86_pentium_m
-	default pentium2	if BR2_x86_pentium2
-	default pentium3	if BR2_x86_pentium3
-	default pentium4	if BR2_x86_pentium4
-	default prescott	if BR2_x86_prescott
-	default nocona		if BR2_x86_nocona
-	default core2		if BR2_x86_core2
-	default atom		if BR2_x86_atom
-	default k8		if BR2_x86_opteron
-	default k8-sse3		if BR2_x86_opteron_sse3
-	default barcelona	if BR2_x86_barcelona
-	default k6		if BR2_x86_k6
-	default k6-2		if BR2_x86_k6_2
-	default athlon		if BR2_x86_athlon
-	default athlon-4	if BR2_x86_athlon_4
-	default winchip-c6	if BR2_x86_winchip_c6
-	default winchip2	if BR2_x86_winchip2
-	default c3		if BR2_x86_c3
-	default c3-2		if BR2_x86_c32
-	default geode		if BR2_x86_geode
-	default generic		if BR2_x86_generic
-	default arm600		if BR2_arm600
-	default arm610		if BR2_arm610
-	default arm620		if BR2_arm620
-	default arm7tdmi	if BR2_arm7tdmi
-	default arm7tdmi	if BR2_arm720t
-	default arm7tdmi	if BR2_arm740t
-	default arm920		if BR2_arm920
-	default arm920t		if BR2_arm920t
-	default arm922t		if BR2_arm922t
-	default arm926ej-s	if BR2_arm926t
-	default arm1136j-s	if BR2_arm1136j_s
-	default arm1136jf-s	if BR2_arm1136jf_s
-	default arm1176jz-s	if BR2_arm1176jz_s
-	default arm1176jzf-s	if BR2_arm1176jzf_s
-	default cortex-a8	if BR2_cortex_a8
-	default cortex-a9	if BR2_cortex_a9
-	default strongarm110	if BR2_sa110
-	default strongarm1100	if BR2_sa1100
-	default xscale		if BR2_xscale
-	default iwmmxt		if BR2_iwmmxt
-	default 68000		if BR2_m68k_68000
-	default 68010		if BR2_m68k_68010
-	default 68020		if BR2_m68k_68020
-	default 68030		if BR2_m68k_68030
-	default 68040		if BR2_m68k_68040
-	default 68060		if BR2_m68k_68060
-	default mips1		if BR2_mips_1
-	default mips2		if BR2_mips_2
-	default mips3		if BR2_mips_3
-	default mips4		if BR2_mips_4
-	default mips32		if BR2_mips_32
-	default mips32r2	if BR2_mips_32r2
-	default mips64		if BR2_mips_64
-	default mips64r2	if BR2_mips_64r2
-	default 401		if BR2_powerpc_401
-	default 403		if BR2_powerpc_403
-	default 405		if BR2_powerpc_405
-	default 405fp		if BR2_powerpc_405fp
-	default 440		if BR2_powerpc_440
-	default 440fp		if BR2_powerpc_440fp
-	default 505		if BR2_powerpc_505
-	default 601		if BR2_powerpc_601
-	default 602		if BR2_powerpc_602
-	default 603		if BR2_powerpc_603
-	default 603e		if BR2_powerpc_603e
-	default 604		if BR2_powerpc_604
-	default 604e		if BR2_powerpc_604e
-	default 620		if BR2_powerpc_620
-	default 630		if BR2_powerpc_630
-	default 740		if BR2_powerpc_740
-	default 7400		if BR2_powerpc_7400
-	default 7450		if BR2_powerpc_7450
-	default 750		if BR2_powerpc_750
-	default 801		if BR2_powerpc_801
-	default 821		if BR2_powerpc_821
-	default 823		if BR2_powerpc_823
-	default 860		if BR2_powerpc_860
-	default 970		if BR2_powerpc_970
-	default 8540		if BR2_powerpc_8540
-	default	8548		if BR2_powerpc_8548
-	default e300c2		if BR2_powerpc_e300c2
-	default e300c3		if BR2_powerpc_e300c3
-	default e500mc		if BR2_powerpc_e500mc
-	default v7		if BR2_sparc_v7
-	default cypress		if BR2_sparc_cypress
-	default v8		if BR2_sparc_v8
-	default supersparc	if BR2_sparc_supersparc
-	default hypersparc	if BR2_sparc_hypersparc
-	default sparclite	if BR2_sparc_sparclite
-	default f930		if BR2_sparc_f930
-	default f934		if BR2_sparc_f934
-	default sparclite86x	if BR2_sparc_sparclite86x
-	default sparclet	if BR2_sparc_sparclet
-	default tsc701		if BR2_sparc_tsc701
-	default v9		if BR2_sparc_v9
-	default v9		if BR2_sparc_v9a
-	default v9		if BR2_sparc_v9b
-	default ultrasparc	if BR2_sparc_ultrasparc
-	default ultrasparc3	if BR2_sparc_ultrasparc3
-	default niagara		if BR2_sparc_niagara
-
-config BR2_GCC_TARGET_ARCH
-	string
-	default i386		if BR2_x86_i386
-	default i486		if BR2_x86_i486
-	default i586		if BR2_x86_i586
-	default pentium-mmx	if BR2_x86_pentium_mmx
-	default i686		if BR2_x86_i686
-	default pentiumpro	if BR2_x86_pentiumpro
-	default pentium-m	if BR2_x86_pentium_m
-	default pentium2	if BR2_x86_pentium2
-	default pentium3	if BR2_x86_pentium3
-	default pentium4	if BR2_x86_pentium4
-	default prescott	if BR2_x86_prescott
-	default nocona		if BR2_x86_nocona
-	default core2		if BR2_x86_core2
-	default atom		if BR2_x86_atom
-	default k8		if BR2_x86_opteron
-	default k8-sse3		if BR2_x86_opteron_sse3
-	default barcelona	if BR2_x86_barcelona
-	default k6		if BR2_x86_k6
-	default k6-2		if BR2_x86_k6_2
-	default athlon		if BR2_x86_athlon
-	default athlon-4	if BR2_x86_athlon_4
-	default winchip-c6	if BR2_x86_winchip_c6
-	default winchip2	if BR2_x86_winchip2
-	default c3		if BR2_x86_c3
-	default c3-2		if BR2_x86_c32
-	default geode		if BR2_x86_geode
-	default armv4t		if BR2_arm7tdmi
-	default armv3		if BR2_arm610
-	default armv3		if BR2_arm710
-	default armv4t		if BR2_arm720t
-	default armv4t		if BR2_arm920t
-	default armv4t		if BR2_arm922t
-	default armv5te		if BR2_arm926t
-	default armv5t		if BR2_arm10t
-	default armv6j		if BR2_arm1136jf_s
-	default armv6zk		if BR2_arm1176jz_s
-	default armv6zk		if BR2_arm1176jzf_s
-	default armv7-a		if BR2_cortex_a8
-	default armv7-a		if BR2_cortex_a9
-	default armv4		if BR2_sa110
-	default armv4		if BR2_sa1100
-	default armv5te		if BR2_xscale
-	default iwmmxt		if BR2_iwmmxt
-	default 68000		if BR2_m68k_68000
-	default 68010		if BR2_m68k_68010
-	default 68020		if BR2_m68k_68020
-	default 68030		if BR2_m68k_68030
-	default 68040		if BR2_m68k_68040
-	default 68060		if BR2_m68k_68060
-
-config BR2_GCC_TARGET_ABI
-	string
-	default apcs-gnu	if BR2_ARM_OABI
-	default aapcs-linux	if BR2_ARM_EABI
-	default 32		if BR2_MIPS_OABI32
-	default n32		if BR2_MIPS_NABI32
-	default 64		if BR2_MIPS_NABI64
-	default altivec		if BR2_powerpc && BR2_PPC_ABI_altivec
-	default no-altivec	if BR2_powerpc && BR2_PPC_ABI_no-altivec
-	default spe		if BR2_powerpc && BR2_PPC_ABI_spe
-	default no-spe		if BR2_powerpc && BR2_PPC_ABI_no-spe
-	default ibmlongdouble	if BR2_powerpc && BR2_PPC_ABI_ibmlongdouble
-	default ieeelongdouble	if BR2_powerpc && BR2_PPC_ABI_ieeelongdouble
-
-config BR2_GCC_TARGET_CPU
-	string
-	default sparchfleon	if BR2_sparc_sparchfleon
-	default sparchfleonv8	if BR2_sparc_sparchfleonv8
-	default sparcsfleon	if BR2_sparc_sparcsfleon
-	default sparcsfleonv8	if BR2_sparc_sparcsfleonv8
diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
new file mode 100644
index 0000000..b3d95b7
--- /dev/null
+++ b/arch/Config.in.m68k
@@ -0,0 +1,21 @@
+config BR2_ARCH
+	default "m68k"		if BR2_m68k
+
+config BR2_ENDIAN
+	default "BIG"
+
+config BR2_GCC_TARGET_TUNE
+	default 68000		if BR2_m68k_68000
+	default 68010		if BR2_m68k_68010
+	default 68020		if BR2_m68k_68020
+	default 68030		if BR2_m68k_68030
+	default 68040		if BR2_m68k_68040
+	default 68060		if BR2_m68k_68060
+
+config BR2_GCC_TARGET_ARCH
+	default 68000		if BR2_m68k_68000
+	default 68010		if BR2_m68k_68010
+	default 68020		if BR2_m68k_68020
+	default 68030		if BR2_m68k_68030
+	default 68040		if BR2_m68k_68040
+	default 68060		if BR2_m68k_68060
diff --git a/arch/Config.in.microblaze b/arch/Config.in.microblaze
new file mode 100644
index 0000000..dbdd99a
--- /dev/null
+++ b/arch/Config.in.microblaze
@@ -0,0 +1,10 @@
+config BR2_ARCH
+	default "microblaze"
+
+config BR2_ENDIAN
+	default "LITTLE" if BR2_microblazeel
+	default "BIG"	 if BR2_microblazebe
+
+config BR2_microblaze
+	bool
+	default y if BR2_microblazeel || BR2_microblazebe
diff --git a/arch/Config.in.mips b/arch/Config.in.mips
index 93a21bf..c71c3f4 100644
--- a/arch/Config.in.mips
+++ b/arch/Config.in.mips
@@ -51,3 +51,28 @@ config BR2_MIPS_NABI64
 	bool "n64"
 	depends on BR2_ARCH_IS_64
 endchoice
+
+config BR2_ARCH
+	default "mips"		if BR2_mips
+	default "mipsel"	if BR2_mipsel
+	default "mips64"	if BR2_mips64
+	default "mips64el"	if BR2_mips64el
+
+config BR2_ENDIAN
+	default "LITTLE"	if BR2_mipsel || BR2_mips64el
+	default "BIG" 	    	if BR2_mips || BR2_mips64
+
+config BR2_GCC_TARGET_TUNE
+	default mips1		if BR2_mips_1
+	default mips2		if BR2_mips_2
+	default mips3		if BR2_mips_3
+	default mips4		if BR2_mips_4
+	default mips32		if BR2_mips_32
+	default mips32r2	if BR2_mips_32r2
+	default mips64		if BR2_mips_64
+	default mips64r2	if BR2_mips_64r2
+
+config BR2_GCC_TARGET_ABI
+	default 32		if BR2_MIPS_OABI32
+	default n32		if BR2_MIPS_NABI32
+	default 64		if BR2_MIPS_NABI64
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 20b0b06..55c1651 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -81,3 +81,48 @@ config BR2_powerpc_SPE
 	bool "SPE"
 	depends on BR2_powerpc_8540 || BR2_powerpc_8548
 endchoice
+
+config BR2_ARCH
+	default "powerpc"	if BR2_powerpc
+
+config BR2_ENDIAN
+	default "BIG"
+
+config BR2_GCC_TARGET_TUNE
+	default 401		if BR2_powerpc_401
+	default 403		if BR2_powerpc_403
+	default 405		if BR2_powerpc_405
+	default 405fp		if BR2_powerpc_405fp
+	default 440		if BR2_powerpc_440
+	default 440fp		if BR2_powerpc_440fp
+	default 505		if BR2_powerpc_505
+	default 601		if BR2_powerpc_601
+	default 602		if BR2_powerpc_602
+	default 603		if BR2_powerpc_603
+	default 603e		if BR2_powerpc_603e
+	default 604		if BR2_powerpc_604
+	default 604e		if BR2_powerpc_604e
+	default 620		if BR2_powerpc_620
+	default 630		if BR2_powerpc_630
+	default 740		if BR2_powerpc_740
+	default 7400		if BR2_powerpc_7400
+	default 7450		if BR2_powerpc_7450
+	default 750		if BR2_powerpc_750
+	default 801		if BR2_powerpc_801
+	default 821		if BR2_powerpc_821
+	default 823		if BR2_powerpc_823
+	default 860		if BR2_powerpc_860
+	default 970		if BR2_powerpc_970
+	default 8540		if BR2_powerpc_8540
+	default	8548		if BR2_powerpc_8548
+	default e300c2		if BR2_powerpc_e300c2
+	default e300c3		if BR2_powerpc_e300c3
+	default e500mc		if BR2_powerpc_e500mc
+
+config BR2_GCC_TARGET_ABI
+	default altivec		if BR2_PPC_ABI_altivec
+	default no-altivec	if BR2_PPC_ABI_no-altivec
+	default spe		if BR2_PPC_ABI_spe
+	default no-spe		if BR2_PPC_ABI_no-spe
+	default ibmlongdouble	if BR2_PPC_ABI_ibmlongdouble
+	default ieeelongdouble	if BR2_PPC_ABI_ieeelongdouble
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index 314c55a..cf70fd5 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -22,3 +22,20 @@ config BR2_sh4a
 config BR2_sh4aeb
 	bool "sh4aeb (SH4A big endian)"
 endchoice
+
+config BR2_ARCH
+	default "sh2"		if BR2_sh2
+	default "sh2a"		if BR2_sh2a
+	default "sh3"		if BR2_sh3
+	default "sh3eb"		if BR2_sh3eb
+	default "sh4"		if BR2_sh4
+	default "sh4eb"		if BR2_sh4eb
+	default "sh4a"		if BR2_sh4a
+	default "sh4aeb"	if BR2_sh4aeb
+	default "sh64"		if BR2_sh64
+
+config BR2_ENDIAN
+	default "LITTLE"	if BR2_sh3 || BR2_sh4 || BR2_sh4a || \
+				   BR2_x86_64 || BR2_sh64
+	default "BIG"		if BR2_sh2 || BR2_sh2a || BR2_sh3eb || \
+				   BR2_sh4eb || BR2_sh4aeb
diff --git a/arch/Config.in.sparc b/arch/Config.in.sparc
index 85e0833..d810b75 100644
--- a/arch/Config.in.sparc
+++ b/arch/Config.in.sparc
@@ -36,3 +36,34 @@ config BR2_sparc_sparclet
 config BR2_sparc_tsc701
 	bool "tsc701"
 endchoice
+
+config BR2_ARCH
+	default "sparc"	if BR2_sparc
+
+config BR2_ENDIAN
+	default "BIG"
+
+config BR2_GCC_TARGET_TUNE
+	default v7		if BR2_sparc_v7
+	default cypress		if BR2_sparc_cypress
+	default v8		if BR2_sparc_v8
+	default supersparc	if BR2_sparc_supersparc
+	default hypersparc	if BR2_sparc_hypersparc
+	default sparclite	if BR2_sparc_sparclite
+	default f930		if BR2_sparc_f930
+	default f934		if BR2_sparc_f934
+	default sparclite86x	if BR2_sparc_sparclite86x
+	default sparclet	if BR2_sparc_sparclet
+	default tsc701		if BR2_sparc_tsc701
+	default v9		if BR2_sparc_v9
+	default v9		if BR2_sparc_v9a
+	default v9		if BR2_sparc_v9b
+	default ultrasparc	if BR2_sparc_ultrasparc
+	default ultrasparc3	if BR2_sparc_ultrasparc3
+	default niagara		if BR2_sparc_niagara
+
+config BR2_GCC_TARGET_CPU
+	default sparchfleon	if BR2_sparc_sparchfleon
+	default sparchfleonv8	if BR2_sparc_sparchfleonv8
+	default sparcsfleon	if BR2_sparc_sparcsfleon
+	default sparcsfleonv8	if BR2_sparc_sparcsfleonv8
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 4f32d74..ef29a71 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -144,3 +144,92 @@ config BR2_x86_winchip2
 	select BR2_X86_CPU_HAS_MMX
 	depends on !BR2_x86_64
 endchoice
+
+config BR2_ARCH
+	default "i386"		if BR2_x86_i386
+	default "i486"		if BR2_x86_i486
+	default "i586"		if BR2_x86_i586
+	default "i586"		if BR2_x86_pentium_mmx
+	default "i586"		if BR2_x86_geode
+	default "i586"		if BR2_x86_c3
+	default "i686"		if BR2_x86_c32
+	default "i586"		if BR2_x86_winchip_c6
+	default "i586"		if BR2_x86_winchip2
+	default "i686"		if BR2_x86_i686
+	default "i686"		if BR2_x86_pentium2
+	default "i686"		if BR2_x86_pentium3
+	default "i686"		if BR2_x86_pentium4
+	default "i686"		if BR2_x86_pentium_m
+	default "i686"		if BR2_x86_pentiumpro
+	default "i686"		if BR2_x86_prescott
+	default "i686"		if BR2_x86_nocona && BR2_i386
+	default "i686"		if BR2_x86_core2 && BR2_i386
+	default "i686"		if BR2_x86_atom && BR2_i386
+	default "i686"		if BR2_x86_opteron && BR2_i386
+	default "i686"		if BR2_x86_opteron_sse3 && BR2_i386
+	default "i686"		if BR2_x86_barcelona && BR2_i386
+	default "i686"		if BR2_x86_k6
+	default "i686"		if BR2_x86_k6_2
+	default "i686"		if BR2_x86_athlon
+	default "i686"		if BR2_x86_athlon_4
+	default "x86_64"	if BR2_x86_64
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_GCC_TARGET_TUNE
+	default i386		if BR2_x86_i386
+	default i486		if BR2_x86_i486
+	default i586		if BR2_x86_i586
+	default pentium-mmx	if BR2_x86_pentium_mmx
+	default i686		if BR2_x86_i686
+	default pentiumpro	if BR2_x86_pentiumpro
+	default pentium-m	if BR2_x86_pentium_m
+	default pentium2	if BR2_x86_pentium2
+	default pentium3	if BR2_x86_pentium3
+	default pentium4	if BR2_x86_pentium4
+	default prescott	if BR2_x86_prescott
+	default nocona		if BR2_x86_nocona
+	default core2		if BR2_x86_core2
+	default atom		if BR2_x86_atom
+	default k8		if BR2_x86_opteron
+	default k8-sse3		if BR2_x86_opteron_sse3
+	default barcelona	if BR2_x86_barcelona
+	default k6		if BR2_x86_k6
+	default k6-2		if BR2_x86_k6_2
+	default athlon		if BR2_x86_athlon
+	default athlon-4	if BR2_x86_athlon_4
+	default winchip-c6	if BR2_x86_winchip_c6
+	default winchip2	if BR2_x86_winchip2
+	default c3		if BR2_x86_c3
+	default c3-2		if BR2_x86_c32
+	default geode		if BR2_x86_geode
+	default generic		if BR2_x86_generic
+
+config BR2_GCC_TARGET_ARCH
+	default i386		if BR2_x86_i386
+	default i486		if BR2_x86_i486
+	default i586		if BR2_x86_i586
+	default pentium-mmx	if BR2_x86_pentium_mmx
+	default i686		if BR2_x86_i686
+	default pentiumpro	if BR2_x86_pentiumpro
+	default pentium-m	if BR2_x86_pentium_m
+	default pentium2	if BR2_x86_pentium2
+	default pentium3	if BR2_x86_pentium3
+	default pentium4	if BR2_x86_pentium4
+	default prescott	if BR2_x86_prescott
+	default nocona		if BR2_x86_nocona
+	default core2		if BR2_x86_core2
+	default atom		if BR2_x86_atom
+	default k8		if BR2_x86_opteron
+	default k8-sse3		if BR2_x86_opteron_sse3
+	default barcelona	if BR2_x86_barcelona
+	default k6		if BR2_x86_k6
+	default k6-2		if BR2_x86_k6_2
+	default athlon		if BR2_x86_athlon
+	default athlon-4	if BR2_x86_athlon_4
+	default winchip-c6	if BR2_x86_winchip_c6
+	default winchip2	if BR2_x86_winchip2
+	default c3		if BR2_x86_c3
+	default c3-2		if BR2_x86_c32
+	default geode		if BR2_x86_geode
-- 
1.7.9.5
