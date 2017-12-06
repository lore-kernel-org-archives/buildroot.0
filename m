From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed,  6 Dec 2017 11:56:57 +0100
Subject: [Buildroot] [PATCH 5/5] package/docker-containerd: converting to
 golang infrastructure
In-Reply-To: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
References: <1512557817-431-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1512557817-431-6-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo.compagnucci@gmail.com>

This patch converts the docker-containerd package to the new golang
infrastructure.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/docker-containerd/docker-containerd.mk | 37 +++++++++++---------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index ffbadb0..34e7674 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -9,39 +9,32 @@ DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VER
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
 
-DOCKER_CONTAINERD_DEPENDENCIES = host-go
+DOCKER_CONTAINERD_GOPATH = vendor
 
-DOCKER_CONTAINERD_GOPATH = "$(@D)/vendor"
-DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
-	CGO_ENABLED=1 \
-	GOBIN="$(@D)/bin" \
-	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
-
-DOCKER_CONTAINERD_GLDFLAGS = \
+DOCKER_CONTAINERD_GO_LDFLAGS = \
 	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
 
-ifeq ($(BR2_STATIC_LIBS),y)
-DOCKER_CONTAINERD_GLDFLAGS += -extldflags '-static'
-endif
-
-define DOCKER_CONTAINERD_CONFIGURE_CMDS
-	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
-	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
-	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
-	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
+define DOCKER_CONTAINERD_LINK_DIR
+	ln -sf $(@D) $(@D)/$(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
+	mkdir -p $(@D)/$(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
+	ln -s $(RUNC_SRCDIR) $(@D)/$(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
 endef
 
+DOCKER_CONTAINERD_POST_CONFIGURE_HOOKS += DOCKER_CONTAINERD_LINK_DIR
+
 define DOCKER_CONTAINERD_BUILD_CMDS
 	$(foreach d,ctr containerd containerd-shim,\
-		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/bin/go build \
-			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
+		cd $(@D)/$(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd; \
+		$(DOCKER_CONTAINERD_GO_ENV) \
+		$(DOCKER_CONTAINERD_GO) \
+		$(DOCKER_CONTAINERD_BUILD_OPTS) ./$(d)$(sep))
 endef
 
 define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
 	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
-	$(INSTALL) -D -m 0755 $(@D)/bin/containerd $(TARGET_DIR)/usr/bin/docker-containerd
-	$(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim $(TARGET_DIR)/usr/bin/containerd-shim
+	$(INSTALL) -D -m 0755 $(@D)/$(DOCKER_CONTAINERD_BINDIR)/containerd $(TARGET_DIR)/usr/bin/docker-containerd
+	$(INSTALL) -D -m 0755 $(@D)/$(DOCKER_CONTAINERD_BINDIR)/containerd-shim $(TARGET_DIR)/usr/bin/containerd-shim
 	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
 endef
 
-$(eval $(generic-package))
+$(eval $(golang-package))
-- 
2.7.4
