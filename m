From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 Mar 2015 23:41:26 +0200
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: add
	--enable-libdrm for udev
Message-ID: <20150331214154.B07C281E26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=de8efe181c78162b126a87fdbaf170182aadbaff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If the libdrm package is enabled, the system is built with an udev
provider and MESA3D_DRI_DRIVER is disabled this adds a --disable-libdrm
to configure options, but udev still requires libdrm and results in a
build failure since libdrm include paths aren't filled in (missing drm.h
include error).
So add --enable-libdrm for the udev scenario to counteract the previous
--disable-libdrm.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index bb5381c..d9f36fc 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -130,7 +130,7 @@ XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
 # udev kms support depends on libdrm
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms --enable-libdrm
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
 endif
