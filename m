From: Christian Stewart <christian@paral.in>
Date: Sun, 15 Jul 2018 15:43:39 -0700
Subject: [Buildroot] [PATCH v4 2/3] docker-containerd: bump to v1.1.1
In-Reply-To: <20180715224340.30282-1-christian@paral.in>
References: <20180715224340.30282-1-christian@paral.in>
Message-ID: <20180715224340.30282-2-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit bumps docker-containerd to v1.1.1.

This is a requisite bump for the upgrade of docker-engine to 2018.06.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-containerd/Config.in              | 12 ++++++++++++
 package/docker-containerd/docker-containerd.hash |  2 +-
 package/docker-containerd/docker-containerd.mk   | 18 +++++++++++++++---
 3 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
index 2f7bf71af1..851345f73e 100644
--- a/package/docker-containerd/Config.in
+++ b/package/docker-containerd/Config.in
@@ -15,6 +15,18 @@ config BR2_PACKAGE_DOCKER_CONTAINERD
 
 	  https://github.com/docker/containerd
 
+if BR2_PACKAGE_DOCKER_CONTAINERD
+
+config BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS
+	bool "btrfs snapshot driver"
+	depends on BR2_USE_MMU # btrfs-progs
+	depends on BR2_TOOLCHAIN_HAS_THREADS # btrfs-progs
+	select BR2_PACKAGE_BTRFS_PROGS
+	help
+	  Build the btrfs snapshot driver for containerd.
+
+endif
+
 comment "docker-containerd needs a toolchain w/ threads"
 	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
index 992eb5b01a..6d5ed45589 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,2 @@
 # Computed locally
-sha256	da89086a7c643702a2ddecec67a45d3d8e4b0d610dd19036be63e6bd54cc1a85	docker-containerd-9048e5e50717ea4497b757314bad98ea3763c145.tar.gz
+sha256	2901e3f6113ea97850ec9ac5640db0273c7f10e887701f7da2cf3ae1a730934e  docker-containerd-v1.1.1.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 09e89f1aba..85dd6e1f71 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 9048e5e50717ea4497b757314bad98ea3763c145
-DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
+DOCKER_CONTAINERD_VERSION = v1.1.1
+DOCKER_CONTAINERD_COMMIT = d64c661f1d51c48782c9cec8fda7604785f93587
+DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
 DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
 
@@ -14,10 +15,21 @@ DOCKER_CONTAINERD_WORKSPACE = vendor
 DOCKER_CONTAINERD_LDFLAGS = \
 	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION)
 
-DOCKER_CONTAINERD_BUILD_TARGETS = ctr containerd containerd-shim
+DOCKER_CONTAINERD_BUILD_TARGETS = cmd/ctr cmd/containerd cmd/containerd-shim
 
 DOCKER_CONTAINERD_INSTALL_BINS = containerd containerd-shim
 
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+DOCKER_CONTAINERD_DEPENDENCIES += libseccomp
+DOCKER_CONTAINERD_TAGS += seccomp
+endif
+
+ifeq ($(BR2_PACKAGE_DOCKER_CONTAINERD_DRIVER_BTRFS),y)
+DOCKER_CONTAINERD_DEPENDENCIES += btrfs-progs
+else
+DOCKER_CONTAINERD_TAGS += no_btrfs
+endif
+
 define DOCKER_CONTAINERD_INSTALL_SYMLINKS
 	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
 	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
-- 
2.16.1
