From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Sat, 24 Nov 2007 08:09:35 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package: fuse fuse/patch
	ntfs-3g
Message-ID: <20071124160935.9418830040@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-24 08:09:25 -0800 (Sat, 24 Nov 2007)
New Revision: 20527

Log:
add fuse and nfs-3g packages

Added:
   trunk/buildroot/package/fuse/
   trunk/buildroot/package/fuse/Config.in
   trunk/buildroot/package/fuse/libfuse.mk
   trunk/buildroot/package/fuse/patch/
   trunk/buildroot/package/fuse/patch/disable_symvers_22.patch
   trunk/buildroot/package/ntfs-3g/
   trunk/buildroot/package/ntfs-3g/Config.in
   trunk/buildroot/package/ntfs-3g/ntfs-3g.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-11-24 04:49:07 UTC (rev 20526)
+++ trunk/buildroot/package/Config.in	2007-11-24 16:09:25 UTC (rev 20527)
@@ -224,6 +224,7 @@
 source "package/dm/Config.in"
 source "package/dmraid/Config.in"
 source "package/e2fsprogs/Config.in"
+source "package/fuse/Config.in"
 source "package/gadgetfs-test/Config.in"
 source "package/hal/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
@@ -241,6 +242,7 @@
 source "package/memtester/Config.in"
 source "package/mkdosfs/Config.in"
 source "package/mtd/Config.in"
+source "package/ntfs-3g/Config.in"
 source "package/pciutils/Config.in"
 source "package/pcmcia/Config.in"
 source "package/raidtools/Config.in"

Added: trunk/buildroot/package/fuse/Config.in
===================================================================
--- trunk/buildroot/package/fuse/Config.in	                        (rev 0)
+++ trunk/buildroot/package/fuse/Config.in	2007-11-24 16:09:25 UTC (rev 20527)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBFUSE
+        bool "libfuse"
+        default n
+        help
+	  FUSE (Filesystem in UserSpacE)
+
+	  http://fuse.sourceforge.net/

