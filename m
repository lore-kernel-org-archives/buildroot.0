From: Markos Chandras <markos.chandras@imgtec.com>
Date: Mon, 19 Aug 2013 12:44:48 +0100
Subject: [Buildroot] [PATCH] harfbuzz: New package
Message-ID: <1376912688-13267-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HarfBuzz is an OpenType text shaping engine

http://www.freedesktop.org/wiki/Software/HarfBuzz/

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
 package/Config.in            |  1 +
 package/harfbuzz/Config.in   | 34 ++++++++++++++++++++++++++++++++++
 package/harfbuzz/harfbuzz.mk | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 79 insertions(+)
 create mode 100644 package/harfbuzz/Config.in
 create mode 100644 package/harfbuzz/harfbuzz.mk

diff --git a/package/Config.in b/package/Config.in
index 7069d77..8a87563 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -124,6 +124,7 @@ source "package/directfb-examples/Config.in"
 source "package/divine/Config.in"
 source "package/fbdump/Config.in"
 source "package/fbgrab/Config.in"
+source "package/harfbuzz/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/fbset/Config.in"
 endif
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
new file mode 100644
index 0000000..e96ff7f
--- /dev/null
+++ b/package/harfbuzz/Config.in
@@ -0,0 +1,34 @@
+config BR2_PACKAGE_HARFBUZZ
+	bool "harfbuzz"
+	help
+	  HarfBuzz is an OpenType text shaping engine
+
+	  http://www.freedesktop.org/wiki/Software/HarfBuzz/
+
+if BR2_PACKAGE_HARFBUZZ
+
+config BR2_PACKAGE_HARFBUZZ_CAIRO
+	bool "Use cairo"
+	select BR2_PACKAGE_CAIRO
+
+config BR2_PACKAGE_HARFBUZZ_FREETYPE
+	bool "Use the FreeType library"
+	select BR2_PACKAGE_FREETYPE
+
+config BR2_PACKAGE_HARFBUZZ_GLIB
+	bool "Use glib"
+	select BR2_PACKAGE_LIBGLIB2
+	depends on BR2_USE_WCHAR # gettext dep in libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+comment "glib support requires a toolchain with WCHAR and threading support."
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
+
+config BR2_PACKAGE_HARFBUZZ_ICU
+	bool "Use ICU"
+	select BR2_PACKAGE_ICU
+	depends on BR2_USE_WCHAR # icu
+	depends on BR2_INSTALL_LIBSTDCPP # icu
+
+comment "icu support requires a toolchain with WCHAR and LIBSTDCPP support."
+	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP
+endif
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
new file mode 100644
index 0000000..9aee90f
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
+HARFBUZZ_LICENSE = Old-MIT ISC ICU
+HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING src/hb-icu-le/COPYING
+HARFBUZZ_INSTALL_STAGING = YES
+
+HARFBUZZ_CONF_OPT = --without-coretext --without-uniscribe --without-graphite2
+
+ifeq ($(BR2_PACKAGE_HARFBUZZ_CAIRO),y)
+	HARFBUZZ_DEPENDENCIES += cairo
+	HARFBUZZ_CONF_OPT += --with-cairo=yes
+else
+	HARFBUZZ_CONF_OPT += --with-cairo=no
+endif
+
+ifeq ($(BR2_PACKAGE_HARFBUZZ_FREETYPE),y)
+	HARFBUZZ_DEPENDENCIES += freetype
+	HARFBUZZ_CONF_OPT += --with-freetype=yes
+else
+	HARFBUZZ_CONF_OPT += --with-freetype=no
+endif
+
+ifeq ($(BR2_PACKAGE_HARFBUZZ_GLIB),y)
+	HARFBUZZ_DEPENDENCIES += libglib2
+	HARFBUZZ_CONF_OPT += --with-glib=yes
+else
+	HARFBUZZ_CONF_OPT += --with-glib=no
+endif
+
+ifeq ($(BR2_PACKAGE_HARFBUZZ_ICU),y)
+	HARFBUZZ_DEPENDENCIES += icu
+	HARFBUZZ_CONF_OPT += --with-icu=yes
+else
+	HARFBUZZ_CONF_OPT += --with-icu=no
+endif
+
+$(eval $(autotools-package))
-- 
1.8.3.2
