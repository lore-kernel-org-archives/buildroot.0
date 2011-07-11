From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2011 22:17:16 +0200
Subject: [Buildroot] [PATCH 1/1] valgrind: bump to 3.6.1 and add support for
	ARMv7
In-Reply-To: <cover.1310415416.git.thomas.petazzoni@free-electrons.com>
References: <cover.1310415416.git.thomas.petazzoni@free-electrons.com>
Message-ID: <7ab179c630afa8f3bcafaa99934fed108cf137c5.1310415416.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We removed the shell script that wrapped valgrind (not nice to install
such non-standard things), and will let the user use the uclibc.supp
suppression file if needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/valgrind/Config.in                         |    3 +-
 package/valgrind/valgrind-3.6.1-largefile.patch    |   56 ++++++
 ...rind.patch => valgrind-3.6.1-more-ioctls.patch} |  198 ++++++++++----------
 package/valgrind/valgrind-largefile.patch          |   27 ---
 package/valgrind/valgrind.mk                       |   99 ++--------
 package/valgrind/valgrind.sh                       |   10 -
 6 files changed, 176 insertions(+), 217 deletions(-)
 create mode 100644 package/valgrind/valgrind-3.6.1-largefile.patch
 rename package/valgrind/{valgrind.patch => valgrind-3.6.1-more-ioctls.patch} (83%)
 delete mode 100644 package/valgrind/valgrind-largefile.patch
 delete mode 100755 package/valgrind/valgrind.sh

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index db1bc3b..0f656dc 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
-	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_i386 || BR2_x86_64 || BR2_cortex_a8 || \
+		   BR2_cortex_a9 || BR2_powerpc
 	help
 	  Tool for debugging and profiling Linux programs.
 
