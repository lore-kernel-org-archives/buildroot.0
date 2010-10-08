From: Martin Banky <martin.banky@gmail.com>
Date: Fri,  8 Oct 2010 01:43:06 -0700
Subject: [Buildroot] [PATCH 7/9] sysklogd: convert to gentargets and bump to
	1.5
In-Reply-To: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
References: <1286527389-29983-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <1286527389-29983-7-git-send-email-Martin.Banky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also, changed the site to Debian, to get the latest patches

Signed-off-by: Martin Banky <Martin.Banky@gmail.com>
---
 package/sysklogd/-sysklogd-susv3-legacy.patch |   20 ++++++
 package/sysklogd/-sysklogd.patch              |   91 +++++++++++++++++++++++++
 package/sysklogd/sysklogd-susv3-legacy.patch  |   20 ------
 package/sysklogd/sysklogd.mk                  |   85 +++++++++++------------
 package/sysklogd/sysklogd.patch               |   91 -------------------------
 5 files changed, 151 insertions(+), 156 deletions(-)
 create mode 100644 package/sysklogd/-sysklogd-susv3-legacy.patch
 create mode 100644 package/sysklogd/-sysklogd.patch
 delete mode 100644 package/sysklogd/sysklogd-susv3-legacy.patch
 delete mode 100644 package/sysklogd/sysklogd.patch

diff --git a/package/sysklogd/-sysklogd-susv3-legacy.patch b/package/sysklogd/-sysklogd-susv3-legacy.patch
new file mode 100644
index 0000000..7e9a294
--- /dev/null
+++ b/package/sysklogd/-sysklogd-susv3-legacy.patch
@@ -0,0 +1,20 @@
+[PATCH] replace susv3 legacy functions with modern equivalents
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ syslog.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: sysklogd-1.4.1/syslog.c
+===================================================================
+--- sysklogd-1.4.1.orig/syslog.c
++++ sysklogd-1.4.1/syslog.c
+@@ -178,7 +178,7 @@
+ 		return;
+ 	(void)strcat(tbuf, "\r\n");
+ 	cnt += 2;
+-	p = index(tbuf, '>') + 1;
++	p = strchr(tbuf, '>') + 1;
+ 	(void)write(fd, p, cnt - (p - tbuf));
+ 	(void)close(fd);
+ }
diff --git a/package/sysklogd/-sysklogd.patch b/package/sysklogd/-sysklogd.patch
new file mode 100644
index 0000000..393a1a3
--- /dev/null
+++ b/package/sysklogd/-sysklogd.patch
@@ -0,0 +1,91 @@
+--- sysklogd-1.4.1/module.h.orig	1970-01-01 10:00:00.000000000 +1000
++++ sysklogd-1.4.1/module.h	2005-11-24 01:40:09.000000000 +1000
+@@ -0,0 +1,62 @@
++/* this file eliminates the need to include <kernel/module.h> */
++/* Module definitions for klogd's module support */
++struct kernel_sym
++{
++	        unsigned long value;
++	        char name[60];
++};
++
++struct module_symbol
++{
++	unsigned long value;
++	const char *name;
++};
++
++struct module_ref
++{
++	struct module *dep;     /* "parent" pointer */
++	struct module *ref;     /* "child" pointer */
++	struct module_ref *next_ref;
++};
++
++struct module_info
++{
++	unsigned long addr;
++	unsigned long size;
++	unsigned long flags;
++	long usecount;
++};
++
++
++typedef struct { volatile int counter; } atomic_t;
++
++struct module
++{
++	unsigned long size_of_struct;   /* == sizeof(module) */
++	struct module *next;
++	const char *name;
++	unsigned long size;
++	
++	union
++	{
++		atomic_t usecount;
++		long pad;
++        } uc;                           /* Needs to keep its size - so says rth */
++	
++	unsigned long flags;            /* AUTOCLEAN et al */
++	
++	unsigned nsyms;
++	unsigned ndeps;
++	
++	struct module_symbol *syms;
++	struct module_ref *deps;
++	struct module_ref *refs;
++	int (*init)(void);
++	void (*cleanup)(void);
++	const struct exception_table_entry *ex_table_start;
++	const struct exception_table_entry *ex_table_end;
++#ifdef __alpha__
++	unsigned long gp;
++#endif
++};
++	
+
+--- sysklogd-1.4.1/ksym_mod.c.orig	2005-11-24 23:15:01.000000000 +1000
++++ sysklogd-1.4.1/ksym_mod.c	2005-11-24 23:11:54.000000000 +1000
+@@ -89,17 +89,21 @@
+ #include <errno.h>
+ #include <sys/fcntl.h>
+ #include <sys/stat.h>
++#include <linux/version.h>
+ #if !defined(__GLIBC__)
+ #include <linux/time.h>
+ #include <linux/module.h>
+ #else /* __GLIBC__ */
++#if LINUX_VERSION_CODE >= 0x20500
++#include "module.h"
++#else
+ #include <linux/module.h>
++#endif
+ extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
+ extern int get_kernel_syms __P ((struct kernel_sym *__table));
+ #endif /* __GLIBC__ */
+ #include <stdarg.h>
+ #include <paths.h>
+-#include <linux/version.h>
+ 
+ #include "klogd.h"
+ #include "ksyms.h"
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
index 7333dfd..4731753 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -3,59 +3,54 @@
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
+SYSKLOGD_VERSION = 1.5
+SYSKLOGD_SOURCE = sysklogd_$(SYSKLOGD_VERSION).orig.tar.gz
+SYSKLOGD_PATCH = sysklogd_$(SYSKLOGD_VERSION)-5.diff.gz
+SYSKLOGD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sysklogd
+
+ifneq ($(SYSKLOGD_PATCH),)
+define SYSKLOGD_DEBIAN_PATCHES
+	if [ -d $(@D)/debian/patches ]; then \
+		toolchain/patch-kernel.sh $(@D) $(@D)/debian/patches \*.patch; \
+	fi
+endef
+endif
 
