From: Andreas Ehmanns <universeII@gmx.de>
Date: Thu, 17 Dec 2015 21:41:19 +0100
Subject: [Buildroot] [PATCH 1/1] openldap: add support to build the server
Message-ID: <1450384879-5494-1-git-send-email-universeII@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Ehmanns <universeII@gmx.de>
---
 package/openldap/Config.in   |  8 ++++++-
 package/openldap/S75slapd    | 51 ++++++++++++++++++++++++++++++++++++++++++++
 package/openldap/openldap.mk | 17 ++++++++++++++-
 3 files changed, 74 insertions(+), 2 deletions(-)
 create mode 100644 package/openldap/S75slapd

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
index 0000000..1365d4b
--- /dev/null
+++ b/package/openldap/S75slapd
@@ -0,0 +1,51 @@
+#!/bin/sh
+DAEMON=/usr/libexec/slapd
+NAME=slapd
+DESC="OpenLDAP server"
+CONF=/etc/openldap/slapd.conf
+
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
+        if [ ! -d /var/openldap-data ]; then
+            install -d -o ldap -g ldap -m 755 /var/openldap-data
+        else
+            chown -R ldap:ldap /var/openldap-data
+        fi
+
+        printf "Starting $DESC: $NAME: "
+        start-stop-daemon -S -b -n $NAME -a $DAEMON -- $ARGS
+        echo "done."
+        ;;
+    stop)
+        printf "Stopping $DESC: $NAME: "
+        start-stop-daemon -K -n $NAME
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
+        killall -HUP $(basename ${DAEMON})
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
index 17bf991..bcb285a 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -12,6 +12,17 @@ OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),y)
+define OPENLDAP_USERS
+        ldap -1 ldap -1 * /var/run/openldap - - OpenLDAP server user
+endef
+
+define OPENLDAP_COPY_INITSCRIPT
+        $(INSTALL) -D -m 755 $(@D)/S75slapd $(TARGET_DIR)/etc/init.d/S75slapd
+endef
+OPENLDAP_POST_INSTALL_TARGET_HOOKS += OPENLDAP_COPY_INITSCRIPT
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_TLS = openssl
 OPENLDAP_DEPENDENCIES += openssl
@@ -44,7 +55,6 @@ OPENLDAP_CONF_ENV += ac_cv_func_memcmp_working=yes
 OPENLDAP_CONF_OPTS += \
 	--enable-syslog \
 	--disable-proctitle \
-	--disable-slapd \
 	--with-yielding-select \
 	--sysconfdir=/etc \
 	--enable-dynamic=$(if $(BR2_STATIC_LIBS),no,yes) \
@@ -52,6 +62,11 @@ OPENLDAP_CONF_OPTS += \
 	--with-mp=$(OPENLDAP_MP) \
 	CPPFLAGS="$(TARGET_CPPFLAGS) $(OPENLDAP_CPPFLAGS)"
 
+ifeq ($(BR2_PACKAGE_OPENLDAP_SERVER),)
+OPENLDAP_CONF_OPTS += \
+        --disable-slapd
+endif
+
 # Somehow, ${STRIP} does not percolates through to the shtool script
 # used to install the executables; thus, that script tries to run the
 # executable it is supposed to install, resulting in an error.
-- 
2.1.4
