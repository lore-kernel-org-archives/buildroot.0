From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 5 Nov 2010 10:27:37 +0100
Subject: [Buildroot] [git commit master 1/1] Create X symlink for TinyX
Message-ID: <20101105092849.022A68DBA1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1bc5b0bdf1157c700bac96ca5980ff9aa943e225
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When installing TinyX to target create /usr/bin/X symlink
to Xfbdev as it is the only TinyX driver we build.
This makes utils like startx happy :)

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    3 ++-
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 ++++
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 8406725..76c4ea4 100644
--- a/CHANGES
+++ b/CHANGES
@@ -61,7 +61,8 @@
 	xdriver-xf86-video-{sis,sisusb,suncg3,suncg6,suncg14,sunffb},
 	xdriver-xf86-video-{sunleo,suntcx,tdfx,tga,trident,v4l,vesa},
 	xdriver-xf86-video-{vmware,voodeo,wsfb,xgi,xgixp},
-	xkeyboard-config, xlib_libX11, xstroke, xterm, xvkbd, zlib
+	xkeyboard-config, xlib_libX11, xserver_xorg-server, xstroke,
+	xterm, xvkbd, zlib
 
 	Deprecated packages: hotplug, lzma, ng-spice-rework
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index fed8c10..b0babdd 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -73,6 +73,10 @@ endif
 ifeq ($(BR2_PACKAGE_XSERVER_tinyx),y)
 XSERVER_XORG_SERVER_CONF_OPT += --enable-kdrive --enable-xfbdev \
 		--disable-glx --disable-dri --disable-xsdl
+define XSERVER_CREATE_X_SYMLINK
+ ln -f -s Xfbdev $(TARGET_DIR)/usr/bin/X
+endef
+XSERVER_XORG_SERVER_POST_INSTALL_TARGET_HOOKS += XSERVER_CREATE_X_SYMLINK
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-kdrive --disable-xfbdev
 endif
-- 
1.7.1
