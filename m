From: Christian Stewart <christian@paral.in>
Date: Tue, 18 Apr 2017 03:53:59 -0400
Subject: [Buildroot] [PATCH 1/1] docker-engine: fix handling of vendor tree
Message-ID: <20170418075359.31520-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The latest docker-engine release changes the vendor tree slightly. The Go tool
will recognize a ./vendor directory and use it as a vendor tree
automatically, but only when run inside a valid GOPATH. This patch
adjusts how the GOPATH is built - now docker/docker is linked into a
blank tree, and the Go tool recognizes the ./vendor directory
correctly.

The deleted patch is no longer necessary as of the last release and
causes a build failure on my machine.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 5101702..c4c1157 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -13,7 +13,7 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
 DOCKER_ENGINE_DEPENDENCIES = host-go host-pkgconf
 
-DOCKER_ENGINE_GOPATH = "$(@D)/vendor"
+DOCKER_ENGINE_GOPATH = "$(@D)/gopath"
 DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	CGO_ENABLED=1 \
 	CGO_NO_EMULATION=1 \
@@ -100,7 +100,8 @@ endif
 
 define DOCKER_ENGINE_BUILD_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		cd $(@D); $(DOCKER_ENGINE_MAKE_ENV) \
+		cd $(@D)/gopath/src/github.com/docker/docker; \
+		$(DOCKER_ENGINE_MAKE_ENV) \
 		$(HOST_DIR)/usr/bin/go build -v \
 			-o $(@D)/bin/$(target) \
 			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
-- 
2.10.2
