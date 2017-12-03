From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Dec 2017 23:27:05 +0100
Subject: [Buildroot] [git commit] rtl8189fs: new package
Message-ID: <20171203222034.6ABAF82531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=90e829e0fdf386ff379debe1417f31c6947929b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds the rtl8189fs WiFi driver. The driver is sourced
from jwrdegoede's and icenowy's work on GitHub:
   repo: https://github.com/jwrdegoede/rtl8189ES_linux.git
   branch: rtl8189fs

Driver is known to support Realtek RTL8189FTV chip.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8189fs/Config.in      | 10 ++++++++++
 package/rtl8189fs/rtl8189fs.hash |  2 ++
 package/rtl8189fs/rtl8189fs.mk   | 17 +++++++++++++++++
 5 files changed, 31 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ce32022..f96b1d0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1517,6 +1517,7 @@ F:	configs/orangepi_one_defconfig
 F:	configs/orangepi_pc_plus_defconfig
 F:	configs/orangepi_zero_defconfig
 F:	package/armbian-firmware/
+F:	package/rtl8189fs/
 F:	package/xr819-xradio/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
diff --git a/package/Config.in b/package/Config.in
index aa111e4..433224c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -486,6 +486,7 @@ endmenu
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8723bu/Config.in"
 	source "package/rtl8821au/Config.in"
+	source "package/rtl8189fs/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/setserial/Config.in"
diff --git a/package/rtl8189fs/Config.in b/package/rtl8189fs/Config.in
new file mode 100644
index 0000000..ae69b79
--- /dev/null
+++ b/package/rtl8189fs/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_RTL8189FS
+	bool "rtl8189fs"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Wireless driver rtl8189fs.
+
+	  https://github.com/jwrdegoede/rtl8189ES_linux.git
+
+comment "rtl8189fs needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
new file mode 100644
index 0000000..aa844cd
--- /dev/null
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 50ca09d97b22001184231b746d7133e500d3e3998a23a8ea5c3b4da72c4f72c0 rtl8189fs-04b44d437b20f28ba83fcaecc0bdab7f7647fd11.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
new file mode 100644
index 0000000..d7add51
--- /dev/null
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# rtl8189fs
+#
+################################################################################
+
+RTL8189FS_VERSION = 04b44d437b20f28ba83fcaecc0bdab7f7647fd11
+RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
+RTL8189FS_LICENSE = GPL-2.0
+
+RTL8189FS_MODULE_MAKE_OPTS = \
+	CONFIG_RTL8189FS=m \
+	KVER=$(LINUX_VERSION_PROBED) \
+	KSRC=$(LINUX_DIR)
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
