From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 14 Dec 2010 01:35:41 +0100
Subject: [Buildroot] [git commit master 1/1] sysklogd: convert to gentargets
	and bump to 1.5
Message-ID: <20101214003641.D8AD88E2DA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dfd068cd279063b3be31870bda998b6ddda50e25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also, changed the site to Debian, to get the latest patches

[ Thomas: Minor fixes. Removed S25sysklogd since our default
  /etc/inittab already starts klogd and sysklogd. ]

[Peter: only install syslog.conf if not available in skeleton]
Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                      |    4 +-
 package/sysklogd/S25syslog                   |   48 -------------
 package/sysklogd/sysklogd-susv3-legacy.patch |   20 ------
 package/sysklogd/sysklogd.mk                 |   94 ++++++++++++--------------
 package/sysklogd/sysklogd.patch              |   91 -------------------------
 5 files changed, 46 insertions(+), 211 deletions(-)
 delete mode 100755 package/sysklogd/S25syslog
 delete mode 100644 package/sysklogd/sysklogd-susv3-legacy.patch
 delete mode 100644 package/sysklogd/sysklogd.patch

diff --git a/CHANGES b/CHANGES
index 2a46d66..4edbcc7 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,8 +6,8 @@
 	Updated/fixed packages: at, busybox, bzip2, dbus,
 	direcfb-examples, dmalloc, cloop, cups, ffmpeg, gdk-pixbuf,
 	hostapd, i2c-tools, input-tools, libconfig, ltp-testsuite, m4,
-	mii-diag, mrouted, openssh, openssl, openvpn, pango, qt, rsync,
-	sdl_gfx, sdl_sound, udev, usbutils, xz, zlib
+	mii-diag, mrouted, openssh, openssl, openvpn, pango, qt,
+	rsync, sdl_gfx, sdl_sound, sysklogd, udev, usbutils, xz, zlib
 
 	New packages: dhrystone, fbgrab, lsuio, rsh-redone, whetstone
 
diff --git a/package/sysklogd/S25syslog b/package/sysklogd/S25syslog
deleted file mode 100755
index 793ac61..0000000
--- a/package/sysklogd/S25syslog
+++ /dev/null
@@ -1,48 +0,0 @@
-#!/bin/sh
-#
-# Starts syslog.
-#
-
-
-
-umask 077
-
-start() {
- 	echo -n "Starting syslogd: "
-	start-stop-daemon -S -q -p /var/run/syslog.pid -x /sbin/syslogd -- -m 0
-	echo "OK"
-
-	echo -n "Starting klogd: "
-	start-stop-daemon -S -q -p /var/run/klogd.pid -x /sbin/klogd
-	echo "OK"
-}
-stop() {
-	echo -n "Stopping klogd: "
-	start-stop-daemon -K -n klogd
-	echo "OK"
-
-	echo -n "Stopping syslogd: "
-	start-stop-daemon -K -n syslogd
-	echo "OK"
-}
-restart() {
-	stop
-	start
-}
-
-case "$1" in
-  start)
-  	start
-	;;
-  stop)
-  	stop
-	;;
-  restart|reload)
-  	restart
-	;;
-  *)
-	echo $"Usage: $0 {start|stop|restart}"
-	exit 1
-esac
-
-exit $?
diff --git a/package/sysklogd/sysklogd-susv3-legacy.patch b/package/sysklogd/sysklogd-susv3-legacy.patch
deleted file mode 100644
index 7e9a294..0000000
--- a/package/sysklogd/sysklogd-susv3-legacy.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-[PATCH] replace susv3 legacy functions with modern equivalents
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- syslog.c |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: sysklogd-1.4.1/syslog.c
-===================================================================
---- sysklogd-1.4.1.orig/syslog.c
-+++ sysklogd-1.4.1/syslog.c
-@@ -178,7 +178,7 @@
- 		return;
- 	(void)strcat(tbuf, "\r\n");
- 	cnt += 2;
--	p = index(tbuf, '>') + 1;
-+	p = strchr(tbuf, '>') + 1;
- 	(void)write(fd, p, cnt - (p - tbuf));
- 	(void)close(fd);
- }
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 7333dfd..11aee2a 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -3,59 +3,53 @@
 # sysklogd
 #
 #############################################################
