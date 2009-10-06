From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue,  6 Oct 2009 20:26:06 +0200
Subject: [Buildroot] [PATCH 4/6] improve arch selection and gcc setup
In-Reply-To: <6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
References: <cover.1254853146.git.rep.dot.nop@gmail.com>
	<1a6b4f990a536bfd23ae1e57a2cd11527761f8ec.1254853146.git.rep.dot.nop@gmail.com>
	<4a5a0f10dbaecfd7b024c0cf1e90fd68a6730eac.1254853146.git.rep.dot.nop@gmail.com>
	<6fe0ac8fa1f42152f604ca708aff08b8f119073a.1254853146.git.rep.dot.nop@gmail.com>
Message-ID: <582a63d745311a980a8700a2a0ec17c3ae0f5ca9.1254853146.git.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 package/Makefile.in             |    4 +-
 target/Config.in.arch           |  674 +++++++++++++++++++++++++++++++++++----
 toolchain/Config.in.2           |   12 +
 toolchain/gcc/Makefile.in       |   25 ++-
 toolchain/gcc/gcc-uclibc-4.x.mk |    9 +-
 5 files changed, 652 insertions(+), 72 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index fc7b312..0ffd22c 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -110,7 +110,7 @@ TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 
 # Quotes are needed for spaces et al in path components.
 TARGET_PATH="$(TOOLCHAIN_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ARCH_MMU_SUFFIX)$(ROOTFS_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 TARGET_CROSS=$(STAGING_DIR)/usr/bin/$(REAL_GNU_TARGET_NAME)-
@@ -121,7 +121,7 @@ TOOLCHAIN_EXTERNAL_PATH:=$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PATH))
 TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(TOOLCHAIN_DIR)/bin:$(TOOLCHAIN_EXTERNAL_PATH)/bin:$(PATH)"
 #IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(TOOLCHAIN_EXTERNAL_PREFIX)$(ROOTFS_SUFFIX)
-IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
+IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(ARCH_FPU_SUFFIX)$(ARCH_MMU_SUFFIX)$(ROOTFS_SUFFIX)
 
 REAL_GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
 GNU_TARGET_NAME=$(TOOLCHAIN_EXTERNAL_PREFIX)
diff --git a/target/Config.in.arch b/target/Config.in.arch
index e82c8f4..3b3a809 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -14,6 +14,8 @@ config BR2_armeb
 config BR2_avr32
 	bool "avr32"
 	select BR2_SOFT_FLOAT
+config BR2_bfin
+	bool "bfin"
 config BR2_cris
 	bool "cris"
 config BR2_ia64
@@ -23,7 +25,6 @@ config BR2_i386
 	bool "i386"
 config BR2_m68k
 	bool "m68k"
-	depends on BROKEN # ice in uclibc / inet_ntoa_r
 config BR2_mips
 	bool "mips"
 config BR2_mipsel
@@ -33,6 +34,8 @@ config BR2_nios2
 	depends on BROKEN # no kernel headers
 config BR2_powerpc
 	bool "powerpc"
+config BR2_s390
+	bool "s390"
 config BR2_sh
 	bool "superh"
 config BR2_sh64
@@ -136,7 +139,7 @@ choice
 	default BR2_mips_1 if BR2_mipsel
 	help
 	  Specific CPU variant to use
-	
+
 	  64bit cabable: 3, 4, 64, 64r2
 	  non-64bit capable: 1, 2, 32, 32r2
 
@@ -232,49 +235,70 @@ config BR2_x86_i686
 	bool "i686"
 config BR2_x86_pentiumpro
 	bool "pentium pro"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_pentium_mmx
 	bool "pentium MMX"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_pentium_m
 	bool "pentium mobile"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_pentium2
 	bool "pentium2"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_pentium3
 	bool "pentium3"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_pentium4
 	bool "pentium4"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_prescott
 	bool "prescott"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_nocona
 	bool "nocona"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_core2
 	bool "core2"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_k6
 	bool "k6"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_k6_2
 	bool "k6-2"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_athlon
 	bool "athlon"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_athlon_4
 	bool "athlon-4"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_opteron
 	bool "opteron"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_opteron_sse3
 	bool "opteron w/ SSE3"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_barcelona
 	bool "barcelona"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_geode
 	bool "geode"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_c3
 	bool "cyrix 3 (MMX + 3dNOW!)"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_winchip_c6
 	bool "IDT winchip C6 (i486 + slow MMX)"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 config BR2_x86_winchip2
 	bool "IDT winchip2 (i486 +MMX +SSE)"
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 endchoice
 
 choice
 	prompt "Target Architecture Variant"
 	depends on BR2_x86_64
+	depends on BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	default BR2_x86_64_generic
 	help
 	  Specific CPU variant to use
@@ -316,6 +340,25 @@ endchoice
 
 choice
 	prompt "Target Architecture Variant"
+	depends on BR2_s390
+	default BR2_s390_g5
+	help
+	  Specific CPU variant to use
+
+config BR2_s390_g5
+	bool "g5"
+config BR2_s390_g6
+	bool "g6"
+config BR2_s390_z900
+	bool "z900"
+config BR2_s390_z990
+	bool "z990"
+config BR2_s390_z9_109
+	bool "z9_109"
+endchoice
+
+choice
+	prompt "Target Architecture Variant"
 	depends on BR2_sparc
 	default BR2_sparc_v7
 	help
