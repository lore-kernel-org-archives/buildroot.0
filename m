From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 22 May 2015 16:21:13 -0500
Subject: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: new package
Message-ID: <1432329673-6145-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Name Service Switch (NSS) module that allows your LDAP server to provide
user account, group, host name, alias, netgroup, and basically any other
information that you would normally get from /etc flat files or NIS. It
also provides a Pluggable Authentication Module (PAM) to do
authentication to an LDAP server.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/Config.in                        |  1 +
 package/nss-pam-ldapd/Config.in          | 13 +++++++++++++
 package/nss-pam-ldapd/S45nslcd           | 31 +++++++++++++++++++++++++++++++
 package/nss-pam-ldapd/nss-pam-ldapd.hash |  2 ++
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 22 ++++++++++++++++++++++
 5 files changed, 69 insertions(+)
 create mode 100644 package/nss-pam-ldapd/Config.in
 create mode 100644 package/nss-pam-ldapd/S45nslcd
 create mode 100644 package/nss-pam-ldapd/nss-pam-ldapd.hash
 create mode 100644 package/nss-pam-ldapd/nss-pam-ldapd.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..1035cab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -981,6 +981,7 @@ menu "Networking"
 	source "package/libwebsockets/Config.in"
 	source "package/neon/Config.in"
 	source "package/nss-mdns/Config.in"
+	source "package/nss-pam-ldapd/Config.in"
 	source "package/omniorb/Config.in"
 	source "package/openldap/Config.in"
 	source "package/openpgm/Config.in"
diff --git a/package/nss-pam-ldapd/Config.in b/package/nss-pam-ldapd/Config.in
new file mode 100644
index 0000000..9dda7a7
--- /dev/null
+++ b/package/nss-pam-ldapd/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_NSS_PAM_LDAPD
+	bool "nss-pam-ldapd"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  nss-pam-ldapd which provides a Name Service Switch (NSS)
+	  module that allows your LDAP server to provide user account,
+	  group, host name, alias, netgroup, and basically any other
+	  information that you would normally get from /etc flat files
+	  or NIS. It also provides a Pluggable Authentication Module
+	  (PAM) to do authentication to an LDAP server.
+
+	  http://arthurdejong.org/nss-pam-ldapd/
diff --git a/package/nss-pam-ldapd/S45nslcd b/package/nss-pam-ldapd/S45nslcd
new file mode 100644
index 0000000..e9c00f3
--- /dev/null
+++ b/package/nss-pam-ldapd/S45nslcd
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+NAME="nslcd"
+DAEMON="/usr/sbin/${NAME}"
+DAEMON_CONF="/etc/${NAME}.conf"
+
+[ -x ${DAEMON} ] || exit 0
+[ -f ${DAEMON_CONF} ] || exit 0
+
+case "$1" in
+start)
+        echo -n "Starting ${NAME}: "
+        start-stop-daemon -S -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+stop)
+        echo -n "Stopping ${NAME}: "
+        start-stop-daemon -K -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+restart|reload)
+        $0 stop
+        $0 start
+        ;;
+*)
+        echo "Usage: $0 {start|stop|restart|reload}"
+        exit 1
+esac
+
+exit 0
+
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
new file mode 100644
index 0000000..21e61f6
--- /dev/null
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -0,0 +1,2 @@
+# From http://arthurdejong.org/nss-pam-ldapd/
+md5	1f0517d2c46ca1d8ecdbe23a671edc83	nss-pam-ldapd-0.9.5.tar.gz
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
new file mode 100644
index 0000000..a650803
--- /dev/null
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# nss-pam-ldapd
+#
+################################################################################
+
+NSS_PAM_LDAPD_VERSION = 0.9.5
+NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
+NSS_PAM_LDAPD_LICENSE = LGPLv2.1+
+NSS_PAM_LDAPD_LICENSE_FILES = LICENSE
+NSS_PAM_LDAPD_INSTALL_STAGING = YES
+
+define NSS_PAM_LDAPD_USERS
+	nslcd -1 nslcd -1 * - - - nslcd user
+endef
+
+define NSS_PAM_LDAPD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/nss-pam-ldapd/S45nslcd \
+		$(TARGET_DIR)/etc/init.d/S45nslcd
+endef
+
+$(eval $(autotools-package))
-- 
2.4.1
