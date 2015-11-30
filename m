From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Nov 2015 23:55:20 +0100
Subject: [Buildroot] [git commit] package/nss-pam-ldapd: new package
Message-ID: <20151201232125.34F4B821F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b8fc2884d917973380721d48975d13b5fa46e7fc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Name Service Switch (NSS) module that allows your LDAP server to provide
user account, group, host name, alias, netgroup, and basically any other
information that you would normally get from /etc flat files or NIS. It
also provides a Pluggable Authentication Module (PAM) to do
authentication to an LDAP server.

[Thomas:
 - bump to version 0.9.6
 - use --disable-<foo> rather than --enable-<foo>=no.
 - fix license information: there is no LICENSE file, it is named
   COPYING.]

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |  1 +
 package/nss-pam-ldapd/Config.in          | 25 +++++++++++++++++
 package/nss-pam-ldapd/S45nslcd           | 25 +++++++++++++++++
 package/nss-pam-ldapd/nslcd.service      | 11 ++++++++
 package/nss-pam-ldapd/nss-pam-ldapd.hash |  4 +++
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 46 ++++++++++++++++++++++++++++++++
 6 files changed, 112 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 3343a53..2bdad01 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1057,6 +1057,7 @@ menu "Networking"
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
index 0000000..6c0d71b
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
index 0000000..b931e6f
--- /dev/null
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -0,0 +1,4 @@
+# From http://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.6.tar.gz.md5
+md5	fa5ec49cb54428d6c73e244a11021695	nss-pam-ldapd-0.9.6.tar.gz
+# Locally computed:
+sha256	101d5a7fa10549cc77be48d07f2b8141f59182f10f2cc0fea93efd13c3a5a6f2	nss-pam-ldapd-0.9.5.tar.gz
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
new file mode 100644
index 0000000..ba25082
--- /dev/null
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -0,0 +1,46 @@
+################################################################################
+#
+# nss-pam-ldapd
+#
+################################################################################
+
+NSS_PAM_LDAPD_VERSION = 0.9.6
+NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
+NSS_PAM_LDAPD_LICENSE = LGPLv2.1+
+NSS_PAM_LDAPD_LICENSE_FILES = COPYING
+NSS_PAM_LDAPD_INSTALL_STAGING = YES
+
+NSS_PAM_LDAPD_CONF_OPTS = --disable-sasl
+NSS_PAM_LDAPD_DEPENDENCIES = openldap
+
+ifeq ($(BR2_PACKAGE_NSS_PAM_LDAPD_UTILITIES),y)
+NSS_PAM_LDAPD_CONF_OPTS += --enable-utils
+else
+NSS_PAM_LDAPD_CONF_OPTS += --disable-utils
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
