From: Charles Hardin <ckhardin@exablox.com>
Date: Tue, 16 Jan 2018 13:40:46 -0800
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add the macros to
 install docker-proxy
Message-ID: <20180116214046.10605-1-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

During the bringup of some of the network within the containers,
an error was show about missing the docker-proxy - so, add the
definitions to build the proxy

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/docker-engine/docker-engine.mk | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 8928f072e7..94552b1201 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -87,6 +87,20 @@ endef
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
 
+define DOCKER_ENGINE_BUILD_PROXY
+	cd $(@D)/gopath/src/github.com/docker/docker; \
+		$(DOCKER_ENGINE_MAKE_ENV) \
+		$(HOST_DIR)/bin/go build -v \
+			-o $(@D)/bin/docker-proxy \
+			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
+			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
+			github.com/docker/libnetwork/cmd/proxy
+endef
+
+define DOCKER_ENGINE_INSTALL_PROXY
+	$(INSTALL) -D -m 0755 $(@D)/bin/docker-proxy $(TARGET_DIR)/usr/bin/docker-proxy
+endef
+
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
@@ -113,12 +127,14 @@ define DOCKER_ENGINE_BUILD_CMDS
 			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
 			github.com/docker/docker/cmd/$(target)
 	)
+	$(DOCKER_ENGINE_BUILD_PROXY)
 endef
 
 define DOCKER_ENGINE_INSTALL_TARGET_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
 		$(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
 	)
+	$(DOCKER_ENGINE_INSTALL_PROXY)
 endef
 
 $(eval $(generic-package))
-- 
2.14.3 (Apple Git-98)
