From: Eloi Bail <eloi.bail@savoirfairelinux.com>
Date: Thu, 14 Mar 2019 16:34:34 +0100
Subject: [Buildroot] [PATCH 1/2] package/bayer2rgb-neon: new package
Message-ID: <20190314153435.6317-1-eloi.bail@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bayer2rgb-neon[1] is a library which allows decoding raw camera bayer
to RGB using NEON hardware acceleration.

[1]: https://git.phytec.de/bayer2rgb-neon/

Signed-off-by: Eloi Bail <eloi.bail@savoirfairelinux.com>
---
 package/Config.in                        |  1 +
 package/bayer2rgb-neon/Config.in         | 12 +++++++++
 package/bayer2rgb-neon/bayer2rgb-neon.mk | 32 ++++++++++++++++++++++++
 3 files changed, 45 insertions(+)
 create mode 100644 package/bayer2rgb-neon/Config.in
 create mode 100644 package/bayer2rgb-neon/bayer2rgb-neon.mk

diff --git a/package/Config.in b/package/Config.in
index 420e6e95a3..259bd50224 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -12,6 +12,7 @@ menu "Audio and video applications"
 	source "package/alsa-utils/Config.in"
 	source "package/atest/Config.in"
 	source "package/aumix/Config.in"
+	source "package/bayer2rgb-neon/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/bluez-alsa/Config.in"
 	source "package/dvblast/Config.in"
diff --git a/package/bayer2rgb-neon/Config.in b/package/bayer2rgb-neon/Config.in
new file mode 100644
index 0000000000..702e2e316d
--- /dev/null
+++ b/package/bayer2rgb-neon/Config.in
@@ -0,0 +1,12 @@
+menuconfig BR2_PACKAGE_BAYER2RGB_NEON
+	bool "bayer2rgb-neon"
+	depends on BR2_arm
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_ARM_ENABLE_NEON
+	depends on BR2_TOOLCHAIN_BUILDROOT_CXX
+	help
+	  bayer2rgb-neon is a library which allows
+	  to decode raw camera bayer to RGB using
+	  NEON hardware acceleration.
+
+	  https://git.phytec.de/bayer2rgb-neon/
diff --git a/package/bayer2rgb-neon/bayer2rgb-neon.mk b/package/bayer2rgb-neon/bayer2rgb-neon.mk
new file mode 100644
index 0000000000..964563d152
--- /dev/null
+++ b/package/bayer2rgb-neon/bayer2rgb-neon.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# bayer2rgb-neon
+#
+################################################################################
+
+BAYER2RGB_NEON_VERSION = v0.4
+BAYER2RGB_NEON_SOURCE = bayer2rgb-neon-$(BAYER2RGB_NEON_VERSION).tar.bz2
+BAYER2RGB_NEON_SITE = https://git.phytec.de/bayer2rgb-neon/snapshot
+
+BAYER2RGB_NEON_LICENSE = GPL-3.0
+BAYER2RGB_NEON_LICENSE_FILES = COPYING
+
+BAYER2RGB_NEON_INSTALL_STAGING = YES
+
+BAYER2RGB_NEON_DEPENDENCIES += host-pkgconf host-gengetopt
+
+BAYER2RGB_NEON_CONF_OPTS = --prefix="/usr"
+BAYER2RGB_NEON_AUTORECONF = YES
+
+BAYER2RGB_NEON_CFLAGS = $(TARGET_CFLAGS)
+BAYER2RGB_NEON_CFLAGS += -mfpu=neon
+
+BAYER2RGB_NEON_CONF_ENV = CFLAGS=" $(BAYER2RGB_NEON_CFLAGS)"
+
+define BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
+	mkdir -p $(@D)/m4
+endef
+
+BAYER2RGB_NEON_PRE_CONFIGURE_HOOKS += BAYER2RGB_NEON_PRE_CONFIGURE_FIXUP
+
+$(eval $(autotools-package))
-- 
2.20.1
