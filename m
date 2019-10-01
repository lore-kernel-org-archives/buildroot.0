From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Tue,  1 Oct 2019 16:30:22 +0200
Subject: [Buildroot] [PATCH 9/9] package/netopeer2keystored: add package
In-Reply-To: <20191001143023.698-1-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
Message-ID: <20191001143023.698-9-heiko.thiery@gmail.com>
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
 package/libnetconf2/libnetconf2.mk            |  8 +++-----
 package/netopeer2keystored/Config.in          | 16 +++++++++++++++
 .../netopeer2keystored.hash                   |  2 ++
 .../netopeer2keystored/netopeer2keystored.mk  | 20 +++++++++++++++++++
 6 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 package/netopeer2keystored/Config.in
 create mode 100644 package/netopeer2keystored/netopeer2keystored.hash
 create mode 100644 package/netopeer2keystored/netopeer2keystored.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 08793ffb98..ac82b17c20 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1040,6 +1040,7 @@ N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libredblack/
 F:	package/libyang/
 F:	package/libnetconf2/
+F:	package/netopeer2keystored/
 F:	package/netopeer2cli/
 F:	package/netopeer2server/
 F:	package/sysrepo/
diff --git a/package/Config.in b/package/Config.in
index a42dae1df7..1381df4e37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1647,6 +1647,7 @@ menu "Networking"
 	source "package/nanomsg/Config.in"
 	source "package/neon/Config.in"
 	source "package/netopeer2cli/Config.in"
+	source "package/netopeer2keystored/Config.in"
 	source "package/netopeer2server/Config.in"
 	source "package/nghttp2/Config.in"
 	source "package/norm/Config.in"
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 7bafe78324..65500e9f85 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -10,17 +10,15 @@ LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
 LIBNETCONF2_LICENSE_FILES = LICENSE
 LIBNETCONF2_DEPENDENCIES += libyang libssh
-HOST_LIBNETCONF2_DEPENDENCIES += host-libyang host-libssh
+HOST_LIBNETCONF2_DEPENDENCIES += host-libyang
 
 LIBNETCONF2_CONF_OPTS += \
-	-DENABLE_TLS=ON \
-	-DENABLE_SSH=ON \
 	-DENABLE_BUILD_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
 HOST_LIBNETCONF2_CONF_OPTS += \
-	-DENABLE_TLS=ON \
-	-DENABLE_SSH=ON \
+	-DENABLE_TLS=OFF \
+	-DENABLE_SSH=OFF \
 	-DENABLE_BUILD_TESTS=OFF \
 	-DENABLE_VALGRIND_TESTS=OFF
 
diff --git a/package/netopeer2keystored/Config.in b/package/netopeer2keystored/Config.in
new file mode 100644
index 0000000000..efb12a7f40
--- /dev/null
+++ b/package/netopeer2keystored/Config.in
@@ -0,0 +1,16 @@
+config BR2_PACKAGE_NETOPEER2KEYSTORED
+	bool "netopeer2-keystore daemon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_SYSREPO
+	select BR2_PACKAGE_SYSREPO
+	help
+	  Netopeer2 is a set of tools implementing network
+	  configuration tools based on the NETCONF Protocol.
+
+	  https://github.com/CESNET/Netopeer2
+
+comment "needs a glibc toolchain w/ threads, dynamic libraray"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/netopeer2keystored/netopeer2keystored.hash b/package/netopeer2keystored/netopeer2keystored.hash
new file mode 100644
index 0000000000..5309a36252
--- /dev/null
+++ b/package/netopeer2keystored/netopeer2keystored.hash
@@ -0,0 +1,2 @@
+sha256 59688271be4fecbbee671fc7eb3dc0538b13b4baab53e923e26eaeb33e6f7ec0  netopeer2keystored-v0.7-r2.tar.gz
+sha256 932b75a8610a5c58e0fe0f70f8e4ebbcf3a2392acc16a88e95aebcdbdb9245e0  LICENSE
diff --git a/package/netopeer2keystored/netopeer2keystored.mk b/package/netopeer2keystored/netopeer2keystored.mk
new file mode 100644
index 0000000000..070593fc46
--- /dev/null
+++ b/package/netopeer2keystored/netopeer2keystored.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# netopeer2keystored
+#
+################################################################################
+
+NETOPEER2KEYSTORED_VERSION = v0.7-r2
+NETOPEER2KEYSTORED_SITE = $(call github,CESNET,Netopeer2,$(NETOPEER2KEYSTORED_VERSION))
+NETOPEER2KEYSTORED_LICENSE = BSD-3-Clause
+NETOPEER2KEYSTORED_LICENSE_FILES = LICENSE 
+NETOPEER2KEYSTORED_SUBDIR = keystored
+NETOPEER2KEYSTORED_INSTALL_STAGING = YES
+NETOPEER2KEYSTORED_DEPENDENCIES += host-sysrepo sysrepo
+
+NETOPEER2KEYSTORED_CONF_OPTS += \
+	-DKEYSTORED_DEFER_SSH_KEY=ON \
+	-DMODEL_INSTALL=OFF \
+	-DSSH_KEY_INSTALL=OFF
+
+$(eval $(cmake-package))
-- 
2.20.1
