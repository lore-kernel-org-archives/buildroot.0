From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Wed, 14 Apr 2010 01:06:02 +0200
Subject: [Buildroot] [PATCH 29/41] valgrind: bump to 3.5.0
In-Reply-To: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
Message-ID: <1271199974-30434-30-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Lionel Landwerlin <llandwerlin@gmail.com>

Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
---
 package/valgrind/valgrind-largefile.patch |   27 ----
 package/valgrind/valgrind.mk              |    7 +-
 package/valgrind/valgrind.patch           |  205 -----------------------------
 3 files changed, 6 insertions(+), 233 deletions(-)
 delete mode 100644 package/valgrind/valgrind-largefile.patch
 delete mode 100644 package/valgrind/valgrind.patch

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
index ef36023..29d0691 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,10 +4,15 @@
 #
 #############################################################
 
-VALGRIND_VERSION = 3.2.3
+VALGRIND_VERSION = 3.5.0
 VALGRIND_SITE = http://valgrind.org/downloads/
 VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
 
+VALGRIND_CONF_ENV = \
+	ac_cv_file__proc_self_fd=yes \
+	ac_cv_file__proc_self_exe=yes \
+	ac_cv_file__proc_self_maps=yes
+
 VALGRIND_CONF_OPT = \
 	--without-uiout \
 	--disable-valgrindmi \
diff --git a/package/valgrind/valgrind.patch b/package/valgrind/valgrind.patch
deleted file mode 100644
index afdd53e..0000000
--- a/package/valgrind/valgrind.patch
+++ /dev/null
@@ -1,205 +0,0 @@
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
-    case VKI_SG_GET_SG_TABLESIZE: /* 0x227f */
-       PRE_MEM_WRITE( "ioctl(SG_GET_SG_TABLESIZE)", ARG3, sizeof(int) );
-       break;
-+   case VKI_SCSI_IOCTL_GET_IDLUN:
-+      PRE_MEM_WRITE( "ioctl(SCSI_IOCTL_GET_IDLUN)", ARG3, sizeof(vki_scsi_idlun_t) );
-+      break;
-+   case VKI_SCSI_IOCTL_PROBE_HOST:
-+      {
-+	  int arraylen;
-+	  char *array = (char*)ARG3;
-+	  PRE_MEM_READ("ioctl(SCSI_IOCTL_PROBE_HOST)",  ARG3, sizeof(char)*4 );
-+	  arraylen = array[0] + (array[1]<<8) + (array[2]<<16) + (array[3]<<24);
-+	  PRE_MEM_WRITE( "ioctl(SCSI_IOCTL_PROBE_HOST)", ARG3, sizeof(char)*arraylen );
-+      }
-+      break;
-+   case VKI_SCSI_IOCTL_GET_BUS_NUMBER:
-+      PRE_MEM_WRITE( "ioctl(SCSI_IOCTL_GET_BUS_NUMBER)", ARG3, sizeof(int) );
-+      break;
-+
-+   case VKI_FDRESET:
-+      break;
-+   case VKI_FDGETDRVTYP:
-+      PRE_MEM_WRITE( "ioctl(FDGETDRVTYP)", ARG3, sizeof(char)*16 );
-+      break;
-+   case VKI_FDPOLLDRVSTAT:
-+      PRE_MEM_WRITE( "ioctl(FDPOLLDRVSTAT)", ARG3, sizeof(vki_floppy_drive_struct_t) );
-+      break;
-+   case VKI_FDGETPRM:
-+      PRE_MEM_WRITE( "ioctl(FDGETPRM)", ARG3, sizeof(vki_floppy_struct_t) );
-+      break;
- 
-    case VKI_IIOCGETCPS:
-       PRE_MEM_WRITE( "ioctl(IIOCGETCPS)", ARG3,
-@@ -3550,6 +3578,8 @@
-    case VKI_BLKROGET:
-       PRE_MEM_WRITE( "ioctl(BLKROGET)", ARG3, sizeof(int));
-       break;
-+   case VKI_BLKRRPART:
-+      break;
-    case VKI_BLKGETSIZE:
-       PRE_MEM_WRITE( "ioctl(BLKGETSIZE)", ARG3, sizeof(unsigned long));
-       break;
-@@ -3558,6 +3588,8 @@
-    case VKI_BLKRAGET:
-       PRE_MEM_WRITE( "ioctl(BLKRAGET)", ARG3, sizeof(long));
-       break;
-+   case VKI_BLKFLSBUF:
-+      break;
-    case VKI_BLKFRASET:
-       break;
-    case VKI_BLKFRAGET:
-@@ -3624,6 +3656,8 @@
-       PRE_MEM_WRITE( "ioctl(CDROMREADTOCENTRY)", ARG3, 
- 		     sizeof(struct vki_cdrom_tocentry));
-       break;
-+   case VKI_CDROMEJECT:
-+      break;
-    case VKI_CDROMMULTISESSION: /* 0x5310 */
-       PRE_MEM_WRITE( "ioctl(CDROMMULTISESSION)", ARG3,
- 		     sizeof(struct vki_cdrom_multisession));
-@@ -4042,6 +4076,28 @@
-    case VKI_SG_GET_SG_TABLESIZE:
-       POST_MEM_WRITE(ARG3, sizeof(int));
-       break;      
-+   case VKI_SCSI_IOCTL_GET_IDLUN:
-+      POST_MEM_WRITE(ARG3, sizeof(vki_scsi_idlun_t));
-+      break;
-+   case VKI_SCSI_IOCTL_PROBE_HOST:
-+      if (RES > 0 && ARG3 )
-+	  POST_MEM_WRITE(ARG3, sizeof(char)*RES);
-+      break;
-+   case VKI_SCSI_IOCTL_GET_BUS_NUMBER:
-+      POST_MEM_WRITE(ARG3, sizeof(int));
-+      break;
-+
-+   case VKI_FDRESET:
-+      break;
-+   case VKI_FDGETDRVTYP:
-+      POST_MEM_WRITE( ARG3, sizeof(char)*16 );
-+      break;
-+   case VKI_FDPOLLDRVSTAT:
-+      POST_MEM_WRITE( ARG3, sizeof(vki_floppy_drive_struct_t) );
-+      break;
-+   case VKI_FDGETPRM:
-+      POST_MEM_WRITE( ARG3, sizeof(vki_floppy_struct_t) );
-+      break;
- 
-    case VKI_IIOCGETCPS:
-       POST_MEM_WRITE( ARG3, VKI_ISDN_MAX_CHANNELS * 2 * sizeof(unsigned long) );
-@@ -4260,6 +4317,8 @@
-    case VKI_BLKROGET:
-       POST_MEM_WRITE(ARG3, sizeof(int));
-       break;
-+   case VKI_BLKRRPART:
-+      break;
-    case VKI_BLKGETSIZE:
-       POST_MEM_WRITE(ARG3, sizeof(unsigned long));
-       break;
-@@ -4268,6 +4327,8 @@
-    case VKI_BLKRAGET:
-       POST_MEM_WRITE(ARG3, sizeof(long));
-       break;
-+   case VKI_BLKFLSBUF:
-+      break;
-    case VKI_BLKFRASET:
-       break;
-    case VKI_BLKFRAGET:
-@@ -4309,6 +4370,8 @@
-    case VKI_CDROMREADTOCENTRY:
-       POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_tocentry));
-       break;
-+   case VKI_CDROMEJECT:
-+      break;
-    case VKI_CDROMMULTISESSION:
-       POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_multisession));
-       break;
-- 
1.7.0.4
