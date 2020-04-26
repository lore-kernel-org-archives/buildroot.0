From: Thomas Ruschival <thomas@ruschival.de>
Date: Sun, 26 Apr 2020 15:58:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/pistache: new package
In-Reply-To: <20200426135842.2125143-1-thomas@ruschival.de>
References: <20200426135842.2125143-1-thomas@ruschival.de>
Message-ID: <20200426135842.2125143-2-thomas@ruschival.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new package for pistache https://pistache.io/
Pistache is a C++ REST client/server library.

Signed-off-by: Thomas Ruschival <thomas@ruschival.de>
---
 package/Config.in              |  1 +
 package/pistache/Config.in     | 22 ++++++++++++++++++++++
 package/pistache/pistache.hash |  5 +++++
 package/pistache/pistache.mk   | 23 +++++++++++++++++++++++
 4 files changed, 51 insertions(+)
 create mode 100644 package/pistache/Config.in
 create mode 100644 package/pistache/pistache.hash
 create mode 100644 package/pistache/pistache.mk

diff --git a/package/Config.in b/package/Config.in
index 6c55c5bc42..631aec69a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1753,6 +1753,7 @@ menu "Networking"
 	source "package/ortp/Config.in"
 	source "package/paho-mqtt-c/Config.in"
 	source "package/paho-mqtt-cpp/Config.in"
+	source "package/pistache/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
 	source "package/rabbitmq-c/Config.in"
diff --git a/package/pistache/Config.in b/package/pistache/Config.in
new file mode 100644
index 0000000000..5b81c9c1b7
--- /dev/null
+++ b/package/pistache/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_PISTACHE
+	bool "pistache"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Pistache is a C++ REST framework written by Mathieu Stefani
+	  at Datacratic. It is written in pure C++14 with no external
+	  dependency and provides a low-level HTTP abstraction. It
+	  provides both an HTTP client and server that can be used
+	  to create and query complex web and REST APIs.
+
+	  https://pistache.io/
+
+
+config BR2_PACKAGE_PISTACHE_ENABLE_SSL
+	bool "pistache SSL support"
+	depends on BR2_PACKAGE_PISTACHE
+	depends on BR2_PACKAGE_OPENSSL
+	help
+	  Configure pistache with -DPISTACHE_USE_SSL=On to support HTTPS
+
diff --git a/package/pistache/pistache.hash b/package/pistache/pistache.hash
new file mode 100644
index 0000000000..fb4ada8b24
--- /dev/null
+++ b/package/pistache/pistache.hash
@@ -0,0 +1,5 @@
+# Nov 22
+sha256 6b02ee423047992c5298d9c81a81231f71d62a549242a63913a050836b863e64  pistache-394b17c01f928bb.tar.gz
+
+# Apr 13
+sha256 bcc7640eb4ae4b178e504f18ebf29dd0a6f8189710cdc0fa4703fa27728145e4  73f248acd6db4c53.tar.gz
diff --git a/package/pistache/pistache.mk b/package/pistache/pistache.mk
new file mode 100644
index 0000000000..da9e61b10e
--- /dev/null
+++ b/package/pistache/pistache.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# Pistache
+#
+################################################################################
+
+PISTACHE_VERSION = 73f248acd6db4c53
+PISTACHE_SOURCE = $(PISTACHE_VERSION).tar.gz
+PISTACHE_SITE = https://github.com/oktal/pistache/archive
+PISTACHE_SITE_METHOD = wget
+
+PISTACHE_INSTALL_STAGING = YES
+PISTACHE_INSTALL_TARGET = YES
+PISTACHE_LICENSE = Apache-2.0
+PISTACHE_LICENSE_FILE = LICENSE
+
+PISTACHE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Release
+
+ifeq (y, $(BR2_PACKAGE_PISTACHE_ENABLE_SSL))
+	PISTACHE_CONF_OPTS += -DPISTACHE_USE_SSL=On
+endif
+
+$(eval $(cmake-package))
-- 
2.26.2
