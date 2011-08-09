From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue,  9 Aug 2011 14:34:03 +0200
Subject: [Buildroot] [PATCH] New packages: gssdp, gupnp and gupnp-av
Message-ID: <1312893243-24424-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GUPnP is an elegant, object-oriented open source framework
for creating UPnP devices and control points, written in C
using GObject and libsoup.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/Config.in            |    3 +++
 package/gssdp/Config.in      |    8 ++++++++
 package/gssdp/gssdp.mk       |   20 ++++++++++++++++++++
 package/gupnp-av/Config.in   |    9 +++++++++
 package/gupnp-av/gupnp-av.mk |   18 ++++++++++++++++++
 package/gupnp/Config.in      |   12 ++++++++++++
 package/gupnp/gupnp.mk       |   18 ++++++++++++++++++
 7 files changed, 88 insertions(+), 0 deletions(-)
 create mode 100755 package/gssdp/Config.in
 create mode 100755 package/gssdp/gssdp.mk
 create mode 100755 package/gupnp-av/Config.in
 create mode 100755 package/gupnp-av/gupnp-av.mk
 create mode 100755 package/gupnp/Config.in
 create mode 100755 package/gupnp/gupnp.mk

diff --git a/package/Config.in b/package/Config.in
index 7112e05..d3e3da3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -316,6 +316,9 @@ endmenu
 endif
 
 menu "Networking"
+source "package/gssdp/Config.in"
+source "package/gupnp/Config.in"
+source "package/gupnp-av/Config.in"
 source "package/libcgi/Config.in"
 source "package/libcgicc/Config.in"
 source "package/libcurl/Config.in"
diff --git a/package/gssdp/Config.in b/package/gssdp/Config.in
new file mode 100755
index 0000000..5bac5df
--- /dev/null
+++ b/package/gssdp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GSSDP
+	bool "gssdp"
+	default n
+	select BR2_PACKAGE_LIBSOUP
+	help
+          GSSDP implements resource discovery and announcement over SSDP.
+
+	  http://www.gupnp.org
diff --git a/package/gssdp/gssdp.mk b/package/gssdp/gssdp.mk
new file mode 100755
index 0000000..010ef4c
--- /dev/null
+++ b/package/gssdp/gssdp.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# gssdp
+#
+#############################################################
+
+GSSDP_VERSION:=0.8.2
+GSSDP_SOURCE:=gssdp-$(GSSDP_VERSION).tar.gz
+GSSDP_SITE:=http://www.gupnp.org/sites/all/files/sources
+GSSDP_INSTALL_STAGING = YES
+GSSDP_INSTALL_TARGET = YES
+
+GSSDP_CONF_ENV = \
+	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
+
+GSSDP_DEPENDENCIES = host-pkg-config host-libglib2 libsoup
+
+$(eval $(call AUTOTARGETS,package,gssdp))
+
+
diff --git a/package/gupnp-av/Config.in b/package/gupnp-av/Config.in
new file mode 100755
index 0000000..5669af0
--- /dev/null
+++ b/package/gupnp-av/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GUPNP_AV
+	bool "gupnp-av"
+	default n
+	depends on BR2_PACKAGE_GUPNP
+	help
+          GUPnP-AV is a collection of helpers for building AV (audio/video)
+          applications using GUPnP.
+
+          http://www.gupnp.org/
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
new file mode 100755
index 0000000..96cc3f3
--- /dev/null
+++ b/package/gupnp-av/gupnp-av.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# gupnp-av
+#
+#############################################################
+
+GUPNP_AV_VERSION:=0.6.3
+GUPNP_AV_SOURCE:=gupnp-av-$(GUPNP_AV_VERSION).tar.gz
+GUPNP_AV_SITE:=http://www.gupnp.org/sites/all/files/sources
+GUPNP_AV_INSTALL_STAGING = YES
+GUPNP_AV_INSTALL_TARGET = YES
+
+GUPNP_AV_CONF_ENV = \
+	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
+
+GUPNP_AV_DEPENDENCIES = host-pkg-config host-libglib2 gupnp
+
+$(eval $(call AUTOTARGETS,package,gupnp-av))
diff --git a/package/gupnp/Config.in b/package/gupnp/Config.in
new file mode 100755
index 0000000..830958c
--- /dev/null
+++ b/package/gupnp/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_GUPNP
+	bool "gupnp"
+	default n
+	select BR2_PACKAGE_GSSDP
+        select BR2_PACKAGE_LIBXML2
+        select BR2_PACKAGE_UTIL_LINUX_LIBUUID
+	help
+          GUPnP implements the UPnP specification: resource announcement
+          and discovery, description, control, event notification, and
+          presentation.
+
+          http://www.gupnp.org/
diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
new file mode 100755
index 0000000..a9ba4dc
--- /dev/null
+++ b/package/gupnp/gupnp.mk
@@ -0,0 +1,18 @@
+#############################################################
+#
+# gupnp
+#
+#############################################################
+
+GUPNP_VERSION:=0.14.1
+GUPNP_SOURCE:=gupnp-$(GUPNP_VERSION).tar.gz
+GUPNP_SITE:=http://www.gupnp.org/sites/all/files/sources
+GUPNP_INSTALL_STAGING = YES
+GUPNP_INSTALL_TARGET = YES
+
+GUPNP_CONF_ENV = \
+	ac_cv_path_GLIB_GENMARSHAL=$(LIBGLIB2_HOST_BINARY)
+
+GUPNP_DEPENDENCIES = host-pkg-config host-libglib2 libxml2 gssdp util-linux
+
+$(eval $(call AUTOTARGETS,package,gupnp))
-- 
1.7.4.1
