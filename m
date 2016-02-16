From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Feb 2016 23:15:37 +0100
Subject: [Buildroot] [git commit] package/tiff: add optional support for xz
Message-ID: <20160216221543.17C7A8183C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae8641239bd85212acd9f93f0d838c4c1d48ea71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When xz was compiled before, tiff will use it as optional dependency:

$ output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/lib/libtiff.so.5.2.4 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [liblzma.so.5]
 0x00000001 (NEEDED)                     Shared library: [libjpeg.so.9]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libm.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.1]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
