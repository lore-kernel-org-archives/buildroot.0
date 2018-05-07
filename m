From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon,  7 May 2018 12:57:37 +0200
Subject: [Buildroot] [RFC PATCH 3/7] libmpdclient: convert to pkg-meson infra
In-Reply-To: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180507105741.31747-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
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
-- 
2.14.3
