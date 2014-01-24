From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Jan 2014 20:56:23 +0100
Subject: [Buildroot] [PATCH 3/3] package/omxplayer: new package
In-Reply-To: <cover.1390593263.git.yann.morin.1998@free.fr>
References: <cover.1390593263.git.yann.morin.1998@free.fr>
Message-ID: <bba0db27fca5c16bb8903f9197aae390a2c46e01.1390593263.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

OMXplayer uses openMAX on the RPi to play videos with hardware acceleration.

Compared to using a gstreamer pipe, OMXplayer uses a complete "tunnel-mode",
in which the video is piped (after demuxing) into the hardware, all the way
down to the display, whereas gstreamer composes the video using the eglgles
sink, which uses mem-to-mem copies.

So, when playing a locally-stored 1080p video, OMXplayer uses around 20%
CPU, while gstreamer bursts up to 40+% when playing 720p and totally chokes
on 1080p; all on an non-overclocked RPi.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
---
 package/Config.in                                  |  1 +
 package/omxplayer/Config.in                        | 31 +++++++++++++++
 .../omxplayer-0000-clean-up-Makefile.include.patch | 38 +++++++++++++++++++
 package/omxplayer/omxplayer.mk                     | 44 ++++++++++++++++++++++
 4 files changed, 114 insertions(+)
 create mode 100644 package/omxplayer/Config.in
 create mode 100644 package/omxplayer/omxplayer-0000-clean-up-Makefile.include.patch
 create mode 100644 package/omxplayer/omxplayer.mk

diff --git a/package/Config.in b/package/Config.in
index 6d3b9c0..2743225 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -19,6 +19,7 @@ source "package/mpd/Config.in"
 source "package/mpg123/Config.in"
 source "package/mplayer/Config.in"
 source "package/musepack/Config.in"
+source "package/omxplayer/Config.in"
 source "package/on2-8170-libs/Config.in"
 source "package/opus-tools/Config.in"
 source "package/pulseaudio/Config.in"
diff --git a/package/omxplayer/Config.in b/package/omxplayer/Config.in
new file mode 100644
index 0000000..419b0be
--- /dev/null
+++ b/package/omxplayer/Config.in
@@ -0,0 +1,31 @@
+comment "omxplayer needs a toolchain w/ C++, threads, largefile, IPv6"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS && BR2_LARGEFILE && BR2_INET_IPV6)
+	depends on BR2_arm
+
+config BR2_PACKAGE_OMXPLAYER
+	bool "omxplayer"
+	depends on BR2_arm
+	depends on BR2_INSTALL_LIBSTDCPP        # boost, rpi-userland
+	depends on BR2_TOOLCHAIN_HAS_THREADS    # boost, dbus, libusb, rpi-userland
+	depends on BR2_LARGEFILE                # boost, ffmpeg2, rpi-userland
+	depends on BR2_INET_IPV6                # ffmpeg2
+	depends on !BR2_PACKAGE_FFMPEG          # ffmpeg2
+	depends on BR2_USE_MMU                  # dbus
+	select BR2_PACKAGE_BOOST
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_FFMPEG2
+	select BR2_PACKAGE_FFMPEG2_AVFILTER
+	select BR2_PACKAGE_FFMPEG2_SWRESAMPLE
+	select BR2_PACKAGE_FFMPEG2_SWSCALE
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
diff --git a/package/omxplayer/omxplayer-0000-clean-up-Makefile.include.patch b/package/omxplayer/omxplayer-0000-clean-up-Makefile.include.patch
new file mode 100644
index 0000000..598500d
--- /dev/null
+++ b/package/omxplayer/omxplayer-0000-clean-up-Makefile.include.patch
@@ -0,0 +1,38 @@
+Makefile.include: clean up the cruft
+
+Most of the variables that Makefile.include tries to set (and fails to),
+are already available from Buildroot's variables:
+  - AR, AS, CC, CXX, OBJDUMP...
+  - CFLAGS, CXXFLAGS, CPPFLAGS...
+
+This leaves us with a few select variables that defines (include and
+library) paths local to the omxplayer package, plus a few optimisations.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+diff -durN omxplayer-37fd6fb.orig/Makefile.include omxplayer-37fd6fb/Makefile.include
+--- omxplayer-37fd6fb.orig/Makefile.include	2013-10-16 14:21:05.000000000 +0200
++++ omxplayer-37fd6fb/Makefile.include	2013-10-17 22:53:02.294062252 +0200
+@@ -20,21 +20,5 @@
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
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
new file mode 100644
index 0000000..8b430d2
--- /dev/null
+++ b/package/omxplayer/omxplayer.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# omxplayer
+#
+################################################################################
+
+OMXPLAYER_VERSION       = f666a5dfbec36e2af7cd965558ac8643c86277a6
+OMXPLAYER_SITE          = git://github.com/popcornmix/omxplayer.git
+OMXPLAYER_LICENSE       = GPLv2+
+OMXPLAYER_LICENSE_FILES = COPYING
+
+OMXPLAYER_DEPENDENCIES  = host-pkgconf boost dbus ffmpeg2 freetype libidn \
+			  libusb pcre rpi-userland zlib
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
+OMXPLAYER_MAKE_ENV =                        \
+	USE_BUILDROOT=1                     \
+	BUILDROOT=$(TOP_DIR)                \
+	SDKSTAGE=$(STAGING_DIR)             \
+	TARGETFS=$(TARGET_DIR)              \
+	TOOLCHAIN=$(HOST_DIR)/usr           \
+	HOST=$(GNU_TARGET_NAME)             \
+	SYSROOT=$(STAGING_DIR)              \
+	JOBS=$(PARALLEL_JOBS)               \
+	$(TARGET_CONFIGURE_OPTS)            \
+	CFLAGS="$(TARGET_CFLAGS) $(OMXPLAYER_EXTRA_CFLAGS)"
+
+define OMXPLAYER_BUILD_CMDS
+	$(OMXPLAYER_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define OMXPLAYER_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/omxplayer.bin $(TARGET_DIR)/usr/bin/omxplayer
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.2
