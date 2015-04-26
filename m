From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Apr 2015 22:24:10 +0200
Subject: [Buildroot] [git commit] package/xserver_xorg-server: add version
	1.14.7
Message-ID: <20150426202425.0B871818C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=148124ff1a9a8c4450a31cc72c12fa8379c51e4e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some old binary blobs drivers, like the NVidia Tegra2/3 blobs, only
implement an old VIDEODRV ABI.

Since VIDEODRV ABIs are not backward compatible [0], lets introduce an
older Xserver version that supports such an old ABI.

[0] http://www.x.org/wiki/XorgModuleABIVersions/

[Thomas:
  - rename option BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14_7 to
    BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
  - add hash file, change provided by Nicolas Serafini.]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |    9 +++++++++
 .../xserver_xorg-server/xserver_xorg-server.hash   |    3 +++
 2 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 2fccef6..97700df 100644
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
@@ -70,11 +74,16 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
 	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_19
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO
 
+config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
+	bool "1.14.7"
+	select BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14
+
 endchoice
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_VERSION
 	string
 	default "1.17.1" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
+	default "1.14.7" if BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14
 
 choice
 	prompt "X Window System server type"
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 2c3cc5b..135d0f3 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,3 +1,6 @@
+# From http://lists.x.org/archives/xorg-announce/2014-June/002440.html
+sha1   7a95765e56b124758fcd7b609589e65b8870880b                                xorg-server-1.14.7.tar.bz2
+sha256 fcf66fa6ad86227613d2d3e8ae13ded297e2a1e947e9060a083eaf80d323451f        xorg-server-1.14.7.tar.bz2
 # From http://lists.x.org/archives/xorg-announce/2015-February/002530.html
 sha1	490118810a54e91c8814245c99d6285caf4985dd				xorg-server-1.17.1.tar.bz2
 sha256	2bf8e9f6f0a710dec1d2472467bff1f4e247cb6dcd76eb469aafdc8a2d7db2ab	xorg-server-1.17.1.tar.bz2
