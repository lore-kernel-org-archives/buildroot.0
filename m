From: Markos Chandras <markos.chandras@imgtec.com>
Date: Thu, 22 Aug 2013 22:32:44 +0100
Subject: [Buildroot] [PATCH v3] harfbuzz: New package
Message-ID: <1377207164-10433-1-git-send-email-markos.chandras@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HarfBuzz is an OpenType text shaping engine

http://www.freedesktop.org/wiki/Software/HarfBuzz/

Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
---
Changes since v2:
- Drop BR2_PACKAGE_HARFBUZZ_* symbols. We enable/disable
these options if the respective packages are selected.
- Fix license name for each component.
Suggested by Arnout Vandecappelle
http://lists.busybox.net/pipermail/buildroot/2013-August/076728.html

Changes since v1:
- Fix alphabetical order in package/Config.in
- Rename 'LIBSTDCPP support' to 'C++ support'
---
 package/Config.in            |  1 +
 package/harfbuzz/Config.in   |  9 +++++++++
 package/harfbuzz/harfbuzz.mk | 44 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 package/harfbuzz/Config.in
 create mode 100644 package/harfbuzz/harfbuzz.mk

diff --git a/package/Config.in b/package/Config.in
index 7069d77..1b06755 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -130,6 +130,7 @@ endif
 source "package/fbterm/Config.in"
 source "package/fbv/Config.in"
 source "package/fb-test-app/Config.in"
+source "package/harfbuzz/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
new file mode 100644
index 0000000..fb5fc8f
--- /dev/null
+++ b/package/harfbuzz/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_HARFBUZZ
+	bool "harfbuzz"
+	help
+	  HarfBuzz is an OpenType text shaping engine
+
+	  http://www.freedesktop.org/wiki/Software/HarfBuzz/
+
+	  Harfbuzz can make optional use of cairo, freetype,
+	  glib2 and icu packages if they are selected.
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
-- 
1.8.3.2
