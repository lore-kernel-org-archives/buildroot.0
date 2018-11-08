From: Christian Stewart <christian@paral.in>
Date: Wed,  7 Nov 2018 16:45:11 -0800
Subject: [Buildroot] [PATCH v7 1/1] docker-engine: split docker-{cli, engine},
 bump to v18.06.1-ce
Message-ID: <20181108004511.23021-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Docker upstream has split the Docker daemon and CLI into separate codebases:

 - github.com/docker/engine: daemon, "dockerd" binary
 - github.com/docker/cli: "docker" command line interface

This commit splits the docker-engine package into docker-engine and docker-cli.
Conveniently, the Docker project has begun maintaining two separate
release-tagged repositories for the CLI and daemon as of v18.06-ce-rc1. Previous
versions were tagged in a common "docker-ce" repository which makes compilation
awkward for Buildroot, especially due to some limitations in the new Go package
infrastructure.

Docker repositories "engine" and "cli" recently started tagging releases as
recent as the latest stable v18.06.1.

The CLI is no longer automatically included with the engine. Users will need to
select BR2_PACKAGE_DOCKER_CLI to produce a both docker and dockerd target
binaries.

Signed-off-by: Christian Stewart <christian@paral.in>

---

Changes since v4:

 - Use latest stable release v18.06.1

Changes since v5:

 - Clarify commit message
 - Move legacy option to 2018.11 segment and clarify helptext
 - Daemon no longer automatically selects CLI
 - Remove duplicate journald build tag merge artifact in docker-engine
 - Remove unnecessary IAMSTATIC declaration
 - Remove unnecessary containerd -> docker-containerd link

Changes since v6:

 - Remove static docker client option, causes SIGILL on thumb2 arm
---
 package/Config.in                        |  1 +
 package/docker-cli/Config.in             | 15 ++++++++++++++
 package/docker-cli/docker-cli.hash       |  2 ++
 package/docker-cli/docker-cli.mk         | 25 ++++++++++++++++++++++++
 package/docker-engine/Config.in          |  6 ------
 package/docker-engine/docker-engine.hash |  2 +-
 package/docker-engine/docker-engine.mk   | 25 +++++-------------------
 7 files changed, 49 insertions(+), 27 deletions(-)
 create mode 100644 package/docker-cli/Config.in
 create mode 100644 package/docker-cli/docker-cli.hash
 create mode 100644 package/docker-cli/docker-cli.mk

diff --git a/package/Config.in b/package/Config.in
index 712e360402..8ca88e7d28 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2105,6 +2105,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
+	source "package/docker-cli/Config.in"
 	source "package/docker-compose/Config.in"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
new file mode 100644
index 0000000000..b1c4495e54
--- /dev/null
+++ b/package/docker-cli/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_DOCKER_CLI
+	bool "docker-cli"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Docker is a platform to build, ship,
+	  and run applications as lightweight containers.
+
+	  https://github.com/docker/cli
+
+comment "docker-cli needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
new file mode 100644
index 0000000000..50a81792d0
--- /dev/null
+++ b/package/docker-cli/docker-cli.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	47eda354afc199693aa338f5b2bb87e4511354c02561ddc6520a06d169921bdf	docker-cli-v18.06.1-ce.tar.gz
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
new file mode 100644
index 0000000000..3b02f0c111
--- /dev/null
+++ b/package/docker-cli/docker-cli.mk
@@ -0,0 +1,25 @@
+###############################################################################
+#
+# docker-cli
+#
+################################################################################
+
+DOCKER_CLI_VERSION = v18.06.1-ce
+DOCKER_CLI_SITE = $(call github,docker,cli,$(DOCKER_CLI_VERSION))
+DOCKER_CLI_WORKSPACE = gopath
+
+DOCKER_CLI_LICENSE = Apache-2.0
+DOCKER_CLI_LICENSE_FILES = LICENSE
+
+DOCKER_CLI_DEPENDENCIES = host-go host-pkgconf
+
+DOCKER_CLI_LDFLAGS = \
+	-X github.com/docker/cli/cli.GitCommit=$(DOCKER_CLI_VERSION) \
+	-X github.com/docker/cli/cli.Version=$(DOCKER_CLI_VERSION)
+
+DOCKER_CLI_TAGS = cgo autogen
+DOCKER_CLI_BUILD_TARGETS = cmd/docker
+
+DOCKER_CLI_INSTALL_BINS = $(notdir $(DOCKER_CLI_BUILD_TARGETS))
+
+$(eval $(golang-package))
diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 8feb11b48c..11f17820a7 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -26,12 +26,6 @@ config BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 config BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL
 	bool "build experimental features"
 
-config BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT
-	bool "build static client"
-	depends on !BR2_STATIC_LIBS
-	help
-	  Build a static docker client.
-
 if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6c0ed338a5..d5167a41a0 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	4716df117d867b82ddab2e82395cd40aa3d0925a689eedcec8919729e4c9f121	docker-engine-v17.05.0-ce.tar.gz
+sha256	df4a3d2100d9b55c36288e721277dc61e4ceded5738423b09fe0d5ed42369f54	docker-engine-v18.06.1-ce.tar.gz
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ba84b4cf0a..7023d40f58 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,25 +4,21 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v17.05.0-ce
-DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f
-DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = v18.06.1-ce
+DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
 DOCKER_ENGINE_DEPENDENCIES = host-go host-pkgconf
+DOCKER_ENGINE_SRC_SUBDIR = github.com/docker/docker
 
 DOCKER_ENGINE_LDFLAGS = \
 	-X main.GitCommit=$(DOCKER_ENGINE_VERSION) \
 	-X main.Version=$(DOCKER_ENGINE_VERSION)
 
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT),y)
-DOCKER_ENGINE_LDFLAGS += -extldflags '-static'
-endif
-
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs autogen
-DOCKER_ENGINE_BUILD_TARGETS = cmd/docker
+DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd
 
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 DOCKER_ENGINE_TAGS += seccomp
@@ -30,15 +26,9 @@ DOCKER_ENGINE_DEPENDENCIES += libseccomp
 endif
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
-DOCKER_ENGINE_TAGS += journald
 DOCKER_ENGINE_DEPENDENCIES += systemd
+DOCKER_ENGINE_TAGS += systemd journald
 endif
-
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
-DOCKER_ENGINE_TAGS += daemon
-DOCKER_ENGINE_BUILD_TARGETS += cmd/dockerd
-endif
-
 ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_EXPERIMENTAL),y)
 DOCKER_ENGINE_TAGS += experimental
 endif
@@ -65,7 +55,6 @@ DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
 
 define DOCKER_ENGINE_RUN_AUTOGEN
 	cd $(@D) && \
-		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
 		BUILDTIME="$$(date)" \
 		VERSION="$(patsubst v%,%,$(DOCKER_ENGINE_VERSION))" \
 		PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" $(TARGET_MAKE_ENV) \
@@ -74,8 +63,6 @@ endef
 
 DOCKER_ENGINE_POST_CONFIGURE_HOOKS += DOCKER_ENGINE_RUN_AUTOGEN
 
-ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_DAEMON),y)
-
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
@@ -90,6 +77,4 @@ define DOCKER_ENGINE_USERS
 	- - docker -1 * - - - Docker Application Container Framework
 endef
 
-endif
-
 $(eval $(golang-package))
-- 
2.18.1
