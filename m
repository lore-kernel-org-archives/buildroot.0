From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Mar 2019 22:26:00 +0100
Subject: [Buildroot] [PATCH 2/2] package/suricata: new package
In-Reply-To: <20190314212600.20918-1-fontaine.fabrice@gmail.com>
References: <20190314212600.20918-1-fontaine.fabrice@gmail.com>
Message-ID: <20190314212600.20918-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Suricata is a free and open source, mature, fast and robust
network threat detection engine.

The Suricata engine is capable of real time intrusion
detection (IDS), inline intrusion prevention (IPS), network
security monitoring (NSM) and offline pcap processing.

https://suricata-ids.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 DEVELOPERS                        |   1 +
 package/Config.in                 |   1 +
 package/suricata/Config.in        |  22 +++++++
 package/suricata/S99suricata      |  39 ++++++++++++
 package/suricata/suricata.hash    |   6 ++
 package/suricata/suricata.mk      | 131 ++++++++++++++++++++++++++++++++++++++
 package/suricata/suricata.service |  13 ++++
 7 files changed, 213 insertions(+)
 create mode 100644 package/suricata/Config.in
 create mode 100644 package/suricata/S99suricata
 create mode 100644 package/suricata/suricata.hash
 create mode 100644 package/suricata/suricata.mk
 create mode 100644 package/suricata/suricata.service

diff --git a/DEVELOPERS b/DEVELOPERS
index 24737b858f..a9bec63849 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -818,6 +818,7 @@ F:	package/oprofile/
 F:	package/pcmanfm/
 F:	package/rygel/
 F:	package/safeclib/
+F:	package/suricata/
 F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/tinymembench/
diff --git a/package/Config.in b/package/Config.in
index bb57afab08..4538ac8307 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2018,6 +2018,7 @@ endif
 	source "package/sslh/Config.in"
 	source "package/strongswan/Config.in"
 	source "package/stunnel/Config.in"
+	source "package/suricata/Config.in"
 	source "package/tcpdump/Config.in"
 	source "package/tcping/Config.in"
 	source "package/tcpreplay/Config.in"
