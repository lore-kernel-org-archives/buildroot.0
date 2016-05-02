From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 May 2016 12:09:58 +0200
Subject: [Buildroot] [PATCHv2] package/omxplayer: new package
Message-ID: <1462183798-2578-1-git-send-email-yann.morin.1998@free.fr>
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

Note that we have to depend on rpi-userland. rpi-userland is a GLES/EGL
provider, so it can't be selected (as all providers of a virtual package
can't).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

---
Changes v1 -> v2:
  - change $(shell ...) to `...`  (Thomas)
  - don't select rpi-userland
  - update to the latest git master; drop parts of our patch
  - add hash file
  - typoes in patch' commit log
---
 package/Config.in                                  |  1 +
 .../0001-Makefiles-clean-up-the-cruft.patch        | 67 ++++++++++++++++++++++
 package/omxplayer/Config.in                        | 38 ++++++++++++
 package/omxplayer/omxplayer.hash                   |  3 +
 package/omxplayer/omxplayer.mk                     | 46 +++++++++++++++
 5 files changed, 155 insertions(+)
 create mode 100644 package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
 create mode 100644 package/omxplayer/Config.in
 create mode 100644 package/omxplayer/omxplayer.hash
 create mode 100644 package/omxplayer/omxplayer.mk

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..b12806d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -33,6 +33,7 @@ menu "Audio and video applications"
 	source "package/multicat/Config.in"
 	source "package/musepack/Config.in"
 	source "package/ncmpc/Config.in"
+	source "package/omxplayer/Config.in"
 	source "package/on2-8170-libs/Config.in"
 	source "package/opus-tools/Config.in"
 	source "package/pulseaudio/Config.in"
diff --git a/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
new file mode 100644
index 0000000..2dc6166
--- /dev/null
+++ b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
@@ -0,0 +1,67 @@
+From 563dafc1129848419482b540d149d0b8687cac1e Mon Sep 17 00:00:00 2001
+From: "Yann E. MORIN" <yann.morin.1998@free.fr>
+Date: Sun, 10 Apr 2016 16:22:53 +0200
+Subject: [PATCH] Makefiles: clean up the cruft
+
+Most of the variables that Makefile.include tries (but fails) to set,
+are already available from Buildroot's variables:
+  - AR, AS, CC, CXX, OBJDUMP...
+  - CFLAGS, CXXFLAGS, CPPFLAGS...
+
+This leaves us with a few select variables that define include and
+library paths local to the omxplayer package, plus a few optimisations.
+
+Finally, also remove hard-coded, absolute paths pointing to the host
+system (won't work for cross-compilation, so our paranoid wrapper would
+catch those paths).
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+---
+ Makefile         |  2 +-
+ Makefile.include | 20 ++------------------
+ 2 files changed, 3 insertions(+), 19 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index bcfadfb..3dc1a03 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,7 +4,7 @@ CFLAGS+=-std=c++0x -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX
+ 
+ LDFLAGS+=-L./ -Lffmpeg_compiled/usr/local/lib/ -lc -lWFC -lGLESv2 -lEGL -lbcm_host -lopenmaxil -lfreetype -lz
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
index 0000000..1d3cd8a
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
+	depends on BR2_INSTALL_LIBSTDCPP # boost
+	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libusb
+	depends on BR2_USE_WCHAR # boost
+	depends on BR2_PACKAGE_RPI_USERLAND
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_FFMPEG
+	select BR2_PACKAGE_FFMPEG_AVRESAMPLE
+	select BR2_PACKAGE_FFMPEG_SWSCALE
+	select BR2_PACKAGE_FREETYPE
+	select BR2_PACKAGE_LIBIDN
+	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_ZLIB
+	help
+	  OMXPlayer is a commandline OMX player for the Raspberry Pi. It was
+	  developed as a testbed for the XBMC Raspberry PI implementation
+	  and is quite handy to use standalone.
+
+	  https://github.com/popcornmix/omxplayer
+
+comment "omxplayer needs rpi-userland and a toolchain w/ C++, threads, wchar, dynamic library"
+	depends on BR2_arm
+	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_BOOST_ARCH_SUPPORTS
+	depends on !BR2_PACKAGE_RPI_USERLAND
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR || BR2_STATIC_LIBS
diff --git a/package/omxplayer/omxplayer.hash b/package/omxplayer/omxplayer.hash
new file mode 100644
index 0000000..4ee215b
--- /dev/null
+++ b/package/omxplayer/omxplayer.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha1    23eb444757e445c127a7114ae233569cac64f984                          omxplayer-6c90c7503ba4658221774759edf7f2ae816711de.tar.gz
+sha256  93ebfd654314231749936e4fc09f5ec4a361806cdb640d7579a5106921e00299  omxplayer-6c90c7503ba4658221774759edf7f2ae816711de.tar.gz
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
new file mode 100644
index 0000000..da4614b
--- /dev/null
+++ b/package/omxplayer/omxplayer.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# omxplayer
+#
+################################################################################
+
+OMXPLAYER_VERSION = 6c90c7503ba4658221774759edf7f2ae816711de
+OMXPLAYER_SITE = $(call github,popcornmix,omxplayer,$(OMXPLAYER_VERSION))
+OMXPLAYER_LICENSE = GPLv2+
+OMXPLAYER_LICENSE_FILES = COPYING
+
+OMXPLAYER_DEPENDENCIES = \
+	host-pkgconf boost dbus ffmpeg freetype libidn libusb pcre \
+	rpi-userland zlib
+
+OMXPLAYER_EXTRA_CFLAGS = \
+	-DTARGET_LINUX -DTARGET_POSIX \
+	`$(PKG_CONFIG_HOST_BINARY) --cflags bcm_host` \
+	`$(PKG_CONFIG_HOST_BINARY) --cflags freetype2` \
+	`$(PKG_CONFIG_HOST_BINARY) --cflags dbus-1`
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
