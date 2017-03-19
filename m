From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 21:23:40 +0100
Subject: [Buildroot] [git commit] package/docker-engine: introduce option to
	build CLI client statically
Message-ID: <20170319202413.A01258231C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8d060da5301ee8e9307af0ce55e4fa509eccc8fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is useful when bind-mounting the docker client binary into
containers for a docker-in-docker setup.

The Docker CLI communicates with the daemon over a socket. It is
sometimes useful to bind-mount the Docker CLI and socket into containers at
run-time, so that scripts within the containers can call the Docker API
in the host using a client compatible with the host daemon.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/docker-engine/Config.in        | 6 ++++++
 package/docker-engine/docker-engine.mk | 7 ++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 1879a56..7cf0d9e 100644
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
index 7f7840b..bf6f6a4 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -28,8 +28,13 @@ DOCKER_ENGINE_GLDFLAGS = \
 
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
 
@@ -100,7 +105,7 @@ define DOCKER_ENGINE_BUILD_CMDS
 		$(HOST_DIR)/usr/bin/go build -v \
 			-o $(@D)/bin/$(target) \
 			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
-			-ldflags "$(DOCKER_ENGINE_GLDFLAGS)" \
+			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
 			github.com/docker/docker/cmd/$(target)
 	)
 endef
