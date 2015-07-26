From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2015 00:35:11 +0200
Subject: [Buildroot] [PATCH 2/3] package/xserver: commonalise dependency on
	libdrm
In-Reply-To: <cover.1437950027.git.yann.morin.1998@free.fr>
References: <cover.1437950027.git.yann.morin.1998@free.fr>
Message-ID: <4368a6cd5cf0f903bc2e0dd756b413b9ed8378ad.1437950027.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we have two locations that may want to enable and.or disable
libdrm, and it's not clear how those two location correlate one to the
other, i.e. they may well want o do one the opposite of the other.

Introduce an intermediate variable that records whether libdrm is
needed, and use that to depend on, and enable, libdrm.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>

---
Note: there might be other libs in the same situation, but that can come
in later patches as the need arises... I just change this one lbdrm,
because it will be needed by a followup patch to fix building with
dri2proto enabled.
---
 .../x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 79d663c..374a9c3 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -122,10 +122,11 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive --disable-xfbdev
 endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-libdrm --enable-glx
-XSERVER_XORG_SERVER_DEPENDENCIES += libdrm mesa3d xproto_xf86driproto
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri --enable-glx
+XSERVER_XORG_SERVER_DEPENDENCIES += mesa3d xproto_xf86driproto
+XSERVER_XORG_SERVER_NEEDS_LIBDRM = y
 else
-XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-libdrm --disable-glx
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
 
 ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX),y)
@@ -145,8 +146,8 @@ XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
 # udev kms support depends on libdrm
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms --enable-libdrm
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev-kms
+XSERVER_XORG_SERVER_NEEDS_LIBDRM = y
 else
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-config-udev-kms
 endif
@@ -228,4 +229,11 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
+ifeq ($(XSERVER_XORG_SERVER_NEEDS_LIBDRM),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
+XSERVER_XORG_SERVER_CONF_OPTS += --enable-libdrm
+else
+XSERVER_XORG_SERVER_CONF_OPTS += --disable-libdrm
+endif
+
 $(eval $(autotools-package))
-- 
1.9.1