Added: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	                        (rev 0)
+++ trunk/buildroot/package/fuse/libfuse.mk	2007-11-24 16:09:25 UTC (rev 20527)
@@ -0,0 +1,83 @@
+#############################################################
+#
+# libfuse
+#
+#############################################################
+LIBFUSE_VERSION:=2.7.0
+LIBFUSE_SOURCE:=fuse-$(LIBFUSE_VERSION).tar.gz
+LIBFUSE_SITE:=http://downloads.sourceforge.net/fuse
+LIBFUSE_DIR:=$(BUILD_DIR)/fuse-$(LIBFUSE_VERSION)
+LIBFUSE_BINARY:=libfuse
+$(DL_DIR)/$(LIBFUSE_SOURCE):
+	$(WGET) -P $(DL_DIR) $(LIBFUSE_SITE)/$(LIBFUSE_SOURCE)
+
+$(LIBFUSE_DIR)/.source: $(DL_DIR)/$(LIBFUSE_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(LIBFUSE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(LIBFUSE_DIR) package/fuse/ patch/*.patch
+	touch $@
+
+
+$(LIBFUSE_DIR)/.configured: $(LIBFUSE_DIR)/.source
+	(cd $(LIBFUSE_DIR); rm -rf config.cache ; \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--enable-shared \
+		--enable-static \
+		--program-prefix="" \
+		--disable-nls \
+		--disable-example \
+		--enable-kernel-module \
+		--enable-lib \
+		--enable-util \
+		--with-kernel="$(LINUX_DIR)" \
+	);
+	touch $@
+#		--disable-example
+#		--disable-mtab
+#		--disable-rpath
+
+ 
+$(LIBFUSE_DIR)/.compiled: $(LIBFUSE_DIR)/.configured
+	$(MAKE) CC=$(TARGET_CC) -C $(LIBFUSE_DIR)
+	touch $@
+#		CROSS_COMPILE="$(TARGET_CROSS)"
+#		AM_CFLAGS="$(TARGET_CFLAGS) -DDISABLE_COMPAT=1" \
+#		EXTRA_DIST=""
+
+
+$(STAGING_DIR)/usr/lib/libfuse.so: $(LIBFUSE_DIR)/.compiled
+	$(MAKE) prefix=$/usr -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR)/ install
+	touch -c $@
+
+$(TARGET_DIR)/usr/lib/libfuse.so: $(STAGING_DIR)/usr/lib/libfuse.so
+	mkdir -p $(TARGET_DIR)/usr/lib
+	mkdir -p $(TARGET_DIR)/usr/bin
+	cp -dpf $(STAGING_DIR)/usr/bin/fusermount $(TARGET_DIR)/usr/bin/
+	cp -dpf $(STAGING_DIR)/usr/lib/libfuse.so.* $(TARGET_DIR)/usr/lib/
+#	cp -dpf $(STAGING_DIR)/lib/modules/(uname-r)/kernel/fs/fuse/fuse.pc $(TARGET_DIR)/usr/lib/
+	touch -c $@
+
+libfuse: uclibc $(TARGET_DIR)/usr/lib/libfuse.so
+
+libfuse-source: $(DL_DIR)/$(LIBFUSE_SOURCE)
+
+libfuse-clean:
+	-$(MAKE) -C $(LIBFUSE_DIR) DESTDIR=$(STAGING_DIR) uninstall
+	-$(MAKE) -C $(LIBFUSE_DIR) clean
+	rm -f $(TARGET_DIR)/usr/lib/libfuse.so*
+
+libfuse-dirclean:
+	rm -rf $(LIBFUSE_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+ifeq ($(strip $(BR2_PACKAGE_LIBFUSE)),y)
+TARGETS+=libfuse
+endif

Added: trunk/buildroot/package/fuse/patch/disable_symvers_22.patch
===================================================================
--- trunk/buildroot/package/fuse/patch/disable_symvers_22.patch	                        (rev 0)
+++ trunk/buildroot/package/fuse/patch/disable_symvers_22.patch	2007-11-24 16:09:25 UTC (rev 20527)
@@ -0,0 +1,56 @@
+diff -urp fuse-2.7.0-orig/lib/fuse.c fuse-2.7.0/lib/fuse.c
+--- fuse-2.7.0-orig/lib/fuse.c	2007-07-02 14:33:08.000000000 +0300
++++ fuse-2.7.0/lib/fuse.c	2007-08-22 19:31:39.000000000 +0300
+@@ -3294,7 +3294,7 @@ __asm__(".symver fuse_process_cmd,__fuse
+ __asm__(".symver fuse_read_cmd,__fuse_read_cmd@");
+ __asm__(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@");
+ __asm__(".symver fuse_new_compat2,fuse_new@");
+-__asm__(".symver fuse_new_compat22,fuse_new at FUSE_2.2");
++//__asm__(".symver fuse_new_compat22,fuse_new at FUSE_2.2");
+ 
+ #endif /* __FreeBSD__ */
+ 
+diff -urp fuse-2.7.0-orig/lib/helper.c fuse-2.7.0/lib/helper.c
+--- fuse-2.7.0-orig/lib/helper.c	2007-07-02 14:32:17.000000000 +0300
++++ fuse-2.7.0/lib/helper.c	2007-08-22 19:32:40.000000000 +0300
+@@ -391,10 +391,10 @@ int fuse_mount_compat1(const char *mount
+ }
+ 
+ __asm__(".symver fuse_setup_compat2,__fuse_setup@");
+-__asm__(".symver fuse_setup_compat22,fuse_setup at FUSE_2.2");
++//__asm__(".symver fuse_setup_compat22,fuse_setup at FUSE_2.2");
+ __asm__(".symver fuse_teardown,__fuse_teardown@");
+ __asm__(".symver fuse_main_compat2,fuse_main@");
+-__asm__(".symver fuse_main_real_compat22,fuse_main_real at FUSE_2.2");
++//__asm__(".symver fuse_main_real_compat22,fuse_main_real at FUSE_2.2");
+ 
+ #endif /* __FreeBSD__ */
+ 
+@@ -428,6 +428,6 @@ int fuse_mount_compat25(const char *moun
+ }
+ 
+ __asm__(".symver fuse_setup_compat25,fuse_setup at FUSE_2.5");
+-__asm__(".symver fuse_teardown_compat22,fuse_teardown at FUSE_2.2");
++//__asm__(".symver fuse_teardown_compat22,fuse_teardown at FUSE_2.2");
+ __asm__(".symver fuse_main_real_compat25,fuse_main_real at FUSE_2.5");
+ __asm__(".symver fuse_mount_compat25,fuse_mount at FUSE_2.5");
+diff -urp fuse-2.7.0-orig/lib/mount_bsd.c fuse-2.7.0/lib/mount_bsd.c
+--- fuse-2.7.0-orig/lib/mount_bsd.c	2006-05-03 17:46:04.000000000 +0300
++++ fuse-2.7.0/lib/mount_bsd.c	2007-08-22 19:31:55.000000000 +0300
+@@ -360,4 +360,4 @@ int fuse_kern_mount(const char *mountpoi
+     return res;
+ }
+ 
+-__asm__(".symver fuse_unmount_compat22,fuse_unmount at FUSE_2.2");
++//__asm__(".symver fuse_unmount_compat22,fuse_unmount at FUSE_2.2");
+diff -urp fuse-2.7.0-orig/lib/mount.c fuse-2.7.0/lib/mount.c
+--- fuse-2.7.0-orig/lib/mount.c	2007-07-02 14:32:17.000000000 +0300
++++ fuse-2.7.0/lib/mount.c	2007-08-22 19:31:19.000000000 +0300
+@@ -579,5 +579,5 @@ int fuse_kern_mount(const char *mountpoi
+     return res;
+ }
+ 
+-__asm__(".symver fuse_mount_compat22,fuse_mount at FUSE_2.2");
+-__asm__(".symver fuse_unmount_compat22,fuse_unmount at FUSE_2.2");
++//__asm__(".symver fuse_mount_compat22,fuse_mount at FUSE_2.2");
++//__asm__(".symver fuse_unmount_compat22,fuse_unmount at FUSE_2.2");

Added: trunk/buildroot/package/ntfs-3g/Config.in
===================================================================
--- trunk/buildroot/package/ntfs-3g/Config.in	                        (rev 0)
+++ trunk/buildroot/package/ntfs-3g/Config.in	2007-11-24 16:09:25 UTC (rev 20527)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_NTFS-3G
+        bool "ntfs-3g"
+        default n
+        help
+	  The NTFS-3G driver is an open source, freely available read/write NTFS driver for Linux, FreeBSD, Mac OS X, NetBSD, and Haiku. It provides safe and fast handling of the Windows XP, Windows Server 2003, Windows 2000 and Windows Vista file systems. Most POSIX file system operations are supported, with the exception of full file ownership and access right support.
+
+	  http://www.ntfs-3g.org/

Added: trunk/buildroot/package/ntfs-3g/ntfs-3g.mk
===================================================================
--- trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	                        (rev 0)
+++ trunk/buildroot/package/ntfs-3g/ntfs-3g.mk	2007-11-24 16:09:25 UTC (rev 20527)
@@ -0,0 +1,82 @@
+#############################################################
+#
+# ntfs-3g
+#
+#############################################################
+NTFS-3G_VERSION:=1.810
+NTFS-3G_SOURCE:=ntfs-3g-$(NTFS-3G_VERSION).tgz
+NTFS-3G_SITE:=www.ntfs-3g.org
+NTFS-3G_DIR:=$(BUILD_DIR)/ntfs-3g-$(NTFS-3G_VERSION)
+NTFS-3G_BINARY:=ntfs-3g
+
+
+$(DL_DIR)/$(NTFS-3G_SOURCE):
+	$(WGET) -P $(DL_DIR) $(NTFS-3G_SITE)/$(NTFS-3G_SOURCE)
+
+$(NTFS-3G_DIR)/.source: $(DL_DIR)/$(NTFS-3G_SOURCE)
+	$(ZCAT) $(DL_DIR)/$(NTFS-3G_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	touch $@
+
+$(NTFS-3G_DIR)/.configured: $(NTFS-3G_DIR)/.source
+	(cd $(NTFS-3G_DIR); rm -rf config.cache ; \
+	$(TARGET_CONFIGURE_OPTS) \
+	CFLAGS="$(TARGET_CFLAGS)" \
+		./configure \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--libdir=/usr/lib \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libexecdir=/usr/lib \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--includedir=/usr/include \
+		--program-prefix="" \
+		--with-gnu-ld \
+		--enable-shared \
+		--enable-static \
+		, \
+		ac_cv_path_LDCONFIG=""\
+	);
+	touch $@
+ 
+$(NTFS-3G_DIR)/.compiled: $(NTFS-3G_DIR)/.configured
+	$(MAKE) prefix=$/usr CC=$(TARGET_CC)-C $(NTFS-3G_DIR)
+	touch $@
+#		CROSS_COMPILE="$(TARGET_CROSS)"
+
+
+ 
+$(STAGING_DIR)/usr/bin/ntfs-3g: $(NTFS-3G_DIR)/.compiled
+	$(MAKE) prefix=$/usr -C $(NTFS-3G_DIR) DESTDIR=$(STAGING_DIR)/ install
+	touch -c $@
+
+$(TARGET_DIR)/usr/bin/ntfs-3g: $(STAGING_DIR)/usr/bin/ntfs-3g
+	cp -dpf $(STAGING_DIR)/usr/lib/libntfs-3g.so.* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/bin/ntfs-3g $(TARGET_DIR)/usr/bin/
+	touch -c $@
+
+ntfs-3g: uclibc pkgconfig libfuse $(TARGET_DIR)/usr/bin/ntfs-3g
+
+ntfs-3g-source: $(DL_DIR)/$(NTFS-3G_SOURCE)
+
+ntfs-3g-clean:
+	$(MAKE) prefix=$(STAGING_DIR)/usr -C $(NTFS-3G_DIR) uninstall
+	rm -f $(TARGET_DIR)/usr/lib/libntfs-3g*
+	rm -f $(TARGET_DIR)/usr/bin/ntfs-3g
+	-$(MAKE) -C $(NTFS-3G_DIR) clean
+
+ntfs-3g-dirclean:
+	rm -rf $(NTFS-3G_DIR)
+
+#############################################################
+#
+# Toplevel Makefile options
+#
+#############################################################
+#ifeq ($(strip $(BR2_PACKAGE_NTFS-3G)),y)
+TARGETS+=ntfs-3g
+#endif