@@ -401,38 +444,6 @@ endchoice
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_xtensa
-	default BR2_xtensa_dc232b
-	help
-	  Specific CPU variant to use
-
-config BR2_xtensa_custom
-	bool "Custom Xtensa processor configuration"
-config BR2_xtensa_dc232a
-	bool "dc232a - Diamond 232L Standard Core Rev.A (LE)"
-config BR2_xtensa_dc232b
-	bool "dc232b - Diamond 232L Standard Core Rev.B (LE)"
-#config BR2_xtensa_s5000
-#	bool "s5000 - Stretch S5000"
-endchoice
-
-config BR2_xtensa_custom_name
-	string "Custom Xtensa processor configuration name"
-	depends on BR2_xtensa_custom
-	default ""
-	help
-	  Name given to a custom Xtensa processor configuration.
-	  This is used to select the correct overlay.
-
-config BR2_xtensa_core_name
-	string
-	default BR2_xtensa_custom_name	if BR2_xtensa_custom
-	default "dc232a"		if BR2_xtensa_dc232a
-	default "dc232b"		if BR2_xtensa_dc232b
-#	default "s5000"			if BR2_xtensa_s5000
-
-choice
-	prompt "Target Architecture Variant"
 	depends on BR2_powerpc
 	default BR2_generic_powerpc
 	help
@@ -441,16 +452,25 @@ config BR2_generic_powerpc
 	bool "generic"
 config BR2_powerpc_401
 	bool "401"
+	select BR2_SOFT_FLOAT_FORCE
 config BR2_powerpc_403
 	bool "403"
+	select BR2_SOFT_FLOAT_FORCE
 config BR2_powerpc_405
 	bool "405"
+	select BR2_SOFT_FLOAT_FORCE
 config BR2_powerpc_405fp
 	bool "405 with FPU"
 config BR2_powerpc_440
 	bool "440"
+	select BR2_SOFT_FLOAT_FORCE
 config BR2_powerpc_440fp
 	bool "440 with FPU"
+config BR2_powerpc_464
+	bool "464"
+	select BR2_SOFT_FLOAT_FORCE
+config BR2_powerpc_464fp
+	bool "464 with FPU"
 config BR2_powerpc_505
 	bool "505"
 config BR2_powerpc_601
@@ -479,17 +499,421 @@ config BR2_powerpc_750
 	bool "750"
 config BR2_powerpc_801
 	bool "801"
+	select BR2_SOFT_FLOAT_FORCE
 config BR2_powerpc_821
 	bool "821"
+	select BR2_SOFT_FLOAT_FORCE
 config BR2_powerpc_823
 	bool "823"
+	select BR2_SOFT_FLOAT_FORCE
+config BR2_powerpc_8540
+	bool "8540"
+config BR2_powerpc_e300c2
+	bool "e300c2"
+	select BR2_SOFT_FLOAT_FORCE
+config BR2_powerpc_e300c3
+	bool "e300c3"
+config BR2_powerpc_e500mc
+	bool "e500mc"
 config BR2_powerpc_860
 	bool "860"
+	select BR2_SOFT_FLOAT_FORCE
 config BR2_powerpc_970
 	bool "970"
