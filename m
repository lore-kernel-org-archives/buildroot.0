From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 20:09:43 +0100
Subject: [Buildroot] [PATCH 3/8 v8] package/xserver_xorg-server: add blind
	options to specify driver ABI
In-Reply-To: <cover.1426360000.git.yann.morin.1998@free.fr>
References: <cover.1426360000.git.yann.morin.1998@free.fr>
Message-ID: <9ab90196ea39888222d1678040373433e6a10e01.1426360000.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The upcoming NVidia Tegra2/3 binary blobs only work with a certain
VIDEODRV ABI (namely up to 14), so we must have a way to represent that
ABI so that such packages can not be enabled with a too recent/old ABI.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xserver_xorg-server/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 6c48070..d26329d 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -56,11 +56,19 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 
 if BR2_PACKAGE_XSERVER_XORG_SERVER
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	bool
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
+	int
+	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+
 choice
 	bool "X Window System server version"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17_1
 	bool "1.17.1"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 
 endchoice
 
-- 
1.9.1
