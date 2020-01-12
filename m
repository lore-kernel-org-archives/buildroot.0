From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 22:44:07 +0100
Subject: [Buildroot] [git commit] package/opencv3: use external protobuf
 instead of bundled one
Message-ID: <20200112213429.C79F38C9E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31c68a449ecd7da61ecfd909bea7ce799f9a6450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since version 3.3.0 and its commit
https://github.com/opencv/opencv/commit/1c4c58d1b5b7430463281e8c8072e04245f561b0,
opencv3 bundles its own copy of protobuf. Instead of using the bundled
protobuf library, this commit disables building protobuf
(BUILD_PROTOBUF=OFF) and instead uses the protobuf Buildroot package
(using the WITH_PROTOBUF=ON/OFF option).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/Config.in  | 12 ++++++++++++
 package/opencv3/opencv3.mk |  8 ++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index cf7763d4ae..fdd7152ee6 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -307,6 +307,18 @@ config BR2_PACKAGE_OPENCV3_WITH_PNG
 	help
 	  Use shared libpng from the target system.
 
+config BR2_PACKAGE_OPENCV3_WITH_PROTOBUF
+	bool "protobuf support"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	select BR2_PACKAGE_PROTOBUF
+	help
+	  Use shared protobuf from the target system.
+
+comment "protobuf support needs a toolchain w/ gcc >= 4.8"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+
 config BR2_PACKAGE_OPENCV3_WITH_TIFF
 	bool "tiff support"
 	select BR2_PACKAGE_TIFF
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 4ddd80723f..89ed8f4278 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -193,6 +193,7 @@ OPENCV3_CONF_OPTS += \
 	-DBUILD_JPEG=OFF \
 	-DBUILD_OPENEXR=OFF \
 	-DBUILD_PNG=OFF \
+	-DBUILD_PROTOBUF=OFF \
 	-DBUILD_TIFF=OFF \
 	-DBUILD_ZLIB=OFF \
 	-DINSTALL_C_EXAMPLES=OFF \
@@ -288,6 +289,13 @@ else
 OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PROTOBUF),y)
+OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=ON
+OPENCV3_DEPENDENCIES += protobuf
+else
+OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
 OPENCV3_CONF_OPTS += -DWITH_QT=5
 OPENCV3_DEPENDENCIES += qt5base
