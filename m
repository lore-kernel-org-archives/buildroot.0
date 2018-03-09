From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  9 Mar 2018 20:17:01 +0100
Subject: [Buildroot] [PATCH 10/10] package: add docker-compose
In-Reply-To: <20180309191701.23760-1-peter@korsgaard.com>
References: <20180309191701.23760-1-peter@korsgaard.com>
Message-ID: <20180309191701.23760-11-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Python based multi-container orchestration for Docker.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/docker-compose/Config.in           | 29 +++++++++++++++++++++++++++++
 package/docker-compose/docker-compose.hash |  4 ++++
 package/docker-compose/docker-compose.mk   | 13 +++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/docker-compose/Config.in
 create mode 100644 package/docker-compose/docker-compose.hash
 create mode 100644 package/docker-compose/docker-compose.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e6dc51e1fe..f702c01152 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1373,6 +1373,7 @@ F:	package/libunistring/
 N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/orangepi/
 F:	configs/orangepi_pc_defconfig
+F:	package/docker-compose/
 F:	package/dump1090/
 F:	package/flickcurl/
 F:	package/fscryptctl/
diff --git a/package/Config.in b/package/Config.in
index 6fd61a0dea..37465c7f5b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1959,6 +1959,7 @@ menu "System tools"
 	source "package/dcron/Config.in"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
+	source "package/docker-compose/Config.in"
 	source "package/docker-containerd/Config.in"
 	source "package/docker-engine/Config.in"
 	source "package/dsp-tools/Config.in"
diff --git a/package/docker-compose/Config.in b/package/docker-compose/Config.in
new file mode 100644
index 0000000000..393b5f1a0d
--- /dev/null
+++ b/package/docker-compose/Config.in
@@ -0,0 +1,29 @@
+config BR2_PACKAGE_DOCKER_COMPOSE
+	bool "docker-compose"
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR # python
+	depends on BR2_TOOLCHAIN_HAS_THREADS # python
+	depends on !BR2_STATIC_LIBS # python
+	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
+	       if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
+	select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
+	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
+	select BR2_PACKAGE_PYTHON_PYYAML # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
+	select BR2_PACKAGE_PYTHON_TEXTTABLE # runtime
+	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
+	select BR2_PACKAGE_PYTHON_DOCKER # runtime
+	select BR2_PACKAGE_PYTHON_DOCKERPTY # runtime
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
+	help
+	  Multi-container orchestration for Docker.
+
+	  https://www.docker.com/
+
+comment "docker-compose needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
new file mode 100644
index 0000000000..df4d915469
--- /dev/null
+++ b/package/docker-compose/docker-compose.hash
@@ -0,0 +1,4 @@
+# md5 from https://pypi.python.org/pypi/docker-compose/json, sha256 locally computed
+md5	bd703d931f159b08ed5fe4fadcb12652  docker-compose-1.20.0rc1.tar.gz
+sha256	ad14f8dda3eb5c999f6195bf88420dafd1aada80535dab3afd3350fe8438e0a3  docker-compose-1.20.0rc1.tar.gz
+sha256	552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
new file mode 100644
index 0000000000..155c529391
--- /dev/null
+++ b/package/docker-compose/docker-compose.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# docker-compose
+#
+################################################################################
+
+DOCKER_COMPOSE_VERSION = 1.20.0rc1
+DOCKER_COMPOSE_SITE = https://pypi.python.org/packages/ca/d9/21266285a3c34e8e023f2504c13ffb48e6acd1e43ccdd0c55188d7039505
+DOCKER_COMPOSE_SETUP_TYPE = setuptools
+DOCKER_COMPOSE_LICENSE = Apache-2.0
+DOCKER_COMPOSE_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
-- 
2.11.0
