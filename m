From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 22:19:28 +0200
Subject: [Buildroot] [git commit] libmpdclient: convert to pkg-meson infra
Message-ID: <20180602101014.94B0D8199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2f0dbd1afb9be62abb68a94128928110122e3666
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libmpdclient/libmpdclient.mk | 32 +-------------------------------
 1 file changed, 1 insertion(+), 31 deletions(-)

diff --git a/package/libmpdclient/libmpdclient.mk b/package/libmpdclient/libmpdclient.mk
index 6ff27241c0..c04536eb88 100644
--- a/package/libmpdclient/libmpdclient.mk
+++ b/package/libmpdclient/libmpdclient.mk
@@ -11,35 +11,5 @@ LIBMPDCLIENT_SITE = http://www.musicpd.org/download/libmpdclient/$(LIBMPDCLIENT_
 LIBMPDCLIENT_INSTALL_STAGING = YES
 LIBMPDCLIENT_LICENSE = BSD-3-Clause
 LIBMPDCLIENT_LICENSE_FILES = COPYING
-LIBMPDCLIENT_DEPENDENCIES = host-meson
 
-LIBMPDCLIENT_CONF_OPTS += \
-	--prefix=/usr \
-	--libdir=/usr/lib \
-	--default-library $(if $(BR2_STATIC_LIBS),static,shared) \
-	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
-	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf
-
-LIBMPDCLIENT_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
-
-define LIBMPDCLIENT_CONFIGURE_CMDS
-	rm -rf $(@D)/build
-	mkdir -p $(@D)/build
-	$(TARGET_MAKE_ENV) meson $(LIBMPDCLIENT_CONF_OPTS) $(@D) $(@D)/build
-endef
-
-define LIBMPDCLIENT_BUILD_CMDS
-	$(TARGET_MAKE_ENV) ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build
-endef
-
-define LIBMPDCLIENT_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) \
-		ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build install
-endef
-
-define LIBMPDCLIENT_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) \
-		ninja $(LIBMPDCLIENT_NINJA_OPTS) -C $(@D)/build install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
