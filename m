From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] genromfs: add new package
Message-ID: <20100409142121.EBDE620E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0fe8279abf852dedfdfcbe8db6384056a125a8f5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/genromfs/Config.in                         |    6 ++++
 package/genromfs/genromfs-0.5.2-build-system.patch |   26 ++++++++++++++++
 package/genromfs/genromfs.mk                       |   31 ++++++++++++++++++++
 4 files changed, 64 insertions(+), 0 deletions(-)
 create mode 100644 package/genromfs/Config.in
 create mode 100644 package/genromfs/genromfs-0.5.2-build-system.patch
 create mode 100644 package/genromfs/genromfs.mk

diff --git a/package/Config.in b/package/Config.in
index 6a695cb..9c75fcc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -159,6 +159,7 @@ source "package/eeprog/Config.in"
 source "package/fconfig/Config.in"
 source "package/fis/Config.in"
 source "package/gadgetfs-test/Config.in"
+source "package/genromfs/Config.in"
 source "package/gvfs/Config.in"
 source "package/hal/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/genromfs/Config.in b/package/genromfs/Config.in
new file mode 100644
index 0000000..2caf2a4
--- /dev/null
+++ b/package/genromfs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_GENROMFS
+       bool "genromfs"
+       help
+         Tool to generate a ROMFS filesystem.
+
+	 http://romfs.sourceforge.net/
\ No newline at end of file
diff --git a/package/genromfs/genromfs-0.5.2-build-system.patch b/package/genromfs/genromfs-0.5.2-build-system.patch
new file mode 100644
index 0000000..827fe75
--- /dev/null
+++ b/package/genromfs/genromfs-0.5.2-build-system.patch
@@ -0,0 +1,26 @@
+---
+ Makefile |    4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+Index: genromfs-0.5.2/Makefile
+===================================================================
+--- genromfs-0.5.2.orig/Makefile
++++ genromfs-0.5.2/Makefile
+@@ -6,8 +6,6 @@
+ PACKAGE = genromfs
+ VERSION = 0.5.2
+ CC = gcc
+-CFLAGS = -O2 -Wall -DVERSION=\"$(VERSION)\"#-g#
+-LDFLAGS = -s#-g
+ 
+ DISTDIR = $(PACKAGE)-$(VERSION)
+ 
+@@ -24,7 +22,7 @@
+ 	$(CC) $(LDFLAGS) genromfs.o -o genromfs
+ 
+ .c.o:
+-	$(CC) $(CFLAGS) $< -c -o $@
++	$(CC) $(CFLAGS) -DVERSION=\"$(VERSION)\" $< -c -o $@
+ 
+ clean:
+ 	rm -f genromfs *.o
diff --git a/package/genromfs/genromfs.mk b/package/genromfs/genromfs.mk
new file mode 100644
index 0000000..10b8d7d
--- /dev/null
+++ b/package/genromfs/genromfs.mk
@@ -0,0 +1,31 @@
+#############################################################
+#
+# genromfs
+#
+#############################################################
+
+GENROMFS_VERSION=0.5.2
+GENROMFS_SOURCE=genromfs-$(GENROMFS_VERSION).tar.gz
+GENROMFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/romfs
+
+define GENROMFS_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+    CC="$(TARGET_CC)" \
+    CFLAGS="$(TARGET_CFLAGS)" \
+    LDFLAGS="$(TARGET_LDFLAGS)"
+endef
+
+define GENROMFS_INSTALL_TARGET_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(TARGET_DIR) install
+endef
+
+define HOST_GENROMFS_BUILD_CMDS
+  $(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_GENROMFS_INSTALL_CMDS
+  $(HOST_MAKE_ENV) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
+endef
+
+$(eval $(call GENTARGETS,package,genromfs))
+$(eval $(call GENTARGETS,package,genromfs,host))
\ No newline@end of file
-- 
1.6.3.3
