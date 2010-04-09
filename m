From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Apr 2010 16:19:13 +0200
Subject: [Buildroot] [git commit master] squashfs: new package
Message-ID: <20100409142122.9CEE620E41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c040b2c0105120bcd71046e346842f9917b4445a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 package/squashfs/Config.in                         |    6 ++
 .../squashfs/squashfs-4.0-build-system-fix.patch   |   60 ++++++++++++++++++++
 ...quashfs-4.0-mksquashfs-race-condition-fix.patch |    0
 package/squashfs/squashfs.mk                       |   30 ++++++++++
 5 files changed, 97 insertions(+), 0 deletions(-)
 create mode 100644 package/squashfs/Config.in
 create mode 100644 package/squashfs/squashfs-4.0-build-system-fix.patch
 rename {target => package}/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch (100%)
 create mode 100644 package/squashfs/squashfs.mk

diff --git a/package/Config.in b/package/Config.in
index 5a7bf27..a742063 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -187,6 +187,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/sfdisk/Config.in"
 endif
 source "package/smartmontools/Config.in"
+source "package/squashfs/Config.in"
 source "package/sshfs/Config.in"
 source "package/sysstat/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/squashfs/Config.in b/package/squashfs/Config.in
new file mode 100644
index 0000000..3080cc3
--- /dev/null
+++ b/package/squashfs/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_SQUASHFS
+	bool "squashfs"
+	help
+	  Tools to generate SquashFS filesystems.
+
+	  http://squashfs.sourceforge.net/
diff --git a/package/squashfs/squashfs-4.0-build-system-fix.patch b/package/squashfs/squashfs-4.0-build-system-fix.patch
new file mode 100644
index 0000000..9db208b
--- /dev/null
+++ b/package/squashfs/squashfs-4.0-build-system-fix.patch
@@ -0,0 +1,60 @@
+Index: a/squashfs-tools/Makefile
+===================================================================
+--- a/squashfs-tools.orig/Makefile	2009-04-19 01:47:43.000000000 +0200
++++ b/squashfs-tools/Makefile	2009-04-19 01:52:36.000000000 +0200
+@@ -1,36 +1,48 @@
+ INSTALL_DIR = /usr/local/bin
+ 
+ INCLUDEDIR = .
++CFLAGS_R = -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE
++LIBS = -lz -lpthread
+ 
+ CFLAGS := -I$(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_GNU_SOURCE -O2
+ 
+ all: mksquashfs unsquashfs
+ 
+ mksquashfs: mksquashfs.o read_fs.o sort.o swap.o pseudo.o
+-	$(CC) mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o $@
++	$(CC) $(LDFLAGS) mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o $@
+ 
+ mksquashfs.o: mksquashfs.c squashfs_fs.h mksquashfs.h global.h sort.h squashfs_swap.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ read_fs.o: read_fs.c squashfs_fs.h read_fs.h global.h squashfs_swap.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ sort.o: sort.c squashfs_fs.h global.h sort.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ swap.o: swap.c Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ pseudo.o: pseudo.c pseudo.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ unsquashfs: unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o
+-	$(CC) unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o -lz -lpthread -lm -o $@
++	$(CC) $(LDFLAGS) unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o unsquash-4.o swap.o -lz -lpthread -lm -o $@
+ 
+-unsquashfs.o: unsquashfs.h unsquashfs.c squashfs_fs.h squashfs_swap.h squashfs_compat.h global.h Makefile
++unsquashfs.o: unsquashfs.c unsquashfs.h squashfs_fs.h squashfs_swap.h squashfs_compat.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+-unsquash-1.o: unsquashfs.h unsquash-1.c squashfs_fs.h squashfs_compat.h global.h Makefile
++unsquash-1.o: unsquash-1.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+-unsquash-2.o: unsquashfs.h unsquash-2.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
++unsquash-2.o: unsquash-2.c unsquashfs.h unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+-unsquash-3.o: unsquashfs.h unsquash-3.c squashfs_fs.h squashfs_compat.h global.h Makefile
++unsquash-3.o: unsquash-3.c unsquashfs.h squashfs_fs.h squashfs_compat.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+-unsquash-4.o: unsquashfs.h unsquash-4.c squashfs_fs.h squashfs_swap.h global.h Makefile
++unsquash-4.o: unsquash-4.c unsquashfs.h squashfs_fs.h squashfs_swap.h global.h Makefile
++	$(CC) $(CFLAGS_R) $(CFLAGS) -c -o $@ $<
+ 
+ clean:
+ 	-rm -f *.o mksquashfs unsquashfs
diff --git a/target/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch b/package/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch
similarity index 100%
rename from target/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch
rename to package/squashfs/squashfs-4.0-mksquashfs-race-condition-fix.patch
diff --git a/package/squashfs/squashfs.mk b/package/squashfs/squashfs.mk
new file mode 100644
index 0000000..ab05b06
--- /dev/null
+++ b/package/squashfs/squashfs.mk
@@ -0,0 +1,30 @@
+SQUASHFS_VERSION=4.0
+SQUASHFS_SOURCE=squashfs$(SQUASHFS_VERSION).tar.gz
+SQUASHFS_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/squashfs
+
+SQUASHFS_DEPENDENCIES = zlib
+HOST_SQUASHFS_DEPENDENCIES = host-zlib
+
+define SQUASHFS_BUILD_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE)    \
+   CC="$(TARGET_CC)"           \
+   CFLAGS="$(TARGET_CFLAGS)"   \
+   LDFLAGS="$(TARGET_LDFLAGS)" \
+   -C $(@D)/squashfs-tools/
+endef
+
+define SQUASHFS_INSTALL_TARGET_CMDS
+ $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(TARGET_DIR)/usr/bin install
+endef
+
+define HOST_SQUASHFS_BUILD_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/
+endef
+
+define HOST_SQUASHFS_INSTALL_CMDS
+ $(HOST_MAKE_ENV) $(MAKE) -C $(@D)/squashfs-tools/ INSTALL_DIR=$(HOST_DIR)/usr/bin install
+endef
+
+$(eval $(call GENTARGETS,package,squashfs))
+$(eval $(call GENTARGETS,package,squashfs,host))
+
-- 
1.6.3.3
