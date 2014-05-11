From: Cody P Schafer <cody@linux.vnet.ibm.com>
Date: Sun, 11 May 2014 01:18:05 -0700
Subject: [Buildroot] [PATCH 1/2] powerpc64 powerpc64le: add support
Message-ID: <1399796286-14822-1-git-send-email-cody@linux.vnet.ibm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This enables powerpc64 and powerpc64le. Currently, le needs at least
glibc 2.19 and gcc 4.9.0. For gdb, 7.7.1 works (added in a later patch).

This also provides a helper config to replace the ad-hoc altivec logic.

Signed-off-by: Cody P Schafer <cody@linux.vnet.ibm.com>
---
 Makefile                                    |  4 +-
 arch/Config.in                              | 21 +++++++-
 arch/Config.in.powerpc                      | 76 ++++++++++++++++++++++++++---
 linux/Config.in                             |  5 +-
 package/Makefile.in                         |  2 +-
 package/efl/libevas/libevas.mk              |  2 +-
 package/ffmpeg/ffmpeg.mk                    |  5 +-
 package/glibc/Config.in                     |  3 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk  |  5 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk |  5 +-
 package/libatomic_ops/Config.in             |  2 +-
 package/mpg123/mpg123.mk                    |  4 +-
 package/openssl/openssl.mk                  |  6 +++
 package/systemd/Config.in                   |  3 +-
 package/vlc/vlc.mk                          |  3 +-
 toolchain/toolchain-buildroot/Config.in     |  5 +-
 16 files changed, 117 insertions(+), 34 deletions(-)

diff --git a/Makefile b/Makefile
index 2f18aab..c6a2e5d 100644
--- a/Makefile
+++ b/Makefile
@@ -38,7 +38,8 @@ export HOSTARCH := $(shell uname -m | \
 	    -e s/sun4u/sparc64/ \
 	    -e s/arm.*/arm/ \
 	    -e s/sa110/arm/ \
-	    -e s/ppc64/powerpc/ \
+	    -e s/ppc64/powerpc64/ \
+	    -e s/ppc64le/powerpc64le/ \
 	    -e s/ppc/powerpc/ \
 	    -e s/macppc/powerpc/\
 	    -e s/sh.*/sh/)
