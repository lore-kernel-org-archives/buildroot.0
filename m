From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri, 22 May 2015 16:58:41 -0500
Subject: [Buildroot] [PATCH 1/1] package/unscd: new package
Message-ID: <1432331921-9417-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A daemon which handles passwd, group and host lookups for running
programs and caches the results for the next query. You only need this
package if you are using slow Name Services like LDAP, NIS or NIS+.

This particular NSCD is a complete rewrite of the GNU glibc nscd which
is a single threaded server process which offloads all NSS lookups to
worker children; cache hits are handled by the parent, and only cache
misses start worker children, making the parent immune to resource
leaks, hangs, and crashes in NSS libraries.

It should mostly be a drop-in replacement for existing installs using
nscd.

Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
 package/Config.in        |  1 +
 package/unscd/Config.in  |  6 ++++++
 package/unscd/S46unscd   | 31 +++++++++++++++++++++++++++++++
 package/unscd/unscd.hash |  4 ++++
 package/unscd/unscd.mk   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+)
 create mode 100644 package/unscd/Config.in
 create mode 100644 package/unscd/S46unscd
 create mode 100644 package/unscd/unscd.hash
 create mode 100644 package/unscd/unscd.mk

diff --git a/package/Config.in b/package/Config.in
index e0c2e2a..39ef6c4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1420,6 +1420,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/sysvinit/Config.in"
 endif
+	source "package/unscd/Config.in"
 	source "package/util-linux/Config.in"
 endmenu
 
diff --git a/package/unscd/Config.in b/package/unscd/Config.in
new file mode 100644
index 0000000..c448489
--- /dev/null
+++ b/package/unscd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_UNSCD
+	bool "unscd"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Micro Name Service Caching Daemon
diff --git a/package/unscd/S46unscd b/package/unscd/S46unscd
new file mode 100644
index 0000000..59a1358
--- /dev/null
+++ b/package/unscd/S46unscd
@@ -0,0 +1,31 @@
+#!/bin/sh
+
+NAME="nscd"
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
diff --git a/package/unscd/unscd.hash b/package/unscd/unscd.hash
new file mode 100644
index 0000000..173c59f
--- /dev/null
+++ b/package/unscd/unscd.hash
@@ -0,0 +1,4 @@
+# From http://snapshot.debian.org/archive/debian/20150519T094547Z/pool/main/u/unscd/unscd_0.51-1.dsc
+sha256	0dbf717726e1c29af8f4ef7d2d2695e5eedb342320a730a56ae0d56fe32891f8	unscd_0.51.orig.tar.gz
+sha256	8ae16a826afd464639f6c6372fabafee5b93aea9645b3fbf23970296d4961f27	unscd_0.51-1.debian.tar.gz
+
diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
new file mode 100644
index 0000000..51da0b1
--- /dev/null
+++ b/package/unscd/unscd.mk
@@ -0,0 +1,47 @@
+################################################################################
+#
+# unscd
+#
+################################################################################
+
+UNSCD_VERSION = 0.51
+UNSCD_SOURCE = unscd_$(UNSCD_VERSION).orig.tar.gz
+UNSCD_SITE = http://snapshot.debian.org/archive/debian/20150519T094547Z/pool/main/u/unscd/
+UNSCD_EXTRA_DOWNLOADS = unscd_$(UNSCD_VERSION)-1.debian.tar.gz
+UNSCD_LICENSE = GPLv2
+UNSCD_LICENSE_FILES = debian/copyright
+
+define UNSCD_EXTRACT_DEBIAN
+	gzip -d -c $(BR2_DL_DIR)/$(UNSCD_EXTRA_DOWNLOADS) | tar -C $(@D) -xf -
+endef
+
+UNSCD_POST_EXTRACT_HOOKS += UNSCD_EXTRACT_DEBIAN
+
+define UNSCD_APPLY_DEBIAN_PATCHES
+	for f in `grep -Ev "^#" $(@D)/debian/patches/series 2> /dev/null`; do \
+		cat "$(@D)/debian/patches/$${f}" | patch -g0 -p1 -E -d "$(@D)" -t -N; \
+	done
+endef
+
+UNSCD_POST_PATCH_HOOKS += UNSCD_APPLY_DEBIAN_PATCHES
+
+define UNSCD_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		$(@D)/nscd.c -o $(@D)/nscd
+endef
+
+define UNSCD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/nscd $(TARGET_DIR)/usr/sbin/nscd
+	$(INSTALL) -m 600 -D $(@D)/debian/nscd.conf $(TARGET_DIR)/etc/nscd.conf
+endef
+
+define UNSCD_INSTALL_INIT_SYSV
+	$(INSTALL) -m 755 -D package/unscd/S46unscd \
+		$(TARGET_DIR)/etc/init.d/S46unscd
+endef
+
+define UNSCD_USERS
+	unscd -1 unscd -1 * - - - unscd user
+endef
+
+$(eval $(generic-package))
-- 
2.4.1
