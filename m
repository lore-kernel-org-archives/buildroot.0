From: Geoff Levand <geoff@infradead.org>
Date: Thu, 19 May 2016 22:33:25 +0000
Subject: [Buildroot] [PATCH 3/3] etcd: new package
In-Reply-To: <cover.1463696779.git.geoff@infradead.org>
References: <cover.1463696779.git.geoff@infradead.org>
Message-ID: <2693e1ba9409afcdea6b26f0d118c48cdfd0766e.1463696779.git.geoff@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

etcd is a distributed key value store that provides a reliable
way to store data across a cluster of machines.

https://coreos.com/etcd

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 package/Config.in                |  1 +
 package/etcd/Config.in           |  9 ++++++
 package/etcd/S80etcd2            | 33 ++++++++++++++++++++
 package/etcd/etcd.hash           |  2 ++
 package/etcd/etcd.mk             | 67 ++++++++++++++++++++++++++++++++++++++++
 package/etcd/etcd2.service       | 17 ++++++++++
 package/etcd/etcd2_sysv.conf     | 13 ++++++++
 package/etcd/etcd2_tmpfiles.conf |  1 +
 8 files changed, 143 insertions(+)
 create mode 100644 package/etcd/Config.in
 create mode 100644 package/etcd/S80etcd2
 create mode 100644 package/etcd/etcd.hash
 create mode 100644 package/etcd/etcd.mk
 create mode 100644 package/etcd/etcd2.service
 create mode 100644 package/etcd/etcd2_sysv.conf
 create mode 100644 package/etcd/etcd2_tmpfiles.conf

diff --git a/package/Config.in b/package/Config.in
index 9d668bf..1825b6d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1381,6 +1381,7 @@ endif
 	source "package/dnsmasq/Config.in"
 	source "package/drbd-utils/Config.in"
 	source "package/dropbear/Config.in"
+	source "package/etcd/Config.in"
 	source "package/ebtables/Config.in"
 	source "package/ejabberd/Config.in"
 	source "package/ethtool/Config.in"