-config BR2_powerpc_8540
-	bool "8540"
+config BR2_powerpc_cell
+	bool "cell"
+endchoice
+
+choice
+	prompt "Target Architecture Variant"
+	depends on BR2_bfin
+	default BR2_bf537
+	help
+	  Specific CPU variant to use
+config BR2_bf522
+	bool "bf522"
+config BR2_bf525
+	bool "bf525"
+config BR2_bf527
+	bool "bf527"
+config BR2_bf531
+	bool "bf531"
+config BR2_bf532
+	bool "bf532"
+config BR2_bf533
+	bool "bf533"
+config BR2_bf534
+	bool "bf534"
+config BR2_bf536
+	bool "bf536"
+config BR2_bf537
+	bool "bf537"
+config BR2_bf538
+	bool "bf538"
+config BR2_bf539
+	bool "bf539"
+config BR2_bf542
+	bool "bf542"
+config BR2_bf544
+	bool "bf544"
+config BR2_bf548
+	bool "bf548"
+config BR2_bf549
+	bool "bf549"
+config BR2_bf561
+	bool "bf561"
+endchoice
+
+config BR2_bfin_sirevision
+	string "sirevision"
+	depends on BR2_bfin
+	default any
+	help
+	  If sirevision is none, no workarounds are enabled.
+	  If sirevision is any, all workarounds for the targeted
+	  processor will be enabled.
+	  See man gcc for details.
+
+	  Default: any
+
+choice
+	prompt "Target Architecture Variant"
+	depends on BR2_cris
+	default BR2_cris_cris
+	help
+	  Architecture variant.
+config BR2_cris_cris
+	bool "cris"
+config BR2_cris_crisv32
+	bool "crisv32"
+endchoice
+choice
+	prompt "Target CPU Variant"
+	depends on BR2_cris
+	default BR2_cris_generic
+	help
+	  CPU variant.
+config BR2_cris_generic
+	bool "generic (v10)"
+config BR2_cris_unknown
+	bool "unknown (v0)"
+config BR2_cris_etrax_4
+	bool "etrax_4 (v3)"
+config BR2_cris_etrax_100
+	bool "etrax_100 (v8)"
+config BR2_cris_etrax_100lx
+	bool "etrax_100lx (v10)"
+endchoice
+
+choice
+	prompt "Target Type"
+	depends on BR2_m68k
+	default BR2_m68k_type_m68k
+	help
+	  Specific architecture type to use
+
+config BR2_m68k_type_m68k
+	bool "m68k / M680x0"
+	help
+	  Normal 680xx
+
+config BR2_m68k_type_coldfire
+	bool "coldfire / 520X"
+	help
+	  ColdFire
+
+	  Family | CPUs
+
+	  51qe		51qe
+	  5206		5202 5204 5206
+	  5206e		5206e
+	  5208		5207 5208
+	  5211a		5210a 5211a
+	  5213		5211 5212 5213
+	  5216		5214 5216
+	  52235		52230 52231 52232 52233 52234 52235
+	  5225		5224 5225
+	  5235		5232 5233 5234 5235 523x
+	  5249		5249
+	  5250		5250
+	  5271		5270 5271
+	  5272		5272
+	  5275		5274 5275
+	  5282		5280 5281 5282 528x
+	  5307		5307
+	  5329		5327 5328 5329 532x
+	  5373		5372 5373 537x
+	  5407		5407
+	  5475		5470 5471 5472 5473 5474 5475 547x 5480 5481 5482 5483 5484 5485
+endchoice
+
+if BR2_m68k_type_m68k
+choice
+	prompt "Target CPU Variant"
+	depends on BR2_m68k
+	default BR2_m68k_cpu_m68k_none
+	help
+	  Specific CPU variant to use
+
+config BR2_m68k_cpu_m68k_none
+	bool "none"
+	help
+	  Select this dummy if you do not want to use a specific CPU.
+
+config BR2_m68k_cpu_68000
+	bool "68000"
+	select BR2_HAVE_NOMMU
+config BR2_m68k_cpu_68010
+	bool "68010"
+	select BR2_HAVE_NOMMU
+config BR2_m68k_cpu_68020
+	bool "68020"
+config BR2_m68k_cpu_68030
+	bool "68030"
+config BR2_m68k_cpu_68040
+	bool "68040"
+config BR2_m68k_cpu_68060
+	bool "68060"
+config BR2_m68k_cpu_68302
+	bool "68302"
+config BR2_m68k_cpu_68332
+	bool "68332"
+config BR2_m68k_cpu_cpu32
+	bool "cpu32"
 endchoice
