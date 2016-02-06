From: Lucas Zampar Bernardi <lucas.zampar@gmail.com>
Date: Sat,  6 Feb 2016 13:11:43 -0200
Subject: [Buildroot] [PATCH v3] ShellInABox: new package
Message-ID: <1454771503-116304-1-git-send-email-lucas.zampar@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch add new package ShellInABox that is a program that implements
an in-browser command line shell. It works on any JavaScript and CSS
enabled web browser.

Installing it on your Linux board you can get the access to the command
prompt directly from web without any needs to install terminal software
on your PC.

Signed-off-by: Lucas Zampar Bernardi <lucas.zampar@gmail.com>
---

Changes v2 -> v3:
  - Correct install target
  - Install init script using SYSV makefile rule
  - Just compile app with SSL, if OPENSSL package is selected

Changes v1 -> v2:
  - Correct missing double quote at package/Config.in

Signed-off-by: Lucas Zampar Bernardi <lucas.zampar@gmail.com>
---
 package/Config.in                                  |  1 +
 package/shellinabox/Config.in                      | 10 +++++++
 package/shellinabox/S51shellinabox                 | 33 ++++++++++++++++++++++
 .../shellinabox-2.19-remove-static-library.patch   | 12 ++++++++
 package/shellinabox/shellinabox.mk                 | 25 ++++++++++++++++
 5 files changed, 81 insertions(+)
 create mode 100644 package/shellinabox/Config.in
 create mode 100644 package/shellinabox/S51shellinabox
 create mode 100644 package/shellinabox/shellinabox-2.19-remove-static-library.patch
 create mode 100644 package/shellinabox/shellinabox.mk

diff --git a/package/Config.in b/package/Config.in
index 529ad33..52f7cf2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1444,6 +1444,7 @@ endif
 	source "package/sconeserver/Config.in"
 	source "package/ser2net/Config.in"
 	source "package/shairport-sync/Config.in"
+	source "package/shellinabox/Config.in"
 	source "package/smcroute/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
new file mode 100644
index 0000000..1b9525c
--- /dev/null
+++ b/package/shellinabox/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_SHELLINABOX
+       bool "shellinabox"
+       select BR2_PACKAGE_ZLIB
+       help
+       Shell in a box - implements a web server that can
+       export arbitrary command line tools to a web based terminal emulator.
+       This emulator is accessible to any JavaScript and CSS
+       enabled web browser and does not require any additional browser plugins.
+
+         http://shellinabox.googlecode.com
diff --git a/package/shellinabox/S51shellinabox b/package/shellinabox/S51shellinabox
new file mode 100644
index 0000000..b16f03d
--- /dev/null
+++ b/package/shellinabox/S51shellinabox
@@ -0,0 +1,33 @@
+#! /bin/sh
+
+NAME=shellinaboxd
+DAEMON=/usr/bin/$NAME
+ARGS="-s/:LOGIN -t --no-beep -b" # start without SSL support
+
+# Gracefully exit if the package has been removed.
+test -x $DAEMON || exit 0
+
+case "$1" in
+  start)
+    printf "Starting $NAME: "
+    start-stop-daemon -S -q -x $DAEMON -- $ARGS
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+  stop)
+    printf "Stopping $NAME: "
+    start-stop-daemon -K -q -n $NAME
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+  restart|reload)
+    echo "Restarting $NAME: "
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart|reload}" >&2
+    exit 1
+    ;;
+esac
+
+exit 0
diff --git a/package/shellinabox/shellinabox-2.19-remove-static-library.patch b/package/shellinabox/shellinabox-2.19-remove-static-library.patch
new file mode 100644
index 0000000..66b46b7
--- /dev/null
+++ b/package/shellinabox/shellinabox-2.19-remove-static-library.patch
@@ -0,0 +1,12 @@
+diff -rup shellinabox-2.19_original/Makefile.am shellinabox-2.19/Makefile.am
+--- shellinabox-2.19_original/Makefile.am      2016-02-03 14:17:44.699913649 -0200
++++ shellinabox-2.19/Makefile.am       2016-02-03 14:08:59.795376662 -0200
+@@ -126,7 +126,7 @@ BUILT_SOURCES        = shellinabox/beep.
+
+ shellinaboxd_LDADD   = liblogging.la                                          \
+                        libhttp.la
+-shellinaboxd_LDFLAGS = -static
++#shellinaboxd_LDFLAGS = -static
+ ## Added this for compatibility with older versions of autoconf/automake
+ docdir               = ${datadir}/doc/${PACKAGE}
+
diff --git a/package/shellinabox/shellinabox.mk b/package/shellinabox/shellinabox.mk
new file mode 100644
index 0000000..6f84765
--- /dev/null
+++ b/package/shellinabox/shellinabox.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# shellinabox
+#
+################################################################################
+
+SHELLINABOX_VERSION = 2.19
+SHELLINABOX_SOURCE = v$(SHELLINABOX_VERSION).tar.gz
+SHELLINABOX_SITE = https://github.com/shellinabox/shellinabox/archive
+SHELLINABOX_AUTORECONF = YES
+SHELLINABOX_DEPENDENCIES = zlib
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+SHELLINABOX_DEPENDENCIES += openssl
+endif
+
+SHELLINABOX_LICENSE = GPLv2
+
+
+define SHELLINABOX_INSTALL_INIT_SYSV
+       $(INSTALL) -D -m 755 package/shellinabox/S51shellinabox $(TARGET_DIR)/etc/init.d/S51shellinabox
+endef
+
+
+$(eval $(autotools-package))
-- 
2.5.0
