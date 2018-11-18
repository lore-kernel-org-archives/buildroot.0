From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Nov 2018 20:35:11 +0100
Subject: [Buildroot] [PATCH 1/2] imx-uuc: needs headers >= 3.18
Message-ID: <20181118193512.11215-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to 79e9798eee9cd972d92ed2b18f170de856d153c9 added the following
commit:
https://github.com/NXPmicro/imx-uuc/commit/ce808f3010ec73ccc07775c6cfd5317807a22415

This new ufb daemon uses usb_functionfs_descs_head_v2 which is available
only since 3.18:
https://github.com/torvalds/linux/commit/1df22b4ea9d91b01267fb61c155c31fb65d6b8a0

So add a dependency on headers >= 3.18

Fixes:
 - http://autobuild.buildroot.org/results/1081062b1c32c44a9feb5b14288095bc72d15986

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freescale-imx/imx-uuc/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-uuc/Config.in b/package/freescale-imx/imx-uuc/Config.in
index ed734ad7e2..0e257bde17 100644
--- a/package/freescale-imx/imx-uuc/Config.in
+++ b/package/freescale-imx/imx-uuc/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_IMX_UUC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # usb_functionfs_descs_head_v2
 	select BR2_PACKAGE_HOST_DOSFSTOOLS
 	help
 	  This package provides the Universal Adapter user-space
@@ -15,7 +16,8 @@ config BR2_PACKAGE_IMX_UUC
 	  This package is provided by Freescale/NXP as-is and doesn't
 	  have an upstream.
 
-comment "imx-uuc needs a toolchain w/ threads"
+comment "imx-uuc needs a toolchain w/ threads, headers >= 3.18"
 	depends on BR2_arm
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
-- 
2.17.1
