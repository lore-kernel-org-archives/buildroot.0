From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 10 Feb 2016 21:59:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/tiff: add optional support for xz
In-Reply-To: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
References: <1455137950-18164-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1455137950-18164-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When xz was compiled before, tiff will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libtiff.so.5.2.4 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [libjpeg.so.9]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libm.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tiff/Config.in | 4 ++++
 package/tiff/tiff.mk   | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index acb335c..00c2a3d 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -41,6 +41,10 @@ config BR2_PACKAGE_TIFF_ZLIB
 	select BR2_PACKAGE_ZLIB
 	default y
 
+config BR2_PACKAGE_TIFF_XZ
+	bool "XZ compression"
+	select BR2_PACKAGE_XZ
+
 config BR2_PACKAGE_TIFF_PIXARLOG
 	bool "Pixar log-format algorithm (requires Zlib)"
 	select BR2_PACKAGE_TIFF_ZLIB
diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index c2e713c..266272a 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -49,6 +49,12 @@ else
 TIFF_DEPENDENCIES += zlib
 endif
 
+ifneq ($(BR2_PACKAGE_TIFF_XZ),y)
+TIFF_CONF_OPTS += --disable-lzma
+else
+TIFF_DEPENDENCIES += xz
+endif
+
 ifneq ($(BR2_PACKAGE_TIFF_PIXARLOG),y)
 TIFF_CONF_OPTS += --disable-pixarlog
 endif
-- 
2.7.0
