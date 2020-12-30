From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 09:31:18 +0100
Subject: [Buildroot] [git commit] package/docker-containerd: specify correct
 build targets
Message-ID: <20201230081414.459FE8230D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9242d4df12f05a428571afd3bc423f9a4d0437c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds build targets for runc shims.

Removes the outdated and now unnecessary symlinks to docker-runc
docker-containerd etc as well.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/docker-containerd.mk | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 2eed6e346b..418d588070 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -14,9 +14,14 @@ DOCKER_CONTAINERD_GOMOD = github.com/containerd/containerd
 DOCKER_CONTAINERD_LDFLAGS = \
 	-X $(DOCKER_CONTAINERD_GOMOD)/version.Version=$(DOCKER_CONTAINERD_VERSION)
 
-DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
+DOCKER_CONTAINERD_BUILD_TARGETS = \
+	cmd/containerd \
+	cmd/containerd-shim \
+	cmd/containerd-shim-runc-v1 \
+	cmd/containerd-shim-runc-v2 \
+	cmd/ctr
 
-DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
+DOCKER_CONTAINERD_INSTALL_BINS = $(notdir $(DOCKER_CONTAINERD_BUILD_TARGETS))
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_CONTAINERD_DEPENDENCIES += libapparmor
@@ -34,12 +39,4 @@ else
 DOCKER_CONTAINERD_TAGS += no_btrfs
 endif
 
-define DOCKER_CONTAINERD_INSTALL_SYMLINKS
-	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
-	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
-	ln -fs containerd $(TARGET_DIR)/usr/bin/docker-containerd
-endef
-
-DOCKER_CONTAINERD_POST_INSTALL_TARGET_HOOKS += DOCKER_CONTAINERD_INSTALL_SYMLINKS
-
 $(eval $(golang-package))
