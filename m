From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 18:48:09 +0100
Subject: [Buildroot] [git commit] wayland-protocols: new package
Message-ID: <20160320203745.96CDD8024E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1636a1f8a45fd2617941bec767547b50e10e1b6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For wayland 1.10+ they're split from wayland core and required by
weston.
Hide it behind the wayland package since it's useless independently even
though it can be "built" and installed.
And it makes no sense to install to target since they are DTDs used at
build-time.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  1 +
 package/wayland-protocols/Config.in              |  9 +++++++++
 package/wayland-protocols/wayland-protocols.hash |  2 ++
 package/wayland-protocols/wayland-protocols.mk   | 15 +++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 75ee013..a3c2a65 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -940,6 +940,7 @@ menu "Graphics"
 	source "package/powervr/Config.in"
 	source "package/tiff/Config.in"
 	source "package/wayland/Config.in"
+	source "package/wayland-protocols/Config.in"
 	source "package/webkit/Config.in"
 	source "package/webkitgtk24/Config.in"
 	source "package/webp/Config.in"
diff --git a/package/wayland-protocols/Config.in b/package/wayland-protocols/Config.in
new file mode 100644
index 0000000..8b4dedf
--- /dev/null
+++ b/package/wayland-protocols/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_WAYLAND_PROTOCOLS
+	bool "wayland-protocols"
+	# Not really... but useless otherwise
+	depends on BR2_PACKAGE_WAYLAND
+	help
+	  Wayland protocols that adds functionality not available in
+	  the Wayland core protocol.
+
+	  http://wayland.freedesktop.org/
diff --git a/package/wayland-protocols/wayland-protocols.hash b/package/wayland-protocols/wayland-protocols.hash
new file mode 100644
index 0000000..f2d5b7f
--- /dev/null
+++ b/package/wayland-protocols/wayland-protocols.hash
@@ -0,0 +1,2 @@
+# From https://lists.freedesktop.org/archives/wayland-devel/2015-November/025759.html
+sha256	a538a8e3f999f2722897eb60aa2e2b53d879381b413b630957d58a9acd226def	wayland-protocols-1.0.tar.xz
diff --git a/package/wayland-protocols/wayland-protocols.mk b/package/wayland-protocols/wayland-protocols.mk
new file mode 100644
index 0000000..bb6d52f
--- /dev/null
+++ b/package/wayland-protocols/wayland-protocols.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# wayland-protocols
+#
+################################################################################
+
+WAYLAND_PROTOCOLS_VERSION = 1.0
+WAYLAND_PROTOCOLS_SITE = http://wayland.freedesktop.org/releases
+WAYLAND_PROTOCOLS_SOURCE = wayland-protocols-$(WAYLAND_PROTOCOLS_VERSION).tar.xz
+WAYLAND_PROTOCOLS_LICENSE = MIT
+WAYLAND_PROTOCOLS_LICENSE_FILES = COPYING
+WAYLAND_PROTOCOLS_INSTALL_STAGING = YES
+WAYLAND_PROTOCOLS_INSTALL_TARGET = NO
+
+$(eval $(autotools-package))
