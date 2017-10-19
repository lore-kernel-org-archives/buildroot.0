From: Christian Stewart <christian@paral.in>
Date: Wed, 18 Oct 2017 20:22:54 -0400
Subject: [Buildroot] [PATCH 09/12] docker-containerd: bump to 3addd84
In-Reply-To: <20171019002257.27646-1-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
Message-ID: <20171019002257.27646-9-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps docker-containerd to:

  3addd840653146c90a254301d6c3a663c7fd6429

This is a dependency of docker-engine v2017.07.0-ce.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/docker-containerd.hash |  2 +-
 package/docker-containerd/docker-containerd.mk   | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 992eb5b01a..cdc3a0b4fb 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	da89086a7c643702a2ddecec67a45d3d8e4b0d610dd19036be63e6bd54cc1a85	docker-containerd-9048e5e50717ea4497b757314bad98ea3763c145.tar.gz
+sha256	3549e9c4ff1f71c6c9c5932b36b209f9b7ecae3662d251a88ce349853f0249fc	docker-containerd-3addd840653146c90a254301d6c3a663c7fd6429.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index ffbadb0c3f..fe30f19817 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 9048e5e50717ea4497b757314bad98ea3763c145
-DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
+DOCKER_CONTAINERD_VERSION = 3addd840653146c90a254301d6c3a663c7fd6429
+DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
 
@@ -18,22 +18,23 @@ DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
 
 DOCKER_CONTAINERD_GLDFLAGS = \
-	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
+	-X github.com/containerd/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
 
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
 
 define DOCKER_CONTAINERD_BUILD_CMDS
 	$(foreach d,ctr containerd containerd-shim,\
-		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/bin/go build \
+		cd $(DOCKER_CONTAINERD_GOPATH)/src/github.com/containerd/containerd; \
+			$(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/go build \
 			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
 endef
 
-- 
2.13.6
