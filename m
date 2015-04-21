From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2015 19:04:41 +0200
Subject: [Buildroot] [PATCH 5/8 v11] package/xserver_xorg-server: add
	version 1.14.7
In-Reply-To: <cover.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <7c1cccc2773ed740d1c418d1437c629839849f73.1429635674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some old binary blobs drivers, like the NVidia Tegra2/3 blobs, only
implement an old VIDEODRV ABI.

Since VIDEODRV ABIs are not backward compatible [0], lets introduce an
older Xserver version that supports such an old ABI.

[0] http://www.x.org/wiki/XorgModuleABIVersions/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xserver_xorg-server/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 2c7839e..d7b169a 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -55,11 +55,15 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 
 if BR2_PACKAGE_XSERVER_XORG_SERVER
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
+	bool
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	bool
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
 	int
+	default 14 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 
 choice
@@ -70,11 +74,16 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17_1
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14_7
+	bool "1.14.7"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
+
 endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
 	default "1.17.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17_1
+	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14_7
 
 choice
 	prompt "X Window System server type"
-- 
1.9.1