diff --git a/package/valgrind/valgrind-3.6.1-largefile.patch b/package/valgrind/valgrind-3.6.1-largefile.patch
new file mode 100644
index 0000000..d04877b
--- /dev/null
+++ b/package/valgrind/valgrind-3.6.1-largefile.patch
@@ -0,0 +1,56 @@
+[PATCH] valgrind: don't enable largefile support unconditionally on uClibc
+
+uClibc can be compiled without largefile support (and errors out if
+_FILE_OFFSET_BITS is set to 64), so don't define it if that combination
+is detected.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+
+Index: valgrind-3.6.1/coregrind/m_initimg/initimg-linux.c
+===================================================================
+--- valgrind-3.6.1.orig/coregrind/m_initimg/initimg-linux.c	2011-07-06 09:45:10.203070009 +0200
++++ valgrind-3.6.1/coregrind/m_initimg/initimg-linux.c	2011-07-06 09:45:17.343070005 +0200
+@@ -54,7 +54,11 @@
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #define _GNU_SOURCE
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #define _FILE_OFFSET_BITS 64
++#endif
+ /* This is for ELF types etc, and also the AT_ constants. */
+ #include <elf.h>
+ /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
+Index: valgrind-3.6.1/coregrind/m_main.c
+===================================================================
+--- valgrind-3.6.1.orig/coregrind/m_main.c	2011-07-06 09:44:22.203070033 +0200
++++ valgrind-3.6.1/coregrind/m_main.c	2011-07-06 09:44:42.803070024 +0200
+@@ -2797,7 +2797,11 @@
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #define _GNU_SOURCE
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #define _FILE_OFFSET_BITS 64
++#endif
+ /* This is in order to get AT_NULL and AT_PAGESIZE. */
+ #include <elf.h>
+ /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
+Index: valgrind-3.6.1/coregrind/m_ume/elf.c
+===================================================================
+--- valgrind-3.6.1.orig/coregrind/m_ume/elf.c	2011-07-06 09:44:51.343070018 +0200
++++ valgrind-3.6.1/coregrind/m_ume/elf.c	2011-07-06 09:44:58.833070015 +0200
+@@ -48,7 +48,11 @@
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #define _GNU_SOURCE
++#include <features.h>
++/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
++#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
+ #define _FILE_OFFSET_BITS 64
++#endif
+ /* This is for ELF types etc, and also the AT_ constants. */
+ #include <elf.h>
+ /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
diff --git a/package/valgrind/valgrind.patch b/package/valgrind/valgrind-3.6.1-more-ioctls.patch
similarity index 83%
rename from package/valgrind/valgrind.patch
rename to package/valgrind/valgrind-3.6.1-more-ioctls.patch
index afdd53e..62f0135 100644
--- a/package/valgrind/valgrind.patch
+++ b/package/valgrind/valgrind-3.6.1-more-ioctls.patch
@@ -1,92 +1,14 @@
---- valgrind/coregrind/m_syswrap/syswrap-amd64-linux.c.orig	2006-08-02 16:51:51.000000000 -0600
-+++ valgrind/coregrind/m_syswrap/syswrap-amd64-linux.c	2006-08-02 16:53:19.000000000 -0600
-@@ -1124,7 +1124,7 @@
-    GENXY(__NR_times,             sys_times),          // 100 
-    PLAXY(__NR_ptrace,            sys_ptrace),         // 101 
-    GENX_(__NR_getuid,            sys_getuid),         // 102 
--   //   (__NR_syslog,            sys_syslog),         // 103 
-+   LINXY(__NR_syslog,            sys_syslog),         // 103 
-    GENX_(__NR_getgid,            sys_getgid),         // 104 
- 
-    GENX_(__NR_setuid,            sys_setuid),         // 105 
---- valgrind/include/vki-linux.h.orig	2006-08-02 18:22:21.000000000 -0600
-+++ valgrind/include/vki-linux.h	2006-08-02 18:38:02.000000000 -0600
-@@ -1556,7 +1556,9 @@
- 
- #define VKI_BLKROSET   _VKI_IO(0x12,93)	/* set device read-only (0 = read-write) */
- #define VKI_BLKROGET   _VKI_IO(0x12,94)	/* get read-only status (0 = read_write) */
-+#define VKI_BLKRRPART  _VKI_IO(0x12,95) /* re-read partition table */
- #define VKI_BLKGETSIZE _VKI_IO(0x12,96) /* return device size /512 (long *arg) */
-+#define VKI_BLKFLSBUF  _VKI_IO(0x12,97) /* flush buffer cache */
- #define VKI_BLKRASET   _VKI_IO(0x12,98)	/* set read ahead for block device */
- #define VKI_BLKRAGET   _VKI_IO(0x12,99)	/* get current read ahead setting */
- #define VKI_BLKFRASET  _VKI_IO(0x12,100)/* set filesystem (mm/filemap.c) read-ahead */
-@@ -1631,6 +1633,54 @@
- //#define SG_GET_COMMAND_Q 0x2270   /* Yields 0 (queuing off) or 1 (on) */
- #define VKI_SG_SET_COMMAND_Q 0x2271   /* Change queuing state with 0 or 1 */
- 
-+
-+typedef struct vki_scsi_idlun
-+{
-+    int mux4;
-+    int host_unique_id;
-+
-+} vki_scsi_idlun_t;
-+#define VKI_SCSI_IOCTL_GET_IDLUN 0x5382		/* Gets a struct vki_scsi_idlun */
-+#define VKI_SCSI_IOCTL_PROBE_HOST 0x5385	/* Gets an arrary describing the SCSI host */
-+#define VKI_SCSI_IOCTL_GET_BUS_NUMBER 0x5386	/* Get the bus number for a device */
-+
-+//----------------------------------------------------------------------
-+// From linux-2.6.8.1/include/linux/fd.h
-+//----------------------------------------------------------------------
-+#define VKI_FDRESET 0x254		/* Takes an int by value */
-+#define VKI_FDGETDRVTYP 0x20f	/* Returns char floppy_drive_name[16] */
-+typedef struct vki_floppy_drive_struct {
-+	unsigned long flags;
-+	unsigned long spinup_date;
-+	unsigned long select_date;
-+	unsigned long first_read_date;
-+	short probed_format;
-+	short track;
-+	short maxblock;
-+	short maxtrack;
-+	int generation;
-+	int keep_data;
-+	int fd_ref;
-+	int fd_device;
-+	unsigned long last_checked;
-+	char *dmabuf;
-+	int bufblocks;
-+} vki_floppy_drive_struct_t;
-+#define VKI_FDPOLLDRVSTAT 0x213	    /* returns a struct floppy_drive_struct */
-+typedef struct vki_floppy_struct {
-+	unsigned int	size;
-+	unsigned int	sect;
-+	unsigned int	head;
-+	unsigned int	track;
-+	unsigned int	stretch;
-+	unsigned char	gap;
-+	unsigned char	rate;
-+	unsigned char	spec1;
-+	unsigned char	fmt_gap;
-+	const char	* name;
-+} vki_floppy_struct_t;
-+#define VKI_FDGETPRM 0x204	    /* returns a struct floppy_struct */
-+
- //----------------------------------------------------------------------
- // From linux-2.6.8.1/include/linux/cdrom.h
- //----------------------------------------------------------------------
-@@ -1640,6 +1690,7 @@
-                                            (struct cdrom_tochdr) */
- #define VKI_CDROMREADTOCENTRY	0x5306 /* Read TOC entry 
-                                            (struct cdrom_tocentry) */
-+#define VKI_CDROMEJECT		0x5309 /* Eject cdrom media */
- #define VKI_CDROMSUBCHNL	0x530b /* Read subchannel data 
-                                            (struct cdrom_subchnl) */
- #define VKI_CDROMREADMODE2	0x530c /* Read CDROM mode 2 data (2336 Bytes) 
---- valgrind/coregrind/m_syswrap/syswrap-generic.c.orig	2006-08-02 18:22:13.000000000 -0600
-+++ valgrind/coregrind/m_syswrap/syswrap-generic.c	2006-08-02 18:43:49.000000000 -0600
-@@ -3227,6 +3227,33 @@
+Add various ioctl()s
+
+Patch initially written by Eric Andersen <andersen@codepoet.org>.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
+===================================================================
+--- valgrind-3.6.1.orig/coregrind/m_syswrap/syswrap-linux.c	2011-07-06 09:50:32.243069845 +0200
++++ valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c	2011-07-06 09:53:39.783069751 +0200
+@@ -3900,7 +3900,33 @@
     case VKI_SG_GET_SG_TABLESIZE: /* 0x227f */
        PRE_MEM_WRITE( "ioctl(SG_GET_SG_TABLESIZE)", ARG3, sizeof(int) );
        break;
