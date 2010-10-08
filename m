From: Martin Banky <martin.banky@gmail.com>
Date: Fri,  8 Oct 2010 01:43:07 -0700
Subject: [Buildroot] [PATCH 8/9] sysvint: convert to gentargets and bump to
	2.88
In-Reply-To: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
References: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286527389-29983-8-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, changed the site to Debian, to get the latest patches

As for the BR2_PACKAGE_UTIL_LINUX_NG variable, its in preparation for the,
hopefully soon, conversion to util-linux-ng

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/sysklogd/-sysklogd-susv3-legacy.patch |   20 ------
 package/sysklogd/-sysklogd.patch              |   91 -------------------------
 package/sysvinit/sysvinit-2.86-gentoo.patch   |    9 ---
 package/sysvinit/sysvinit.mk                  |   71 +++++++++----------
 4 files changed, 34 insertions(+), 157 deletions(-)
 delete mode 100644 package/sysklogd/-sysklogd-susv3-legacy.patch
 delete mode 100644 package/sysklogd/-sysklogd.patch
 delete mode 100644 package/sysvinit/sysvinit-2.86-gentoo.patch

diff --git a/package/sysklogd/-sysklogd-susv3-legacy.patch b/package/sysklogd/-sysklogd-susv3-legacy.patch
deleted file mode 100644
index 7e9a294..0000000
--- a/package/sysklogd/-sysklogd-susv3-legacy.patch
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
diff --git a/package/sysklogd/-sysklogd.patch b/package/sysklogd/-sysklogd.patch
deleted file mode 100644
index 393a1a3..0000000
--- a/package/sysklogd/-sysklogd.patch
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
diff --git a/package/sysvinit/sysvinit-2.86-gentoo.patch b/package/sysvinit/sysvinit-2.86-gentoo.patch
deleted file mode 100644
index 06b9e15..0000000
--- a/package/sysvinit/sysvinit-2.86-gentoo.patch
+++ /dev/null
@@ -1,9 +0,0 @@
---- sysvinit/src/Makefile
-+++ sysvinit/src/Makefile
-@@ -10,5 +10,3 @@
- 
--CC	= gcc
--CFLAGS	= -Wall -O2 -fomit-frame-pointer -D_GNU_SOURCE
--LDFLAGS	= -s
-+CFLAGS	+= -Wall -D_GNU_SOURCE
- STATIC	=
diff --git a/package/sysvinit/sysvinit.mk b/package/sysvinit/sysvinit.mk
index ef7c713..9d0a6d1 100644
--- a/package/sysvinit/sysvinit.mk
+++ b/package/sysvinit/sysvinit.mk
@@ -3,50 +3,47 @@
 # sysvinit
 #
 #############################################################
-SYSVINIT_VERSION:=2.86
-SYSVINIT_SOURCE:=sysvinit-$(SYSVINIT_VERSION).tar.gz
-SYSVINIT_SITE:=ftp://ftp.cistron.nl/pub/people/miquels/software
-SYSVINIT_DIR:=$(BUILD_DIR)/sysvinit-$(SYSVINIT_VERSION)
-SYSVINIT_CAT:=$(ZCAT)
-SYSVINIT_BINARY:=src/init
-SYSVINIT_TARGET_BINARY:=sbin/init
-
-$(DL_DIR)/$(SYSVINIT_SOURCE):
-	$(call DOWNLOAD,$(SYSVINIT_SITE),$(SYSVINIT_SOURCE))
-
-sysvinit-unpacked: $(SYSVINIT_DIR)/.unpacked
-$(SYSVINIT_DIR)/.unpacked: $(DL_DIR)/$(SYSVINIT_SOURCE)
-	$(SYSVINIT_CAT) $(DL_DIR)/$(SYSVINIT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SYSVINIT_DIR) package/sysvinit/ sysvinit-\*.patch
-	touch $@
-
-$(SYSVINIT_DIR)/$(SYSVINIT_BINARY): $(SYSVINIT_DIR)/.unpacked
+SYSVINIT_VERSION = 2.88
+SYSVINIT_SOURCE = sysvinit_$(SYSVINIT_VERSION)dsf.orig.tar.gz
+SYSVINIT_PATCH = sysvinit_$(SYSVINIT_VERSION)dsf-12.diff.gz
+SYSVINIT_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysvinit
+
+# Add util-linux-ng as dependency so shutdown is the sysvinit version
+ifeq ($(BR2_PACKAGE_UTIL_LINUX_NG),y)
+SYSVINIT_DEPENDENCIES = util-linux-ng
+endif
+
+ifneq ($(SYSVINIT_PATCH),)
+define SYSVINIT_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+	fi
+endef
+endif
+
+SYSVINIT_POST_PATCH_HOOKS = SYSVINIT_DEBIAN_PATCHES
+
+define SYSVINIT_BUILD_CMDS
 	# Force sysvinit to link against libcrypt as it otherwise
 	# use an incorrect test to see if it's available
-	CFLAGS="$(TARGET_CFLAGS)" $(MAKE) CC="$(TARGET_CC)" LCRYPT="-lcrypt" -C $(SYSVINIT_DIR)/src
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" LCRYPT="-lcrypt" -C $(@D)/src
+endef
 
-$(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY): $(SYSVINIT_DIR)/$(SYSVINIT_BINARY)
+define SYSVINIT_INSTALL_TARGET_CMDS
 	for x in halt init shutdown; do \
-		install -D $(SYSVINIT_DIR)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
+		install -D -m 0755 $(@D)/src/$$x $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
+endef
 
-sysvinit: $(TARGET_DIR)/$(SYSVINIT_TARGET_BINARY)
-
-sysvinit-source: $(DL_DIR)/$(SYSVINIT_SOURCE)
-
-sysvinit-clean:
+define SYSVINIT_UNINSTALL_TARGET_CMDS
 	for x in halt init shutdown; do \
 		rm -f $(TARGET_DIR)/sbin/$$x || exit 1; \
 	done
-	-$(MAKE) -C $(SYSVINIT_DIR) clean
+endef
 
-sysvinit-dirclean:
-	rm -rf $(SYSVINIT_DIR)
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_SYSVINIT),y)
-TARGETS+=sysvinit
-endif
+define SYSVINIT_CLEAN_CMDS
+	$(MAKE) -C $(@D) clean
+endef
+
+$(eval $(call GENTARGETS,package,sysvinit))
-- 
1.7.3.1
