From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 21:48:25 +0100
Subject: [Buildroot] [git commit] rabbitmq-c: new package
Message-ID: <20151217205015.CF76E82537@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=31cb23ca0a6ecf8238136520e16a20e077cb8812
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - pass -DBUILD_TOOLS_DOCS=OFF in <pkg>_CONF_OPTS
 - use -DBUILD_SHARED_LIBS and -DBUILD_STATIC_LIBS to enable/disable
   the creation of shared/static libraries depending on the
   configuration.
 - remove trailing spaces.]

Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |  1 +
 package/rabbitmq-c/Config.in       |  7 +++++++
 package/rabbitmq-c/rabbitmq-c.hash |  2 ++
 package/rabbitmq-c/rabbitmq-c.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index b417793..0d11c42 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1077,6 +1077,7 @@ menu "Networking"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
 	source "package/qpid-proton/Config.in"
+	source "package/rabbitmq-c/Config.in"
 	source "package/rtmpdump/Config.in"
 	source "package/slirp/Config.in"
 	source "package/snmppp/Config.in"
diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
new file mode 100644
index 0000000..f3379f2
--- /dev/null
+++ b/package/rabbitmq-c/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_RABBITMQ_C
+	bool "rabbitmq-c"
+	help
+	  This is a C-language AMQP client library for use with v2.0+
+	  of the RabbitMQ broker.
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
index 0000000..42e2548
--- /dev/null
+++ b/package/rabbitmq-c/rabbitmq-c.mk
@@ -0,0 +1,38 @@
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
+RABBITMQ_C_CONF_OPTS = \
+	-DBUILD_API_DOCS=OFF \
+	-DBUILD_TOOLS_DOCS=OFF
+
+ifeq ($(BR2_STATIC_LIBS),y)
+RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF -DBUILD_STATIC_LIBS=ON
+else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
+RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=ON
+else ifeq ($(BR2_SHARED_LIBS),y)
+RABBITMQ_C_CONF_OPTS += -DBUILD_SHARED_LIBS=ON -DBUILD_STATIC_LIBS=OFF
+endif
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
+$(eval $(cmake-package))
