From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 11 Oct 2016 15:45:28 -0400
Subject: [Buildroot] [PATCH 1/2] rabbitmq-server: new package
Message-ID: <1476215129-29979-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/Config.in                            |  1 +
 package/rabbitmq-server/Config.in            | 11 +++++++++++
 package/rabbitmq-server/rabbitmq-server.hash |  2 ++
 package/rabbitmq-server/rabbitmq-server.mk   | 29 ++++++++++++++++++++++++++++
 4 files changed, 43 insertions(+)
 create mode 100644 package/rabbitmq-server/Config.in
 create mode 100644 package/rabbitmq-server/rabbitmq-server.hash
 create mode 100644 package/rabbitmq-server/rabbitmq-server.mk

diff --git a/package/Config.in b/package/Config.in
index 60184ce..9b8616c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1576,6 +1576,7 @@ endif
 	source "package/pure-ftpd/Config.in"
 	source "package/putty/Config.in"
 	source "package/quagga/Config.in"
+	source "package/rabbitmq-server/Config.in"
 	source "package/radvd/Config.in"
 	source "package/rp-pppoe/Config.in"
 	source "package/rpcbind/Config.in"
diff --git a/package/rabbitmq-server/Config.in b/package/rabbitmq-server/Config.in
new file mode 100644
index 0000000..6363b5d
--- /dev/null
+++ b/package/rabbitmq-server/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_RABBITMQ_SERVER
+	bool "rabbitmq-server"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_LIBXSLT
+	help
+	  High-performance AMQP-compliant message broker written in Erlang.
+
+	  http://www.rabbitmq.com
+
+comment "rabbitmq-server needs erlang"
+	depends on !BR2_PACKAGE_ERLANG
\ No newline at end of file
diff --git a/package/rabbitmq-server/rabbitmq-server.hash b/package/rabbitmq-server/rabbitmq-server.hash
new file mode 100644
index 0000000..be21477
--- /dev/null
+++ b/package/rabbitmq-server/rabbitmq-server.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 c696134e863f99191a301288c12d69ff00b7e648107ee52c8686ae047dde1bee  rabbitmq-server-3.6.1.tar.xz
diff --git a/package/rabbitmq-server/rabbitmq-server.mk b/package/rabbitmq-server/rabbitmq-server.mk
new file mode 100644
index 0000000..a912375
--- /dev/null
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -0,0 +1,29 @@
+#############################################################
+#
+# rabbitmq-server
+#
+#############################################################
+
+RABBITMQ_SERVER_VERSION = 3.6.1
+RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
+RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
+RABBITMQ_SERVER_LICENSE = Apache-2.0, BSD-2c, EPL, MIT, MPLv1.1, MPLv2.0
+RABBITMQ_SERVER_LICENSE_FILES = LICENSE LICENSE-APACHE2-ExplorerCanvas \
+				LICENSE-APL2-Rebar LICENSE-APL2-Stomp-Websocket \
+				LICENSE-BSD-base64js LICENSE-BSD-glMatrix \
+				LICENSE-EPL-OTP LICENSE-MIT-EJS10 \
+				LICENSE-MIT-Flot LICENSE-MIT-jQuery164 \
+				LICENSE-MIT-Mochi LICENSE-MIT-Mochiweb \
+				LICENSE-MIT-Sammy060 LICENSE-MIT-SockJS \
+				LICENSE-MPL2 LICENSE-MPL-RabbitMQ
+RABBITMQ_SERVER_DEPENDS = erlang libxslt
+
+define RABBITMQ_SERVER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define RABBITMQ_SERVER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
