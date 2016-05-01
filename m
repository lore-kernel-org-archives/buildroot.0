From: Christian Stewart <christian@paral.in>
Date: Sun,  1 May 2016 03:04:14 -0400
Subject: [Buildroot] [PATCH v2 2/3] docker-containerd: new package
In-Reply-To: <1462086255-17151-1-git-send-email-christian@paral.in>
References: <1462086255-17151-1-git-send-email-christian@paral.in>
Message-ID: <1462086255-17151-3-git-send-email-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

docker-containerd is a daemon and API for controlling and managing runC
containers.

https://containerd.tools/

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                                |  1 +
 package/docker-containerd/Config.in              |  8 ++++
 package/docker-containerd/docker-containerd.hash |  2 +
 package/docker-containerd/docker-containerd.mk   | 49 ++++++++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 package/docker-containerd/Config.in
 create mode 100644 package/docker-containerd/docker-containerd.hash
 create mode 100644 package/docker-containerd/docker-containerd.mk

diff --git a/package/Config.in b/package/Config.in
index 6c513ba..c8365f8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1631,6 +1631,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/dcron/Config.in"
 	source "package/debianutils/Config.in"
 endif
+	source "package/docker-containerd/Config.in"
 	source "package/cgroupfs-mount/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/emlog/Config.in"
diff --git a/package/docker-containerd/Config.in b/package/docker-containerd/Config.in
new file mode 100644
index 0000000..6b3760d
--- /dev/null
+++ b/package/docker-containerd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_DOCKER_CONTAINERD
+	bool "docker-containerd"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	select BR2_PACKAGE_RUNC
+	help
+    containerd is a daemon to control runC.
+
+	  https://github.com/docker/containerd
diff --git a/package/docker-containerd/docker-containerd.hash b/package/docker-containerd/docker-containerd.hash
new file mode 100644
index 0000000..be0d856
--- /dev/null
+++ b/package/docker-containerd/docker-containerd.hash
@@ -0,0 +1,2 @@
+# Computed locally
+sha256 f9dfeaba17064f279a7dfe89f0ef6763ee45b0a57c03aa423da2af340fba198d  v0.2.1.tar.gz
diff --git a/package/docker-containerd/docker-containerd.mk b/package/docker-containerd/docker-containerd.mk
new file mode 100644
index 0000000..e3c214d
--- /dev/null
+++ b/package/docker-containerd/docker-containerd.mk
@@ -0,0 +1,49 @@
+################################################################################
+#
+# docker-containerd
+#
+################################################################################
+
+DOCKER_CONTAINERD_VERSION = v0.2.1
+DOCKER_CONTAINERD_VERSION_COMMIT = ca47f7e76a93e9b3768ed084d62318e85bd9f4b2
+DOCKER_CONTAINERD_SITE = https://github.com/docker/containerd/archive
+DOCKER_CONTAINERD_SOURCE = $(DOCKER_CONTAINERD_VERSION).tar.gz
+
+DOCKER_CONTAINERD_LICENSE = Apache-2.0
+DOCKER_CONTAINERD_LICENSE_FILES = LICENSE.code
+
+DOCKER_CONTAINERD_DEPENDENCIES = host-go runc
+
+DOCKER_CONTAINERD_MAKE_ENV = \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(@D)/vendor" \
+	GOARCH=$(GO_GOARCH) \
+	CGO_ENABLED=1
+
+DOCKER_CONTAINERD_GLDFLAGS = \
+	-X github.com/docker/containerd.GitCommit=$(DOCKER_CONTAINERD_VERSION_COMMIT) \
+	-extldflags '-static'
+
+define DOCKER_CONTAINERD_CONFIGURE_CMDS
+	# Put sources at prescribed GOPATH location.
+	export $(DOCKER_CONTAINERD_MAKE_ENV) && \
+		mkdir -p $$GOPATH/src/github.com/docker && \
+		ln -s $(@D) $$GOPATH/src/github.com/docker/containerd && \
+		mkdir -p $$GOPATH/src/github.com/opencontainers && \
+		ln -s $(RUNC_SRCDIR) $$GOPATH/src/github.com/opencontainers/runc
+endef
+
+define DOCKER_CONTAINERD_BUILD_CMDS
+	cd $(@D) && export $(DOCKER_CONTAINERD_MAKE_ENV) && \
+		$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/ctr -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./ctr && \
+		$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd && \
+		$(HOST_DIR)/usr/bin/go build -v -o $(@D)/bin/containerd-shim -ldflags "$(DOCKER_CONTAINERD_GLDFLAGS)" ./containerd-shim
+endef
+
+define DOCKER_CONTAINERD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(TARGET_DIR)/usr/bin/runc $(TARGET_DIR)/usr/bin/docker-runc
+	$(INSTALL) -D -m 0755 $(@D)/bin/containerd $(TARGET_DIR)/usr/bin/docker-containerd
+	$(INSTALL) -D -m 0755 $(@D)/bin/containerd-shim $(TARGET_DIR)/usr/bin/docker-containerd-shim
+endef
+
+$(eval $(generic-package))
-- 
2.7.3
