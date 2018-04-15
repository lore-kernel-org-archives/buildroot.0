From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Apr 2018 22:03:41 +0200
Subject: [Buildroot] [git commit] arch: remove Blackfin architecture
Message-ID: <20180415200628.D29208831B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=325bb37942f8d3826dab9dc6e88b25234e67a2cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Blackfin architecture has for a long time been complicated to
maintain, with poor support in upstream binutils/gcc. As of April
2018, the Blackfin architecture has been dropped from the upstream
Linux kernel. Also, the Analog Device engineer who used to be in touch
with the Buildroot community also privately said we should drop the
support for this architecture, which Analog Devices is no longer
using, promoting and maintaining.

The BR2_BINFMT_FLAT_SEP_DATA option becomes unselectable, it will be
removed in a future commit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy    |   8 +++++
 DEVELOPERS          |   1 -
 Makefile            |   1 -
 arch/Config.in      |  18 ++--------
 arch/Config.in.bfin | 102 ----------------------------------------------------
 5 files changed, 10 insertions(+), 120 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 22e23433ea..3d20950af5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -162,6 +162,14 @@ config BR2_PACKAGE_IQVLINUX
 	  See https://sourceforge.net/p/e1000/bugs/589/ for the
 	  discussion.
 
+config BR2_bfin
+	bool "Blackfin architecture support removed"
+	select BR2_LEGACY
+	help
+	  Following the removal of Blackfin support for the upstream
+	  Linux kernel, Buildroot has removed support for this CPU
+	  architecture.
+
 config BR2_PACKAGE_KODI_ADSP_BASIC
 	bool "kodi-adsp-basic package removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index aa70ba5264..eec278db50 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1950,7 +1950,6 @@ N:	Wade Berrier <wberrier@gmail.com>
 F:	package/ngrep/
 
 N:	Waldemar Brodkorb <wbx@openadk.org>
-F:	arch/Config.in.bfin
 F:	arch/Config.in.m68k
 F:	arch/Config.in.or1k
 F:	arch/Config.in.sparc
diff --git a/Makefile b/Makefile
index 3b846b997a..54f940659c 100644
--- a/Makefile
+++ b/Makefile
@@ -429,7 +429,6 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/arceb/arc/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
 	-e s/aarch64.*/arm64/ \
-	-e s/bfin/blackfin/ \
 	-e s/or1k/openrisc/ \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64.*/powerpc/ \
diff --git a/arch/Config.in b/arch/Config.in
index 65448e9339..a193cd0068 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -78,16 +78,6 @@ config BR2_aarch64_be
 	  http://www.arm.com/products/processors/instruction-set-architectures/armv8-architecture.php
 	  http://en.wikipedia.org/wiki/ARM
 
-config BR2_bfin
-	bool "Blackfin"
-	select BR2_ARCH_HAS_FDPIC_SUPPORT
-	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
-	help
-	  The Blackfin is a family of 16 or 32-bit microprocessors
-	  developed, manufactured and marketed by Analog Devices.
-	  http://www.analog.com/
-	  http://en.wikipedia.org/wiki/Blackfin
-
 config BR2_csky
 	bool "csky"
 	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
@@ -400,14 +390,14 @@ config BR2_BINFMT_FLAT_SEP_DATA
 	# big functions cannot be built in this mode. They cause build
 	# failures such as "Tried to convert PC relative branch to
 	# absolute jump" or "error: value -yyyyy out of range".
-	depends on BR2_bfin
+	depends on BR2_BROKEN
 	help
 	  Allow for the data and text segments to be separated and
 	  placed in different regions of memory.
 
 config BR2_BINFMT_FLAT_SHARED
 	bool "Shared binary"
-	depends on BR2_m68k || BR2_bfin
+	depends on BR2_m68k
 	# Even though this really generates shared binaries, there is no libdl
 	# and dlopen() cannot be used. So packages that require shared
 	# libraries cannot be built. Therefore, we don't select
@@ -427,10 +417,6 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
-if BR2_bfin
-source "arch/Config.in.bfin"
-endif
-
 if BR2_csky
 source "arch/Config.in.csky"
 endif
diff --git a/arch/Config.in.bfin b/arch/Config.in.bfin
deleted file mode 100644
index b570d388fd..0000000000
--- a/arch/Config.in.bfin
+++ /dev/null
@@ -1,102 +0,0 @@
-choice
-	prompt "Target CPU"
-	default BR2_bf532
-	depends on BR2_bfin
-	help
-	  Specify target CPU
-config BR2_bf512
-	bool "bf512"
-config BR2_bf514
-	bool "bf514"
-config BR2_bf516
-	bool "bf516"
-config BR2_bf518
-	bool "bf518"
-config BR2_bf522
-	bool "bf522"
-config BR2_bf523
-	bool "bf523"
-config BR2_bf524
-	bool "bf524"
-config BR2_bf525
-	bool "bf525"
-config BR2_bf526
-	bool "bf526"
-config BR2_bf527
-	bool "bf527"
-config BR2_bf531
-	bool "bf531"
-config BR2_bf532
-	bool "bf532"
-config BR2_bf533
-	bool "bf533"
-config BR2_bf534
-	bool "bf534"
-config BR2_bf536
-	bool "bf536"
-config BR2_bf537
-	bool "bf537"
-config BR2_bf538
-	bool "bf538"
-config BR2_bf539
-	bool "bf539"
-config BR2_bf542
-	bool "bf542"
-config BR2_bf544
-	bool "bf544"
-config BR2_bf547
-	bool "bf547"
-config BR2_bf548
-	bool "bf548"
-config BR2_bf549
-	bool "bf549"
-config BR2_bf561
-	bool "bf561"
-endchoice
-
-config BR2_ARCH
-	default "bfin"
-
-config BR2_ENDIAN
-	default "LITTLE"
-
-config BR2_GCC_TARGET_CPU
-	default bf606		if BR2_bf606
-	default bf607		if BR2_bf607
-	default bf608		if BR2_bf608
-	default bf609		if BR2_bf609
-	default bf512		if BR2_bf512
-	default bf514		if BR2_bf514
-	default bf516		if BR2_bf516
-	default bf518		if BR2_bf518
-	default bf522		if BR2_bf522
-	default bf523		if BR2_bf523
-	default bf524		if BR2_bf524
-	default bf525		if BR2_bf525
-	default bf526		if BR2_bf526
-	default bf527		if BR2_bf527
-	default bf531		if BR2_bf531
-	default bf532		if BR2_bf532
-	default bf533		if BR2_bf533
-	default bf534		if BR2_bf534
-	default bf536		if BR2_bf536
-	default bf537		if BR2_bf537
-	default bf538		if BR2_bf538
-	default bf539		if BR2_bf539
-	default bf542		if BR2_bf542
-	default bf544		if BR2_bf544
-	default bf547		if BR2_bf547
-	default bf548		if BR2_bf548
-	default bf549		if BR2_bf549
-	default bf561		if BR2_bf561
-
-config BR2_GCC_TARGET_CPU_REVISION
-	string "Target CPU revision"
-	help
-	  Specify a target CPU revision, which will be appended to the
-	  value of the -mcpu option. For example, if the selected CPU is
-	  bf609, and then selected CPU revision is "0.0", then gcc will
-	  receive the -mcpu=bf609-0.0 option.
-
-config BR2_READELF_ARCH_NAME
-	default "Analog Devices Blackfin"
