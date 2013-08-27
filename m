From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Aug 2013 22:10:08 +0200
Subject: [Buildroot] [git commit] harfbuzz: New package
Message-ID: <20130831213337.AEC2D9B591@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=941f60086d16ebcea062f723240be6667fdbb0a0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

HarfBuzz is an OpenType text shaping engine

http://www.freedesktop.org/wiki/Software/HarfBuzz/

[Peter: Move to libraries/graphics, needs C++ support]
Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/harfbuzz/Config.in   |   13 ++++++++++++
 package/harfbuzz/harfbuzz.mk |   44 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2347229..f7b0360 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -465,6 +465,7 @@ source "package/gd/Config.in"
 source "package/giblib/Config.in"
 source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
+source "package/harfbuzz/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
 source "package/lcms2/Config.in"
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
new file mode 100644
index 0000000..88e4740
--- /dev/null
+++ b/package/harfbuzz/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_HARFBUZZ
+	bool "harfbuzz"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  HarfBuzz is an OpenType text shaping engine
+
+	  http://www.freedesktop.org/wiki/Software/HarfBuzz/
+
+	  Harfbuzz can make optional use of cairo, freetype,
+	  glib2 and icu packages if they are selected.
+
+comment "harfbuzz requires a toolchain with C++ support"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
new file mode 100644
index 0000000..00651fd
--- /dev/null
+++ b/package/harfbuzz/harfbuzz.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# harfbuzz
+#
+################################################################################
+
+HARFBUZZ_VERSION = 0.9.19
+HARFBUZZ_SITE = http://www.freedesktop.org/software/harfbuzz/release/
+HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
+HARFBUZZ_LICENSE = MIT, ISC (ucdn library), ICU License (icu support library)
+HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING src/hb-icu-le/COPYING
+HARFBUZZ_INSTALL_STAGING = YES
+
+HARFBUZZ_CONF_OPT = --without-coretext --without-uniscribe --without-graphite2
+
+ifeq ($(BR2_PACKAGE_CAIRO),y)
+	HARFBUZZ_DEPENDENCIES += cairo
+	HARFBUZZ_CONF_OPT += --with-cairo=yes
+else
+	HARFBUZZ_CONF_OPT += --with-cairo=no
+endif
+
+ifeq ($(BR2_PACKAGE_FREETYPE),y)
+	HARFBUZZ_DEPENDENCIES += freetype
+	HARFBUZZ_CONF_OPT += --with-freetype=yes
+else
+	HARFBUZZ_CONF_OPT += --with-freetype=no
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+	HARFBUZZ_DEPENDENCIES += libglib2
+	HARFBUZZ_CONF_OPT += --with-glib=yes
+else
+	HARFBUZZ_CONF_OPT += --with-glib=no
+endif
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+	HARFBUZZ_DEPENDENCIES += icu
+	HARFBUZZ_CONF_OPT += --with-icu=yes
+else
+	HARFBUZZ_CONF_OPT += --with-icu=no
+endif
+
+$(eval $(autotools-package))