@@ -105,7 +27,7 @@
 +   case VKI_SCSI_IOCTL_GET_BUS_NUMBER:
 +      PRE_MEM_WRITE( "ioctl(SCSI_IOCTL_GET_BUS_NUMBER)", ARG3, sizeof(int) );
 +      break;
-+
+ 
 +   case VKI_FDRESET:
 +      break;
 +   case VKI_FDGETDRVTYP:
@@ -117,10 +39,10 @@
 +   case VKI_FDGETPRM:
 +      PRE_MEM_WRITE( "ioctl(FDGETPRM)", ARG3, sizeof(vki_floppy_struct_t) );
 +      break;
- 
     case VKI_IIOCGETCPS:
        PRE_MEM_WRITE( "ioctl(IIOCGETCPS)", ARG3,
-@@ -3550,6 +3578,8 @@
+ 		     VKI_ISDN_MAX_CHANNELS * 2 * sizeof(unsigned long) );
+@@ -4215,6 +4241,8 @@
     case VKI_BLKROGET:
        PRE_MEM_WRITE( "ioctl(BLKROGET)", ARG3, sizeof(int));
        break;
@@ -129,7 +51,7 @@
     case VKI_BLKGETSIZE:
        PRE_MEM_WRITE( "ioctl(BLKGETSIZE)", ARG3, sizeof(unsigned long));
        break;
-@@ -3558,6 +3588,8 @@
+@@ -4223,6 +4251,8 @@
     case VKI_BLKRAGET:
        PRE_MEM_WRITE( "ioctl(BLKRAGET)", ARG3, sizeof(long));
        break;
@@ -138,7 +60,7 @@
     case VKI_BLKFRASET:
        break;
     case VKI_BLKFRAGET:
-@@ -3624,6 +3656,8 @@
+@@ -4289,6 +4319,8 @@
        PRE_MEM_WRITE( "ioctl(CDROMREADTOCENTRY)", ARG3, 
  		     sizeof(struct vki_cdrom_tocentry));
        break;
@@ -147,7 +69,7 @@
     case VKI_CDROMMULTISESSION: /* 0x5310 */
        PRE_MEM_WRITE( "ioctl(CDROMMULTISESSION)", ARG3,
  		     sizeof(struct vki_cdrom_multisession));
-@@ -4042,6 +4076,28 @@
+@@ -4989,7 +5021,28 @@
     case VKI_SG_GET_SG_TABLESIZE:
        POST_MEM_WRITE(ARG3, sizeof(int));
        break;      
@@ -161,7 +83,7 @@
 +   case VKI_SCSI_IOCTL_GET_BUS_NUMBER:
 +      POST_MEM_WRITE(ARG3, sizeof(int));
 +      break;
-+
+ 
 +   case VKI_FDRESET:
 +      break;
 +   case VKI_FDGETDRVTYP:
