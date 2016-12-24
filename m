From: Christian Stewart <christian@paral.in>
Date: Fri, 23 Dec 2016 22:02:46 -0800
Subject: [Buildroot] [PATCH 1/1] docker-engine: fix docker version output
Message-ID: <20161224060246.4288-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At compile-time the docker build scripts generate a version file used
to build the output of the docker version command. This file is
generated somewhat properly by the Buildroot build system, however the
version number and commit ID are incorrectly formatted. This patch fixes
the output to the correct format.

This is important as some tools like WeaveWorks won't even start unless
they can parse the Docker Version output correctly.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ade6fbb..d60ae37 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -5,6 +5,7 @@
 ################################################################################
 
 DOCKER_ENGINE_VERSION = v1.12.5
+DOCKER_ENGINE_COMMIT = 7392c3b0ce0f9d3e918a321c66668c5d1ef4f689
 DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
@@ -67,7 +68,9 @@ endif
 define DOCKER_ENGINE_CONFIGURE_CMDS
 	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
 	cd $(@D) && \
-		GITCOMMIT="unknown" BUILDTIME="$$(date)" VERSION="$(DOCKER_ENGINE_VERSION)" \
+		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
+		BUILDTIME="$$(date)" \
+		VERSION="$$(echo $(DOCKER_ENGINE_VERSION) | tail -c +2)" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" $(TARGET_MAKE_ENV) \
 		bash ./hack/make/.go-autogen
 endef
-- 
2.10.2
