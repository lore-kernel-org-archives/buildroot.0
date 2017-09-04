From: Aleksander Morgado <aleksander@aleksander.es>
Date: Mon,  4 Sep 2017 19:03:24 +0200
Subject: [Buildroot] [PATCH] libmbim: udev is optional
Message-ID: <20170904170324.5426-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Don't require udev/libgudev when building libmbim, just make it
optional. If there is udev support in the setup, require libgudev and
configure using --with-udev explicitly; otherwise just --without-udev.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libmbim/Config.in  | 16 +++++++++++-----
 package/libmbim/libmbim.mk |  9 ++++++++-
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index 4f8059264..35fceca67 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_LIBMBIM
 	bool "libmbim"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
-	depends on BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libmbim is a glib-based library for talking to WWAN modems and
@@ -12,6 +10,14 @@ config BR2_PACKAGE_LIBMBIM
 
 	  http://www.freedesktop.org/wiki/Software/libmbim/
 
-comment "libmbim needs udev /dev management and a toolchain w/ wchar, threads"
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV
+if BR2_PACKAGE_LIBMBIM
+config BR2_PACKAGE_LIBMBIM_UDEV
+	bool "udev support"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBGUDEV
+	help
+	  This option enables udev support in libmbim
+endif
+
+comment "libmbim needs a toolchain w/ wchar, threads"
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 33e500e53..03291a27f 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -11,9 +11,16 @@ LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING
 LIBMBIM_INSTALL_STAGING = YES
 
-LIBMBIM_DEPENDENCIES = libglib2 udev libgudev
+LIBMBIM_DEPENDENCIES = libglib2
 
 # we don't want -Werror
 LIBMBIM_CONF_OPTS = --enable-more-warnings=no
 
+ifeq ($(BR2_PACKAGE_LIBMBIM_UDEV),y)
+LIBMBIM_DEPENDENCIES += libgudev
+LIBMBIM_CONF_OPTS += --with-udev
+else
+LIBMBIM_CONF_OPTS += --without-udev
+endif
+
 $(eval $(autotools-package))
-- 
2.13.1