diff --git a/package/etcd/Config.in b/package/etcd/Config.in
new file mode 100644
index 0000000..f7f19c0
--- /dev/null
+++ b/package/etcd/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_ETCD
+	bool "etcd"
+	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+	depends on BR2_aarch64 || BR2_i386 || BR2_x86_64
+	help
+	  etcd is a distributed key value store that provides a reliable
+	  way to store data across a cluster of machines.
+
+	  https://coreos.com/etcd
diff --git a/package/etcd/S80etcd2 b/package/etcd/S80etcd2
new file mode 100644
index 0000000..f6727d8
--- /dev/null
+++ b/package/etcd/S80etcd2
@@ -0,0 +1,33 @@
+#!/bin/sh
+
+DAEMON=/usr/bin/etcd2
+CONFIG=/etc/etcd2.conf
+
+[ -x $DAEMON ] || exit 0
+[ -f $CONFIG ] || exit 0
+
+source $CONFIG
+
+case "$1" in
+	start)
+		printf "Starting etcd daemon: "
+		[ -n $ETCD_DATA_DIR ] || [ -d $ETCD_DATA_DIR ] || mkdir -p $ETCD_DATA_DIR
+		start-stop-daemon -S -x $DAEMON
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	stop)
+		printf "Stopping etcd daemon: "
+		start-stop-daemon -K -x $DAEMON
+		[ $? = 0 ] && echo "OK" || echo "FAIL"
+		;;
+	restart|reload|force-reload)
+		$0 stop || true
+		sleep 1
+		$0 start
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload|force-reload}"
+		exit 1
+esac
+
+exit 0
diff --git a/package/etcd/etcd.hash b/package/etcd/etcd.hash
new file mode 100644
index 0000000..0802793
--- /dev/null
+++ b/package/etcd/etcd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256 c08f68c3d21929ed3683fe94acefcd871bb3c4339117e745033bf2fb990966a9  v2.3.4.tar.gz
diff --git a/package/etcd/etcd.mk b/package/etcd/etcd.mk
new file mode 100644
index 0000000..223745d
--- /dev/null
+++ b/package/etcd/etcd.mk
@@ -0,0 +1,67 @@
+################################################################################
+#
+# etcd
+#
+################################################################################
+ETCD_VERSION = v2.3.4
+ETCD_SITE = https://github.com/coreos/etcd/archive
+ETCD_SOURCE = $(ETCD_VERSION).tar.gz
+
+ETCD_LICENSE = Apache-2.0
+ETCD_LICENSE_FILES = LICENSE
+
+ETCD_DEPENDENCIES = host-go
+
+ETCD_MAKE_ENV = \
+	$(HOST_GO_TARGET_ENV) \
+	GOBIN="$(@D)/bin" \
+	GOPATH="$(@D)/gopath" \
+	CGO_ENABLED=0 \
+
+ETCD_REPO_PATH = github.com/coreos/etcd
+
+ETCD_GLDFLAGS = \
+	-X $(ETCD_REPO_PATH)/version.GitSHA=$(ETCD_VERSION) \
+	-extldflags '-static'
+
+define ETCD_CONFIGURE_CMDS
+	# Put sources at prescribed GOPATH location.
+	mkdir -p $(@D)/gopath/src/github.com/coreos
+	ln -s $(@D) $(@D)/gopath/src/$(ETCD_REPO_PATH)
+endef
+
+define ETCD_BUILD_CMDS
+	cd $(@D) && $(ETCD_MAKE_ENV) $(HOST_GO_ROOT)/bin/go \
+		build -v -x -ldflags "$(FLANNEL_GLDFLAGS)" \
+		-o $(@D)/bin/etcd $(ETCD_REPO_PATH)
+	cd $(@D) && $(ETCD_MAKE_ENV) $(HOST_GO_ROOT)/bin/go \
+		build -v -x -ldflags "$(FLANNEL_GLDFLAGS)" \
+		-o $(@D)/bin/etcdctl $(ETCD_REPO_PATH)/etcdctl
+endef
+
+define ETCD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/etcd $(TARGET_DIR)/usr/bin/etcd2
+	$(INSTALL) -D -m 0755 $(@D)/bin/etcdctl $(TARGET_DIR)/usr/bin/etcdctl
+endef
+
+define ETCD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/etcd/etcd2_sysv.conf \
+		$(TARGET_DIR)/etc/etcd2.conf
+	$(INSTALL) -m 0755 -D package/etcd/S80etcd2 \
+		$(TARGET_DIR)/etc/init.d/S80etcd2
+endef
+
+define ETCD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/etcd/etcd2.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/etcd2.service
+
+	$(INSTALL) -D -m 644 package/etcd/etcd2_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/etcd2.config
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -sf /usr/lib/systemd/system/etcd2.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/etcd2.service
+endef
+
+$(eval $(generic-package))
diff --git a/package/etcd/etcd2.service b/package/etcd/etcd2.service
new file mode 100644
index 0000000..288a0db
--- /dev/null
+++ b/package/etcd/etcd2.service
@@ -0,0 +1,17 @@
+[Unit]
+Description=etcd2
+Conflicts=etcd.service
+
+[Service]
+User=etcd
+Type=notify
+Environment=ETCD_DATA_DIR=/var/lib/etcd2
+Environment=ETCD_NAME=%m
+ExecStart=/usr/bin/etcd2
+Restart=always
+RestartSec=10s
+LimitNOFILE=40000
+TimeoutStartSec=0
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/etcd/etcd2_sysv.conf b/package/etcd/etcd2_sysv.conf
new file mode 100644
index 0000000..2e397e9
--- /dev/null
+++ b/package/etcd/etcd2_sysv.conf
@@ -0,0 +1,13 @@
+# See https://coreos.com/etcd/docs/latest/configuration.html
+
+ETCD_NAME=default
+#ETCD_DISCOVERY=""
+#ETCD_DEBUG="true"
+
+ETCD_DATA_DIR="/var/lib/etcd"
+
+ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"
+ETCD_LISTEN_PEER_URLS="http://0.0.0.0:2380"
+
+ETCD_ADVERTISE_CLIENT_URLS="http://localhost:2379"
+ETCD_INITIAL_ADVERTISE_PEER_URLS="http://localhost:2380"
diff --git a/package/etcd/etcd2_tmpfiles.conf b/package/etcd/etcd2_tmpfiles.conf
new file mode 100644
index 0000000..d8bfc78
--- /dev/null
+++ b/package/etcd/etcd2_tmpfiles.conf
@@ -0,0 +1 @@
+d    /var/lib/etcd2 0755 etcd etcd - -
-- 
2.5.0
