From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 30 Apr 2012 10:35:22 +0200
Subject: [Buildroot] [git commit] Add Netatalk
Message-ID: <20120430084131.900AB96C2E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bd9eba9ce307d0a634737dede8d9b18d981f2f69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch add the Netatalk package to Buildroot.

[Peter: fix download URL, force c99 mode, tweak help text]
Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in            |    1 +
 package/netatalk/Config.in   |   11 ++++++++++
 package/netatalk/S50netatalk |   43 ++++++++++++++++++++++++++++++++++++++++++
 package/netatalk/netatalk.mk |   36 +++++++++++++++++++++++++++++++++++
 4 files changed, 91 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2ea334a..ed66c05 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -494,6 +494,7 @@ source "package/netcat/Config.in"
 source "package/netkitbase/Config.in"
 source "package/netkittelnet/Config.in"
 endif
+source "package/netatalk/Config.in"
 source "package/netplug/Config.in"
 source "package/netsnmp/Config.in"
 source "package/netstat-nat/Config.in"
diff --git a/package/netatalk/Config.in b/package/netatalk/Config.in
new file mode 100644
index 0000000..26f14c3
--- /dev/null
+++ b/package/netatalk/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_NETATALK
+	bool "netatalk"
+	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBGPG_ERROR
+	help
+	  Netatalk can be used to turn a *NIX machine into an extremely
+	  high-performance and reliable file server for Macintosh computers.
+
+	  http://netatalk.sourceforge.net/
diff --git a/package/netatalk/S50netatalk b/package/netatalk/S50netatalk
new file mode 100755
index 0000000..94bb161
--- /dev/null
+++ b/package/netatalk/S50netatalk
@@ -0,0 +1,43 @@
+#!/bin/sh 
+# 
+# Start netatalk daemon  (aftpd && cnid_metad)
+#
+
+AFPD_UAMLIST="-U uams_dhx2.so,uams_clrtxt.so"
+
+start() {
+    echo -n "Starting Netatalk services (this will take a while): "
+    echo "Starting afpd"
+    echo -n " afpd"
+    start-stop-daemon -S -q -p /var/run/afpd.pid --exec /usr/sbin/afpd -- $AFPD_UAMLIST -g nobody -c 50
+    echo -n " cnid_metad"
+    start-stop-daemon -S -q -p /var/run/cnid_metad.pid --exec /usr/sbin/cnid_metad -- -l log_note
+    echo "."
+}
+
+stop(){
+    echo -n "Stopping Netatalk Daemons:"
+    echo -n " afpd"
+    start-stop-daemon -K -q -p /var/run/afpd.pid
+    echo -n " cnid_metad"
+    start-stop-daemon -K -q -p /var/run/cnid_metad.pid
+}
+
+case "$1" in
+    start)
+        start
+    ;; 
+    stop)
+        stop
+    ;; 
+    restart)
+        start
+        stop
+    ;; 
+    *) 
+        echo $"Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
+
diff --git a/package/netatalk/netatalk.mk b/package/netatalk/netatalk.mk
new file mode 100644
index 0000000..8544026
--- /dev/null
+++ b/package/netatalk/netatalk.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# netatalk
+#
+#############################################################
+NETATALK_VERSION = 2.2.2
+NETATALK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/netatalk/netatalk/$(NETATALK_VERSION)/
+NETATALK_SOURCE = netatalk-$(NETATALK_VERSION).tar.bz2
+
+NETATALK_DEPENDENCIES = openssl berkeleydb libgcrypt libgpg-error
+NETATALK_CONF_ENV += CC="$(TARGET_CC) -std=gnu99"
+NETATALK_CONF_OPT += --with-cnid-cdb-backend \
+	--with-bdb=$(STAGING_DIR)/usr \
+	--disable-zeroconf \
+	--with-ssl-dir=$(STAGING_DIR)/usr \
+	--with-libgcrypt-dir=$(STAGING_DIR)/usr \
+	--with-shadow \
+	--disable-shell-check \
+	--without-pam
+
+ifeq ($(BR2_PACKAGE_CUPS),y)
+	NETATALK_DEPENDENCIES += cups
+	NETATALK_CONF_OPT += --enable-cups
+else
+	NETATALK_CONF_OPT += --disable-cups
+endif
+
+define NETATALK_INSTALL_EXTRA_FILES
+	[ -f $(TARGET_DIR)/etc/init.d/S50netatalk ] || \
+		$(INSTALL) -m 0755 -D package/netatalk/S50netatalk \
+			$(TARGET_DIR)/etc/init.d/S50netatalk
+endef
+
+NETATALK_POST_INSTALL_TARGET_HOOKS += NETATALK_INSTALL_EXTRA_FILES
+
+$(eval $(call AUTOTARGETS))
