From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  8 Feb 2017 22:32:55 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/bluez-tools: new package
Message-ID: <20170208213255.6511-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: added comment why autoreconf is needed (Romain)

 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/bluez-tools/Config.in        | 19 +++++++++++++++++++
 package/bluez-tools/bluez-tools.hash |  3 +++
 package/bluez-tools/bluez-tools.mk   | 24 ++++++++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/bluez-tools/Config.in
 create mode 100644 package/bluez-tools/bluez-tools.hash
 create mode 100644 package/bluez-tools/bluez-tools.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b8ccb4615..5b4a0b18d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -150,6 +150,7 @@ N:	Bernd Kuhls <bernd.kuhls@t-online.de>
 F:	package/apache/
 F:	package/apr/
 F:	package/apr-util/
+F:	package/bluez-tools/
 F:	package/clamav/
 F:	package/dovecot/
 F:	package/dovecot-pigeonhole/
diff --git a/package/Config.in b/package/Config.in
index e85b23caf..cdf16aba0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1484,6 +1484,7 @@ menu "Networking applications"
 	source "package/batctl/Config.in"
 	source "package/bcusdk/Config.in"
 	source "package/bind/Config.in"
+	source "package/bluez-tools/Config.in"
 	source "package/bluez_utils/Config.in"
 	source "package/bluez5_utils/Config.in"
 	source "package/bmon/Config.in"
diff --git a/package/bluez-tools/Config.in b/package/bluez-tools/Config.in
new file mode 100644
index 000000000..5a1b7d041
--- /dev/null
+++ b/package/bluez-tools/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_BLUEZ_TOOLS
+	bool "bluez-tools"
+	depends on BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
+	depends on BR2_USE_MMU # dbus, libglib2
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
+	select BR2_PACKAGE_DBUS
+	select BR2_PACKAGE_DBUS_GLIB
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_READLINE if BR2_PACKAGE_BLUEZ5_UTILS
+	help
+	  A set of tools to manage bluetooth devices for linux
+
+	  https://github.com/khvzak/bluez-tools
+
+comment "bluez-tools needs a toolchain w/ wchar, threads"
+	depends on BR2_PACKAGE_BLUEZ_UTILS || BR2_PACKAGE_BLUEZ5_UTILS
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/bluez-tools/bluez-tools.hash b/package/bluez-tools/bluez-tools.hash
new file mode 100644
index 000000000..214fa5bdf
--- /dev/null
+++ b/package/bluez-tools/bluez-tools.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 56204ddd1cc7890d60f6a47507755f786fa3ee28f1da370a32ca7d7e0795a953  bluez-tools-171181b6ef6c94aefc828dc7fd8de136b9f97532.tar.gz
+sha256 62ca98af63d2ae142dbc77995c6bd4c259eaba4a5832daa33ae9e3d585b9205f  bluez-tools-97efd293491ad7ec96a655665339908f2478b3d1.tar.gz
diff --git a/package/bluez-tools/bluez-tools.mk b/package/bluez-tools/bluez-tools.mk
new file mode 100644
index 000000000..3f441039c
--- /dev/null
+++ b/package/bluez-tools/bluez-tools.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# bluez-tools
+#
+################################################################################
+
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+# this is the last version compatible with BlueZ 4 API
+BLUEZ_TOOLS_VERSION = 171181b6ef6c94aefc828dc7fd8de136b9f97532
+else
+BLUEZ_TOOLS_VERSION = 97efd293491ad7ec96a655665339908f2478b3d1
+endif
+BLUEZ_TOOLS_SITE = $(call github,khvzak,bluez-tools,$(BLUEZ_TOOLS_VERSION))
+# sources fetched from github, no configure script)
+BLUEZ_TOOLS_AUTORECONF = YES
+BLUEZ_TOOLS_DEPENDENCIES = host-pkgconf dbus dbus-glib
+
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+BLUEZ_TOOLS_DEPENDENCIES += bluez_utils
+else
+BLUEZ_TOOLS_DEPENDENCIES += bluez5_utils readline
+endif
+
+$(eval $(autotools-package))
-- 
2.11.0
