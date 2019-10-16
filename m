From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 Oct 2019 23:44:40 +0200
Subject: [Buildroot] [git commit] package/caps: new package
Message-ID: <20191016213854.D7E6D81D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=04e272ba81e02294d592cddccb23c5fa1934a8d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[Thomas:
 - drop patch 0001, use improved logic in .mk file instead
 - add dependency on !BR2_STATIC_LIBS]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  1 +
 package/Config.in                                  |  1 +
 package/caps/0001-Fix-stdint-types-with-musl.patch | 54 ++++++++++++++++++++++
 package/caps/Config.in                             | 18 ++++++++
 package/caps/caps.hash                             |  3 ++
 package/caps/caps.mk                               | 34 ++++++++++++++
 6 files changed, 111 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f08e85ebdf..9a24ca30ca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1248,6 +1248,7 @@ F:	board/lemaker/bananapro/
 F:	configs/bananapro_defconfig
 F:	package/augeas/
 F:	package/bluez-alsa/
+F:	package/caps/
 F:	package/freescale-imx/imx-alsa-plugins/
 F:	package/libopusenc/
 F:	package/libupnpp/
diff --git a/package/Config.in b/package/Config.in
index c835545fae..a51313235c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1166,6 +1166,7 @@ menu "Audio/Sound"
 	source "package/aubio/Config.in"
 	source "package/audiofile/Config.in"
 	source "package/bcg729/Config.in"
+	source "package/caps/Config.in"
 	source "package/celt051/Config.in"
 	source "package/fdk-aac/Config.in"
 	source "package/libao/Config.in"
diff --git a/package/caps/0001-Fix-stdint-types-with-musl.patch b/package/caps/0001-Fix-stdint-types-with-musl.patch
new file mode 100644
index 0000000000..23002c072e
--- /dev/null
+++ b/package/caps/0001-Fix-stdint-types-with-musl.patch
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
+Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
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
index 0000000000..f48e176def
--- /dev/null
+++ b/package/caps/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_CAPS
+	bool "caps"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS
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
+comment "caps needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
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
index 0000000000..c4e94543a6
--- /dev/null
+++ b/package/caps/caps.mk
@@ -0,0 +1,34 @@
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
+# Need to pass TARGET_CONFIGURE_OPTS in the environment to not
+# override the LDFLAGS definition of the Makefile.
+CAPS_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CXXFLAGS)"
+
+# caps Makefile uses CC and CFLAGS, but for C++
+CAPS_MAKE_OPTS = \
+	CC="$(TARGET_CXX)" \
+	STRIP=/bin/true
+
+define CAPS_BUILD_CMDS
+	$(CAPS_MAKE_ENV) $(MAKE) $(CAPS_MAKE_OPTS) all -C $(@D)
+endef
+
+define CAPS_INSTALL_TARGET_CMDS
+	$(CAPS_MAKE_ENV) $(MAKE) $(CAPS_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) install -C $(@D)
+endef
+
+$(eval $(generic-package))
