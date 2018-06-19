From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jun 2018 22:50:24 +0200
Subject: [Buildroot] [git commit] imx-usb-loader: fix build with older gcc
Message-ID: <20180619205000.179EE8908B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b05f8f43968153af197ba0e635c8afa6856665ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the last version bump imx-usb-loader uses __builtin_bswap16 which
is not universally available in gcc older than version 4.8. Add a patch
switching to a local 16-bit bytes swap implementation.

Should fix:
http://autobuild.buildroot.net/results/a63/a63b593b7ef3b6d32e755afe42b77d47dbf0276e/
http://autobuild.buildroot.net/results/48c/48c95cfc65f99fa02be81a11303ba8999f57091a/
http://autobuild.buildroot.net/results/c9d/c9d4f99b49ddb9b2ce08fce7672dd7c70cf62912/

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...table.h-fix-build-with-gcc-older-than-4.8.patch | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch b/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch
new file mode 100644
index 0000000000..c0aabed542
--- /dev/null
+++ b/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch
@@ -0,0 +1,42 @@
+From c581e6037ec7ab2f9cd615f6ffa149b4d0a5638c Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Tue, 19 Jun 2018 15:31:52 +0300
+Subject: [PATCH] portable.h: fix build with gcc older than 4.8
+
+__builtin_bswap16 is available in all gcc architectures only since
+version 4.8. Older gcc versions fail to build:
+
+imx_sdp.o: In function `perform_dcd':
+.../imx_sdp.c:1138: undefined reference to `__builtin_bswap16'
+imx_sdp.o: In function `write_dcd_table_ivt':
+.../imx_sdp.c:457: undefined reference to `__builtin_bswap16'
+imx_sdp.o: In function `write_dcd':
+.../imx_sdp.c:410: undefined reference to `__builtin_bswap16'
+imx_sdp.o: In function `init_header':
+.../imx_sdp.c:1075: undefined reference to `__builtin_bswap16'
+
+Use a local implementation instead.
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://github.com/boundarydevices/imx_usb_loader/pull/82
+
+ portable.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/portable.h b/portable.h
+index 364fe47b212a..364832b5ea69 100644
+--- a/portable.h
++++ b/portable.h
+@@ -58,7 +58,7 @@ extern int debugmode;
+ #ifdef __GNUC__
+ #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
+ #define BE32(x) __builtin_bswap32(x)
+-#define BE16(x) __builtin_bswap16(x)
++#define BE16(x) (x<<8 | x>>8)
+ #else
+ #define BE32(x) x
+ #define BE16(x) x
+-- 
+2.17.1
+
