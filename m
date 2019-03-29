From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Mar 2019 21:05:33 +0100
Subject: [Buildroot] [git commit] package/bayer2rgb-neon: new package
Message-ID: <20190329200223.098BB88156@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=28f68ce5d87616416347062cb0e46d3727cebced
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

bayer2rgb-neon[1] is a library which allows decoding raw camera bayer
to RGB using NEON hardware acceleration.

[1]: https://git.phytec.de/bayer2rgb-neon/

Signed-off-by: Eloi Bail <eloi.bail@savoirfairelinux.com>
[Thomas:
 - use "config" instead of "menuconfig"
 - use BR2_ARM_CPU_HAS_NEON instead of BR2_ARM_ENABLE_NEON
 - use BR2_INSTALL_LIBSTDCPP instead of BR2_TOOLCHAIN_BUILDROOT_CXX
 - add dependency on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9, because the code
   is using C++11
 - add missing Config.in comment
 - drop --prefix=/usr from CONF_OPTS, it is passed by the
   autotools-package infrastructure
 - simplify CFLAGS logic
 - move from "Applications" to "Libraries" in menuconfig
 - add missing .hash file
 - add entry in DEVELOPERS file]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/bayer2rgb-neon/Config.in           | 17 +++++++++++++++++
 package/bayer2rgb-neon/bayer2rgb-neon.hash |  3 +++
 package/bayer2rgb-neon/bayer2rgb-neon.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 48 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 07f908f8ef..7bdcbc9f3d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -648,6 +648,9 @@ F:	package/prosody/
 N:	Ed Swierk <eswierk@skyportsystems.com>
 F:	package/xxhash/
 
+N:	Eloi Bail <eloi.bail@savoirfairelinux.com>
+F:	package/bayer2rgb-neon/
+
 N:	Eric Le Bihan <eric.le.bihan.dev@free.fr>
 F:	docs/manual/adding-packages-meson.txt
 F:	package/adwaita-icon-theme/
diff --git a/package/Config.in b/package/Config.in
index 512eed7eaa..22a1fcb8a2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1250,6 +1250,7 @@ menu "Graphics"
 	source "package/at-spi2-core/Config.in"
 	source "package/atk/Config.in"
 	source "package/atkmm/Config.in"
+	source "package/bayer2rgb-neon/Config.in"
 	source "package/bullet/Config.in"
 	source "package/cairo/Config.in"
 	source "package/cairomm/Config.in"
diff --git a/package/bayer2rgb-neon/Config.in b/package/bayer2rgb-neon/Config.in
new file mode 100644
index 0000000000..ed065c1ed7
--- /dev/null
+++ b/package/bayer2rgb-neon/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_BAYER2RGB_NEON
+	bool "bayer2rgb-neon"
+	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	help
+	  bayer2rgb-neon is a library which allows
+	  to decode raw camera bayer to RGB using
+	  NEON hardware acceleration.
+
+	  https://git.phytec.de/bayer2rgb-neon/
+
+comment "bayer2rgb-neon needs a toolchain w/ C++, dynamic library, gcc >= 4.9"
+	depends on BR2_arm && BR2_ARM_CPU_HAS_NEON
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.hash b/package/bayer2rgb-neon/bayer2rgb-neon.hash
new file mode 100644
index 0000000000..bc0d6b1d51
--- /dev/null
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 b14c8b2b86207fe8222f79bef83dc3ae94222827f1882466ca65705238d15085 bayer2rgb-neon-v0.4.tar.bz2
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
new file mode 100644
index 0000000000..f6914e4214
--- /dev/null
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# bayer2rgb-neon
+#
+################################################################################
+
+BAYER2RGB_NEON_VERSION = v0.4
+BAYER2RGB_NEON_SOURCE = bayer2rgb-neon-$(BAYER2RGB_NEON_VERSION).tar.bz2
+BAYER2RGB_NEON_SITE = https://git.phytec.de/bayer2rgb-neon/snapshot
+BAYER2RGB_NEON_LICENSE = GPL-3.0
+BAYER2RGB_NEON_LICENSE_FILES = COPYING
+BAYER2RGB_NEON_INSTALL_STAGING = YES
+BAYER2RGB_NEON_DEPENDENCIES = host-pkgconf host-gengetopt
+BAYER2RGB_NEON_AUTORECONF = YES
+
+BAYER2RGB_NEON_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -mfpu=neon"
+
+define BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
+	mkdir -p $(@D)/m4
+endef
+
+BAYER2RGB_NEON_PRE_CONFIGURE_HOOKS += BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
+
+$(eval $(autotools-package))