+endif
+
+if BR2_m68k_type_coldfire
+choice
+	prompt "Target CPU Variant"
+	depends on BR2_m68k
+	default BR2_m68k_cpu_coldfire_none
+	help
+	  Specific CPU variant to use
+
+config BR2_m68k_cpu_coldfire_none
+	bool "none"
+	help
+	  Select this dummy if you do not want to use a specific CPU.
+
+config BR2_m68k_cpu_coldfire_51qe
+	bool "51qe"
+	select BR2_HAVE_NOMMU
+config BR2_m68k_cpu_coldfire_5202
+	bool "5202"
+	select BR2_HAVE_NOMMU
+config BR2_m68k_cpu_coldfire_5204
+	bool "5204"
+	select BR2_HAVE_NOMMU
+config BR2_m68k_cpu_coldfire_5206
+	bool "5206"
+	select BR2_HAVE_NOMMU
+config BR2_m68k_cpu_coldfire_5206e
+	bool "5206e"
+config BR2_m68k_cpu_coldfire_5207
+	bool "5207"
+config BR2_m68k_cpu_coldfire_5208
+	bool "5208"
+config BR2_m68k_cpu_coldfire_5210a
+	bool "5210a"
+config BR2_m68k_cpu_coldfire_5211a
+	bool "5211a"
+config BR2_m68k_cpu_coldfire_5211
+	bool "5211"
+config BR2_m68k_cpu_coldfire_5212
+	bool "5212"
+config BR2_m68k_cpu_coldfire_5213
+	bool "5213"
+config BR2_m68k_cpu_coldfire_5214
+	bool "5214"
+config BR2_m68k_cpu_coldfire_5216
+	bool "5216"
+config BR2_m68k_cpu_coldfire_52230
+	bool "52230"
+config BR2_m68k_cpu_coldfire_52231
+	bool "52231"
+config BR2_m68k_cpu_coldfire_52232
+	bool "52232"
+config BR2_m68k_cpu_coldfire_52233
+	bool "52233"
+config BR2_m68k_cpu_coldfire_52234
+	bool "52234"
+config BR2_m68k_cpu_coldfire_52235
+	bool "52235"
+config BR2_m68k_cpu_coldfire_5224
+	bool "5224"
+config BR2_m68k_cpu_coldfire_5225
+	bool "5225"
+config BR2_m68k_cpu_coldfire_5232
+	bool "5232"
+config BR2_m68k_cpu_coldfire_5233
+	bool "5233"
+config BR2_m68k_cpu_coldfire_5234
+	bool "5234"
+config BR2_m68k_cpu_coldfire_5235
+	bool "5235"
+config BR2_m68k_cpu_coldfire_523x
+	bool "523x"
+config BR2_m68k_cpu_coldfire_5249
+	bool "5249"
+config BR2_m68k_cpu_coldfire_5250
+	bool "5250"
+config BR2_m68k_cpu_coldfire_5270
+	bool "5270"
+config BR2_m68k_cpu_coldfire_5271
+	bool "5271"
+config BR2_m68k_cpu_coldfire_5272
+	bool "5272"
+config BR2_m68k_cpu_coldfire_5274
+	bool "5274"
+config BR2_m68k_cpu_coldfire_5275
+	bool "5275"
+config BR2_m68k_cpu_coldfire_5280
+	bool "5280"
+config BR2_m68k_cpu_coldfire_5281
+	bool "5281"
+config BR2_m68k_cpu_coldfire_5282
+	bool "5282"
+config BR2_m68k_cpu_coldfire_528x
+	bool "528x"
+config BR2_m68k_cpu_coldfire_5307
+	bool "5307"
+config BR2_m68k_cpu_coldfire_5327
+	bool "5327"
+config BR2_m68k_cpu_coldfire_5328
+	bool "5328"
+config BR2_m68k_cpu_coldfire_5329
+	bool "5329"
+config BR2_m68k_cpu_coldfire_532x
+	bool "532x"
+config BR2_m68k_cpu_coldfire_5372
+	bool "5372"
+config BR2_m68k_cpu_coldfire_5373
+	bool "5373"
+config BR2_m68k_cpu_coldfire_537x
+	bool "537x"
+config BR2_m68k_cpu_coldfire_5407
+	bool "5407"
+config BR2_m68k_cpu_coldfire_5470
+	bool "5470"
+config BR2_m68k_cpu_coldfire_5471
+	bool "5471"
+config BR2_m68k_cpu_coldfire_5472
+	bool "5472"
+config BR2_m68k_cpu_coldfire_5473
+	bool "5473"
+config BR2_m68k_cpu_coldfire_5474
+	bool "5474"
+config BR2_m68k_cpu_coldfire_5475
+	bool "5475"
+config BR2_m68k_cpu_coldfire_547x
+	bool "547x"
+config BR2_m68k_cpu_coldfire_5480
+	bool "5480"
+config BR2_m68k_cpu_coldfire_5481
+	bool "5481"
+config BR2_m68k_cpu_coldfire_5482
+	bool "5482"
+config BR2_m68k_cpu_coldfire_5483
+	bool "5483"
+config BR2_m68k_cpu_coldfire_5484
+	bool "5484"
+config BR2_m68k_cpu_coldfire_5485
+	bool "5485"
+endchoice
+endif
+
+if 0
+choice
+	prompt "Target tune"
+	depends on BR2_m68k
+	default BR2_m68k_tune_none
+	help
+	  Specific CPU variant to generate code for per default
+config BR2_m68k_68000
+	bool "68000"
+	depends on BR2_m68k_type_m68k
+config BR2_m68k_68010
+	bool "68010"
+	depends on BR2_m68k_type_m68k
+config BR2_m68k_68020
+	bool "68020"
+	depends on BR2_m68k_type_m68k
+config BR2_m68k_68030
+	bool "68030"
+	depends on BR2_m68k_type_m68k
+config BR2_m68k_68040
+	bool "68040"
+	depends on BR2_m68k_type_m68k
+config BR2_m68k_68060
+	bool "68060"
+	depends on BR2_m68k_type_m68k
+config BR2_m68k_cpu32
+	bool "cpu32"
+	depends on BR2_m68k_type_m68k
+
+config BR2_m68k_cfv1
+	bool "cfv1"
+	depends on BR2_m68k_type_coldfire
+config BR2_m68k_cfv2
+	bool "cfv2"
+	depends on BR2_m68k_type_coldfire
+config BR2_m68k_cfv3
+	bool "cfv3"
+	depends on BR2_m68k_type_coldfire
+config BR2_m68k_cfv4
+	bool "cfv4"
+	depends on BR2_m68k_type_coldfire
+config BR2_m68k_cfv4e
+	bool "cfv4e"
+	depends on BR2_m68k_type_coldfire
+config BR2_m68k_tune_none
+	bool "none"
+config BR2_m68k_tune_tune
+	bool "specify tune manually"
+endchoice
+
+config BR2_m68k_tune
+	string "Manual target tune string"
+	depends on BR2_m68k_tune_tune
+	help
+	  You can also use e.g. "68020-40" for code that needs to run
+	  relatively well on 68020, 68030 and 68040 targets.
+	  "68020-60" would do the same but additionally include 68060.
+endif
+
+choice
+	prompt "Target Architecture Variant"
+	depends on BR2_xtensa
+	default BR2_xtensa_dc232b
+	help
+	 Specific CPU variant to use
+
+config BR2_xtensa_custom
+	bool "Custom Xtensa processor configuration"
+config BR2_xtensa_dc232a
+	bool "dc232a - Diamond 232L Standard Core Rev.A (LE)"
+config BR2_xtensa_dc232b
+	bool "dc232b - Diamond 232L Standard Core Rev.B (LE)"
+#config BR2_xtensa_s5000
+#	bool "s5000 - Stretch S5000"
+endchoice
+
+config BR2_xtensa_custom_name
+	string "Custom Xtensa processor configuration name"
+	depends on BR2_xtensa_custom
+	default ""
+	help
+	 Name given to a custom Xtensa processor configuration.
+	 This is used to select the correct overlay.
+
+config BR2_xtensa_core_name
+	string
+	depends on BR2_xtensa_custom
+	default BR2_xtensa_custom_name  if BR2_xtensa_custom
+	default "dc232a"                if BR2_xtensa_dc232a
+	default "dc232b"                if BR2_xtensa_dc232b
+#	default "s5000"                 if BR2_xtensa_s5000
 
 config BR2_ARCH
 	string
