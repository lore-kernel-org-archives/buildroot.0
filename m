From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 22 Nov 2018 20:36:35 +0100
Subject: [Buildroot] [PATCH v1] imx-usb-loader: bump version to 4aa9809
Message-ID: <20181122193635.8550-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes imx-usb-loader usability for i.MX6 QP (failes with the current
version/patch stack).

Changes since e539461:

  9a88413 portable.h: fix build with gcc older than 4.8
  bf25425 add mx6ull_usb_work.conf
  1041959 correct commit "portable.h: fix build with gcc older than 4.8"
  f000130 mx6ull_usb_work.conf: fix copy/paste error in comment
  e99a093 portable: fix typo s/&&/&/ in BE16 fix
  eed0280 portable: use __builtin_bswap16 for BE16 if >= 4.8 GNUC
  95fe112 imx_usb: fix type on imx_usb help
  4aa9809 imx_uart: fix type on help

Remove upstream applied patch ([1]):

 - 0001-portable.h-fix-build-with-gcc-older-than-4.8.patch

[1] https://github.com/boundarydevices/imx_usb_loader/commit/9a88413996c6cfa8b903641f2f52b3fe487595cc

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ....h-fix-build-with-gcc-older-than-4.8.patch | 47 -------------------
 package/imx-usb-loader/imx-usb-loader.hash    |  2 +-
 package/imx-usb-loader/imx-usb-loader.mk      |  3 +-
 3 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch

diff --git a/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch b/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch
deleted file mode 100644
index 902b94d198..0000000000
--- a/package/imx-usb-loader/0001-portable.h-fix-build-with-gcc-older-than-4.8.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From b9cb60a911c35650c26995c7e6f7051fdf702d22 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 19 Jun 2018 15:31:52 +0300
-Subject: [PATCH] portable.h: fix build with gcc older than 4.8
-
-__builtin_bswap16 is available in all gcc architectures only since
-version 4.8. Older gcc versions fail to build:
-
-imx_sdp.o: In function `perform_dcd':
-.../imx_sdp.c:1138: undefined reference to `__builtin_bswap16'
-imx_sdp.o: In function `write_dcd_table_ivt':
-.../imx_sdp.c:457: undefined reference to `__builtin_bswap16'
-imx_sdp.o: In function `write_dcd':
-.../imx_sdp.c:410: undefined reference to `__builtin_bswap16'
-imx_sdp.o: In function `init_header':
-.../imx_sdp.c:1075: undefined reference to `__builtin_bswap16'
-
-Use a local implementation instead. The implementation suggested by
-Arnout Vandecappelle on the Buildroot mailing list.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://github.com/boundarydevices/imx_usb_loader/pull/82
-
- portable.h | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/portable.h b/portable.h
-index 364fe47b212a..b8a302bae400 100644
---- a/portable.h
-+++ b/portable.h
-@@ -58,7 +58,11 @@ extern int debugmode;
- #ifdef __GNUC__
- #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
- #define BE32(x) __builtin_bswap32(x)
--#define BE16(x) __builtin_bswap16(x)
-+#define BE16(x) \
-+({ \
-+	typeof(x) __x = (x); \
-+	(__x<<8 | __x>>8); \
-+})
- #else
- #define BE32(x) x
- #define BE16(x) x
--- 
-2.17.1
-
diff --git a/package/imx-usb-loader/imx-usb-loader.hash b/package/imx-usb-loader/imx-usb-loader.hash
index 8f59a3888b..149be676d7 100644
--- a/package/imx-usb-loader/imx-usb-loader.hash
+++ b/package/imx-usb-loader/imx-usb-loader.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  263dba6331206816890eaed0de7b0aa748c6e5300982fe6f31dcfe0df383ad62  imx-usb-loader-e5394615dd413c3823d5bd1de340933e16a8c07c.tar.gz
+sha256  5a17886042c09f0f16093031183a287a2a7ae0fa9cd8bdfa31e7b31cb92510d9  imx-usb-loader-4aa9809099dcece9a9225776321f3b4b5b896d78.tar.gz
diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index f0db57faac..594bbb9ca1 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-IMX_USB_LOADER_VERSION = e5394615dd413c3823d5bd1de340933e16a8c07c
+IMX_USB_LOADER_VERSION = 4aa9809099dcece9a9225776321f3b4b5b896d78
+
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPL-2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
-- 
2.19.1
