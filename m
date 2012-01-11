From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Jan 2012 11:11:58 -0300
Subject: [Buildroot] [PATCH 1/2] unionfs: new package
Message-ID: <1326291119-24184-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the unionfs FUSE unification filesystem.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/Config.in                         |    1 +
 package/unionfs/Config.in                 |   12 ++++++++++++
 package/unionfs/unionfs-make-mandir.patch |   15 +++++++++++++++
 package/unionfs/unionfs.mk                |   20 ++++++++++++++++++++
 4 files changed, 48 insertions(+), 0 deletions(-)
 create mode 100644 package/unionfs/Config.in
 create mode 100644 package/unionfs/unionfs-make-mandir.patch
 create mode 100644 package/unionfs/unionfs.mk

diff --git a/package/Config.in b/package/Config.in
index 6c8a9ed..5016dc7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -212,6 +212,7 @@ source "package/sysstat/Config.in"
 source "package/ti-utils/Config.in"
 source "package/uboot-tools/Config.in"
 source "package/udev/Config.in"
+source "package/unionfs/Config.in"
 source "package/usb_modeswitch/Config.in"
 source "package/usbmount/Config.in"
 source "package/usbutils/Config.in"
diff --git a/package/unionfs/Config.in b/package/unionfs/Config.in
new file mode 100644
index 0000000..0c330c9
--- /dev/null
+++ b/package/unionfs/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_UNIONFS
+	bool "unionfs (FUSE)"
+	select BR2_PACKAGE_LIBFUSE
+	depends on BR2_LARGEFILE
+	help
+	  
+	  A userspace unionfs implementation.
+
+	  http://http://podgorny.cz/moin/UnionFsFuse
+
+comment "unionfs requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
diff --git a/package/unionfs/unionfs-make-mandir.patch b/package/unionfs/unionfs-make-mandir.patch
new file mode 100644
index 0000000..bf3c241
--- /dev/null
+++ b/package/unionfs/unionfs-make-mandir.patch
@@ -0,0 +1,15 @@
+Make the man directory if it's missing before installing the man page.
+Already upstream see http://hg.podgorny.cz/unionfs-fuse/rev/6ca07ad1b855
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura unionfs-fuse-0.24.orig/Makefile unionfs-fuse-0.24/Makefile
+--- unionfs-fuse-0.24.orig/Makefile	2010-05-20 08:04:08.000000000 -0300
++++ unionfs-fuse-0.24/Makefile	2012-01-11 08:08:02.382667776 -0300
+@@ -9,5 +9,6 @@
+ 
+ install: build
+ 	install -d $(DESTDIR)$(PREFIX)$(BINDIR)
++	install -d $(DESTDIR)$(PREFIX)/share/man/man8
+ 	install -m 0755 src/unionfs $(DESTDIR)$(PREFIX)$(BINDIR)
+ 	install -m 0644 man/unionfs-fuse.8 $(DESTDIR)$(PREFIX)/share/man/man8/
diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
new file mode 100644
index 0000000..b0bc93b
--- /dev/null
+++ b/package/unionfs/unionfs.mk
@@ -0,0 +1,20 @@
+#############################################################
+#
+# unionfs
+#
+#############################################################
+
+UNIONFS_VERSION = 0.24
+UNIONFS_SITE = http://podgorny.cz/unionfs-fuse/releases
+UNIONFS_SOURCE = unionfs-fuse-$(UNIONFS_VERSION).tar.bz2
+UNIONFS_DEPENDENCIES = libfuse
+
+define UNIONFS_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+endef
+
+define UNIONFS_INSTALL_TARGET_CMDS
+	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
+endef
+
+$(eval $(call GENTARGETS))
-- 
1.7.3.4
