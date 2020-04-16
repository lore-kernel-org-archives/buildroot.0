From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu, 16 Apr 2020 14:29:41 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/netopeer2-cli: add package
In-Reply-To: <20200416122939.10312-1-heiko.thiery@gmail.com>
References: <20200416122939.10312-1-heiko.thiery@gmail.com>
Message-ID: <20200416122939.10312-3-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netopeer2 cli is a simple command line interface to connect to a
NETCONF server (device).

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/netopeer2-cli/Config.in          | 20 ++++++++++++++++++++
 package/netopeer2-cli/netopeer2-cli.hash |  1 +
 package/netopeer2-cli/netopeer2-cli.mk   | 17 +++++++++++++++++
 5 files changed, 40 insertions(+)
 create mode 100644 package/netopeer2-cli/Config.in
 create mode 120000 package/netopeer2-cli/netopeer2-cli.hash
 create mode 100644 package/netopeer2-cli/netopeer2-cli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 42748655d8..1d07420157 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1106,6 +1106,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
+F:	package/netopeer2-cli/
 F:	package/netopeer2-server/
 F:	package/sysrepo/
 
diff --git a/package/Config.in b/package/Config.in
index 78c0d4b7ce..49c020cae6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1736,6 +1736,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/netopeer2-cli/Config.in"
 	source "package/netopeer2-server/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
diff --git a/package/netopeer2-cli/Config.in b/package/netopeer2-cli/Config.in
new file mode 100644
index 0000000000..70210597a1
--- /dev/null
+++ b/package/netopeer2-cli/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_NETOPEER2_CLI
+	bool "netopeer2-cli"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_LIBSSH
+	select BR2_PACKAGE_LIBSSH_SERVER
+	select BR2_PACKAGE_PCRE # libyang
+	select BR2_PACKAGE_PCRE_UCP # libyang
+	help
+	  Netopeer2 is a set of tools implementing network
+	  configuration tools based on the NETCONF Protocol.
+
+	  This is the CLI client part.
+
+	  https://github.com/CESNET/Netopeer2
+
+comment "netopeer2cli needs a toolchain w/ threads, dynamic libraray"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netopeer2-cli/netopeer2-cli.hash b/package/netopeer2-cli/netopeer2-cli.hash
new file mode 120000
index 0000000000..1abc5dfda4
--- /dev/null
+++ b/package/netopeer2-cli/netopeer2-cli.hash
@@ -0,0 +1 @@
+../netopeer2-server/netopeer2-server.hash
\ No newline at end of file
diff --git a/package/netopeer2-cli/netopeer2-cli.mk b/package/netopeer2-cli/netopeer2-cli.mk
new file mode 100644
index 0000000000..be82161d43
--- /dev/null
+++ b/package/netopeer2-cli/netopeer2-cli.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# netopeer2-cli
+#
+################################################################################
+
+NETOPEER2_CLI_VERSION = 1.1.7
+NETOPEER2_CLI_SOURCE = netopeer2-$(NETOPEER2_CLI_VERSION).tar.gz
+NETOPEER2_CLI_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_CLI_VERSION))
+NETOPEER2_CLI_DL_SUBDIR = netopeer2
+NETOPEER2_CLI_LICENSE = BSD-3-Clause
+NETOPEER2_CLI_LICENSE_FILES = LICENSE
+NETOPEER2_CLI_SUBDIR = cli
+NETOPEER2_CLI_INSTALL_STAGING = YES
+NETOPEER2_CLI_DEPENDENCIES = libnetconf2 libyang
+
+$(eval $(cmake-package))
-- 
2.20.1
