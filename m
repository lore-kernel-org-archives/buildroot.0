From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 15 Apr 2019 22:44:10 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/suricata: new package
Message-ID: <20190415204410.27463-1-fontaine.fabrice@gmail.com>
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
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Update S99suricata to follow the same template than S02klogd
 - Always disable gccprotect
 - Enable python3
 - Add EnvironmentFile to suricata.service

 DEVELOPERS                        |   1 +
 package/Config.in                 |   1 +
 package/suricata/Config.in        |  22 ++++++
 package/suricata/S99suricata      |  64 +++++++++++++++
 package/suricata/suricata.hash    |   6 ++
 package/suricata/suricata.mk      | 126 ++++++++++++++++++++++++++++++
 package/suricata/suricata.service |  14 ++++
 7 files changed, 234 insertions(+)
 create mode 100644 package/suricata/Config.in
 create mode 100644 package/suricata/S99suricata
 create mode 100644 package/suricata/suricata.hash
 create mode 100644 package/suricata/suricata.mk
 create mode 100644 package/suricata/suricata.service

diff --git a/DEVELOPERS b/DEVELOPERS
index f0df75b844..4772fddc70 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -835,6 +835,7 @@ F:	package/oprofile/
 F:	package/pcmanfm/
 F:	package/rygel/
 F:	package/safeclib/
+F:	package/suricata/
 F:	package/tinycbor/
 F:	package/tinydtls/
 F:	package/tinymembench/
diff --git a/package/Config.in b/package/Config.in
index 260114fe72..1440dcdcab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2035,6 +2035,7 @@ endif
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
index 0000000000..7c2b966521
--- /dev/null
+++ b/package/suricata/S99suricata
@@ -0,0 +1,64 @@
+#!/bin/sh
+
+DAEMON=suricata
+PIDFILE=/var/run/$DAEMON.pid
+
+SURICATA_ARGS="-c /etc/suricata/suricata.yaml -i eth0"
+
+SURICATA_RELOAD=0
+
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	mkdir -p /var/log/suricata
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $SURICATA_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+# SIGUSR2 makes suricata reload rules
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s "$SURICATA_RELOAD" -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+case "$1" in
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
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
index 0000000000..e5884cdfe4
--- /dev/null
+++ b/package/suricata/suricata.mk
@@ -0,0 +1,126 @@
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
+	--disable-gccprotect \
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
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+SURICATA_CONF_OPTS += --enable-python
+SURICATA_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3)
+else
+SURICATA_CONF_OPTS += --disable-python
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
index 0000000000..f5cd46ac48
--- /dev/null
+++ b/package/suricata/suricata.service
@@ -0,0 +1,14 @@
+[Unit]
+Description=Suricata Intrusion Detection Service
+After=network.target
+
+[Service]
+EnvironmentFile=-/etc/default/suricata
+ExecStartPre=/bin/rm -f /var/run/suricata.pid
+ExecStartPre=/usr/bin/mkdir -p /var/log/suricata
+ExecStart=/usr/bin/suricata -c /etc/suricata/suricata.yaml -i eth0 --pidfile /var/run/suricata.pid
+ExecReload=/bin/kill -USR2 $MAINPID
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.20.1
