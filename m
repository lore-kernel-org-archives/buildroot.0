From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Fri, 28 May 2010 17:58:43 +0300
Subject: [Buildroot] [PATCH 2/2] Use only $(MAKE1) when installing Xserver
In-Reply-To: <20100528145834.11609.86446.stgit@localhost.localdomain>
References: <20100528145834.11609.86446.stgit@localhost.localdomain>
Message-ID: <20100528145843.11609.66797.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Xserver installation fails with parallel make jobs.

Installation to staging is not needed. So jus remove it
instead of converting to $(MAKE1).

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
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
