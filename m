From: Christian Stewart <christian@paral.in>
Date: Fri, 16 Feb 2018 03:26:12 -0500
Subject: [Buildroot] [PATCH 05/10] docker-proxy: new package
In-Reply-To: <20180216082617.12039-1-christian@paral.in>
References: <20180216082617.12039-1-christian@paral.in>
Message-ID: <20180216082617.12039-6-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add docker-proxy package to Buildroot. Needed by docker-engine at
runtime, and previously not included. This leads to the following error
when attempting to port-map ports to a container:

  $ docker run -p 8080:8080 nginx
  docker: Error response from daemon: driver failed programming external
  connectivity on endpoint:
  exec: "docker-proxy": executable file not found in $PATH.

Docker expects the docker-proxy binary to exist in the PATH.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                      |  1 +
 package/docker-proxy/Config.in         | 18 +++++++++++++
 package/docker-proxy/docker-proxy.hash |  3 +++
 package/docker-proxy/docker-proxy.mk   | 46 ++++++++++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)
 create mode 100644 package/docker-proxy/Config.in
 create mode 100644 package/docker-proxy/docker-proxy.hash
 create mode 100644 package/docker-proxy/docker-proxy.mk

diff --git a/package/Config.in b/package/Config.in
index dd42db79ec..181edfb5b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1947,6 +1947,7 @@ menu "System tools"
 	source "package/debianutils/Config.in"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
+	source "package/docker-proxy/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/docker-proxy/Config.in b/package/docker-proxy/Config.in
new file mode 100644
index 0000000000..4f414b24b1
--- /dev/null
+++ b/package/docker-proxy/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_DOCKER_PROXY
+	bool "docker-proxy"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Libnetwork is a Container Network Model that provides a
+	  consistent programming interface and the required network
+	  abstractions for applications.
+
+	  This package provides docker-proxy, a run-time dependency of Docker.
+
+	  https://github.com/docker/libnetwork
+
+comment "docker-proxy needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
new file mode 100644
index 0000000000..e4c81fd8f3
--- /dev/null
+++ b/package/docker-proxy/docker-proxy.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	25dd368af845c5d4773a0445d9401d11e1b4042ec285a06aa28976de7264e318	docker-proxy-fcf1c3b5e57833aaaa756ae3c4140ea54da00319.tar.gz
+
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
new file mode 100644
index 0000000000..34a9c86d11
--- /dev/null
+++ b/package/docker-proxy/docker-proxy.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# docker-proxy
+#
+################################################################################
+
+DOCKER_PROXY_VERSION = fcf1c3b5e57833aaaa756ae3c4140ea54da00319
+DOCKER_PROXY_SITE = $(call github,docker,libnetwork,$(DOCKER_PROXY_VERSION))
+
+DOCKER_PROXY_LICENSE = Apache-2.0
+DOCKER_PROXY_LICENSE_FILES = LICENSE
+
+DOCKER_PROXY_DEPENDENCIES = host-go host-pkgconf
+
+DOCKER_PROXY_GOPATH = "$(@D)/gopath"
+DOCKER_PROXY_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
+	CGO_ENABLED=1 \
+	CGO_NO_EMULATION=1 \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(DOCKER_PROXY_GOPATH)" \
+	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
+	$(TARGET_MAKE_ENV)
+
+ifeq ($(BR2_STATIC_LIBS),y)
+DOCKER_PROXY_GLDFLAGS += -extldflags '-static'
+endif
+
+define DOCKER_PROXY_CONFIGURE_CMDS
+	mkdir -p $(DOCKER_PROXY_GOPATH)/src/github.com/docker
+	ln -fs $(@D) $(DOCKER_PROXY_GOPATH)/src/github.com/docker/libnetwork
+endef
+
+define DOCKER_PROXY_BUILD_CMDS
+	cd $(@D)/gopath/src/github.com/docker/libnetwork; \
+	$(DOCKER_PROXY_MAKE_ENV) \
+	$(HOST_DIR)/usr/bin/go build -v \
+		-o $(@D)/bin/docker-proxy \
+		-ldflags "$(DOCKER_PROXY_GLDFLAGS)" \
+		github.com/docker/libnetwork/cmd/proxy
+endef
+
+define DOCKER_PROXY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/docker-proxy $(TARGET_DIR)/usr/bin/docker-proxy
+endef
+
+$(eval $(generic-package))
-- 
2.13.6
