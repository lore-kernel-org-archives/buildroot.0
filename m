From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Sep 2018 21:39:08 +0200
Subject: [Buildroot] [git commit] docker-containerd: bump to v1.1.3
Message-ID: <20180916193908.6DF9E88338@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5a33a11be080fe8385787fa652b58e448d6c256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps docker-containerd to v1.1.3.

This is a requisite bump for the upgrade of docker-engine to 2018.06.

The license file was renamed from LICENSE.code to LICENSE, so we take
this opportunity to add the hash for the license file. The only change
between LICENSE.code and LICENSE is:

-   Copyright 2013-2016 Docker, Inc.
+   Copyright The containerd Authors

Signed-off-by: Christian Stewart <christian@paral.in>
[Thomas: fix legal info, add hash for license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/docker-containerd/Config.in              | 12 ++++++++++++
 package/docker-containerd/docker-containerd.hash |  3 ++-
 package/docker-containerd/docker-containerd.mk   | 19 +++++++++++++++----
 3 files changed, 29 insertions(+), 5 deletions(-)

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
index 992eb5b01a..a530873974 100644
--- a/package/docker-containerd/docker-containerd.hash
+++ b/package/docker-containerd/docker-containerd.hash
@@ -1,2 +1,3 @@
 # Computed locally
-sha256	da89086a7c643702a2ddecec67a45d3d8e4b0d610dd19036be63e6bd54cc1a85	docker-containerd-9048e5e50717ea4497b757314bad98ea3763c145.tar.gz
+sha256	a946f4614d92d60361213ef18deab04ee73599e4567f1ff26f7a72841afe4fa2	docker-containerd-v1.1.3.tar.gz
+sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4	LICENSE
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
index 09e89f1aba..121ef0939e 100644
--- a/package/docker-containerd/docker-containerd.mk
+++ b/package/docker-containerd/docker-containerd.mk
@@ -4,20 +4,31 @@
 #
 ################################################################################
 
-DOCKER_CONTAINERD_VERSION = 9048e5e50717ea4497b757314bad98ea3763c145
-DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
+DOCKER_CONTAINERD_VERSION = v1.1.3
+DOCKER_CONTAINERD_SITE = $(call github,containerd,containerd,$(DOCKER_CONTAINERD_VERSION))
 DOCKER_CONTAINERD_LICENSE = Apache-2.0
-DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
+DOCKER_CONTAINERD_LICENSE_FILES = LICENSE
 
 DOCKER_CONTAINERD_WORKSPACE = vendor
 
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
