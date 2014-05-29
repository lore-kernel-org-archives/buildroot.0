From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 29 May 2014 22:04:35 +0200
Subject: [Buildroot] [PATCH v2] dillo: new package
Message-ID: <1401393875-11832-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>

---
Changes v1 -> v2:
  - remove empty line and jpeg/png hint from Config.in (as suggested
    by Thomas Petazzoni)
  - add dillo configure.ac patch and give explicitly pathes for
    fltk-config and libpng-config (as suggested by Thomas Petazzoni)
---
 package/Config.in                                  |  1 +
 package/dillo/Config.in                            | 17 +++++++
 ...c-change-fltk-config-test-to-be-more-cros.patch | 40 ++++++++++++++++
 package/dillo/dillo.mk                             | 54 ++++++++++++++++++++++
 4 files changed, 112 insertions(+)
 create mode 100644 package/dillo/Config.in
 create mode 100644 package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
 create mode 100644 package/dillo/dillo.mk

diff --git a/package/Config.in b/package/Config.in
index 3bc8d24..5a92032 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -224,6 +224,7 @@ source "package/x11r7/Config.in"
 comment "X applications"
 source "package/alsamixergui/Config.in"
 source "package/apitrace/Config.in"
+source "package/dillo/Config.in"
 source "package/docker/Config.in"
 source "package/feh/Config.in"
 source "package/freerdp/Config.in"
diff --git a/package/dillo/Config.in b/package/dillo/Config.in
new file mode 100644
index 0000000..b90d151
--- /dev/null
+++ b/package/dillo/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_DILLO
+	bool "dillo"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fltk fork()
+	select BR2_PACKAGE_FLTK
+	help
+	  Dillo is a multi-platform graphical web browser known
+	  for its speed and small footprint. 
+
+	  Enable openssl package to gain https support.
+
+	  http://www.dillo.org
+
+comment "dillo needs a toolchain w/ C++"
+        depends on BR2_PACKAGE_XORG7 && BR2_USE_MMU
+        depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch b/package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
new file mode 100644
index 0000000..2f184fb
--- /dev/null
+++ b/package/dillo/dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
@@ -0,0 +1,40 @@
+From b2ac6e42f0790bbe1704c468e740cb26293579a7 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Thu, 29 May 2014 21:29:18 +0200
+Subject: [PATCH] configure.ac: change fltk-config test to be more
+ crosscompile/buildroot friendly
+
+Change fltk-config usage as suggested by Thomas Petazzoni [1].
+
+[1] http://lists.busybox.net/pipermail/buildroot/2014-May/097607.html
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ configure.ac | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index e3ace75..e1f4b6e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -112,12 +112,13 @@ dnl -------------------------
+ dnl
+ dnl For debugging and to be user friendly
+ AC_MSG_CHECKING([FLTK 1.3])
+-fltk_version="`fltk-config --version 2>/dev/null`"
++AC_PATH_PROG(FLTK_CONFIG,fltk-config)
++fltk_version="`$FLTK_CONFIG --version 2>/dev/null`"
+ case $fltk_version in
+   1.3.*) AC_MSG_RESULT(yes)
+-         LIBFLTK_CXXFLAGS=`fltk-config --cxxflags`
+-         LIBFLTK_CFLAGS=`fltk-config --cflags`
+-         LIBFLTK_LIBS=`fltk-config --ldflags`;;
++         LIBFLTK_CXXFLAGS=`$FLTK_CONFIG --cxxflags`
++         LIBFLTK_CFLAGS=`$FLTK_CONFIG --cflags`
++         LIBFLTK_LIBS=`$FLTK_CONFIG --ldflags`;;
+   ?*)    AC_MSG_RESULT(no)
+          AC_MSG_ERROR(FLTK 1.3 required; version found: $fltk_version);;
+   *)     AC_MSG_RESULT(no)
+-- 
+1.8.1.4
+
diff --git a/package/dillo/dillo.mk b/package/dillo/dillo.mk
new file mode 100644
index 0000000..f736273
--- /dev/null
+++ b/package/dillo/dillo.mk
@@ -0,0 +1,54 @@
+################################################################################
+#
+# dillo
+#
+################################################################################
+
+DILLO_VERSION = 3.0.4
+DILLO_SOURCE = dillo-$(DILLO_VERSION).tar.bz2
+DILLO_SITE = http://www.dillo.org/download
+DILLO_LICENSE = GPLv3+
+DILLO_LICENSE_FILES = COPYING
+# dillo-0001-configure.ac-change-fltk-config-test-to-be-more-cros.patch
+# touches configure.ac
+DILLO_AUTORECONF = YES
+
+DILLO_DEPENDENCIES = fltk
+
+DILLO_CONF_ENV = ac_cv_path_FLTK_CONFIG=$(STAGING_DIR)/usr/bin/fltk-config
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+	DILLO_CONF_OPT += --enable-ssl
+	DILLO_DEPENDENCIES += openssl
+else
+	DILLO_CONF_OPT += --disable-ssl
+endif
+
+ifeq ($(BR2_INET_IPV6),y)
+	DILLO_CONF_OPT += --enable-ipv6
+else
+	DILLO_CONF_OPT += --disable-ipv6
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+	DILLO_CONF_OPT += --enable-png
+	DILLO_DEPENDENCIES += libpng
+	DILLO_CONF_ENV += PNG_CONFIG=$(STAGING_DIR)/usr/bin/libpng-config
+else
+	DILLO_CONF_OPT += --disable-png
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+	DILLO_CONF_OPT += --enable-jpeg
+	DILLO_DEPENDENCIES += libjpeg
+else
+	DILLO_CONF_OPT += --disable-jpeg
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+	DILLO_CONF_OPT += --enable-threaded-dns
+else
+	DILLO_CONF_OPT += --disable-threaded-dns
+endif
+
+$(eval $(autotools-package))
-- 
1.8.1.4
