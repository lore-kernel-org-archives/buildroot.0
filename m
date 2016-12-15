From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Dec 2016 17:08:52 +0100
Subject: [Buildroot] [git commit] docker-engine: needs pkg-config
Message-ID: <20161215163013.3C0D6818C0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4a7d95e1925b1fc68dc1776444944ca906a7fc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/fcc/fcc32f6cdc46f354a016a9b137d4f51d4054cdb6/
http://autobuild.buildroot.org/results/083/0832b7be86c525522e2caed66246d5aeb365afb2/
http://autobuild.buildroot.org/results/ede/ede0ddf0c5685ece8443a9b1bbd5c63b4d98af33/

pkg-config is used for some of the docker-engine dependencies (at least
libseccomp and libsystemd), so make sure it is available.

The make.sh script used to configure docker-engine uses the PKG_CONFIG
variable, but the libseccomp-golang go module simply uses whatever
pkg-config binary it finds in the path at build time, so also pass
TARGET_MAKE_ENV to ensure our cross-pkg-config is used.

For consistency and robustness against future changes, use both approaches
for the configure and build steps.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-engine/docker-engine.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index f895dcc..7b5a8a4 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -10,14 +10,16 @@ DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
-DOCKER_ENGINE_DEPENDENCIES = host-go
+DOCKER_ENGINE_DEPENDENCIES = host-go host-pkgconf
 
 DOCKER_ENGINE_GOPATH = "$(@D)/vendor"
 DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	CGO_ENABLED=1 \
 	CGO_NO_EMULATION=1 \
 	GOBIN="$(@D)/bin" \
-	GOPATH="$(DOCKER_ENGINE_GOPATH)"
+	GOPATH="$(DOCKER_ENGINE_GOPATH)" \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	$(TARGET_MAKE_ENV)
 
 DOCKER_ENGINE_GLDFLAGS = \
 	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
@@ -66,6 +68,7 @@ define DOCKER_ENGINE_CONFIGURE_CMDS
 	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
 	cd $(@D) && \
 		GITCOMMIT="unknown" BUILDTIME="$$(date)" VERSION="$(DOCKER_ENGINE_VERSION)" \
+		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" $(TARGET_MAKE_ENV) \
 		bash ./hack/make/.go-autogen
 endef
 
