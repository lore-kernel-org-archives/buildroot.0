From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Sep 2016 20:52:25 +0200
Subject: [Buildroot] [PATCH 1/1] motion: new package
Message-ID: <1474051945-36626-1-git-send-email-fabrice.fontaine@orange.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
---
 package/Config.in                                  |  1 +
 package/motion/0001-Fix-jpeg-turbo-detection.patch | 28 ++++++++
 ...detection-of-sqlite3-when-cross-compiling.patch | 49 ++++++++++++++
 .../0003-Fix-LIBS-when-jpeg-turbo-is-enabled.patch | 29 +++++++++
 .../0004-Change-without-sdl-to-with-sdl-DIR.patch  | 60 ++++++++++++++++++
 package/motion/Config.in                           | 15 +++++
 package/motion/S99motion                           | 37 +++++++++++
 package/motion/motion.hash                         |  2 +
 package/motion/motion.mk                           | 74 ++++++++++++++++++++++
 package/motion/motion.service                      | 10 +++
 10 files changed, 305 insertions(+)
 create mode 100644 package/motion/0001-Fix-jpeg-turbo-detection.patch
 create mode 100644 package/motion/0002-Fix-detection-of-sqlite3-when-cross-compiling.patch
 create mode 100644 package/motion/0003-Fix-LIBS-when-jpeg-turbo-is-enabled.patch
 create mode 100644 package/motion/0004-Change-without-sdl-to-with-sdl-DIR.patch
 create mode 100644 package/motion/Config.in
 create mode 100644 package/motion/S99motion
 create mode 100644 package/motion/motion.hash
 create mode 100644 package/motion/motion.mk
 create mode 100644 package/motion/motion.service

