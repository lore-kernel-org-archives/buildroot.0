From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 20:31:27 +0200
Subject: [Buildroot] [git commit] upmpdcli: new package
Message-ID: <20140716183158.838179D25E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=603814465271213ecb1885232ec8e8d9cbd666f2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
 - add package to package/Config.in
 - add missing dependencies on thread and largefile, inherited from
   libupnp. Noticed by Yann E. Morin.
 - add installation of default configuration file. Noticed by Yann
   E. Morin.
 - fix the license, it's not GPLv2, but GPLv2+.
 - remove the colon in the user description, noticed by Yann E. Morin.
 - added a patch to fix build with uClibc.
 - fix the init script installation to use a full path as the target.]

Signed-off-by: Joerg Krause <jkrause@posteo.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                 |    1 +
 package/upmpdcli/Config.in                        |   18 +++++
 package/upmpdcli/S99upmpdcli                      |   40 +++++++++++
 package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch |   77 +++++++++++++++++++++
 package/upmpdcli/upmpdcli.mk                      |   28 ++++++++
 5 files changed, 164 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index b363a7c..3f9bc7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -28,6 +28,7 @@ menu "Audio and video applications"
 	source "package/tidsp-binaries/Config.in"
 	source "package/tstools/Config.in"
 	source "package/twolame/Config.in"
+	source "package/upmpdcli/Config.in"
 	source "package/vlc/Config.in"
 	source "package/vorbis-tools/Config.in"
 	source "package/wavpack/Config.in"
diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
new file mode 100644
index 0000000..d89928f
--- /dev/null
+++ b/package/upmpdcli/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_UPMPDCLI
+	bool "upmpdcli"
+	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBUPNP
+	select BR2_PACKAGE_LIBMPDCLIENT
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_LARGEFILE # libupnp
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libupnp
+	help
+	  upmpdcli is a UPnP Media Renderer front-end for MPD, the Music
+	  Player Daemon. It supports UPnP gapless track transitions and
+	  the OpenHome ohMedia services.
+
+	  http://www.lesbonscomptes.com/upmpdcli/
+
+comment "upmpdcli needs a toolchain w/ C++, largefile, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_LARGEFILE || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/upmpdcli/S99upmpdcli b/package/upmpdcli/S99upmpdcli
new file mode 100644
index 0000000..314ea32
--- /dev/null
+++ b/package/upmpdcli/S99upmpdcli
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+NAME=upmpdcli
+DAEMON=/usr/bin/$NAME
+CONFFILE=/etc/$NAME.conf
+PIDFILE=/var/run/$NAME.pid
+DAEMON_ARGS="-D -c $CONFFILE"
+
+# Sanity checks
+test -f $DAEMON || exit 0
+
+do_start() {
+        echo -n "Starting $NAME: "
+        start-stop-daemon --start --quiet --background --exec $DAEMON \
+                -- $DAEMON_ARGS \
+                && echo "OK" || echo "FAIL"
+}
+
+do_stop() {
+        echo -n "Stopping $NAME: "
+        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
+                && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+        start)
+                do_start
+                ;;
+        stop)
+                do_stop
+                ;;
+        restart)
+                do_stop
+                sleep 1
+                do_start
+                ;;
+        *)
+                echo "Usage: $0 {start|stop|restart}"
+                exit 1
+esac
diff --git a/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
new file mode 100644
index 0000000..4935efd
--- /dev/null
+++ b/package/upmpdcli/upmpdcli-0001-uclibc-fixes.patch
@@ -0,0 +1,77 @@
+Add necessary fixes to build with uClibc
+
+ - Missing #include of C library headers
+ - exp10 is not available in uClibc
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/libupnpp/device.cxx
+===================================================================
+--- a/libupnpp/device.cxx
++++ b/libupnpp/device.cxx
+@@ -17,6 +17,7 @@
+ #include "config.h"
+ 
+ #include <time.h>
++#include <errno.h>
+ #include <sys/time.h>
+ 
+ #include <iostream>
+Index: b/libupnpp/soaphelp.cxx
+===================================================================
+--- a/libupnpp/soaphelp.cxx
++++ b/libupnpp/soaphelp.cxx
+@@ -16,6 +16,10 @@
+  */
+ #include "config.h"
+ 
++#include <string.h>
++#include <stdlib.h>
++#include <stdio.h>
++
+ #include <iostream>
+ using namespace std;
+ 
+Index: b/upmpd/upmpd.cxx
+===================================================================
+--- a/upmpd/upmpd.cxx
++++ b/upmpd/upmpd.cxx
+@@ -20,6 +20,7 @@
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <pwd.h>
++#include <errno.h>
+ 
+ #include <string>
+ #include <iostream>
+Index: b/upmpd/upmpdutils.cxx
+===================================================================
+--- a/upmpd/upmpdutils.cxx
++++ b/upmpd/upmpdutils.cxx
+@@ -21,11 +21,14 @@
+ // not linking to Qt or glib just to get path-concatenating
+ // functions...
+ 
++#define _GNU_SOURCE
++
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <sys/types.h>
+ #include <sys/stat.h>
+ #include <sys/file.h>
++#include <stdlib.h>
+ #include <math.h>
+ #include <pwd.h>
+ #include <regex.h>
+@@ -35,6 +38,11 @@
+ #define O_STREAMING 0
+ #endif
+ 
++#ifdef __UCLIBC__
++/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
++#define exp10(x) (exp((x) * log(10)))
++#endif /* __UCLIBC__ */
++
+ #include <iostream>
+ #include <sstream>
+ #include <fstream>
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
new file mode 100644
index 0000000..3942d12
--- /dev/null
+++ b/package/upmpdcli/upmpdcli.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# upmpdcli
+#
+################################################################################
+
+UPMPDCLI_VERSION = 0.7.1
+UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
+UPMPDCLI_LICENSE = GPLv2+
+UPMPDCLI_LICENSE_FILES = COPYING
+UPMPDCLI_DEPENDENCIES = expat libupnp libmpdclient
+
+# Upmpdcli only runs if user upmpdcli exists
+define UPMPDCLI_USERS
+	upmpdcli -1 upmpdcli -1 * - - - Upmpdcli MPD UPnP Renderer Front-End
+endef
+
+define UPMPDCLI_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/upmpdcli/S99upmpdcli $(TARGET_DIR)/etc/init.d/S99upmpdcli
+endef
+
+define UPMPDCLI_INSTALL_CONF_FILE
+	$(INSTALL) -D -m 0755 $(@D)/upmpd/upmpdcli.conf $(TARGET_DIR)/etc/upmpdcli.conf
+endef
+
+UPMPDCLI_POST_INSTALL_TARGET_HOOKS += UPMPDCLI_INSTALL_CONF_FILE
+
+$(eval $(autotools-package))
