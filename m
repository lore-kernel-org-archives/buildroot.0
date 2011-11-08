From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 9 Nov 2011 00:00:52 +0100
Subject: [Buildroot] [git commit] sfdisk: remove deprecated
Message-ID: <20111108231131.E877E8F4D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7998d1d3e5fb07370758513a4c13daff32507370
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    4 --
 package/sfdisk/Config.in                           |    5 --
 .../sfdisk/sfdisk.001.include_sys_syscalls_h.patch |   12 -----
 package/sfdisk/sfdisk.005.no-llseek-fix.patch      |   21 --------
 package/sfdisk/sfdisk.010.index-rindex-fix-2.patch |   45 ------------------
 package/sfdisk/sfdisk.mk                           |   49 --------------------
 6 files changed, 0 insertions(+), 136 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index da0a093..52fe824 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -199,10 +199,6 @@ source "package/picocom/Config.in"
 source "package/rng-tools/Config.in"
 source "package/sdparm/Config.in"
 source "package/setserial/Config.in"
-if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-# busybox has fdisk
-source "package/sfdisk/Config.in"
-endif
 source "package/smartmontools/Config.in"
 source "package/squashfs/Config.in"
 source "package/squashfs3/Config.in"
diff --git a/package/sfdisk/Config.in b/package/sfdisk/Config.in
deleted file mode 100644
index c5b84be..0000000
--- a/package/sfdisk/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_SFDISK
-	bool "sfdisk"
-	depends on BR2_DEPRECATED
-	help
-	  Partition table manipulator for Linux.
diff --git a/package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch b/package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch
deleted file mode 100644
index dd35951..0000000
--- a/package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- sfdisk/sfdisk.c.oorig	2006-10-09 16:24:06.000000000 +0200
-+++ sfdisk/sfdisk.c	2006-10-09 16:24:20.000000000 +0200
-@@ -47,6 +47,9 @@
- #include <sys/stat.h>
- #include <sys/utsname.h>
- #ifdef __linux__
-+#define _LIBC
-+#include <sys/syscall.h>
-+#undef _LIBC
- #include <linux/unistd.h>	/* _syscall */
- #endif
- #include "nls.h"
diff --git a/package/sfdisk/sfdisk.005.no-llseek-fix.patch b/package/sfdisk/sfdisk.005.no-llseek-fix.patch
deleted file mode 100644
index 4ea571c..0000000
--- a/package/sfdisk/sfdisk.005.no-llseek-fix.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-diff -ur sfdisk_vanilla/sfdisk.c sfdisk_llseek-fix/sfdisk.c
---- sfdisk_vanilla/sfdisk.c	2004-01-13 13:03:11.000000000 +0000
-+++ sfdisk_llseek-fix/sfdisk.c	2008-04-17 08:42:35.000000000 +0000
-@@ -134,9 +137,17 @@
-  * Note: we use 512-byte sectors here, irrespective of the hardware ss.
-  */
- #if defined(__linux__) && !defined (__alpha__) && !defined (__ia64__) && !defined (__x86_64__) && !defined (__s390x__)
-+#if defined(_llseek)
- static
- _syscall5(int,  _llseek,  unsigned int,  fd, ulong, hi, ulong, lo,
-        loff_t *, res, unsigned int, wh);
-+#else
-+static int _llseek (unsigned int fd, unsigned long oh,
-+		unsigned long ol, long long *result,
-+		unsigned int origin) {
-+	return syscall (__NR__llseek, fd, oh, ol, result, origin);
-+#endif
-+}
- #endif
- 
- static int
diff --git a/package/sfdisk/sfdisk.010.index-rindex-fix-2.patch b/package/sfdisk/sfdisk.010.index-rindex-fix-2.patch
deleted file mode 100644
index b3ca81d..0000000
--- a/package/sfdisk/sfdisk.010.index-rindex-fix-2.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-diff -ru sfdisk_vanilla/sfdisk.c sfdisk_index-rindex-fix/sfdisk.c
---- sfdisk_vanilla/sfdisk.c	2004-01-13 13:03:11.000000000 +0000
-+++ sfdisk_index-rindex-fix/sfdisk.c	2008-04-17 13:44:40.000000000 +0000
-@@ -40,7 +40,7 @@
- #include <unistd.h>		/* read, write */
- #include <fcntl.h>		/* O_RDWR */
- #include <errno.h>		/* ERANGE */
--#include <string.h>		/* index() */
-+#include <string.h>		/* strchr, strrchr */
- #include <ctype.h>
- #include <getopt.h>
- #include <sys/ioctl.h>
-@@ -1672,12 +1672,12 @@
- 	eof = 1;
- 	return RD_EOF;
-     }
--    if (!(lp = index(lp, '\n')))
-+    if (!(lp = strchr(lp, '\n')))
-       fatal(_("long or incomplete input line - quitting\n"));
-     *lp = 0;
- 
-     /* remove comments, if any */
--    if ((lp = index(line+2, '#')) != 0)
-+    if ((lp = strchr(line+2, '#')) != 0)
-       *lp = 0;
- 
-     /* recognize a few commands - to be expanded */
-@@ -1687,7 +1687,7 @@
-     }
- 
-     /* dump style? - then bad input is fatal */
--    if ((ip = index(line+2, ':')) != 0) {
-+    if ((ip = strchr(line+2, ':')) != 0) {
- 	struct dumpfld *d;
- 
-       nxtfld:
-@@ -2436,7 +2436,7 @@
- 
-     if (argc < 1)
-       fatal(_("no command?\n"));
--    if ((progn = rindex(argv[0], '/')) == NULL)
-+    if ((progn = strrchr(argv[0], '/')) == NULL)
-       progn = argv[0];
-     else
-       progn++;
diff --git a/package/sfdisk/sfdisk.mk b/package/sfdisk/sfdisk.mk
deleted file mode 100644
index 22ebeaa..0000000
--- a/package/sfdisk/sfdisk.mk
+++ /dev/null
@@ -1,49 +0,0 @@
-#############################################################
-#
-# sfdisk support
-#
-#############################################################
-SFDISK_VERSION:=
-SFDISK_SOURCE=sfdisk$(SFDISK_VERSION).tar.bz2
-SFDISK_CAT:=$(BZCAT)
-SFDISK_SITE:=http://www.uclibc.org/
-SFDISK_DIR=$(BUILD_DIR)/sfdisk$(SFDISK_VERSION)
-
-$(DL_DIR)/$(SFDISK_SOURCE):
-	$(call DOWNLOAD,$(SFDISK_SITE),$(SFDISK_SOURCE))
-
-$(SFDISK_DIR)/.patched: $(DL_DIR)/$(SFDISK_SOURCE)
-	$(SFDISK_CAT) $(DL_DIR)/$(SFDISK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	support/scripts/apply-patches.sh $(SFDISK_DIR) package/sfdisk/ sfdisk.\*.patch
-	touch $@
-
-
-$(SFDISK_DIR)/sfdisk: $(SFDISK_DIR)/.patched
-	$(MAKE) \
-		CROSS=$(TARGET_CROSS) DEBUG=false OPTIMIZATION="$(TARGET_CFLAGS)" \
-		DOLFS=$(if $(BR2_LARGEFILE),true,false) -C $(SFDISK_DIR)
-	-$(STRIPCMD) $(SFDISK_DIR)/sfdisk
-	touch -c $(SFDISK_DIR)/sfdisk
-
-$(TARGET_DIR)/sbin/sfdisk: $(SFDISK_DIR)/sfdisk
-	cp $(SFDISK_DIR)/sfdisk $(TARGET_DIR)/sbin/sfdisk
-	touch -c $(TARGET_DIR)/sbin/sfdisk
-
-sfdisk: $(TARGET_DIR)/sbin/sfdisk
-
-sfdisk-source: $(DL_DIR)/$(SFDISK_SOURCE)
-
-sfdisk-clean:
-	rm -f $(TARGET_DIR)/sbin/sfdisk
-	-$(MAKE) -C $(SFDISK_DIR) clean
-
-sfdisk-dirclean:
-	rm -rf $(SFDISK_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SFDISK),y)
-TARGETS+=sfdisk
-endif
