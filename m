From: Andreas Ehmanns <universeII@gmx.de>
Date: Fri, 15 Jan 2016 10:40:09 +0100
Subject: [Buildroot] [PATCH 1/1] openldap: add support to build the server
Message-ID: <1452850809-5526-1-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
---
 package/Config.in            |  2 +-
 package/openldap/Config.in   |  8 +++++++-
 package/openldap/S75slapd    | 47 ++++++++++++++++++++++++++++++++++++++++++++
 package/openldap/openldap.mk | 29 ++++++++++++++++++++++++++-
 4 files changed, 83 insertions(+), 3 deletions(-)
 create mode 100644 package/openldap/S75slapd

diff --git a/package/Config.in b/package/Config.in
index 89b23db..5df8960 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1115,7 +1115,6 @@ menu "Networking"
 	source "package/nss-mdns/Config.in"
 	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
-	source "package/openldap/Config.in"
 	source "package/openpgm/Config.in"
 	source "package/ortp/Config.in"
 	source "package/qdecoder/Config.in"
@@ -1405,6 +1404,7 @@ endif
 	source "package/odhcploc/Config.in"
 	source "package/olsr/Config.in"
 	source "package/open-plc-utils/Config.in"
+	source "package/openldap/Config.in"
 	source "package/openntpd/Config.in"
 	source "package/openobex/Config.in"
 	source "package/openssh/Config.in"
diff --git a/package/openldap/Config.in b/package/openldap/Config.in
index 3085a5c..30c0f65 100644
--- a/package/openldap/Config.in
+++ b/package/openldap/Config.in
@@ -6,12 +6,18 @@ config BR2_PACKAGE_OPENLDAP
 	  OpenLDAP Software is an open source implementation of
 	  the Lightweight Directory Access Protocol.
 
-	  This only installs client-side support.
+	  This only installs library support.
 
 	  http://www.openldap.org/
 
 if BR2_PACKAGE_OPENLDAP
 
+config BR2_PACKAGE_OPENLDAP_SERVER
+	bool "openldap server binary"
+	select BR2_PACKAGE_BERKELEYDB
+	help
+	  Installs the OpenLDAP server slapd
+
 config BR2_PACKAGE_OPENLDAP_CLIENTS
 	bool "openldap client binaries"
 	default y
diff --git a/package/openldap/S75slapd b/package/openldap/S75slapd
new file mode 100644
index 0000000..0a5ff8e
--- /dev/null
+++ b/package/openldap/S75slapd
@@ -0,0 +1,47 @@
+#!/bin/sh
+DAEMON=/usr/libexec/slapd
+NAME=slapd
+DESC="OpenLDAP server"
+CONF=/etc/openldap/slapd.conf
+PIDFILE=/var/run/openldap/slapd.pid
+ARGS="-u ldap -g ldap"
+
+set -e
+
+case "$1" in
+    start)
+        if [ ! -d /var/run/openldap ]; then
+            install -d -o ldap -g ldap -m 755 /var/run/openldap
+        fi
+
+        chown -R ldap:ldap /var/openldap-data
+
+        printf "Starting $DESC: $NAME: "
+        start-stop-daemon -S -q -p $PIDFILE -x $DAEMON -- $ARGS
+        echo "done."
+        ;;
+    stop)
+        printf "Stopping $DESC: $NAME: "
+        start-stop-daemon -K -q -p $PIDFILE
+        echo "done."
+        ;;
+    restart)
+        printf "Restarting $DESC: $NAME: "
+        $0 stop
+        $0 start
+        echo "done."
+        ;;
+    reload)
+        printf "Reloading $DESC: $NAME: "
+        kill -HUP $(cat $PIDFILE)
+        echo "done."
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart|reload}"
+        exit 1
+        ;;
+esac
+
+exit 0
+
+
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 17bf991..b2ea4c2 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -12,6 +12,27 @@ OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),y)
+define OPENLDAP_USERS
+	ldap -1 ldap -1 * /var/run/openldap - - OpenLDAP server user
+endef
+
+define OPENLDAP_PERMISSIONS
+	/var/openldap-data d 700 0 0 - - - - -
+endef
+
+# Use example database as default to let LADP server start smoothly
+define OPENLDAP_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 755 $(OPENLDAP_PKGDIR)/S75slapd $(TARGET_DIR)/etc/init.d/S75slapd
+endef
+
+define RENAME_DB
+	mv $(TARGET_DIR)/var/openldap-data/DB_CONFIG.example  $(TARGET_DIR)/var/openldap-data/DB_CONFIG
+endef
+
+OPENLDAP_POST_INSTALL_TARGET_HOOKS += RENAME_DB
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_TLS = openssl
 OPENLDAP_DEPENDENCIES += openssl
@@ -44,7 +65,6 @@ OPENLDAP_CONF_ENV += ac_cv_func_memcmp_working=yes
 OPENLDAP_CONF_OPTS += \
 	--enable-syslog \
 	--disable-proctitle \
-	--disable-slapd \
 	--with-yielding-select \
 	--sysconfdir=/etc \
 	--enable-dynamic=$(if $(BR2_STATIC_LIBS),no,yes) \
@@ -52,6 +72,13 @@ OPENLDAP_CONF_OPTS += \
 	--with-mp=$(OPENLDAP_MP) \
 	CPPFLAGS="$(TARGET_CPPFLAGS) $(OPENLDAP_CPPFLAGS)"
 
+ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),y)
+OPENLDAP_CONF_OPTS += --enable-slapd
+else
+OPENLDAP_CONF_OPTS += --disable-slapd
+endif
+
+
 # Somehow, ${STRIP} does not percolates through to the shtool script
 # used to install the executables; thus, that script tries to run the
 # executable it is supposed to install, resulting in an error.
-- 
2.1.4
