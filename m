From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Tue, 10 Apr 2012 15:24:07 -0300
Subject: [Buildroot] [PATCH] xserver_xorg-server: Xvfb support
Message-ID: <1334082247-17878-1-git-send-email-ismael.luceno@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
---
 package/x11r7/xserver_xorg-server/Config.in        |   13 +++++++++++--
 .../xserver_xorg-server/xserver_xorg-server.mk     |    5 +++--
 2 files changed, 14 insertions(+), 4 deletions(-)

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
index df7ba9a..cfacb65 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -57,10 +57,11 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	host-pkg-config
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
-		--disable-xnest --disable-xephyr --disable-xvfb \
+		--disable-xnest --disable-xephyr \
 		--with-builder-addr=buildroot at uclibc.org \
 		CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/pixman-1" \
-		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var
+		--with-fontdir=/usr/share/fonts/X11/ --localstatedir=/var \
+		--$(if $(BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB),en,dis)able-xvfb
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg
-- 
1.7.9.4