diff --git a/package/Config.in b/package/Config.in
index 332f05d..bd8bf25 100644
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
diff --git a/package/motion/0001-Fix-jpeg-turbo-detection.patch b/package/motion/0001-Fix-jpeg-turbo-detection.patch
new file mode 100644
index 0000000..e02418b
--- /dev/null
+++ b/package/motion/0001-Fix-jpeg-turbo-detection.patch
@@ -0,0 +1,28 @@
+From 6bc90c0cba58ab6ca869e2463eead78031237c14 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Thu, 15 Sep 2016 14:39:54 +0200
+Subject: [PATCH 1/1] Fix jpeg-turbo detection
+
+Do not only check for static libjpeg.a but also for dynamic libjpeg.so
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 140f4f4..f069ccc 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -273,7 +273,7 @@ if test "${JPEG_TURBO}" = "no"; then
+     AC_MSG_RESULT(skipping)
+ else
+     AC_MSG_CHECKING(for libjpeg-turbo in -> [${JPEG_TURBO}] <-)
+-    if test -f ${JPEG_TURBO}/lib/libjpeg.a ; then
++    if test -f ${JPEG_TURBO}/lib/libjpeg.a -o ${JPEG_TURBO}/lib/libjpeg.so; then
+         AC_MSG_RESULT(found)
+         JPEG_TURBO_OK="found"
+     else
+-- 
+2.7.4
+
diff --git a/package/motion/0002-Fix-detection-of-sqlite3-when-cross-compiling.patch b/package/motion/0002-Fix-detection-of-sqlite3-when-cross-compiling.patch
new file mode 100644
index 0000000..2d5c761
--- /dev/null
+++ b/package/motion/0002-Fix-detection-of-sqlite3-when-cross-compiling.patch
@@ -0,0 +1,49 @@
+From 13838aa67f4531536d2db99318d87e3d3ffef8e7 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Thu, 15 Sep 2016 14:44:25 +0200
+Subject: [PATCH 2/2] Fix detection of sqlite3 when cross-compiling
+
+Replace usage of AC_CHECK_FILE by test -f to check the existence of
+sqlite3.c as AC_CHECK_FILE does not work when cross-compiling
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ configure.ac | 10 +++-------
+ 1 file changed, 3 insertions(+), 7 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index f069ccc..0f18f08 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -460,16 +460,13 @@ else
+ 
+     # first we check to see if the sqlite3 amalgamation (sqlite3.c), is in with our source
+     # this is the prefered way to use sqlite
+-    AC_CHECK_FILE([sqlite3.c],
+-        [
++    if test -f sqlite3.c; then
+         SQLITE3_SUPPORT="yes"
+         VIDEO="$VIDEO sqlite3.o"
+         TEMP_LIBS="$TEMP_LIBS -ldl"
+         AC_DEFINE([HAVE_SQLITE3],1,[Define to 1 if you have SQLITE3])
+         AC_DEFINE([HAVE_SQLITE3_EMBEDDED],1,[Define to 1 if you have SQLITE3 embedded support])
+-        ]
+-        ,
+-        [
++    else
+         # if sqlite3.c is not found then we look for the shared library
+         AC_CHECK_LIB(sqlite3, sqlite3_open,
+             [
+@@ -478,8 +475,7 @@ else
+             AC_DEFINE([HAVE_SQLITE3],1,[Define to 1 if you have SQLITE3 shared library support])
+             ]
+         )
+-        ]
+-    )
++    fi
+ 
+     CFLAGS=$saved_CFLAGS
+     LIBS=$saved_LIBS
+-- 
+2.7.4
+
diff --git a/package/motion/0003-Fix-LIBS-when-jpeg-turbo-is-enabled.patch b/package/motion/0003-Fix-LIBS-when-jpeg-turbo-is-enabled.patch
new file mode 100644
index 0000000..7164b94
--- /dev/null
+++ b/package/motion/0003-Fix-LIBS-when-jpeg-turbo-is-enabled.patch
@@ -0,0 +1,29 @@
+From 0dd05d26d352f86c30c311bdeb1c2bd123b83ef8 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Thu, 15 Sep 2016 23:21:48 +0200
+Subject: [PATCH 3/3] Fix LIBS when jpeg-turbo is enabled
+
+When jpeg-turbo was enabled, LIBS was uncorrectly set: -lpthread, -lm,
+... was lost
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0f18f08..ff45eba 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -290,7 +290,7 @@ if test "${JPEG_TURBO_OK}" = "found"; then
+     CFLAGS="$CFLAGS -I${JPEG_TURBO}/include"
+     LIBS="$LIBS -L${JPEG_TURBO}/lib -ljpeg"
+     AC_CHECK_LIB(jpeg, jpeg_start_compress,
+-        [ TEMP_LIBS="$LIBS"
++        [ TEMP_LIBS="$TEMP_LIBS -L${JPEG_TURBO}/lib -ljpeg"
+           TEMP_CFLAGS="${CFLAGS}"
+           TEMP_LDFLAGS="$TEMP_LDFLAGS $LDFLAGS"
+           JPEG_SUPPORT="yes"],,)
+-- 
+2.5.0
+
diff --git a/package/motion/0004-Change-without-sdl-to-with-sdl-DIR.patch b/package/motion/0004-Change-without-sdl-to-with-sdl-DIR.patch
new file mode 100644
index 0000000..67cdb74
--- /dev/null
+++ b/package/motion/0004-Change-without-sdl-to-with-sdl-DIR.patch
@@ -0,0 +1,60 @@
+From 30572b8e4e85b560ba991bc192992969544f5ea3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fabrice.fontaine@orange.com>
+Date: Fri, 16 Sep 2016 20:08:20 +0200
+Subject: [PATCH 4/4] Change --without-sdl to --with-sdl=[DIR]
+
+With this modification, the user will be able to specify the path to
+sdl-config which can be outside his path (for example on embedded
+buildsystem such as buildroot)
+
+Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
+---
+ configure.ac | 25 ++++++++++++-------------
+ 1 file changed, 12 insertions(+), 13 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index ff45eba..7f4a88c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -224,26 +224,25 @@ fi
+ #
+ SDL_SUPPORT="no"
+ AC_ARG_WITH(sdl,
+-[  --without-sdl           Compile without sdl support to get stream in SDL window.
++[  --with-sdl[=DIR]   Specify the prefix for the install path for
++                      sdl-config to get stream in SDL window (optional).
+ ],
+-[],
++[SDL_SUPPORT="$withval"],
+ [])
+ AC_MSG_CHECKING(for sdl)
+-if test "x$withval" = "xno"; then
++if test "${SDL_SUPORT}" = "xno"; then
+ 	AC_MSG_RESULT(skipped)
+ else
+-    CONFIG_SDL='sdl-config'
++	CONFIG_SDL=${SDL_SUPPORT}/'sdl-config'
+ 	if test -z "`($CONFIG_SDL --version) 2>/dev/null`" ;then
+ 		AC_MSG_RESULT(no)
+-		if test "$withval" = "yes"; then
+-			echo ""
+-			echo "****************************************************"
+-			echo "* sdl-config could not be found. Please install it *"
+-			echo "* and remove the --with-sdl configure argument.    *"
+-			echo "* libSDL can be found at http://www.libsdl.org     *"
+-			echo "****************************************************"
+-			echo ""
+-		fi
++		echo ""
++		echo "****************************************************"
++		echo "* sdl-config could not be found. Please install it *"
++		echo "* and remove the --with-sdl configure argument.    *"
++		echo "* libSDL can be found at http://www.libsdl.org     *"
++		echo "****************************************************"
++		echo ""
+ 	else
+ 		AC_MSG_RESULT(yes)
+ 		SDL_SUPPORT="yes"
+-- 
+2.5.0
+
diff --git a/package/motion/Config.in b/package/motion/Config.in
new file mode 100644
index 0000000..90f428e
--- /dev/null
+++ b/package/motion/Config.in
@@ -0,0 +1,15 @@
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
index 0000000..6414d82
--- /dev/null
+++ b/package/motion/motion.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	0d1702c7958fd03b99bf4fdcb45d8e604864e5867034f825f2fc543e8be64549	motion-release-3.4.1.tar.gz
diff --git a/package/motion/motion.mk b/package/motion/motion.mk
new file mode 100644
index 0000000..95c4298
--- /dev/null
+++ b/package/motion/motion.mk
@@ -0,0 +1,74 @@
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
+MOTION_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_JPEG_TURBO),y)
+MOTION_CONF_OPTS += --with-jpeg-turbo=$(STAGING_DIR)/usr
+endif
+
+ifeq ($(BR2_PACKAGE_FFMPEG_SWSCALE),y)
+MOTION_DEPENDENCIES += ffmpeg 
+else
+MOTION_CONF_OPTS += --without-ffmpeg
+endif
+
+ifeq ($(BR2_PACKAGE_MYSQL),y)
+MOTION_DEPENDENCIES += mysql
+MOTION_CONF_OPTS += --with-mysql-include=$(STAGING_DIR)/usr/include/mysql
+MOTION_CONF_OPTS += --with-mysql-lib=$(STAGING_DIR)/usr/lib
+else
+MOTION_CONF_OPTS += --without-mysql
+endif
+
+ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
+MOTION_DEPENDENCIES += postgresql
+MOTION_CONF_OPTS += --with-pgsql-include=$(STAGING_DIR)/usr/include
+MOTION_CONF_OPTS += --with-pgsql-lib=$(STAGING_DIR)/usr/lib
+else
+MOTION_CONF_OPTS += --without-postgresql
+endif
+
+ifeq ($(BR2_PACKAGE_SDL),y)
+MOTION_DEPENDENCIES += sdl
+MOTION_CONF_OPTS += --with-sdl=$(STAGING_DIR)/usr/bin
+else
+MOTION_CONF_OPTS += --without-sdl
+endif
+
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+MOTION_DEPENDENCIES += sqlite
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
index 0000000..7b9a457
--- /dev/null
+++ b/package/motion/motion.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Motion camera monitoring system
+After=network.target
+
+[Service]
+ExecStart=/usr/bin/motion -b
+Restart=always
+
+[Install]
+WantedBy=multi-user.target
-- 
2.5.0
