From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 Dec 2012 22:48:35 +0100
Subject: [Buildroot] [PATCH 2/2] package/tvheadend: new package
In-Reply-To: <cover.1356731295.git.yann.morin.1998@free.fr>
References: <cover.1356731295.git.yann.morin.1998@free.fr>
Message-ID: <4ab6f1e39a08a6057c63ed13336911a9cbcfd54e.1356731295.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                                  |    1 +
 package/tvheadend/Config.in                        |   19 ++++++
 package/tvheadend/S99tvheadend                     |   54 ++++++++++++++++++
 package/tvheadend/accesscontrol.1                  |   13 ++++
 package/tvheadend/etc.default.tvheadend            |    7 ++
 .../tvheadend-no-auto-download-dvbscans.patch      |   60 ++++++++++++++++++++
 package/tvheadend/tvheadend.mk                     |   43 ++++++++++++++
 7 files changed, 197 insertions(+), 0 deletions(-)
 create mode 100644 package/tvheadend/Config.in
 create mode 100644 package/tvheadend/S99tvheadend
 create mode 100644 package/tvheadend/accesscontrol.1
 create mode 100644 package/tvheadend/etc.default.tvheadend
 create mode 100644 package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
 create mode 100644 package/tvheadend/tvheadend.mk

diff --git a/package/Config.in b/package/Config.in
index 3d556b2..bcf0009 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -682,6 +682,7 @@ source "package/tinyhttpd/Config.in"
 source "package/tn5250/Config.in"
 source "package/transmission/Config.in"
 source "package/ttcp/Config.in"
+source "package/tvheadend/Config.in"
 source "package/udpcast/Config.in"
 source "package/ulogd/Config.in"
 source "package/ushare/Config.in"
