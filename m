From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Tue,  1 Oct 2019 16:30:19 +0200
Subject: [Buildroot] [PATCH 6/9] package/sysrepo: add package
In-Reply-To: <20191001143023.698-1-heiko.thiery@gmail.com>
References: <20191001143023.698-1-heiko.thiery@gmail.com>
Message-ID: <20191001143023.698-6-heiko.thiery@gmail.com>
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
 package/sysrepo/Config.in    | 17 +++++++++++++++++
 package/sysrepo/sysrepo.hash |  2 ++
 package/sysrepo/sysrepo.mk   | 26 ++++++++++++++++++++++++++
 5 files changed, 47 insertions(+)
 create mode 100644 package/sysrepo/Config.in
 create mode 100644 package/sysrepo/sysrepo.hash
 create mode 100644 package/sysrepo/sysrepo.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 527b8cccac..e7b3c9d6f6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1040,6 +1040,7 @@ N:	Heiko Thiery <heiko.thiery@gmail.com>
 F:	package/libredblack/
 F:	package/libyang/
 F:	package/libnetconf2/
+F:	package/sysrepo/
 
 N:	Henrique Camargo <henrique@henriquecamargo.com>
 F:	package/json-glib/
diff --git a/package/Config.in b/package/Config.in
index f9b1b88b91..c1f6fb2245 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1667,6 +1667,7 @@ menu "Networking"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
 	source "package/sofia-sip/Config.in"
+	source "package/sysrepo/Config.in"
 	source "package/thrift/Config.in"
 	source "package/usbredir/Config.in"
 	source "package/wampcc/Config.in"
diff --git a/package/sysrepo/Config.in b/package/sysrepo/Config.in
new file mode 100644
index 0000000000..78b8097e14
--- /dev/null
+++ b/package/sysrepo/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_SYSREPO
+	bool "sysrepo - YANG based data store"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	select BR2_PACKAGE_LIBEV
+	select BR2_PACKAGE_LIBNETCONF2
+	select BR2_PACKAGE_LIBREDBLACK
+	select BR2_PACKAGE_LIBYANG
+	select BR2_PACKAGE_PROTOBUF_C
+	select BR2_PACKAGE_PCRE
+	help
+	  Sysrepo is an YANG-based configuration and operational state
+	  data store for Unix/Linux applications.
+
+comment "needs a toolchain w/ threads, dynamic libraray"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
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
index 0000000000..423d3a7b03
--- /dev/null
+++ b/package/sysrepo/sysrepo.mk
@@ -0,0 +1,26 @@
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
+SYSREPO_DEPENDENCIES += libev libnetconf2 libredblack libyang pcre protobuf-c
+HOST_SYSREPO_DEPENDENCIES += host-libev host-libnetconf2 host-libredblack host-libyang host-pcre host-protobuf-c
+
+SYSREPO_CONF_OPTS += \
+	-DGEN_PYTHON2_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
+	-DCALL_TARGET_BINS_DIRECTLY=OFF
+
+HOST_SYSREPO_CONF_OPTS += \
+	-DGEN_PYTHON2_TESTS=OFF \
+	-DENABLE_TESTS=OFF \
+	-DCALL_TARGET_BINS_DIRECTLY=OFF
+
+$(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
