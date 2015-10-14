From: Chris Packham <judge.packham@gmail.com>
Date: Wed, 14 Oct 2015 21:34:18 +1300
Subject: [Buildroot] [PATCHv3] syslog-ng: New package
In-Reply-To: <20151014100147.205b90f3@free-electrons.com>
References: <20151014100147.205b90f3@free-electrons.com>
Message-ID: <1444811658-16549-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

syslog-ng is an enhanced log daemon, supporting a wide range of input
and output methods: syslog, unstructured text, queueing, SQL & NoSQL.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
Changes since v1:
- add hash file
- use simplified logging configuration for buildroot
- don't install man pages

Changes since v2:
- incorporate review feedback from Thomas

 package/Config.in                |  1 +
 package/syslog-ng/Config.in      | 18 ++++++++++
 package/syslog-ng/S01logging     | 36 +++++++++++++++++++
 package/syslog-ng/syslog-ng.conf | 16 +++++++++
 package/syslog-ng/syslog-ng.hash |  2 ++
 package/syslog-ng/syslog-ng.mk   | 75 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 148 insertions(+)
 create mode 100644 package/syslog-ng/Config.in
 create mode 100644 package/syslog-ng/S01logging
 create mode 100644 package/syslog-ng/syslog-ng.conf
 create mode 100644 package/syslog-ng/syslog-ng.hash
 create mode 100644 package/syslog-ng/syslog-ng.mk

diff --git a/package/Config.in b/package/Config.in
index 8e3c64a..325a381 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1517,6 +1517,7 @@ endif
 	source "package/swupdate/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysklogd/Config.in"
+	source "package/syslog-ng/Config.in"
 endif
 	source "package/systemd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
new file mode 100644
index 0000000..185a8e2
--- /dev/null
+++ b/package/syslog-ng/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_SYSLOG_NG
+	bool "syslog-ng"
+	select BR2_PACKAGE_EVENTLOG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_OPENSSL
+	depends on BR2_USE_WCHAR # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  syslog-ng is an enhanced log daemon, supporting a wide range of input
+	  and output methods: syslog, unstructured text, queueing, SQL & NoSQL
+
+	  https://syslog-ng.org/
+
+comment "syslog-ng needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/syslog-ng/S01logging b/package/syslog-ng/S01logging
new file mode 100644
index 0000000..cb5127a
--- /dev/null
+++ b/package/syslog-ng/S01logging
@@ -0,0 +1,36 @@
+#!/bin/sh
+
+start() {
+	printf "Starting syslog-ng daemon: "
+	start-stop-daemon -S -q -p /var/run/syslog-ng.pid --exec /usr/sbin/syslog-ng
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping syslog-ng daemon: "
+	start-stop-daemon -K -q -p /var/run/syslog-ng.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
+
+case "$1" in
+	start)
+		start
+		;;
+	stop)
+		stop
+		;;
+	restart|reload)
+		restart
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
+
+exit $?
diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
new file mode 100644
index 0000000..0b4a860
--- /dev/null
+++ b/package/syslog-ng/syslog-ng.conf
@@ -0,0 +1,16 @@
+ at version: 3.7
+
+source s_sys {
+	file("/proc/kmsg" program_override("kernel"));
+	unix-stream ("/dev/log");
+	internal();
+};
+
+destination d_all {
+	file("/var/log/messages");
+};
+
+log {
+	source(s_sys);
+	destination(d_all);
+};
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
new file mode 100644
index 0000000..56dc75f
--- /dev/null
+++ b/package/syslog-ng/syslog-ng.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 4c19841b9079b377cd814b1e6ebbf273af41d04d51c648f4c31f19bfadc20220  syslog-ng-3.7.1.tar.gz
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
new file mode 100644
index 0000000..95f09b5
--- /dev/null
+++ b/package/syslog-ng/syslog-ng.mk
@@ -0,0 +1,75 @@
+################################################################################
+#
+# syslog-ng
+#
+################################################################################
+
+SYSLOG_NG_VERSION = 3.7.1
+SYSLOG_NG_SOURCE = syslog-ng-$(SYSLOG_NG_VERSION).tar.gz
+SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
+SYSLOG_NG_LICENSE = LGPLv2.1+ (syslog-ng core), GPLv2+ (modules)
+SYSLOG_NG_LICENSE_FILES = COPYING
+SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
+	eventlog libglib2 openssl pcre
+SYSLOG_NG_CONF_OPTS = --disable-manpages
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+SYSLOG_NG_DEPENDENCIES += python
+SYSLOG_NG_CONF_OPTS += \
+	--enable-python \
+	--with-python=$(PYTHON_VERSION_MAJOR)
+endif
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+SYSLOG_NG_DEPENDENCIES += python3
+SYSLOG_NG_CONF_OPTS += \
+	--enable-python \
+	--with-python=$(PYTHON3_VERSION_MAJOR)
+endif
+ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),)
+SYSLOG_NG_CONF_OPTS += \
+	--disable-python \
+	--without-python
+endif
+
+ifeq ($(BR2_PACKAGE_LIBESMTP),y)
+SYSLOG_NG_DEPENDENCIES += libesmtp
+SYSLOG_NG_CONF_OPTS += --enable-smtp
+else
+SYSLOG_NG_CONF_OPTS += --disable-smtp
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+SYSLOG_NG_DEPENDENCIES += json-c
+SYSLOG_NG_CONF_OPTS += --enable-json
+else
+SYSLOG_NG_CONF_OPTS += --disable-json
+endif
+
+ifeq ($(BR2_INIT_SYSTEMD),y)
+SYSLOG_NG_DEPENDENCIES += systemd
+SYSLOG_NG_CONF_OPTS += \
+	--enable-systemd \
+	--with-systemdsystemunitdir=/usr/lib/systemd/system
+else
+SYSLOG_NG_CONF_OPTS += --disable-systemd
+endif
+
+define SYSLOG_NG_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/syslog-ng/S01logging \
+		$(TARGET_DIR)/etc/init.d/S01logging
+endef
+
+# By default syslog-ng installs a number of sample configuration files.
+# Some of these rely on optional features being enabled. Because of this
+# buildroot uninstalls the shipped config files and provides a simplified
+# configuration.
+define SYSLOG_NG_FIXUP_CONFIG
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		DESTDIR=$(TARGET_DIR) scl-uninstall-local
+	$(INSTALL) -D -m 0644 package/syslog-ng/syslog-ng.conf \
+		$(TARGET_DIR)/etc/syslog-ng.conf
+endef
+
+SYSLOG_NG_POST_INSTALL_TARGET_HOOKS = SYSLOG_NG_FIXUP_CONFIG
+
+$(eval $(autotools-package))
-- 
2.5.3
