From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 20:20:02 +0200
Subject: [Buildroot] [git commit] package/docker-engine: convert to golang
 infrastructure
Message-ID: <20180331183819.5019D8409E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=390b8cdba7112bc5dc06955136c9ddb1215d3c53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[Thomas:
 - adapt to the changes in the golang-package infrastructure
 - keep the logic to support BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-engine/docker-engine.mk | 65 ++++++++++------------------------
 1 file changed, 18 insertions(+), 47 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 8928f072e7..ba84b4cf0a 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -13,70 +13,57 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
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
+DOCKER_ENGINE_LDFLAGS = \
 	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
 	-X main.Version=$(DOCKER_ENGINE_VERSION)
 
-ifeq ($(BR2_STATIC_LIBS),y)
-DOCKER_ENGINE_GLDFLAGS += -extldflags '-static'
-else
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT),y)
-DOCKER_ENGINE_GLDFLAGS_DOCKER += -extldflags '-static'
-endif
+DOCKER_ENGINE_LDFLAGS += -extldflags '-static'
 endif
 
-DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
-DOCKER_ENGINE_BUILD_TARGETS = docker
+DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs autogen
+DOCKER_ENGINE_BUILD_TARGETS = cmd/docker
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
-DOCKER_ENGINE_BUILD_TAGS += seccomp
+DOCKER_ENGINE_TAGS += seccomp
 DOCKER_ENGINE_DEPENDENCIES += libseccomp
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-DOCKER_ENGINE_BUILD_TAGS += journald
+DOCKER_ENGINE_TAGS += journald
 DOCKER_ENGINE_DEPENDENCIES += systemd
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
-DOCKER_ENGINE_BUILD_TAGS += daemon
-DOCKER_ENGINE_BUILD_TARGETS += dockerd
+DOCKER_ENGINE_TAGS += daemon
+DOCKER_ENGINE_BUILD_TARGETS += cmd/dockerd
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
-DOCKER_ENGINE_BUILD_TAGS += experimental
+DOCKER_ENGINE_TAGS += experimental
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS),y)
 DOCKER_ENGINE_DEPENDENCIES += btrfs-progs
 else
-DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_btrfs
+DOCKER_ENGINE_TAGS += exclude_graphdriver_btrfs
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_DEVICEMAPPER),y)
 DOCKER_ENGINE_DEPENDENCIES += lvm2
 else
-DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_devicemapper
+DOCKER_ENGINE_TAGS += exclude_graphdriver_devicemapper
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DRIVER_VFS),y)
 DOCKER_ENGINE_DEPENDENCIES += gvfs
 else
-DOCKER_ENGINE_BUILD_TAGS += exclude_graphdriver_vfs
+DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
-define DOCKER_ENGINE_CONFIGURE_CMDS
-	mkdir -p $(DOCKER_ENGINE_GOPATH)/src/github.com/docker
-	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
+DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
+
+define DOCKER_ENGINE_RUN_AUTOGEN
 	cd $(@D) && \
 		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
 		BUILDTIME="$$(date)" \
@@ -85,6 +72,8 @@ define DOCKER_ENGINE_CONFIGURE_CMDS
 		bash ./hack/make/.go-autogen
 endef
 
+DOCKER_ENGINE_POST_CONFIGURE_HOOKS += DOCKER_ENGINE_RUN_AUTOGEN
+
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
 
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
@@ -103,22 +92,4 @@ endef
 
 endif
 
-define DOCKER_ENGINE_BUILD_CMDS
-	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		cd $(@D)/gopath/src/github.com/docker/docker; \
-		$(DOCKER_ENGINE_MAKE_ENV) \
-		$(HOST_DIR)/bin/go build -v \
-			-o $(@D)/bin/$(target) \
-			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
-			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
-			github.com/docker/docker/cmd/$(target)
-	)
-endef
-
-define DOCKER_ENGINE_INSTALL_TARGET_CMDS
-	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		$(INSTALL) -D -m 0755 $(@D)/bin/$(target) $(TARGET_DIR)/usr/bin/$(target)
-	)
-endef
-
-$(eval $(generic-package))
+$(eval $(golang-package))
