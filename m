From: Louis Aussedat <aussedat.louis@gmail.com>
Date: Mon, 11 May 2020 20:10:51 +0200
Subject: [Buildroot] [PATCH 1/1] rtl8189es: new package
Message-ID: <20200511181051.9347-1-aussedat.louis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the rtl8189es WiFi driver.
   repo: https://github.com/jwrdegoede/rtl8189ES_linux.git
   branch: master

Driver is known to support Realtek RTL8189ES-VB-CG chip.

Signed-off-by: Louis Aussedat <aussedat.louis@gmail.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8189es/Config.in      | 10 ++++++++++
 package/rtl8189es/rtl8189es.hash |  2 ++
 package/rtl8189es/rtl8189es.mk   | 17 +++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/rtl8189es/Config.in
 create mode 100644 package/rtl8189es/rtl8189es.hash
 create mode 100644 package/rtl8189es/rtl8189es.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e427ab15d4..83b47b77b6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1520,6 +1520,7 @@ F:	package/python-dnspython/
 F:	package/python-future/
 F:	package/python-huepy/
 F:	package/python-tqdm/
+F:	package/rtl8189es/
 
 N:	Louis-Paul Cordier <lpdev@cordier.org>
 F:	package/intel-gmmlib/
diff --git a/package/Config.in b/package/Config.in
index c12676d859..32f4b21625 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -525,6 +525,7 @@ endmenu
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
 	source "package/rtl8188eu/Config.in"
+	source "package/rtl8189es/Config.in"
 	source "package/rtl8189fs/Config.in"
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
diff --git a/package/rtl8189es/Config.in b/package/rtl8189es/Config.in
new file mode 100644
index 0000000000..2e3474e5e1
--- /dev/null
+++ b/package/rtl8189es/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RTL8189ES
+	bool "rtl8189es"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Wireless driver rtl8189es.
+
+	  https://github.com/jwrdegoede/rtl8189ES_linux.git
+
+comment "rtl8189es needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8189es/rtl8189es.hash b/package/rtl8189es/rtl8189es.hash
new file mode 100644
index 0000000000..624c51ac0d
--- /dev/null
+++ b/package/rtl8189es/rtl8189es.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  bf972b6494844c66885dc6846228994fac6075477cf9a7122ffd521e25ac791c  rtl8189es-2c8d44ae26485052f39d933a3a132b3ff395803a.tar.gz
diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
new file mode 100644
index 0000000000..9e4053ae83
--- /dev/null
+++ b/package/rtl8189es/rtl8189es.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rtl8189es
+#
+################################################################################
+
+RTL8189ES_VERSION = 2c8d44ae26485052f39d933a3a132b3ff395803a
+RTL8189ES_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189ES_VERSION))
+RTL8189ES_LICENSE = GPL-2.0
+
+RTL8189ES_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8189ES=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.26.2
