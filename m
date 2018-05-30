From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 22:20:02 +0200
Subject: [Buildroot] [git commit branch/next] systemd: convert to pkg-meson
 infra
Message-ID: <20180530202335.F3A2683497@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ebcf58ad07da318904399fad3f304c7e91195b66
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/systemd/systemd.mk | 32 +++-----------------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 8f7a9fa93c..82d0e1a027 100644
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
@@ -403,28 +398,7 @@ define SYSTEMD_INSTALL_INIT_SYSTEMD
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
