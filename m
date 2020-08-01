From: Christian Stewart <christian@paral.in>
Date: Sat,  1 Aug 2020 14:36:55 -0700
Subject: [Buildroot] [PATCH v1 3/6] package/nvidia-container-runtime: new
 package
In-Reply-To: <20200801213658.33869-2-christian@paral.in>
References: <20200801213658.33869-2-christian@paral.in>
Message-ID: <20200801213658.33869-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NVIDIA Container Runtime is a fork of runc which adds support for mounting GPUs
into containers.

https://github.com/NVIDIA/nvidia-container-runtime

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                             |  1 +
 package/nvidia-container-runtime/Config.in    | 16 +++++++++
 package/nvidia-container-runtime/config.toml  | 20 +++++++++++
 package/nvidia-container-runtime/daemon.json  | 12 +++++++
 .../nvidia-container-runtime.hash             |  3 ++
 .../nvidia-container-runtime.mk               | 33 +++++++++++++++++++
 6 files changed, 85 insertions(+)
 create mode 100644 package/nvidia-container-runtime/Config.in
 create mode 100644 package/nvidia-container-runtime/config.toml
 create mode 100644 package/nvidia-container-runtime/daemon.json
 create mode 100644 package/nvidia-container-runtime/nvidia-container-runtime.hash
 create mode 100644 package/nvidia-container-runtime/nvidia-container-runtime.mk

diff --git a/package/Config.in b/package/Config.in
index 0d34824128..dfa02217d9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2385,6 +2385,7 @@ menu "System tools"
 	source "package/netifrc/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/nvidia-container-runtime/Config.in"
 	source "package/openrc/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
diff --git a/package/nvidia-container-runtime/Config.in b/package/nvidia-container-runtime/Config.in
new file mode 100644
index 0000000000..c029002149
--- /dev/null
+++ b/package/nvidia-container-runtime/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_NVIDIA_CONTAINER_RUNTIME
+	bool "nvidia-container-runtime"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC # fexecve
+	help
+	  NVIDIA Container Runtime is a fork of runc which adds
+	  support for mounting GPUs into containers.
+
+	  https://github.com/NVIDIA/nvidia-container-runtime
+
+comment "nvidia-container-runtime needs a glibc toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAN_USES_GLIBC
diff --git a/package/nvidia-container-runtime/config.toml b/package/nvidia-container-runtime/config.toml
new file mode 100644
index 0000000000..21ee9a22b5
--- /dev/null
+++ b/package/nvidia-container-runtime/config.toml
@@ -0,0 +1,20 @@
+# see below:
+# https://raw.githubusercontent.com/NVIDIA/nvidia-container-toolkit/master/config/config.toml.debian
+
+disable-require = false
+#swarm-resource = "DOCKER_RESOURCE_GPU"
+
+[nvidia-container-cli]
+#root = "/run/nvidia/driver"
+#path = "/usr/bin/nvidia-container-cli"
+environment = []
+#debug = "/var/log/nvidia-container-toolkit.log"
+#ldcache = "/etc/ld.so.cache"
+load-kmods = true
+#no-cgroups = false
+#user = "root:video"
+ldconfig = "@/sbin/ldconfig"
+#alpha-merge-visible-devices-envvars = false
+
+[nvidia-container-runtime]
+#debug = "/var/log/nvidia-container-runtime.log"
diff --git a/package/nvidia-container-runtime/daemon.json b/package/nvidia-container-runtime/daemon.json
new file mode 100644
index 0000000000..bc01c904ce
--- /dev/null
+++ b/package/nvidia-container-runtime/daemon.json
@@ -0,0 +1,12 @@
+{
+  "experimental": true,
+  "exec-opts": [
+    "native.cgroupdriver=systemd"
+  ],
+  "runtimes": {
+    "nvidia": {
+      "runtimeArgs": [],
+      "path": "/usr/bin/nvidia-container-runtime"
+    }
+  }
+}
diff --git a/package/nvidia-container-runtime/nvidia-container-runtime.hash b/package/nvidia-container-runtime/nvidia-container-runtime.hash
new file mode 100644
index 0000000000..38d4663276
--- /dev/null
+++ b/package/nvidia-container-runtime/nvidia-container-runtime.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  c3a2bb76ae1893499e81388e43b791a90c9bced52c473378bbe4333e07604439  nvidia-container-runtime-3.3.0.tar.gz
+sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/nvidia-container-runtime/nvidia-container-runtime.mk b/package/nvidia-container-runtime/nvidia-container-runtime.mk
new file mode 100644
index 0000000000..8d9694d2ae
--- /dev/null
+++ b/package/nvidia-container-runtime/nvidia-container-runtime.mk
@@ -0,0 +1,33 @@
+################################################################################
+#
+# nvidia-container-runtime
+#
+################################################################################
+
+NVIDIA_CONTAINER_RUNTIME_VERSION = 3.3.0
+NVIDIA_CONTAINER_RUNTIME_SITE = $(call github,NVIDIA,nvidia-container-runtime,v$(NVIDIA_CONTAINER_RUNTIME_VERSION))
+NVIDIA_CONTAINER_RUNTIME_LICENSE = Apache-2.0
+NVIDIA_CONTAINER_RUNTIME_LICENSE_FILES = LICENSE
+
+NVIDIA_CONTAINER_RUNTIME_LDFLAGS = -X main.gitCommit=$(NVIDIA_CONTAINER_RUNTIME_VERSION)
+NVIDIA_CONTAINER_RUNTIME_TAGS = cgo static_build
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+NVIDIA_CONTAINER_RUNTIME_TAGS += seccomp
+NVIDIA_CONTAINER_RUNTIME_DEPENDENCIES += libseccomp host-pkgconf
+endif
+
+NVIDIA_CONTAINER_RUNTIME_GOMOD = github.com/NVIDIA/nvidia-container-runtime
+NVIDIA_CONTAINER_RUNTIME_BUILD_TARGETS = github.com/NVIDIA/nvidia-container-runtime/src
+NVIDIA_CONTAINER_RUNTIME_BIN_NAME = nvidia-container-runtime
+
+define NVIDIA_CONTAINER_RUNTIME_INSTALL_SUPPORT
+	$(INSTALL) -D -m 644 $(NVIDIA_CONTAINER_RUNTIME_PKGDIR)/config.toml \
+		$(TARGET_DIR)/etc/nvidia-container-runtime/config.toml
+	$(INSTALL) -D -m 644 $(NVIDIA_CONTAINER_RUNTIME_PKGDIR)/daemon.json \
+		$(TARGET_DIR)/etc/docker/daemon.json
+endef
+
+NVIDIA_CONTAINER_RUNTIME_POST_INSTALL_TARGET_HOOKS += NVIDIA_CONTAINER_RUNTIME_INSTALL_SUPPORT
+
+$(eval $(golang-package))
-- 
2.27.0
