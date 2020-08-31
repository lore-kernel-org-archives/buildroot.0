From: Horatiu Vultur <horatiu.vultur@microchip.com>
Date: Mon, 31 Aug 2020 20:25:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/mrp: new package
Message-ID: <20200831182540.2987984-1-horatiu.vultur@microchip.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
---
v1 -> v2:
  - add missing dependencies
  - update license
  - add comment in case dependecies are missing
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/mrp/Config.in | 17 +++++++++++++++++
 package/mrp/mrp.hash  |  3 +++
 package/mrp/mrp.mk    | 13 +++++++++++++
 5 files changed, 35 insertions(+)
 create mode 100644 package/mrp/Config.in
 create mode 100644 package/mrp/mrp.hash
 create mode 100644 package/mrp/mrp.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b86e5f8169..fb09775cc5 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1120,6 +1120,7 @@ F:	package/squeezelite/
 
 N:	Horatiu Vultur <horatiu.vultur@microchip.com>
 F:	package/easyframes/
+F:	package/mrp/
 
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
diff --git a/package/Config.in b/package/Config.in
index b1df81d7f1..0b9ffbad25 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2129,6 +2129,7 @@ menu "Networking applications"
 	source "package/mosh/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
+	source "package/mrp/Config.in"
 	source "package/mtr/Config.in"
 	source "package/nbd/Config.in"
 	source "package/ncftp/Config.in"
diff --git a/package/mrp/Config.in b/package/mrp/Config.in
new file mode 100644
index 0000000000..471f3105ee
--- /dev/null
+++ b/package/mrp/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_MRP
+	bool "mrp"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBMNL
+	select BR2_PACKAGE_LIBNL
+	help
+	  This is the userspace application that configures the kernel
+	  to run MRP protocol. The userspace application is made of 2
+	  applications, one deamon and a client.
+
+	  https://github.com/microchip-ung/mrp
+
+comment "mrp needs a toolchain /w threads, headers >= 5.0"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/mrp/mrp.hash b/package/mrp/mrp.hash
new file mode 100644
index 0000000000..02a848c7eb
--- /dev/null
+++ b/package/mrp/mrp.hash
@@ -0,0 +1,3 @@
+# locally calculated
+sha256  1a6c76d058bb425a7ec8b69a65de797650961161ec016b51ac8a1965e1ac304f  mrp-1.1.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mrp/mrp.mk b/package/mrp/mrp.mk
new file mode 100644
index 0000000000..abe965dc73
--- /dev/null
+++ b/package/mrp/mrp.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# mrp
+#
+################################################################################
+
+MRP_VERSION = 1.1
+MRP_SITE = $(call github,microchip-ung,mrp,v$(MRP_VERSION))
+MRP_DEPENDENCIES = libev libmnl libnl
+MRP_LICENSE = GPL-2.0+
+MRP_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
-- 
2.27.0
