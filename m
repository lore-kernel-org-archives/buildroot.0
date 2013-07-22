From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Jul 2013 08:56:02 +0200
Subject: [Buildroot] [git commit] dropwatch: new package
Message-ID: <20130722065629.8F1309A161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9237f501d1fe859ae6ce5724992dd8146745ea11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: fix help text & license, needs host-pkgconf]
Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                           |    1 +
 package/dropwatch/Config.in                 |   10 +++++++++
 package/dropwatch/dropwatch-1.4-build.patch |   27 ++++++++++++++++++++++++
 package/dropwatch/dropwatch.mk              |   30 +++++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 0 deletions(-)

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
index 0000000..4c0857e
--- /dev/null
+++ b/package/dropwatch/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_DROPWATCH
+	bool "dropwatch"
+	select BR2_PACKAGE_BINUTILS
+	select BR2_PACKAGE_READLINE
+	select BR2_PACKAGE_LIBNL
+	help
+	  Dropwatch is an interactive utility for monitoring and
+	  recording packets that are dropped by the kernel
+
+	  https://fedorahosted.org/dropwatch/
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
index 0000000..6c3dc75
--- /dev/null
+++ b/package/dropwatch/dropwatch.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# dropwatch
+#
+################################################################################
+
+DROPWATCH_VERSION = 1.4
+DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.bz2
+DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot/
+DROPWATCH_DEPENDENCIES = binutils libnl readline host-pkgconf
+DROPWATCH_LICENSE = GPLv2
+DROPWATCH_LICENSE_FILES = COPYING
+
+define DROPWATCH_BUILD_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build
+endef
+
+define DROPWATCH_CLEAN_CMDS
+  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
+endef
+
+define DROPWATCH_INSTALL_TARGET_CMDS
+  $(INSTALL) -D -m 0755 $(@D)/src/dropwatch $(TARGET_DIR)/usr/bin/dropwatch
+endef
+
+define DROPWATCH_UNINSTALL_CMDS
+  rm -f $(TARGET_DIR)/usr/bin/dropwatch
+endef
+
+$(eval $(generic-package))
