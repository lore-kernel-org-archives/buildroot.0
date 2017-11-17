From: Mario Lang <mlang@blind.guru>
Date: Fri, 17 Nov 2017 09:47:42 +0100
Subject: [Buildroot] [PATCH 1/1] brltty: new package
Message-ID: <20171117084742.13934-1-mlang@blind.guru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A daemon providing access to the Linux console
for a blind person using a refreshable braille display.

Also, add myself to DEVELOPERS.

Signed-off-by: Mario Lang <mlang@blind.guru>
---
 DEVELOPERS                    |  3 +++
 package/Config.in             |  1 +
 package/brltty/Config.in      | 13 +++++++++++++
 package/brltty/S10brltty      | 40 ++++++++++++++++++++++++++++++++++++++++
 package/brltty/brltty.hash    |  3 +++
 package/brltty/brltty.mk      | 38 ++++++++++++++++++++++++++++++++++++++
 package/brltty/brltty.service | 23 +++++++++++++++++++++++
 7 files changed, 121 insertions(+)
 create mode 100644 package/brltty/Config.in
 create mode 100644 package/brltty/S10brltty
 create mode 100644 package/brltty/brltty.hash
 create mode 100644 package/brltty/brltty.mk
 create mode 100644 package/brltty/brltty.service

diff --git a/DEVELOPERS b/DEVELOPERS
index bb81a19883..2d72775c53 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1008,6 +1008,9 @@ F:	package/polkit/
 F:	package/sg3_utils/
 F:	package/udisks/
 
+N:	Mario Lang <mlang@blind.guru>
+F:	package/brltty/
+
 N:	Mario Rugiero <mrugiero@gmail.com>
 F:	package/ratpoison/
 
diff --git a/package/Config.in b/package/Config.in
index fe5ccc434e..83f639d4be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -380,6 +380,7 @@ endmenu
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
+	source "package/brltty/Config.in"
 	source "package/cbootimage/Config.in"
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
diff --git a/package/brltty/Config.in b/package/brltty/Config.in
new file mode 100644
index 0000000000..e856307eb7
--- /dev/null
+++ b/package/brltty/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_BRLTTY
+	bool "brltty"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  A daemon providing access to the Linux console
+	  for a blind person using a refreshable braille display.
+
+	  http://brltty.com/
+
+comment "brltty needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
+
diff --git a/package/brltty/S10brltty b/package/brltty/S10brltty
new file mode 100644
index 0000000000..8772a82350
--- /dev/null
+++ b/package/brltty/S10brltty
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# brltty        Starts brltty.
+#
+
+start() {
+	printf "Starting brltty: "
+	start-stop-daemon -S -q -p /var/run/brltty.pid \
+		--exec /usr/bin/brltty -- -P /var/run/brltty.pid -q "$@"
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping brltty: "
+	start-stop-daemon -K -q -p /var/run/brltty.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start "$@"
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
+  force-reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart|force-reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/brltty/brltty.hash b/package/brltty/brltty.hash
new file mode 100644
index 0000000000..3bc2f9cf54
--- /dev/null
+++ b/package/brltty/brltty.hash
@@ -0,0 +1,3 @@
+sha256 4ebf1df5922df0efccac4795f5bd1c514fc850348c34d9ec0868e2798b565a36 brltty-5.5.tar.xz
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad LICENSE-GPL
+sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f LICENSE-LGPL
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
new file mode 100644
index 0000000000..8370f570c4
--- /dev/null
+++ b/package/brltty/brltty.mk
@@ -0,0 +1,38 @@
+################################################################################
+#
+# brltty
+#
+################################################################################
+
+BRLTTY_VERSION = 5.5
+BRLTTY_SOURCE = brltty-$(BRLTTY_VERSION).tar.xz
+BRLTTY_SITE = http://brltty.com/archive
+BRLTTY_INSTALL_STAGING_OPTS = INSTALL_ROOT=$(STAGING_DIR) install
+BRLTTY_INSTALL_TARGET_OPTS = INSTALL_ROOT=$(TARGET_DIR) install
+BRLTTY_LICENSE_FILES = LICENSE-GPL LICENSE-LGPL
+
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+BRLTTY_DEPENDENCIES += bluez5_utils
+endif
+
+define BRLTTY_INSTALL_CONF
+	$(INSTALL) -D -m 644 $(@D)/Documents/brltty.conf $(TARGET_DIR)/etc/brltty.conf
+endef
+
+BRLTTY_POST_INSTALL_TARGET_HOOKS += BRLTTY_INSTALL_CONF
+
+define BRLTTY_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/brltty/S10brltty \
+		   $(TARGET_DIR)/etc/init.d/S10brltty
+endef
+
+define BRLTTY_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 package/brltty/brltty.service \
+		   $(TARGET_DIR)/usr/lib/systemd/system/brltty.service
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/sysinit.target.wants
+	ln -fs  ../../../../usr/lib/systemd/system/brltty.service \
+		$(TARGET_DIR)/etc/systemd/system/sysinit.target.wants/brltty.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/brltty/brltty.service b/package/brltty/brltty.service
new file mode 100644
index 0000000000..070ec94b7c
--- /dev/null
+++ b/package/brltty/brltty.service
@@ -0,0 +1,23 @@
+[Unit]
+Description=Braille Device Support
+Documentation=man:brltty(1)
+Documentation=http://brltty.com/
+
+DefaultDependencies=no
+Before=sysinit.target
+After=systemd-udev-settle.service
+Wants=systemd-udev-settle.service
+
+[Service]
+Type=simple
+ExecStart=/usr/bin/brltty --no-daemon
+TimeoutStartSec=5
+TimeoutStopSec=10
+Restart=always
+RestartSec=30
+Nice=-10
+OOMScoreAdjust=-900
+
+[Install]
+WantedBy=sysinit.target
+
-- 
2.15.0
