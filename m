From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 16:01:43 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv3: add protobuf option
Message-ID: <20200111150143.1253117-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, protobuf is built unconditionnally since version 3.3.0 and
https://github.com/opencv/opencv/commit/1c4c58d1b5b7430463281e8c8072e04245f561b0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
index d38107f6e7..bac4c2fa11 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -198,6 +198,7 @@ OPENCV3_CONF_OPTS += \
 	-DBUILD_JPEG=OFF \
 	-DBUILD_OPENEXR=OFF \
 	-DBUILD_PNG=OFF \
+	-DBUILD_PROTOBUF=OFF \
 	-DBUILD_TIFF=OFF \
 	-DBUILD_ZLIB=OFF \
 	-DINSTALL_C_EXAMPLES=OFF \
@@ -293,6 +294,13 @@ else
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
-- 
2.24.1
