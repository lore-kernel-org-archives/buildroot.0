From: Belisko Marek <marek.belisko@gmail.com>
Date: Mon, 3 Sep 2012 22:59:44 +0200
Subject: [Buildroot] adding custom company packages
Message-ID: <CAAfyv35kEYr2i+=vV5dNzJdDYVDRSRf3+eDK8=YvvJNPbV9mLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm following http://www.elinux.org/images/2/2a/Using-buildroot-real-project.pdf
(especially page 28 Project-speci
c packages (2/5))

I have simple QT application which was added to custom subdirectory in package
directory and according presentation everything seems to be fine. But
there is one problem
songPresentation.mk is never called (at least package isn't starting
to build at all).

Any ideas what I'm doing wrong?

Thanks in advance.

Attached is my patch:

diff --git a/package/Config.in b/package/Config.in
index f308de7..a2d9fe2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -696,4 +696,8 @@ source "package/vim/Config.in"
 endif
 endmenu

+menu "SDB project"
+source "package/sdb/songPresentation/Config.in"
+endmenu
+
 endmenu
diff --git a/package/sdb/sdb.mk b/package/sdb/sdb.mk
new file mode 100644
index 0000000..0d23585
--- /dev/null
+++ b/package/sdb/sdb.mk
@@ -0,0 +1 @@
+include package/sdb/*/*.mk
diff --git a/package/sdb/songPresentation/Config.in
b/package/sdb/songPresentation/Config.in
new file mode 100644
index 0000000..f3425fb
--- /dev/null
+++ b/package/sdb/songPresentation/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SONG_PRESENTATION
+	bool "songPresentation"
+	depends on BR2_PACKAGE_QT
+	help
+	  songPresentation is simple presentation of church songs
+
diff --git a/package/sdb/songPresentation/S99songPresentation
b/package/sdb/songPresentation/S99songPresentation
new file mode 100644
index 0000000..38103f2
--- /dev/null
+++ b/package/sdb/songPresentation/S99songPresentation
@@ -0,0 +1,37 @@
+#!/bin/sh
+#
+# Starts song presentation
+#
+
+start() {
+	echo -n "Starting songPresentation: "
+	# Make sure dropbear directory exists
+	start-stop-daemon --start --quiet --background --exec
/usr/bin/songPresentation -qws -display "Multi: LinuxFb:/dev/fb1
LinuxFb:/dev/fb0" -nomouse
+	echo "OK"
+}
+stop() {
+	echo -n "Stopping songPresentation: "
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
diff --git a/package/sdb/songPresentation/songPresentation.mk
b/package/sdb/songPresentation/songPresentation.mk
new file mode 100644
index 0000000..82c45e9
--- /dev/null
+++ b/package/sdb/songPresentation/songPresentation.mk
@@ -0,0 +1,25 @@
+#############################################################
+#
+# song
+#
+#############################################################
+
+SONG_PRESENTATION_VERSION = master
+SONG_PRESENTATION_SITE    = https://github.com/nandra/songPresentation.git
+SONG_PRESENTATION_SITE_METHOD = git
+
+define SONG_PRESENTATION_CONFIGURE_CMDS
+	cd $(@D) && $(QT_QMAKE)
+endef
+
+define SONG_PRESENTATION_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define SONG_PRESENTATION_INSTALL_TARGET_CMDS
+	install -D -m 0755 $(@D)/songPresentation
$(TARGET_DIR)/usr/bin/songPresentation
+	install -D -m 0755 $(@D)/S90songPresentation
$(TARGET_DIR)/etc/init.d/S90songPresentation
+endef
+
+$(eval $(generic-package))
+

mbe


-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
