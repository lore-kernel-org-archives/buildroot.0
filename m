From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 18 Feb 2015 09:23:56 +0000
Subject: [Buildroot] [PATCH 1/2] mjpg-streamer: disable for static builds
Message-ID: <1424251437-8742-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needs to load plugins to do its job. Those plugins are
shared objects (.so) which are loaded using 'dlopen()', so it makes no
sense to enable this package when doing static builds where 'dlopen()'
is not available.

Fixes:

  http://autobuild.buildroot.net/results/cd5/cd52b739370d57b5ecbc6472b8c7f1126700e85f/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/mjpg-streamer/Config.in |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mjpg-streamer/Config.in b/package/mjpg-streamer/Config.in
index 7925d41..db57bc0 100644
--- a/package/mjpg-streamer/Config.in
+++ b/package/mjpg-streamer/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_MJPG_STREAMER
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # linux/uvcvideo.h
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # plugins need dlopen()
 	select BR2_PACKAGE_JPEG
 	help
 	  MJPG-streamer takes JPGs from Linux-UVC compatible webcams, filesystem
@@ -11,6 +12,7 @@ config BR2_PACKAGE_MJPG_STREAMER
 
 	  http://mjpg-streamer.sourceforge.net
 
-comment "mjpg-streamer needs a toolchain w/ threads, headers >= 3.0"
+comment "mjpg-streamer needs a toolchain w/ threads, headers >= 3.0, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS
-- 
1.7.1
