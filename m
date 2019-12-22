From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 11:42:57 +0100
Subject: [Buildroot] [git commit] package/openocd: selects jimtcl
Message-ID: <20191222103406.1ACAE8D531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=06aa2995350922197c6db0a46e39ac5c37d5a49e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Selects jimtcl instead of using the bundled one and drop first patch as
it is not needed anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...auto-configuration-to-force-static-librar.patch | 27 ----------------------
 ...> 0001-configure-enable-build-on-uclinux.patch} |  0
 ...4-Prevent-some-forms-of-Cross-Protocol-S.patch} |  0
 package/openocd/Config.in                          |  1 +
 package/openocd/openocd.mk                         | 10 +++-----
 5 files changed, 4 insertions(+), 34 deletions(-)

diff --git a/package/openocd/0001-Fix-jimtcl-auto-configuration-to-force-static-librar.patch b/package/openocd/0001-Fix-jimtcl-auto-configuration-to-force-static-librar.patch
deleted file mode 100644
index fd3cfa469a..0000000000
--- a/package/openocd/0001-Fix-jimtcl-auto-configuration-to-force-static-librar.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3bef159779c8fd39a070ec5c8191e18ba2efa79d Mon Sep 17 00:00:00 2001
-From: Claudio Laurita <claudio.laurita@integrazionetotale.it>
-Date: Sun, 30 Nov 2014 18:21:58 +0100
-Subject: [PATCH 2/2] Fix jimtcl auto configuration to force static library
- only. jimtcl ignores a --disable-shared option if a previous --enable-shared
- option was given. This breaks openocd compilation if shared was the preferred
- option in buildroot project.
-
-Signed-off-by: Claudio Laurita <claudio.laurita@integrazionetotale.it>
-
---- a/jimtcl/auto.def
-+++ b/jimtcl/auto.def
-@@ -194,12 +194,8 @@
-     msg-result "Enabling references"
-     define JIM_REFERENCES
- }
--if {[opt-bool shared with-jim-shared]} {
--    msg-result "Building shared library"
--} else {
--    msg-result "Building static library"
--    define JIM_STATICLIB
--}
-+msg-result "Building static library"
-+define JIM_STATICLIB
- define LIBSOEXT [format [get-define SH_SOEXTVER] [format %.2f [expr {[get-define JIM_VERSION] / 100.0}]]]
- define JIM_INSTALL [opt-bool install-jim]
- define JIM_DOCS [opt-bool docs]
diff --git a/package/openocd/0002-configure-enable-build-on-uclinux.patch b/package/openocd/0001-configure-enable-build-on-uclinux.patch
similarity index 100%
rename from package/openocd/0002-configure-enable-build-on-uclinux.patch
rename to package/openocd/0001-configure-enable-build-on-uclinux.patch
diff --git a/package/openocd/0003-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch b/package/openocd/0002-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch
similarity index 100%
rename from package/openocd/0003-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch
rename to package/openocd/0002-CVE-2018-5704-Prevent-some-forms-of-Cross-Protocol-S.patch
diff --git a/package/openocd/Config.in b/package/openocd/Config.in
index abba07e889..448872061b 100644
--- a/package/openocd/Config.in
+++ b/package/openocd/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_OPENOCD
 	bool "openocd"
+	select BR2_PACKAGE_JIMTCL
 	help
 	  OpenOCD - Open On-Chip Debugger
 
diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index d35ed77cd1..29e4f4b31f 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -11,18 +11,13 @@ OPENOCD_LICENSE = GPL-2.0+
 OPENOCD_LICENSE_FILES = COPYING
 # 0002-configure-enable-build-on-uclinux.patch patches configure.ac
 OPENOCD_AUTORECONF = YES
-
-# The bundled jimtcl really wants to find a existing $CXX, so feed it
-# false when we do not have one.
-OPENOCD_CONF_ENV = \
-	$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
-	CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
 
 OPENOCD_CONF_OPTS = \
 	--oldincludedir=$(STAGING_DIR)/usr/include \
 	--includedir=$(STAGING_DIR)/usr/include \
 	--disable-doxygen-html \
-	--with-jim-shared=no \
+	--disable-internal-jimtcl \
 	--disable-shared \
 	--enable-dummy \
 	--disable-werror
@@ -32,6 +27,7 @@ OPENOCD_CONF_OPTS = \
 
 OPENOCD_DEPENDENCIES = \
 	host-pkgconf \
+	jimtcl \
 	$(if $(BR2_PACKAGE_LIBFTDI1),libftdi1) \
 	$(if $(BR2_PACKAGE_LIBUSB),libusb) \
 	$(if $(BR2_PACKAGE_LIBUSB_COMPAT),libusb-compat) \
