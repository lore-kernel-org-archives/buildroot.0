From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 10 Sep 2011 11:09:27 +0200
Subject: [Buildroot] [git commit] package: add Fluxbox 1.3.1 window manager
Message-ID: <20110910091032.3DF5B8D51F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4b9bd9736e97d84a86bb52844a99e74f157980c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix build without iconv, whitespace fixes]
Signed-off-by: Frederic Bassaler <frederic.bassaler@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                         |    1 +
 package/fluxbox/Config.in                 |   12 +++++++++
 package/fluxbox/fluxbox-1.3.1-iconv.patch |   37 +++++++++++++++++++++++++++++
 package/fluxbox/fluxbox.mk                |   16 ++++++++++++
 4 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 package/fluxbox/Config.in
 create mode 100644 package/fluxbox/fluxbox-1.3.1-iconv.patch
 create mode 100644 package/fluxbox/fluxbox.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..c4cecfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -127,6 +127,7 @@ comment "X Window managers"
 source "package/matchbox/Config.in"
 source "package/metacity/Config.in"
 source "package/blackbox/Config.in"
+source "package/fluxbox/Config.in"
 
 comment "X applications"
 source "package/alsamixergui/Config.in"
diff --git a/package/fluxbox/Config.in b/package/fluxbox/Config.in
new file mode 100644
index 0000000..e4d6c37
--- /dev/null
+++ b/package/fluxbox/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FLUXBOX
+	bool "fluxbox"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  The Fluxbox lightweight window manager for X
+
+	  http://fluxbox.org
+
+comment "fluxbox requires a toolchain with C++ support enabled"
+	depends on BR2_PACKAGE_XORG7 && !BR2_INSTALL_LIBSTDCPP
diff --git a/package/fluxbox/fluxbox-1.3.1-iconv.patch b/package/fluxbox/fluxbox-1.3.1-iconv.patch
new file mode 100644
index 0000000..82b4507
--- /dev/null
+++ b/package/fluxbox/fluxbox-1.3.1-iconv.patch
@@ -0,0 +1,37 @@
+From 3ed2d03446cdf53fd10c8ad056d9f86db9923666 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Fri, 9 Sep 2011 20:35:49 +0200
+Subject: [PATCH] FbString: fix build without iconv
+
+Commit 690d926 (introduced FbTk::BidiString) broke building without
+HAVE_ICONV, because of wrong variable name and use of iconv_t type.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ src/FbTk/FbString.cc |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/src/FbTk/FbString.cc b/src/FbTk/FbString.cc
+index fd34693..5295a66 100644
+--- a/src/FbTk/FbString.cc
++++ b/src/FbTk/FbString.cc
+@@ -150,6 +150,7 @@ enum ConvType { FB2X = 0, X2FB, LOCALE2FB, FB2LOCALE, CONVSIZE };
+ #ifdef HAVE_ICONV
+ static iconv_t *iconv_convs = 0;
+ #else
++typedef int iconv_t;
+ static int iconv_convs[CONVSIZE];
+ #endif // HAVE_ICONV
+ 
+@@ -292,7 +293,7 @@ string recode(iconv_t cd, const string &in) {
+ 
+     return ret;
+ #else
+-    return str;
++    return in;
+ #endif // HAVE_ICONV
+ }
+ 
+-- 
+1.7.5.4
+
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
new file mode 100644
index 0000000..0cd1328
--- /dev/null
+++ b/package/fluxbox/fluxbox.mk
@@ -0,0 +1,16 @@
+#############################################################
+#
+# FLUXBOX
+#
+#############################################################
+
+FLUXBOX_VERSION = 1.3.1
+FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
+FLUXBOX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/fluxbox/
+
+FLUXBOX_CONF_OPT = --x-includes=$(STAGING_DIR)/usr/include/X11 \
+		   --x-libraries=$(STAGING_DIR)/usr/lib
+
+FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
+
+$(eval $(call AUTOTARGETS,package,fluxbox))
-- 
1.7.3.4
