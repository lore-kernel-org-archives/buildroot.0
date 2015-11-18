From: Joris Lijssens <joris.lijssens@gmail.com>
Date: Wed, 18 Nov 2015 11:42:07 +0100
Subject: [Buildroot] [PATCH 1/1] rabbitmq-c:new package
Message-ID: <1447843327-22577-1-git-send-email-joris.lijssens@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
---
 package/Config.in                  |  1 +
 package/rabbitmq-c/Config.in       |  7 +++++++
 package/rabbitmq-c/rabbitmq-c.hash |  2 ++
 package/rabbitmq-c/rabbitmq-c.mk   | 29 +++++++++++++++++++++++++++++
 4 files changed, 39 insertions(+)
 create mode 100644 package/rabbitmq-c/Config.in
 create mode 100644 package/rabbitmq-c/rabbitmq-c.hash
 create mode 100644 package/rabbitmq-c/rabbitmq-c.mk

diff --git a/package/Config.in b/package/Config.in
index 0a80afb..7092be4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1058,6 +1058,7 @@ menu "Networking"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
+	source "package/rabbitmq-c/Config.in"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
new file mode 100644
index 0000000..d552861
--- /dev/null
+++ b/package/rabbitmq-c/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RABBITMQ_C
+	bool "rabbitmq-c"
+	help
+	  This is a C-language AMQP client library for use with v2.0+ of 
+	  the RabbitMQ broker.
+
+	  https://github.com/alanxz/rabbitmq-c
diff --git a/package/rabbitmq-c/rabbitmq-c.hash b/package/rabbitmq-c/rabbitmq-c.hash
new file mode 100644
index 0000000..e767872
--- /dev/null
+++ b/package/rabbitmq-c/rabbitmq-c.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 23df349a7d157543e756acc67e47b217843ecbdafaefe3e4974073bb99d8a26d rabbitmq-c-0.7.1.tar.gz
diff --git a/package/rabbitmq-c/rabbitmq-c.mk b/package/rabbitmq-c/rabbitmq-c.mk
new file mode 100644
index 0000000..2e820c4
--- /dev/null
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -0,0 +1,29 @@
+################################################################################
+#
+# rabbitmq-c
+#
+################################################################################
+
+RABBITMQ_C_VERSION = 0.7.1
+RABBITMQ_C_SITE = https://github.com/alanxz/rabbitmq-c/releases/download/v$(RABBITMQ_C_VERSION)
+RABBITMQ_C_LICENSE = MIT
+RABBITMQ_C_LICENSE_FILES = LICENSE-MIT
+RABBITMQ_C_INSTALL_STAGING = YES
+RABBITMQ_C_CONF_OPTS = -DBUILD_API_DOCS=OFF 
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+RABBITMQ_C_CONF_OPTS += -DENABLE_SSL_SUPPORT=ON 
+RABBITMQ_C_DEPENDENCIES += openssl
+else
+RABBITMQ_C_CONF_OPTS += -DENABLE_SSL_SUPPORT=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_POPT), y)
+RABBITMQ_C_CONF_OPTS += -DBUILD_TOOLS=ON 
+RABBITMQ_C_DEPENDENCIES += popt
+else
+RABBITMQ_C_CONF_OPTS += -DBUILD_TOOLS=OFF
+endif
+
+
+$(eval $(cmake-package))
-- 
1.8.3.1
