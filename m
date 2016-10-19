From: Christian Stewart <christian@paral.in>
Date: Wed, 19 Oct 2016 00:10:46 -0400
Subject: [Buildroot] [PATCH 1/1] package/docker-engine: add option for
	static client
Message-ID: <1476850246-12883-1-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds an option to selectively enable a static client.

This is useful when bind-mounting the docker client binary into
containers for a docker-in-docker setup.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/Config.in        | 6 ++++++
 package/docker-engine/docker-engine.mk | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index b9b9aac..1756977 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -25,6 +25,12 @@ config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
 	bool "build experimental features"
 
+config BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT
+	bool "build static client"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Build a static docker client.
+
 if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 3d39aac..b95b9a2 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -25,8 +25,13 @@ DOCKER_ENGINE_GLDFLAGS = \
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DOCKER_ENGINE_GLDFLAGS += -extldflags '-static'
+else
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT),y)
+DOCKER_ENGINE_GLDFLAGS_DOCKER += -extldflags '-static'
+endif
 endif
 
+
 DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
 DOCKER_ENGINE_BUILD_TARGETS = docker
 
@@ -93,7 +98,7 @@ define DOCKER_ENGINE_BUILD_CMDS
 		$(HOST_DIR)/usr/bin/go build -v \
 			-o $(@D)/bin/$(target) \
 			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
-			-ldflags "$(DOCKER_ENGINE_GLDFLAGS)" \
+			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
 			./cmd/$(target)
 	)
 endef
-- 
2.7.3
