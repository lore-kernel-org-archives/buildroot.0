From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Jul 2014 23:28:15 +0200
Subject: [Buildroot] [PATCH 2/2] package/gst-fsl-plugins: not available for
	kernel headers >= 3.11
In-Reply-To: <cover.1406323367.git.yann.morin.1998@free.fr>
References: <cover.1406323367.git.yann.morin.1998@free.fr>
Message-ID: <09b3dee632b2855fe6517fbdbde2ac9d8a98dbbc.1406323367.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gst-fsl-plugins the v4l2 API, such as 'struct v4l2_dbg_chip_ident', that
was removed in 3.11.

So, limit this package to toolchains with kernel headers <= 3.10.

Reported-by: Gary Bisson <bisson.gary@gmail.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gary Bisson <bisson.gary@gmail.com>
---
 package/gstreamer/gst-fsl-plugins/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index 309e745..e1daddb 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -1,15 +1,16 @@
 comment "gst-fsl-plugins needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm && !BR2_LINUX_KERNEL
 
-comment "gst-fsl-plugins needs an (e)glibc toolchain"
+comment "gst-fsl-plugins needs an (e)glibc toolchain w/ headers <= 3.10"
 	depends on BR2_arm
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 
 config BR2_PACKAGE_GST_FSL_PLUGINS
 	bool "gst-fsl-plugins"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_TOOLCHAIN_USES_GLIBC # libfslcodec
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # Uses v4l2 API changed in 3.11
 	select BR2_PACKAGE_GST_PLUGINS_BASE
 	select BR2_PACKAGE_LIBFSLVPUWRAP
 	select BR2_PACKAGE_IMX_LIB
-- 
1.9.1