-$(SYSKLOGD_DIR)/.unpacked: $(DL_DIR)/$(SYSKLOGD_SOURCE)
-	$(ZCAT) $(DL_DIR)/$(SYSKLOGD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(SYSKLOGD_DIR) package/sysklogd/ sysklogd\*.patch
-	touch $(SYSKLOGD_DIR)/.unpacked
+SYSKLOGD_POST_PATCH_HOOKS = SYSKLOGD_DEBIAN_PATCHES
 
-$(SYSKLOGD_DIR)/$(SYSKLOGD_BINARY): $(SYSKLOGD_DIR)/.unpacked
-	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(SYSKLOGD_DIR)
-	$(STRIPCMD) $(SYSKLOGD_DIR)/$(SYSKLOGD_SYSLOGD_BINARY)
-	$(STRIPCMD) $(SYSKLOGD_DIR)/$(SYSKLOGD_KLOGD_BINARY)
+define SYSKLOGD_BUILD_CMDS
+	$(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
+endef
 
-$(TARGET_DIR)/$(SYSKLOGD_TARGET_BINARY): $(SYSKLOGD_DIR)/$(SYSKLOGD_BINARY)
-	$(INSTALL) -m 0755 -D $(SYSKLOGD_DIR)/$(SYSKLOGD_SYSLOGD_BINARY) $(TARGET_DIR)/$(SYSKLOGD_SYSLOGD_TARGET_BINARY)
-	$(INSTALL) -m 0755 -D $(SYSKLOGD_DIR)/$(SYSKLOGD_KLOGD_BINARY) $(TARGET_DIR)/$(SYSKLOGD_KLOGD_TARGET_BINARY)
+define SYSKLOGD_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0500 $(@D)/syslogd $(TARGET_DIR)/usr/sbin/syslogd
+	$(INSTALL) -D -m 0500 $(@D)/klogd $(TARGET_DIR)/usr/sbin/klogd
+	$(INSTALL) -D -m 0644 $(@D)/sysklogd.8 $(TARGET_DIR)/usr/share/man/man8/sysklogd.8
+	$(INSTALL) -D -m 0644 $(@D)/syslogd.8 $(TARGET_DIR)/usr/share/man/man8/syslogd.8
+	$(INSTALL) -D -m 0644 $(@D)/syslog.conf.5 $(TARGET_DIR)/usr/share/man/man5/syslog.conf.5
+	$(INSTALL) -D -m 0644 $(@D)/klogd.8 $(TARGET_DIR)/usr/share/man/man8/klogd.8
 	if [ ! -f $(TARGET_DIR)/etc/init.d/S25syslog ]; then \
-		$(INSTALL) -m 0755 -D package/sysklogd/S25syslog $(TARGET_DIR)/etc/init.d; \
+		$(INSTALL) -D -m 0755 package/sysklogd/S25syslog $(TARGET_DIR)/etc/init.d; \
 	fi
 	if [ ! -f $(TARGET_DIR)/etc/syslog.conf ]; then \
-		$(INSTALL) -m 0644 -D package/sysklogd/syslog.conf $(TARGET_DIR)/etc/syslog.conf; \
+		$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf $(TARGET_DIR)/etc/syslog.conf; \
 	fi
-
-sysklogd: $(TARGET_DIR)/$(SYSKLOGD_TARGET_BINARY)
-
-sysklogd-clean:
-	rm -f $(TARGET_DIR)/$(SYSKLOGD_SYSLOGD_TARGET_BINARY)
-	rm -f $(TARGET_DIR)/$(SYSKLOGD_KLOGD_TARGET_BINARY)
+endef
+
+define SYSKLOGD_UNINSTALL_TARGET_CMDS
+	rm -f $(TARGET_DIR)/usr/sbin/syslogd
+	rm -f $(TARGET_DIR)/usr/sbin/klogd
+	rm -f $(TARGET_DIR)/usr/share/man/man8/sysklogd.8
+	rm -f $(TARGET_DIR)/usr/share/man/man8/syslogd.8
+	rm -f $(TARGET_DIR)/usr/share/man/man5/syslog.conf.5
+	rm -f $(TARGET_DIR)/usr/share/man/man8/klogd.8
 	rm -f $(TARGET_DIR)/etc/init.d/S25syslogd
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
1.7.3.1