@@ -173,10 +95,10 @@
 +   case VKI_FDGETPRM:
 +      POST_MEM_WRITE( ARG3, sizeof(vki_floppy_struct_t) );
 +      break;
- 
     case VKI_IIOCGETCPS:
        POST_MEM_WRITE( ARG3, VKI_ISDN_MAX_CHANNELS * 2 * sizeof(unsigned long) );
-@@ -4260,6 +4317,8 @@
+       break;
+@@ -5210,6 +5263,8 @@
     case VKI_BLKROGET:
        POST_MEM_WRITE(ARG3, sizeof(int));
        break;
@@ -185,7 +107,7 @@
     case VKI_BLKGETSIZE:
        POST_MEM_WRITE(ARG3, sizeof(unsigned long));
        break;
-@@ -4268,6 +4327,8 @@
+@@ -5218,6 +5273,8 @@
     case VKI_BLKRAGET:
        POST_MEM_WRITE(ARG3, sizeof(long));
        break;
@@ -194,7 +116,7 @@
     case VKI_BLKFRASET:
        break;
     case VKI_BLKFRAGET:
-@@ -4309,6 +4370,8 @@
+@@ -5259,6 +5316,8 @@
     case VKI_CDROMREADTOCENTRY:
        POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_tocentry));
        break;
@@ -203,3 +125,79 @@
     case VKI_CDROMMULTISESSION:
        POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_multisession));
        break;
+Index: valgrind-3.6.1/include/vki/vki-linux.h
+===================================================================
+--- valgrind-3.6.1.orig/include/vki/vki-linux.h	2011-07-06 09:48:16.733069914 +0200
++++ valgrind-3.6.1/include/vki/vki-linux.h	2011-07-06 09:49:49.413069868 +0200
+@@ -1646,7 +1646,9 @@
+ 
+ #define VKI_BLKROSET   _VKI_IO(0x12,93)	/* set device read-only (0 = read-write) */
+ #define VKI_BLKROGET   _VKI_IO(0x12,94)	/* get read-only status (0 = read_write) */
++#define VKI_BLKRRPART  _VKI_IO(0x12,95) /* re-read partition table */
+ #define VKI_BLKGETSIZE _VKI_IO(0x12,96) /* return device size /512 (long *arg) */
++#define VKI_BLKFLSBUF  _VKI_IO(0x12,97) /* flush buffer cache */
+ #define VKI_BLKRASET   _VKI_IO(0x12,98)	/* set read ahead for block device */
+ #define VKI_BLKRAGET   _VKI_IO(0x12,99)	/* get current read ahead setting */
+ #define VKI_BLKFRASET  _VKI_IO(0x12,100)/* set filesystem (mm/filemap.c) read-ahead */
+@@ -1721,6 +1723,53 @@
+ //#define SG_GET_COMMAND_Q 0x2270   /* Yields 0 (queuing off) or 1 (on) */
+ #define VKI_SG_SET_COMMAND_Q 0x2271   /* Change queuing state with 0 or 1 */
+ 
++typedef struct vki_scsi_idlun
++{
++    int mux4;
++    int host_unique_id;
++
++} vki_scsi_idlun_t;
++#define VKI_SCSI_IOCTL_GET_IDLUN 0x5382		/* Gets a struct vki_scsi_idlun */
++#define VKI_SCSI_IOCTL_PROBE_HOST 0x5385	/* Gets an arrary describing the SCSI host */
++#define VKI_SCSI_IOCTL_GET_BUS_NUMBER 0x5386	/* Get the bus number for a device */
++
++//----------------------------------------------------------------------
++// From linux-2.6.8.1/include/linux/fd.h
++//----------------------------------------------------------------------
++#define VKI_FDRESET 0x254		/* Takes an int by value */
++#define VKI_FDGETDRVTYP 0x20f	/* Returns char floppy_drive_name[16] */
++typedef struct vki_floppy_drive_struct {
++	unsigned long flags;
++	unsigned long spinup_date;
++	unsigned long select_date;
++	unsigned long first_read_date;
++	short probed_format;
++	short track;
++	short maxblock;
++	short maxtrack;
++	int generation;
++	int keep_data;
++	int fd_ref;
++	int fd_device;
++	unsigned long last_checked;
++	char *dmabuf;
++	int bufblocks;
++} vki_floppy_drive_struct_t;
++#define VKI_FDPOLLDRVSTAT 0x213	    /* returns a struct floppy_drive_struct */
++typedef struct vki_floppy_struct {
++	unsigned int	size;
++	unsigned int	sect;
++	unsigned int	head;
++	unsigned int	track;
++	unsigned int	stretch;
++	unsigned char	gap;
++	unsigned char	rate;
++	unsigned char	spec1;
++	unsigned char	fmt_gap;
++	const char	* name;
++} vki_floppy_struct_t;
++#define VKI_FDGETPRM 0x204	    /* returns a struct floppy_struct */
++
+ //----------------------------------------------------------------------
+ // From linux-2.6.8.1/include/linux/cdrom.h
+ //----------------------------------------------------------------------
+@@ -1730,6 +1779,7 @@
+                                            (struct cdrom_tochdr) */
+ #define VKI_CDROMREADTOCENTRY	0x5306 /* Read TOC entry 
+                                            (struct cdrom_tocentry) */
++#define VKI_CDROMEJECT		0x5309 /* Eject cdrom media */
+ #define VKI_CDROMSUBCHNL	0x530b /* Read subchannel data 
+                                            (struct cdrom_subchnl) */
+ #define VKI_CDROMREADMODE2	0x530c /* Read CDROM mode 2 data (2336 Bytes) 
diff --git a/package/valgrind/valgrind-largefile.patch b/package/valgrind/valgrind-largefile.patch
deleted file mode 100644
index 9ef5708..0000000
--- a/package/valgrind/valgrind-largefile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-[PATCH] valgrind: don't enable largefile support unconditionally on uClibc
-
-uClibc can be compiled without largefile support (and errors out if
-_FILE_OFFSET_BITS is set to 64), so don't define it if that combination
-is detected.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- coregrind/m_ume.c |    4 ++++
- 1 file changed, 4 insertions(+)
-
-Index: valgrind-3.2.3/coregrind/m_ume.c
-===================================================================
---- valgrind-3.2.3.orig/coregrind/m_ume.c
-+++ valgrind-3.2.3/coregrind/m_ume.c
-@@ -31,7 +31,11 @@
- 
- 
- #define _GNU_SOURCE
-+#include <features.h>
-+/* uclibc without largefile support #errors on _FILE_OFFSET_BITS=64 */
-+#if !(defined(__UCLIBC__) && !defined(__UCLIBC_HAS_LFS__))
- #define _FILE_OFFSET_BITS 64
-+#endif
- 
- // It seems that on SuSE 9.1 (x86) something in <fcntl.h> messes up stuff
- // acquired indirectly from vki-x86-linux.h.  Therefore our headers must be
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 5bf0a9d..ec7afc8 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,85 +4,26 @@
 #
 #############################################################
 
