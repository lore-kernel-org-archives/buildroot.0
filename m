From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 4 May 2013 17:16:20 +0200
Subject: [Buildroot] [git commit] add daemon mode support to pulseaudio
Message-ID: <20130504151908.6F59F99A96@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d26b5a26b9cb8179df76c930130a165f4cc188b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pulseaudio documentation recommends not using the daemon mode unless you
are on a headless system, but since that is the common case for a
buildroot installation, install the related user and groups

[Peter: fix typos, ifeq check, unconditionally install into target]
Signed-off-by: J??r??my Rosen <jeremy.rosen@openwide.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/Config.in     |    8 +++++
 package/multimedia/pulseaudio/S50pulseaudio |   39 +++++++++++++++++++++++++++
 package/multimedia/pulseaudio/pulseaudio.mk |   12 ++++++++
 3 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/pulseaudio/Config.in b/package/multimedia/pulseaudio/Config.in
index 03c2613..9a6911e 100644
--- a/package/multimedia/pulseaudio/Config.in
+++ b/package/multimedia/pulseaudio/Config.in
@@ -19,5 +19,13 @@ config BR2_PACKAGE_PULSEAUDIO
 
 	  http://pulseaudio.org
 
+config BR2_PACKAGE_PULSEAUDIO_DAEMON
+	bool "start as a system daemon"
+	depends on BR2_PACKAGE_PULSEAUDIO
+	help
+	  PulseAudio can be started as a system daemon. This is not the
+	  recommended way of using PulseAudio unless you are building a
+	  headless system.
+
 comment "pulseaudio requires a toolchain with WCHAR, LARGEFILE and threads support"
 	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/multimedia/pulseaudio/S50pulseaudio b/package/multimedia/pulseaudio/S50pulseaudio
new file mode 100755
index 0000000..4c6877e
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
+	echo -n "Starting pulseaudio: "
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
+
diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index e78eb42..16df855 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -84,4 +84,16 @@ endef
 PULSEAUDIO_POST_INSTALL_TARGET_HOOKS += PULSEAUDIO_REMOVE_VALA
 endif
 
+ifeq ($(BR2_PACKAGE_PULSEAUDIO_DAEMON),y)
+define PULSEAUDIO_USERS
+	pulse -1 pulse -1 * /var/run/pulse - audio,pulse-access
+endef
+
+define PULSEAUDIO_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 package/multimedia/pulseaudio/S50pulseaudio \
+		$(TARGET_DIR)/etc/init.d/S50pulseaudio
+endef
+
+endif
+
 $(eval $(autotools-package))
