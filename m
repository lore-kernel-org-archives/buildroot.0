From: Romain Perier <romain.perier@free-electrons.com>
Date: Tue, 26 Jul 2016 10:21:28 +0200
Subject: [Buildroot] [PATCH v3 4/6] package/xserver_xorg-server: add version
	1.17.4
In-Reply-To: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
References: <1469521290-20446-1-git-send-email-romain.perier@free-electrons.com>
Message-ID: <1469521290-20446-5-git-send-email-romain.perier@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some old binary blobs drivers only implement an old VIDEODRV ABI. This
is the case for the AMD Catalyst driver for example.

Such a situation already exists with the nvidia-tegra23, that only
support the VIDEODRV ABI 14.

Since VIDEODRV ABIs are not backward compatible [0], lets introduce an
older Xserver version that supports such an old ABI.

0. https://www.x.org/wiki/XorgModuleABIVersions/

Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in                | 10 ++++++++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.hash |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 26b9c8e..af1bac9 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -58,12 +58,16 @@ if BR2_PACKAGE_XSERVER_XORG_SERVER
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
 	bool
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	bool
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	bool
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI
 	int
 	default 14 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
+	default 19 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	default 20 if BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 
 choice
@@ -74,6 +78,11 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_20
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
+	bool "1.17.4"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
+	select BR2_PACKAGE_XPROTO_PRESENTPROTO
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 	bool "1.14.7"
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
@@ -83,6 +92,7 @@ endchoice
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
 	default "1.18.3" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_18
+	default "1.17.4" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 2172c89..abd1589 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,5 +1,7 @@
 # From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
 sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
 sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2015-October/002650.html
+sha256 0c4b45c116a812a996eb432d8508cf26c2ec8c3916ff2a50781796882f8d6457        xorg-server-1.17.4.tar.bz2
 # From https://lists.freedesktop.org/archives/xorg-announce/2016-April/002683.html
 sha256	ea739c22517cdbe2b5f7c0a5fd05fe8a10ac0629003e71c0c7862f4bb60142cd	xorg-server-1.18.3.tar.bz2
-- 
2.8.1
