From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 28 May 2010 22:47:52 +0200
Subject: [Buildroot] [git commit master] xserver_xorg-server: Use $(MAKE1)
	for make install
Message-ID: <20100528210456.B6BB88D577@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b7acacaf6e84ec05ed76dd419e645cfbd6683f7a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Xserver installation fails with parallel make jobs.

Installation to staging is not needed. So just remove it
instead of converting to $(MAKE1).

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xserver_xorg-server/xserver_xorg-server.mk     |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 6c6017b..a49c180 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -9,7 +9,6 @@ XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.bz2
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_AUTORECONF = NO
 XSERVER_XORG_SERVER_LIBTOOL_PATCH = NO
-XSERVER_XORG_SERVER_INSTALL_STAGING = YES
 XSERVER_XORG_SERVER_USE_CONFIG_CACHE = NO # overrides CFLAGS
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 
@@ -137,5 +136,8 @@ ifneq ($(BR2_PACKAGE_XLIB_LIBDMX),y)
 XSERVER_XORG_SERVER_CONF_OPT += --disable-dmx
 endif
 
+define XSERVER_XORG_SERVER_INSTALL_TARGET_CMDS
+	$(MAKE1) $(XSERVER_XORG_SERVER_INSTALL_TARGET_OPT) -C $(@D)
+endef
 
 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
-- 
1.6.3.3
