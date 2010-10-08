From: Martin Banky <martin.banky@gmail.com>
Date: Fri,  8 Oct 2010 01:43:04 -0700
Subject: [Buildroot] [PATCH 5/9] sfdisk: convert to autotargets and change
	to util-linux-ng v2.18 version
In-Reply-To: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
References: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286527389-29983-5-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/sfdisk/Config.in                           |    2 +
 .../sfdisk/sfdisk.001.include_sys_syscalls_h.patch |   12 ---
 package/sfdisk/sfdisk.005.no-llseek-fix.patch      |   21 -----
 package/sfdisk/sfdisk.010.index-rindex-fix-2.patch |   45 ----------
 package/sfdisk/sfdisk.mk                           |   87 ++++++++++++--------
 5 files changed, 54 insertions(+), 113 deletions(-)
 delete mode 100644 package/sfdisk/sfdisk.001.include_sys_syscalls_h.patch
 delete mode 100644 package/sfdisk/sfdisk.005.no-llseek-fix.patch
 delete mode 100644 package/sfdisk/sfdisk.010.index-rindex-fix-2.patch

diff --git a/package/sfdisk/Config.in b/package/sfdisk/Config.in
index d7b8fb4..a86a529 100644
--- a/package/sfdisk/Config.in
+++ b/package/sfdisk/Config.in
@@ -2,3 +2,5 @@ config BR2_PACKAGE_SFDISK
 	bool "sfdisk"
 	help
 	  Partition table manipulator for Linux.
+
+	  http://www.kernel.org/pub/linux/utils/util-linux-ng/
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
index 81c4943..00e8b4d 100644
--- a/package/sfdisk/sfdisk.mk
+++ b/package/sfdisk/sfdisk.mk
@@ -3,47 +3,64 @@
 # sfdisk support
 #
 #############################################################
-SFDISK_VERSION:=
-SFDISK_SOURCE=sfdisk$(SFDISK_VERSION).tar.bz2
-SFDISK_CAT:=$(BZCAT)
-SFDISK_SITE:=http://www.uclibc.org/
-SFDISK_DIR=$(BUILD_DIR)/sfdisk$(SFDISK_VERSION)
+SFDISK_VERSION = 2.18
+SFDISK_SOURCE = util-linux-ng-$(SFDISK_VERSION).tar.bz2
+SFDISK_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux-ng/$(SFDISK_VERSION)
 
-$(DL_DIR)/$(SFDISK_SOURCE):
-	$(call DOWNLOAD,$(SFDISK_SITE),$(SFDISK_SOURCE))
-
-$(SFDISK_DIR)/.patched: $(DL_DIR)/$(SFDISK_SOURCE)
-	$(SFDISK_CAT) $(DL_DIR)/$(SFDISK_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SFDISK_DIR) package/sfdisk/ sfdisk.\*.patch
-	touch $@
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+ifeq ($(BR2_USE_WCHAR),)
+# build with non-wide ncurses, default is wide version
+SFDISK_CONF_OPT += --with-ncurses
+endif
+SFDISK_DEPENDENCIES += ncurses
+else
+# --without-ncurses disables all ncurses(w) support
+SFDISK_CONF_OPT += --without-ncurses
+endif
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+SFDISK_DEPENDENCIES += gettext libintl
+SFDISK_MAKE_OPT += LIBS=-lintl
+endif
 
-$(SFDISK_DIR)/sfdisk: $(SFDISK_DIR)/.patched
-	$(MAKE) \
-		CROSS=$(TARGET_CROSS) DEBUG=false OPTIMIZATION="$(TARGET_CFLAGS)" \
-		DOLFS=$(if $(BR2_LARGEFILE),true,false) -C $(SFDISK_DIR)
-	-$(STRIPCMD) $(SFDISK_DIR)/sfdisk
-	touch -c $(SFDISK_DIR)/sfdisk
+ifneq ($(BR2_GCC_ENABLE_TLS),y)
+SFDISK_CONF_OPT += --disable-tls
+endif
 
-$(TARGET_DIR)/sbin/sfdisk: $(SFDISK_DIR)/sfdisk
-	cp $(SFDISK_DIR)/sfdisk $(TARGET_DIR)/sbin/sfdisk
-	touch -c $(TARGET_DIR)/sbin/sfdisk
+SFDISK_CONF_OPT += --datadir=/usr/share \
+		--localstatedir=/var \
+		--disable-rpath \
+		--disable-mount \
+		--disable-fsck \
+		--disable-libuuid \
+		--disable-uuidd \
+		--disable-libblkid \
+		--disable-libmount \
+		--disable-agetty \
+		--disable-cramfs \
+		--disable-switch_root \
+		--disable-pivot_root \
+		--disable-fallocate \
+		--disable-unshare \
+		--disable-rename \
+		--disable-schedutils \
+		--disable-login-utils \
+		--disable-partx
 
-sfdisk: $(TARGET_DIR)/sbin/sfdisk
+define SFDISK_BUILD_CMDS
+	(cd $(@D); \
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/fdisk sfdisk \
+	)
+endef
 
-sfdisk-source: $(DL_DIR)/$(SFDISK_SOURCE)
+define SFDISK_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/fdisk/sfdisk $(TARGET_DIR)/sbin/sfdisk
+	$(INSTALL) -D -m 0644 $(@D)/fdisk/sfdisk.8 $(TARGET_DIR)/usr/share/man/man8/sfdisk.8
+endef
 
-sfdisk-clean:
+define SFDISK_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/sbin/sfdisk
-	-$(MAKE) -C $(SFDISK_DIR) clean
+	rm -f $(TARGET_DIR)/usr/share/man/man8/sfdisk.8
+endef
 
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
+$(eval $(call AUTOTARGETS,package,sfdisk))
-- 
1.7.3.1
