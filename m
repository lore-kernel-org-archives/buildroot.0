From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Nov 2018 19:24:16 +0100
Subject: [Buildroot] [PATCH 1/1] mpv: disable static build with qt-zlib
Message-ID: <20181102182416.27015-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Static build of mpv with qt-zlib will fail because zlib and qt-zlib
defines the same functions (inflateReset, inflatePrime ...)

So add a dependency on !(BR2_STATIC_LIBS && BR2_PACKAGE_QT_QTZLIB)

Theoretically, this dependency should be put on zlib package on all its
reverse dependencies but this make a lot of packages

Fixes:
 - http://autobuild.buildroot.org/results/0be6e359d46a8a701006305c32b514687854b035

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/mpv/Config.in b/package/mpv/Config.in
index 69810038f1..a2b023868a 100644
--- a/package/mpv/Config.in
+++ b/package/mpv/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_MPV
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_QT_QTZLIB)
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE
@@ -25,5 +26,6 @@ config BR2_PACKAGE_MPV
 comment "mpv needs a toolchain w/ threads, gcc >= 4.5"
 	depends on BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on !(BR2_STATIC_LIBS && BR2_PACKAGE_QT_QTZLIB)
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
-- 
2.17.1
