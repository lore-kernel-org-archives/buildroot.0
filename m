From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] squashfs3: new package
Message-ID: <20100409142133.CF53320E73@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=5ef9fe7e53956ab0a213f64c02366fbfb996bd83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the old squashfs 3.x tools, so that squashfs 3.x root
filesystems can be generated.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/squashfs3/Config.in                        |    7 ++++
 .../squashfs3/squashfs-3.4-build-system-fix.patch  |   28 ++++++++++++++++++
 package/squashfs3/squashfs3.mk                     |   30 ++++++++++++++++++++
 4 files changed, 66 insertions(+), 0 deletions(-)
 create mode 100644 package/squashfs3/Config.in
 create mode 100644 package/squashfs3/squashfs-3.4-build-system-fix.patch
 create mode 100644 package/squashfs3/squashfs3.mk

diff --git a/package/Config.in b/package/Config.in
index 0dac949..877a87e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -189,6 +189,7 @@ source "package/sfdisk/Config.in"
 endif
 source "package/smartmontools/Config.in"
 source "package/squashfs/Config.in"
+source "package/squashfs3/Config.in"
 source "package/sshfs/Config.in"
 source "package/sysstat/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/squashfs3/Config.in b/package/squashfs3/Config.in
new file mode 100644
index 0000000..2f7033d
--- /dev/null
+++ b/package/squashfs3/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SQUASHFS3
+	bool "squashfs3"
+	depends on BR2_DEPRECATED
+	help
+	  Tools to generate SquashFS 3.x filesystems.
+
+	  http://squashfs.sourceforge.net/
diff --git a/package/squashfs3/squashfs-3.4-build-system-fix.patch b/package/squashfs3/squashfs-3.4-build-system-fix.patch
new file mode 100644
index 0000000..5b86b00
--- /dev/null
+++ b/package/squashfs3/squashfs-3.4-build-system-fix.patch
@@ -0,0 +1,28 @@
+[PATCH]: squashfs-tools: Handle user supplied CFLAGS/LDFLAGS
+
+Properly handle make CFLAGS=.. LDFLAGS=..
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ squashfs-tools/Makefile |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: squashfs3.4/squashfs-tools/Makefile
+===================================================================
+--- squashfs3.4.orig/squashfs-tools/Makefile
++++ squashfs3.4/squashfs-tools/Makefile
+@@ -2,12 +2,12 @@ INSTALL_DIR = /usr/local/bin
+ 
+ INCLUDEDIR = .
+ 
+-CFLAGS := -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
++override CFLAGS += -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
+ 
+ all: mksquashfs unsquashfs
+ 
+ mksquashfs: mksquashfs.o read_fs.o sort.o
+-	$(CC) mksquashfs.o read_fs.o sort.o -lz -lpthread -lm -o $@
++	$(CC) $(LDFLAGS) mksquashfs.o read_fs.o sort.o -lz -lpthread -lm -o $@
+ 
+ mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h
+ 
diff --git a/package/squashfs3/squashfs3.mk b/package/squashfs3/squashfs3.mk
new file mode 100644
index 0000000..5504b14
--- /dev/null
+++ b/package/squashfs3/squashfs3.mk
@@ -0,0 +1,30 @@
+SQUASHFS3_VERSION=3.4
+SQUASHFS3_SOURCE=squashfs$(SQUASHFS3_VERSION).tar.gz
+SQUASHFS3_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
+
+SQUASHFS3_DEPENDENCIES = zlib
+HOST_SQUASHFS3_DEPENDENCIES = host-zlib
+
+define SQUASHFS3_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE)    \
+   CC="$(TARGET_CC)"           \
+   CFLAGS="$(TARGET_CFLAGS)"   \
+   LDFLAGS="$(TARGET_LDFLAGS)" \
+   -C $(@D)/squashfs-tools/
+endef
+
+define SQUASHFS3_INSTALL_TARGET_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
+endef
+
+define HOST_SQUASHFS3_BUILD_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/
+endef
+
+define HOST_SQUASHFS3_INSTALL_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
+endef
+
+$(eval $(call GENTARGETS,package,squashfs3))
+$(eval $(call GENTARGETS,package,squashfs3,host))
+
-- 
1.6.3.3
