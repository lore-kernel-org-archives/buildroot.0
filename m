From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 22 Jun 2018 14:44:05 +0300
Subject: [Buildroot] [PATCH] imx-usb-loader: make the byte swap macro more
 robust
Message-ID: <4dfbf2f59dc79aa360a50cc7cee0dc05daaf1065.1529667845.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The local 16-bit byte swap implementation that was introduced in commit
b05f8f439681 (imx-usb-loader: fix build with older gcc) is not robust
enough. It suffers from double evaluation, and operators precedence
breakage. Use a better implementation suggested by Arnout Vandecappelle.

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ....h-fix-build-with-gcc-older-than-4.8.patch | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch b/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch
index c0aabed542c6..902b94d19801 100644
--- a/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch
+++ b/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch
@@ -1,4 +1,4 @@
-From c581e6037ec7ab2f9cd615f6ffa149b4d0a5638c Mon Sep 17 00:00:00 2001
+From b9cb60a911c35650c26995c7e6f7051fdf702d22 Mon Sep 17 00:00:00 2001
 From: Baruch Siach <baruch@tkos.co.il>
 Date: Tue, 19 Jun 2018 15:31:52 +0300
 Subject: [PATCH] portable.h: fix build with gcc older than 4.8
@@ -15,25 +15,30 @@ imx_sdp.o: In function `write_dcd':
 imx_sdp.o: In function `init_header':
 .../imx_sdp.c:1075: undefined reference to `__builtin_bswap16'
 
-Use a local implementation instead.
+Use a local implementation instead. The implementation suggested by
+Arnout Vandecappelle on the Buildroot mailing list.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
 Upstream status: https://github.com/boundarydevices/imx_usb_loader/pull/82
 
- portable.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ portable.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/portable.h b/portable.h
-index 364fe47b212a..364832b5ea69 100644
+index 364fe47b212a..b8a302bae400 100644
 --- a/portable.h
 +++ b/portable.h
-@@ -58,7 +58,7 @@ extern int debugmode;
+@@ -58,7 +58,11 @@ extern int debugmode;
  #ifdef __GNUC__
  #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
  #define BE32(x) __builtin_bswap32(x)
 -#define BE16(x) __builtin_bswap16(x)
-+#define BE16(x) (x<<8 | x>>8)
++#define BE16(x) \
++({ \
++	typeof(x) __x = (x); \
++	(__x<<8 | __x>>8); \
++})
  #else
  #define BE32(x) x
  #define BE16(x) x
-- 
2.17.1