-VALGRIND_VERSION=3.2.3
-VALGRIND_SITE:=http://valgrind.org/downloads/
-VALGRIND_DIR:=$(BUILD_DIR)/valgrind-$(VALGRIND_VERSION)
-VALGRIND_SOURCE:=valgrind-$(VALGRIND_VERSION).tar.bz2
-VALGRIND_CAT:=$(BZCAT)
-
-$(DL_DIR)/$(VALGRIND_SOURCE):
-	$(call DOWNLOAD,$(VALGRIND_SITE),$(VALGRIND_SOURCE))
-
-$(VALGRIND_DIR)/.unpacked: $(DL_DIR)/$(VALGRIND_SOURCE)
-	$(VALGRIND_CAT) $(DL_DIR)/$(VALGRIND_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	touch $(VALGRIND_DIR)/.unpacked
-
-$(VALGRIND_DIR)/.patched: $(VALGRIND_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(VALGRIND_DIR) package/valgrind/ valgrind\*.patch
-	touch $(VALGRIND_DIR)/.patched
-
-$(VALGRIND_DIR)/.configured: $(VALGRIND_DIR)/.patched
-	(cd $(VALGRIND_DIR); rm -rf config.cache; \
-		$(TARGET_CONFIGURE_OPTS) \
-		$(TARGET_CONFIGURE_ARGS) \
-		CC="$(TARGET_CC) $(TARGET_CFLAGS) -I$(LINUX_HEADERS_DIR)/include" \
-		./configure $(QUIET) \
-		--target=$(GNU_TARGET_NAME) \
-		--host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) \
-		--prefix=/usr \
-		$(DISABLE_NLS) \
-		--without-uiout --disable-valgrindmi \
-		--disable-tui --disable-valgrindtk \
-		--without-x --without-included-gettext \
-		--disable-tls \
-	)
-	touch $(VALGRIND_DIR)/.configured
-
-$(VALGRIND_DIR)/coregrind/valgrind: $(VALGRIND_DIR)/.configured
-	$(MAKE) -C $(VALGRIND_DIR)
-	touch -c $@
-
-$(TARGET_DIR)/usr/bin/valgrind: $(VALGRIND_DIR)/coregrind/valgrind
-	$(MAKE) \
-	    prefix=$(TARGET_DIR)/usr \
-	    exec_prefix=$(TARGET_DIR)/usr \
-	    bindir=$(TARGET_DIR)/usr/bin \
-	    sbindir=$(TARGET_DIR)/usr/sbin \
-	    libexecdir=$(TARGET_DIR)/usr/lib \
-	    datadir=$(TARGET_DIR)/usr/share \
-	    sysconfdir=$(TARGET_DIR)/etc \
-	    sharedstatedir=$(TARGET_DIR)/usr/com \
-	    localstatedir=$(TARGET_DIR)/var \
-	    libdir=$(TARGET_DIR)/usr/lib \
-	    infodir=$(TARGET_DIR)/usr/info \
-	    mandir=$(TARGET_DIR)/usr/man \
-	    includedir=$(TARGET_DIR)/usr/include \
-	    -C $(VALGRIND_DIR) install
-	mv $(TARGET_DIR)/usr/bin/valgrind $(TARGET_DIR)/usr/bin/valgrind.bin
-	cp package/valgrind/uclibc.supp $(TARGET_DIR)/usr/lib/valgrind/
-	cp package/valgrind/valgrind.sh $(TARGET_DIR)/usr/bin/valgrind
-	chmod a+x $(TARGET_DIR)/usr/bin/valgrind
-	rm -rf $(TARGET_DIR)/usr/share/doc/valgrind
-	touch -c $@
-
-valgrind: $(TARGET_DIR)/usr/bin/valgrind
-
-valgrind-source: $(DL_DIR)/$(VALGRIND_SOURCE)
+VALGRIND_VERSION = 3.6.1
+VALGRIND_SITE    = http://valgrind.org/downloads/
+VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
+
+VALGRIND_CONF_OPT = --disable-tls
+
+# On ARM, Valgrind only supports ARMv7, and uses the arch part of the
+# host tuple to determine whether it's being built for ARMv7 or
+# not. Therefore, we adjust the host tuple to specify we're on
+# ARMv7. The valgrind package is guaranteed, through Config.in, to
+# only be selected on Cortex A8 and Cortex A9 platforms.
+ifeq ($(BR2_cortex_a8)$(BR2_cortex_a9),y)
+VALGRIND_CONF_OPT += \
+	--host=$(patsubst arm-%,armv7-unknown-%,$(GNU_TARGET_NAME))
+endif
 
-valgrind-clean:
-	-$(MAKE) -C $(VALGRIND_DIR) clean
-	-rm -f $(TARGET_DIR)/usr/bin/valgrind*
-	rm -rf $(TARGET_DIR)/usr/lib/valgrind
+define VALGRIND_INSTALL_UCLIBC_SUPP
+	install -D -m 0644 package/valgrind/uclibc.supp $(TARGET_DIR)/usr/lib/valgrind/uclibc.supp
+endef
 
-valgrind-dirclean:
-	rm -rf $(VALGRIND_DIR)
+VALGRIND_POST_INSTALL_TARGET_HOOKS += VALGRIND_INSTALL_UCLIBC_SUPP
 
-#############################################################
-#
-# Toplevel Makefile options
-#
-#############################################################
-ifeq ($(BR2_PACKAGE_VALGRIND),y)
-TARGETS+=valgrind
-endif
+$(eval $(call AUTOTARGETS,package,valgrind))
\ No newline at end of file
diff --git a/package/valgrind/valgrind.sh b/package/valgrind/valgrind.sh
deleted file mode 100755
index 4b8eb2e..0000000
--- a/package/valgrind/valgrind.sh
+++ /dev/null
@@ -1,10 +0,0 @@
-#!/bin/sh -e
-#
-# Valgrind wrapper
-
-# Use special suppression file for uClibc
-export VALGRIND_OPTS="$VALGRIND_OPTS --suppressions=/usr/lib/valgrind/uclibc.supp"
-
-# Use 'exec' to avoid having another shell process hanging around.
-exec $0.bin "$@"
-
-- 
1.7.4.1
