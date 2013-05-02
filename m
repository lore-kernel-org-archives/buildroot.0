From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 22:52:50 +0200
Subject: [Buildroot] [git commit] Add package for mongoose web server
Message-ID: <20130502210336.E3954999AA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c85da87012e1e05364aa27e786bf9152847b5325
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop noauth patch, cleanup Config.in, don't install to staging, ..]
Signed-off-by: Charles Manning <cdhmanning@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/mongoose/Config.in   |   10 ++++++++++
 package/mongoose/S85mongoose |   41 +++++++++++++++++++++++++++++++++++++++++
 package/mongoose/mongoose.mk |   26 ++++++++++++++++++++++++++
 4 files changed, 78 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index a530afc..78c394f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -705,6 +705,7 @@ source "package/linphone/Config.in"
 source "package/lrzsz/Config.in"
 source "package/macchanger/Config.in"
 source "package/mii-diag/Config.in"
+source "package/mongoose/Config.in"
 source "package/mongrel2/Config.in"
 source "package/mrouted/Config.in"
 source "package/msmtp/Config.in"
diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
new file mode 100644
index 0000000..7199712
--- /dev/null
+++ b/package/mongoose/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_MONGOOSE
+	bool "mongoose"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	help
+	  Mongoose is a small and easy to use web server
+
+	  https://github.com/valenok/mongoose
+
+comment "mongoose needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/mongoose/S85mongoose b/package/mongoose/S85mongoose
new file mode 100755
index 0000000..e9e8524
--- /dev/null
+++ b/package/mongoose/S85mongoose
@@ -0,0 +1,41 @@
+#!/bin/sh
+#
+# Start/stop the mongoose HTTP server
+#
+
+set -e
+
+PATH=/sbin:/bin:/usr/sbin:/usr/bin
+NAME=mongoose
+DESC="Mongoose HTTP server"
+
+DAEMON=`which mongoose`
+OPTIONS="-max_threads 3 -root /var/www  -ports 80"
+
+[ -e /etc/default/mongoose ] && . /etc/default/mongoose
+
+case "$1" in
+  start)
+	echo "Starting $DESC:"
+	start-stop-daemon -S -x "$DAEMON" -b -- $OPTIONS
+	echo "$NAME."
+	;;
+  stop)
+	echo -n "Stopping $DESC: "
+	start-stop-daemon -K -x "$DAEMON"
+	echo "$NAME."
+	;;
+  restart|force-reload)
+	echo -n "Restarting $DESC: "
+	start-stop-daemon -K -x "$DAEMON"
+	start-stop-daemon -S -x "$DAEMON" -b -- $OPTIONS
+	echo "$NAME."
+	;;
+  *)
+	N=/etc/init.d/$NAME
+	echo "Usage: $N {start|stop|restart|force-reload}" >&2
+	exit 1
+	;;
+esac
+
+exit 0
diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
new file mode 100644
index 0000000..5ebeb24
--- /dev/null
+++ b/package/mongoose/mongoose.mk
@@ -0,0 +1,26 @@
+#############################################################
+#
+# mongoose
+#
+#############################################################
+
+MONGOOSE_VERSION = 3.3
+MONGOOSE_SOURCE = mongoose-$(MONGOOSE_VERSION).tgz
+MONGOOSE_SITE = https://mongoose.googlecode.com/files
+MONGOOSE_LICENSE = MIT
+MONGOOSE_LICENSE_FILES = COPYING
+
+MONGOOSE_CFLAGS = $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -DNO_SSL
+
+define MONGOOSE_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) \
+		linux COPT="$(MONGOOSE_CFLAGS)"
+endef
+
+define MONGOOSE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/mongoose $(TARGET_DIR)/usr/sbin/mongoose
+	$(INSTALL) -D -m 755 package/mongoose/S85mongoose \
+		$(TARGET_DIR)/etc/init.d/S85mongoose
+endef
+
+$(eval $(generic-package))
