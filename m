From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 6 Sep 2020 16:38:02 +0200
Subject: [Buildroot] [git commit] package/mrp: new package
Message-ID: <20200906142956.5A08A817B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97d431c181268716b38cd5a63eb0e8b78b003b3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Horatiu Vultur <horatiu.vultur@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS            |  1 +
 package/Config.in     |  1 +
 package/mrp/Config.in | 17 +++++++++++++++++
 package/mrp/mrp.hash  |  3 +++
 package/mrp/mrp.mk    | 13 +++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b2d69cfc52..c012679600 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1134,6 +1134,7 @@ F:	package/squeezelite/
 
 N:	Horatiu Vultur <horatiu.vultur@microchip.com>
 F:	package/easyframes/
+F:	package/mrp/
 
 N:	Ian Haylock <haylocki@yahoo.co.uk>
 F:	package/python-rpi-gpio/
diff --git a/package/Config.in b/package/Config.in
index 9ee53aba47..e5019e3ed6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2135,6 +2135,7 @@ menu "Networking applications"
 	source "package/mosh/Config.in"
 	source "package/mosquitto/Config.in"
 	source "package/mrouted/Config.in"
+	source "package/mrp/Config.in"
 	source "package/mtr/Config.in"
 	source "package/nbd/Config.in"
 	source "package/ncftp/Config.in"
diff --git a/package/mrp/Config.in b/package/mrp/Config.in
new file mode 100644
index 0000000000..0ca18a4ef2
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
+	  applications, one daemon and a client.
+
+	  https://github.com/microchip-ung/mrp
+
+comment "mrp needs a toolchain w/ threads, kernel headers >= 5.0"
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
index 0000000000..4d8a1fc92a
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
+MRP_LICENSE = GPL-2.0
+MRP_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
