From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Mon, 16 Dec 2019 11:30:49 +0100
Subject: [Buildroot] [PATCH v5 10/13] package/sysrepo: adapt to systemctl
 preset-all
In-Reply-To: <20191216103052.35220-1-jeremy.rosen@smile.fr>
References: <20191216103052.35220-1-jeremy.rosen@smile.fr>
Message-ID: <20191216103052.35220-11-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sysrepo provides it's own services so just remove the section

Also fix sysrepo not installing the files in the correct directory

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/sysrepo/sysrepo.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
index 216e517526..f693ff70da 100644
--- a/package/sysrepo/sysrepo.mk
+++ b/package/sysrepo/sysrepo.mk
@@ -24,7 +24,7 @@ SYSREPO_CONF_OPTS = \
 	-DCALL_SYSREPOCFG_BIN=$(HOST_DIR)/bin/sysrepocfg \
 	-DBUILD_EXAMPLES=$(if $(BR2_PACKAGE_SYSREPO_EXAMPLES),ON,OFF) \
 	$(if $(BR2_INIT_SYSTEMD),-DWITH_SYSTEMD=ON) \
-	$(if $(BR2_INIT_SYSTEMD),-DSYSTEMD_UNIT_DIR=usr/lib/systemd/system)
+	$(if $(BR2_INIT_SYSTEMD),-DSYSTEMD_UNIT_DIR=/usr/lib/systemd/system)
 
 # On ARM, this is needed to prevent unaligned memory access with an optimized
 # build .. https://github.com/sysrepo/sysrepo/issues/947
@@ -41,14 +41,6 @@ define SYSREPO_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S51sysrepo-plugind
 endef
 
-define SYSREPO_INSTALL_INIT_SYSTEMD
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/sysrepod.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-	ln -fs ../../../../usr/lib/systemd/system/sysrepo-plugind.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
-endef
-
 HOST_SYSREPO_CONF_OPTS = \
 	-DGEN_PYTHON2_TESTS=OFF \
 	-DENABLE_TESTS=OFF \
-- 
2.24.0
