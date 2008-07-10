From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 10 Jul 2008 03:12:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/fuse:  patch
Message-ID: <20080710101216.423C13C7D4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-10 03:12:15 -0700 (Thu, 10 Jul 2008)
New Revision: 22751

Log:
fuse: cleanup patch handling

Move patch to package dir like other packages and fixup patch-kernel
invocation.

Added:
   trunk/buildroot/package/fuse/disable_symvers_22.patch

Removed:
   trunk/buildroot/package/fuse/patch/disable_symvers_22.patch

Modified:
   trunk/buildroot/package/fuse/libfuse.mk


Changeset:
Copied: trunk/buildroot/package/fuse/disable_symvers_22.patch (from rev 22750, trunk/buildroot/package/fuse/patch/disable_symvers_22.patch)
===================================================================
--- trunk/buildroot/package/fuse/disable_symvers_22.patch	                        (rev 0)
+++ trunk/buildroot/package/fuse/disable_symvers_22.patch	2008-07-10 10:12:15 UTC (rev 22751)
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

Modified: trunk/buildroot/package/fuse/libfuse.mk
===================================================================
--- trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:11 UTC (rev 22750)
+++ trunk/buildroot/package/fuse/libfuse.mk	2008-07-10 10:12:15 UTC (rev 22751)
@@ -13,7 +13,7 @@
 
 $(LIBFUSE_DIR)/.source: $(DL_DIR)/$(LIBFUSE_SOURCE)
 	$(ZCAT) $(DL_DIR)/$(LIBFUSE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(LIBFUSE_DIR) package/fuse/ patch/*.patch
+	toolchain/patch-kernel.sh $(LIBFUSE_DIR) package/fuse/ \*.patch
 	touch $@
 
 

Deleted: trunk/buildroot/package/fuse/patch/disable_symvers_22.patch
===================================================================
--- trunk/buildroot/package/fuse/patch/disable_symvers_22.patch	2008-07-10 10:12:11 UTC (rev 22750)
+++ trunk/buildroot/package/fuse/patch/disable_symvers_22.patch	2008-07-10 10:12:15 UTC (rev 22751)
@@ -1,56 +0,0 @@
-diff -urp fuse-2.7.0-orig/lib/fuse.c fuse-2.7.0/lib/fuse.c
---- fuse-2.7.0-orig/lib/fuse.c	2007-07-02 14:33:08.000000000 +0300
-+++ fuse-2.7.0/lib/fuse.c	2007-08-22 19:31:39.000000000 +0300
-@@ -3294,7 +3294,7 @@ __asm__(".symver fuse_process_cmd,__fuse
- __asm__(".symver fuse_read_cmd,__fuse_read_cmd@");
- __asm__(".symver fuse_set_getcontext_func,__fuse_set_getcontext_func@");
- __asm__(".symver fuse_new_compat2,fuse_new@");
--__asm__(".symver fuse_new_compat22,fuse_new at FUSE_2.2");
-+//__asm__(".symver fuse_new_compat22,fuse_new at FUSE_2.2");
- 
- #endif /* __FreeBSD__ */
- 
-diff -urp fuse-2.7.0-orig/lib/helper.c fuse-2.7.0/lib/helper.c
---- fuse-2.7.0-orig/lib/helper.c	2007-07-02 14:32:17.000000000 +0300
-+++ fuse-2.7.0/lib/helper.c	2007-08-22 19:32:40.000000000 +0300
-@@ -391,10 +391,10 @@ int fuse_mount_compat1(const char *mount
- }
- 
- __asm__(".symver fuse_setup_compat2,__fuse_setup@");
--__asm__(".symver fuse_setup_compat22,fuse_setup at FUSE_2.2");
-+//__asm__(".symver fuse_setup_compat22,fuse_setup at FUSE_2.2");
- __asm__(".symver fuse_teardown,__fuse_teardown@");
- __asm__(".symver fuse_main_compat2,fuse_main@");
--__asm__(".symver fuse_main_real_compat22,fuse_main_real at FUSE_2.2");
-+//__asm__(".symver fuse_main_real_compat22,fuse_main_real at FUSE_2.2");
- 
- #endif /* __FreeBSD__ */
- 
-@@ -428,6 +428,6 @@ int fuse_mount_compat25(const char *moun
- }
- 
- __asm__(".symver fuse_setup_compat25,fuse_setup at FUSE_2.5");
--__asm__(".symver fuse_teardown_compat22,fuse_teardown at FUSE_2.2");
-+//__asm__(".symver fuse_teardown_compat22,fuse_teardown at FUSE_2.2");
- __asm__(".symver fuse_main_real_compat25,fuse_main_real at FUSE_2.5");
- __asm__(".symver fuse_mount_compat25,fuse_mount at FUSE_2.5");
-diff -urp fuse-2.7.0-orig/lib/mount_bsd.c fuse-2.7.0/lib/mount_bsd.c
---- fuse-2.7.0-orig/lib/mount_bsd.c	2006-05-03 17:46:04.000000000 +0300
-+++ fuse-2.7.0/lib/mount_bsd.c	2007-08-22 19:31:55.000000000 +0300
-@@ -360,4 +360,4 @@ int fuse_kern_mount(const char *mountpoi
-     return res;
- }
- 
--__asm__(".symver fuse_unmount_compat22,fuse_unmount at FUSE_2.2");
-+//__asm__(".symver fuse_unmount_compat22,fuse_unmount at FUSE_2.2");
-diff -urp fuse-2.7.0-orig/lib/mount.c fuse-2.7.0/lib/mount.c
---- fuse-2.7.0-orig/lib/mount.c	2007-07-02 14:32:17.000000000 +0300
-+++ fuse-2.7.0/lib/mount.c	2007-08-22 19:31:19.000000000 +0300
-@@ -579,5 +579,5 @@ int fuse_kern_mount(const char *mountpoi
-     return res;
- }
- 
--__asm__(".symver fuse_mount_compat22,fuse_mount at FUSE_2.2");
--__asm__(".symver fuse_unmount_compat22,fuse_unmount at FUSE_2.2");
-+//__asm__(".symver fuse_mount_compat22,fuse_mount at FUSE_2.2");
-+//__asm__(".symver fuse_unmount_compat22,fuse_unmount at FUSE_2.2");
