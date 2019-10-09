From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Wed,  9 Oct 2019 13:26:55 +0200
Subject: [Buildroot] [PATCH v2 8/9] package/netopeer2-server: add package
In-Reply-To: <20191009112656.21232-1-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
Message-ID: <20191009112656.21232-9-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Netopeer2 is a set of tools implementing network configuration
tools based on the NETCONF Protocol. This is the second
generation of the toolset, originally available as the Netopeer
project. Netopeer2 is based on the new generation of the NETCONF
and YANG libraries - libyang and libnetconf2. The Netopeer
server uses sysrepo as a NETCONF datastore implementation.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/netopeer2-server/Config.in            | 18 +++++++++++++
 .../netopeer2-server/netopeer2-server.hash    |  2 ++
 package/netopeer2-server/netopeer2-server.mk  | 26 +++++++++++++++++++
 5 files changed, 48 insertions(+)
 create mode 100644 package/netopeer2-server/Config.in
 create mode 100644 package/netopeer2-server/netopeer2-server.hash
 create mode 100644 package/netopeer2-server/netopeer2-server.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 2eb3ae905b..6fe5544151 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1042,6 +1042,7 @@ N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
 F:	package/netopeer2-keystored/
+F:	package/netopeer2-server/
 F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
diff --git a/package/Config.in b/package/Config.in
index fbe5ab2306..a38569e12c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1648,6 +1648,7 @@ menu "Networking"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
 	source "package/netopeer2-keystored/Config.in"
+	source "package/netopeer2-server/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/netopeer2-server/Config.in b/package/netopeer2-server/Config.in
new file mode 100644
index 0000000000..01d35400dc
--- /dev/null
+++ b/package/netopeer2-server/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_NETOPEER2_SERVER
+	bool "netopeer2server"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_LIBNETCONF2_SSH
+	select BR2_PACKAGE_LIBNETCONF2_TLS
+	select BR2_PACKAGE_SYSREPO
+	select BR2_PACKAGE_NETOPEER2_KEYSTORED
+	help
+	  Netopeer2 is a set of tools implementing network
+	  configuration tools based on the NETCONF Protocol.
+
+	  https://github.com/CESNET/Netopeer2
+
+comment "netopeer2server needs a toolchain w/ threads, dynamic libraray"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netopeer2-server/netopeer2-server.hash b/package/netopeer2-server/netopeer2-server.hash
new file mode 100644
index 0000000000..78b377a286
--- /dev/null
+++ b/package/netopeer2-server/netopeer2-server.hash
@@ -0,0 +1,2 @@
+sha256 59688271be4fecbbee671fc7eb3dc0538b13b4baab53e923e26eaeb33e6f7ec0  netopeer2-server-v0.7-r2.tar.gz
+sha256 932b75a8610a5c58e0fe0f70f8e4ebbcf3a2392acc16a88e95aebcdbdb9245e0  LICENSE
diff --git a/package/netopeer2-server/netopeer2-server.mk b/package/netopeer2-server/netopeer2-server.mk
new file mode 100644
index 0000000000..0ca4c50f96
--- /dev/null
+++ b/package/netopeer2-server/netopeer2-server.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# netopeer2-server
+#
+################################################################################
+
+NETOPEER2_SERVER_VERSION = v0.7-r2
+NETOPEER2_SERVER_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2_SERVER_VERSION))
+NETOPEER2_SERVER_LICENSE = BSD-3-Clause
+NETOPEER2_SERVER_LICENSE_FILES = LICENSE
+NETOPEER2_SERVER_SUBDIR = server
+NETOPEER2_SERVER_DEPENDENCIES += libyang sysrepo
+
+NETOPEER2_SERVER_CONF_OPTS += \
+	-DENABLE_CONFIGURATION=ON \
+	-DKEYSTORED_KEYS_DIR=/etc/keystored/keys
+
+define NETOPEER2_SERVER_PERMISSIONS
+	/etc/sysrepo/data/ietf-netconf-server.persist f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-netconf-server.running f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-netconf-server.running.lock f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-netconf-server.startup f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-netconf-server.startup.lock f 600 0 0 - - - - -
+endef
+
+$(eval $(cmake-package))
-- 
2.20.1