diff --git a/package/suricata/Config.in b/package/suricata/Config.in
new file mode 100644
index 0000000000..2add34956e
--- /dev/null
+++ b/package/suricata/Config.in
@@ -0,0 +1,22 @@
+config BR2_PACKAGE_SURICATA
+	bool "suricata"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_LIBHTP
+	select BR2_PACKAGE_LIBPCAP
+	select BR2_PACKAGE_LIBYAML
+	select BR2_PACKAGE_PCRE
+	help
+	  Suricata is a free and open source, mature, fast and robust
+	  network threat detection engine.
+
+	  The Suricata engine is capable of real time intrusion
+	  detection (IDS), inline intrusion prevention (IPS), network
+	  security monitoring (NSM) and offline pcap processing.
+
+	  https://suricata-ids.org
+
+comment "suricata needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/suricata/S99suricata b/package/suricata/S99suricata
new file mode 100644
index 0000000000..35a034b179
--- /dev/null
+++ b/package/suricata/S99suricata
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+NAME=suricata
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/bin/$NAME
+DAEMON_ARGS="-c /etc/suricata/suricata.yaml -i eth0"
+
+start() {
+	printf "Starting $NAME: "
+	mkdir -p /var/log/suricata
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON -- $DAEMON_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -p $PIDFILE
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
new file mode 100644
index 0000000000..44ada0115a
--- /dev/null
+++ b/package/suricata/suricata.hash
@@ -0,0 +1,6 @@
+# Locally computed:
+sha256 6cda6c80b753ce36483c6be535358b971f3890b9aa27a58c2d2f7e89dd6c6aa0  suricata-4.1.3.tar.gz
+
+# Hash for license files:
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
new file mode 100644
index 0000000000..4b1e90435a
--- /dev/null
+++ b/package/suricata/suricata.mk
@@ -0,0 +1,131 @@
+################################################################################
+#
+# suricata
+#
+################################################################################
+
+SURICATA_VERSION = 4.1.3
+SURICATA_SITE = https://www.openinfosecfoundation.org/download
+SURICATA_LICENSE = GPL-2.0
+SURICATA_LICENSE_FILES = COPYING LICENSE
+
+SURICATA_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_JANSSON),jansson) \
+	$(if $(BR2_PACKAGE_LIBCAP_NG),libcap-ng) \
+	$(if $(BR2_PACKAGE_LIBEVENT),libevent) \
+	libhtp \
+	$(if $(BR2_PACKAGE_LIBNFNETLINK),libnfnetlink) \
+	libpcap \
+	libyaml \
+	$(if $(BR2_PACKAGE_LZ4),lz4) \
+	$(if $(BR2_PACKAGE_LZMA),lzma) \
+	pcre
+
+SURICATA_CONF_OPTS = \
+	--disable-pie \
+	--disable-rust \
+	--disable-suricata-update \
+	--enable-non-bundled-htp
+
+# install: install binaries
+# install-conf: install initial configuration files
+# install-full: install binaries, configuration and rules (rules will be
+#               download through wget/curl)
+SURICATA_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install install-conf
+
+ifeq ($(BR2_PACKAGE_FILE),y)
+SURICATA_DEPENDENCIES += file
+SURICATA_CONF_OPTS += --enable-libmagic
+else
+SURICATA_CONF_OPTS += --disable-libmagic
+endif
+
+ifeq ($(BR2_PACKAGE_GEOIP),y)
+SURICATA_DEPENDENCIES += geoip
+SURICATA_CONF_OPTS += --enable-geoip
+else
+SURICATA_CONF_OPTS += --disable-geoip
+endif
+
+ifeq ($(BR2_PACKAGE_HIREDIS),y)
+SURICATA_DEPENDENCIES += hiredis
+SURICATA_CONF_OPTS += --enable-hiredis
+else
+SURICATA_CONF_OPTS += --disable-hiredis
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNET),y)
+SURICATA_DEPENDENCIES += libnet
+SURICATA_CONF_OPTS += --with-libnet-includes=$(STAGING_DIR)/usr/include
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNETFILTER_LOG),y)
+SURICATA_DEPENDENCIES += libnetfilter_log
+SURICATA_CONF_OPTS += --enable-nflog
+else
+SURICATA_CONF_OPTS += --disable-nflog
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNETFILTER_QUEUE),y)
+SURICATA_DEPENDENCIES += libnetfilter_queue
+SURICATA_CONF_OPTS += --enable-nfqueue
+else
+SURICATA_CONF_OPTS += --disable-nfqueue
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNSPR),y)
+SURICATA_DEPENDENCIES += libnspr
+SURICATA_CONF_OPTS += --enable-nspr
+else
+SURICATA_CONF_OPTS += --disable-nspr
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNSS),y)
+SURICATA_DEPENDENCIES += libnss
+SURICATA_CONF_OPTS += --enable-nss
+else
+SURICATA_CONF_OPTS += --disable-nss
+endif
+
+ifeq ($(BR2_PACKAGE_LUA),y)
+SURICATA_CONF_OPTS += --enable-lua
+SURICATA_DEPENDENCIES += lua
+else
+SURICATA_CONF_OPTS += --disable-lua
+endif
+
+ifeq ($(BR2_PACKAGE_LUAJIT),y)
+SURICATA_CONF_OPTS += --enable-luajit
+SURICATA_DEPENDENCIES += luajit
+else
+SURICATA_CONF_OPTS += --disable-luajit
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+SURICATA_CONF_OPTS += --enable-python
+SURICATA_DEPENDENCIES += python
+else
+SURICATA_CONF_OPTS += --disable-python
+endif
+
+ifeq ($(BR2_TOOLCHAIN_HAS_SSP),y)
+SURICATA_CONF_OPTS += --enable-gccprotect
+else
+SURICATA_CONF_OPTS += --disable-gccprotect
+endif
+
+define SURICATA_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/suricata/S99suricata \
+		$(TARGET_DIR)/etc/init.d/S99suricata
+endef
+
+define SURICATA_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/suricata/suricata.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/suricata.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/suricata.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/suricata.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/suricata/suricata.service b/package/suricata/suricata.service
new file mode 100644
index 0000000000..ca0be02dae
--- /dev/null
+++ b/package/suricata/suricata.service
@@ -0,0 +1,13 @@
+[Unit]
+Description=Suricata Intrusion Detection Service
+After=network.target
+
+[Service]
+ExecStartPre=/bin/rm -f /var/run/suricata.pid
+ExecStartPre=/usr/bin/mkdir -p /var/log/suricata
+ExecStart=/usr/bin/suricata -c /etc/suricata/suricata.yaml -i eth0 --pidfile /var/run/suricata.pid
+ExecReload=/bin/kill -USR2 $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.14.1
