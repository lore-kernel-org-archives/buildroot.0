From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 14 Oct 2019 13:26:55 +0200
Subject: [Buildroot] [PATCH v3] package/caps: new package
Message-ID: <20191014112655.25540-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Martin Bark <martin@barkynet.com>

CAPS is a collection of audio plugins comprising virtual guitar
amplification and a small range of basic classic effects, signal
processors and generators of often elementary and occasionally
exotic nature.

The plugins aim to satisfy the highest demands in sound quality
with maximal computational efficiency and zero latency.

Note, that the original patch [1] dates back in 2014.

[1] https://patchwork.ozlabs.org/patch/376822/

CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
Changes v2 -> v3:
  - Update version to 0.9.26
  - Add patch to fix build with musl
Changes v1 -> v2:
  - Added dependency to BR2_INSTALL_LIBSTDCPP (Thomas Petazzoni)
  - Add description and Signed-off-by to patch (Thomas Petazzoni)
  - Fixed use of $(TARGET_CONFIGURE_OPTS) and $(TARGET_MAKE_ENV) (Thomas Petazzoni)
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/caps/0001-Fix-cross-compilation.patch | 82 +++++++++++++++++++
 .../0002-Fix-stdint-types-with-musl.patch     | 54 ++++++++++++
 package/caps/Config.in                        | 17 ++++
 package/caps/caps.hash                        |  3 +
 package/caps/caps.mk                          | 22 +++++
 7 files changed, 180 insertions(+)
 create mode 100644 package/caps/0001-Fix-cross-compilation.patch
 create mode 100644 package/caps/0002-Fix-stdint-types-with-musl.patch
 create mode 100644 package/caps/Config.in
 create mode 100644 package/caps/caps.hash
 create mode 100644 package/caps/caps.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index dbe8f9128d..8db3ac2a74 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1249,6 +1249,7 @@ F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
 F:	package/augeas/
 F:	package/bluez-alsa/
+F:	package/caps/
 F:	package/freescale-imx/imx-alsa-plugins/
 F:	package/libopusenc/
 F:	package/libupnpp/
diff --git a/package/Config.in b/package/Config.in
index 47b602c547..d1f8176fc9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1162,6 +1162,7 @@ menu "Audio/Sound"
 	source "package/aubio/Config.in"
 	source "package/audiofile/Config.in"
 	source "package/bcg729/Config.in"
+	source "package/caps/Config.in"
 	source "package/celt051/Config.in"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
