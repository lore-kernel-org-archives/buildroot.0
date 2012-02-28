From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 28 Feb 2012 09:22:21 +0100
Subject: [Buildroot] [git commit] glib-networking: new package
Message-ID: <20120301130636.B704190BF7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=01ffa2e8684d2a3114469cc423e6ee992fd71599
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

glib-networking provides network-related GIO modules for glib.
It is used by newer versions of libsoup to implement SSL/TLS
support.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                          |    1 +
 package/glib-networking/Config.in          |   11 +++++++++++
 package/glib-networking/glib-networking.mk |   22 ++++++++++++++++++++++
 3 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 8a7c9c4..41cbb8c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -344,6 +344,7 @@ source "package/jsmin/Config.in"
 endmenu
 
 menu "Networking"
+source "package/glib-networking/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
diff --git a/package/glib-networking/Config.in b/package/glib-networking/Config.in
new file mode 100644
index 0000000..16f0d4a
--- /dev/null
+++ b/package/glib-networking/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_GLIB_NETWORKING
+	bool "glib-networking"
+	depends on BR2_USE_WCHAR # glib2
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT
+	help
+	  Network-related GIO modules for glib.
+
+comment "glib-networking requires a toolchain with WCHAR support"
+	depends on !BR2_USE_WCHAR
diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
new file mode 100644
index 0000000..b1ad621
--- /dev/null
+++ b/package/glib-networking/glib-networking.mk
@@ -0,0 +1,22 @@
+#############################################################
+#
+# glib-networking
+#
+#############################################################
+
+GLIB_NETWORKING_MAJOR_VERSION = 2.30
+GLIB_NETWORLING_MINOR_VERSION = 2
+GLIB_NETWORKING_VERSION = $(GLIB_NETWORKING_MAJOR_VERSION).$(GLIB_NETWORLING_MINOR_VERSION)
+GLIB_NETWORKING_SITE = http://ftp.gnome.org/pub/gnome/sources/glib-networking/$(GLIB_NETWORKING_MAJOR_VERSION)
+GLIB_NETWORKING_SOURCE = glib-networking-$(GLIB_NETWORKING_VERSION).tar.xz
+
+GLIB_NETWORKING_INSTALL_STAGING = YES
+
+GLIB_NETWORKING_DEPENDENCIES = $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext libintl) host-pkg-config libglib2
+
+ifeq ($(BR2_PACKAGE_GNUTLS),y)
+GLIB_NETWORKING_DEPENDENCIES += gnutls
+GLIB_NETWORKING_CONF_OPT = --with-libgcrypt-prefix=$(STAGING_DIR)/usr
+endif
+
+$(eval $(call AUTOTARGETS))
