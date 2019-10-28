From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 28 Oct 2019 10:03:29 +0100
Subject: [Buildroot] [PATCH v5 5/5] package/netopeer2-cli: add package
In-Reply-To: <20191028090329.25432-1-heiko.thiery@gmail.com>
References: <20191028090329.25432-1-heiko.thiery@gmail.com>
Message-ID: <20191028090329.25432-6-heiko.thiery@gmail.com>
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
 package/netopeer2-cli/Config.in          | 21 +++++++++++++++++++++
 package/netopeer2-cli/netopeer2-cli.hash |  1 +
 package/netopeer2-cli/netopeer2-cli.mk   | 17 +++++++++++++++++
 5 files changed, 41 insertions(+)
 create mode 100644 package/netopeer2-cli/Config.in
 create mode 120000 package/netopeer2-cli/netopeer2-cli.hash
 create mode 100644 package/netopeer2-cli/netopeer2-cli.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 217d044930..d70985393b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1048,6 +1048,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
+F:	package/netopeer2-cli/
 F:	package/netopeer2-keystored/
 F:	package/netopeer2-server/
 F:	package/sysrepo/
diff --git a/package/Config.in b/package/Config.in
index aaecef433f..3048ecd8ed 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1659,6 +1659,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/netopeer2-cli/Config.in"
 	source "package/netopeer2-keystored/Config.in"
 	source "package/netopeer2-server/Config.in"
 	source "package/nghttp2/Config.in"
diff --git a/package/netopeer2-cli/Config.in b/package/netopeer2-cli/Config.in
new file mode 100644
index 0000000000..9c3a302a1d
--- /dev/null
+++ b/package/netopeer2-cli/Config.in
@@ -0,0 +1,21 @@
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
+	select BR2_PACKAGE_SYSREPO
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
index 0000000000..47bb47d7e3
--- /dev/null
+++ b/package/netopeer2-cli/netopeer2-cli.hash
@@ -0,0 +1 @@
+../netopeer2-keystored/netopeer2-keystored.hash
\ No newline at end of file
diff --git a/package/netopeer2-cli/netopeer2-cli.mk b/package/netopeer2-cli/netopeer2-cli.mk
new file mode 100644
index 0000000000..9adc8226de
--- /dev/null
+++ b/package/netopeer2-cli/netopeer2-cli.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# netopeer2-cli
+#
+################################################################################
+
+NETOPEER2_CLI_VERSION = 0.7-r2
+NETOPEER2_CLI_SOURCE = netopeer2-$(NETOPEER2_CLI_VERSION).tar.gz
+NETOPEER2_CLI_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_CLI_VERSION))
+NETOPEER2_CLI_DL_SUBDIR = netopeer2
+NETOPEER2_CLI_LICENSE = BSD-3-Clause
+NETOPEER2_CLI_LICENSE_FILES = LICENSE
+NETOPEER2_CLI_SUBDIR = cli
+NETOPEER2_CLI_INSTALL_STAGING = YES
+NETOPEER2_CLI_DEPENDENCIES = libnetconf2 libyang sysrepo
+
+$(eval $(cmake-package))
-- 
2.20.1
