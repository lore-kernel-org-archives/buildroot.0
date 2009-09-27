From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Sep 2009 23:21:50 +0200
Subject: [Buildroot] [git commit master] package: add gvfs
Message-ID: <20090927212249.75D0777797@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bc95b3ad3b02cc23d9efd89654b52492e492b959
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #303.

Peter: Fix Kconfig (largefile, expat, indentation)

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                     |    3 +-
 package/Config.in                           |    1 +
 package/gvfs/Config.in                      |   19 +++++
 package/gvfs/gvfs-1.2.2-libsoup-gnome.patch |  104 +++++++++++++++++++++++++++
 package/gvfs/gvfs.mk                        |   73 +++++++++++++++++++
 5 files changed, 199 insertions(+), 1 deletions(-)
 create mode 100644 package/gvfs/Config.in
 create mode 100644 package/gvfs/gvfs-1.2.2-libsoup-gnome.patch
 create mode 100644 package/gvfs/gvfs.mk

diff --git a/CHANGES b/CHANGES
index 83b8381..7928882 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2009.11, Not yet released:
 
-	New packages: divine, libarchive, libmicrohttpd, sdl_sound
+	New packages: divine, gvfs, libarchive, libmicrohttpd, sdl_sound
 
 	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
 	iptables, kernel-headers, kismet, libevent, libglib2, netkittelnet,
