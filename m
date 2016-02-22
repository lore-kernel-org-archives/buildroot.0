From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Feb 2016 09:25:29 -0300
Subject: [Buildroot] [PATCH] tvheadend: depends on BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <1456143929-21552-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It uses __sync_fetch_and_add_4() and other 32-bit atomics, fixes:
http://autobuild.buildroot.net/results/610/610ef13ee1d62597f51b061cd1216e7a4e96abff/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tvheadend/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
index bfc156a..095ec65 100644
--- a/package/tvheadend/Config.in
+++ b/package/tvheadend/Config.in
@@ -1,12 +1,14 @@
 comment "tvheadend needs a toolchain w/ NPTL, headers >= 3.2, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2 || BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_TVHEADEND
 	bool "tvheadend"
 	depends on !BR2_STATIC_LIBS # dladdr()
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	select BR2_PACKAGE_DTV_SCAN_TABLES
 	select BR2_PACKAGE_FFMPEG_AVRESAMPLE if BR2_PACKAGE_FFMPEG
 	select BR2_PACKAGE_FFMPEG_SWSCALE if BR2_PACKAGE_FFMPEG
-- 
2.4.10
