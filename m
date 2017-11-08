From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Wed,  8 Nov 2017 22:43:33 +0300
Subject: [Buildroot] [PATCH 2/3] rtl8189fs: new package
In-Reply-To: <20171108194334.10031-1-geomatsi@gmail.com>
References: <20171108194334.10031-1-geomatsi@gmail.com>
Message-ID: <20171108194334.10031-3-geomatsi@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds the rtl8189fs WiFi driver. The driver is sourced
from jwrdegoede's and icenowy's work on GitHub:
   repo: https://github.com/jwrdegoede/rtl8189ES_linux.git
   branch: rtl8189fs

Driver is known to support Realtek RTL8189FTV chip.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 DEVELOPERS                       |  1 +
 package/Config.in                |  1 +
 package/rtl8189fs/Config.in      | 10 ++++++++++
 package/rtl8189fs/rtl8189fs.hash |  2 ++
 package/rtl8189fs/rtl8189fs.mk   | 17 +++++++++++++++++
 5 files changed, 31 insertions(+)
 create mode 100644 package/rtl8189fs/Config.in
 create mode 100644 package/rtl8189fs/rtl8189fs.hash
 create mode 100644 package/rtl8189fs/rtl8189fs.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index cfbe64b0b2..65eeb16cf8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1473,6 +1473,7 @@ F:	package/mpir/
 
 N:	Sergey Matyukevich <geomatsi@gmail.com>
 F:	package/xr819-xradio/
+F:	package/rtl8189fs/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
 F:	package/libgdiplus/
diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..f80d292d6a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ endmenu
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8723bs/Config.in"
 	source "package/rtl8821au/Config.in"
+	source "package/rtl8189fs/Config.in"
 	source "package/sane-backends/Config.in"
 	source "package/sdparm/Config.in"
 	source "package/setserial/Config.in"
diff --git a/package/rtl8189fs/Config.in b/package/rtl8189fs/Config.in
new file mode 100644
index 0000000000..ae69b79235
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
index 0000000000..aa844cda70
--- /dev/null
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 50ca09d97b22001184231b746d7133e500d3e3998a23a8ea5c3b4da72c4f72c0 rtl8189fs-04b44d437b20f28ba83fcaecc0bdab7f7647fd11.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
new file mode 100644
index 0000000000..d7add518f8
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
-- 
2.11.0
