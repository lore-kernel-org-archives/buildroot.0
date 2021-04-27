From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 27 Apr 2021 14:04:38 +0200
Subject: [Buildroot] [PATCH] package/freescale-imx/imx-gpu-viv: force
 wayland backend for all i.MX8
Message-ID: <20210427120438.1192346-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- As Vivante blobs only support Wayland for all i.MX 8
- Previously was only checking on IMX8M platform, allowing other
platforms to select another backend which was wrong

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

I know creating such empty config is not recommended, but it appeared to
be the cleanest solution not to copy the platform names many times.
But I'm open to another approach, let me know.

Regards,
Gary
---
 package/freescale-imx/imx-gpu-viv/Config.in | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/freescale-imx/imx-gpu-viv/Config.in b/package/freescale-imx/imx-gpu-viv/Config.in
index cca2689905..ba1baa6b7b 100644
--- a/package/freescale-imx/imx-gpu-viv/Config.in
+++ b/package/freescale-imx/imx-gpu-viv/Config.in
@@ -29,6 +29,15 @@ config BR2_PACKAGE_IMX_GPU_VIV
 
 if BR2_PACKAGE_IMX_GPU_VIV
 
+config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL_ONLY
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8 || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MP || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
 choice
 	prompt "Output option"
 	help
@@ -40,19 +49,19 @@ config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_X11
 	bool "X11"
 	depends on BR2_PACKAGE_XORG7
 	# The i.MX8 blob doesn't support X11 output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL_ONLY
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 
 comment "X11 backend needs Xorg package"
 	depends on !BR2_PACKAGE_XORG7
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL_ONLY
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_FB
 	bool "Framebuffer"
 	# The i.MX8 blob doesn't support FB output
-	depends on !BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	depends on !BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL_ONLY
 
 config BR2_PACKAGE_IMX_GPU_VIV_OUTPUT_WL
 	bool "Wayland"
-- 
2.30.2
