From: Christian Stewart <christian@paral.in>
Date: Fri, 16 Feb 2018 03:26:16 -0500
Subject: [Buildroot] [PATCH 09/10] docker-engine: bump to v2018.02-ce
In-Reply-To: <20180216082617.12039-1-christian@paral.in>
References: <20180216082617.12039-1-christian@paral.in>
Message-ID: <20180216082617.12039-10-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps docker-engine to v2018.02-ce.

The docker-engine repository has now been moved to:

  https://github.com/docker/docker-ce

The CLI and the daemon have been split into separate repositories:

  - https://github.com/docker/cli
  - https://github.com/moby/moby

The daemon is still in the "moby" repo, but the import paths in Go are:

  github.com/docker/docker

As before. Presumably, the maintainers will eventually split the engine out
to a different repository as well.

Please note that they literally copy the entire docker/cli and moby/moby
repositories into the docker-ce repository, as well as all of their
dependencies in the vendor directories. This means that downloading the
docker-ce source tarball contains:

 - The cli sources
 - The daemon sources
 - Two copies of all of the dependencies of both

At the moment this is unavoidable, but does produce a working build.

The patch was removed, as it is included in this upstream release.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/Config.in          |  3 +-
 package/docker-engine/docker-engine.hash |  2 +-
 package/docker-engine/docker-engine.mk   | 54 ++++++++++++++++++--------------
 3 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 05e7aca7ab..386652df30 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -45,7 +45,6 @@ choice
 config BR2_PACKAGE_DOCKER_ENGINE_INIT_TINI
 	bool "tini"
 	select BR2_PACKAGE_TINI
-	select BR2_PACKAGE_TINI_STATIC
 	help
 	  Use Tini as the container init process.
 
@@ -54,7 +53,6 @@ config BR2_PACKAGE_DOCKER_ENGINE_INIT_TINI
 config BR2_PACKAGE_DOCKER_ENGINE_INIT_DUMB_INIT
 	bool "dumb-init"
 	select BR2_PACKAGE_DUMB_INIT
-	select BR2_PACKAGE_DUMB_INIT_STATIC
 	help
 	  Use dumb-init as the container init process.
 
@@ -67,6 +65,7 @@ config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	depends on BR2_USE_MMU # btrfs-progs
 	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
 	select BR2_PACKAGE_BTRFS_PROGS
+	select BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS
 	help
 	  Build the btrfs filesystem driver for Docker.
 
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6c0ed338a5..e877410cd1 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4716df117d867b82ddab2e82395cd40aa3d0925a689eedcec8919729e4c9f121	docker-engine-v17.05.0-ce.tar.gz
+sha256	fb2b9db5ec1a7e9eb80913fb7790377bbbb0fe5aad033f498d09bcd15a51a5c2	docker-engine-v18.02.0-ce.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index a2776ed78c..45b07e074a 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v17.05.0-ce
-DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f
-DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = v18.02.0-ce
+DOCKER_ENGINE_COMMIT = fc4de447b563498eb4da89f56fb858bbe761d91b
+DOCKER_ENGINE_SITE = $(call github,docker,docker-ce,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
@@ -19,23 +19,25 @@ DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	CGO_NO_EMULATION=1 \
 	GOBIN="$(@D)/bin" \
 	GOPATH="$(DOCKER_ENGINE_GOPATH)" \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	PKG_CONFIG="$(PKG_CONFIG)" \
 	$(TARGET_MAKE_ENV)
 
 DOCKER_ENGINE_GLDFLAGS = \
 	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
-	-X main.Version=$(DOCKER_ENGINE_VERSION)
+	-X main.Version=$(DOCKER_ENGINE_VERSION) \
+	-X github.com/docker/cli/cli.GitCommit=$(DOCKER_ENGINE_VERSION) \
+	-X github.com/docker/cli/cli.Version=$(DOCKER_ENGINE_VERSION)
+
+DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
+DOCKER_ENGINE_BUILD_TARGETS = cli:docker
+DOCKER_ENGINE_BUILD_TARGET_PARSE = \
+		export targetpkg=$$(echo $(target) | cut -d: -f1); \
+		export targetbin=$$(echo $(target) | cut -d: -f2)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DOCKER_ENGINE_GLDFLAGS += -extldflags '-static'
-else
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT),y)
-DOCKER_ENGINE_GLDFLAGS_DOCKER += -extldflags '-static'
+DOCKER_ENGINE_BUILD_TAGS += static_build
 endif
-endif
-
-DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
-DOCKER_ENGINE_BUILD_TARGETS = docker
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_ENGINE_BUILD_TAGS += seccomp
@@ -43,13 +45,13 @@ DOCKER_ENGINE_DEPENDENCIES += libseccomp
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-DOCKER_ENGINE_BUILD_TAGS += journald
 DOCKER_ENGINE_DEPENDENCIES += systemd
+DOCKER_ENGINE_BUILD_TAGS += systemd journald
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
 DOCKER_ENGINE_BUILD_TAGS += daemon
-DOCKER_ENGINE_BUILD_TARGETS += dockerd
+DOCKER_ENGINE_BUILD_TARGETS += docker:dockerd
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_INIT_DUMB_INIT),y)
 DOCKER_ENGINE_INIT = dumb-init
@@ -83,10 +85,12 @@ endif
 
 define DOCKER_ENGINE_CONFIGURE_CMDS
 	mkdir -p $(DOCKER_ENGINE_GOPATH)/src/github.com/docker
-	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
-	cd $(@D) && \
+	ln -fs $(@D)/components/engine $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
+	ln -fs $(@D)/components/cli $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/cli
+	cd $(@D)/components/engine && \
 		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
 		BUILDTIME="$$(date)" \
+		IAMSTATIC="true" \
 		VERSION="$(patsubst v%,%,$(DOCKER_ENGINE_VERSION))" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" $(TARGET_MAKE_ENV) \
 		bash ./hack/make/.go-autogen
@@ -95,9 +99,9 @@ endef
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
+	$(INSTALL) -D -m 0644 $(@D)/components/engine/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
-	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.socket \
+	$(INSTALL) -D -m 0644 $(@D)/components/engine/contrib/init/systemd/docker.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.socket
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/
 	ln -fs ../../../../usr/lib/systemd/system/docker.service \
@@ -112,22 +116,24 @@ endif
 
 define DOCKER_ENGINE_BUILD_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		cd $(@D)/gopath/src/github.com/docker/docker; \
+		$(DOCKER_ENGINE_BUILD_TARGET_PARSE); \
+		cd $(@D)/gopath/src/github.com/docker/$${targetpkg}; \
 		$(DOCKER_ENGINE_MAKE_ENV) \
-		$(HOST_DIR)/bin/go build -v \
-			-o $(@D)/bin/$(target) \
+		$(HOST_DIR)/bin/go build -v -i \
+			-o $(@D)/bin/$${targetbin} \
 			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
 			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
-			github.com/docker/docker/cmd/$(target)
+			./cmd/$${targetbin}
 	)
 endef
 
 define DOCKER_ENGINE_INSTALL_TARGET_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		$(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
+		$(DOCKER_ENGINE_BUILD_TARGET_PARSE); \
+		$(INSTALL) -D -m 0755 $(@D)/bin/$${targetbin} $(TARGET_DIR)/usr/bin/$${targetbin}
 	)
 
-	$(if $(filter $(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y), \
+	$(if $(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),\
 		ln -fs $(DOCKER_ENGINE_INIT) $(TARGET_DIR)/usr/bin/docker-init
 	)
 endef
-- 
2.13.6
