From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 16 Dec 2018 15:11:29 +0100
Subject: [Buildroot] [git commit branch/2018.11.x] package/docker-engine:
 split docker-{cli, engine}, bump to v18.09.0
Message-ID: <20181216142219.40EBE84F19@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc38370ccde734ef9b47a86b0c2f282b19cb703f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.11.x

Docker upstream has split the Docker daemon and CLI into separate
codebases:

 - github.com/docker/engine: daemon, "dockerd" binary
 - github.com/docker/cli: "docker" command line interface

This commit splits the docker-engine package into docker-engine and
docker-cli.  Conveniently, the Docker project has begun maintaining
two separate release-tagged repositories for the CLI and daemon as of
v18.06-ce-rc1. Previous versions were tagged in a common "docker-ce"
repository which makes compilation awkward for Buildroot, especially
due to some limitations in the new Go package infrastructure.

Docker repositories "engine" and "cli" recently started tagging
releases. Select the latest stable release, v18.09.0.

The CLI is no longer automatically included with the engine. Users
will need to select BR2_PACKAGE_DOCKER_CLI to produce a both docker
and dockerd target binaries.

Docker CLI can be statically compiled. This enables usage of the
system docker client binary to access the parent daemon API from
within containers, where shared libraries are not available.

While at it, drop the useless host-go dependency from docker-engine,
since it's already added by the golang-package infrastructure.

Signed-off-by: Christian Stewart <christian@paral.in>
[Thomas: drop the host-go dependency from both docker-cli and
docker-engine]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

(cherry picked from commit de336584d255bc27a52957323b2b320bb984151f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                         |  9 +++++++++
 package/Config.in                        |  1 +
 package/docker-cli/Config.in             | 25 +++++++++++++++++++++++++
 package/docker-cli/docker-cli.hash       |  3 +++
 package/docker-cli/docker-cli.mk         | 31 +++++++++++++++++++++++++++++++
 package/docker-engine/Config.in          |  6 ------
 package/docker-engine/docker-engine.hash |  3 ++-
 package/docker-engine/docker-engine.mk   | 27 ++++++---------------------
 8 files changed, 77 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a5e0c9fe4f..02321c88ae 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -241,6 +241,15 @@ config BR2_PACKAGE_LIBNFTNL_XML
 ###############################################################################
 comment "Legacy options removed in 2018.08"
 
+config BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT
+	bool "docker-engine static client option renamed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_DOCKER_CLI_STATIC
+	help
+	  BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT has been renamed to
+	  BR2_PACKAGE_DOCKER_CLI_STATIC, following the package split of
+	  docker-engine and docker-cli.
+
 config BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_19
 	bool "Modular X.org server was updated to version 1.20.0"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index b60e7700ad..28d3ef82a7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2106,6 +2106,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
+	source "package/docker-cli/Config.in"
 	source "package/docker-compose/Config.in"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
diff --git a/package/docker-cli/Config.in b/package/docker-cli/Config.in
new file mode 100644
index 0000000000..82c35c453d
--- /dev/null
+++ b/package/docker-cli/Config.in
@@ -0,0 +1,25 @@
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
+if BR2_PACKAGE_DOCKER_CLI
+
+config BR2_PACKAGE_DOCKER_CLI_STATIC
+	bool "build static client"
+	depends on !BR2_STATIC_LIBS
+	help
+	  Build a static docker client.
+
+endif
+
+comment "docker-cli needs a toolchain w/ threads"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
new file mode 100644
index 0000000000..03322a4f6d
--- /dev/null
+++ b/package/docker-cli/docker-cli.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256	3e578406dead2fc72c4b52f77db39dc779fa8b460352116c06f1ae29219bd8c2  docker-cli-v18.09.0.tar.gz
+sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
new file mode 100644
index 0000000000..bb8ce41bf1
--- /dev/null
+++ b/package/docker-cli/docker-cli.mk
@@ -0,0 +1,31 @@
+###############################################################################
+#
+# docker-cli
+#
+################################################################################
+
+DOCKER_CLI_VERSION = v18.09.0
+DOCKER_CLI_SITE = $(call github,docker,cli,$(DOCKER_CLI_VERSION))
+DOCKER_CLI_WORKSPACE = gopath
+
+DOCKER_CLI_LICENSE = Apache-2.0
+DOCKER_CLI_LICENSE_FILES = LICENSE
+
+DOCKER_CLI_DEPENDENCIES = host-pkgconf
+
+DOCKER_CLI_TAGS = autogen
+DOCKER_CLI_BUILD_TARGETS = cmd/docker
+
+DOCKER_CLI_LDFLAGS = \
+	-X github.com/docker/cli/cli.GitCommit=$(DOCKER_CLI_VERSION) \
+	-X github.com/docker/cli/cli.Version=$(DOCKER_CLI_VERSION)
+
+ifeq ($(BR2_PACKAGE_DOCKER_CLI_STATIC),y)
+DOCKER_CLI_LDFLAGS += -extldflags '-static'
+DOCKER_CLI_TAGS += osusergo netgo
+DOCKER_CLI_GO_ENV = CGO_ENABLED=no
+endif
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
index 6c0ed338a5..1e3939f240 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256	4716df117d867b82ddab2e82395cd40aa3d0925a689eedcec8919729e4c9f121	docker-engine-v17.05.0-ce.tar.gz
+sha256	b5278b3f2b460ea61f47833abd2a844f348b4518e73f309294ad178c205a48e1  docker-engine-v18.09.0.tar.gz
+sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ba84b4cf0a..f19c1d995c 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,25 +4,21 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = v17.05.0-ce
-DOCKER_ENGINE_COMMIT = 89658bed64c2a8fe05a978e5b87dbec409d57a0f
-DOCKER_ENGINE_SITE = $(call github,docker,docker,$(DOCKER_ENGINE_VERSION))
+DOCKER_ENGINE_VERSION = v18.09.0
+DOCKER_ENGINE_SITE = $(call github,docker,engine,$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
 DOCKER_ENGINE_LICENSE_FILES = LICENSE
 
-DOCKER_ENGINE_DEPENDENCIES = host-go host-pkgconf
+DOCKER_ENGINE_DEPENDENCIES = host-pkgconf
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
