From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  7 May 2018 12:57:40 +0200
Subject: [Buildroot] [RFC PATCH 6/7] mpd-mpc: convert to pkg-meson infra
In-Reply-To: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180507105741.31747-7-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/mpd-mpc/mpd-mpc.mk | 26 ++------------------------
 1 file changed, 2 insertions(+), 24 deletions(-)

diff --git a/package/mpd-mpc/mpd-mpc.mk b/package/mpd-mpc/mpd-mpc.mk
index 942530a561..0666339ff9 100644
--- a/package/mpd-mpc/mpd-mpc.mk
+++ b/package/mpd-mpc/mpd-mpc.mk
@@ -10,28 +10,6 @@ MPD_MPC_SITE = http://www.musicpd.org/download/mpc/$(MPD_MPC_VERSION_MAJOR)
 MPD_MPC_SOURCE = mpc-$(MPD_MPC_VERSION).tar.xz
 MPD_MPC_LICENSE = GPL-2.0+
 MPD_MPC_LICENSE_FILES = COPYING
-MPD_MPC_DEPENDENCIES = host-meson host-pkgconf libmpdclient
+MPD_MPC_DEPENDENCIES = host-pkgconf libmpdclient
 
-MPD_MPC_CONF_OPTS += \
-	--prefix=/usr \
-	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
-	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
-
-MPD_MPC_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
-
-define MPD_MPC_CONFIGURE_CMDS
-	rm -rf $(@D)/build
-	mkdir -p $(@D)/build
-	$(TARGET_MAKE_ENV) meson $(MPD_MPC_CONF_OPTS) $(@D) $(@D)/build
-endef
-
-define MPD_MPC_BUILD_CMDS
-	$(TARGET_MAKE_ENV) ninja $(MPD_MPC_NINJA_OPTS) -C $(@D)/build
-endef
-
-define MPD_MPC_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) ninja $(MPD_MPC_NINJA_OPTS) \
-		-C $(@D)/build install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.14.3
