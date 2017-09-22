From: Wolfgang Grandegger <wg@grandegger.com>
Date: Fri, 22 Sep 2017 09:11:44 +0200
Subject: [Buildroot] [PATCH v2] package/dfu-util: allow to build it for the
	target as well
Message-ID: <339edb91-644e-2456-b627-262d81c1afaa@grandegger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---

Changes since v1:
- add missing "select BR2_PACKAGE_LIBUSB" in Config.in

 package/Config.in            | 1 +
 package/dfu-util/Config.in   | 9 +++++++++
 package/dfu-util/dfu-util.mk | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 package/dfu-util/Config.in

diff --git a/package/Config.in b/package/Config.in
index 48d1381..b493201 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -389,6 +389,7 @@ endmenu
 	source "package/dbus-python/Config.in"
 	source "package/dbus-triggerd/Config.in"
 	source "package/devmem2/Config.in"
+	source "package/dfu-util/Config.in"
 	source "package/dmidecode/Config.in"
 	source "package/dmraid/Config.in"
 	source "package/dt-utils/Config.in"
diff --git a/package/dfu-util/Config.in b/package/dfu-util/Config.in
new file mode 100644
index 0000000..ef1fd59
--- /dev/null
+++ b/package/dfu-util/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_DFU_UTIL
+	bool "dfu-util"
+	select BR2_PACKAGE_LIBUSB
+	help
+	  Dfu-util is the host side implementation of the DFU 1.0
+	  specification of the USB forum. DFU is intended to download
+	  and upload firmware to devices connected over USB.
+
+	  http://dfu-util.sourceforge.net/
diff --git a/package/dfu-util/dfu-util.mk b/package/dfu-util/dfu-util.mk
index c494485..5e8ba5a 100644
--- a/package/dfu-util/dfu-util.mk
+++ b/package/dfu-util/dfu-util.mk
@@ -9,6 +9,8 @@ DFU_UTIL_SITE = http://dfu-util.sourceforge.net/releases
 DFU_UTIL_LICENSE = GPL-2.0+
 DFU_UTIL_LICENSE_FILES = COPYING
 
+DFU_UTIL_DEPENDENCIES = libusb
 HOST_DFU_UTIL_DEPENDENCIES = host-libusb
 
+$(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.9.1
