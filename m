From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 11:01:00 +0200
Subject: [Buildroot] [git commit] docker-containerd: new package
Message-ID: <20160705090455.6549681DA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16ec6a6c783e20660d366e06ab2a12275acd72f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

docker-containerd is a daemon and API for controlling and managing runC
containers.

https://containerd.tools/

Signed-off-by: Christian Stewart <christian@paral.in>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas:
 - simplify a bit the comments about the runtime dependencies
 - add missing comment on wchar, and take into account the BR2_USE_MMU
   dependency in the comment
 - factorize the build step with a foreach loop.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                |  1 +
 package/docker-containerd/Config.in              | 21 +++++++++++
 package/docker-containerd/docker-containerd.hash |  2 ++
 package/docker-containerd/docker-containerd.mk   | 44 ++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 711f09e..1575e55 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1637,6 +1637,7 @@ menu "System tools"
 	source "package/cpuload/Config.in"
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
+	source "package/docker-containerd/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
new file mode 100644
index 0000000..85843b8
--- /dev/null
+++ b/package/docker-containerd/Config.in
@@ -0,0 +1,21 @@
+config BR2_PACKAGE_DOCKER_CONTAINERD
+	bool "docker-containerd"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # util-linux
+	depends on BR2_USE_WCHAR # util-linux
+	select BR2_PACKAGE_RUNC # runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT
+	help
+	  containerd is a daemon to control runC.
+
+	  https://github.com/docker/containerd
+
+comment "docker-containerd needs a toolchain w/ threads, wchar"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
new file mode 100644
index 0000000..a4a427d
--- /dev/null
+++ b/package/docker-containerd/docker-containerd.hash
@@ -0,0 +1,2 @@
+# Computed locally
+sha256 bdfa54c94f3de901a7983dc0bc924dd2268e9a5f5fe920d27bfdafad60958522  docker-containerd-1b3a81545ca79456086dc2aa424357be98b962ee.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
new file mode 100644
index 0000000..7628fe1
--- /dev/null
+++ b/package/docker-containerd/docker-containerd.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# docker-containerd
+#
+################################################################################
+
+DOCKER_CONTAINERD_VERSION = 1b3a81545ca79456086dc2aa424357be98b962ee
+DOCKER_CONTAINERD_SITE = $(call github,docker,containerd,$(DOCKER_CONTAINERD_VERSION))
+DOCKER_CONTAINERD_LICENSE = Apache-2.0
+DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
+
+DOCKER_CONTAINERD_DEPENDENCIES = host-go
+
+DOCKER_CONTAINERD_GOPATH = "$(@D)/vendor"
+DOCKER_CONTAINERD_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
+	CGO_ENABLED=1 \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(DOCKER_CONTAINERD_GOPATH)"
+
+DOCKER_CONTAINERD_GLDFLAGS = \
+	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION) \
+	-extldflags '-static'
+
+define DOCKER_CONTAINERD_CONFIGURE_CMDS
+	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker
+	ln -s $(@D) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/docker/containerd
+	mkdir -p $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers
+	ln -s $(RUNC_SRCDIR) $(DOCKER_CONTAINERD_GOPATH)/src/github.com/opencontainers/runc
+endef
+
+define DOCKER_CONTAINERD_BUILD_CMDS
+	$(foreach d,ctr containerd containerd-shim,\
+		cd $(@D); $(DOCKER_CONTAINERD_MAKE_ENV) $(HOST_DIR)/usr/bin/go build \
+			-v -o $(@D)/bin/$(d) -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./$(d)$(sep))
+endef
+
+define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
+	ln -fs runc $(TARGET_DIR)/usr/bin/docker-runc
+	$(INSTALL) -D -m 0755 $(@D)/bin/containerd $(TARGET_DIR)/usr/bin/docker-containerd
+	$(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim $(TARGET_DIR)/usr/bin/containerd-shim
+	ln -fs containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
+endef
+
+$(eval $(generic-package))
