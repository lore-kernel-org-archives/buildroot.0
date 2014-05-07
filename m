From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  7 May 2014 14:10:05 -0300
Subject: [Buildroot] [PATCH 2/2] arch/arm: drop ARM(7TDMI/720T/740T) support
In-Reply-To: <1399482605-1850-1-git-send-email-gustavo@zacarias.com.ar>
References: <1399482605-1850-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1399482605-1850-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The toolchain currently doesn't build for nommu ARM and is in need of
serious work.
Problem is there are no emulation targets and real ARM(7TDMI/720T/740T)
hardware that's capable of running linux (enough memory, having a
memory controller...) is VERY rare and uses very old versions to
make it usable.

The ARM nommu focus should go into Cortex M series processors that are
obtainable at reasonable cost on modern hardware that has external
memory controllers.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 arch/Config.in.arm                          | 11 -----------
 package/ffmpeg/ffmpeg.mk                    |  2 +-
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk  |  2 +-
 package/gstreamer1/gst1-libav/gst1-libav.mk |  2 +-
 package/libplayer/Config.in                 |  4 ++--
 package/mplayer/Config.in                   |  4 ++--
 package/nettle/nettle.mk                    |  2 +-
 package/nodejs/Config.in                    |  4 ++--
 package/qt5/Config.in                       |  2 +-
 package/speex/Config.in                     |  2 +-
 package/uclibc/Config.in                    |  2 --
 package/vo-aacenc/vo-aacenc.mk              |  2 +-
 package/webkit/Config.in                    |  2 +-
 13 files changed, 14 insertions(+), 27 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index b7a9ed6..4cc41f1 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -44,12 +44,6 @@ choice
 	help
 	  Specific CPU variant to use
 
-config BR2_arm7tdmi
-	bool "arm7tdmi"
-	select BR2_ARM_CPU_HAS_THUMB
-config BR2_arm720t
-	bool "arm720t"
-	select BR2_ARM_CPU_HAS_THUMB
 config BR2_arm920t
 	bool "arm920t"
 	select BR2_ARM_CPU_HAS_THUMB
@@ -347,9 +341,6 @@ config BR2_ENDIAN
 	default "BIG"	 if BR2_armeb
 
 config BR2_GCC_TARGET_CPU
-	default "arm7tdmi"	if BR2_arm7tdmi
-	default "arm7tdmi"	if BR2_arm720t
-	default "arm7tdmi"	if BR2_arm740t
 	default "arm920"	if BR2_arm920
 	default "arm920t"	if BR2_arm920t
 	default "arm922t"	if BR2_arm922t
@@ -371,8 +362,6 @@ config BR2_GCC_TARGET_CPU
 	default "iwmmxt"	if BR2_iwmmxt
 
 config BR2_GCC_TARGET_ARCH
-	default "armv4t"	if BR2_arm7tdmi
-	default "armv4t"	if BR2_arm720t
 	default "armv4t"	if BR2_arm920t
 	default "armv4t"	if BR2_arm922t
 	default "armv5te"	if BR2_arm926t
diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index fae558a..f8c1526 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -256,7 +256,7 @@ endif
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
-ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
 FFMPEG_CONF_OPT += --disable-armv5te
 endif
 ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index 6534f93..f18ab18 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -51,7 +51,7 @@ endif
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
-ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
 GST_FFMPEG_CONF_EXTRA_OPT += --disable-armv5te
 endif
 ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
index 121f2ee..7a0182e 100644
--- a/package/gstreamer1/gst1-libav/gst1-libav.mk
+++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
@@ -52,7 +52,7 @@ endif
 # Explicitly disable everything that doesn't match for ARM
 # FFMPEG "autodetects" by compiling an extended instruction via AS
 # This works on compilers that aren't built for generic by default
-ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
+ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
 GST1_LIBAV_CONF_EXTRA_OPT += --disable-armv5te
 endif
 ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
diff --git a/package/libplayer/Config.in b/package/libplayer/Config.in
index be7e0f0..4f5404c 100644
--- a/package/libplayer/Config.in
+++ b/package/libplayer/Config.in
@@ -19,8 +19,8 @@ config BR2_PACKAGE_LIBPLAYER_MPLAYER
 	depends on BR2_LARGEFILE
 	# mplayer
 	# Broken support for <ARMv5
-	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t \
-		|| BR2_arm920t || BR2_arm922t || BR2_fa526 || BR2_strongarm)
+	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
+		|| BR2_strongarm)
 	select BR2_PACKAGE_MPLAYER
 
 config BR2_PACKAGE_LIBPLAYER_GSTREAMER
