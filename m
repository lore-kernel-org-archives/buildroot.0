From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 22 Jul 2013 00:36:53 +0200
Subject: [Buildroot] [git commit] Revert "dropwatch: new package"
Message-ID: <20130721223705.BBC829A832@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=956fa6741021cf952aefa9ddf821b9aa14be8fab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 8d228d30105079a91fed16097193601713c02198.

Was not supposed to have been pushed (yet).
---
 package/Config.in                           |    1 -
 package/dropwatch/Config.in                 |    7 ------
 package/dropwatch/dropwatch-1.4-build.patch |   27 ------------------------
 package/dropwatch/dropwatch.mk              |   30 ---------------------------
 4 files changed, 0 insertions(+), 65 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 7730317..286a605 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -22,7 +22,6 @@ source "package/cache-calibrator/Config.in"
 source "package/dhrystone/Config.in"
 source "package/dstat/Config.in"
 source "package/dmalloc/Config.in"
-source "package/dropwatch/Config.in"
 source "package/gdb/Config.in"
 source "package/iozone/Config.in"
 source "package/kexec/Config.in"
diff --git a/package/dropwatch/Config.in b/package/dropwatch/Config.in
deleted file mode 100644
index 69d7cd5..0000000
--- a/package/dropwatch/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_DROPWATCH
-	bool "dropwatch"
-	help
-	  Dropwatch is a project I am tinkering with to improve the visibility
-	  developers and sysadmins have into the Linux networking stack.
-
-	  https://git.fedorahosted.org/git/dropwatch.git
diff --git a/package/dropwatch/dropwatch-1.4-build.patch b/package/dropwatch/dropwatch-1.4-build.patch
deleted file mode 100644
index eed43e8..0000000
--- a/package/dropwatch/dropwatch-1.4-build.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 03bab84ca3f102274837e83ee6da4c997a9da018 Mon Sep 17 00:00:00 2001
-From: Tzu-Jung Lee <tjlee@ambarella.com>
-Date: Fri, 12 Jul 2013 20:00:57 +0800
-Subject: [PATCH] build: modify hardcoded gcc to support buildroot
-
-Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
-
-diff --git a/src/Makefile b/src/Makefile
-index 026b6ba..b87ae9f 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -5,10 +5,10 @@ OBJFILES := main.o lookup.o\
- 	 lookup_bfd.o lookup_kas.o
- 
- dropwatch: $(OBJFILES) 
--	gcc -g -o dropwatch $(OBJFILES) $(LDFLAGS) 
-+	$(CC) -g -o dropwatch $(OBJFILES) $(LDFLAGS)
- 
- %.o: %.c
--	gcc $(CFLAGS) $<
-+	$(CC) $(CFLAGS) $<
- clean:
- 	rm -f dropwatch *.o
- 
--- 
-1.8.3.2
-
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
deleted file mode 100644
index b9676cb..0000000
--- a/package/dropwatch/dropwatch.mk
+++ /dev/null
@@ -1,30 +0,0 @@
-#############################################################
-#
-# dropwatch
-#
-#############################################################
-
-DROPWATCH_VERSION = 1.4
-DROPWATCH_SOURCE = dropwatch-$(DROPWATCH_VERSION).tar.bz2
-DROPWATCH_SITE = https://git.fedorahosted.org/cgit/dropwatch.git/snapshot/
-DROPWATCH_DEPENDENCIES = readline libnl binutils
-DROPWATCH_LICENSE = GPLv2+
-DROPWATCH_LICENSE_FILE = COPYING
-
-define DROPWATCH_INSTALL_TARGET_CMDS
-  cp $(@D)/src/dropwatch $(TARGET_DIR)/usr/bin
-endef
-
-define DROPWATCH_BUILD_CMDS
-  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) build
-endef
-
-define DROPWATCH_CLEAN_CMDS
-  $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) clean
-endef
-
-define DROPWATCH_UNINSTALL_CMDS
-  rm -f $(TARGET_DIR)/usr/bin/dropwatch
-endef
-
-$(eval $(generic-package))
