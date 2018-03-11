From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Mar 2018 22:34:10 +0100
Subject: [Buildroot] [git commit] docker-proxy: new package
Message-ID: <20180311213511.9FE6A83251@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81750410033ab5ebeec8257d80297f05e9534f36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add docker-proxy package to Buildroot. Needed by docker-engine at
runtime, and previously not included. This leads to the following error
when attempting to port-map ports to a container:

  $ docker run -p 8080:8080 nginx
  docker: Error response from daemon: driver failed programming external
  connectivity on endpoint:
  exec: "docker-proxy": executable file not found in $PATH.

Docker expects the docker-proxy binary to exist in the PATH.

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/docker-proxy/Config.in         | 19 ++++++++++++++
 package/docker-proxy/docker-proxy.hash |  2 ++
 package/docker-proxy/docker-proxy.mk   | 46 ++++++++++++++++++++++++++++++++++
 5 files changed, 69 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c5a1a6a1f7..3df820e712 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -427,6 +427,7 @@ F:	package/aufs-util/
 F:	package/batman-adv/
 F:	package/docker-containerd/
 F:	package/docker-engine/
+F:	package/docker-proxy/
 F:	package/mosh/
 F:	package/rtl8821au/
 F:	package/runc/
diff --git a/package/Config.in b/package/Config.in
index 37465c7f5b..449ffcc47b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1962,6 +1962,7 @@ menu "System tools"
 	source "package/docker-compose/Config.in"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
+	source "package/docker-proxy/Config.in"
 	source "package/dsp-tools/Config.in"
 	source "package/efibootmgr/Config.in"
 	source "package/efivar/Config.in"
diff --git a/package/docker-proxy/Config.in b/package/docker-proxy/Config.in
new file mode 100644
index 0000000000..596e18a3f3
--- /dev/null
+++ b/package/docker-proxy/Config.in
@@ -0,0 +1,19 @@
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
+	  This package provides docker-proxy, a run-time dependency of
+	  Docker.
+
+	  https://github.com/docker/libnetwork
+
+comment "docker-proxy needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-proxy/docker-proxy.hash b/package/docker-proxy/docker-proxy.hash
new file mode 100644
index 0000000000..3ec184f54f
--- /dev/null
+++ b/package/docker-proxy/docker-proxy.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	2eee331b6ded567a36e7db708405b34032b93938682cf049025f48b96d755bf6	docker-proxy-7b2b1feb1de4817d522cc372af149ff48d25028e.tar.gz
diff --git a/package/docker-proxy/docker-proxy.mk b/package/docker-proxy/docker-proxy.mk
new file mode 100644
index 0000000000..3bf6546d26
--- /dev/null
+++ b/package/docker-proxy/docker-proxy.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# docker-proxy
+#
+################################################################################
+
+DOCKER_PROXY_VERSION = 7b2b1feb1de4817d522cc372af149ff48d25028e
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
