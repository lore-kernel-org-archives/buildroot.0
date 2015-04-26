From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:24:10 +0200
Subject: [Buildroot] [git commit] package/xserver_xorg-server: make the
	version a choice
Message-ID: <20150426202424.DED6E80794@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2ac79a9fb50fba532b8c82bb1a78632f6f181ed8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only a single entry for now, but we'll add one more in an upcoming
patch, to support old binary-only drivers, like the NVidia Tegra2/3
drivers.

[Thomas:
 - rename option from BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17_1 to
   BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17, since we don't want to
   rename the option at each minor release of the X.org server, and
   X.org servers with the same major version will not have a different
   ABI.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |   12 ++++++++++++
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 2 files changed, 13 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 1123f3b..48ccf51 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -57,6 +57,18 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 if BR2_PACKAGE_XSERVER_XORG_SERVER
 
 choice
+	bool "X Window System server version"
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
+	bool "1.17.1"
+
+endchoice
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
+	string
+	default "1.17.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
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
