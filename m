From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 20:09:42 +0100
Subject: [Buildroot] [PATCH 2/8 v8] package/xserver_xorg-server: make the
	version a choice
In-Reply-To: <cover.1426360000.git.yann.morin.1998@free.fr>
References: <cover.1426360000.git.yann.morin.1998@free.fr>
Message-ID: <3748f143cdf19fd106c0fd1ed2ea34aad56045a4.1426360000.git.yann.morin.1998@free.fr>
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
index db8a54d..6c48070 100644
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
index bb5381c..6112698 100644
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
