From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 May 2020 21:39:52 +0200
Subject: [Buildroot] [git commit] package/rpi-firmware: select
 BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT when needed
Message-ID: <20200516192641.0BFF2912A1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fd1d4fec1c88f9f3f4e41f9b6dc8a740538217b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is enabled, and the
DTBs are built by Linux (i.e BR2_LINUX_KERNEL_DTS_SUPPORT is enabled),
these DTBs should be built with the -@ Device Tree compiler option, so
that they can be used together with DTB overlays. So let's select
BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT in this situation.

Fixes:

  https://bugs.busybox.net/show_bug.cgi?id=12831

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpi-firmware/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index 7cebc5e7ca..cced53f017 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -85,6 +85,8 @@ config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS
 	default y
 	depends on BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS \
 		|| BR2_LINUX_KERNEL_DTS_SUPPORT
+	select BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT \
+		if BR2_LINUX_KERNEL_DTS_SUPPORT
 	help
 	  Say 'y' here if you need to load one or more of the DTB
 	  overlays, to support HATs (Hardware Attached on Top, add-on
