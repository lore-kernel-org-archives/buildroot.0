From: Doug Kehn <rdkehn@yahoo.com>
Date: Tue,  1 Dec 2015 09:15:54 -0600
Subject: [Buildroot] [PATCH v6] package/unscd: new package
Message-ID: <1448982954-5055-1-git-send-email-rdkehn@yahoo.com>
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

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
---
Changes v5 -> v6
  - Remove toolchain patch/BR2_GLIBC_NSCD (Thomas).
  - Change source site from Debian to upstream (Thomas).
  - Update to version 0.52 (Thomas).
Changes v4 -> v5
  - Reincorporate $(APPLY_PATCHES) suggestion after update by Arnout.
Changes v3 -> v4
  - Incorporate feedback/suggestions by Yann and Maxime.
Changes v2 -> v3
  - Remove trailing '/' from UNSCD_SITE.
  - Whitespace cleanup.
Changes v1 -> v2
  - Incorporate feedback/suggestions by Yann (from nss-pam-ldapd patch).
---
 package/unscd/Config.in  |  8 ++++++
 package/unscd/S46unscd   | 24 ++++++++++++++++++
 package/unscd/nscd.conf  | 65 ++++++++++++++++++++++++++++++++++++++++++++++++
 package/unscd/unscd.hash |  2 ++
 package/unscd/unscd.mk   | 35 ++++++++++++++++++++++++++
 5 files changed, 134 insertions(+)
 create mode 100644 package/unscd/Config.in
 create mode 100644 package/unscd/S46unscd
 create mode 100644 package/unscd/nscd.conf
 create mode 100644 package/unscd/unscd.hash
 create mode 100644 package/unscd/unscd.mk

diff --git a/package/unscd/Config.in b/package/unscd/Config.in
new file mode 100644
index 0000000..937aeb2
--- /dev/null
+++ b/package/unscd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_UNSCD
+	bool "unscd"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	help
+	  Micro Name Service Caching Daemon
+
+comment "unscd needs an (e)glibc toolchain"
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/unscd/S46unscd b/package/unscd/S46unscd
new file mode 100644
index 0000000..7d18f94
--- /dev/null
+++ b/package/unscd/S46unscd
@@ -0,0 +1,24 @@
+#!/bin/sh
+
+NAME="nscd"
+DAEMON="/usr/sbin/${NAME}"
+
+case "$1" in
+start)
+        printf "Starting ${NAME}: "
+        start-stop-daemon -S -x ${DAEMON}
+        [ $? -eq 0 ] && echo "OK" || echo "FAIL"
+        ;;
+stop)
+        printf "Stopping ${NAME}: "
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
diff --git a/package/unscd/nscd.conf b/package/unscd/nscd.conf
new file mode 100644
index 0000000..fe77d05
--- /dev/null
+++ b/package/unscd/nscd.conf
@@ -0,0 +1,65 @@
+# This file is currently taken verbatim from the version distributed
+# with GNU glibc's nscd with unused configurations removed
+# 
+# /etc/nscd.conf
+#
+# An example Name Service Cache config file.  This file is needed by nscd.
+#
+# Legal entries are:
+#
+#	logfile			<file>
+#	debug-level		<level>
+#	threads			<initial #threads to use>
+#	max-threads		<maximum #threads to use>
+#	server-user             <user to run server as instead of root>
+#		server-user is ignored if nscd is started with -S parameters
+#       stat-user               (ignored; any user can stat)
+#	reload-count		(ignored; unscd should never crash)
+#	paranoia		(ignored)
+#	restart-interval	(ignored; unscd should never crash)
+#
+#       enable-cache		<service> <yes|no>
+#	positive-time-to-live	<service> <time in seconds>
+#	negative-time-to-live   <service> <time in seconds>
+#       suggested-size		<service> <prime number>
+#	check-files		<service> <yes|no>
+#	persistent		<service> (ignored)
+#	shared			<service> (ignored)
+#	auto-propagate		<service> (ignored)
+#
+# Currently supported cache names (services): passwd, group, hosts
+
+
+
+# logfile /var/log/nscd.log
+# threads 14
+# max-threads 32
+server-user unscd
+debug-level 0
+
+enable-cache            passwd  yes
+positive-time-to-live   passwd  600
+negative-time-to-live   passwd  20
+suggested-size          passwd  1001
+check-files             passwd  yes
+
+enable-cache            group   yes
+positive-time-to-live   group   3600
+negative-time-to-live   group   60
+suggested-size          group   1001
+check-files             group   yes
+
+# hosts caching is broken with gethostby* calls, hence is now disabled
+# by default. Specifically, the caching does not obey DNS TTLs, and
+# thus could lead to problems if the positive-time-to-live is
+# significantly larger than the actual TTL.
+#
+# You should really use a caching nameserver instead of nscd for this
+# sort of request. However, you can easily re-enable this by default.
+enable-cache            hosts   no
+positive-time-to-live   hosts   3600
+negative-time-to-live   hosts   20
+suggested-size	        hosts   1001
+check-files             hosts   yes
+
+# unscd does not support services caching
diff --git a/package/unscd/unscd.hash b/package/unscd/unscd.hash
new file mode 100644
index 0000000..ab8ffdc
--- /dev/null
+++ b/package/unscd/unscd.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+sha256	4c1f83dcd120469fceef749050cb29fa666fa4666bd308dfe92e933a4c200d55	nscd-0.52.c
diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
new file mode 100644
index 0000000..87ba1bf
--- /dev/null
+++ b/package/unscd/unscd.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# unscd
+#
+################################################################################
+
+UNSCD_VERSION = 0.52
+UNSCD_SOURCE = nscd-$(UNSCD_VERSION).c
+UNSCD_SITE = http://busybox.net/~vda/unscd
+UNSCD_LICENSE = GPLv2
+UNSCD_LICENSE_FILES = COPYING
+
+define UNSCD_EXTRACT_CMDS
+	cp $(DL_DIR)/$($(PKG)_SOURCE) $(@D)/nscd.c
+endef
+
+define UNSCD_BUILD_CMDS
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) nscd
+endef
+
+define UNSCD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/nscd $(TARGET_DIR)/usr/sbin/nscd
+	$(INSTALL) -m 600 -D package/unscd/nscd.conf $(TARGET_DIR)/etc/nscd.conf
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
2.6.2
