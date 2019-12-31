From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 31 Dec 2019 00:12:55 -0300
Subject: [Buildroot] [PATCH] package/thermald: new package
Message-ID: <20191231031255.15587-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>

Thermal Daemon is a Linux daemon for monitoring and controlling platform
temperatures.

./utils/test-pkg --package thermald --all
44 builds, 39 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
---
 DEVELOPERS                     |  1 +
 package/Config.in              |  1 +
 package/thermald/Config.in     | 23 +++++++++++++++++++++++
 package/thermald/thermald.hash |  5 +++++
 package/thermald/thermald.mk   | 21 +++++++++++++++++++++
 5 files changed, 51 insertions(+)
 create mode 100644 package/thermald/Config.in
 create mode 100644 package/thermald/thermald.hash
 create mode 100644 package/thermald/thermald.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 3f040f7021..1170a76a0b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2045,6 +2045,7 @@ F:	package/lirc-tools/
 
 N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
 F:	package/atop/
+F:	package/thermald/
 
 N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
 F:	support/testing/infra/
diff --git a/package/Config.in b/package/Config.in
index 05a4e87ae7..3f2c45a87d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2334,6 +2334,7 @@ menu "System tools"
 	source "package/systemd-bootchart/Config.in"
 	source "package/sysvinit/Config.in"
 	source "package/tar/Config.in"
+	source "package/thermald/Config.in"
 	source "package/tpm-tools/Config.in"
 	source "package/tpm2-abrmd/Config.in"
 	source "package/tpm2-tools/Config.in"
diff --git a/package/thermald/Config.in b/package/thermald/Config.in
new file mode 100644
index 0000000000..f32a4b274e
--- /dev/null
+++ b/package/thermald/Config.in
@@ -0,0 +1,23 @@
+config BR2_PACKAGE_THERMALD
+	bool "thermald"
+	depends on BR2_i386 || BR2_x86_64 # needs <cpuid.h>
+	depends on BR2_USE_MMU # uses fork()
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-glib -> glib2, dbus
+	depends on BR2_USE_WCHAR # dbus-glib -> glib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Thermal Daemon is a Linux daemon for monitoring and
+	  controlling platform temperatures. Once the system temperature
+	  reaches a certain threshold, the Linux daemon activates
+	  various cooling methods to try to cool the system.
+
+	  https://01.org/linux-thermal-daemon
+
+comment "thermald needs a toolchain w/ C++, wchar, threads"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/thermald/thermald.hash b/package/thermald/thermald.hash
new file mode 100644
index 0000000000..9a88a1cb30
--- /dev/null
+++ b/package/thermald/thermald.hash
@@ -0,0 +1,5 @@
+# Locally computed:
+sha256  aaf5ffdc12344eef2417b41b433094bb30e4ebf321f0140b090f97bfcf24ea1f  thermald-1.9.1.tar.gz
+
+# Hash for license file:
+sha256  e98be8bc482e038a14bfbc01caf800bbd0024fff275ef14cd999db6560254a8d  COPYING
diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
new file mode 100644
index 0000000000..ace4eed8e3
--- /dev/null
+++ b/package/thermald/thermald.mk
@@ -0,0 +1,21 @@
+################################################################################
+#
+# thermald
+#
+################################################################################
+
+THERMALD_VERSION = 1.9.1
+THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
+# fetched from Github, with no configure script
+THERMALD_AUTORECONF = YES
+THERMALD_DEPENDENCIES = dbus dbus-glib libxml2
+# tools are GPL-3.0+ but are not added to the target
+THERMALD_LICENSE = GPL-2.0+
+THERMALD_LICENSE_FILES = COPYING
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+THERMALD_DEPENDENCIES += systemd
+THERMALD_CONF_OPTS += --with-systemdsystemunitdir=/usr/lib/systemd/system
+endif
+
+$(eval $(autotools-package))
-- 
2.17.1