@@ -10,6 +10,7 @@
 	Issues resolved (http://bugs.uclibc.org):
 
 	#301: allow to install libsmbclient
+	#303: add gvfs package
 	#477: Add sdl_sound package
 	#487: Make kismet package sexier
 	#527: misc fixes for dnsmasq package
diff --git a/package/Config.in b/package/Config.in
index 42539fd..784ce35 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -244,6 +244,7 @@ source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/fuse/Config.in"
 source "package/gadgetfs-test/Config.in"
+source "package/gvfs/Config.in"
 source "package/hal/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/hdparm/Config.in"
diff --git a/package/gvfs/Config.in b/package/gvfs/Config.in
new file mode 100644
index 0000000..8a541e7
--- /dev/null
+++ b/package/gvfs/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_GVFS
+	bool "gvfs"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_EXPAT # needed by dbus(-glib)
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_SHARED_MIME_INFO
+	help
+	  gvfs is a userspace virtual filesystem where mount runs as a
+	  separate processes which you talk to via D-Bus. It also
+	  contains a gio module that seamlessly adds gvfs support to
+	  all applications using the gio API. It also supports exposing
+	  the gvfs mounts to non-gio applications using fuse.
+
+	  http://en.wikipedia.org/wiki/GVFS
+
+comment "gvfs requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/gvfs/gvfs-1.2.2-libsoup-gnome.patch b/package/gvfs/gvfs-1.2.2-libsoup-gnome.patch
new file mode 100644
index 0000000..cb59221
--- /dev/null
+++ b/package/gvfs/gvfs-1.2.2-libsoup-gnome.patch
@@ -0,0 +1,104 @@
+--- gvfs-1.2.2-orig/configure	2009-04-13 19:30:57.000000000 +0200
++++ gvfs-1.2.2/configure	2009-05-25 11:49:31.000000000 +0200
+@@ -25645,8 +25645,8 @@
+ 
+ if test "x$enable_http" != "xno"; then
+   if test -n "$PKG_CONFIG" && \
+-    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-gnome-2.4 >= 2.25.1\"") >&5
+-  ($PKG_CONFIG --exists --print-errors "libsoup-gnome-2.4 >= 2.25.1") 2>&5
++    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-2.4 >= 2.25.1\"") >&5
++  ($PKG_CONFIG --exists --print-errors "libsoup-2.4 >= 2.25.1") 2>&5
+   ac_status=$?
+   $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); }; then
+@@ -25663,12 +25663,12 @@
+     pkg_cv_HTTP_CFLAGS="$HTTP_CFLAGS"
+  elif test -n "$PKG_CONFIG"; then
+     if test -n "$PKG_CONFIG" && \
+-    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-gnome-2.4 libxml-2.0\"") >&5
+-  ($PKG_CONFIG --exists --print-errors "libsoup-gnome-2.4 libxml-2.0") 2>&5
++    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-2.4 libxml-2.0\"") >&5
++  ($PKG_CONFIG --exists --print-errors "libsoup-2.4 libxml-2.0") 2>&5
+   ac_status=$?
+   $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); }; then
+-  pkg_cv_HTTP_CFLAGS=`$PKG_CONFIG --cflags "libsoup-gnome-2.4 libxml-2.0" 2>/dev/null`
++  pkg_cv_HTTP_CFLAGS=`$PKG_CONFIG --cflags "libsoup-2.4 libxml-2.0" 2>/dev/null`
+ else
+   pkg_failed=yes
+ fi
+@@ -25679,12 +25679,12 @@
+     pkg_cv_HTTP_LIBS="$HTTP_LIBS"
+  elif test -n "$PKG_CONFIG"; then
+     if test -n "$PKG_CONFIG" && \
+-    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-gnome-2.4 libxml-2.0\"") >&5
+-  ($PKG_CONFIG --exists --print-errors "libsoup-gnome-2.4 libxml-2.0") 2>&5
++    { ($as_echo "$as_me:$LINENO: \$PKG_CONFIG --exists --print-errors \"libsoup-2.4 libxml-2.0\"") >&5
++  ($PKG_CONFIG --exists --print-errors "libsoup-2.4 libxml-2.0") 2>&5
+   ac_status=$?
+   $as_echo "$as_me:$LINENO: \$? = $ac_status" >&5
+   (exit $ac_status); }; then
+-  pkg_cv_HTTP_LIBS=`$PKG_CONFIG --libs "libsoup-gnome-2.4 libxml-2.0" 2>/dev/null`
++  pkg_cv_HTTP_LIBS=`$PKG_CONFIG --libs "libsoup-2.4 libxml-2.0" 2>/dev/null`
+ else
+   pkg_failed=yes
+ fi
+@@ -25702,14 +25702,14 @@
+         _pkg_short_errors_supported=no
+ fi
+         if test $_pkg_short_errors_supported = yes; then
+-	        HTTP_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors "libsoup-gnome-2.4 libxml-2.0" 2>&1`
++	        HTTP_PKG_ERRORS=`$PKG_CONFIG --short-errors --print-errors "libsoup-2.4 libxml-2.0" 2>&1`
+         else
+-	        HTTP_PKG_ERRORS=`$PKG_CONFIG --print-errors "libsoup-gnome-2.4 libxml-2.0" 2>&1`
++	        HTTP_PKG_ERRORS=`$PKG_CONFIG --print-errors "libsoup-2.4 libxml-2.0" 2>&1`
+         fi
+ 	# Put the nasty error message in config.log where it belongs
+ 	echo "$HTTP_PKG_ERRORS" >&5
+ 
+-	{ { $as_echo "$as_me:$LINENO: error: Package requirements (libsoup-gnome-2.4 libxml-2.0) were not met:
++	{ { $as_echo "$as_me:$LINENO: error: Package requirements (libsoup-2.4 libxml-2.0) were not met:
+ 
+ $HTTP_PKG_ERRORS
+ 
+@@ -25720,7 +25720,7 @@
+ and HTTP_LIBS to avoid the need to call pkg-config.
+ See the pkg-config man page for more details.
+ " >&5
+-$as_echo "$as_me: error: Package requirements (libsoup-gnome-2.4 libxml-2.0) were not met:
++$as_echo "$as_me: error: Package requirements (libsoup-2.4 libxml-2.0) were not met:
+ 
+ $HTTP_PKG_ERRORS
+ 
+--- gvfs-1.2.2-orig/daemon/gvfsbackendhttp.c	2009-03-06 16:43:19.000000000 +0100
++++ gvfs-1.2.2/daemon/gvfsbackendhttp.c	2009-05-25 11:48:20.000000000 +0200
+@@ -33,7 +33,7 @@
+ #include <glib/gi18n.h>
+ #include <gio/gio.h>
+ 
+-#include <libsoup/soup-gnome.h>
++#include <libsoup/soup.h>
+ #include "gvfsbackendhttp.h"
+ #include "gvfsjobopenforread.h"
+ #include "gvfsjobread.h"
+@@ -80,7 +80,6 @@
+ g_vfs_backend_http_init (GVfsBackendHttp *backend)
+ {
+   const char         *debug;
+-  SoupSessionFeature *proxy_resolver;
+ 
+   g_vfs_backend_set_user_visible (G_VFS_BACKEND (backend), FALSE);  
+ 
+@@ -92,12 +91,6 @@
+                                                                 "gvfs/" VERSION,
+                                                                 NULL);
+ 
+-  /* Proxy handling */
+-  proxy_resolver = g_object_new (SOUP_TYPE_PROXY_RESOLVER_GNOME, NULL);
+-  soup_session_add_feature (backend->session, proxy_resolver);
+-  soup_session_add_feature (backend->session_async, proxy_resolver);
+-  g_object_unref (proxy_resolver);
+-
+   /* Logging */
+   debug = g_getenv ("GVFS_HTTP_DEBUG");
+   if (debug)
diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
new file mode 100644
index 0000000..9a6562b
--- /dev/null
+++ b/package/gvfs/gvfs.mk
@@ -0,0 +1,73 @@
+#############################################################
+#
+# gvfs
+#
+#############################################################
+GVFS_VERSION_MAJOR = 1.2
+GVFS_VERSION_MINOR = 2
+GVFS_VERSION = $(GVFS_VERSION_MAJOR).$(GVFS_VERSION_MINOR)
+GVFS_SOURCE = gvfs-$(GVFS_VERSION).tar.gz
+GVFS_SITE = http://ftp.gnome.org/pub/GNOME/sources/gvfs/$(GVFS_VERSION_MAJOR)
+
+GVFS_INSTALL_STAGING = NO
+GVFS_INSTALL_TARGET = YES
+GVFS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+GVFS_AUTORECONF = NO
+GVFS_DEPENDENCIES = uclibc host-pkgconfig host-libglib2 libglib2 dbus-glib shared-mime-info
+
+GVFS_CONF_OPT = \
+	--disable-gconf			\
+	--disable-cdda			\
+	--disable-obexftp		\
+	--disable-gphoto2		\
+	--disable-keyring		\
+	--disable-archive		\
+	--disable-bash-completion	\
+
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+GVFS_DEPENDENCIES += avahi
+GVFS_CONF_OPT += --enable-avahi
+else
+GVFS_CONF_OPT += --disable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_LIBFUSE),y)
+GVFS_DEPENDENCIES += libfuse
+GVFS_CONF_OPT += --enable-fuse
+else
+GVFS_CONF_OPT += --disable-fuse
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSOUP),y)
+GVFS_DEPENDENCIES += libsoup
+GVFS_CONF_OPT += --enable-http
+else
+GVFS_CONF_OPT += --disable-http
+endif
+
+ifeq ($(BR2_PACKAGE_HAL),y)
+GVFS_DEPENDENCIES += hal
+GVFS_CONF_OPT += --enable-hal
+else
+GVFS_CONF_OPT += --disable-hal
+endif
+
+ifeq ($(BR2_PACKAGE_SAMBA_LIBSMBCLIENT),y)
+GVFS_DEPENDENCIES += samba
+GVFS_CONF_OPT += \
+	--enable-samba \
+	ac_cv_lib_smbclient_smbc_option_get=yes
+else
+GVFS_CONF_OPT += --disable-samba
+endif
+
+$(eval $(call AUTOTARGETS,package,gvfs))
+
+$(GVFS_HOOK_POST_INSTALL): $(GVFS_TARGET_INSTALL_TARGET)
+	rm $(TARGET_DIR)/usr/bin/gvfs-less
+ifneq ($(BR2_ENABLE_DEBUG),y)
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/gvfs*
+	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/libexec/gvfs*
+endif
+	touch $@
-- 
1.6.3.3