diff --git a/package/caps/0001-Fix-cross-compilation.patch b/package/caps/0001-Fix-cross-compilation.patch
new file mode 100644
index 0000000000..6bb7111537
--- /dev/null
+++ b/package/caps/0001-Fix-cross-compilation.patch
@@ -0,0 +1,82 @@
+From d9861488a91b9e6b96b8bfae8c2b94f90d8d421b Mon Sep 17 00:00:00 2001
+From: Martin Bark <martin@barkynet.com>
+Date: Tue, 5 Aug 2014 21:59:23 +0100
+Subject: [PATCH] Fix cross compilation
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Corrections to Makefile to correctly use CXX and CXXFLAGS when compiling
+c++ code.
+
+Signed-off-by: Martin Bark <martin@barkynet.com>
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ Makefile | 19 +++++++++----------
+ 1 file changed, 9 insertions(+), 10 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index bcbb8a6..cc8cdce 100644
+--- a/Makefile
++++ b/Makefile
+@@ -3,18 +3,18 @@ VERSION = 0.9.26
+ PREFIX = /usr
+ DESTDIR = 
+ 
+-CC = g++
++CXX ?= g++
+ 
+ OPTS = -O3 -ffast-math -funroll-loops -Wall -fPIC -DPIC 
+ #OPTS = -fPIC -DPIC -g -DDEBUG 
+ 
+ _LDFLAGS = -shared 
+-STRIP = strip
++STRIP ?= strip
+ 
+ -include defines.make
+ 
+-CFLAGS += $(OPTS) $(_CFLAGS)
+-LDFLAGS += $(_LDFLAGS) $(CFLAGS)
++override CXXFLAGS += $(OPTS) $(_CXXFLAGS)
++override LDFLAGS += $(CXXFLAGS) $(_LDFLAGS) 
+ 
+ PLUG = caps
+ 
+@@ -53,19 +53,18 @@ $(PLUG).rdf: all tools/make-rdf.py
+ 	python tools/make-rdf.py > $(PLUG).rdf
+ 
+ $(PLUG).so: $(OBJECTS)
+-	$(CC) $(ARCH) $(LDFLAGS) -o $@ $(OBJECTS)
++	$(CXX) $(ARCH) $(LDFLAGS) -o $@ $(OBJECTS)
+ 
+ .cc.s: 
+-	$(CC) $(ARCH) $(CFLAGS) -S $<
++	$(CXX) $(ARCH) $(CXXFLAGS) -S $<
+ 
+ .cc.o: depend 
+-	$(CC) $(ARCH) $(CFLAGS) -o $@ -c $<
++	$(CXX) $(ARCH) $(CXXFLAGS) -o $@ -c $<
+ 
+ tags: $(SOURCES) $(HEADERS)
+ 	@-if [ -x /usr/bin/ctags ]; then ctags $(SOURCES) $(HEADERS) >/dev/null 2>&1 ; fi
+ 
+ install: all
+-	@$(STRIP) $(PLUG).so > /dev/null
+ 	install -d $(DESTDIR)$(DEST)
+ 	install -m 644 $(PLUG).so $(DESTDIR)$(DEST)
+ 	install -d $(DESTDIR)$(RDFDEST)
+@@ -92,9 +91,9 @@ version.h:
+ 	@VERSION=$(VERSION) python tools/make-version.h.py
+ 
+ dist: all $(PLUG).rdf version.h
+-	tools/make-dist.py caps $(VERSION) $(CFLAGS)
++	tools/make-dist.py caps $(VERSION) $(CXXFLAGS)
+ 
+ depend: $(SOURCES) $(HEADERS)
+-	$(CC) -MM $(CFLAGS) $(DEFINES) $(SOURCES) > depend
++	$(CXX) -MM $(CXXFLAGS) $(DEFINES) $(SOURCES) > depend
+ 
+ -include depend
+-- 
+2.22.0
+
diff --git a/package/caps/0002-Fix-stdint-types-with-musl.patch b/package/caps/0002-Fix-stdint-types-with-musl.patch
new file mode 100644
index 0000000000..23002c072e
--- /dev/null
+++ b/package/caps/0002-Fix-stdint-types-with-musl.patch
@@ -0,0 +1,54 @@
+From 626e60a82120961ccee117dfcb5c28f72f8a26e5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
+Date: Wed, 28 Aug 2019 11:25:49 +0200
+Subject: [PATCH] Fix stdint types with musl
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fetched from:
+https://github.com/dsacre/meta-lad/blob/master/recipes-multimedia/lv2/caps-lv2/fix-stdint-types-with-musl.patch
+
+Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
+---
+ basics.h | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/basics.h b/basics.h
+index 643d96e..34e5f63 100644
+--- a/basics.h
++++ b/basics.h
+@@ -39,6 +39,7 @@
+ #define _ISOC9X_SOURCE 1
+ 
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <string.h>
+ 
+ #include <math.h>
+@@ -49,14 +50,14 @@
+ 
+ #include "ladspa.h"
+ 
+-typedef __int8_t			int8;
+-typedef __uint8_t			uint8;
+-typedef __int16_t			int16;
+-typedef __uint16_t		uint16;
+-typedef __int32_t			int32;
+-typedef __uint32_t		uint32;
+-typedef __int64_t			int64;
+-typedef __uint64_t		uint64;
++typedef int8_t			int8;
++typedef uint8_t			uint8;
++typedef int16_t			int16;
++typedef uint16_t		uint16;
++typedef int32_t			int32;
++typedef uint32_t		uint32;
++typedef int64_t			int64;
++typedef uint64_t		uint64;
+ 
+ #define MIN_GAIN 1e-6 /* -120 dB */
+ /* smallest non-denormal 32 bit IEEE float is 1.18e-38 */
+-- 
+2.22.0
+
diff --git a/package/caps/Config.in b/package/caps/Config.in
new file mode 100644
index 0000000000..798ef74462
--- /dev/null
+++ b/package/caps/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_CAPS
+	bool "caps"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  CAPS is a collection of audio plugins comprising virtual
+	  guitar amplification and a small range of basic classic
+	  effects, signal processors and generators of often
+	  elementary and occasionally exotic nature.
+
+	  The plugins aim to satisfy the highest demands in sound
+	  quality with maximal computational efficiency and zero
+	  latency.
+
+	  http://quitte.de/dsp/caps.html
+
+comment "caps needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/caps/caps.hash b/package/caps/caps.hash
new file mode 100644
index 0000000000..958f4b68be
--- /dev/null
+++ b/package/caps/caps.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 e7496c5bce05abebe3dcb635926153bbb58a9337a6e423f048d3b61d8a4f98c9  caps_0.9.26.tar.bz2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/caps/caps.mk b/package/caps/caps.mk
new file mode 100644
index 0000000000..b0596bc03e
--- /dev/null
+++ b/package/caps/caps.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# caps
+#
+################################################################################
+
+CAPS_VERSION = 0.9.26
+CAPS_SOURCE = caps_$(CAPS_VERSION).tar.bz2
+CAPS_SITE = http://quitte.de/dsp
+CAPS_LICENSE = GPLv3
+CAPS_LICENSE_FILES = COPYING
+
+define CAPS_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) all -C $(@D)
+endef
+
+define CAPS_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		DESTDIR=$(TARGET_DIR) install -C $(@D)
+endef
+
+$(eval $(generic-package))
-- 
2.23.0
