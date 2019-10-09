From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Wed,  9 Oct 2019 13:26:53 +0200
Subject: [Buildroot] [PATCH v2 6/9] package/sysrepo: add package
In-Reply-To: <20191009112656.21232-1-heiko.thiery@gmail.com>
References: <20191009112656.21232-1-heiko.thiery@gmail.com>
Message-ID: <20191009112656.21232-7-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

sysrepo is a YANG-based configuration and operational state
data store for Unix/Linux applications. It is a dependency
of Netopeer, a NETCONF server.

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/sysrepo/Config.in    | 27 ++++++++++++++++++++++++++
 package/sysrepo/sysrepo.hash |  2 ++
 package/sysrepo/sysrepo.mk   | 37 ++++++++++++++++++++++++++++++++++++
 5 files changed, 68 insertions(+)
 create mode 100644 package/sysrepo/Config.in
 create mode 100644 package/sysrepo/sysrepo.hash
 create mode 100644 package/sysrepo/sysrepo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 56b92cf82a..143b277dc4 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1041,6 +1041,7 @@ F:	package/python-sip/
 N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libnetconf2/
 F:	package/libyang/
+F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
 F:	package/json-glib/
diff --git a/package/Config.in b/package/Config.in
index c091ad2bd8..80bc83e8cd 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1668,6 +1668,7 @@ menu "Networking"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
+	source "package/sysrepo/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wampcc/Config.in"
diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
new file mode 100644
index 0000000000..97cdd95800
--- /dev/null
+++ b/package/sysrepo/Config.in
@@ -0,0 +1,27 @@
+config BR2_PACKAGE_SYSREPO
+	bool "sysrepo"
+	depends on BR2_USE_MMU # libnetconf2
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86" # host-protbuf
+	depends on BR2_HOST_GCC_AT_LEAST_4_8 # host-protobuf
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_LIBNETCONF2_SSH
+	select BR2_PACKAGE_LIBNETCONF2_TLS
+	select BR2_PACKAGE_LIBAVL
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_PCRE
+	help
+	  Sysrepo is an YANG-based configuration and operational state
+	  data store for Unix/Linux applications.
+
+	  https://github.com/sysrepo
+
+comment "sysrepo needs a toolchain w/ C++, threads, dynamic libraray, host gcc >= 4.8"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_HOST_GCC_AT_LEAST_4_8
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/package/sysrepo/sysrepo.hash b/package/sysrepo/sysrepo.hash
new file mode 100644
index 0000000000..39ec70a2f6
--- /dev/null
+++ b/package/sysrepo/sysrepo.hash
@@ -0,0 +1,2 @@
+sha256 d3066c1776a6727b96bbb3517eb646d0bb6037e8e1addcbe873cae590493843e  sysrepo-v0.7.8.tar.gz
+sha256 28a773bfffa828ec38c030fc8ace5f3aeb90926ec1309bbd135441c4387ce3cd  LICENSE
diff --git a/package/sysrepo/sysrepo.mk b/package/sysrepo/sysrepo.mk
new file mode 100644
index 0000000000..ea50b1af7e
--- /dev/null
+++ b/package/sysrepo/sysrepo.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# sysrepo
+#
+################################################################################
+
+SYSREPO_VERSION = v0.7.8
+SYSREPO_SITE = $(call github,sysrepo,sysrepo,$(SYSREPO_VERSION))
+SYSREPO_INSTALL_STAGING = YES
+SYSREPO_LICENSE = Apache-2.0
+SYSREPO_LICENSE_FILES = LICENSE
+SYSREPO_DEPENDENCIES += libev libnetconf2 libavl libyang pcre protobuf-c host-sysrepo
+HOST_SYSREPO_DEPENDENCIES += host-libev host-libnetconf2 host-libavl host-libyang host-pcre host-protobuf-c
+
+SYSREPO_CONF_OPTS += \
+	-DGEN_PYTHON2_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
+	-DCALL_SYSREPOCTL_BIN=$(HOST_DIR)/bin/sysrepoctl \
+	-DCALL_SYSREPOCFG_BIN=$(HOST_DIR)/bin/sysrepocfg
+
+# On ARM, this is needed to prevent unaligned memory access with an optimized
+# build .. https://github.com/sysrepo/sysrepo/issues/947
+SYSREPO_CONF_OPTS += -DUSE_SR_MEM_MGMT=OFF
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+SYSREPO_CONF_OPTS += -DWITH_SYSTEMD=ON
+endif
+
+HOST_SYSREPO_CONF_OPTS += \
+	-DGEN_PYTHON2_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
+	-DCALL_TARGET_BINS_DIRECTLY=OFF \
+	-DREPOSITORY_LOC=$(BASE_TARGET_DIR)/etc/sysrepo \
+	-DSUBSCRIPTIONS_SOCKET_DIR=$(HOST_DIR)/var/run/sysrepo-subscriptions
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
