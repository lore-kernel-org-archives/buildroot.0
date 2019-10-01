From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Tue,  1 Oct 2019 16:30:20 +0200
Subject: [Buildroot] [PATCH 7/9] package/netopeer2server: add package
In-Reply-To: <20191001143023.698-1-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
Message-ID: <20191001143023.698-7-heiko.thiery@gmail.com>
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
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/netopeer2server/Config.in            | 16 ++++++++++++++++
 package/netopeer2server/netopeer2server.hash |  2 ++
 package/netopeer2server/netopeer2server.mk   | 19 +++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/netopeer2server/Config.in
 create mode 100644 package/netopeer2server/netopeer2server.hash
 create mode 100644 package/netopeer2server/netopeer2server.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index e7b3c9d6f6..d70e2c7b56 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1040,6 +1040,7 @@ N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libredblack/
 F:	package/libyang/
 F:	package/libnetconf2/
+F:	package/netopeer2server/
 F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
diff --git a/package/Config.in b/package/Config.in
index c1f6fb2245..c91ef640bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1646,6 +1646,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/netopeer2server/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/netopeer2server/Config.in b/package/netopeer2server/Config.in
new file mode 100644
index 0000000000..99e8e01919
--- /dev/null
+++ b/package/netopeer2server/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_NETOPEER2SERVER
+	bool "netopeer2-server"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_SYSREPO
+	select BR2_PACKAGE_NETOPEER2KEYSTORED
+	help
+	  Netopeer2 is a set of tools implementing network
+	  configuration tools based on the NETCONF Protocol.
+
+	  https://github.com/CESNET/Netopeer2
+
+comment "needs a glibc toolchain w/ threads, dynamic libraray"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netopeer2server/netopeer2server.hash b/package/netopeer2server/netopeer2server.hash
new file mode 100644
index 0000000000..0b6cfa3b53
--- /dev/null
+++ b/package/netopeer2server/netopeer2server.hash
@@ -0,0 +1,2 @@
+sha256 59688271be4fecbbee671fc7eb3dc0538b13b4baab53e923e26eaeb33e6f7ec0  netopeer2server-v0.7-r2.tar.gz
+sha256 932b75a8610a5c58e0fe0f70f8e4ebbcf3a2392acc16a88e95aebcdbdb9245e0  LICENSE
diff --git a/package/netopeer2server/netopeer2server.mk b/package/netopeer2server/netopeer2server.mk
new file mode 100644
index 0000000000..4d8b17b11f
--- /dev/null
+++ b/package/netopeer2server/netopeer2server.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# netopeer2server
+#
+################################################################################
+
+NETOPEER2SERVER_VERSION = v0.7-r2
+NETOPEER2SERVER_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2SERVER_VERSION))
+NETOPEER2SERVER_LICENSE = BSD-3-Clause
+NETOPEER2SERVER_LICENSE_FILES = LICENSE
+NETOPEER2SERVER_SUBDIR = server
+NETOPEER2SERVER_INSTALL_STAGING = YES
+NETOPEER2SERVER_DEPENDENCIES += libyang sysrepo
+
+NETOPEER2SERVER_CONF_OPTS += \
+	-DENABLE_CONFIGURATION=OFF \
+	-DKEYSTORED_KEYS_DIR=/etc/keystored/keys
+
+$(eval $(cmake-package))
-- 
2.20.1
