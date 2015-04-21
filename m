From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Apr 2015 19:04:38 +0200
Subject: [Buildroot] [PATCH 2/8 v11] package/xserver_xorg-server: make the
	version a choice
In-Reply-To: <cover.1429635674.git.yann.morin.1998@free.fr>
References: <cover.1429635674.git.yann.morin.1998@free.fr>
Message-ID: <9c8b07c5f9dfa43280456e5e1ec375042f8e09c9.1429635674.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only a single entry for now, but we'll add one more in an upcoming
patch, to support old binary-only drivers, like the NVidia Tegra2/3
drivers.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/x11r7/xserver_xorg-server/Config.in              | 12 ++++++++++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 1123f3b..3a7b18b 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -57,6 +57,18 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 if BR2_PACKAGE_XSERVER_XORG_SERVER
 
 choice
+	bool "X Window System server version"
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17_1
+	bool "1.17.1"
+
+endchoice
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
+	string
+	default "1.17.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17_1
+
+choice
 	prompt "X Window System server type"
 	default BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	help
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index f120bec..d08197d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 1.17.1
+XSERVER_XORG_SERVER_VERSION = $(call qstrip,$(BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION))
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
-- 
1.9.1
