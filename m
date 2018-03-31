From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 31 Mar 2018 19:57:31 +0200
Subject: [Buildroot] [git commit] package/docker-proxy: convert to golang
 infrastructure
Message-ID: <20180331175811.DD11F810D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53e1b222533fd110ab9472480ded126a4762db5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Arnout: remove automatically added host-go dependency]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/docker-proxy/docker-proxy.mk | 33 +++++----------------------------
 1 file changed, 5 insertions(+), 28 deletions(-)

diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
index 3bf6546d26..a90271fc35 100644
--- a/package/docker-proxy/docker-proxy.mk
+++ b/package/docker-proxy/docker-proxy.mk
@@ -10,37 +10,14 @@ DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
 DOCKER_PROXY_LICENSE = Apache-2.0
 DOCKER_PROXY_LICENSE_FILES = LICENSE
 
-DOCKER_PROXY_DEPENDENCIES = host-go host-pkgconf
+DOCKER_PROXY_DEPENDENCIES = host-pkgconf
 
-DOCKER_PROXY_GOPATH = "$(@D)/gopath"
-DOCKER_PROXY_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
-	CGO_ENABLED=1 \
-	CGO_NO_EMULATION=1 \
-	GOBIN="$(@D)/bin" \
-	GOPATH="$(DOCKER_PROXY_GOPATH)" \
-	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
-	$(TARGET_MAKE_ENV)
+DOCKER_PROXY_WORKSPACE = gopath
 
-ifeq ($(BR2_STATIC_LIBS),y)
-DOCKER_PROXY_GLDFLAGS += -extldflags '-static'
-endif
-
-define DOCKER_PROXY_CONFIGURE_CMDS
-	mkdir -p $(DOCKER_PROXY_GOPATH)/src/github.com/docker
-	ln -fs $(@D) $(DOCKER_PROXY_GOPATH)/src/github.com/docker/libnetwork
-endef
-
-define DOCKER_PROXY_BUILD_CMDS
-	cd $(@D)/gopath/src/github.com/docker/libnetwork; \
-	$(DOCKER_PROXY_MAKE_ENV) \
-	$(HOST_DIR)/usr/bin/go build -v \
-		-o $(@D)/bin/docker-proxy \
-		-ldflags "$(DOCKER_PROXY_GLDFLAGS)" \
-		github.com/docker/libnetwork/cmd/proxy
-endef
+DOCKER_PROXY_BUILD_TARGETS = cmd/proxy
 
 define DOCKER_PROXY_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/bin/docker-proxy $(TARGET_DIR)/usr/bin/docker-proxy
+	$(INSTALL) -D -m 0755 $(@D)/$(DOCKER_PROXY_BINDIR)/proxy $(TARGET_DIR)/usr/bin/docker-proxy
 endef
 
-$(eval $(generic-package))
+$(eval $(golang-package))
