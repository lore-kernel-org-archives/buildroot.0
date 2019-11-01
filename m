From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Nov 2019 11:35:03 +0100
Subject: [Buildroot] [git commit] package/iputils: enable systemd services
Message-ID: <20191101103034.5E1B28E4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ada815afcf0262e9ee72f7cd8ec0ce4b8dd12c23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are normally enabled by systemctl preset-all.

[Peter: use positive logic, explicitly pass BUILD_NINFOD=true in the
 positive case]
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iputils/iputils.mk | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
index 4a06581790..c9c59a202d 100644
--- a/package/iputils/iputils.mk
+++ b/package/iputils/iputils.mk
@@ -31,6 +31,8 @@ else
 IPUTILS_CONF_OPTS += -DUSE_IDN=false
 endif
 
+IPUTILS_NINFOD = y
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=nettle
 IPUTILS_DEPENDENCIES += nettle
@@ -46,11 +48,22 @@ IPUTILS_DEPENDENCIES += linux-headers
 else
 IPUTILS_CONF_OPTS += -DUSE_CRYPTO=none
 # BUILD_NINFOD=true and USE_CRYPTO=none cannot be combined
-IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
+IPUTILS_NINFOD = n
 endif
 
 # ninfod requires <pthread.h>
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+IPUTILS_NINFOD = n
+endif
+
+ifeq ($(IPUTILS_NINFOD),y)
+IPUTILS_CONF_OPTS += -DBUILD_NINFOD=true
+define IPUTILS_INSTALL_SERVICE_NINFOD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/ninfod.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ninfod.service
+endef
+else
 IPUTILS_CONF_OPTS += -DBUILD_NINFOD=false
 endif
 
@@ -103,4 +116,15 @@ define IPUTILS_PERMISSIONS
 endef
 endif
 
+define IPUTILS_INSTALL_SERVICE_RDISC
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../lib/systemd/system/rdisc.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rdisc.service
+endef
+
+define IPUTILS_INSTALL_INIT_SYSTEMD
+	$(IPUTILS_INSTALL_SERVICE_NINFOD)
+	$(IPUTILS_INSTALL_SERVICE_RDISC)
+endef
+
 $(eval $(meson-package))
