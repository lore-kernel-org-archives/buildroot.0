From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 27 Aug 2016 16:02:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/x264: disable CLI tool if no MMU
Message-ID: <20160827140238.28617-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/837/837fd5a63d59b5c65818ec005a565cb7741a1cdd/

Inspired by
https://git.buildroot.net/buildroot/commit/?id=80b9dfceafb1d635dbb2c7f948b8b27e190e3e65

The build error can still be reproduced with a current blackfin
toolchain using this defconfig:

BR2_bfin=y
BR2_bf512=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-bfin-full-2016.08-rc2-4-g0bca8d9.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_7=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_X264=y
BR2_PACKAGE_X264_CLI=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x264/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x264/Config.in b/package/x264/Config.in
index 7bf2319..e0c308a 100644
--- a/package/x264/Config.in
+++ b/package/x264/Config.in
@@ -13,6 +13,7 @@ if BR2_PACKAGE_X264
 
 config BR2_PACKAGE_X264_CLI
 	bool "CLI"
+	depends on BR2_USE_MMU # madvise()
 	help
 	  Command-line tool to encode video streams into the
 	  H.264/MPEG-4 AVC compression format.
-- 
2.9.3
