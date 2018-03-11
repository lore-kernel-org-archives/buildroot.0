From: charles.hardin at storagecraft.com <charles.hardin@storagecraft.com>
Date: Sun, 11 Mar 2018 15:17:40 -0700
Subject: [Buildroot] [PATCH v2 2/3] docker-engine: bump to version 17.12.1-ce
In-Reply-To: <20180311221741.11346-1-charles.hardin@storagecraft.com>
References: <20180311221741.11346-1-charles.hardin@storagecraft.com>
Message-ID: <20180311221741.11346-2-charles.hardin@storagecraft.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Hardin <charles.hardin@storagecraft.com>

Signed-off-by: Charles Hardin <charles.hardin@storagecraft.com>
---
 package/docker-engine/S70docker          | 46 ++++++++++++++++++++++++++++++++
 package/docker-engine/docker-engine.hash |  2 +-
 package/docker-engine/docker-engine.mk   | 24 ++++++++++++-----
 3 files changed, 64 insertions(+), 8 deletions(-)
 create mode 100755 package/docker-engine/S70docker

diff --git a/package/docker-engine/S70docker b/package/docker-engine/S70docker
new file mode 100755
index 0000000000..3bcc381c95
--- /dev/null
+++ b/package/docker-engine/S70docker
@@ -0,0 +1,46 @@
+#!/bin/sh
+#
+# docker        Starts dockerd.
+#
+
+start() {
+	printf "Starting dockerd: "
+	start-stop-daemon -S -b -m \
+		-x /usr/bin/dockerd \
+		-p /var/run/dockerd.pid \
+		-- \
+		--log-driver=syslog --log-opt syslog-facility=user \
+		--log-level debug --raw-logs \
+			>> /var/log/dockerd.log 2>&1
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+        printf "Stopping dockerd: "
+        start-stop-daemon -K -p /var/run/dockerd.pid -R 10
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+        ;;
+esac
+
+exit $?
+
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6c0ed338a5..16c994736d 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4716df117d867b82ddab2e82395cd40aa3d0925a689eedcec8919729e4c9f121	docker-engine-v17.05.0-ce.tar.gz
+sha256	e4b58c26c05a800d96d3e5d76375654751d4d1367b5727c798369cf3c78a590e	docker-engine-v17.12.1-ce.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index 8928f072e7..96b3267fe4 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v17.05.0-ce
-DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f
-DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = v17.12.1-ce
+DOCKER_ENGINE_COMMIT = 7390fc6103da41cf98ae66cfac80fa143268bf60
+DOCKER_ENGINE_SITE = $(call github,docker,docker-ce,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
@@ -19,6 +19,8 @@ DOCKER_ENGINE_MAKE_ENV = $(HOST_GO_TARGET_ENV) \
 	CGO_NO_EMULATION=1 \
 	GOBIN="$(@D)/bin" \
 	GOPATH="$(DOCKER_ENGINE_GOPATH)" \
+	CLI_DIR="$(@D)/components/cli" \
+	ENGINE_DIR="$(@D)/components/engine" \
 	PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
 	$(TARGET_MAKE_ENV)
 
@@ -36,6 +38,7 @@ endif
 
 DOCKER_ENGINE_BUILD_TAGS = cgo exclude_graphdriver_zfs autogen
 DOCKER_ENGINE_BUILD_TARGETS = docker
+DOCKER_ENGINE_CMD_DOCKER = github.com/docker/cli/cmd/docker
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_ENGINE_BUILD_TAGS += seccomp
@@ -50,6 +53,7 @@ endif
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
 DOCKER_ENGINE_BUILD_TAGS += daemon
 DOCKER_ENGINE_BUILD_TARGETS += dockerd
+DOCKER_ENGINE_CMD_DOCKERD = github.com/docker/docker/cmd/dockerd
 endif
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
@@ -76,8 +80,9 @@ endif
 
 define DOCKER_ENGINE_CONFIGURE_CMDS
 	mkdir -p $(DOCKER_ENGINE_GOPATH)/src/github.com/docker
-	ln -fs $(@D) $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
-	cd $(@D) && \
+	ln -fs $(@D)/components/cli $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/cli
+	ln -fs $(@D)/components/engine $(DOCKER_ENGINE_GOPATH)/src/github.com/docker/docker
+	cd $(@D)/components/engine && \
 		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
 		BUILDTIME="$$(date)" \
 		VERSION="$(patsubst v%,%,$(DOCKER_ENGINE_VERSION))" \
@@ -87,6 +92,11 @@ endef
 
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
 
+define DOCKER_ENGINE_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/docker-engine/S70docker \
+		$(TARGET_DIR)/etc/init.d/S70docker
+endef
+
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
@@ -105,13 +115,13 @@ endif
 
 define DOCKER_ENGINE_BUILD_CMDS
 	$(foreach target,$(DOCKER_ENGINE_BUILD_TARGETS), \
-		cd $(@D)/gopath/src/github.com/docker/docker; \
+		cd $(@D)/gopath/src/github.com/docker; \
 		$(DOCKER_ENGINE_MAKE_ENV) \
 		$(HOST_DIR)/bin/go build -v \
 			-o $(@D)/bin/$(target) \
 			-tags "$(DOCKER_ENGINE_BUILD_TAGS)" \
 			-ldflags "$(DOCKER_ENGINE_GLDFLAGS) $(DOCKER_ENGINE_GLDFLAGS_$(call UPPERCASE,$(target)))" \
-			github.com/docker/docker/cmd/$(target)
+			$(DOCKER_ENGINE_CMD_$(call UPPERCASE,$(target)))
 	)
 endef
 
-- 
2.14.3 (Apple Git-98)
