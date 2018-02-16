From: Christian Stewart <christian@paral.in>
Date: Fri, 16 Feb 2018 03:26:15 -0500
Subject: [Buildroot] [PATCH 08/10] docker-containerd: bump to v1.0.1
In-Reply-To: <20180216082617.12039-1-christian@paral.in>
References: <20180216082617.12039-1-christian@paral.in>
Message-ID: <20180216082617.12039-9-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps docker-containerd to v1.0.1.

This is a requisite bump for the upgrade of docker-engine to v2018.02-ce.

This patch also enables seccomp in containerd if the target system uses it.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/Config.in              | 12 ++++++++
 package/docker-containerd/docker-containerd.hash |  2 +-
 package/docker-containerd/docker-containerd.mk   | 38 ++++++++++++++++++------
 3 files changed, 42 insertions(+), 10 deletions(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 2f7bf71af1..851345f73e 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -15,6 +15,18 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 
 	  https://github.com/docker/containerd
 
+if BR2_PACKAGE_DOCKER_CONTAINERD
+
+config BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS
+	bool "btrfs snapshot driver"
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Build the btrfs snapshot driver for containerd.
+
+endif
+
 comment "docker-containerd needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 992eb5b01a..1be9adfd48 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	da89086a7c643702a2ddecec67a45d3d8e4b0d610dd19036be63e6bd54cc1a85	docker-containerd-9048e5e50717ea4497b757314bad98ea3763c145.tar.gz
+sha256	89584cadef009e046c195f76a9cd3c4c8a4524f3beae552f78238493f2444dd4	docker-containerd-v1.0.1.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index ffbadb0c3f..ae91c836d3 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,37 +4,57 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 9048e5e50717ea4497b757314bad98ea3763c145
-DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
+DOCKER_CONTAINERD_VERSION = v1.0.1
+DOCKER_CONTAINERD_COMMIT = 9b55aab90508bd389d7654c4baf173a981477d55
+DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
 
 DOCKER_CONTAINERD_DEPENDENCIES = host-go
 
-DOCKER_CONTAINERD_GOPATH = "$(@D)/vendor"
+DOCKER_CONTAINERD_GOPATH = "$(@D)/gopath"
 DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	CGO_ENABLED=1 \
 	GOBIN="$(@D)/bin" \
 	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
 
 DOCKER_CONTAINERD_GLDFLAGS = \
-	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
+	-X github.com/containerd/containerd.GitCommit=$(DOCKER_CONTAINERD_COMMIT)
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+DOCKER_CONTAINERD_BUILD_TAGS += seccomp
+DOCKER_CONTAINERD_DEPENDENCIES += libseccomp
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS),y)
+DOCKER_CONTAINERD_DEPENDENCIES += btrfs-progs
+else
+DOCKER_CONTAINERD_BUILD_TAGS += no_btrfs
+endif
 
 ifeq ($(BR2_STATIC_LIBS),y)
-DOCKER_CONTAINERD_GLDFLAGS += -extldflags '-static'
+DOCKER_CONTAINERD_GLDFLAGS += -extldflags '-static -fno-PIC'
+DOCKER_CONTAINERD_BUILD_TAGS += static_build
+DOCKER_CONTAINERD_BUILD_FLAGS += -buildmode pie
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
-			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
+		cd $(DOCKER_CONTAINERD_GOPATH)/src/github.com/containerd/containerd; \
+			$(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/bin/go build \
+			-v -i -o $(@D)/bin/$(d) \
+			-tags "$(DOCKER_CONTAINERD_BUILD_TAGS)" \
+			-ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" \
+			$(DOCKER_CONTAINERD_BUILD_FLAGS) \
+			./cmd/$(d)$(sep)
+	)
 endef
 
 define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
-- 
2.13.6
