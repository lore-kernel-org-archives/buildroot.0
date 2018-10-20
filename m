From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Oct 2018 23:47:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/mjpg-streamer: needs headers >= 3.16
Message-ID: <20181020214720.18993-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream commit

https://github.com/jacksonliam/mjpg-streamer/commit/29fb2b9a65630721c539a216225288fba9497c49#diff-fc82978386df1046ac9aac8cbe0a129eR825

added the usage of V4L2_EVENT_SOURCE_CHANGE which was added to kernel
version 3.16 with commit "[media] v4l: Add source change event":
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/include/uapi/linux/videodev2.h?id=3cbe6e5bcad0b102c06b9c6029fda75630045475

To compare:
- linux 3.15 without the commit:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/include/uapi/linux/videodev2.h?h=linux-3.15.y
- linux 3.16 is the first kernel with the commit:
  https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/log/include/uapi/linux/videodev2.h?h=linux-3.16.y

Fixes
http://autobuild.buildroot.net/results/4f8/4f8dc7520ee692c665167fda69dc3af66263008f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mjpg-streamer/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mjpg-streamer/Config.in b/package/mjpg-streamer/Config.in
index 3587af0288..59f4208ca7 100644
--- a/package/mjpg-streamer/Config.in
+++ b/package/mjpg-streamer/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_MJPG_STREAMER
 	bool "mjpg-streamer"
-	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 # linux/uvcvideo.h
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 # V4L2_EVENT_SOURCE_CHANGE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # plugins need dlopen()
@@ -12,7 +12,7 @@ config BR2_PACKAGE_MJPG_STREAMER
 
 	  https://github.com/jacksonliam/mjpg-streamer
 
-comment "mjpg-streamer needs a toolchain w/ threads, headers >= 3.0, dynamic library"
+comment "mjpg-streamer needs a toolchain w/ threads, headers >= 3.16, dynamic library"
 	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0 || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_16 || BR2_STATIC_LIBS
-- 
2.19.1
