From: dusan.ivanco at gmail.com <dusan.ivanco@gmail.com>
Date: Fri,  7 May 2021 21:29:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/raspi2fb: new package
Message-ID: <20210507193004.29928-2-dusan.ivanco@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Du?an Ivan?o <dusan.ivanco@gmail.com>

---
 package/Config.in                                 |  1 +
 package/raspi2fb/0001-vchostif-library-link.patch | 11 +++++++++++
 package/raspi2fb/Config.in                        |  9 +++++++++
 package/raspi2fb/raspi2fb.hash                    |  3 +++
 package/raspi2fb/raspi2fb.mk                      | 13 +++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/raspi2fb/0001-vchostif-library-link.patch
 create mode 100644 package/raspi2fb/Config.in
 create mode 100644 package/raspi2fb/raspi2fb.hash
 create mode 100644 package/raspi2fb/raspi2fb.mk

diff --git a/package/Config.in b/package/Config.in
index bbb31a66dc..df43a234cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -536,6 +536,7 @@ endmenu
 	source "package/pru-software-support/Config.in"
 	source "package/pulseview/Config.in"
 	source "package/raspi-gpio/Config.in"
+	source "package/raspi2fb/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
diff --git a/package/raspi2fb/0001-vchostif-library-link.patch b/package/raspi2fb/0001-vchostif-library-link.patch
new file mode 100644
index 0000000000..7dc13534e2
--- /dev/null
+++ b/package/raspi2fb/0001-vchostif-library-link.patch
@@ -0,0 +1,11 @@
+--- a/CMakeLists.txt	2020-01-01 00:00:00.000000000 +0000
++++ b/CMakeLists.txt	2020-01-01 00:00:00.000000000 +0000
+@@ -6,7 +6,7 @@
+ 
+ set(BCM_HOST_INCLUDE_DIRS /opt/vc/include)
+ set(BCM_HOST_LIBRARY_DIRS /opt/vc/lib)
+-set(BCM_HOST_LIBRARIES bcm_host)
++set(BCM_HOST_LIBRARIES bcm_host vchostif)
+ 
+ find_package(PkgConfig)
+ pkg_check_modules(LIBBSD libbsd)
diff --git a/package/raspi2fb/Config.in b/package/raspi2fb/Config.in
new file mode 100644
index 0000000000..ab144c2d1a
--- /dev/null
+++ b/package/raspi2fb/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_RASPI2FB
+	bool "raspi2fb"
+	select BR2_PACKAGE_LIBBSD
+	select BR2_PACKAGE_RPI_USERLAND
+	help
+	  Program to copy the Raspberry Pi display
+	  to a secondary framebuffer.
+
+	  https://github.com/AndrewFromMelbourne/raspi2fb
diff --git a/package/raspi2fb/raspi2fb.hash b/package/raspi2fb/raspi2fb.hash
new file mode 100644
index 0000000000..6e14c2f5d1
--- /dev/null
+++ b/package/raspi2fb/raspi2fb.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256 713a73e99268ad4557b522513ddaef8de3431aee9f7eb338f3cbff5a036d776f  raspi2fb-7e1bae71c5af88240f7eb89a924161c7ee0b00f5.tar.gz
+sha256 afbc87568aa5a3108fc85b60015dd9346108dd77f588cd5c62d3385577519c4c  LICENSE
diff --git a/package/raspi2fb/raspi2fb.mk b/package/raspi2fb/raspi2fb.mk
new file mode 100644
index 0000000000..b9732e9a51
--- /dev/null
+++ b/package/raspi2fb/raspi2fb.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# raspi2fb
+#
+################################################################################
+
+RASPI2FB_VERSION = 7e1bae71c5af88240f7eb89a924161c7ee0b00f5
+RASPI2FB_SITE = $(call github,AndrewFromMelbourne,raspi2fb,$(RASPI2FB_VERSION))
+RASPI2FB_LICENSE = MIT
+RASPI2FB_LICENSE_FILES = LICENSE
+RASPI2FB_DEPENDENCIES = libbsd rpi-userland
+
+$(eval $(cmake-package))
-- 
2.21.1 (Apple Git-122.3)
