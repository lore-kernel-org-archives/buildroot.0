From: Christian Stewart <christian@paral.in>
Date: Mon, 22 Mar 2021 22:10:27 -0700
Subject: [Buildroot] [PATCH v1 1/1] package/nerdctl: new package
Message-ID: <20210323051027.91385-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nerdctl is a CLI for containerd (package docker-containerd) which is drop-in
compatible with the Docker Daemon CLI.

This allows using the lighter weight containerd daemon directly, instead of via
the additional docker daemon. It also implements rootless mode.

https://github.com/containerd/nerdctl

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1:

 - pkg-golang does not support main.go at root of project
 - https://bugs.busybox.net/show_bug.cgi?id=13651
 - override the build command instead

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in            |  1 +
 package/nerdctl/Config.in    | 24 ++++++++++++++++++++++++
 package/nerdctl/nerdctl.hash |  3 +++
 package/nerdctl/nerdctl.mk   | 26 ++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)
 create mode 100644 package/nerdctl/Config.in
 create mode 100644 package/nerdctl/nerdctl.hash
 create mode 100644 package/nerdctl/nerdctl.mk

diff --git a/package/Config.in b/package/Config.in
index d278e78b68..696d479267 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2456,6 +2456,7 @@ menu "System tools"
 	source "package/monit/Config.in"
 	source "package/multipath-tools/Config.in"
 	source "package/ncdu/Config.in"
+	source "package/nerdctl/Config.in"
 	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
diff --git a/package/nerdctl/Config.in b/package/nerdctl/Config.in
new file mode 100644
index 0000000000..6c07a62128
--- /dev/null
+++ b/package/nerdctl/Config.in
@@ -0,0 +1,24 @@
+config BR2_PACKAGE_NERDCTL
+	bool "nerdctl"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # containerd
+	depends on BR2_USE_MMU # util-linux
+	select BR2_PACKAGE_DOCKER_CONTAINERD # containerd runtime dependency
+	select BR2_PACKAGE_RUNC # containerd runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX # runtime dependency
+	select BR2_PACKAGE_UTIL_LINUX_BINARIES # containerd
+	select BR2_PACKAGE_UTIL_LINUX_PIVOT_ROOT # containerd
+	select BR2_PACKAGE_UTIL_LINUX_MOUNTPOINT # containerd
+	select BR2_PACKAGE_UTIL_LINUX_MOUNT # containerd
+	help
+	  Docker-compatible CLI for containerd, controlling runc.
+
+	  https://github.com/containerd/nerdctl
+
+comment "nerdctl needs a glibc or musl toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_USES_UCLIBC
diff --git a/package/nerdctl/nerdctl.hash b/package/nerdctl/nerdctl.hash
new file mode 100644
index 0000000000..1d2f540940
--- /dev/null
+++ b/package/nerdctl/nerdctl.hash
@@ -0,0 +1,3 @@
+# Computed locally
+sha256  6c2f2cbc70703fed49a0b77a7c0823ad870b9a7b341bfd2a547ae833f24cd921  nerdctl-0.7.2.tar.gz
+sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/nerdctl/nerdctl.mk b/package/nerdctl/nerdctl.mk
new file mode 100644
index 0000000000..a50b6c49bc
--- /dev/null
+++ b/package/nerdctl/nerdctl.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# nerdctl
+#
+################################################################################
+
+NERDCTL_VERSION = 0.7.2
+NERDCTL_SITE = $(call github,containerd,nerdctl,v$(NERDCTL_VERSION))
+NERDCTL_LICENSE = Apache-2.0
+NERDCTL_LICENSE_FILES = LICENSE
+
+NERDCTL_GOMOD = github.com/containerd/nerdctl
+NERDCTL_LDFLAGS = \
+	-X $(NERDCTL_GOMOD)/pkg/version.Version=$(NERDCTL_VERSION)
+
+# pkg-golang does not support main.go at the root of the project
+define NERDCTL_BUILD_CMDS
+	cd $(@D); \
+	$(HOST_GO_TARGET_ENV) \
+		$(NERDCTL_GO_ENV) \
+		$(GO_BIN) build -v $(NERDCTL_BUILD_OPTS) \
+		-o $(@D)/bin/nerdctl \
+		$(NERDCTL_GOMOD)
+endef
+
+$(eval $(golang-package))
-- 
2.31.0
