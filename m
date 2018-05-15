From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue, 15 May 2018 21:51:56 +0200
Subject: [Buildroot] [RFC PATCH v2 5/8] systemd: convert to pkg-meson infra
In-Reply-To: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
References: <20180515195159.6694-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180515195159.6694-6-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/systemd/systemd.mk | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index db7fb43636..c52e4923a0 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -12,7 +12,6 @@ SYSTEMD_INSTALL_STAGING = YES
 SYSTEMD_DEPENDENCIES = \
 	host-gperf \
 	host-intltool \
-	host-meson \
 	kmod \
 	libcap \
 	util-linux
@@ -26,10 +25,6 @@ SYSTEMD_DEPENDENCIES += busybox
 endif
 
 SYSTEMD_CONF_OPTS += \
-	--prefix=/usr \
-	--libdir='/usr/lib' \
-	--buildtype $(if $(BR2_ENABLE_DEBUG),debug,release) \
-	--cross-file $(HOST_DIR)/etc/meson/cross-compilation.conf \
 	-Drootlibdir='/usr/lib' \
 	-Dblkid=true \
 	-Dman=false \
@@ -399,28 +394,7 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
 	$(SYSTEMD_INSTALL_NETWORK_CONFS)
 endef
 
-SYSTEMD_NINJA_OPTS = $(if $(VERBOSE),-v) -j$(PARALLEL_JOBS)
+SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
+SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
-SYSTEMD_ENV = $(TARGET_MAKE_ENV) $(HOST_UTF8_LOCALE_ENV)
-
-define SYSTEMD_CONFIGURE_CMDS
-	rm -rf $(@D)/build
-	mkdir -p $(@D)/build
-	$(SYSTEMD_ENV) meson $(SYSTEMD_CONF_OPTS) $(@D) $(@D)/build
-endef
-
-define SYSTEMD_BUILD_CMDS
-	$(SYSTEMD_ENV) ninja $(SYSTEMD_NINJA_OPTS) -C $(@D)/build
-endef
-
-define SYSTEMD_INSTALL_TARGET_CMDS
-	$(SYSTEMD_ENV) DESTDIR=$(TARGET_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
-		-C $(@D)/build install
-endef
-
-define SYSTEMD_INSTALL_STAGING_CMDS
-	$(SYSTEMD_ENV) DESTDIR=$(STAGING_DIR) ninja $(SYSTEMD_NINJA_OPTS) \
-		-C $(@D)/build install
-endef
-
-$(eval $(generic-package))
+$(eval $(meson-package))
-- 
2.14.3
