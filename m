From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Tue,  1 Oct 2019 16:30:21 +0200
Subject: [Buildroot] [PATCH 8/9] package/netopeer2cli: add package
In-Reply-To: <20191001143023.698-1-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
Message-ID: <20191001143023.698-8-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

netopeer2 CLI - simple command line interface to connect to a
NETCONF server (device).

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  1 +
 package/netopeer2cli/Config.in         | 10 ++++++++++
 package/netopeer2cli/netopeer2cli.hash |  2 ++
 package/netopeer2cli/netopeer2cli.mk   | 16 ++++++++++++++++
 5 files changed, 30 insertions(+)
 create mode 100644 package/netopeer2cli/Config.in
 create mode 100644 package/netopeer2cli/netopeer2cli.hash
 create mode 100644 package/netopeer2cli/netopeer2cli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d70e2c7b56..08793ffb98 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1040,6 +1040,7 @@ N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libredblack/
 F:	package/libyang/
 F:	package/libnetconf2/
+F:	package/netopeer2cli/
 F:	package/netopeer2server/
 F:	package/sysrepo/
 
diff --git a/package/Config.in b/package/Config.in
index c91ef640bf..a42dae1df7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1646,6 +1646,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/netopeer2cli/Config.in"
 	source "package/netopeer2server/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
diff --git a/package/netopeer2cli/Config.in b/package/netopeer2cli/Config.in
new file mode 100644
index 0000000000..12f94281d4
--- /dev/null
+++ b/package/netopeer2cli/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_NETOPEER2CLI
+	bool "netopeer2-cli"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+    depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_SYSREPO
+	help
+	  Netopeer2 CLI is a simple command line interface to
+	  connect to a NETCONF server (device).
diff --git a/package/netopeer2cli/netopeer2cli.hash b/package/netopeer2cli/netopeer2cli.hash
new file mode 100644
index 0000000000..592228e63e
--- /dev/null
+++ b/package/netopeer2cli/netopeer2cli.hash
@@ -0,0 +1,2 @@
+sha256 59688271be4fecbbee671fc7eb3dc0538b13b4baab53e923e26eaeb33e6f7ec0  netopeer2cli-v0.7-r2.tar.gz
+sha256 932b75a8610a5c58e0fe0f70f8e4ebbcf3a2392acc16a88e95aebcdbdb9245e0  LICENSE
diff --git a/package/netopeer2cli/netopeer2cli.mk b/package/netopeer2cli/netopeer2cli.mk
new file mode 100644
index 0000000000..930559e517
--- /dev/null
+++ b/package/netopeer2cli/netopeer2cli.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# netopeer2cli
+#
+################################################################################
+
+NETOPEER2CLI_VERSION = v0.7-r2
+NETOPEER2CLI_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2CLI_VERSION))
+NETOPEER2CLI_LICENSE = BSD-3-Clause
+NETOPEER2CLI_LICENSE_FILES = LICENSE
+NETOPEER2CLI_SUBDIR = cli
+NETOPEER2CLI_INSTALL_STAGING = YES
+NETOPEER2CLI_DEPENDENCIES += libyang
+NETOPEER2CLI_DEPENDENCIES += sysrepo
+
+$(eval $(cmake-package))
-- 
2.20.1
