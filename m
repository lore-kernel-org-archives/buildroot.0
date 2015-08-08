From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Aug 2015 13:59:06 +0200
Subject: [Buildroot] [PATCH 3/3] package/x11r7/xserver_xorg-server: Add
	libdrm dependency when dri or dri2 is enabled
In-Reply-To: <1439035146-26080-1-git-send-email-bernd.kuhls@t-online.de>
References: <1439035146-26080-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1439035146-26080-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes compile error using this defconfig
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XPROTO_DRI2PROTO=y

drmVersionPtr is referenced not only in hw/xfree86/dri2/dri2.c
but also in hw/xfree86/dri/dri.c.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index f0ec598..8b794b3 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -92,6 +92,8 @@ choice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR
 	bool "Modular X.org"
+	select BR2_PACKAGE_LIBDRM if (BR2_PACKAGE_XPROTO_XF86DRIPROTO || \
+		BR2_PACKAGE_XPROTO_DRI2PROTO)
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  This variant of the X.org server is the full-blown variant,
-- 
2.1.4
