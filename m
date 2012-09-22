From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 13:48:10 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: Xvfb support
Message-ID: <20120922194119.AC665996CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f47d199ff89b8757be0ab41c837848d48e114779
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/xserver_xorg-server/Config.in        |   13 +++++++++++--
 .../xserver_xorg-server/xserver_xorg-server.mk     |    6 +++---
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index ddc03c6..4e284a0 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -56,14 +56,23 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER
 comment "xorg-xserver is BROKEN on AVR32"
 	depends on BR2_avr32
 
+if BR2_PACKAGE_XSERVER_XORG_SERVER
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_NULL_CURSOR
     bool "Null root cursor"
-    depends on BR2_PACKAGE_XSERVER_XORG_SERVER
     help
         Don't display root cursor.
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
     bool "Enable AIGLX Extension"
-    depends on BR2_PACKAGE_XSERVER_XORG_SERVER
     help
         Enable/Use AIGLX extension.
+
+comment "Optional Servers"
+
+config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
+    bool "Xvfb server"
+    help
+        Virtual frame buffer X server.
+
+endif
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 5913f79..9b2d9ae 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -58,11 +58,11 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	host-pkg-config
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
-		--disable-xnest --disable-xephyr --disable-xvfb \
-		--disable-dmx \
+		--disable-xnest --disable-xephyr --disable-dmx \
 		--with-builder-addr=buildroot at uclibc.org \
 		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
-		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var
+		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var \
+		--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg
