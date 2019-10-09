From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Wed,  9 Oct 2019 13:26:56 +0200
Subject: [Buildroot] [PATCH v2 9/9] package/netopeer2-cli: add package
In-Reply-To: <20191009112656.21232-1-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
Message-ID: <20191009112656.21232-10-heiko.thiery@gmail.com>
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
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/netopeer2-cli/Config.in          | 17 +++++++++++++++++
 package/netopeer2-cli/netopeer2-cli.hash |  2 ++
 package/netopeer2-cli/netopeer2-cli.mk   | 16 ++++++++++++++++
 5 files changed, 37 insertions(+)
 create mode 100644 package/netopeer2-cli/Config.in
 create mode 100644 package/netopeer2-cli/netopeer2-cli.hash
 create mode 100644 package/netopeer2-cli/netopeer2-cli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 6fe5544151..f8b9648fdc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1041,6 +1041,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
+F:	package/netopeer2-cli/
 F:	package/netopeer2-keystored/
 F:	package/netopeer2-server/
 F:	package/sysrepo/
diff --git a/package/Config.in b/package/Config.in
index a38569e12c..21aa793276 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1647,6 +1647,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/netopeer2-cli/Config.in"
 	source "package/netopeer2-keystored/Config.in"
 	source "package/netopeer2-server/Config.in"
 	source "package/nghttp2/Config.in"
diff --git a/package/netopeer2-cli/Config.in b/package/netopeer2-cli/Config.in
new file mode 100644
index 0000000000..eb771390be
--- /dev/null
+++ b/package/netopeer2-cli/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_NETOPEER2_CLI
+	bool "netopeer2cli"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_LIBNETCONF2_SSH
+	select BR2_PACKAGE_LIBNETCONF2_TLS
+	select BR2_PACKAGE_SYSREPO
+	help
+	  Netopeer2 CLI is a simple command line interface to
+	  connect to a NETCONF server (device).
+
+	  https://github.com/CESNET/Netopeer2
+
+comment "netopeer2cli needs a toolchain w/ threads, dynamic libraray"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netopeer2-cli/netopeer2-cli.hash b/package/netopeer2-cli/netopeer2-cli.hash
new file mode 100644
index 0000000000..031b0265c2
--- /dev/null
+++ b/package/netopeer2-cli/netopeer2-cli.hash
@@ -0,0 +1,2 @@
+sha256 59688271be4fecbbee671fc7eb3dc0538b13b4baab53e923e26eaeb33e6f7ec0  netopeer2-cli-v0.7-r2.tar.gz
+sha256 932b75a8610a5c58e0fe0f70f8e4ebbcf3a2392acc16a88e95aebcdbdb9245e0  LICENSE
diff --git a/package/netopeer2-cli/netopeer2-cli.mk b/package/netopeer2-cli/netopeer2-cli.mk
new file mode 100644
index 0000000000..75192cc935
--- /dev/null
+++ b/package/netopeer2-cli/netopeer2-cli.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# netopeer2-cli
+#
+################################################################################
+
+NETOPEER2_CLI_VERSION = v0.7-r2
+NETOPEER2_CLI_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2_CLI_VERSION))
+NETOPEER2_CLI_LICENSE = BSD-3-Clause
+NETOPEER2_CLI_LICENSE_FILES = LICENSE
+NETOPEER2_CLI_SUBDIR = cli
+NETOPEER2_CLI_INSTALL_STAGING = YES
+NETOPEER2_CLI_DEPENDENCIES += libyang
+NETOPEER2_CLI_DEPENDENCIES += sysrepo
+
+$(eval $(cmake-package))
-- 
2.20.1
