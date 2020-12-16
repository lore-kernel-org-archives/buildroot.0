From: Christian Stewart <christian@paral.in>
Date: Wed, 16 Dec 2020 00:00:10 -0800
Subject: [Buildroot] [PATCH 3/5] package/docker-containerd: specify correct
 build targets
In-Reply-To: <20201216080013.547261-1-christian@paral.in>
References: <20201216080013.547261-1-christian@paral.in>
Message-ID: <20201216080013.547261-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adds build targets "ctr" cli and runc shims.

Removes the outdated and now unnecessary symlinks to docker-runc
docker-containerd etc as well.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 .../docker-containerd/docker-containerd.mk    | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 6b79bd14ae..89ffeb6651 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -11,13 +11,16 @@ DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
 
 DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd
 
+DOCKER_CONTAINERD_BUILD_TARGETS = \
+	cmd/containerd \
+	cmd/containerd-shim \
+	cmd/containerd-shim-runc-v1 \
+	cmd/containerd-shim-runc-v2 \
+	cmd/ctr
+
 DOCKER_CONTAINERD_LDFLAGS = \
 	-X $(DOCKER_CONTAINERD_GOMOD)/version.Version=$(DOCKER_CONTAINERD_VERSION)
 
-DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
-
-DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
-
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_CONTAINERD_DEPENDENCIES += libseccomp host-pkgconf
 DOCKER_CONTAINERD_TAGS += seccomp
@@ -29,12 +32,6 @@ else
 DOCKER_CONTAINERD_TAGS += no_btrfs
 endif
 
-define DOCKER_CONTAINERD_INSTALL_SYMLINKS
-	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
-	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
-	ln -fs containerd $(TARGET_DIR)/usr/bin/docker-containerd
-endef
-
-DOCKER_CONTAINERD_POST_INSTALL_TARGET_HOOKS += DOCKER_CONTAINERD_INSTALL_SYMLINKS
+DOCKER_CONTAINERD_INSTALL_BINS = $(notdir $(DOCKER_CONTAINERD_BUILD_TARGETS))
 
 $(eval $(golang-package))
-- 
2.28.0