@@ -310,6 +311,7 @@ KERNEL_ARCH := $(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/aarch64/arm64/ \
 	-e s/bfin/blackfin/ \
 	-e s/parisc64/parisc/ \
+	-e s/powerpc64le/powerpc/ \
 	-e s/powerpc64/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
 	-e s/sh.*/sh/ \
diff --git a/arch/Config.in b/arch/Config.in
index bc81dac..819823c 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -140,6 +140,25 @@ config BR2_powerpc
 	bool "PowerPC"
 	help
 	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
+	  Big endian.
+	  http://www.power.org/
+	  http://en.wikipedia.org/wiki/Powerpc
+
+config BR2_powerpc64
+	bool "PowerPC 64"
+	select BR2_ARCH_IS_64
+	help
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
+	  Big endian.
+	  http://www.power.org/
+	  http://en.wikipedia.org/wiki/Powerpc
+
+config BR2_powerpc64le
+	bool "PowerPC 64 (Little endian)"
+	select BR2_ARCH_IS_64
+	help
+	  PowerPC is a RISC architecture created by Apple-IBM-Motorola alliance.
+	  Little endian.
 	  http://www.power.org/
 	  http://en.wikipedia.org/wiki/Powerpc
 
@@ -321,7 +340,7 @@ if BR2_nios2
 source "arch/Config.in.nios2"
 endif
 
-if BR2_powerpc
+if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 source "arch/Config.in.powerpc"
 endif
 
diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index ae70a8a..92009da 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -1,91 +1,147 @@
+config BR2_POWERPC_CPU_HAS_ALTIVEC
+	bool
+config BR2_POWERPC_CPU_HAS_SPE
+
+config BR2_POWERPC
+	bool
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_powerpc
+	depends on BR2_POWERPC
 	default BR2_generic_powerpc
 	help
 	  Specific CPU variant to use
 config BR2_generic_powerpc
 	bool "generic"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC if BR2_ARCH_IS_64
 config BR2_powerpc_401
 	bool "401"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_403
 	bool "403"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_405
 	bool "405"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_405fp
 	bool "405 with FPU"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_440
 	bool "440"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_440fp
 	bool "440 with FPU"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_464
 	bool "464"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_464fp
 	bool "464 with FPU"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_476
 	bool "476"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_476fp
 	bool "476 with FPU"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_505
 	bool "505"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_601
 	bool "601"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_602
 	bool "602"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_603
 	bool "603"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_603e
 	bool "603e"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_604
 	bool "604"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_604e
 	bool "604e"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_620
 	bool "620"
 config BR2_powerpc_630
 	bool "630"
 config BR2_powerpc_740
 	bool "740"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_7400
 	bool "7400"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_7450
 	bool "7450"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_750
 	bool "750"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_821
 	bool "821"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_823
 	bool "823"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_860
 	bool "860"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_970
 	bool "970"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_8540
 	bool "8540 / e500v1"
+	depends on !BR2_ARCH_IS_64
+	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_8548
 	bool "8548 / e500v2"
+	depends on !BR2_ARCH_IS_64
+	select BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_e300c2
 	bool "e300c2"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_e300c3
 	bool "e300c3"
+	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_e500mc
 	bool "e500mc"
+	depends on !BR2_ARCH_IS_64
+config BR2_powerpc_power4
+	bool "power4"
+config BR2_powerpc_power5
+	bool "power5"
+config BR2_powerpc_power6
+	bool "power6"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+config BR2_powerpc_power7
+	bool "power7"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
+config BR2_powerpc_power8
+	bool "power8"
+	select BR2_POWERPC_CPU_HAS_ALTIVEC
 endchoice
 
 choice
 	prompt "Target ABI"
-	depends on BR2_powerpc
-	default BR2_powerpc_SPE if BR2_powerpc_8540 || BR2_powerpc_8548
+	depends on BR2_POWERPC
+	default BR2_powerpc_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_powerpc_CLASSIC
 	help
 	  Application Binary Interface to use
 
 config BR2_powerpc_CLASSIC
 	bool "Classic"
-	depends on !(BR2_powerpc_8540 || BR2_powerpc_8548)
+	depends on !BR2_POWERPC_CPU_HAS_SPE
 config BR2_powerpc_SPE
 	bool "SPE"
-	depends on BR2_powerpc_8540 || BR2_powerpc_8548
+	depends on BR2_POWERPC_CPU_HAS_SPE
 endchoice
 
 config BR2_POWERPC_SOFT_FLOAT
@@ -99,9 +155,12 @@ config BR2_POWERPC_SOFT_FLOAT
 
 config BR2_ARCH
 	default "powerpc"	if BR2_powerpc
+	default "powerpc64"	if BR2_powerpc64
+	default "powerpc64le"	if BR2_powerpc64le
 
 config BR2_ENDIAN
-	default "BIG"
+	default "BIG" if BR2_powerpc || BR2_powerpc64
+	default "LITTLE" if BR2_powerpc64le
 
 config BR2_GCC_TARGET_TUNE
 	default "401"		if BR2_powerpc_401
@@ -136,6 +195,11 @@ config BR2_GCC_TARGET_TUNE
 	default "e300c2"	if BR2_powerpc_e300c2
 	default "e300c3"	if BR2_powerpc_e300c3
 	default "e500mc"	if BR2_powerpc_e500mc
+	default "power4"	if BR2_powerpc_power4
+	default "power5"	if BR2_powerpc_power5
+	default "power6"	if BR2_powerpc_power6
+	default "power7"	if BR2_powerpc_power7
+	default "power8"	if BR2_powerpc_power8
 
 config BR2_GCC_TARGET_ABI
 	default "altivec"		if BR2_PPC_ABI_altivec
diff --git a/linux/Config.in b/linux/Config.in
index 77c28f3..0bd1c9e 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -183,8 +183,9 @@ config BR2_LINUX_KERNEL_BZIMAGE
 
 config BR2_LINUX_KERNEL_ZIMAGE
 	bool "zImage"
-	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_sparc || \
-		   BR2_sh || BR2_sh64 || BR2_xtensa
+	depends on BR2_arm || BR2_armeb || \
+		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		   BR2_sparc || BR2_sh || BR2_sh64 || BR2_xtensa
 
 config BR2_LINUX_KERNEL_APPENDED_ZIMAGE
 	bool "zImage with appended DT"
diff --git a/package/Makefile.in b/package/Makefile.in
index 2fc3aa7..0233506 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -321,7 +321,7 @@ endif
 ifeq ($(BR2_m68k),y)
 BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
 endif
-ifeq ($(BR2_powerpc)$(BR2_ENDIAN),yBIG)
+ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
 BR2_AC_CV_TRAP_CHECK=ac_cv_lbl_unaligned_fail=no
 endif
 
diff --git a/package/efl/libevas/libevas.mk b/package/efl/libevas/libevas.mk
index 41ceb49..71f1aeb 100644
--- a/package/efl/libevas/libevas.mk
+++ b/package/efl/libevas/libevas.mk
@@ -136,7 +136,7 @@ else
 LIBEVAS_CONF_OPT += --disable-cpu-sse3
 endif
 
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 LIBEVAS_CONF_OPT += --enable-cpu-altivec
 else
 LIBEVAS_CONF_OPT += --disable-cpu-altivec
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f8c1526..b14f678 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -299,14 +299,11 @@ FFMPEG_CONF_OPT += \
 	--disable-mipsdspr2
 endif
 
-# Set powerpc altivec appropriately
-ifeq ($(BR2_powerpc),y)
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 FFMPEG_CONF_OPT += --enable-altivec
 else
 FFMPEG_CONF_OPT += --disable-altivec
 endif
-endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
 FFMPEG_CONF_OPT += --enable-pic
diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 693a33e..c20d9e1 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -8,7 +8,8 @@ choice
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze
+		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64 || \
+		   BR2_powerpc64le
 
 config BR2_GLIBC_VERSION_2_18
        bool "2.18"
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index f18ab18..5c4b754 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -63,14 +63,11 @@ ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-neon
 endif
 
-# Set powerpc altivec appropriately
-ifeq ($(BR2_powerpc),y)
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-altivec
 else
 GST_FFMPEG_CONF_EXTRA_OPT += --disable-altivec
 endif
-endif
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-pic
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 7a0182e..f84bcb2 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -71,14 +71,11 @@ else
 GST1_LIBAV_CONF_EXTRA_OPT += --disable-vfp
 endif
 
-# Set powerpc altivec appropriately
-ifeq ($(BR2_powerpc),y)
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HASH_ALTIVEC),y)
 GST1_LIBAV_CONF_EXTRA_OPT += --enable-altivec
 else
 GST1_LIBAV_CONF_EXTRA_OPT += --disable-altivec
 endif
