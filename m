From: Christian Stewart <christian@paral.in>
Date: Sat, 14 Jul 2018 18:07:29 -0700
Subject: [Buildroot] [PATCH v3 3/6] docker-engine: add support for init
 processes
In-Reply-To: <20180715010732.21765-1-christian@paral.in>
References: <20180715010732.21765-1-christian@paral.in>
Message-ID: <20180715010732.21765-9-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When a docker container is run with the --init flag, the Docker engine
uses the docker-init binary as PID 1 inside the container. This is
necessary in may cases to avoid issues with signal handling, zombie
processes, and other quirks when running as PID 1.

The docker-init binary is backed by tini on default, but optionally can
be changed to docker-init by user preference.

Furthermore, this patch fixes the following Docker error:

  dockerd: level=warning msg="failed to retrieve docker-init version"

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-engine/Config.in        | 26 ++++++++++++++++++++++++++
 package/docker-engine/docker-engine.mk |  6 ++++++
 2 files changed, 32 insertions(+)

diff --git a/package/docker-engine/Config.in b/package/docker-engine/Config.in
index 8feb11b48c..a76940b6c0 100644
--- a/package/docker-engine/Config.in
+++ b/package/docker-engine/Config.in
@@ -34,6 +34,32 @@ config BR2_PACKAGE_DOCKER_ENGINE_STATIC_CLIENT
 
 if BR2_PACKAGE_DOCKER_ENGINE_DAEMON
 
+choice
+	bool "docker-init to use"
+	default BR2_PACKAGE_DOCKER_ENGINE_INIT_TINI
+	help
+	  The docker engine uses a minimal init process as PID 1
+	  inside containers. There are several implementations
+	  of this init process.
+
+config BR2_PACKAGE_DOCKER_ENGINE_INIT_TINI
+	bool "tini"
+	select BR2_PACKAGE_TINI
+	help
+	  Use Tini as the container init process.
+
+	  https://github.com/krallin/tini
+
+config BR2_PACKAGE_DOCKER_ENGINE_INIT_DUMB_INIT
+	bool "dumb-init"
+	select BR2_PACKAGE_DUMB_INIT
+	help
+	  Use dumb-init as the container init process.
+
+	  https://github.com/Yelp/dumb-init
+
+endchoice
+
 config BR2_PACKAGE_DOCKER_ENGINE_DRIVER_BTRFS
 	bool "btrfs filesystem driver"
 	depends on BR2_USE_MMU # btrfs-progs
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index ba84b4cf0a..a85f4b5784 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -63,6 +63,12 @@ endif
 
 DOCKER_ENGINE_INSTALL_BINS = $(notdir $(DOCKER_ENGINE_BUILD_TARGETS))
 
+ifeq ($(BR2_PACKAGE_DOCKER_ENGINE_INIT_DUMB_INIT),y)
+DOCKER_ENGINE_INSTALL_BINS += dumb-init
+else
+DOCKER_ENGINE_INSTALL_BINS += tini
+endif
+
 define DOCKER_ENGINE_RUN_AUTOGEN
 	cd $(@D) && \
 		GITCOMMIT="$$(echo $(DOCKER_ENGINE_COMMIT) | head -c7)" \
-- 
2.16.1
