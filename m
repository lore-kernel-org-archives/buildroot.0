From: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@openwide.fr>
Date: Fri,  3 May 2013 14:35:22 +0200
Subject: [Buildroot] [PATCH 1/1] add daemon mode support to pulseaudio
Message-ID: <1367584523-8491-1-git-send-email-jeremy.rosen@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pulseaudio documentation recommands not using the daemon mode unless you
are on a headless system, but since that is the common case for a
buildroot installation, install the related user and groups

Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
---
 package/multimedia/pulseaudio/Config.in     |   10 +++++++
 package/multimedia/pulseaudio/S50pulseaudio |   39 +++++++++++++++++++++++++++
 package/multimedia/pulseaudio/pulseaudio.mk |   13 +++++++++
 3 files changed, 62 insertions(+)
 create mode 100755 package/multimedia/pulseaudio/S50pulseaudio

diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 03c2613..bdc87ba 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -19,5 +19,15 @@ config BR2_PACKAGE_PULSEAUDIO
 
 	  http://pulseaudio.org
 
+config BR2_PACKAGE_PULSEAUDIO_DAEMON
+	bool "start pulseaudio as a system daemon"
+	depends on BR2_PACKAGE_PULSEAUDIO
+	help
+	  PulseAudio can be started as a system daemon. This is not the
+	  recommanded way of using PulseAudio unless you are building a
+	  headless system
+
+
 comment "pulseaudio requires a toolchain with WCHAR, LARGEFILE and threads support"
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
+
diff --git a/package/multimedia/pulseaudio/S50pulseaudio b/package/multimedia/pulseaudio/S50pulseaudio
new file mode 100755
index 0000000..be71022
--- /dev/null
+++ b/package/multimedia/pulseaudio/S50pulseaudio
@@ -0,0 +1,39 @@
+#!/bin/sh
+#
+# Starts pulseaudio.
+#
+
+
+start() {
+ 	echo -n "Starting pulseaudio: "
+	umask 077
+	/usr/bin/pulseaudio --system --daemonize
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping pulseaudio: "
+	pulseaudio --kill
+	echo "OK"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+  	start
+	;;
+  stop)
+  	stop
+	;;
+  restart|reload)
+  	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
+
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index e78eb42..d326dcc 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -84,4 +84,17 @@ endef
 PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA
 endif
 
+ifeq($(BR2_PACKAGE_PULSEAUDIO_DAEMON);y)
+define PULSEAUDIO_USERS
+	pulse -1 pulse -1 * /var/run/pulse - audio,pulse-access
+endef
+
+define PULSEAUDIO_INSTALL_INIT_SYSV
+	[ -f $(TARGET_DIR)/etc/init.d/S50pulseaudio ] || \
+		$(INSTALL) -D -m 755 package/multimedia/pulseaudio/S50pulseaudio \
+			$(TARGET_DIR)/etc/init.d/S50pulseaudio
+endef
+
+endif
+
 $(eval $(autotools-package))
-- 
1.7.10.4
