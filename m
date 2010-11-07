From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 7 Nov 2010 21:02:38 +0100
Subject: [Buildroot] [git commit master 1/1] xserver-xorg: enable glx
	support if mesa3d is enabled
Message-ID: <20101107200435.75C0D8DC03@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=69a8991bdc7f2f7262c81166430c825b61fc1c7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2533

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 .../xserver_xorg-server/xserver_xorg-server.mk     |    7 ++++++-
 2 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/CHANGES b/CHANGES
index 412fa00..4727c4a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -76,6 +76,7 @@
 	#2389: Generate a Makefile wrapper in $(O)
 	#2461: wireless_tools: install shared library if needed
 	#2521: Can't compile sdl_mixer, mikmod.h can't be found
+	#2533: xserver_xorg-server: Enable glx, if mesa3d is built
 	#2563: [PATCH] cairo: Expose the configure option to disable some...
 	#2581: libmms: Update to 0.6, and patch to work on architectures...
 	#2707: Can't compile linux kernel using buildroot + crosstool-ng
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index b0babdd..31b23f0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -64,7 +64,7 @@ XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
 		--with-fontdir=/usr/share/fonts/X11/
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
-XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg --disable-glx
+XSERVER_XORG_SERVER_CONF_OPT += --enable-xorg
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libpciaccess libdrm
 else
 XSERVER_XORG_SERVER_CONF_OPT += --disable-xorg
@@ -147,5 +147,10 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
 XSERVER_XORG_SERVER_CONF_OPT += --disable-dmx
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D),y)
+XSERVER_XORG_SERVER_CONF_OPT += --enable-glx
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-glx
+endif
 
 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
-- 
1.7.1
