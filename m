From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Oct 2015 17:31:06 +0200
Subject: [Buildroot] [git commit] syslog-ng: New package
Message-ID: <20151018153354.507E581D8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=75e38abaf7bbeb45c1311c084267b5cfd723d753
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

syslog-ng is an enhanced log daemon, supporting a wide range of input
and output methods: syslog, unstructured text, queueing, SQL & NoSQL.

[Thomas:
 - Rewrap Config.in.help text
 - Pass --pidfile option when starting syslog-ng so that its PID file
   is created in /var/run/syslog-ng.pid, which allows
   start-stop-daemon to actually stop syslog-ng. Without this,
   S01logging was not able to stop syslog-ng.
 - Pass the executable path at stop time in S01logging, so that
   start-stop-daemon can check we're not incorrectly stopping
   something completely different.
 - Add busybox as a dependency of syslog-ng if busybox is enabled,
   since we want to override Busybox's S01logging init script.
 - Simplify the python condition, since python and python3 are
   mutually exclusive.
 - Rewrap the comment above SYSLOG_NG_FIXUP_CONFIG.]

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                |    1 +
 package/syslog-ng/Config.in      |   19 +++++++++
 package/syslog-ng/S01logging     |   38 ++++++++++++++++++
 package/syslog-ng/syslog-ng.conf |   16 ++++++++
 package/syslog-ng/syslog-ng.hash |    2 +
 package/syslog-ng/syslog-ng.mk   |   78 ++++++++++++++++++++++++++++++++++++++
 6 files changed, 154 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7746742..7392363 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1519,6 +1519,7 @@ endif
 	source "package/swupdate/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysklogd/Config.in"
+	source "package/syslog-ng/Config.in"
 endif
 	source "package/systemd/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/syslog-ng/Config.in b/package/syslog-ng/Config.in
new file mode 100644
index 0000000..fdc8d9f
--- /dev/null
+++ b/package/syslog-ng/Config.in
@@ -0,0 +1,19 @@
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
+	  syslog-ng is an enhanced log daemon, supporting a wide range
+	  of input and output methods: syslog, unstructured text,
+	  queueing, SQL & NoSQL
+
+	  https://syslog-ng.org/
+
+comment "syslog-ng needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/syslog-ng/S01logging b/package/syslog-ng/S01logging
new file mode 100644
index 0000000..d7c899a
--- /dev/null
+++ b/package/syslog-ng/S01logging
@@ -0,0 +1,38 @@
+#!/bin/sh
+
+start() {
+	printf "Starting syslog-ng daemon: "
+	start-stop-daemon -S -q -p /var/run/syslog-ng.pid \
+		-x /usr/sbin/syslog-ng -- --pidfile /var/run/syslog-ng.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+
+stop() {
+	printf "Stopping syslog-ng daemon: "
+	start-stop-daemon -K -q -p /var/run/syslog-ng.pid \
+		-x /usr/sbin/syslog-ng
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
index 0000000..7371060
--- /dev/null
+++ b/package/syslog-ng/syslog-ng.mk
@@ -0,0 +1,78 @@
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
+# We override busybox's S01logging init script
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+SYSLOG_NG_DEPENDENCIES += busybox
+endif
+
+ifeq ($(BR2_PACKAGE_PYTHON),y)
+SYSLOG_NG_DEPENDENCIES += python
+SYSLOG_NG_CONF_OPTS += \
+	--enable-python \
+	--with-python=$(PYTHON_VERSION_MAJOR)
+else ifeq ($(BR2_PACKAGE_PYTHON3),y)
+SYSLOG_NG_DEPENDENCIES += python3
+SYSLOG_NG_CONF_OPTS += \
+	--enable-python \
+	--with-python=$(PYTHON3_VERSION_MAJOR)
+else
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
+# By default syslog-ng installs a number of sample configuration
+# files. Some of these rely on optional features being
+# enabled. Because of this buildroot uninstalls the shipped config
+# files and provides a simplified configuration.
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
