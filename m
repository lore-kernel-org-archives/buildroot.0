From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Sun, 11 Mar 2018 15:00:37 -0700
Subject: [Buildroot] [PATCH 1/3] docker-containerd: bump to version 1.0.1
Message-ID: <20180311220039.11021-1-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

This is a runtime dependency of docker-engine in version 17.12.1-ce

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/docker-containerd/docker-containerd.hash |  2 +-
 package/docker-containerd/docker-containerd.mk   | 25 ++++++++++++++++++------
 2 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 992eb5b01a..147b60e3f8 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	da89086a7c643702a2ddecec67a45d3d8e4b0d610dd19036be63e6bd54cc1a85	docker-containerd-9048e5e50717ea4497b757314bad98ea3763c145.tar.gz
+sha256	89584cadef009e046c195f76a9cd3c4c8a4524f3beae552f78238493f2444dd4  docker-containerd-v1.0.1.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index ffbadb0c3f..da538e84b6 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 9048e5e50717ea4497b757314bad98ea3763c145
-DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
+DOCKER_CONTAINERD_VERSION = v1.0.1
+DOCKET_CONTAINERD_COMMIT = 9b55aab90508bd389d7654c4baf173a981477d55
+DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
 
@@ -18,15 +19,25 @@ DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
 
 DOCKER_CONTAINERD_GLDFLAGS = \
-	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
+	-X github.com/containerd/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
+
+DOCKER_CONTAINERD_BUILD_TAGS =
+
+# XXX - Reusing the "docker-engine" config for now
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
+DOCKER_CONTAINERD_DEPENDENCIES += btrfs-progs
+else
+DOCKER_CONTAINERD_BUILD_TAGS = no_btrfs
+endif
+
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DOCKER_CONTAINERD_GLDFLAGS += -extldflags '-static'
 endif
 
 define DOCKER_CONTAINERD_CONFIGURE_CMDS
-	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
-	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
+	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/containerd
+	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/containerd/containerd
 	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
 	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
 endef
@@ -34,7 +45,9 @@ endef
 define DOCKER_CONTAINERD_BUILD_CMDS
 	$(foreach d,ctr containerd containerd-shim,\
 		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/bin/go build \
-			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
+			-tags "$(DOCKER_CONTAINERD_BUILD_TAGS)" \
+			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" \
+			github.com/containerd/containerd/cmd/$(d)$(sep))
 endef
 
 define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
-- 
2.14.3 (Apple Git-98)
