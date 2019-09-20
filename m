From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 20 Sep 2019 18:31:05 +0300
Subject: [Buildroot] [PATCH 2/3] package/xdg-dbus-proxy: new package
In-Reply-To: <20190920153106.2274596-1-aperez@igalia.com>
References: <20190920153106.2274596-1-aperez@igalia.com>
Message-ID: <20190920153106.2274596-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xdg-dbus-proxy is a filtering proxy for D-Bus connections, which can
be used to limit access to a set of services. Typically it is used in
combination with containers to provide them with access to certain
services running outside the container.

https://github.com/flatpak/xdg-dbus-proxy

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/xdg-dbus-proxy/Config.in           | 14 ++++++++++++++
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash |  5 +++++
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 17 +++++++++++++++++
 5 files changed, 38 insertions(+)
 create mode 100644 package/xdg-dbus-proxy/Config.in
 create mode 100644 package/xdg-dbus-proxy/xdg-dbus-proxy.hash
 create mode 100644 package/xdg-dbus-proxy/xdg-dbus-proxy.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index bf23b3e1e7..698d4f4799 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -81,6 +81,7 @@ F:	package/webkitgtk/
 F:	package/woff2/
 F:	package/wpebackend-fdo/
 F:	package/wpewebkit/
+F:	package/xdg-dbus-proxy/
 
 N:	Adrien Gallou?t <adrien@gallouet.fr>
 F:	package/bird/
diff --git a/package/Config.in b/package/Config.in
index 412ea1129f..6d9a442905 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2267,6 +2267,7 @@ menu "System tools"
 	source "package/tpm2-totp/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
+	source "package/xdg-dbus-proxy/Config.in"
 	source "package/xen/Config.in"
 	source "package/xvisor/Config.in"
 endmenu
diff --git a/package/xdg-dbus-proxy/Config.in b/package/xdg-dbus-proxy/Config.in
new file mode 100644
index 0000000000..94c144fad7
--- /dev/null
+++ b/package/xdg-dbus-proxy/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_XDG_DBUS_PROXY
+	bool "xdg-dbus-proxy"
+	depends on BR2_USE_WCHAR # libglib2 -> gettext
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  Filtering proxy for D-Bus connections.
+
+	  https://github.com/flatpak/xdg-dbus-proxy
+
+comment "xdg-dbus-proxy needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
new file mode 100644
index 0000000000..37bda78436
--- /dev/null
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -0,0 +1,5 @@
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.2
+sha256 1749d6f9f46dcc9edc87725641cf56cf91dcad1b01707891ea0850c1000c520f xdg-dbus-proxy-0.1.2.tar.xz
+
+# Hash for license files:
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
new file mode 100644
index 0000000000..668e8f67e8
--- /dev/null
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# bubblewrap
+#
+################################################################################
+
+XDG_DBUS_PROXY_VERSION = 0.1.2
+XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
+XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
+XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
+
+XDG_DBUS_PROXY_LICENSE = LGPL-2.1
+XDG_DBUS_PROXY_LICENSE_FILES = COPYING
+
+XDG_DBUS_PROXY_CONF_OPTS = --disable-man
+
+$(eval $(autotools-package))
-- 
2.23.0
