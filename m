From: Tzu-Jung Lee <roylee17@gmail.com>
Date: Sat, 20 Jul 2013 09:34:09 +0800
Subject: [Buildroot] [PATCH v2 1/1] dropwatch: new package
Message-ID: <1374284049-8159-1-git-send-email-tjlee@ambarella.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
---
 package/Config.in                           |  1 +
 package/dropwatch/Config.in                 |  7 +++++++
 package/dropwatch/dropwatch-1.4-build.patch | 27 ++++++++++++++++++++++++++
 package/dropwatch/dropwatch.mk              | 30 +++++++++++++++++++++++++++++
 4 files changed, 65 insertions(+)
 create mode 100644 package/dropwatch/Config.in
 create mode 100644 package/dropwatch/dropwatch-1.4-build.patch
 create mode 100644 package/dropwatch/dropwatch.mk

diff --git a/package/Config.in b/package/Config.in
index 286a605..7730317 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -22,6 +22,7 @@ source "package/cache-calibrator/Config.in"
 source "package/dhrystone/Config.in"
 source "package/dstat/Config.in"
 source "package/dmalloc/Config.in"
+source "package/dropwatch/Config.in"
 source "package/gdb/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
new file mode 100644
index 0000000..69d7cd5
--- /dev/null
+++ b/package/dropwatch/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_DROPWATCH
+	bool "dropwatch"
+	help
+	  Dropwatch is a project I am tinkering with to improve the visibility
+	  developers and sysadmins have into the Linux networking stack.
+
+	  https://git.fedorahosted.org/git/dropwatch.git
diff --git a/package/dropwatch/dropwatch-1.4-build.patch b/package/dropwatch/dropwatch-1.4-build.patch
new file mode 100644
index 0000000..eed43e8
--- /dev/null
+++ b/package/dropwatch/dropwatch-1.4-build.patch
@@ -0,0 +1,27 @@
+From 03bab84ca3f102274837e83ee6da4c997a9da018 Mon Sep 17 00:00:00 2001
+From: Tzu-Jung Lee <tjlee@ambarella.com>
+Date: Fri, 12 Jul 2013 20:00:57 +0800
+Subject: [PATCH] build: modify hardcoded gcc to support buildroot
+
+Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
+
+diff --git a/src/Makefile b/src/Makefile
+index 026b6ba..b87ae9f 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -5,10 +5,10 @@ OBJFILES := main.o lookup.o\
+ 	 lookup_bfd.o lookup_kas.o
+ 
+ dropwatch: $(OBJFILES) 
+-	gcc -g -o dropwatch $(OBJFILES) $(LDFLAGS) 
++	$(CC) -g -o dropwatch $(OBJFILES) $(LDFLAGS)
+ 
+ %.o: %.c
+-	gcc $(CFLAGS) $<
++	$(CC) $(CFLAGS) $<
+ clean:
+ 	rm -f dropwatch *.o
+ 
+-- 
+1.8.3.2
+
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
new file mode 100644
index 0000000..b9676cb
--- /dev/null
+++ b/package/dropwatch/dropwatch.mk
@@ -0,0 +1,30 @@
+#############################################################
+#
+# dropwatch
+#
+#############################################################
+
+DROPWATCH_VERSION = 1.4
+DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.bz2
+DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot/
+DROPWATCH_DEPENDENCIES = readline libnl binutils
+DROPWATCH_LICENSE = GPLv2+
+DROPWATCH_LICENSE_FILE = COPYING
+
+define DROPWATCH_INSTALL_TARGET_CMDS
+  cp $(@D)/src/dropwatch $(TARGET_DIR)/usr/bin
+endef
+
+define DROPWATCH_BUILD_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build
+endef
+
+define DROPWATCH_CLEAN_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
+define DROPWATCH_UNINSTALL_CMDS
+  rm -f $(TARGET_DIR)/usr/bin/dropwatch
+endef
+
+$(eval $(generic-package))
-- 
1.8.3.2
