From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Fri, 11 Oct 2019 14:40:45 +0200
Subject: [Buildroot] [PATCH v3 7/9] package/netopeer2-keystored: add package
In-Reply-To: <20191011124131.28246-1-heiko.thiery@gmail.com>
References: <20191011124131.28246-1-heiko.thiery@gmail.com>
Message-ID: <20191011124131.28246-8-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

netopeer2 keystored plugin.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/netopeer2-keystored/Config.in         | 17 ++++++++++
 .../netopeer2-keystored.hash                  |  2 ++
 .../netopeer2-keystored.mk                    | 32 +++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/netopeer2-keystored/Config.in
 create mode 100644 package/netopeer2-keystored/netopeer2-keystored.hash
 create mode 100644 package/netopeer2-keystored/netopeer2-keystored.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index d8992538c2..ced7461b45 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1042,6 +1042,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
+F:	package/netopeer2-keystored/
 F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
diff --git a/package/Config.in b/package/Config.in
index 54b40936ba..c1e8ce3431 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1649,6 +1649,7 @@ menu "Networking"
 	source "package/mongoose/Config.in"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
+	source "package/netopeer2-keystored/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
 	source "package/nss-mdns/Config.in"
diff --git a/package/netopeer2-keystored/Config.in b/package/netopeer2-keystored/Config.in
new file mode 100644
index 0000000000..d23ec2f1b9
--- /dev/null
+++ b/package/netopeer2-keystored/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_NETOPEER2_KEYSTORED
+	bool "netopeer2-keystored"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_SYSREPO
+	help
+	  Netopeer2 is a set of tools implementing network
+	  configuration tools based on the NETCONF Protocol.
+
+	  This is the keystored sysrepo plugin.
+
+	  https://github.com/CESNET/Netopeer2
+
+comment "needs a toolchain w/ threads, dynamic libraray"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netopeer2-keystored/netopeer2-keystored.hash b/package/netopeer2-keystored/netopeer2-keystored.hash
new file mode 100644
index 0000000000..5f897e8d08
--- /dev/null
+++ b/package/netopeer2-keystored/netopeer2-keystored.hash
@@ -0,0 +1,2 @@
+sha256 59688271be4fecbbee671fc7eb3dc0538b13b4baab53e923e26eaeb33e6f7ec0  netopeer2-v0.7-r2.tar.gz
+sha256 932b75a8610a5c58e0fe0f70f8e4ebbcf3a2392acc16a88e95aebcdbdb9245e0  LICENSE
diff --git a/package/netopeer2-keystored/netopeer2-keystored.mk b/package/netopeer2-keystored/netopeer2-keystored.mk
new file mode 100644
index 0000000000..e67b45b70e
--- /dev/null
+++ b/package/netopeer2-keystored/netopeer2-keystored.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# netopeer2-keystored
+#
+################################################################################
+
+NETOPEER2_KEYSTORED_VERSION = v0.7-r2
+NETOPEER2_KEYSTORED_SOURCE = netopeer2-$(NETOPEER2_KEYSTORED_VERSION).tar.gz
+NETOPEER2_KEYSTORED_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2_KEYSTORED_VERSION))
+NETOPEER2_KEYSTORED_DL_SUBDIR = netopeer2
+NETOPEER2_KEYSTORED_SUBDIR = keystored
+NETOPEER2_KEYSTORED_LICENSE = BSD-3-Clause
+NETOPEER2_KEYSTORED_LICENSE_FILES = LICENSE
+NETOPEER2_KEYSTORED_SUBDIR = keystored
+NETOPEER2_KEYSTORED_DEPENDENCIES = host-sysrepo sysrepo
+
+NETOPEER2_KEYSTORED_CONF_OPTS = \
+	-DKEYSTORED_DEFER_SSH_KEY=ON \
+	-DSSH_KEY_INSTALL=ON \
+	-DMODEL_INSTALL=ON \
+	-DSYSREPOCTL_EXECUTABLE=$(HOST_DIR)/bin/sysrepoctl \
+	-DSYSREPOCFG_EXECUTABLE=$(HOST_DIR)/bin/sysrepocfg
+
+define NETOPEER2_KEYSTORED_PERMISSIONS
+	/etc/sysrepo/data/ietf-keystore.persist f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-keystore.running f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-keystore.running.lock f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-keystore.startup f 600 0 0 - - - - -
+	/etc/sysrepo/data/ietf-keystore.startup.lock f 600 0 0 - - - - -
+endef
+
+$(eval $(cmake-package))
-- 
2.20.1