diff --git a/package/mplayer/Config.in b/package/mplayer/Config.in
index bacd744..8b5d05e 100644
--- a/package/mplayer/Config.in
+++ b/package/mplayer/Config.in
@@ -4,8 +4,8 @@ config BR2_PACKAGE_MPLAYER
 	depends on !(BR2_bfin || BR2_sh2a || BR2_sh4a || BR2_sh4aeb \
 			|| BR2_microblaze || BR2_aarch64 || BR2_nios2)
 	# Broken support for <ARMv5
-	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t \
-		|| BR2_arm920t || BR2_arm922t || BR2_fa526 || BR2_strongarm)
+	depends on !(BR2_arm920t || BR2_arm920t || BR2_arm922t || BR2_fa526 \
+		|| BR2_strongarm)
 	depends on BR2_LARGEFILE
 	help
 	  MPlayer is a movie player which runs on many systems and supports
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index c23b4fa..647100a 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -15,7 +15,7 @@ NETTLE_LICENSE_FILES = COPYING.LIB
 NETTLE_CONF_OPT = --disable-openssl
 
 # ARM assembly requires v6+ ISA
-ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_arm10t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
+ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_arm926t)$(BR2_arm10t)$(BR2_fa526)$(BR2_strongarm)$(BR2_xscale)$(BR2_iwmmxt),y)
 NETTLE_CONF_OPT += --disable-assembler
 endif
 
diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
index 5ebaa9a..344b7f6 100644
--- a/package/nodejs/Config.in
+++ b/package/nodejs/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_NODEJS
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	depends on !BR2_MIPS_SOFT_FLOAT
 	# ARM needs BLX, so v5t+
-	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
 	# uses fork()
 	depends on BR2_USE_MMU
 	help
@@ -18,7 +18,7 @@ config BR2_PACKAGE_NODEJS
 comment "nodejs needs a toolchain w/ C++, IPv6, largefile, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
-	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6
 
diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 5713c41..d36852e 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_QT5_JSCORE_AVAILABLE
 	# Javascript engine is only available on certain architectures
 	depends on BR2_arm || BR2_i386 || BR2_x86_64 || BR2_mipsel
 	# ARM needs BLX, so v5t+
-	depends on !(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
+	depends on !(BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y
 
 comment "Qt5 needs a toolchain w/ wchar, IPv6, NPTL, C++"
diff --git a/package/speex/Config.in b/package/speex/Config.in
index 3f8d6c3..ab743fe 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -13,7 +13,7 @@ if BR2_PACKAGE_SPEEX
 config BR2_PACKAGE_SPEEX_ARM4
 	bool
 	default y
-	depends on BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526
+	depends on BR2_arm920t || BR2_arm922t || BR2_strongarm || BR2_fa526
 
 config BR2_PACKAGE_SPEEX_ARM5E
 	default y
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 5021429..84c2f14 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -200,8 +200,6 @@ config BR2_UCLIBC_ARM_TYPE
 	string
 	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
 	default GENERIC_ARM	if BR2_fa526
-	default ARM7TDMI	if BR2_arm7tdmi
-	default ARM720T		if BR2_arm720t
 	default ARM920T		if BR2_arm920t
 	default ARM922T		if BR2_arm922t
 	default ARM926T		if BR2_arm926t
diff --git a/package/vo-aacenc/vo-aacenc.mk b/package/vo-aacenc/vo-aacenc.mk
index 503876f..d34ced9 100644
--- a/package/vo-aacenc/vo-aacenc.mk
+++ b/package/vo-aacenc/vo-aacenc.mk
@@ -26,7 +26,7 @@ VO_AACENC_CFLAGS += -mfpu=neon
 else
 VO_AACENC_CONF_OPT += --disable-armv7neon
 
-ifeq ($(BR2_arm7tdmi)$(BR2_arm720t)$(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),)
+ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),)
 VO_AACENC_CONF_OPT += --enable-armv5e
 else
 VO_AACENC_CONF_OPT += --disable-armv5e
diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 4112287..21da2b2 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+
 	default y if (BR2_arm || BR2_armeb) && \
-		!(BR2_arm7tdmi || BR2_arm720t || BR2_arm920t || BR2_arm922t || BR2_fa526)
+		!(BR2_arm920t || BR2_arm922t || BR2_fa526)
 	default y if BR2_i386 || BR2_mips || BR2_mipsel || \
 		BR2_sh || BR2_sparc || BR2_x86_64
 	depends on BR2_USE_MMU # libgail -> pango -> libglib2
-- 
1.8.5.5
