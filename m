From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu,  6 Oct 2011 15:14:16 +0200
Subject: [Buildroot] [PATCH 2/3] new package: gupnp
In-Reply-To: <1317906857-24169-1-git-send-email-s.neumann@raumfeld.com>
References: <1317906857-24169-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1317906857-24169-3-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GUPnP implements the UPnP specification.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/Config.in       |    1 +
 package/gupnp/Config.in |   17 +++++++++++++++++
 package/gupnp/gupnp.mk  |   17 +++++++++++++++++
 3 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100755 package/gupnp/Config.in
 create mode 100755 package/gupnp/gupnp.mk

diff --git a/package/Config.in b/package/Config.in
index adb8c25..bf143f4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -322,6 +322,7 @@ endif
 
 menu "Networking"
 source "package/gssdp/Config.in"
+source "package/gupnp/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
diff --git a/package/gupnp/Config.in b/package/gupnp/Config.in
new file mode 100755
index 0000000..ddf010b
--- /dev/null
+++ b/package/gupnp/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GUPNP
+	bool "gupnp"
+	select BR2_PACKAGE_GSSDP
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_UTIL_LINUX
+	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	depends on BR2_LARGEFILE
+	depends on BR2_USE_WCHAR
+	help
+	  GUPnP implements the UPnP specification: resource announcement
+	  and discovery, description, control, event notification, and
+	  presentation.
+
+	  http://www.gupnp.org/
+
+comment "gupnp requires a toolchain with LARGEFILE + WCHAR support"
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
new file mode 100755
index 0000000..8d2cc23
--- /dev/null
+++ b/package/gupnp/gupnp.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# gupnp
+#
+#############################################################
+
+GUPNP_VERSION = 0.14.1
+GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.gz
+GUPNP_SITE = http://www.gupnp.org/sites/all/files/sources
+GUPNP_INSTALL_STAGING = YES
+
+GUPNP_CONF_ENV = \
+	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
+
+GUPNP_DEPENDENCIES = host-pkg-config host-libglib2 libxml2 gssdp util-linux
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.4.1
