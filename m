From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>
Date: Sun,  3 Nov 2019 17:56:35 +0100
Subject: [Buildroot] [PATCH 10/15] package/docker-engine: adapt to preset-all
In-Reply-To: <20191103165640.21819-1-jeremy.rosen@smile.fr>
References: <20191103165640.21819-1-jeremy.rosen@smile.fr>
Message-ID: <20191103165640.21819-11-jeremy.rosen@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docker-engine has two services:
* docker.service, if enabled: docker will start at boot
* docker.socket, if enabled: docker will start at first connection

buildroot currently enables only the service
this patch keeps it that way.

Signed-off-by: J?r?my Rosen <jeremy.rosen@smile.fr>
---
 package/docker-engine/50-docker-engine.preset | 1 +
 package/docker-engine/docker-engine.mk        | 5 ++---
 2 files changed, 3 insertions(+), 3 deletions(-)
 create mode 100644 package/docker-engine/50-docker-engine.preset

diff --git a/package/docker-engine/50-docker-engine.preset b/package/docker-engine/50-docker-engine.preset
new file mode 100644
index 0000000000..0d8cf35345
--- /dev/null
+++ b/package/docker-engine/50-docker-engine.preset
@@ -0,0 +1 @@
+disable docker.socket
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 6a225ee5f0..8540cda9af 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -68,9 +68,8 @@ define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.socket
-	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
-	ln -fs ../../../../usr/lib/systemd/system/docker.service \
-		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/docker.service
+	$(INSTALL) -D -m 644 package/docker-engine/50-docker-engine.preset \
+		$(TARGET_DIR)/usr/lib/systemd/system-preset/50-docker-engine.preset
 endef
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSV
-- 
2.24.0.rc1
