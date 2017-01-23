From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Jan 2017 15:50:45 +0100
Subject: [Buildroot] [git commit branch/2016.11.x] docker-engine: fix docker
	version output
Message-ID: <20170123145719.2172680AD8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5bd3fdec1153718ac4ac77dcd99ec29053ac858d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2016.11.x

At compile-time the docker build scripts generate a version file used
to build the output of the docker version command. This file is
generated somewhat properly by the Buildroot build system, however the
version number and commit ID are incorrectly formatted. This patch fixes
the output to the correct format.

This is important as some tools like WeaveWorks won't even start unless
they can parse the Docker Version output correctly.

[Peter: strip v from version using patsusbt]
Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit 0533484eb7e2ff8500406035c59d2c3c2c07dda3)
---
 package/docker-engine/docker-engine.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ade6fbb..2cd71dd 100644
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
+		VERSION="$(patsubst v%,%,$(DOCKER_ENGINE_VERSION))" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" $(TARGET_MAKE_ENV) \
 		bash ./hack/make/.go-autogen
 endef
