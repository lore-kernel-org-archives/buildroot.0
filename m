From: Christian Stewart <christian@paral.in>
Date: Sat,  1 Aug 2020 14:36:57 -0700
Subject: [Buildroot] [PATCH v1 5/6] package/nvidia-container-toolkit: new
 package
In-Reply-To: <20200801213658.33869-2-christian@paral.in>
References: <20200801213658.33869-2-christian@paral.in>
Message-ID: <20200801213658.33869-5-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NVIDIA Container Toolkit is a OCI-spec hook for support for mounting GPUs into
containers.

https://github.com/NVIDIA/nvidia-container-toolkit

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                             |  1 +
 package/nvidia-container-toolkit/Config.in    | 18 +++++++++++
 .../nvidia-container-toolkit.hash             |  3 ++
 .../nvidia-container-toolkit.mk               | 30 +++++++++++++++++++
 4 files changed, 52 insertions(+)
 create mode 100644 package/nvidia-container-toolkit/Config.in
 create mode 100644 package/nvidia-container-toolkit/nvidia-container-toolkit.hash
 create mode 100644 package/nvidia-container-toolkit/nvidia-container-toolkit.mk

diff --git a/package/Config.in b/package/Config.in
index dd1c6e1395..dc2a68933a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2387,6 +2387,7 @@ menu "System tools"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
 	source "package/nvidia-container-runtime/Config.in"
+	source "package/nvidia-container-toolkit/Config.in"
 	source "package/openrc/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/pamtester/Config.in"
diff --git a/package/nvidia-container-toolkit/Config.in b/package/nvidia-container-toolkit/Config.in
new file mode 100644
index 0000000000..ff75b152a2
--- /dev/null
+++ b/package/nvidia-container-toolkit/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_NVIDIA_CONTAINER_TOOLKIT
+	bool "nvidia-container-toolkit"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_USES_GLIBC # fexecve
+	select BR2_PACKAGE_LIBNVIDIA_CONTAINER
+	select BR2_PACKAGE_NVIDIA_CONTAINER_RUNTIME
+	help
+	  NVIDIA Container Toolkit is a OCI-spec hook for
+	  support for mounting GPUs into containers.
+
+	  https://github.com/NVIDIA/nvidia-container-toolkit
+
+comment "nvidia-container-toolkit needs a glibc toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS && \
+		BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAN_USES_GLIBC
diff --git a/package/nvidia-container-toolkit/nvidia-container-toolkit.hash b/package/nvidia-container-toolkit/nvidia-container-toolkit.hash
new file mode 100644
index 0000000000..7f0f6fc729
--- /dev/null
+++ b/package/nvidia-container-toolkit/nvidia-container-toolkit.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  27acabdc776853d53442b375df0a78ce7cfa2650117d4ab76792cdaa7915c909  nvidia-container-toolkit-1.2.0.tar.gz
+sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/nvidia-container-toolkit/nvidia-container-toolkit.mk b/package/nvidia-container-toolkit/nvidia-container-toolkit.mk
new file mode 100644
index 0000000000..5f40b18378
--- /dev/null
+++ b/package/nvidia-container-toolkit/nvidia-container-toolkit.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# nvidia-container-toolkit
+#
+################################################################################
+
+NVIDIA_CONTAINER_TOOLKIT_VERSION = 1.2.0
+NVIDIA_CONTAINER_TOOLKIT_SITE = $(call github,NVIDIA,nvidia-container-toolkit,v$(NVIDIA_CONTAINER_TOOLKIT_VERSION))
+
+NVIDIA_CONTAINER_TOOLKIT_LICENSE = Apache-2.0
+NVIDIA_CONTAINER_TOOLKIT_LICENSE_FILES = LICENSE
+
+NVIDIA_CONTAINER_TOOLKIT_DEPENDENCIES = nvidia-container-runtime libnvidia-container
+
+NVIDIA_CONTAINER_TOOLKIT_BUILD_TARGETS = github.com/NVIDIA/container-toolkit/pkg
+NVIDIA_CONTAINER_TOOLKIT_BIN_NAME = nvidia-container-toolkit
+NVIDIA_CONTAINER_TOOLKIT_TAGS = cgo static_build
+
+define NVIDIA_CONTAINER_TOOLKIT_INSTALL_SUPPORT
+	ln -fs /usr/bin/$(NVIDIA_CONTAINER_TOOLKIT_BIN_NAME) \
+		$(TARGET_DIR)/usr/bin/nvidia-container-runtime-hook
+	$(INSTALL) -D -m 644 $(@D)/oci-nvidia-hook.json \
+		$(TARGET_DIR)/usr/share/containers/oci/hooks.d/oci-nvidia-hook.json
+	$(INSTALL) -D -m 755 $(@D)/oci-nvidia-hook \
+		$(TARGET_DIR)/usr/libexec/oci/hooks.d/oci-nvidia-hook
+endef
+
+NVIDIA_CONTAINER_TOOLKIT_POST_INSTALL_TARGET_HOOKS += NVIDIA_CONTAINER_TOOLKIT_INSTALL_SUPPORT
+
+$(eval $(golang-package))
-- 
2.27.0
