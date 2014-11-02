From: Karoly Kasza <kaszak@gmail.com>
Date: Sun,  2 Nov 2014 20:44:42 +0100
Subject: [Buildroot] [PATCH] start-stop-daemon: new package
Message-ID: <1414957482-22081-1-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Debian start-stop-daemon for init scripts.
Many packages, like at, dropbear, openvpn and nginx require this
if there's no Busybox selected.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/Config.in                                  |    3 ++
 .../start-stop-daemon/0001-Buildroot-compile.patch |   33 ++++++++++++++++++++
 package/start-stop-daemon/Config.in                |    4 +++
 package/start-stop-daemon/start-stop-daemon.hash   |    3 ++
 package/start-stop-daemon/start-stop-daemon.mk     |   31 ++++++++++++++++++
 5 files changed, 74 insertions(+)
 create mode 100644 package/start-stop-daemon/0001-Buildroot-compile.patch
 create mode 100644 package/start-stop-daemon/Config.in
 create mode 100644 package/start-stop-daemon/start-stop-daemon.hash
 create mode 100644 package/start-stop-daemon/start-stop-daemon.mk

diff --git a/package/Config.in b/package/Config.in
index 3b3c372..2ccead2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1220,6 +1220,9 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/psmisc/Config.in"
 endif
 	source "package/pwgen/Config.in"
+if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	source "package/start-stop-daemon/Config.in"
+endif
 	source "package/quota/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/rsyslog/Config.in"
diff --git a/package/start-stop-daemon/0001-Buildroot-compile.patch b/package/start-stop-daemon/0001-Buildroot-compile.patch
new file mode 100644
index 0000000..f083026
--- /dev/null
+++ b/package/start-stop-daemon/0001-Buildroot-compile.patch
@@ -0,0 +1,33 @@
+start-stop-daemon.c: get rid of dpkg includes and add defines instead
+
+These changes make start-stop-daemon.c independent of dpkg sources,
+making it separately compilable in Buildroot.
+
+Signed-off-by: Karoly Kasza <kaszak@gmail.com>
+
+diff -u start-stop-daemon-1.16.15.orig/start-stop-daemon.c start-stop-daemon-1.16.15/start-stop-daemon.c
+--- start-stop-daemon-1.16.15.orig/start-stop-daemon.c	2014-06-05 22:01:06.000000000 +0200
++++ start-stop-daemon-1.16.15/start-stop-daemon.c	2014-11-02 19:00:28.836084580 +0100
+@@ -18,12 +18,19 @@
+  *                 and Andreas Schuldei <andreas@schuldei.org>
+  *
+  * Changes by Ian Jackson: added --retry (and associated rearrangements).
++ *
++ * Changes by Karoly Kasza to make compilable for Buildroot
+  */
+ 
+-#include <config.h>
+-#include <compat.h>
++#define VERSION "1.16.15-Buildroot"
++#define DPKG_ATTR_NORET		__attribute__((noreturn))
++#define DPKG_ATTR_PRINTF(n)	__attribute__((format(printf, n, n + 1)))
++#define array_count(a) (sizeof(a) / sizeof((a)[0]))
+ 
+-#include <dpkg/macros.h>
++//For uClibc
++#ifndef O_NOFOLLOW
++#define O_NOFOLLOW	0
++#endif
+ 
+ #if defined(linux) || (defined(__FreeBSD_kernel__) && defined(__GLIBC__))
+ #  define OSLinux
diff --git a/package/start-stop-daemon/Config.in b/package/start-stop-daemon/Config.in
new file mode 100644
index 0000000..f14b390
--- /dev/null
+++ b/package/start-stop-daemon/Config.in
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_START_STOP_DAEMON
+	bool "start-stop-daemon"
+	help
+	  The Debian start-stop-daemon for init scripts
diff --git a/package/start-stop-daemon/start-stop-daemon.hash b/package/start-stop-daemon/start-stop-daemon.hash
new file mode 100644
index 0000000..15d2031
--- /dev/null
+++ b/package/start-stop-daemon/start-stop-daemon.hash
@@ -0,0 +1,3 @@
+# Generated after downloading from sources.debian.net, verified from dpkg sources
+sha1	ba507e9f66d9a7f13822cc6f70310270c845dd29				start-stop-daemon.c
+sha256	262e8dc0d0d654169f5054ba8dd8ad41801f58e7ba7b8dabfe7f194ccc037bf1	start-stop-daemon.c
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
new file mode 100644
index 0000000..c69e98a
--- /dev/null
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -0,0 +1,31 @@
+################################################################################
+#
+# start-stop-daemon
+#
+################################################################################
+
+START_STOP_DAEMON_VERSION = 1.16.15
+# Download only the .c file, not the full dpkg sources
+START_STOP_DAEMON_SOURCE = start-stop-daemon.c
+START_STOP_DAEMON_SITE = http://sources.debian.net/data/main/d/dpkg/$(START_STOP_DAEMON_VERSION)/utils
+START_STOP_DAEMON_LICENSE = Public Domain
+
+# Install after Busybox to overwrite symlink
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	START_STOP_DAEMON_DEPENDENCIES += busybox
+endif
+
+define START_STOP_DAEMON_EXTRACT_CMDS
+	cp $(DL_DIR)/$(START_STOP_DAEMON_SOURCE) $(@D)
+endef
+
+define START_STOP_DAEMON_BUILD_CMDS
+	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
+		$(@D)/start-stop-daemon.c -o $(@D)/start-stop-daemon
+endef
+
+define START_STOP_DAEMON_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 755 $(@D)/start-stop-daemon $(TARGET_DIR)/sbin/start-stop-daemon
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