-endif
 
 GST1_LIBAV_CONF_OPT = \
 	--with-libav-extra-configure="$(GST1_LIBAV_CONF_EXTRA_OPT)"
diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
index f0a55a4..fe1efd4 100644
--- a/package/libatomic_ops/Config.in
+++ b/package/libatomic_ops/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	bool
-	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_x86_64
+	default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64
 
 config BR2_PACKAGE_LIBATOMIC_OPS
 	bool "libatomic_ops"
diff --git a/package/mpg123/mpg123.mk b/package/mpg123/mpg123.mk
index a950813..d66592c 100644
--- a/package/mpg123/mpg123.mk
+++ b/package/mpg123/mpg123.mk
@@ -22,14 +22,12 @@ ifeq ($(BR2_i386),y)
 MPG123_CPU = x86
 endif
 
-ifeq ($(BR2_powerpc),y)
-ifneq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 MPG123_CPU = altivec
 endif
 ifeq ($(BR2_SOFT_FLOAT),y)
 MPG123_CPU = ppc_nofpu
 endif
-endif
 
 ifeq ($(BR2_x86_64),y)
 MPG123_CPU = x86-64
diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
index 52abb46..87bc2ef 100644
--- a/package/openssl/openssl.mk
+++ b/package/openssl/openssl.mk
@@ -42,6 +42,12 @@ ifeq ($(BR2_powerpc_401)$(BR2_powerpc_403)$(BR2_powerpc_405)$(BR2_powerpc_405fp)
 	OPENSSL_TARGET_ARCH = ppc
 endif
 endif
+ifeq ($(ARCH),powerpc64)
+	OPENSSL_TARGET_ARCH = ppc64
+endif
+ifeq ($(ARCH),powerpc64le)
+	OPENSSL_TARGET_ARCH = ppc64le
+endif
 ifeq ($(ARCH),x86_64)
 	OPENSSL_TARGET_ARCH = x86_64
 endif
diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index f10637a..05f4680 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 	bool
 	# see src/shared/architecture.h
 	default y if BR2_arm || BR2_armeb || BR2_i386 || BR2_mips || \
-		BR2_mipsel || BR2_powerpc || BR2_sh4 || BR2_sh4eb || \
+		BR2_mipsel || BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le  || BR2_sh4 || BR2_sh4eb || \
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
 		BR2_aarch64 || BR2_m68k
 
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index e14c9c3..6eb7eea 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -49,8 +49,7 @@ ifeq ($(BR2_PREFER_STATIC_LIB),)
 VLC_CONF_OPT += --disable-static
 endif
 
-# Set powerpc altivec appropriately
-ifeq ($(BR2_powerpc_7400)$(BR2_powerpc_7450)$(BR2_powerpc_970),y)
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
 VCL_CONF_OPT += --enable-altivec
 else
 VLC_CONF_OPT += --disable-altivec
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 216f9db..91ff705 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -45,7 +45,7 @@ config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze
+		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_USES_GLIBC
@@ -63,7 +63,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
 		   BR2_i386   || BR2_mips     || BR2_mipsel  || \
 		   BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		   BR2_sh     || BR2_sh64     || BR2_sparc   || \
-		   BR2_x86_64 || BR2_microblaze
+		   BR2_x86_64 || BR2_microblaze || BR2_powerpc64 || \
+		   BR2_powerpc64le
 	depends on BR2_USE_MMU
 	depends on !BR2_PREFER_STATIC_LIB
 	select BR2_TOOLCHAIN_USES_GLIBC
-- 
1.9.3
