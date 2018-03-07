From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  7 Mar 2018 23:19:38 +0100
Subject: [Buildroot] [PATCH v3 6/7] package/docker-engine: converting to
 golang infrastructure
In-Reply-To: <1520461179-31679-1-git-send-email-angelo@amarulasolutions.com>
References: <1520461179-31679-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1520461179-31679-7-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch converts the docker-engine package to the new golang
infrastructure.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/docker-engine/docker-engine.mk | 53 +++++++++++-----------------------
 1 file changed, 17 insertions(+), 36 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 8928f07..33b825e 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -13,70 +13,53 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
 DOCKER_ENGINE_DEPENDENCIES = host-go host-pkgconf
 
-DOCKER_ENGINE_GOPATH = "$(@D)/gopath"
-DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
-	CGO_ENABLED=1 \
-	CGO_NO_EMULATION=1 \
-	GOBIN="$(@D)/bin" \
-	GOPATH="$(DOCKER_ENGINE_GOPATH)" \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	$(TARGET_MAKE_ENV)
-
-DOCKER_ENGINE_GLDFLAGS = \
+DOCKER_ENGINE_GO_LDFLAGS = \
 	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
 	-X main.Version=$(DOCKER_ENGINE_VERSION)
 
-ifeq ($(BR2_STATIC_LIBS),y)
-DOCKER_ENGINE_GLDFLAGS += -extldflags '-static'
-else
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT),y)
-DOCKER_ENGINE_GLDFLAGS_DOCKER += -extldflags '-static'
-endif
-endif
-
-DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
+DOCKER_ENGINE_GO_TAGS = cgo exclude_graphdriver_zfs autogen
 DOCKER_ENGINE_BUILD_TARGETS = docker
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_ENGINE_BUILD_TAGS += seccomp
+DOCKER_ENGINE_GO_TAGS += seccomp
 DOCKER_ENGINE_DEPENDENCIES += libseccomp
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-DOCKER_ENGINE_BUILD_TAGS += journald
+DOCKER_ENGINE_GO_TAGS += journald
 DOCKER_ENGINE_DEPENDENCIES += systemd
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
-DOCKER_ENGINE_BUILD_TAGS += daemon
+DOCKER_ENGINE_GO_TAGS += daemon
 DOCKER_ENGINE_BUILD_TARGETS += dockerd
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
-DOCKER_ENGINE_BUILD_TAGS += experimental
+DOCKER_ENGINE_GO_TAGS += experimental
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
 DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
 else
-DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_btrfs
+DOCKER_ENGINE_GO_TAGS += exclude_graphdriver_btrfs
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER),y)
 DOCKER_ENGINE_DEPENDENCIES += lvm2
 else
-DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_devicemapper
+DOCKER_ENGINE_GO_TAGS += exclude_graphdriver_devicemapper
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS),y)
 DOCKER_ENGINE_DEPENDENCIES += gvfs
 else
-DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_vfs
+DOCKER_ENGINE_GO_TAGS += exclude_graphdriver_vfs
 endif
 
 define DOCKER_ENGINE_CONFIGURE_CMDS
-	mkdir -p $(DOCKER_ENGINE_GOPATH)/src/github.com/docker
-	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
+	mkdir -p $(@D)/$(DOCKER_ENGINE_GOPATH)/src/github.com/docker
+	ln -s $(@D) $(@D)/$(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
 	cd $(@D) && \
 		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
 		BUILDTIME="$$(date)" \
@@ -105,20 +88,18 @@ endif
 
 define DOCKER_ENGINE_BUILD_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		cd $(@D)/gopath/src/github.com/docker/docker; \
-		$(DOCKER_ENGINE_MAKE_ENV) \
-		$(HOST_DIR)/bin/go build -v \
-			-o $(@D)/bin/$(target) \
-			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
-			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
+		cd $(DOCKER_ENGINE_SRC_PATH); \
+		$(DOCKER_ENGINE_GO_ENV) \
+		$(GO_BIN) install -v \
+			$(DOCKER_ENGINE_BUILD_OPTS) \
 			github.com/docker/docker/cmd/$(target)
 	)
 endef
 
 define DOCKER_ENGINE_INSTALL_TARGET_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		$(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
+		$(INSTALL) -D -m 0755 $(@D)/$(DOCKER_ENGINE_BINDIR)/$(target) $(TARGET_DIR)/usr/bin/$(target)
 	)
 endef
 
-$(eval $(generic-package))
+$(eval $(golang-package))
-- 
2.7.4
