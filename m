From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 10 Apr 2016 17:36:16 +0200
Subject: [Buildroot] [PATCH] package/omxplayer: new package
Message-ID: <1460302576-19777-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OMXplayer uses openMAX on the RPi to play videos with hardware
acceleration.

Compared to using a gstreamer pipe, OMXplayer uses a complete
"tunnel-mode", in which the video is piped (after demuxing) into the
hardware, all the way down to the display, whereas gstreamer composes
the video using the eglgles sink, which uses mem-to-mem copies.

So, when playing a locally-stored 1080p video, OMXplayer averages 20%
(with peaks up to ~30%, depending on the complexity of the video) CPU,
while gstreamer bursts up to 40+% when playing 720p and totally chokes
on a 1080p video; all on an non-overclocked RPi-1.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |  1 +
 .../0001-Makefiles-clean-up-the-cruft.patch        | 72 ++++++++++++++++++++++
 package/omxplayer/Config.in                        | 38 ++++++++++++
 package/omxplayer/omxplayer.mk                     | 46 ++++++++++++++
 4 files changed, 157 insertions(+)
 create mode 100644 package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
 create mode 100644 package/omxplayer/Config.in
 create mode 100644 package/omxplayer/omxplayer.mk

diff --git a/package/Config.in b/package/Config.in
index 64822bf..eea2cdd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -32,6 +32,7 @@ menu "Audio and video applications"
 	source "package/multicat/Config.in"
 	source "package/musepack/Config.in"
 	source "package/ncmpc/Config.in"
