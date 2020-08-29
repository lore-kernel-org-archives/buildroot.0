From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 14:30:05 +0200
Subject: [Buildroot] [git commit branch/next] package/watchdog: new package
Message-ID: <20200829122344.A1EA686A94@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4ed6b7b857d446c9e60137f0e7e742f4bd8f99c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

watchdog is a flexible watchdog daemon that improves on the already
available Busybox watchdog daemon by providing more advanced features,
like defining custom system status checks and executing repair scripts
to react upon invariants that don't hold.

Due to "watchdog" being also provided by Busybox, we need to make that
package/watchdog installs the watchdog binary in the same place as
Busybox (i.e in /sbin), and need to add a dependency of Busybox on
this new watchdog package.

Signed-off-by: Alejandro Gonz??lez <alejandro.gonzalez.correo@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in              |  1 +
 package/busybox/busybox.mk     |  1 +
 package/watchdog/Config.in     | 10 ++++++++++
 package/watchdog/watchdog.hash |  3 +++
 package/watchdog/watchdog.mk   | 16 ++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a29bd7ab99..8b3b1dec6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2433,6 +2433,7 @@ menu "System tools"
 	source "package/tpm2-totp/Config.in"
 	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
+	source "package/watchdog/Config.in"
 	source "package/xdg-dbus-proxy/Config.in"
 	source "package/xen/Config.in"
 	source "package/xvisor/Config.in"
diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index e049bce81d..7862beb790 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -67,6 +67,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_USBUTILS),usbutils) \
 	$(if $(BR2_PACKAGE_UTIL_LINUX),util-linux) \
 	$(if $(BR2_PACKAGE_VIM),vim) \
+	$(if $(BR2_PACKAGE_WATCHDOG),watchdog) \
 	$(if $(BR2_PACKAGE_WGET),wget) \
 	$(if $(BR2_PACKAGE_WHOIS),whois)
 
diff --git a/package/watchdog/Config.in b/package/watchdog/Config.in
new file mode 100644
index 0000000000..bf485034d7
--- /dev/null
+++ b/package/watchdog/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_WATCHDOG
+	bool "watchdog"
+	depends on BR2_USE_MMU
+	help
+	  Watchdog is a daemon that periodically pets a watchdog device
+	  if the configured system status checks pass. If they do not,
+	  the daemon may execute repair commands, shutdown the system or
+	  reboot it.
+
+	  https://sourceforge.net/projects/watchdog/
diff --git a/package/watchdog/watchdog.hash b/package/watchdog/watchdog.hash
new file mode 100644
index 0000000000..7366c1b5e1
--- /dev/null
+++ b/package/watchdog/watchdog.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  b8e7c070e1b72aee2663bdc13b5cc39f76c9232669cfbb1ac0adc7275a3b019d  watchdog-5.16.tar.gz
+sha256  af7f3f94e85080204b37f7c53717a2c94c6b54d7fa516ebd74e008cb4c0391bd  COPYING
diff --git a/package/watchdog/watchdog.mk b/package/watchdog/watchdog.mk
new file mode 100644
index 0000000000..b814fdc672
--- /dev/null
+++ b/package/watchdog/watchdog.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# watchdog
+#
+################################################################################
+
+WATCHDOG_VERSION = 5.16
+WATCHDOG_SITE = http://downloads.sourceforge.net/sourceforge/watchdog
+WATCHDOG_AUTORECONF = YES
+WATCHDOG_LICENSE = GPL-2.0+
+WATCHDOG_LICENSE_FILES = COPYING
+# By default installs binaries in /usr/sbin/, but we want them in
+# /sbin/ so that they fall at the same place as Busybox counterparts
+WATCHDOG_CONF_OPTS = --sbindir=/sbin
+
+$(eval $(autotools-package))
