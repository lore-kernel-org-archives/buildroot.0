From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 6 Apr 2015 01:03:55 +0300
Subject: [Buildroot] [RFC v2 4/6] samba4: common service startup
In-Reply-To: <cover.1428263859.git.alex.suykov@gmail.com>
References: <cover.1428263859.git.alex.suykov@gmail.com>
Message-ID: <2aa8bdf68e1a371e56cefc4d0f9e9dfda3894d64.1428263859.git.alex.suykov@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two daemons per package, each gets it own .run file.

This will result in two .service files (which is the only way
with systemd) and two initscripts.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
---
 package/samba4/S91smb    | 56 ------------------------------------------------
 package/samba4/nmbd.run  |  3 +++
 package/samba4/samba4.mk |  6 +-----
 package/samba4/smbd.run  |  3 +++
 4 files changed, 7 insertions(+), 61 deletions(-)
 delete mode 100644 package/samba4/S91smb
 create mode 100644 package/samba4/nmbd.run
 create mode 100644 package/samba4/smbd.run

diff --git a/package/samba4/S91smb b/package/samba4/S91smb
deleted file mode 100644
index ce14e19..0000000
--- a/package/samba4/S91smb
+++ /dev/null
@@ -1,56 +0,0 @@
-#!/bin/sh
-
-[ -f /etc/samba/smb.conf ] || exit 0
-
-mkdir -p /var/log/samba
-
-start() {
-	echo -n "Starting SMB services: "
-	smbd -D
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-
-	echo -n "Starting NMB services: "
-	nmbd -D
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-
-stop() {
-	echo -n "Shutting down SMB services: "
-	kill -9 `pidof smbd`
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-
-	echo -n "Shutting down NMB services: "
-	kill -9 `pidof nmbd`
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-
-restart() {
-	stop
-	start
-}
-
-reload() {
-        echo -n "Reloading smb.conf file: "
-	kill -HUP `pidof smbd`
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-
-case "$1" in
-  start)
-  	start
-	;;
-  stop)
-  	stop
-	;;
-  restart)
-  	restart
-	;;
-  reload)
-  	reload
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/samba4/nmbd.run b/package/samba4/nmbd.run
new file mode 100644
index 0000000..225cc4c
--- /dev/null
+++ b/package/samba4/nmbd.run
@@ -0,0 +1,3 @@
+description: Samba NMB daemon
+prestart: mkdir -p /var/log/samba
+foreground: /usr/sbin/nmbd -F
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 78d92ef..bf424c2 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -13,6 +13,7 @@ SAMBA4_LICENSE_FILES = COPYING
 SAMBA4_DEPENDENCIES = host-e2fsprogs host-heimdal e2fsprogs popt python zlib \
 	$(if $(BR2_PACKAGE_LIBCAP),libcap) \
 	$(if $(BR2_PACKAGE_READLINE),readline)
+SAMBA4_INIT_RUN = smbd.run nmbd.run
 
 ifeq ($(BR2_PACKAGE_ACL),y)
 SAMBA4_CONF_OPTS += --with-acl-support
@@ -150,9 +151,4 @@ endef
 SAMBA4_POST_INSTALL_TARGET_HOOKS += SAMBA4_REMOVE_SMBTORTURE
 endif
 
-define SAMBA4_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/samba4/S91smb \
-		$(TARGET_DIR)/etc/init.d/S91smb
-endef
-
 $(eval $(generic-package))
diff --git a/package/samba4/smbd.run b/package/samba4/smbd.run
new file mode 100644
index 0000000..ae2f7ca
--- /dev/null
+++ b/package/samba4/smbd.run
@@ -0,0 +1,3 @@
+description: Samba SMB daemon
+prestart: mkdir -p /var/log/samba
+foreground: /usr/sbin/smbd -F
-- 
2.0.3