@@ -497,18 +921,20 @@ config BR2_ARCH
 	default "arm"		if BR2_arm
 	default "armeb"		if BR2_armeb
 	default "avr32"		if BR2_avr32
-	default "cris"		if BR2_cris
+	default "bfin"		if BR2_bfin
+	default "cris"		if BR2_cris_cris
+	default "crisv32"	if BR2_cris_crisv32
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
 	default "i586"		if BR2_x86_pentium_mmx
 	default "i586"		if BR2_x86_geode
 	default "i686"		if BR2_x86_i686
+	default "i686"		if BR2_x86_pentiumpro
 	default "i686"		if BR2_x86_pentium2
 	default "i686"		if BR2_x86_pentium3
-	default "i686"		if BR2_x86_pentium4
 	default "i686"		if BR2_x86_pentium_m
-	default "i686"		if BR2_x86_pentiumpro
+	default "i686"		if BR2_x86_pentium4
 	default "i686"		if BR2_x86_nocona
 	default "i686"		if BR2_x86_core2
 	default "ia64"		if BR2_ia64
@@ -517,6 +943,8 @@ config BR2_ARCH
 	default "mipsel"	if BR2_mipsel
 	default "nios2"		if BR2_nios2
 	default "powerpc"	if BR2_powerpc
+	default "s390"		if BR2_s390
+	default "s390"		if BR2_s390x
 	default "sh2a_nofpueb"	if BR2_sh2a_nofpueb
 	default "sh2eb"		if BR2_sh2eb
 	default "sh3"		if BR2_sh3
@@ -533,15 +961,15 @@ config BR2_ARCH
 	default "x86_64"	if BR2_x86_64_opteron
 	default "x86_64"	if BR2_x86_64_opteron_sse3
 	default "x86_64"	if BR2_x86_64_barcelona
-	default "xtensa"	if BR2_xtensa
 
 
 config BR2_ENDIAN
 	string
 	default "LITTLE" if BR2_arm || BR2_cris || BR2_i386 || BR2_mipsel || \
 			    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_nios2 || \
-			    BR2_sh64
-	default "BIG"    if BR2_alpha || BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
+			    BR2_sh64 || BR2_bfin
+	default "BIG"    if BR2_alpha || BR2_armeb || BR2_avr32 || BR2_m68k || \
+			    BR2_mips || \
 			    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
 			    BR2_sh3eb || BR2_sh4eb || BR2_sparc || BR2_sparc64
 
@@ -595,11 +1023,6 @@ config BR2_GCC_TARGET_TUNE
 	default strongarm1100	if BR2_sa1100
 	default xscale		if BR2_xscale
 	default iwmmxt		if BR2_iwmmxt
-	default v0		if BR2_cris_unknown
-	default v10		if BR2_cris_generic
-	default v3		if BR2_cris_etrax_4
-	default v8		if BR2_cris_etrax_100
-	default v10		if BR2_cris_etrax_100lx
 	default ev4		if BR2_alpha_21064
 	default ev5		if BR2_alpha_21164
 	default ev56		if BR2_alpha_21164a
@@ -608,12 +1031,6 @@ config BR2_GCC_TARGET_TUNE
 	default ev67		if BR2_alpha_21264a
 #	default itanium		if BR2_ia64_itanium1
 #	default itanium2	if BR2_ia64_itanium2
-	default 68000		if BR2_m68k_68000
-	default 68010		if BR2_m68k_68010
-	default 68020		if BR2_m68k_68020
-	default 68030		if BR2_m68k_68030
-	default 68040		if BR2_m68k_68040
-	default 68060		if BR2_m68k_68060
 	default mips1		if BR2_mips_1
 	default mips2		if BR2_mips_2
 	default mips3		if BR2_mips_3
@@ -623,12 +1040,14 @@ config BR2_GCC_TARGET_TUNE
 	default mips64		if BR2_mips_64
 	default mips64r2	if BR2_mips_64r2
 	default mips16		if BR2_mips_16
+	default common		if BR2_powerpc_generic
 	default 401		if BR2_powerpc_401
 	default 403		if BR2_powerpc_403
 	default 405		if BR2_powerpc_405
 	default 405fp		if BR2_powerpc_405fp
 	default 440		if BR2_powerpc_440
 	default 440fp		if BR2_powerpc_440fp
+	default 464		if BR2_powerpc_464
 	default 505		if BR2_powerpc_505
 	default 601		if BR2_powerpc_601
 	default 602		if BR2_powerpc_602
@@ -645,9 +1064,13 @@ config BR2_GCC_TARGET_TUNE
 	default 801		if BR2_powerpc_801
 	default 821		if BR2_powerpc_821
 	default 823		if BR2_powerpc_823
