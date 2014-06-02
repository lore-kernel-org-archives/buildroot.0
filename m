From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Jun 2014 22:34:52 +0200
Subject: [Buildroot] [git commit] package/libinput: new package
Message-ID: <20140602211715.02F479CDCF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=76dff6c63d6b4452e97295d5b512aa5381672ba7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in            |    1 +
 package/libinput/Config.in   |   17 +++++++++++++++++
 package/libinput/libinput.mk |   19 +++++++++++++++++++
 3 files changed, 37 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 9c0a769..1706197 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -625,6 +625,7 @@ source "package/libcec/Config.in"
 source "package/libfreefare/Config.in"
 source "package/libftdi/Config.in"
 source "package/libhid/Config.in"
+source "package/libinput/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libllcp/Config.in"
 source "package/libmbim/Config.in"
diff --git a/package/libinput/Config.in b/package/libinput/Config.in
new file mode 100644
index 0000000..14e4e70
--- /dev/null
+++ b/package/libinput/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_LIBINPUT
+	bool "libinput"
+	depends on BR2_PACKAGE_HAS_UDEV
+	select BR2_PACKAGE_LIBEVDEV
+	select BR2_PACKAGE_MTDEV
+	help
+	  libinput is a library to handle input devices in Wayland
+	  compositors and to provide a generic X.Org input driver.
+	  It provides device detection, device handling, input device
+	  event processing and abstraction so minimize the amount of
+	  custom input code compositors need to provide the common
+	  set of functionality that users expect.
+
+	  http://freedesktop.org/wiki/Software/libinput/
+
+comment "libinput needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
new file mode 100644
index 0000000..7c3e5e8
--- /dev/null
+++ b/package/libinput/libinput.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libinput
+#
+################################################################################
+
+LIBINPUT_VERSION = 0.2.0
+LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
+LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
+LIBINPUT_LICENSE = MIT
+LIBINPUT_LICENSE_FILES = COPYING
+
+LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
+LIBINPUT_INSTALL_STAGING = YES
+
+# Tests need fork, so just disable them everywhere.
+LIBINPUT_CONF_OPT = --disable-tests
+
+$(eval $(autotools-package))
