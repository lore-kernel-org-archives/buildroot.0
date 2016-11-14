From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 14 Nov 2016 14:22:38 +0100
Subject: [Buildroot] [PATCH 6/6] xserver_xorg-server: fix dependency with
	dbus
In-Reply-To: <20161114132238.6569-1-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
Message-ID: <20161114132238.6569-7-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If dbus and udev are enabled. Xorg link with both:

$ arm-linux-readelf -d usr/bin/X | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libdbus-1.so.3]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libudev.so.1]
[...]

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 51c3efc..69f95fd 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -169,12 +169,12 @@ XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
 endif
-else
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += dbus
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-dbus
 endif
-endif
 
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += freetype
-- 
2.9.3
