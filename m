From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:40:15 +0100
Subject: [Buildroot] [git commit] omxplayer: bump to version 2ee17b2
Message-ID: <20171201213311.5B4CB8148C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=58a00a1333a393ae9d06f421ae0472898dded1f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates omxplayer package to the latest commit on master as
of 2017-12-01.

Latest omxplayer version no longer have partial buildroot support and
Makefile.include file, but still contains some hardcoded include paths
that needs to be removed before building.

Signed-off-by: Julius Kriukas <julius@kriukas.lt>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-Makefiles-clean-up-the-cruft.patch        | 67 ----------------------
 ...-Makefile-to-be-compatible-with-buildroot.patch | 39 +++++++++++++
 package/omxplayer/omxplayer.hash                   |  4 +-
 package/omxplayer/omxplayer.mk                     |  9 +--
 4 files changed, 42 insertions(+), 77 deletions(-)

diff --git a/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch b/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
deleted file mode 100644
index 2dc6166..0000000
--- a/package/omxplayer/0001-Makefiles-clean-up-the-cruft.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 563dafc1129848419482b540d149d0b8687cac1e Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 10 Apr 2016 16:22:53 +0200
-Subject: [PATCH] Makefiles: clean up the cruft
-
-Most of the variables that Makefile.include tries (but fails) to set,
-are already available from Buildroot's variables:
-  - AR, AS, CC, CXX, OBJDUMP...
-  - CFLAGS, CXXFLAGS, CPPFLAGS...
-
-This leaves us with a few select variables that define include and
-library paths local to the omxplayer package, plus a few optimisations.
-
-Finally, also remove hard-coded, absolute paths pointing to the host
-system (won't work for cross-compilation, so our paranoid wrapper would
-catch those paths).
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- Makefile         |  2 +-
- Makefile.include | 20 ++------------------
- 2 files changed, 3 insertions(+), 19 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index bcfadfb..3dc1a03 100644
---- a/Makefile
-+++ b/Makefile
-@@ -4,7 +4,7 @@ CFLAGS+=-std=c++0x -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX
- 
- LDFLAGS+=-L./ -Lffmpeg_compiled/usr/local/lib/ -lc -lWFC -lGLESv2 -lEGL -lbcm_host -lopenmaxil -lfreetype -lz
- 
--INCLUDES+=-I./ -Ilinux -Iffmpeg_compiled/usr/local/include/ -I /usr/include/dbus-1.0 -I /usr/lib/arm-linux-gnueabihf/dbus-1.0/include
-+INCLUDES+=-I./ -Ilinux -Iffmpeg_compiled/usr/local/include/
- 
- DIST ?= omxplayer-dist
- 
-diff --git a/Makefile.include b/Makefile.include
-index 58e9560..79ca277 100644
---- a/Makefile.include
-+++ b/Makefile.include
-@@ -20,21 +20,5 @@ endif
- 
- JOBS=7
- 
--CFLAGS			:= -isystem$(PREFIX)/include
--CXXFLAGS		:= $(CFLAGS)
--CPPFLAGS		:= $(CFLAGS)
--LDFLAGS			:= -L$(BUILDROOT)/lib
--LD					:= $(TOOLCHAIN)/bin/$(HOST)-ld --sysroot=$(SYSROOT)
--CC					:= $(TOOLCHAIN)/bin/$(HOST)-gcc --sysroot=$(SYSROOT)
--CXX         := $(TOOLCHAIN)/bin/$(HOST)-g++ --sysroot=$(SYSROOT)
--OBJDUMP			:= $(TOOLCHAIN)/bin/$(HOST)-objdump
--RANLIB			:= $(TOOLCHAIN)/bin/$(HOST)-ranlib
--STRIP				:= $(TOOLCHAIN)/bin/$(HOST)-strip
--AR 					:= $(TOOLCHAIN)/bin/$(HOST)-ar
--CXXCP 			:= $(CXX) -E
--PATH 				:= $(PREFIX)/bin:$(BUILDROOT)/output/host/usr/bin:$(PATH)
--
--CFLAGS			+= -pipe -mfloat-abi=$(FLOAT) -mcpu=arm1176jzf-s -fomit-frame-pointer -mabi=aapcs-linux -mtune=arm1176jzf-s -mfpu=vfp -Wno-psabi -mno-apcs-stack-check -g -mstructure-size-boundary=32 -mno-sched-prolog
--LDFLAGS			+= -L$(SDKSTAGE)/lib -L$(SDKSTAGE)/usr/lib -L$(SDKSTAGE)/opt/vc/lib/ -Lpcre/build
--#INCLUDES		+= -isystem$(SDKSTAGE)/usr/include -isystem$(SDKSTAGE)/opt/vc/include -isystem$(SYSROOT)/usr/include -isystem$(SDKSTAGE)/opt/vc/include/interface/vcos/pthreads -isystem$(SDKSTAGE)/usr/include/freetype2
--INCLUDES		+= -isystem$(SDKSTAGE)/opt/vc/include -isystem$(SYSROOT)/usr/include -isystem$(SDKSTAGE)/opt/vc/include/interface/vcos/pthreads -Ipcre/build -Iboost-trunk -Ifreetype2/include
-+CFLAGS			+= -fomit-frame-pointer -Wno-psabi -mno-apcs-stack-check    \
-+			   -mstructure-size-boundary=32 -mno-sched-prolog
--- 
-1.9.1
-
diff --git a/package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch b/package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch
new file mode 100644
index 0000000..8f8bfad
--- /dev/null
+++ b/package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch
@@ -0,0 +1,39 @@
+From 40bf9c0960becaf0e592cac901466af93f24e52b Mon Sep 17 00:00:00 2001
+From: Julius Kriukas <julius@kriukas.lt>
+Date: Fri, 1 Dec 2017 18:29:24 +0200
+Subject: [PATCH] Update Makefile to be compatible with buildroot
+
+- Append to existing CFLAGS instead of overwriting.
+- Remove cross-compilation specific options from CFLAGS, they will be
+  set by buildroot.
+- Remove local ffmpeg_compiled include, buildroot will build ffmpeg
+  separately.
+- Remove hard-coded dbus, freetype, rpi-firmware include paths, they
+  will be added by buildroot.
+
+Signed-off-by: Julius Kriukas <julius@kriukas.lt>
+---
+ Makefile | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 5f4e414..53fa1bc 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,10 +1,10 @@
+-CFLAGS=-pipe -mfloat-abi=hard -mcpu=arm1176jzf-s -fomit-frame-pointer -mabi=aapcs-linux -mtune=arm1176jzf-s -mfpu=vfp -Wno-psabi -mno-apcs-stack-check -g -mstructure-size-boundary=32 -mno-sched-prolog
++CFLAGS+=-fomit-frame-pointer -Wno-psabi -mno-apcs-stack-check -g -mstructure-size-boundary=32 -mno-sched-prolog
+ CFLAGS+=-std=c++0x -D__STDC_CONSTANT_MACROS -D__STDC_LIMIT_MACROS -DTARGET_POSIX -DTARGET_LINUX -fPIC -DPIC -D_REENTRANT -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DHAVE_CMAKE_CONFIG -D__VIDEOCORE4__ -U_FORTIFY_SOURCE -Wall -DHAVE_OMXLIB -DUSE_EXTERNAL_FFMPEG  -DHAVE_LIBAVCODEC_AVCODEC_H -DHAVE_LIBAVUTIL_OPT_H -DHAVE_LIBAVUTIL_MEM_H -DHAVE_LIBAVUTIL_AVUTIL_H -DHAVE_LIBAVFORMAT_AVFORMAT_H -DHAVE_LIBAVFILTER_AVFILTER_H -DHAVE_LIBSWRESAMPLE_SWRESAMPLE_H -DOMX -DOMX_SKIP64BIT -ftree-vectorize -DUSE_EXTERNAL_OMX -DTARGET_RASPBERRY_PI -DUSE_EXTERNAL_LIBBCM_HOST
+ 
+ LDFLAGS=-L$(SDKSTAGE)/opt/vc/lib/
+-LDFLAGS+=-L./ -Lffmpeg_compiled/usr/local/lib/ -lc -lbrcmGLESv2 -lbrcmEGL -lbcm_host -lopenmaxil -lfreetype -lz -lasound
++LDFLAGS+=-L./ -lc -lbrcmGLESv2 -lbrcmEGL -lbcm_host -lopenmaxil -lfreetype -lz -lasound
+ 
+-INCLUDES+=-I./ -Ilinux -Iffmpeg_compiled/usr/local/include/ -I /usr/include/dbus-1.0 -I /usr/lib/arm-linux-gnueabihf/dbus-1.0/include -I/usr/include/freetype2 -isystem$(SDKSTAGE)/opt/vc/include -isystem$(SDKSTAGE)/opt/vc/include/interface/vcos/pthreads
++INCLUDES+=-I./ -Ilinux
+ 
+ DIST ?= omxplayer-dist
+ STRIP ?= strip
+-- 
+2.11.0
+
diff --git a/package/omxplayer/omxplayer.hash b/package/omxplayer/omxplayer.hash
index 4ee215b..3715e48 100644
--- a/package/omxplayer/omxplayer.hash
+++ b/package/omxplayer/omxplayer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha1    23eb444757e445c127a7114ae233569cac64f984                          omxplayer-6c90c7503ba4658221774759edf7f2ae816711de.tar.gz
-sha256  93ebfd654314231749936e4fc09f5ec4a361806cdb640d7579a5106921e00299  omxplayer-6c90c7503ba4658221774759edf7f2ae816711de.tar.gz
+sha1    258316ff94a1f1e5e47a5bb1a28d324ab08871a9                          omxplayer-2ee17b22a6149a043a2e402580504f282c615373.tar.gz
+sha256  c16498258ee78c59f9705b621e4b5b7b0673e1687d94681f9dc52451b1ceba48  omxplayer-2ee17b22a6149a043a2e402580504f282c615373.tar.gz
diff --git a/package/omxplayer/omxplayer.mk b/package/omxplayer/omxplayer.mk
index 9bb5877..6e92250 100644
--- a/package/omxplayer/omxplayer.mk
+++ b/package/omxplayer/omxplayer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OMXPLAYER_VERSION = 6c90c7503ba4658221774759edf7f2ae816711de
+OMXPLAYER_VERSION = 2ee17b22a6149a043a2e402580504f282c615373
 OMXPLAYER_SITE = $(call github,popcornmix,omxplayer,$(OMXPLAYER_VERSION))
 OMXPLAYER_LICENSE = GPL-2.0+
 OMXPLAYER_LICENSE_FILES = COPYING
@@ -23,14 +23,7 @@ OMXPLAYER_EXTRA_CFLAGS = \
 # procedure is, well, tainted. Fix this by forcing the real,
 # correct values.
 OMXPLAYER_MAKE_ENV = \
-	USE_BUILDROOT=1 \
-	BUILDROOT=$(TOP_DIR) \
 	SDKSTAGE=$(STAGING_DIR) \
-	TARGETFS=$(TARGET_DIR) \
-	TOOLCHAIN=$(HOST_DIR) \
-	HOST=$(GNU_TARGET_NAME) \
-	SYSROOT=$(STAGING_DIR) \
-	JOBS=$(PARALLEL_JOBS) \
 	$(TARGET_CONFIGURE_OPTS) \
 	STRIP=true \
 	CFLAGS="$(TARGET_CFLAGS) $(OMXPLAYER_EXTRA_CFLAGS)"
