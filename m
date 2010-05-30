From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 May 2010 20:13:45 +0200
Subject: [Buildroot] [git commit master] Revert "xserver_xorg-server: Use
	$(MAKE1) for make install"
Message-ID: <20100530181414.1092E12EE61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7f1bca8479f9fbec3705fb91df4452fb591d4362
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit b7acacaf6e84ec05ed76dd419e645cfbd6683f7a.

Closes #1855

We DO need to install into staging for all the xdriver-* packages,
so revert this commit.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    1 +
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 26dab3c..07ab75b 100644
--- a/CHANGES
+++ b/CHANGES
@@ -9,6 +9,7 @@
 
 	#1789: binutils fails to build for i386
 	#1843: Fix libcap build failure
+	#1855: XORG Keyboard driver fails to compile
 
 2010.05-rc3, Released May 27th, 2010:
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index a49c180..6c6017b 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,6 +9,7 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_AUTORECONF = NO
 XSERVER_XORG_SERVER_LIBTOOL_PATCH = NO
+XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_USE_CONFIG_CACHE = NO # overrides CFLAGS
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 
@@ -136,8 +137,5 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
 XSERVER_XORG_SERVER_CONF_OPT += --disable-dmx
 endif
 
-define XSERVER_XORG_SERVER_INSTALL_TARGET_CMDS
-	$(MAKE1) $(XSERVER_XORG_SERVER_INSTALL_TARGET_OPT) -C $(@D)
-endef
 
 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
-- 
1.6.3.3
