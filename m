From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 22:20:19 +0200
Subject: [Buildroot] [git commit branch/next] ncmpc: convert to pkg-meson
 infra
Message-ID: <20180530202336.0720983497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cd2d47477f9c29d00805785fe130da08ec012350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ncmpc/ncmpc.mk | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/package/ncmpc/ncmpc.mk b/package/ncmpc/ncmpc.mk
index 1d464b72de..d70ed46ea9 100644
--- a/package/ncmpc/ncmpc.mk
+++ b/package/ncmpc/ncmpc.mk
@@ -8,15 +8,11 @@ NCMPC_VERSION_MAJOR = 0
 NCMPC_VERSION = $(NCMPC_VERSION_MAJOR).29
 NCMPC_SOURCE = ncmpc-$(NCMPC_VERSION).tar.xz
 NCMPC_SITE = http://www.musicpd.org/download/ncmpc/$(NCMPC_VERSION_MAJOR)
-NCMPC_DEPENDENCIES = host-meson host-pkgconf libglib2 libmpdclient ncurses
+NCMPC_DEPENDENCIES = host-pkgconf libglib2 libmpdclient ncurses
 NCMPC_LICENSE = GPL-2.0+
 NCMPC_LICENSE_FILES = COPYING
 
-NCMPC_CONF_OPTS += \
-	--prefix=/usr \
-	-Dcurses=ncurses \
-	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
-	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
+NCMPC_CONF_OPTS = -Dcurses=ncurses
 
 ifeq ($(BR2_PACKAGE_LIRC_TOOLS),y)
 NCMPC_DEPENDENCIES += lirc-tools
@@ -25,21 +21,4 @@ else
 NCMPC_CONF_OPTS += -Dlirc=false
 endif
 
-NCMPC_NINJA_OPTS = $(if $(VERBOSE),-v)
-
-define NCMPC_CONFIGURE_CMDS
-	rm -rf $(@D)/build
-	mkdir -p $(@D)/build
-	$(TARGET_MAKE_ENV) meson $(NCMPC_CONF_OPTS) $(@D) $(@D)/build
-endef
-
-define NCMPC_BUILD_CMDS
-	$(TARGET_MAKE_ENV) ninja $(NCMPC_NINJA_OPTS) -C $(@D)/build
-endef
-
-define NCMPC_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
-		ninja $(NCMPC_NINJA_OPTS) -C $(@D)/build install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