-SYSKLOGD_VERSION:=1.4.1
-SYSKLOGD_SOURCE:=sysklogd-$(SYSKLOGD_VERSION).tar.gz
-SYSKLOGD_SITE:=http://www.infodrom.org/projects/sysklogd/download
-SYSKLOGD_DIR:=$(BUILD_DIR)/sysklogd-$(SYSKLOGD_VERSION)
-SYSKLOGD_SYSLOGD_BINARY:=syslogd
-SYSKLOGD_KLOGD_BINARY:=klogd
-SYSKLOGD_BINARY:=$(SYSKLOGD_KLOGD_BINARY)
-SYSKLOGD_SYSLOGD_TARGET_BINARY:=sbin/syslogd
-SYSKLOGD_KLOGD_TARGET_BINARY:=sbin/klogd
-SYSKLOGD_TARGET_BINARY:=$(SYSKLOGD_KLOGD_TARGET_BINARY)
-
-$(DL_DIR)/$(SYSKLOGD_SOURCE):
-	 $(call DOWNLOAD,$(SYSKLOGD_SITE),$(SYSKLOGD_SOURCE))
-
-sysklogd-source: $(DL_DIR)/$(SYSKLOGD_SOURCE)
-
-$(SYSKLOGD_DIR)/.unpacked: $(DL_DIR)/$(SYSKLOGD_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(SYSKLOGD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SYSKLOGD_DIR) package/sysklogd/ sysklogd\*.patch
-	touch $(SYSKLOGD_DIR)/.unpacked
-
-$(SYSKLOGD_DIR)/$(SYSKLOGD_BINARY): $(SYSKLOGD_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(SYSKLOGD_DIR)
-	$(STRIPCMD) $(SYSKLOGD_DIR)/$(SYSKLOGD_SYSLOGD_BINARY)
-	$(STRIPCMD) $(SYSKLOGD_DIR)/$(SYSKLOGD_KLOGD_BINARY)
-
-$(TARGET_DIR)/$(SYSKLOGD_TARGET_BINARY): $(SYSKLOGD_DIR)/$(SYSKLOGD_BINARY)
-	$(INSTALL) -m 0755 -D $(SYSKLOGD_DIR)/$(SYSKLOGD_SYSLOGD_BINARY) $(TARGET_DIR)/$(SYSKLOGD_SYSLOGD_TARGET_BINARY)
-	$(INSTALL) -m 0755 -D $(SYSKLOGD_DIR)/$(SYSKLOGD_KLOGD_BINARY) $(TARGET_DIR)/$(SYSKLOGD_KLOGD_TARGET_BINARY)
-	if [ ! -f $(TARGET_DIR)/etc/init.d/S25syslog ]; then \
-		$(INSTALL) -m 0755 -D package/sysklogd/S25syslog $(TARGET_DIR)/etc/init.d; \
-	fi
-	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
-		$(INSTALL) -m 0644 -D package/sysklogd/syslog.conf $(TARGET_DIR)/etc/syslog.conf; \
+SYSKLOGD_VERSION = 1.5
+SYSKLOGD_SOURCE  = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
+SYSKLOGD_PATCH   = sysklogd_$(SYSKLOGD_VERSION)-6.diff.gz
+SYSKLOGD_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysklogd
+
+# Override Busybox implementations if Busybox is enabled.
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+SYSKLOGD_DEPENDENCIES = busybox
+endif
+
+define SYSKLOGD_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
 	fi
+endef
+
+SYSKLOGD_POST_PATCH_HOOKS = SYSKLOGD_DEBIAN_PATCHES
 
-sysklogd: $(TARGET_DIR)/$(SYSKLOGD_TARGET_BINARY)
+define SYSKLOGD_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
 
-sysklogd-clean:
-	rm -f $(TARGET_DIR)/$(SYSKLOGD_SYSLOGD_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/$(SYSKLOGD_KLOGD_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/etc/init.d/S25syslogd
+define SYSKLOGD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/usr/sbin/syslogd
+	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/usr/sbin/klogd
+	$(INSTALL) -D -m 0644 $(@D)/sysklogd.8 $(TARGET_DIR)/usr/share/man/man8/sysklogd.8
+	$(INSTALL) -D -m 0644 $(@D)/syslogd.8 $(TARGET_DIR)/usr/share/man/man8/syslogd.8
+	$(INSTALL) -D -m 0644 $(@D)/syslog.conf.5 $(TARGET_DIR)/usr/share/man/man5/syslog.conf.5
+	$(INSTALL) -D -m 0644 $(@D)/klogd.8 $(TARGET_DIR)/usr/share/man/man8/klogd.8
+	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
+		$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
+			$(TARGET_DIR)/etc/syslog.conf; \
+	fi
+endef
+
+define SYSKLOGD_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/syslogd
+	rm -f $(TARGET_DIR)/usr/sbin/klogd
+	rm -f $(TARGET_DIR)/usr/share/man/man8/sysklogd.8
+	rm -f $(TARGET_DIR)/usr/share/man/man8/syslogd.8
+	rm -f $(TARGET_DIR)/usr/share/man/man5/syslog.conf.5
+	rm -f $(TARGET_DIR)/usr/share/man/man8/klogd.8
 	rm -f $(TARGET_DIR)/etc/syslog.conf
-	-$(MAKE) -C $(SYSKLOGD_DIR) clean
+endef
 
-sysklogd-dirclean:
-	rm -rf $(SYSKLOGD_DIR)
+define SYSKLOGD_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
-TARGETS+=sysklogd
-endif
+$(eval $(call GENTARGETS,package,sysklogd))
diff --git a/package/sysklogd/sysklogd.patch b/package/sysklogd/sysklogd.patch
deleted file mode 100644
index 393a1a3..0000000
--- a/package/sysklogd/sysklogd.patch
+++ /dev/null
@@ -1,91 +0,0 @@
---- sysklogd-1.4.1/module.h.orig	1970-01-01 10:00:00.000000000 +1000
-+++ sysklogd-1.4.1/module.h	2005-11-24 01:40:09.000000000 +1000
-@@ -0,0 +1,62 @@
-+/* this file eliminates the need to include <kernel/module.h> */
-+/* Module definitions for klogd's module support */
-+struct kernel_sym
-+{
-+	        unsigned long value;
-+	        char name[60];
-+};
-+
-+struct module_symbol
-+{
-+	unsigned long value;
-+	const char *name;
-+};
-+
-+struct module_ref
-+{
-+	struct module *dep;     /* "parent" pointer */
-+	struct module *ref;     /* "child" pointer */
-+	struct module_ref *next_ref;
-+};
-+
-+struct module_info
-+{
-+	unsigned long addr;
-+	unsigned long size;
-+	unsigned long flags;
-+	long usecount;
-+};
-+
-+
-+typedef struct { volatile int counter; } atomic_t;
-+
-+struct module
-+{
-+	unsigned long size_of_struct;   /* == sizeof(module) */
-+	struct module *next;
-+	const char *name;
-+	unsigned long size;
-+	
-+	union
-+	{
-+		atomic_t usecount;
-+		long pad;
-+        } uc;                           /* Needs to keep its size - so says rth */
-+	
-+	unsigned long flags;            /* AUTOCLEAN et al */
-+	
-+	unsigned nsyms;
-+	unsigned ndeps;
-+	
-+	struct module_symbol *syms;
-+	struct module_ref *deps;
-+	struct module_ref *refs;
-+	int (*init)(void);
-+	void (*cleanup)(void);
-+	const struct exception_table_entry *ex_table_start;
-+	const struct exception_table_entry *ex_table_end;
-+#ifdef __alpha__
-+	unsigned long gp;
-+#endif
-+};
-+	
-
---- sysklogd-1.4.1/ksym_mod.c.orig	2005-11-24 23:15:01.000000000 +1000
-+++ sysklogd-1.4.1/ksym_mod.c	2005-11-24 23:11:54.000000000 +1000
-@@ -89,17 +89,21 @@
- #include <errno.h>
- #include <sys/fcntl.h>
- #include <sys/stat.h>
-+#include <linux/version.h>
- #if !defined(__GLIBC__)
- #include <linux/time.h>
- #include <linux/module.h>
- #else /* __GLIBC__ */
-+#if LINUX_VERSION_CODE >= 0x20500
-+#include "module.h"
-+#else
- #include <linux/module.h>
-+#endif
- extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
- extern int get_kernel_syms __P ((struct kernel_sym *__table));
- #endif /* __GLIBC__ */
- #include <stdarg.h>
- #include <paths.h>
--#include <linux/version.h>
- 
- #include "klogd.h"
- #include "ksyms.h"
-- 
1.7.2.2
