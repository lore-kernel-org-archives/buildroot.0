From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Tue, 25 Oct 2016 11:49:07 -0400
Subject: [Buildroot] [PATCH v2 1/2] rabbitmq-server: new package
Message-ID: <1477410548-9977-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - Add symlinks to rabbitmq control programs so that they show up
    in /usr/sbin (per Peter Korsgaard)
  - Added init scripts to automatically start rabbitmq-server (per
    Peter)
  - In the license details, list RabbitMQ's license first (per Peter)
  - Add "select BR2_PACKAGE_OPENSSL" after testing in a minimal
    configuration.

 package/Config.in                               |  1 +
 package/rabbitmq-server/Config.in               | 13 ++++++
 package/rabbitmq-server/S50rabbitmq-server      | 36 ++++++++++++++++
 package/rabbitmq-server/rabbitmq-server.hash    |  2 +
 package/rabbitmq-server/rabbitmq-server.mk      | 55 +++++++++++++++++++++++++
 package/rabbitmq-server/rabbitmq-server.service | 15 +++++++
 6 files changed, 122 insertions(+)
 create mode 100644 package/rabbitmq-server/Config.in
 create mode 100755 package/rabbitmq-server/S50rabbitmq-server
 create mode 100644 package/rabbitmq-server/rabbitmq-server.hash
 create mode 100644 package/rabbitmq-server/rabbitmq-server.mk
 create mode 100644 package/rabbitmq-server/rabbitmq-server.service

diff --git a/package/Config.in b/package/Config.in
index 9399f63..e8ec723 100644
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
index 0000000..6a323af
--- /dev/null
+++ b/package/rabbitmq-server/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_RABBITMQ_SERVER
+	bool "rabbitmq-server"
+	depends on BR2_PACKAGE_ERLANG
+	select BR2_PACKAGE_LIBXSLT
+	select BR2_PACKAGE_OPENSSL # Required to build Erlang's crypto and ssl
+	                           # applications
+	help
+	  High-performance AMQP-compliant message broker written in Erlang.
+
+	  http://www.rabbitmq.com
+
+comment "rabbitmq-server needs erlang"
+	depends on !BR2_PACKAGE_ERLANG
diff --git a/package/rabbitmq-server/S50rabbitmq-server b/package/rabbitmq-server/S50rabbitmq-server
new file mode 100755
index 0000000..1a34a61
--- /dev/null
+++ b/package/rabbitmq-server/S50rabbitmq-server
@@ -0,0 +1,36 @@
+#!/bin/sh
+#
+# Start/stop rabbitmq-server
+#
+
+INSTALLUSER=rabbitmq
+RUNDIR=/var/run/rabbitmq
+
+# Create RUNDIR.
+mkrundir() {
+    install -d -o "$INSTALLUSER" -g "$INSTALLUSER" "$RUNDIR"
+}
+
+case "$1" in
+  start)
+        mkrundir || exit 1
+        printf "Starting rabbitmq-server: "
+        su -c "/usr/sbin/rabbitmq-server -detached" - "$INSTALLUSER" 2> /dev/null
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+  stop)
+        printf "Stopping rabbitmq-server: "
+        su -c "/usr/sbin/rabbitmqctl stop" - "$INSTALLUSER"
+        [ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+  restart|reload)
+        "$0" stop || true
+        "$0" start
+	;;
+  *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
+
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
index 0000000..8da5cdd
--- /dev/null
+++ b/package/rabbitmq-server/rabbitmq-server.mk
@@ -0,0 +1,55 @@
+#############################################################
+#
+# rabbitmq-server
+#
+#############################################################
+
+RABBITMQ_SERVER_VERSION = 3.6.1
+RABBITMQ_SERVER_SITE = http://www.rabbitmq.com/releases/rabbitmq-server/v$(RABBITMQ_SERVER_VERSION)
+RABBITMQ_SERVER_SOURCE = rabbitmq-server-$(RABBITMQ_SERVER_VERSION).tar.xz
+RABBITMQ_SERVER_LICENSE = MPLv1.1, Apache-2.0, BSD-2c, EPL, MIT, MPLv2.0
+RABBITMQ_SERVER_LICENSE_FILES = LICENSE-MPL-RabbitMQ \
+				LICENSE LICENSE-APACHE2-ExplorerCanvas \
+				LICENSE-APL2-Rebar LICENSE-APL2-Stomp-Websocket \
+				LICENSE-BSD-base64js LICENSE-BSD-glMatrix \
+				LICENSE-EPL-OTP LICENSE-MIT-EJS10 \
+				LICENSE-MIT-Flot LICENSE-MIT-jQuery164 \
+				LICENSE-MIT-Mochi LICENSE-MIT-Mochiweb \
+				LICENSE-MIT-Sammy060 LICENSE-MIT-SockJS \
+				LICENSE-MPL2
+RABBITMQ_SERVER_DEPENDS = erlang libxslt
+RABBITMQ_SERVER_TARGET_BINS = rabbitmq-plugins rabbitmq-server rabbitmqctl rabbitmq-env rabbitmq-defaults
+
+define RABBITMQ_SERVER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define RABBITMQ_SERVER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
+
+	for bin in $(RABBITMQ_SERVER_TARGET_BINS); do \
+		ln -sf /usr/lib/erlang/lib/rabbitmq_server-$(RABBITMQ_SERVER_VERSION)/sbin/$$bin \
+			$(TARGET_DIR)/usr/sbin/$$bin; \
+	done
+endef
+
+define RABBITMQ_SERVER_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/rabbitmq-server/rabbitmq-server.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/rabbitmq-server.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/rabbitmq-server.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rabbitmq-server.service
+endef
+
+define RABBITMQ_SERVER_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/rabbitmq-server/S50rabbitmq-server \
+		$(TARGET_DIR)/etc/init.d/S50rabbitmq-server
+endef
+
+define RABBITMQ_SERVER_USERS
+	rabbitmq -1 rabbitmq -1 * /var/lib/rabbitmq /bin/sh - rabbitmq-server daemon
+endef
+
+$(eval $(generic-package))
diff --git a/package/rabbitmq-server/rabbitmq-server.service b/package/rabbitmq-server/rabbitmq-server.service
new file mode 100644
index 0000000..268b4bd
--- /dev/null
+++ b/package/rabbitmq-server/rabbitmq-server.service
@@ -0,0 +1,15 @@
+[Unit]
+Description=RabbitMQ Messaging Server
+After=syslog.target network.target
+
+[Service]
+Type=simple
+User=rabbitmq
+Group=rabbitmq
+Environment=HOME=/var/lib/rabbitmq
+WorkingDirectory=/var/lib/rabbitmq
+ExecStart=/usr/sbin/rabbitmq-server
+ExecStop=/usr/sbin/rabbitmqctl stop
+
+[Install]
+WantedBy=multi-user.target
--
2.7.4