+	default 8540		if BR2_powerpc_8540
+	default e300c2		if BR2_powerpc_e300c2
+	default e300c3		if BR2_powerpc_e300c3
+	default e500mc		if BR2_powerpc_e500mc
 	default 860		if BR2_powerpc_860
 	default 970		if BR2_powerpc_970
-	default 8540		if BR2_powerpc_8540
+	default cell		if BR2_powerpc_cell
 	default v7		if BR2_sparc_v7
 	default cypress		if BR2_sparc_cypress
 	default v8		if BR2_sparc_v8
@@ -665,6 +1088,127 @@ config BR2_GCC_TARGET_TUNE
 	default ultrasparc	if BR2_sparc_ultrasparc || BR2_sparc64_ultrasparc
 	default ultrasparc3	if BR2_sparc_ultrasparc3 || BR2_sparc64_ultrasparc3
 	default niagara		if BR2_sparc_niagara || BR2_sparc64_niagara
+	default g5		if BR2_s390_g5
+	default g6		if BR2_s390_g6
+	default z900		if BR2_s390_z900
+	default z990		if BR2_s390_z990
+	default z9-109		if BR2_s390_z9_109
+config BR2_GCC_TARGET_FLAGS_TUNE
+	string
+	default 68000		if BR2_m68k_68000
+	default 68010		if BR2_m68k_68010
+	default 68020		if BR2_m68k_68020
+	default 68030		if BR2_m68k_68030
+	default 68040		if BR2_m68k_68040
+	default 68060		if BR2_m68k_68060
+	default cpu32		if BR2_m68k_cpu32
+	default cfv1		if BR2_m68k_cfv1
+	default cfv2		if BR2_m68k_cfv2
+	default cfv3		if BR2_m68k_cfv3
+	default cfv4		if BR2_m68k_cfv4
+	default cfv4e		if BR2_m68k_cfv4e
+	default $BR2_m68k_tune	if BR2_m68k_tune
+	default v0		if BR2_cris_unknown
+	default v10		if BR2_cris_generic
+	default v3		if BR2_cris_etrax_4
+	default v8		if BR2_cris_etrax_100
+	default v10		if BR2_cris_etrax_100lx
+	default $BR2_GCC_TARGET_TUNE if BR2_GCC_TARGET_TUNE
+
+config BR2_GCC_TARGET_CPU
+	string
+	default bf522		if BR2_bf522
+	default bf525		if BR2_bf525
+	default bf527		if BR2_bf527
+	default bf531		if BR2_bf531
+	default bf532		if BR2_bf532
+	default bf533		if BR2_bf533
+	default bf534		if BR2_bf534
+	default bf536		if BR2_bf536
+	default bf537		if BR2_bf537
+	default bf538		if BR2_bf538
+	default bf539		if BR2_bf539
+	default bf542		if BR2_bf542
+	default bf544		if BR2_bf544
+	default bf548		if BR2_bf548
+	default bf549		if BR2_bf549
+	default bf561		if BR2_bf561
+config BR2_GCC_TARGET_FLAGS_CPU
+	string
+	default 51qe		if BR2_m68k_cpu_coldfire_51qe
+	default 5202		if BR2_m68k_cpu_coldfire_5202
+	default 5204		if BR2_m68k_cpu_coldfire_5204
+	default 5206		if BR2_m68k_cpu_coldfire_5206
+	default 5206e		if BR2_m68k_cpu_coldfire_5206e
+	default 5207		if BR2_m68k_cpu_coldfire_5207
+	default 5208		if BR2_m68k_cpu_coldfire_5208
+	default 5210a		if BR2_m68k_cpu_coldfire_5210a
+	default 5211a		if BR2_m68k_cpu_coldfire_5211a
+	default 5211		if BR2_m68k_cpu_coldfire_5211
+	default 5212		if BR2_m68k_cpu_coldfire_5212
+	default 5213		if BR2_m68k_cpu_coldfire_5213
+	default 5214		if BR2_m68k_cpu_coldfire_5214
+	default 5216		if BR2_m68k_cpu_coldfire_5216
+	default 52230		if BR2_m68k_cpu_coldfire_52230
+	default 52231		if BR2_m68k_cpu_coldfire_52231
+	default 52232		if BR2_m68k_cpu_coldfire_52232
+	default 52233		if BR2_m68k_cpu_coldfire_52233
+	default 52234		if BR2_m68k_cpu_coldfire_52234
+	default 52235		if BR2_m68k_cpu_coldfire_52235
+	default 5224		if BR2_m68k_cpu_coldfire_5224
+	default 5225		if BR2_m68k_cpu_coldfire_5225
+	default 5232		if BR2_m68k_cpu_coldfire_5232
+	default 5233		if BR2_m68k_cpu_coldfire_5233
+	default 5234		if BR2_m68k_cpu_coldfire_5234
+	default 5235		if BR2_m68k_cpu_coldfire_5235
+	default 523x		if BR2_m68k_cpu_coldfire_523x
+	default 5249		if BR2_m68k_cpu_coldfire_5249
+	default 5250		if BR2_m68k_cpu_coldfire_5250
+	default 5270		if BR2_m68k_cpu_coldfire_5270
+	default 5271		if BR2_m68k_cpu_coldfire_5271
+	default 5272		if BR2_m68k_cpu_coldfire_5272
+	default 5274		if BR2_m68k_cpu_coldfire_5274
+	default 5275		if BR2_m68k_cpu_coldfire_5275
+	default 5280		if BR2_m68k_cpu_coldfire_5280
+	default 5281		if BR2_m68k_cpu_coldfire_5281
+	default 5282		if BR2_m68k_cpu_coldfire_5282
+	default 528x		if BR2_m68k_cpu_coldfire_528x
+	default 5307		if BR2_m68k_cpu_coldfire_5307
+	default 5327		if BR2_m68k_cpu_coldfire_5327
+	default 5328		if BR2_m68k_cpu_coldfire_5328
+	default 5329		if BR2_m68k_cpu_coldfire_5329
+	default 532x		if BR2_m68k_cpu_coldfire_532x
+	default 5372		if BR2_m68k_cpu_coldfire_5372
+	default 5373		if BR2_m68k_cpu_coldfire_5373
+	default 537x		if BR2_m68k_cpu_coldfire_537x
+	default 5407		if BR2_m68k_cpu_coldfire_5407
+	default 5470		if BR2_m68k_cpu_coldfire_5470
+	default 5471		if BR2_m68k_cpu_coldfire_5471
+	default 5472		if BR2_m68k_cpu_coldfire_5472
+	default 5473		if BR2_m68k_cpu_coldfire_5473
+	default 5474		if BR2_m68k_cpu_coldfire_5474
+	default 5475		if BR2_m68k_cpu_coldfire_5475
+	default 547x		if BR2_m68k_cpu_coldfire_547x
+	default 5480		if BR2_m68k_cpu_coldfire_5480
+	default 5481		if BR2_m68k_cpu_coldfire_5481
+	default 5482		if BR2_m68k_cpu_coldfire_5482
+	default 5483		if BR2_m68k_cpu_coldfire_5483
+	default 5484		if BR2_m68k_cpu_coldfire_5484
+	default 5485		if BR2_m68k_cpu_coldfire_5485
+	default 68000		if BR2_m68k_cpu_68000
+	default 68010		if BR2_m68k_cpu_68010
+	default 68020		if BR2_m68k_cpu_68020
+	default 68030		if BR2_m68k_cpu_68030
+	default 68040		if BR2_m68k_cpu_68040
+	default 68060		if BR2_m68k_cpu_68060
+	default 68302		if BR2_m68k_cpu_68302
+	default 68332		if BR2_m68k_cpu_68332
+	default cpu32		if BR2_m68k_cpu_cpu32
+	default $BR2_GCC_TARGET_CPU if BR2_GCC_TARGET_CPU
+
+config BR2_GCC_TARGET_FLAGS_SUBCPU
+	string
+	default $BR2_bfin_sirevision if BR2_bfin_sirevision
 
 config BR2_GCC_TARGET_ARCH
 	string