+	source "package/omxplayer/Config.in"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pulseaudio/Config.in"
diff --git a/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
new file mode 100644
index 0000000..9a2fe9f
--- /dev/null
+++ b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
@@ -0,0 +1,72 @@
+From d05f70906c9e4973123b172936927be9580c3747 Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 10 Apr 2016 16:22:53 +0200
+Subject: [PATCH] Makefiles: clean up the cruft
+
+Most of the variables that Makefile.include tries to set (and fails to),
+are already available from Buildroot's variables:
+  - AR, AS, CC, CXX, OBJDUMP...
+  - CFLAGS, CXXFLAGS, CPPFLAGS...
+
+This leaves us with a few select variables that defines (include and
+library) paths local to the omxplayer package, plus a few optimisations.
+
+Add a missign library to be linked with.
+
+Fianlly, also remove hard-coded, absolute paths pointing to the host
+system (won't work for cross-copilation, so our paranoid wrapper would
+catch those paths).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ Makefile         |  4 ++--
+ Makefile.include | 20 ++------------------
+ 2 files changed, 4 insertions(+), 20 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 80b63b1..74d1953 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,9 +2,9 @@ include Makefile.include
+ 
+ CFLAGS+=-std=c++0x -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX -DTARGET_LINUX -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CMAKE_CONFIG -D__VIDEOCORE4__ -U_FORTIFY_SOURCE -Wall -DHAVE_OMXLIB -DUSE_EXTERNAL_FFMPEG  -DHAVE_LIBAVCODEC_AVCODEC_H -DHAVE_LIBAVUTIL_OPT_H -DHAVE_LIBAVUTIL_MEM_H -DHAVE_LIBAVUTIL_AVUTIL_H -DHAVE_LIBAVFORMAT_AVFORMAT_H -DHAVE_LIBAVFILTER_AVFILTER_H -DHAVE_LIBSWRESAMPLE_SWRESAMPLE_H -DOMX -DOMX_SKIP64BIT -ftree-vectorize -DUSE_EXTERNAL_OMX -DTARGET_RASPBERRY_PI -DUSE_EXTERNAL_LIBBCM_HOST
+ 
+-LDFLAGS+=-L./ -Lffmpeg_compiled/usr/local/lib/ -lc -lWFC -lGLESv2 -lEGL -lbcm_host -lopenmaxil -lfreetype -lz
++LDFLAGS+=-L./ -Lffmpeg_compiled/usr/local/lib/ -lc -lWFC -lGLESv2 -lEGL -lbcm_host -lopenmaxil -lfreetype -lz -lvchostif
+ 
+-INCLUDES+=-I./ -Ilinux -Iffmpeg_compiled/usr/local/include/ -I /usr/include/dbus-1.0 -I /usr/lib/arm-linux-gnueabihf/dbus-1.0/include
++INCLUDES+=-I./ -Ilinux -Iffmpeg_compiled/usr/local/include/
+ 
+ DIST ?= omxplayer-dist
+ 
+diff --git a/Makefile.include b/Makefile.include
+index 58e9560..79ca277 100644
+--- a/Makefile.include
++++ b/Makefile.include
+@@ -20,21 +20,5 @@ endif
+ 
+ JOBS=7
+ 
+-CFLAGS			:= -isystem$(PREFIX)/include
+-CXXFLAGS		:= $(CFLAGS)
+-CPPFLAGS		:= $(CFLAGS)
+-LDFLAGS			:= -L$(BUILDROOT)/lib
+-LD					:= $(TOOLCHAIN)/bin/$(HOST)-ld --sysroot=$(SYSROOT)
+-CC					:= $(TOOLCHAIN)/bin/$(HOST)-gcc --sysroot=$(SYSROOT)
+-CXX         := $(TOOLCHAIN)/bin/$(HOST)-g++ --sysroot=$(SYSROOT)
+-OBJDUMP			:= $(TOOLCHAIN)/bin/$(HOST)-objdump
+-RANLIB			:= $(TOOLCHAIN)/bin/$(HOST)-ranlib
+-STRIP				:= $(TOOLCHAIN)/bin/$(HOST)-strip
+-AR 					:= $(TOOLCHAIN)/bin/$(HOST)-ar
+-CXXCP 			:= $(CXX) -E
+-PATH 				:= $(PREFIX)/bin:$(BUILDROOT)/output/host/usr/bin:$(PATH)
+-
+-CFLAGS			+= -pipe -mfloat-abi=$(FLOAT) -mcpu=arm1176jzf-s -fomit-frame-pointer -mabi=aapcs-linux -mtune=arm1176jzf-s -mfpu=vfp -Wno-psabi -mno-apcs-stack-check -g -mstructure-size-boundary=32 -mno-sched-prolog
+-LDFLAGS			+= -L$(SDKSTAGE)/lib -L$(SDKSTAGE)/usr/lib -L$(SDKSTAGE)/opt/vc/lib/ -Lpcre/build
+-#INCLUDES		+= -isystem$(SDKSTAGE)/usr/include -isystem$(SDKSTAGE)/opt/vc/include -isystem$(SYSROOT)/usr/include -isystem$(SDKSTAGE)/opt/vc/include/interface/vcos/pthreads -isystem$(SDKSTAGE)/usr/include/freetype2
+-INCLUDES		+= -isystem$(SDKSTAGE)/opt/vc/include -isystem$(SYSROOT)/usr/include -isystem$(SDKSTAGE)/opt/vc/include/interface/vcos/pthreads -Ipcre/build -Iboost-trunk -Ifreetype2/include
++CFLAGS			+= -fomit-frame-pointer -Wno-psabi -mno-apcs-stack-check    \
++			   -mstructure-size-boundary=32 -mno-sched-prolog
+-- 
+1.9.1
+
diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
new file mode 100644
index 0000000..c99ef8a
--- /dev/null
+++ b/package/omxplayer/Config.in
@@ -0,0 +1,38 @@
+# Note: boost has an architecture-specific dependency option, but
+# it only refers to a NIOSII toolchain. Since OMXplayer depends on
+# ARM, we can't be using that toolchain to start with. However,
+# for consistenmcy, we still propagate that dependency.
+
+config BR2_PACKAGE_OMXPLAYER
+	bool "omxplayer"
+	depends on BR2_arm
+	depends on BR2_USE_MMU # dbus
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS # boost
+	depends on BR2_INSTALL_LIBSTDCPP # boost, rpi-userland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
+	depends on BR2_USE_WCHAR # boost
+	depends on !BR2_STATIC_LIBS # rpi-userland
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBIDN
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_ZLIB
+	help
+	  OMXPlayer is a commandline OMX player for the Raspberry Pi. It was
+	  developed as a testbed for the XBMC Raspberry PI implementation
+	  and is quite handy to use standalone.
+
+	  https://github.com/popcornmix/omxplayer
+
+comment "omxplayer needs a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_arm
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
new file mode 100644
index 0000000..793cb64
--- /dev/null
+++ b/package/omxplayer/omxplayer.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# omxplayer
+#
+################################################################################
+
+OMXPLAYER_VERSION = 17b81a8070fee9e9fe58192f3e1d01c72e49c175
+OMXPLAYER_SITE = $(call github,popcornmix,omxplayer,$(OMXPLAYER_VERSION))
+OMXPLAYER_LICENSE = GPLv2+
+OMXPLAYER_LICENSE_FILES = COPYING
+
+OMXPLAYER_DEPENDENCIES = \
+	host-pkgconf boost dbus ffmpeg freetype libidn libusb pcre \
+	rpi-userland zlib
+
+OMXPLAYER_EXTRA_CFLAGS =                                        \
+	-DTARGET_LINUX -DTARGET_POSIX                           \
+	$(shell $(PKG_CONFIG_HOST_BINARY) --cflags bcm_host)    \
+	$(shell $(PKG_CONFIG_HOST_BINARY) --cflags freetype2)   \
+	$(shell $(PKG_CONFIG_HOST_BINARY) --cflags dbus-1)      \
+
+# OMXplayer has support for building in Buildroot, but that
+# procedure is, well, tainted. Fix this by forcing the real,
+# correct values.
+OMXPLAYER_MAKE_ENV = \
+	USE_BUILDROOT=1 \
+	BUILDROOT=$(TOP_DIR) \
+	SDKSTAGE=$(STAGING_DIR) \
+	TARGETFS=$(TARGET_DIR) \
+	TOOLCHAIN=$(HOST_DIR)/usr \
+	HOST=$(GNU_TARGET_NAME) \
+	SYSROOT=$(STAGING_DIR) \
+	JOBS=$(PARALLEL_JOBS) \
+	$(TARGET_CONFIGURE_OPTS) \
+	STRIP=true \
+	CFLAGS="$(TARGET_CFLAGS) $(OMXPLAYER_EXTRA_CFLAGS)"
+
+define OMXPLAYER_BUILD_CMDS
+	$(OMXPLAYER_MAKE_ENV) $(MAKE) -C $(@D) omxplayer.bin
+endef
+
+define OMXPLAYER_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/omxplayer.bin $(TARGET_DIR)/usr/bin/omxplayer
+endef
+
+$(eval $(generic-package))
-- 
1.9.1
