From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Oct 2016 23:54:21 +0200
Subject: [Buildroot] [git commit] motion: new package
Message-ID: <20161013220208.1443B82268@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7fabade2ab66272acb80f41e7fb5265fc32072f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Motion is a program that monitors the video signal from
cameras. It is able to detect if a significant part of
the picture has changed; in other words, it can detect motion.

https://motion-project.github.io

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in             |  1 +
 package/motion/Config.in      | 17 +++++++++
 package/motion/S99motion      | 37 ++++++++++++++++++
 package/motion/motion.hash    |  4 ++
 package/motion/motion.mk      | 89 +++++++++++++++++++++++++++++++++++++++++++
 package/motion/motion.service | 10 +++++
 6 files changed, 158 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 60184ce..25f1688 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -25,6 +25,7 @@ menu "Audio and video applications"
 	source "package/miraclecast/Config.in"
 	source "package/mjpegtools/Config.in"
 	source "package/modplugtools/Config.in"
+	source "package/motion/Config.in"
 	source "package/mpd/Config.in"
 	source "package/mpd-mpc/Config.in"
 	source "package/mpg123/Config.in"
diff --git a/package/motion/Config.in b/package/motion/Config.in
new file mode 100644
index 0000000..a27e7f9
--- /dev/null
+++ b/package/motion/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_MOTION
+	bool "motion"
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_JPEG
+	help
+	  Motion is a program that monitors the video signal from
+	  cameras. It is able to detect if a significant part of
+	  the picture has changed; in other words, it can detect motion.
+
+	  libv4l has to be selected to be able to use a local camera.
+
+	  https://motion-project.github.io
+
+comment "motion needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/motion/S99motion b/package/motion/S99motion
new file mode 100644
index 0000000..36bfc23
--- /dev/null
+++ b/package/motion/S99motion
@@ -0,0 +1,37 @@
+#!/bin/sh
+
+NAME=motion
+PIDFILE=/var/run/$NAME.pid
+DAEMON=/usr/bin/$NAME
+
+start() {
+	printf "Starting $NAME: "
+	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON
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
+	echo "Usage: $0 {start|stop|restart|reload}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/motion/motion.hash b/package/motion/motion.hash
new file mode 100644
index 0000000..27f66b5
--- /dev/null
+++ b/package/motion/motion.hash
@@ -0,0 +1,4 @@
+# Locally computed:
+sha256	0d1702c7958fd03b99bf4fdcb45d8e604864e5867034f825f2fc543e8be64549	motion-release-3.4.1.tar.gz
+sha256	24e7150b753da04f3477276c36ce5664453965f279196f892668063ca4d6e975	709f626b7ef83a2bb3ef1f77205276207ab27196.patch
+sha256	45ddb1599b850176a319afbcebb7f0bec309c918331da6d5fd6c3cba35387405	72193ccaff83fcb074c9aaa37c5691a8d8a18c7c.patch 
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
new file mode 100644
index 0000000..de29a2a
--- /dev/null
+++ b/package/motion/motion.mk
@@ -0,0 +1,89 @@
+################################################################################
+#
+# motion
+#
+################################################################################
+
+MOTION_VERSION = release-3.4.1
+MOTION_SITE = $(call github,Motion-Project,motion,$(MOTION_VERSION))
+MOTION_LICENSE = GPLv2
+MOTION_LICENSE_FILES = COPYING
+MOTION_DEPENDENCIES = host-pkgconf jpeg
+# From git and configure.ac is patched
+MOTION_AUTORECONF = YES
+
+# This patch fixes detection of sqlite when cross-compiling
+MOTION_PATCH = \
+	https://github.com/Motion-Project/motion/commit/709f626b7ef83a2bb3ef1f77205276207ab27196.patch
+
+# This patch adds --with-sdl=[DIR] option to fix detection of sdl-config
+MOTION_PATCH += \
+	https://github.com/Motion-Project/motion/commit/72193ccaff83fcb074c9aaa37c5691a8d8a18c7c.patch
+
+# motion does not use any specific function of jpeg-turbo, so just relies on
+# jpeg selection
+MOTION_CONF_OPTS += --without-jpeg-turbo
+
+ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
+MOTION_DEPENDENCIES += ffmpeg
+MOTION_CONF_OPTS += --with-ffmpeg
+else
+MOTION_CONF_OPTS += --without-ffmpeg
+endif
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+MOTION_DEPENDENCIES += mysql
+MOTION_CONF_OPTS += \
+	--with-mysql \
+	--with-mysql-include=$(STAGING_DIR)/usr/include/mysql \
+	--with-mysql-lib=$(STAGING_DIR)/usr/lib
+else
+MOTION_CONF_OPTS += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+MOTION_DEPENDENCIES += postgresql
+MOTION_CONF_OPTS += \
+	--with-postgresql \
+	--with-pgsql-include=$(STAGING_DIR)/usr/include \
+	--with-pgsql-lib=$(STAGING_DIR)/usr/lib
+else
+MOTION_CONF_OPTS += --without-postgresql
+endif
+
+ifeq ($(BR2_PACKAGE_SDL),y)
+MOTION_DEPENDENCIES += sdl
+MOTION_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr
+else
+MOTION_CONF_OPTS += --without-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+MOTION_DEPENDENCIES += sqlite
+MOTION_CONF_OPTS += --with-sqlite3
+else
+MOTION_CONF_OPTS += --without-sqlite3
+endif
+
+# Do not use default install target as it installs many unneeded files and
+# directories: docs, examples and init scripts
+define MOTION_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0644 $(@D)/motion-dist.conf \
+		$(TARGET_DIR)/etc/motion.conf
+	$(INSTALL) -D -m 0755 $(@D)/motion $(TARGET_DIR)/usr/bin/motion
+endef
+
+define MOTION_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/motion/S99motion \
+		$(TARGET_DIR)/etc/init.d/S99motion
+endef
+
+define MOTION_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/motion/motion.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/motion.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -sf ../../../../usr/lib/systemd/system/motion.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/motion.service
+endef
+
+$(eval $(autotools-package))
diff --git a/package/motion/motion.service b/package/motion/motion.service
new file mode 100644
index 0000000..c788cd6
--- /dev/null
+++ b/package/motion/motion.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Motion camera monitoring system
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/motion
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
