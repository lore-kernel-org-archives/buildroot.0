From: Guillermo A. Amaral <g@maral.me>
Date: Mon, 15 Jan 2018 19:34:50 -0800
Subject: [Buildroot] [PATCH 2/2] package/rpi-fbcp: Added package for
 Raspberry Pi
In-Reply-To: <20180116033450.6926-1-g@maral.me>
References: <20180116033450.6926-1-g@maral.me>
Message-ID: <20180116033450.6926-2-g@maral.me>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Raspberry Pi utility used to mirror primary framebuffer to secondary
framebuffer.

Signed-off-by: Guillermo A. Amaral <g@maral.me>
---
 package/Config.in                                  |  1 +
 .../rpi-fbcp/0001-make-buildroot-friendly.patch    | 35 ++++++++++++++++++++++
 package/rpi-fbcp/Config.in                         | 13 ++++++++
 package/rpi-fbcp/rpi-fbcp.mk                       | 11 +++++++
 4 files changed, 60 insertions(+)
 create mode 100644 package/rpi-fbcp/0001-make-buildroot-friendly.patch
 create mode 100644 package/rpi-fbcp/Config.in
 create mode 100644 package/rpi-fbcp/rpi-fbcp.mk

diff --git a/package/Config.in b/package/Config.in
index 8e8e7581c..c54901c69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -483,6 +483,7 @@ endmenu
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
 	source "package/rpi-userland/Config.in"
+	source "package/rpi-fbcp/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtl8188eu/Config.in"
 	source "package/rtl8723bs/Config.in"
diff --git a/package/rpi-fbcp/0001-make-buildroot-friendly.patch b/package/rpi-fbcp/0001-make-buildroot-friendly.patch
new file mode 100644
index 000000000..5f86f5af6
--- /dev/null
+++ b/package/rpi-fbcp/0001-make-buildroot-friendly.patch
@@ -0,0 +1,35 @@
+From 8218434aafd18f7a1f742bddeef10b8829d59f89 Mon Sep 17 00:00:00 2001
+From: "Guillermo A. Amaral" <g@maral.me>
+Date: Sun, 14 Jan 2018 15:22:21 -0800
+Subject: [PATCH] Make build script more buildroot friendly
+
+Signed-off-by: Guillermo A. Amaral <g@maral.me>
+---
+ CMakeLists.txt | 13 +++----------
+ 1 file changed, 3 insertions(+), 10 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 6202553..367182c 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,14 +1,7 @@
+ cmake_minimum_required(VERSION 2.8)
+ 
+-SET(COMPILE_DEFINITIONS -Werror)
+-
+-include_directories(/opt/vc/include)
+-include_directories(/opt/vc/include/interface/vcos/pthreads)
+-include_directories(/opt/vc/include/interface/vmcs_host)
+-include_directories(/opt/vc/include/interface/vmcs_host/linux)
+-
+-link_directories(/opt/vc/lib)
+-
+ add_executable(fbcp main.c)
+ 
+-target_link_libraries(fbcp bcm_host)
++target_link_libraries(fbcp bcm_host vchostif)
++
++install(TARGETS fbcp RUNTIME DESTINATION "${CMAKE_INSTALL_PREFIX}/sbin")
+-- 
+2.13.6
+
diff --git a/package/rpi-fbcp/Config.in b/package/rpi-fbcp/Config.in
new file mode 100644
index 000000000..9a186de9c
--- /dev/null
+++ b/package/rpi-fbcp/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RPI_FBCP
+	bool "rpi-fbcp"
+	depends on BR2_arm
+	depends on BR2_PACKAGE_RPI_USERLAND
+	help
+	  Raspberry Pi utility. Used for mirror primary framebuffer to
+	  secondary framebuffer.
+
+	  https://github.com/tasanakorn/rpi-fbcp
+
+comment "rpi-fbc needs rpi-userland"
+	depends on BR2_arm
+	depends on !BR2_PACKAGE_RPI_USERLAND
diff --git a/package/rpi-fbcp/rpi-fbcp.mk b/package/rpi-fbcp/rpi-fbcp.mk
new file mode 100644
index 000000000..72f778c1e
--- /dev/null
+++ b/package/rpi-fbcp/rpi-fbcp.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# rpi-fbcp
+#
+################################################################################
+
+RPI_FBCP_VERSION = 8087a71d0330a078d91aa78656684ab5313616c6
+RPI_FBCP_SITE = $(call github,tasanakorn,rpi-fbcp,$(RPI_FBCP_VERSION))
+RPI_FBCP_DEPENDENCIES = rpi-userland
+
+$(eval $(cmake-package))
-- 
2.13.6
