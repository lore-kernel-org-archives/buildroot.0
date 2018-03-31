From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 15:27:34 +0200
Subject: [Buildroot] [PATCH v4 6/8] package/docker-containerd: convert to
 golang infrastructure
In-Reply-To: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
References: <20180331132736.21105-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180331132736.21105-7-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Angelo Compagnucci <angelo@amarulasolutions.com>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 33 +++++++-------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 8f0822b77f..88e27b5ed4 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -9,37 +9,20 @@ DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VER
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
 
-DOCKER_CONTAINERD_DEPENDENCIES = host-go
+DOCKER_CONTAINERD_WORKSPACE = vendor
 
-DOCKER_CONTAINERD_GOPATH = "$(@D)/vendor"
-DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
-	CGO_ENABLED=1 \
-	GOBIN="$(@D)/bin" \
-	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
-
-DOCKER_CONTAINERD_GLDFLAGS = \
+DOCKER_CONTAINERD_LDFLAGS = \
 	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
 
-ifeq ($(BR2_STATIC_LIBS),y)
-DOCKER_CONTAINERD_GLDFLAGS += -extldflags '-static'
-endif
+DOCKER_CONTAINERD_BUILD_TARGETS = ctr containerd containerd-shim
 
-define DOCKER_CONTAINERD_CONFIGURE_CMDS
-	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
-	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
-endef
+DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 
-define DOCKER_CONTAINERD_BUILD_CMDS
-	$(foreach d,ctr containerd containerd-shim,\
-		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/bin/go build \
-			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
-endef
-
-define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
+define DOCKER_CONTAINERD_INSTALL_SYMLINKS
 	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
-	$(INSTALL) -D -m 0755 $(@D)/bin/containerd $(TARGET_DIR)/usr/bin/docker-containerd
-	$(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim $(TARGET_DIR)/usr/bin/containerd-shim
 	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
 endef
 
-$(eval $(generic-package))
+DOCKER_CONTAINERD_POST_INSTALL_TARGET_HOOKS += DOCKER_CONTAINERD_INSTALL_SYMLINKS
+
+$(eval $(golang-package))
-- 
2.14.3
