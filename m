From: Doug Kehn <rdkehn@yahoo.com>
Date: Sun, 24 May 2015 14:12:32 -0500
Subject: [Buildroot] [PATCH 1/1 v2] package/nss-pam-ldapd: new package
Message-ID: <1432494752-5077-1-git-send-email-rdkehn@yahoo.com>
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
Changes v1 -> v2
  - Incorporate feedback/suggestions by Yann.

 package/Config.in                        |  1 +
 package/nss-pam-ldapd/Config.in          | 25 +++++++++++++++++
 package/nss-pam-ldapd/S45nslcd           | 25 +++++++++++++++++
 package/nss-pam-ldapd/nslcd.service      | 11 ++++++++
 package/nss-pam-ldapd/nss-pam-ldapd.hash |  4 +++
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 46 ++++++++++++++++++++++++++++++++
 6 files changed, 112 insertions(+)
 create mode 100644 package/nss-pam-ldapd/Config.in
 create mode 100644 package/nss-pam-ldapd/S45nslcd
 create mode 100644 package/nss-pam-ldapd/nslcd.service
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
index 0000000..da6d331
--- /dev/null
+++ b/package/nss-pam-ldapd/Config.in
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_NSS_PAM_LDAPD
+	bool "nss-pam-ldapd"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_OPENLDAP
+	help
+	  Name Service Switch (NSS) module that allows your LDAP
+	  server to provide user account, group, host name, alias,
+	  netgroup, and basically any other information that you would
+	  normally get from /etc flat files or NIS. It also provides a
+	  Pluggable Authentication Module (PAM) to do authentication
+	  to an LDAP server.
+
+	  http://arthurdejong.org/nss-pam-ldapd/
+
+if BR2_PACKAGE_NSS_PAM_LDAPD
+
+config BR2_PACKAGE_NSS_PAM_LDAPD_UTILITIES
+	bool "nss-pam-ldapd utilities"
+	help
+	  Build/Install command-line utilities.
+
+endif
+
+comment "nss-pam-ldapd needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/nss-pam-ldapd/S45nslcd b/package/nss-pam-ldapd/S45nslcd
new file mode 100644
index 0000000..cd3e4d0
--- /dev/null
+++ b/package/nss-pam-ldapd/S45nslcd
@@ -0,0 +1,25 @@
+#!/bin/sh
+
+NAME="nslcd"
+DAEMON="/usr/sbin/${NAME}"
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
diff --git a/package/nss-pam-ldapd/nslcd.service b/package/nss-pam-ldapd/nslcd.service
new file mode 100644
index 0000000..d7854d8
--- /dev/null
+++ b/package/nss-pam-ldapd/nslcd.service
@@ -0,0 +1,11 @@
+[Unit]
+Description=Naming services LDAP client daemon.
+After=syslog.target network.target 
+
+[Service]
+Type=forking
+PIDFile=/var/run/nslcd/nslcd.pid
+ExecStart=/usr/sbin/nslcd
+
+[Install]
+WantedBy=multi-user.target
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
new file mode 100644
index 0000000..b43b3d0
--- /dev/null
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -0,0 +1,4 @@
+# From http://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.5.tar.gz.md5
+md5	1f0517d2c46ca1d8ecdbe23a671edc83	nss-pam-ldapd-0.9.5.tar.gz
+# Locally computed:
+sha256	49080058d85f60213c1b661a899ffe44e30770b5034e5a6ce48486a8d92bee6c	nss-pam-ldapd-0.9.5.tar.gz
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
new file mode 100644
index 0000000..a4c0879
--- /dev/null
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -0,0 +1,46 @@
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
+NSS_PAM_LDAPD_CONF_OPTS = --enable-sasl=no
+NSS_PAM_LDAPD_DEPENDENCIES = openldap
+
+ifeq ($(BR2_PACKAGE_NSS_PAM_LDAPD_UTILITIES),y)
+NSS_PAM_LDAPD_CONF_OPTS += --enable-utils
+else
+NSS_PAM_LDAPD_CONF_OPTS += --enable-utils=no
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+NSS_PAM_LDAPD_CONF_OPTS += --enable-pam
+NSS_PAM_LDAPD_DEPENDENCIES += linux-pam
+else
+NSS_PAM_LDAPD_CONF_OPTS += --disable-pam
+endif
+
+define NSS_PAM_LDAPD_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -m 755 -D package/nss-pam-ldapd/nslcd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/nslcd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/nslcd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nslcd.service
+endef
+
+define NSS_PAM_LDAPD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/nss-pam-ldapd/S45nslcd \
+		$(TARGET_DIR)/etc/init.d/S45nslcd
+endef
+
+define NSS_PAM_LDAPD_USERS
+	nslcd -1 nslcd -1 * - - - nslcd user
+endef
+
+$(eval $(autotools-package))
-- 
2.4.1