@@ -692,6 +1236,7 @@ config BR2_GCC_TARGET_ARCH
 	default winchip2	if BR2_x86_winchip2
 	default c3		if BR2_x86_c3
 	default geode		if BR2_x86_geode
+	default iwmmxt		if BR2_iwmmxt
 	default armv4t		if BR2_arm7tdmi
 	default armv3		if BR2_arm610
 	default armv3		if BR2_arm710
@@ -706,18 +1251,21 @@ config BR2_GCC_TARGET_ARCH
 	default armv4		if BR2_sa110
 	default armv4		if BR2_sa1100
 	default armv5te		if BR2_xscale
-	default iwmmxt		if BR2_iwmmxt
+	default m68k		if BR2_m68k_type_m68k
+	default cf		if BR2_m68k_type_coldfire
+	default g5		if BR2_s390_g5
+	default g6		if BR2_s390_g6
+	default z900		if BR2_s390_z900
+	default z990		if BR2_s390_z990
+	default z9-109		if BR2_s390_z9_109
+config BR2_GCC_TARGET_FLAGS_ARCH
+	string
 	default v0		if BR2_cris_unknown
 	default v10		if BR2_cris_generic
 	default v3		if BR2_cris_etrax_4
 	default v8		if BR2_cris_etrax_100
 	default v10		if BR2_cris_etrax_100lx
-	default 68000		if BR2_m68k_68000
-	default 68010		if BR2_m68k_68010
-	default 68020		if BR2_m68k_68020
-	default 68030		if BR2_m68k_68030
-	default 68040		if BR2_m68k_68040
-	default 68060		if BR2_m68k_68060
+	default $BR2_GCC_TARGET_ARCH if BR2_GCC_TARGET_ARCH && !BR2_m68k_type_m68k && !BR2_m68k_type_coldfire
 
 config BR2_GCC_TARGET_ABI
 	string
@@ -725,6 +1273,7 @@ config BR2_GCC_TARGET_ABI
 	default atpcs		if BR2_arm_dunno
 	default aapcs		if BR2_arm_dunno
 	default aapcs-linux	if BR2_ARM_EABI
+	#default iwmmxt		if BR2_iwmmxt
 	default 32		if BR2_MIPS_OABI32
 	default n32		if BR2_MIPS_ABI32
 	default eabi		if BR2_MIPS_EABI