diff --git a/package/tvheadend/Config.in b/package/tvheadend/Config.in
new file mode 100644
index 0000000..944e31e
--- /dev/null
+++ b/package/tvheadend/Config.in
@@ -0,0 +1,19 @@
+comment "tvheadend requires a toolchain with LARGEFILE support"
+    depends on !BR2_LARGEFILE
+
+config BR2_PACKAGE_TVHEADEND
+	bool "tvheadend"
+	depends on BR2_LARGEFILE
+	select BR2_PACKAGE_OPENSSL
+	help
+	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
+	  DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as
+	  input sources.
+	  
+	  https://www.lonelycoder.com/redmine/projects/tvheadend/
+	  
+	  Note:
+	    - a default user has been created to log in the web configuration
+	      GUI: admin/admin; you can change it at your discretion at runtime.
+	    - if you want Avahi support, you'll need to enable:
+	          Avahi, D-Bus, libdaemon
diff --git a/package/tvheadend/S99tvheadend b/package/tvheadend/S99tvheadend
new file mode 100644
index 0000000..407b873
--- /dev/null
+++ b/package/tvheadend/S99tvheadend
@@ -0,0 +1,54 @@
+#! /bin/sh
+# tvheadend startup script inspired by the Debian one in the package
+
+# Author: Yann E. MORIN <yann.morin.1998@free.fr>
+
+PATH=/usr/sbin:/usr/bin:/sbin:/bin
+NAME=tvheadend
+DAEMON=/usr/bin/$NAME
+PIDFILE=/var/run/$NAME.pid
+
+[ -f "${DAEMON}" -a -x "${DAEMON}" ] || exit 0
+
+# Read configuration variable file if it is present
+[ -r "/etc/default/${NAME}" ] && . "/etc/default/${NAME}"
+
+ARGS="-f"
+[ -z "${TVH_USER}"      ] || ARGS="${ARGS} -u ${TVH_USER}"
+[ -z "${TVH_GROUP}"     ] || ARGS="${ARGS} -g ${TVH_GROUP}"
+[ -z "${TVH_ADAPTERS}"  ] || ARGS="${ARGS} -a ${TVH_ADAPTERS}"
+[ -z "${TVH_HTTP_PORT}" ] || ARGS="${ARGS} -w ${TVH_HTTP_PORT}"
+[ -z "${TVH_HTSP_PORT}" ] || ARGS="${ARGS} -e ${TVH_HTSP_PORT}"
+[ "${TVH_DEBUG}" = "1"  ] && ARGS="${ARGS} -s"
+
+case "$1" in
+    start)
+        printf "Starting TVHeadend daemon: "
+        if start-stop-daemon -S -q -p ${PIDFILE} -m --exec "${DAEMON}" -- ${ARGS}; then
+            printf "OK\n"
+        else
+            printf "failed\n"
+        fi
+        ;;
+    stop)
+        printf "Stoping TVHeadend daemon: "
+        start-stop-daemon -K -q -p ${PIDFILE} -s TERM
+        sleep 2
+        if start-stop-daemon -K -q -p ${PIDFILE} -t; then
+            printf "failed, killing: "
+            start-stop-daemon -K -q -p ${PIDFILE} -s KILL -o
+        fi
+        printf "OK\n"
+        ;;
+    restart|force-reload)
+        "${0}" stop
+        sleep 2
+        "${0}" stop
+        ;;
+    *)
+        echo "Usage: $SCRIPTNAME {start|stop|restart|force-reload}" >&2
+        exit 1
+        ;;
+esac
+
+:
diff --git a/package/tvheadend/accesscontrol.1 b/package/tvheadend/accesscontrol.1
new file mode 100644
index 0000000..b920943
--- /dev/null
+++ b/package/tvheadend/accesscontrol.1
@@ -0,0 +1,13 @@
+{
+        "enabled": 1,
+        "username": "admin",
+        "password": "admin",
+        "comment": "TVHeadend admin user",
+        "prefix": "0.0.0.0/0",
+        "streaming": 1,
+        "dvr": 1,
+        "dvrallcfg": 1,
+        "webui": 1,
+        "admin": 1,
+        "id": "1"
+}
diff --git a/package/tvheadend/etc.default.tvheadend b/package/tvheadend/etc.default.tvheadend
new file mode 100644
index 0000000..c769055
--- /dev/null
+++ b/package/tvheadend/etc.default.tvheadend
@@ -0,0 +1,7 @@
+# Once we have a real user, we'll use it
+TVH_USER=root
+TVH_GROUP=root
+#TVH_ADAPTERS=
+#TVH_HTTP_PORT=9981
+#TVH_HTSP_PORT=9982
+#TVH_DEBUG=1
diff --git a/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch b/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
new file mode 100644
index 0000000..879cc03
--- /dev/null
+++ b/package/tvheadend/tvheadend-no-auto-download-dvbscans.patch
@@ -0,0 +1,60 @@
+Do not download transponder data as part of the build
+
+Id dvb-scan is enabled, tvheadend will download the transponders data
+form the dvb-apps package. This does not play well with buildroot.
+
+Instead, we rely on the dvb-apps package to install those files, so
+it is no longer needed to install those as part of tvheadend.
+
+Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+
+diff -durN tvheadend-v3.3.orig//configure tvheadend-v3.3/configure
+--- tvheadend-v3.3.orig//configure	2012-09-25 15:32:31.000000000 +0200
++++ tvheadend-v3.3/configure	2012-12-28 17:17:23.580253413 +0100
+@@ -96,13 +96,14 @@
+ #
+ # DVB scan
+ #
+-if enabled linuxdvb && enabled dvbscan; then
+-  if [ ! -d ${ROOTDIR}/data/dvb-scan ]; then
+-    echo -n "Fetching dvb-scan files... "
+-    ${ROOTDIR}/support/getmuxlist &> /dev/null || die "Failed to fetch dvb-scan files (use --disable-dvbscan to skip)"
+-    echo "done"
+-  fi
+-fi
++# For buildroot, we already installed those files via the dvb-apps package
++#if enabled linuxdvb && enabled dvbscan; then
++#  if [ ! -d ${ROOTDIR}/data/dvb-scan ]; then
++#    echo -n "Fetching dvb-scan files... "
++#    ${ROOTDIR}/support/getmuxlist &> /dev/null || die "Failed to fetch dvb-scan files (use --disable-dvbscan to skip)"
++#    echo "done"
++#  fi
++#fi
+ 
+ # ###########################################################################
+ # Write config
+diff -durN tvheadend-v3.3.orig//Makefile tvheadend-v3.3/Makefile
+--- tvheadend-v3.3.orig//Makefile	2012-09-25 15:32:31.000000000 +0200
++++ tvheadend-v3.3/Makefile	2012-12-28 17:17:47.573497346 +0100
+@@ -180,7 +180,7 @@
+ SRCS-${CONFIG_BUNDLE}     += bundle.c
+ BUNDLES-yes               += docs/html docs/docresources src/webui/static
+ BUNDLES-yes               += data/conf
+-BUNDLES-${CONFIG_DVBSCAN} += data/dvb-scan
++#BUNDLES-${CONFIG_DVBSCAN} += data/dvb-scan
+ BUNDLES                    = $(BUNDLES-yes)
+ 
+ #
+diff -durN tvheadend-v3.3.orig//support/posix.mk tvheadend-v3.3/support/posix.mk
+--- tvheadend-v3.3.orig//support/posix.mk	2012-09-25 15:32:31.000000000 +0200
++++ tvheadend-v3.3/support/posix.mk	2012-12-28 17:19:28.903121722 +0100
+@@ -12,7 +12,8 @@
+ 		mkdir -p ${DESTDIR}${datadir}/tvheadend/$$bundle ;\
+ 		cp -r $$bundle/*  ${DESTDIR}${datadir}/tvheadend/$$bundle ;\
+ 	done
+-
++	mkdir -p ${DESTDIR}${datadir}/tvheadend/data
++	ln -s /usr/share/dvb-apps/scan ${DESTDIR}${datadir}/tvheadend/data/dvb-scan
+ 
+ uninstall:
+ 	rm -f ${DESTDIR}${bindir)/tvheadend
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
new file mode 100644
index 0000000..5100781
--- /dev/null
+++ b/package/tvheadend/tvheadend.mk
@@ -0,0 +1,43 @@
+#############################################################
+#
+# tvheadend
+#
+##############################################################
+
+TVHEADEND_VERSION           = v3.3
+TVHEADEND_SITE              = http://github.com/tvheadend/tvheadend/tarball/$(TVHEADEND_VERSION)
+TVHEADEND_LICENSE           = GPLv3+
+TVHEADEND_LICENSE_FILES     = LICENSE
+TVHEADEND_DEPENDENCIES      = host-pkgconf host-python openssl
+
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+TVHEADEND_DEPENDENCIES     += avahi
+endif
+
+#----------------------------------------------------------------------------
+# tvheadend is a little smuggler and thief! ;-)
+# During the ./configure, it downloads some files from the dvb-apps
+# package, so it has a list of pre-scanned tunner configurations.
+# For buildroot, we add a patch that avoids doing that, but uses the
+# scan files installed by the dvb-apps package
+TVHEADEND_DEPENDENCIES     += dvb-apps
+
+#----------------------------------------------------------------------------
+# To run tvheadend, we need:
+#  - a startup script, and its config file
+#  - a default DB with a tvheadend admin
+define TVHEADEND_INSTALL_DB
+	$(INSTALL) -D package/tvheadend/accesscontrol.1     \
+	              $(TARGET_DIR)/root/.hts/tvheadend/accesscontrol/1
+endef
+TVHEADEND_POST_INSTALL_TARGET_HOOKS  = TVHEADEND_INSTALL_DB
+
+define TVHEADEND_INSTALL_INIT_SYSV
+	$(INSTALL) -D package/tvheadend/etc.default.tvheadend $(TARGET_DIR)/etc/default/tvheadend
+	$(INSTALL) -D package/tvheadend/S99tvheadend          $(TARGET_DIR)/etc/init.d/S99tvheadend
+endef
+
+#----------------------------------------------------------------------------
+# tvheadend is not an autotools-based package, but it is possible to
+# call its ./configure script as if it were an autotools one.
+$(eval $(autotools-package))
-- 
1.7.2.5
