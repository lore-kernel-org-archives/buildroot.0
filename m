From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 Dec 2017 11:21:54 +0100
Subject: [Buildroot] [git commit] brltty: new package
Message-ID: <20171217102230.18F2382BD6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=679585bd6185c57dc20fc460dd476aa30eb3c5e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Mario Lang <mlang@blind.guru>
[Thomas:
 - wrap too long CONF_OPTS line that disables all the language
   bindings
 - use an intermediate BRLTTY_TEXT_TABLE variable to store the
   qstripped version of BR2_PACKAGE_BRLTTY_TEXT_TABLE.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                    |  3 ++
 package/Config.in             |  1 +
 package/brltty/Config.in      | 19 ++++++++++
 package/brltty/S10brltty      | 40 +++++++++++++++++++++
 package/brltty/brltty.hash    |  3 ++
 package/brltty/brltty.mk      | 82 +++++++++++++++++++++++++++++++++++++++++++
 package/brltty/brltty.service | 23 ++++++++++++
 7 files changed, 171 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f820b97..af800d8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1047,6 +1047,9 @@ F:	package/udisks/
 N:	Mario Lang <mlang@blind.guru>
 F:	package/lynx/
 
+N:	Mario Lang <mlang@blind.guru>
+F:	package/brltty/
+
 N:	Mario Rugiero <mrugiero@gmail.com>
 F:	package/ratpoison/
 
diff --git a/package/Config.in b/package/Config.in
index 1423147..bd39a37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ endmenu
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
+	source "package/brltty/Config.in"
 	source "package/cbootimage/Config.in"
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
diff --git a/package/brltty/Config.in b/package/brltty/Config.in
new file mode 100644
index 0000000..dfd2ff4
--- /dev/null
+++ b/package/brltty/Config.in
@@ -0,0 +1,19 @@
+config BR2_PACKAGE_BRLTTY
+	bool "brltty"
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  A daemon providing access to the Linux console for a blind
+	  person using a refreshable braille display.
+
+	  http://brltty.com/
+
+if BR2_PACKAGE_BRLTTY
+
+config BR2_PACKAGE_BRLTTY_TEXT_TABLE
+	string "text-table"
+
+endif
+
+comment "brltty needs a toolchain w/ threads, wchar"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
diff --git a/package/brltty/S10brltty b/package/brltty/S10brltty
new file mode 100644
index 0000000..18e274d
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
+		--exec /usr/bin/brltty -- -P /var/run/brltty.pid "$@"
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
index 0000000..3bc2f9c
--- /dev/null
+++ b/package/brltty/brltty.hash
@@ -0,0 +1,3 @@
+sha256 4ebf1df5922df0efccac4795f5bd1c514fc850348c34d9ec0868e2798b565a36 brltty-5.5.tar.xz
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad LICENSE-GPL
+sha256 d80c9d084ebfb50ea1ed91bfbc2410d6ce542097a32c43b00781b83adcb8c77f LICENSE-LGPL
diff --git a/package/brltty/brltty.mk b/package/brltty/brltty.mk
new file mode 100644
index 0000000..5ce0684
--- /dev/null
+++ b/package/brltty/brltty.mk
@@ -0,0 +1,82 @@
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
+BRLTTY_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+
+BRLTTY_CONF_OPTS = \
+	--disable-java-bindings \
+	--disable-lisp-bindings \
+	--disable-ocaml-bindings \
+	--disable-python-bindings \
+	--disable-tcl-bindings
+
+ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS),y)
+BRLTTY_DEPENDENCIES += bluez5_utils
+BRLTTY_CONF_OPTS += --with-bluetooth-package
+else
+BRLTTY_CONF_OPTS += --without-bluetooth-package
+endif
+
+ifeq ($(BR2_PACKAGE_ICU),y)
+BRLTTY_DEPENDENCIES += icu
+BRLTTY_CONF_OPTS += --enable-icu
+else
+BRLTTY_CONF_OPTS += --disable-icu
+endif
+
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+BRLTTY_DEPENDENCIES += ncurses
+BRLTTY_CONF_OPTS += --with-curses
+else
+BRLTTY_CONF_OPTS += --without-curses
+endif
+
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+BRLTTY_DEPENDENCIES += systemd
+BRLTTY_CONF_OPTS += --with-service-package
+else
+BRLTTY_CONF_OPTS += --without-service-package
+endif
+
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+BRLTTY_CONF_OPTS += --enable-i18n
+else
+BRLTTY_CONF_OPTS += --disable-i18n
+endif
+
+BRLTTY_TEXT_TABLE = $(call qstrip,$(BR2_PACKAGE_BRLTTY_TEXT_TABLE))
+ifneq ($(BRLTTY_TEXT_TABLE),)
+BRLTTY_CONF_OPTS += --with-text-table=$(BRLTTY_TEXT_TABLE)
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
index 0000000..070ec94
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
