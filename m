From: Aleksander Morgado <aleksander@aleksander.es>
Date: Wed,  6 Sep 2017 23:28:09 +0200
Subject: [Buildroot] [PATCH] libmbim: add udev as optional feature
Message-ID: <20170906212809.18889-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

udev support will be enabled in the build if libgudev is selected.

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---
 package/libmbim/Config.in  |  7 ++-----
 package/libmbim/libmbim.mk | 10 +++++++++-
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/libmbim/Config.in b/package/libmbim/Config.in
index 5db8efbf9..fd7dbb313 100644
--- a/package/libmbim/Config.in
+++ b/package/libmbim/Config.in
@@ -3,8 +3,6 @@ config BR2_PACKAGE_LIBMBIM
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
-	depends on BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_LIBGUDEV
 	select BR2_PACKAGE_LIBGLIB2
 	help
 	  libmbim is a glib-based library for talking to WWAN modems and
@@ -13,7 +11,6 @@ config BR2_PACKAGE_LIBMBIM
 
 	  http://www.freedesktop.org/wiki/Software/libmbim/
 
-comment "libmbim needs udev /dev management and a toolchain w/ wchar, threads"
+comment "libmbim needs a toolchain w/ wchar, threads"
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_PACKAGE_HAS_UDEV
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libmbim/libmbim.mk b/package/libmbim/libmbim.mk
index 33e500e53..b8dfa832d 100644
--- a/package/libmbim/libmbim.mk
+++ b/package/libmbim/libmbim.mk
@@ -11,9 +11,17 @@ LIBMBIM_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
 LIBMBIM_LICENSE_FILES = COPYING
 LIBMBIM_INSTALL_STAGING = YES
 
-LIBMBIM_DEPENDENCIES = libglib2 udev libgudev
+LIBMBIM_DEPENDENCIES = libglib2
 
 # we don't want -Werror
 LIBMBIM_CONF_OPTS = --enable-more-warnings=no
 
+# if libgudev available, request udev support
+ifeq ($(BR2_PACKAGE_LIBGUDEV),y)
+LIBMBIM_DEPENDENCIES += libgudev
+LIBMBIM_CONF_OPTS += --with-udev
+else
+LIBMBIM_CONF_OPTS += --without-udev
+endif
+
 $(eval $(autotools-package))
-- 
2.13.1