@@ -738,4 +1287,7 @@ config BR2_GCC_TARGET_ABI
 	default no-spe		if BR2_powerpc && BR2_PPC_ABI_no-spe
 	default ibmlongdouble	if BR2_powerpc && BR2_PPC_ABI_ibmlongdouble
 	default ieeelongdouble	if BR2_powerpc && BR2_PPC_ABI_ieeelongdouble
+config BR2_GCC_TARGET_FLAGS_ABI
+	string
+	default $BR2_GCC_TARGET_ABI if BR2_GCC_TARGET_ABI
 
diff --git a/toolchain/Config.in.2 b/toolchain/Config.in.2
index 2a9ce24..d8f7ca0 100644
--- a/toolchain/Config.in.2
+++ b/toolchain/Config.in.2
@@ -85,6 +85,18 @@ config BR2_SOFT_FLOAT
 
 	  Most people will answer N.
 
+config BR2_HAVE_NOMMU
+	def_bool n
+	# assume that we have an MMU per default.
+
+config BR2_USE_MMU
+	bool "Use MMU"
+	default y
+	depends on !BR2_HAVE_NOMMU
+	help
+	  If your target has an MMU and you want to use it
+	  then say Y here.
+
 config BR2_USE_SSP
 	bool "Enable stack protection support"
 	help
diff --git a/toolchain/gcc/Makefile.in b/toolchain/gcc/Makefile.in
index e052b83..f854e88 100644
--- a/toolchain/gcc/Makefile.in
+++ b/toolchain/gcc/Makefile.in
@@ -49,16 +49,29 @@ SOFT_FLOAT_CONFIG_OPTION:=
 TARGET_SOFT_FLOAT:=
 ARCH_FPU_SUFFIX:=
 endif
+ifeq ($(BR2_USE_MMU),y)
+ARCH_MMU_SUFFIX:=
+else
+ARCH_MMU_SUFFIX:=_nommu
+endif
 
-# some additional defaults
+# Some arches (e.g. cris) do not have supported_defaults
+# These are not allowed BR2_GCC_TARGET_ARCH but only
+# BR2_GCC_TARGET_FLAGS_ARCH
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
+GCC_WITH_ABI:=--with-abi=$(call qstrip,$(BR2_GCC_TARGET_ABI))
+endif
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
-GCC_WITH_ARCH:=--with-arch=$(BR2_GCC_TARGET_ARCH)
+GCC_WITH_ARCH:=--with-arch=$(call qstrip,$(BR2_GCC_TARGET_ARCH))
 endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
-GCC_WITH_TUNE:=--with-tune=$(BR2_GCC_TARGET_TUNE)
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_CPU)),)
+BR2_GCC_TARGET_CPU_:=$(call qstrip,$(BR2_GCC_TARGET_CPU))
+BR2_GCC_TARGET_SUBCPU_:=$(call qstrip,$(BR2_GCC_TARGET_SUBCPU))
+BR2_GCC_TARGET_SUBCPU_SEPARATOR_:=$(call qstrip,$(BR2_GCC_TARGET_SUBCPU_SEPARATOR))
+GCC_WITH_CPU:=--with-cpu=$(GCC_TARGET_CPU_)$(if $(GCC_TARGET_SUBCPU_),$(GCC_TARGET_SUBCPU_SEPARATOR)$(GCC_TARGET_SUBCPU_))
 endif
-ifneq ($(call qstrip,$(BR2_GCC_TARGET_ABI)),)
-GCC_WITH_ABI:=--with-abi=$(BR2_GCC_TARGET_ABI)
+ifneq ($(call qstrip,$(BR2_GCC_TARGET_TUNE)),)
+GCC_WITH_TUNE:=--with-tune=$(call qstrip,$(BR2_GCC_TARGET_TUNE))
 endif
 
 # AVR32 GCC configuration
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 241bfb3..a46c0c6 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -233,7 +233,8 @@ $(GCC_BUILD_DIR1)/.configured: $(GCC_DIR)/.patched
 		$(MULTILIB) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) \
+		$(GCC_WITH_CPU) $(GCC_WITH_TUNE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
 		$(EXTRA_GCC1_CONFIG_OPTIONS) \
 		$(QUIET) \
@@ -310,7 +311,8 @@ $(GCC_BUILD_DIR2)/.configured: $(GCC_SRC_DIR)/.patched $(GCC_STAGING_PREREQ)
 		$(MULTILIB) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) \
+		$(GCC_WITH_CPU) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
@@ -437,7 +439,8 @@ $(GCC_BUILD_DIR3)/.configured: $(GCC_BUILD_DIR3)/.prepared
 		$(MULTILIB) \
 		$(GCC_DECIMAL_FLOAT) \
 		$(SOFT_FLOAT_CONFIG_OPTION) \
-		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) $(GCC_WITH_TUNE) \
+		$(GCC_WITH_ABI) $(GCC_WITH_ARCH) \
+		$(GCC_WITH_CPU) $(GCC_WITH_TUNE) \
 		$(GCC_USE_SJLJ_EXCEPTIONS) \
 		$(DISABLE_LARGEFILE) \
 		$(EXTRA_GCC_CONFIG_OPTIONS) \
-- 
1.6.3.3
