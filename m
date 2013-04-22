From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Apr 2013 18:07:52 +0200
Subject: [Buildroot] [PATCH 3/4] wayland: new package
In-Reply-To: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1366646873-26196-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in          |    1 +
 package/wayland/Config.in  |   10 ++++++++++
 package/wayland/wayland.mk |   30 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/wayland/Config.in
 create mode 100644 package/wayland/wayland.mk

diff --git a/package/Config.in b/package/Config.in
index f3be210..41989c7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -445,6 +445,7 @@ source "package/opengl/Config.in"
 source "package/pango/Config.in"
 source "package/pixman/Config.in"
 source "package/tiff/Config.in"
+source "package/wayland/Config.in"
 source "package/webkit/Config.in"
 source "package/zxing/Config.in"
 endmenu
diff --git a/package/wayland/Config.in b/package/wayland/Config.in
new file mode 100644
index 0000000..e5d2649
--- /dev/null
+++ b/package/wayland/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_WAYLAND
+	bool "wayland"
+	select BR2_PACKAGE_LIBFFI
+	select BR2_PACKAGE_EXPAT
+	help
+	  Wayland is a project to define a protocol for a compositor
+	  to talk to its clients as well as a library implementation
+	  of the protocol.
+
+	  http://wayland.freedesktop.org/
diff --git a/package/wayland/wayland.mk b/package/wayland/wayland.mk
new file mode 100644
index 0000000..65381ec
--- /dev/null
+++ b/package/wayland/wayland.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# wayland
+#
+#############################################################
+
+WAYLAND_VERSION = 1.1.0
+WAYLAND_SITE = http://wayland.freedesktop.org/releases/
+WAYLAND_SOURCE = wayland-$(WAYLAND_VERSION).tar.xz
+WAYLAND_LICENSE = MIT
+WAYLAND_LICENSE_FILES = COPYING
+
+WAYLAND_INSTALL_STAGING = YES
+WAYLAND_DEPENDENCIES = libffi host-pkgconf expat host-expat
+
+# wayland needs a wayland-scanner program to generate some of its
+# source code. By default, it builds it with CC, so it doesn't in
+# cross-compilation. Therefore, we build it manually, and tell wayland
+# that the tool is already available.
+WAYLAND_CONF_OPT = --disable-scanner
+
+define WAYLAND_BUILD_SCANNER
+	(cd $(@D)/src/; \
+		$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS) \
+			-o wayland-scanner scanner.c wayland-util.c -lexpat)
+endef
+
+WAYLAND_POST_CONFIGURE_HOOKS += WAYLAND_BUILD_SCANNER
+
+$(eval $(autotools-package))
-- 
1.7.9.5
