From: Christian Stewart <christian@paral.in>
Date: Wed, 20 Sep 2017 04:02:10 +0100
Subject: [Buildroot] [PATCH 9/9] docker-engine: bump to v17.07.0-ce
In-Reply-To: <20170920030210.19446-1-christian@paral.in>
References: <20170920030210.19446-1-christian@paral.in>
Message-ID: <20170920030210.19446-10-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps docker-engine to v17.07.0-ce.

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

The patch was removed, as it is included in this release.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash |  3 ++-
 package/docker-engine/docker-engine.mk   | 39 ++++++++++++++++++++------------
 2 files changed, 26 insertions(+), 16 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6c0ed338a5..90708ae972 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	4716df117d867b82ddab2e82395cd40aa3d0925a689eedcec8919729e4c9f121	docker-engine-v17.05.0-ce.tar.gz
+sha256	e3193118306e0d4dc4b9ad329870633d3a78d80c5f00ca6185e14185e717ca7e	docker-engine-v17.07.0-ce.tar.gz
+
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index a2776ed78c..2117272936 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v17.05.0-ce
-DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f
-DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = v17.07.0-ce
+DOCKER_ENGINE_COMMIT = 87847530f7176a48348d196f7c23bbd058052af1
+DOCKER_ENGINE_SITE = $(call github,docker,docker-ce,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
@@ -24,7 +24,9 @@ DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 
 DOCKER_ENGINE_GLDFLAGS = \
 	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
-	-X main.Version=$(DOCKER_ENGINE_VERSION)
+	-X main.Version=$(DOCKER_ENGINE_VERSION) \
+	-X github.com/docker/cli/cli.GitCommit=$(DOCKER_ENGINE_VERSION) \
+	-X github.com/docker/cli/cli.Version=$(DOCKER_ENGINE_VERSION)
 
 ifeq ($(BR2_STATIC_LIBS),y)
 DOCKER_ENGINE_GLDFLAGS += -extldflags '-static'
@@ -35,7 +37,10 @@ endif
 endif
 
 DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
-DOCKER_ENGINE_BUILD_TARGETS = docker
+DOCKER_ENGINE_BUILD_TARGETS = cli:docker
+DOCKER_ENGINE_BUILD_TARGET_PARSE = \
+		export targetpkg=$$(echo $(target) | cut -d: -f1); \
+		export targetbin=$$(echo $(target) | cut -d: -f2)
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_ENGINE_BUILD_TAGS += seccomp
@@ -49,7 +54,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
 DOCKER_ENGINE_BUILD_TAGS += daemon
-DOCKER_ENGINE_BUILD_TARGETS += dockerd
+DOCKER_ENGINE_BUILD_TARGETS += docker:dockerd
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_INIT_DUMB_INIT),y)
 DOCKER_ENGINE_INIT = dumb-init
@@ -83,10 +88,12 @@ endif
 
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
@@ -95,9 +102,9 @@ endef
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
@@ -112,19 +119,21 @@ endif
 
 define DOCKER_ENGINE_BUILD_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		cd $(@D)/gopath/src/github.com/docker/docker; \
+		$(DOCKER_ENGINE_BUILD_TARGET_PARSE); \
+		cd $(@D)/gopath/src/github.com/docker/$${targetpkg}; \
 		$(DOCKER_ENGINE_MAKE_ENV) \
 		$(HOST_DIR)/bin/go build -v \
-			-o $(@D)/bin/$(target) \
+			-o $(@D)/bin/$${targetbin} \
 			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
-			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
-			github.com/docker/docker/cmd/$(target)
+			-ldflags "$(DOCKER_ENGINE_GLDFLAGS)" \
+			./cmd/$${targetbin}
 	)
 endef
 
 define DOCKER_ENGINE_INSTALL_TARGET_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		$(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
+		$(DOCKER_ENGINE_BUILD_TARGET_PARSE); \
+		$(INSTALL) -D -m 0755 $(@D)/bin/$${targetbin} $(TARGET_DIR)/usr/bin/$${targetbin}
 	)
 
 	$(if $(filter $(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y), \
-- 
2.13.5
