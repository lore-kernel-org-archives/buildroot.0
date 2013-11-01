From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Nov 2013 15:32:25 +0100
Subject: [Buildroot] [git commit] Config.in files: add/update comments on
	(e)glibc dependencies
Message-ID: <20131104211054.AB1AC9BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6a44b2f0a2f9cedf08a44703054d3993ae1843d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds missing comments about (e)glibc dependencies and updates the
text of existing comments.

Additionally, it splits dependency expressions for the touched packages from
  depends on BR2_BASE_DEP && !BR2_TOOLCHAIN_USES_GLIBC
to
  depends on BR2_BASE_DEP
  depends on !BR2_TOOLCHAIN_USES_GLIBC
so that (positive) base dependencies are separate from the (negative)
toolchain dependencies. This strategy makes it easier to write such comments
(because one can simply copy the base dependency from the actual package
config option), but also avoids complex and long boolean expressions.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppcms/Config.in                         |    2 +-
 package/freescale-imx/gpu-viv-bin-mx6q/Config.in |    2 +-
 package/gstreamer/gst-plugin-x170/Config.in      |    5 +++--
 package/libv4l/Config.in                         |    4 ++--
 package/nss-mdns/Config.in                       |    4 ++++
 package/on2-8170-libs/Config.in                  |    5 +++--
 package/sunxi-cedarx/Config.in                   |    8 +++++---
 package/sunxi-mali/Config.in                     |    5 +++--
 package/ti-gfx/Config.in                         |    5 +++--
 9 files changed, 25 insertions(+), 15 deletions(-)

diff --git a/package/cppcms/Config.in b/package/cppcms/Config.in
index 4074711..11daf7c 100644
--- a/package/cppcms/Config.in
+++ b/package/cppcms/Config.in
@@ -28,5 +28,5 @@ config BR2_PACKAGE_CPPCMS_ICU
 	  Using ICU allows advanced localization features into CppCMS,
 	  in another hand ICU is heavier than iconv.
 
-comment "cppcms needs a glibc toolchain w/ C++"
+comment "cppcms needs an (e)glibc toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
index a3c2057..1a6e245 100644
--- a/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
+++ b/package/freescale-imx/gpu-viv-bin-mx6q/Config.in
@@ -1,4 +1,4 @@
-comment "gpu-viv-bin-mx6q requires a glibc toolchain"
+comment "gpu-viv-bin-mx6q needs an (e)glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_GPU_VIV_BIN_MX6Q
diff --git a/package/gstreamer/gst-plugin-x170/Config.in b/package/gstreamer/gst-plugin-x170/Config.in
index 142367b..d7fe96a 100644
--- a/package/gstreamer/gst-plugin-x170/Config.in
+++ b/package/gstreamer/gst-plugin-x170/Config.in
@@ -11,5 +11,6 @@ config BR2_PACKAGE_GST_PLUGIN_X170
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
-comment "gst-plugin-x170 requires a toolchain which uses eglibc/glibc"
-	depends on BR2_PACKAGE_GSTREAMER && BR2_arm926t && !BR2_TOOLCHAIN_USES_GLIBC
+comment "gst-plugin-x170 needs an (e)glibc toolchain"
+	depends on BR2_PACKAGE_GSTREAMER && BR2_arm926t
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/libv4l/Config.in b/package/libv4l/Config.in
index c3c4481..9dc8cdd 100644
--- a/package/libv4l/Config.in
+++ b/package/libv4l/Config.in
@@ -17,7 +17,7 @@ config BR2_PACKAGE_LIBV4L_DECODE_TM6000
 	help
 	  Tool to decode tm6000 proprietary format streams
 
-comment "decode_tm6000 requires a GLIBC based toolchain"
+comment "decode_tm6000 needs an (e)glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
@@ -26,7 +26,7 @@ config BR2_PACKAGE_LIBV4L_IR_KEYTABLE
 	help
 	  Tool to alter keymaps of Remote Controller devices
 
-comment "ir-keytable requires a GLIBC based toolchain"
+comment "ir-keytable needs an (e)glibc toolchain"
 	depends on !BR2_TOOLCHAIN_USES_GLIBC
 
 config BR2_PACKAGE_LIBV4L_V4L2_COMPLIANCE
diff --git a/package/nss-mdns/Config.in b/package/nss-mdns/Config.in
index b537fa5..0192cc2 100644
--- a/package/nss-mdns/Config.in
+++ b/package/nss-mdns/Config.in
@@ -13,3 +13,7 @@ config BR2_PACKAGE_NSS_MDNS
 	  mDNS domain .local.
 
 	  http://0pointer.de/lennart/projects/nss-mdns/
+
+comment "nss-mdns needs an (e)glibc toolchain"
+	depends on BR2_USE_MMU && BR2_PACKAGE_AVAHI_DAEMON
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/on2-8170-libs/Config.in b/package/on2-8170-libs/Config.in
index 8c2d963..b573cfe 100644
--- a/package/on2-8170-libs/Config.in
+++ b/package/on2-8170-libs/Config.in
@@ -10,5 +10,6 @@ config BR2_PACKAGE_ON2_8170_LIBS
 
 	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 
-comment "on2-8170 libs requires a linux kernel to be built"
-	depends on !BR2_LINUX_KERNEL
+comment "on2-8170-libs needs an (e)glibc toolchain and a linux kernel to be built"
+	depends on BR2_arm926t
+	depends on !BR2_LINUX_KERNEL || !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/sunxi-cedarx/Config.in b/package/sunxi-cedarx/Config.in
index b280db0..fc6e529 100644
--- a/package/sunxi-cedarx/Config.in
+++ b/package/sunxi-cedarx/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SUNXI_CEDARX
 	bool "sunxi-cedarx"
-	depends on BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
+	depends on BR2_arm
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Sunxi CedarX decoder libraries. CedarX is Allwinner's
 	  multimedia co-processing technology for hardware accelerated
@@ -10,5 +11,6 @@ config BR2_PACKAGE_SUNXI_CEDARX
 	  http://github.com/linux-sunxi/cedarx-libs
 	  http://linux-sunxi.org/CedarX
 
-comment "sunxi-cedarx requires an eglibc/glibc based toolchain"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC && BR2_arm
+comment "sunxi-cedarx needs an (e)glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/sunxi-mali/Config.in b/package/sunxi-mali/Config.in
index c479cf4..2ca049d 100644
--- a/package/sunxi-mali/Config.in
+++ b/package/sunxi-mali/Config.in
@@ -57,5 +57,6 @@ endchoice
 
 endif
 
-comment "sunxi-mali requires an eglibc/glibc based toolchain"
-	depends on BR2_arm && !BR2_TOOLCHAIN_USES_GLIBC
+comment "sunxi-mali needs an (e)glibc toolchain"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/ti-gfx/Config.in b/package/ti-gfx/Config.in
index f336c52..9387b57 100644
--- a/package/ti-gfx/Config.in
+++ b/package/ti-gfx/Config.in
@@ -60,5 +60,6 @@ endchoice
 
 endif
 
-comment "ti-gfx requires an eglibc/glibc based toolchain and the linux kernel"
-	depends on !(BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC) && BR2_arm
+comment "ti-gfx needs an (e)glibc toolchain and the linux kernel"
+	depends on BR2_arm
+	depends on !(BR2_LINUX_KERNEL && BR2_TOOLCHAIN_USES_GLIBC)
