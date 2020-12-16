From: Christian Stewart <christian@paral.in>
Date: Wed, 16 Dec 2020 00:00:12 -0800
Subject: [Buildroot] [PATCH 5/5] package/docker-engine: bump version to
 20.10.1
In-Reply-To: <20201216080013.547261-1-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
Message-ID: <20201216080013.547261-5-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Additionally, fix the ldflags specification of the package version.

The "autogen" script does not actually configure anything anymore, and instead
exports a LDFLAGS environment variable which we can't use. Instead, specify the
version information via LDFLAGS directly in the Buildroot makefile, similar to
containerd and other packages.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/docker-engine.hash |  2 +-
 package/docker-engine/docker-engine.mk   | 25 +++++++++---------------
 2 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index e7d5932687..a6313ce351 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	f43331fef1d24e31f43392fc1fed72b48fc17fd432d341d6eb1f68ca11383406  docker-engine-19.03.13.tar.gz
+sha256  f0fda46a82bf8f624eb349370358891d3bc65ef3e320675226f17dba8f62566d  docker-engine-20.10.1.tar.gz
 sha256	7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 8cedf307ba..186aa4223f 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 19.03.13
+DOCKER_ENGINE_VERSION = 20.10.1
 DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
@@ -13,13 +13,16 @@ DOCKER_ENGINE_LICENSE_FILES = LICENSE
 DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
 DOCKER_ENGINE_GOMOD = github.com/docker/docker
 
-DOCKER_ENGINE_LDFLAGS = \
-	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
-	-X main.Version=$(DOCKER_ENGINE_VERSION)
-
-DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs autogen
+DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd
 
+DOCKER_ENGINE_LDFLAGS = \
+	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.BuildTime="" \
+	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.GitCommit="buildroot" \
+	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.IAmStatic="false" \
+	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.InitCommitID="" \
+	-X $(DOCKER_ENGINE_GOMOD)/dockerversion.Version="$(DOCKER_ENGINE_VERSION)"
+
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_ENGINE_TAGS += seccomp
 DOCKER_ENGINE_DEPENDENCIES += libseccomp
@@ -53,16 +56,6 @@ endif
 
 DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
 
-define DOCKER_ENGINE_RUN_AUTOGEN
-	cd $(@D) && \
-		BUILDTIME="$$(date)" \
-		VERSION="$(patsubst v%,%,$(DOCKER_ENGINE_VERSION))" \
-		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" $(TARGET_MAKE_ENV) \
-		bash ./hack/make/.go-autogen
-endef
-
-DOCKER_ENGINE_POST_CONFIGURE_HOOKS += DOCKER_ENGINE_RUN_AUTOGEN
-
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
-- 
2.28.0
