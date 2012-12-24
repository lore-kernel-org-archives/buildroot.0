From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2012 11:00:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: new package
In-Reply-To: <cover.1356343037.git.yann.morin.1998@free.fr>
References: <cover.1356343037.git.yann.morin.1998@free.fr>
Message-ID: <97b2cc572615e7c760fb8f351510b67ccb02a0e4.1356343037.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in                   |    1 +
 package/tvheadend/Config.in         |   20 +++++++++
 package/tvheadend/tvheadend.config  |   13 ++++++
 package/tvheadend/tvheadend.default |    6 +++
 package/tvheadend/tvheadend.init    |   54 +++++++++++++++++++++++++
 package/tvheadend/tvheadend.mk      |   76 +++++++++++++++++++++++++++++++++++
 package/tvheadend/tvheadend.mkuser  |   52 ++++++++++++++++++++++++
 7 files changed, 222 insertions(+), 0 deletions(-)
 create mode 100644 package/tvheadend/Config.in
 create mode 100644 package/tvheadend/tvheadend.config
 create mode 100644 package/tvheadend/tvheadend.default
 create mode 100644 package/tvheadend/tvheadend.init
 create mode 100644 package/tvheadend/tvheadend.mk
 create mode 100755 package/tvheadend/tvheadend.mkuser

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
index 0000000..679ca13
--- /dev/null
+++ b/package/tvheadend/Config.in
@@ -0,0 +1,20 @@
+comment "tvheadend requires a toolchain with WCHAR"
+	depends on !BR2_USE_WCHAR
+
+config BR2_PACKAGE_TVHEADEND
+	bool "tvheadend"
+	depends on BR2_USE_WCHAR    # python
+	depends on BR2_USE_MMU      # python
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_PYTHON
+	help
+	  Tvheadend is a TV streaming server for Linux supporting DVB-S,
+	  DVB-S2, DVB-C, DVB-T, ATSC, IPTV, and Analog video (V4L) as
+	  input sources.
+	  
+	  https://www.lonelycoder.com/redmine/projects/tvheadend/
+	  
+	  Note: if you want Avahi support, you'll need to enable:
+	    - Avahi
+	    - D-Bus
+	    - libdaemon
diff --git a/package/tvheadend/tvheadend.config b/package/tvheadend/tvheadend.config
new file mode 100644
index 0000000..b920943
--- /dev/null
+++ b/package/tvheadend/tvheadend.config
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
diff --git a/package/tvheadend/tvheadend.default b/package/tvheadend/tvheadend.default
new file mode 100644
index 0000000..253f832
--- /dev/null
+++ b/package/tvheadend/tvheadend.default
@@ -0,0 +1,6 @@
+TVH_USER=tvheadend
+TVH_GROUP=tvheadend
+#TVH_ADAPTERS=
+#TVH_HTTP_PORT=9981
+#TVH_HTSP_PORT=9982
+#TVH_DEBUG=1
diff --git a/package/tvheadend/tvheadend.init b/package/tvheadend/tvheadend.init
new file mode 100644
index 0000000..b05ec81
--- /dev/null
+++ b/package/tvheadend/tvheadend.init
@@ -0,0 +1,54 @@
+#! /bin/sh
+# Startup script inspired by the one in the package
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
+        if start-stop-daemon -S -q -p ${PIDFILE} -m --exec /usr/bin/tvheadend -- $ARGS; then
+            printf "OK\n"
+        else
+            printf "failed\n"
+        fi
+	    ;;
+    stop)
+        printf "Starting TVHeadend daemon: "
+        start-stop-daemon -K -q -p ${PIDFILE} -s TERM
+        sleep 2
+        if start-stop-daemon -K -q -p ${PIDFILE} -t; then
+            printf "failed, killing: "
+            start-stop-daemon -K -q -p ${PIDFILE} -s KILL -o
+        fi
+        printf "OK\n"
+    	;;
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
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
new file mode 100644
index 0000000..d2fe97a
--- /dev/null
+++ b/package/tvheadend/tvheadend.mk
@@ -0,0 +1,76 @@
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
+TVHEADEND_DEPENDENCIES      = host-pkgconf openssl python
+
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+TVHEADEND_DEPENDENCIES     += avahi
+endif
+
+#----------------------------------------------------------------------------
+# tvheadend is a little smuggler and thief! ;-)
+# During the ./configure, it downloads some files from the dvb-apps
+# package, so it has a list of pre-scanned tunner configurations.
+# For buildroot that has a few-unfortunate consequences:
+#  - the network may not be availabe at the time of build, if the
+#    user pre-downloaded the sources with 'make source'
+# So, here's what we do:
+#  - after the main archive download, we do download those files
+#  - after extract, we extract the required files
+
+TVHEADEND_DVBSCANS_VERSION  = 3fc7dfa68484
+TVHEADEND_DVBSCANS_SITE     = http://linuxtv.org/hg/dvb-apps/archive/
+TVHEADEND_DVBSCANS_DIR      = dvb-apps-$(TVHEADEND_DVBSCANS_VERSION)
+TVHEADEND_DVBSCANS_SOURCE   = $(TVHEADEND_DVBSCANS_DIR).tar.bz2
+
+define TVHEADEND_DOWNLOAD_DVBSCANS
+	$(call DOWNLOAD_WGET,$(TVHEADEND_DVBSCANS_SITE)/$(TVHEADEND_DVBSCANS_VERSION).tar.bz2,$(TVHEADEND_DVBSCANS_SOURCE))
+endef
+TVHEADEND_POST_DOWNLOAD_HOOKS        = TVHEADEND_DOWNLOAD_DVBSCANS
+
+define TVHEADEND_EXTRACT_DVBSCANS
+	mkdir -p $(@D)/data/dvb-scan
+	$(INFLATE.bz2) $(DL_DIR)/$(TVHEADEND_DVBSCANS_SOURCE)      |\
+	$(TAR) $(TAR_STRIP_COMPONENTS)=3 -C $(@D)/data/dvb-scan     \
+	       $(TAR_OPTIONS) -                                     \
+	       $(TVHEADEND_DVBSCANS_DIR)/util/scan/{atsc,dvb-{c,s,t}}
+endef
+TVHEADEND_POST_EXTRACT_HOOKS         = TVHEADEND_EXTRACT_DVBSCANS
+
+#----------------------------------------------------------------------------
+# To run tvheadend, we need:
+#  - a non-root user to be safe, with its owned ${HOME}
+#  - a startup script, and its config file
+#  - a default DB with a tvheadend admin
+TVHEADEND_MKUSER = TARGET_DIR=$(TARGET_DIR) INSTALL=$(INSTALL) package/tvheadend/tvheadend.mkuser
+define TVHEADEND_CREATE_USER
+	$(TVHEADEND_MKUSER) mk_user
+	$(INSTALL) -D package/tvheadend/tvheadend.config  $(TARGET_DIR)/home/tvheadend/.hts/tvheadend/accesscontrol/1
+endef
+TVHEADEND_POST_INSTALL_TARGET_HOOKS  = TVHEADEND_CREATE_USER
+
+define TVHEADEND_PERMISSIONS
+	/home/tvheadend                                d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
+	/home/tvheadend/.hts                           d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
+	/home/tvheadend/.hts/tvheadend                 d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
+	/home/tvheadend/.hts/tvheadend/accesscontrol   d 0700 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
+	/home/tvheadend/.hts/tvheadend/accesscontrol/1 f 0600 $$(shell $(TVHEADEND_MKUSER) get_uid) $$(shell $(TVHEADEND_MKUSER) get_gid) - - - - -
+endef
+
+define TVHEADEND_INSTALL_SYSV_STARTUP_FILES
+	$(INSTALL) -D package/tvheadend/tvheadend.default $(TARGET_DIR)/etc/default/tvheadend
+	$(INSTALL) -D package/tvheadend/tvheadend.init    $(TARGET_DIR)/etc/init.d/S99tvheadend
+endef
+TVHEADEND_INSTALL_INIT_SYSV          = TVHEADEND_INSTALL_SYSV_STARTUP_FILES
+
+#----------------------------------------------------------------------------
+# tvheadend is not an autotools-based package, but it is possible to
+# call its ./configure script as if it were an autotools one.
+$(eval $(autotools-package))
diff --git a/package/tvheadend/tvheadend.mkuser b/package/tvheadend/tvheadend.mkuser
new file mode 100755
index 0000000..558bc64
--- /dev/null
+++ b/package/tvheadend/tvheadend.mkuser
@@ -0,0 +1,52 @@
+#!/bin/sh
+set -e
+
+# Create the user that will be responsible for
+# running the tvheadend DVR daemon
+# If the user does not exist, create it and its home
+# If the user does exist, do nothing
+# Expected env variables:
+#   ${TARGET_DIR}   Base dir of the rootfs
+#   ${INSTALL}      our install program
+
+# Usage:
+# arg     | purpose
+# --------+----------------------------
+# mk_user | creates the user, see above
+# get_uid | prints the user's UID on stdout
+# get_gid | prints the user's GID on stdout
+
+PASSWD="${TARGET_DIR}/etc/passwd"
+GROUP="${TARGET_DIR}/etc/group"
+
+mk_user() {
+    # If the user exists, we assume the group does, too
+    if grep -E '^tvheadend:' "${TARGET_DIR}/etc/passwd" >/dev/null 2>&1; then
+        return 0
+    fi
+
+    prev_uid="$( cut -d: -f3 "${PASSWD}" |sort -n |tail -n1 )"
+    prev_gid="$( cut -d: -f3 "${GROUP}" |sort -n |tail -n1 )"
+
+    uid=$((prev_uid+1))
+    gid=$((prev_gid+1))
+
+    printf "tvheadend:x:%d:\n" ${gid} >>"${GROUP}"
+    printf "tvheadend:x:%d:%g:TVHeadend daemon:/home/tvheadend:/bin/false\n"    \
+           ${uid} ${gid}                                                        \
+           >>"${PASSWD}"
+    ${INSTALL} -d "${TARGET_DIR}/home/tvheadend"
+}
+
+get_uid() {
+    sed -r -e '/^tvheadend:[^:]*:([[:digit:]]+):.*/!d; s//\1/;' "${PASSWD}"
+}
+
+get_gid() {
+    sed -r -e '/^tvheadend:[^:]*:([[:digit:]]+):.*/!d; s//\1/;' "${GROUP}"
+}
+
+case "${1}" in
+    mk_user|get_uid|get_gid) ${1};;
+    *)                       exit 1;;
+esac
-- 
1.7.2.5
