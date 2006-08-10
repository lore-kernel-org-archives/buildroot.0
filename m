From: andersen at uclibc.org <andersen@uclibc.org>
Date: Thu, 10 Aug 2006 13:21:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/valgrind
Message-ID: <20060810202133.9B206485BC@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-08-10 13:21:33 -0700 (Thu, 10 Aug 2006)
New Revision: 15797

Log:
update valgrind to the latest and greatest, forward port my patches.
Mental note: submit upstream


Modified:
   trunk/buildroot/package/valgrind/valgrind.mk
   trunk/buildroot/package/valgrind/valgrind.patch


Changeset:
Modified: trunk/buildroot/package/valgrind/valgrind.mk
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.mk	2006-08-10 20:08:31 UTC (rev 15796)
+++ trunk/buildroot/package/valgrind/valgrind.mk	2006-08-10 20:21:33 UTC (rev 15797)
@@ -5,8 +5,8 @@
 #############################################################
 
 VALGRIND_SITE:=http://valgrind.org/downloads/
-VALGRIND_DIR:=$(BUILD_DIR)/valgrind-2.4.0
-VALGRIND_SOURCE:=valgrind-2.4.0.tar.bz2
+VALGRIND_DIR:=$(BUILD_DIR)/valgrind-3.2.0
+VALGRIND_SOURCE:=valgrind-3.2.0.tar.bz2
 
 $(DL_DIR)/$(VALGRIND_SOURCE):
 	$(WGET) -P $(DL_DIR) $(VALGRIND_SITE)/$(VALGRIND_SOURCE)
@@ -76,7 +76,7 @@
 	#cp $(VALGRIND_DIR)/woody.supp $(TARGET_DIR)/usr/lib/valgrind/
 	touch -c $(TARGET_DIR)/usr/bin/valgrind
 
-ifeq ($(ARCH),i386)
+ifeq ($(BR2_i386),y)
 valgrind: $(TARGET_DIR)/usr/bin/valgrind
 else
 valgrind:
@@ -84,10 +84,10 @@
 
 valgrind-source: $(DL_DIR)/$(VALGRIND_SOURCE)
 
-valgrind-clean: 
+valgrind-clean:
 	$(MAKE) -C $(VALGRIND_DIR) clean
 
-valgrind-dirclean: 
+valgrind-dirclean:
 	rm -rf $(VALGRIND_DIR)
 
 #############################################################

Modified: trunk/buildroot/package/valgrind/valgrind.patch
===================================================================
--- trunk/buildroot/package/valgrind/valgrind.patch	2006-08-10 20:08:31 UTC (rev 15796)
+++ trunk/buildroot/package/valgrind/valgrind.patch	2006-08-10 20:21:33 UTC (rev 15797)
@@ -1,134 +1,205 @@
-diff -urN ../valgrind-2.4.0/coregrind/vg_syscalls.c valgrind-2.4.0/coregrind/vg_syscalls.c
---- ../valgrind-2.4.0/coregrind/vg_syscalls.c	2005-03-23 03:22:03.000000000 -0700
-+++ valgrind-2.4.0/coregrind/vg_syscalls.c	2005-07-22 03:42:01.000000000 -0600
-@@ -3266,15 +3266,34 @@
-       SYS_PRE_MEM_WRITE( "ioctl(RTC_IRQP_READ)", arg3, sizeof(unsigned long));
-       break;
+--- valgrind/coregrind/m_syswrap/syswrap-amd64-linux.c.orig	2006-08-02 16:51:51.000000000 -0600
++++ valgrind/coregrind/m_syswrap/syswrap-amd64-linux.c	2006-08-02 16:53:19.000000000 -0600
+@@ -1124,7 +1124,7 @@
+    GENXY(__NR_times,             sys_times),          // 100 
+    PLAXY(__NR_ptrace,            sys_ptrace),         // 101 
+    GENX_(__NR_getuid,            sys_getuid),         // 102 
+-   //   (__NR_syslog,            sys_syslog),         // 103 
++   LINXY(__NR_syslog,            sys_syslog),         // 103 
+    GENX_(__NR_getgid,            sys_getgid),         // 104 
  
-+   case VKI_BLKRRPART:
-+   case VKI_BLKFLSBUF:
-+      break;
-    case VKI_BLKGETSIZE:
-       SYS_PRE_MEM_WRITE( "ioctl(BLKGETSIZE)", arg3, sizeof(unsigned long));
+    GENX_(__NR_setuid,            sys_setuid),         // 105 
+--- valgrind/include/vki-linux.h.orig	2006-08-02 18:22:21.000000000 -0600
++++ valgrind/include/vki-linux.h	2006-08-02 18:38:02.000000000 -0600
+@@ -1556,7 +1556,9 @@
+ 
+ #define VKI_BLKROSET   _VKI_IO(0x12,93)	/* set device read-only (0 = read-write) */
+ #define VKI_BLKROGET   _VKI_IO(0x12,94)	/* get read-only status (0 = read_write) */
++#define VKI_BLKRRPART  _VKI_IO(0x12,95) /* re-read partition table */
+ #define VKI_BLKGETSIZE _VKI_IO(0x12,96) /* return device size /512 (long *arg) */
++#define VKI_BLKFLSBUF  _VKI_IO(0x12,97) /* flush buffer cache */
+ #define VKI_BLKRASET   _VKI_IO(0x12,98)	/* set read ahead for block device */
+ #define VKI_BLKRAGET   _VKI_IO(0x12,99)	/* get current read ahead setting */
+ #define VKI_BLKFRASET  _VKI_IO(0x12,100)/* set filesystem (mm/filemap.c) read-ahead */
+@@ -1631,6 +1633,54 @@
+ //#define SG_GET_COMMAND_Q 0x2270   /* Yields 0 (queuing off) or 1 (on) */
+ #define VKI_SG_SET_COMMAND_Q 0x2271   /* Change queuing state with 0 or 1 */
+ 
++
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
+@@ -1640,6 +1690,7 @@
+                                            (struct cdrom_tochdr) */
+ #define VKI_CDROMREADTOCENTRY	0x5306 /* Read TOC entry 
+                                            (struct cdrom_tocentry) */
++#define VKI_CDROMEJECT		0x5309 /* Eject cdrom media */
+ #define VKI_CDROMSUBCHNL	0x530b /* Read subchannel data 
+                                            (struct cdrom_subchnl) */
+ #define VKI_CDROMREADMODE2	0x530c /* Read CDROM mode 2 data (2336 Bytes) 
+--- valgrind/coregrind/m_syswrap/syswrap-generic.c.orig	2006-08-02 18:22:13.000000000 -0600
++++ valgrind/coregrind/m_syswrap/syswrap-generic.c	2006-08-02 18:43:49.000000000 -0600
+@@ -3227,6 +3227,33 @@
+    case VKI_SG_GET_SG_TABLESIZE: /* 0x227f */
+       PRE_MEM_WRITE( "ioctl(SG_GET_SG_TABLESIZE)", ARG3, sizeof(int) );
        break;
-+   case VKI_BLKGETSIZE64:
-+      SYS_PRE_MEM_WRITE( "ioctl(BLKGETSIZE64)", arg3, sizeof(__vki_u64));
++   case VKI_SCSI_IOCTL_GET_IDLUN:
++      PRE_MEM_WRITE( "ioctl(SCSI_IOCTL_GET_IDLUN)", ARG3, sizeof(vki_scsi_idlun_t) );
 +      break;
-+   case VKI_BLKSSZGET:
-+      SYS_PRE_MEM_WRITE( "ioctl(BLKSSZGET)", arg3, sizeof(unsigned long));
++   case VKI_SCSI_IOCTL_PROBE_HOST:
++      {
++	  int arraylen;
++	  char *array = (char*)ARG3;
++	  PRE_MEM_READ("ioctl(SCSI_IOCTL_PROBE_HOST)",  ARG3, sizeof(char)*4 );
++	  arraylen = array[0] + (array[1]<<8) + (array[2]<<16) + (array[3]<<24);
++	  PRE_MEM_WRITE( "ioctl(SCSI_IOCTL_PROBE_HOST)", ARG3, sizeof(char)*arraylen );
++      }
 +      break;
-+   case VKI_BLKBSZGET:
-+      SYS_PRE_MEM_WRITE( "ioctl(BLKBSZGET)", arg3, sizeof(unsigned long));
++   case VKI_SCSI_IOCTL_GET_BUS_NUMBER:
++      PRE_MEM_WRITE( "ioctl(SCSI_IOCTL_GET_BUS_NUMBER)", ARG3, sizeof(int) );
 +      break;
-+   case VKI_BLKBSZSET:
-+      SYS_PRE_MEM_READ( "ioctl(BLKBSZSET)", arg3, sizeof(unsigned long) );
++
++   case VKI_FDRESET:
 +      break;
++   case VKI_FDGETDRVTYP:
++      PRE_MEM_WRITE( "ioctl(FDGETDRVTYP)", ARG3, sizeof(char)*16 );
++      break;
++   case VKI_FDPOLLDRVSTAT:
++      PRE_MEM_WRITE( "ioctl(FDPOLLDRVSTAT)", ARG3, sizeof(vki_floppy_drive_struct_t) );
++      break;
++   case VKI_FDGETPRM:
++      PRE_MEM_WRITE( "ioctl(FDGETPRM)", ARG3, sizeof(vki_floppy_struct_t) );
++      break;
  
-       /* Hard disks */
-    case VKI_HDIO_GET_IDENTITY: /* 0x030d */
-       SYS_PRE_MEM_WRITE( "ioctl(HDIO_GET_IDENTITY)", arg3,
-                      VKI_SIZEOF_STRUCT_HD_DRIVEID );
+    case VKI_IIOCGETCPS:
+       PRE_MEM_WRITE( "ioctl(IIOCGETCPS)", ARG3,
+@@ -3550,6 +3578,8 @@
+    case VKI_BLKROGET:
+       PRE_MEM_WRITE( "ioctl(BLKROGET)", ARG3, sizeof(int));
        break;
-+   case VKI_HDIO_GETGEO: /* 0x0301 */
-+      SYS_PRE_MEM_WRITE( "ioctl(HDIO_GETGEO)", arg3,
-+                     sizeof(struct vki_hd_geometry) );
++   case VKI_BLKRRPART:
 +      break;
- 
-       /* CD ROM stuff (??)  */
-    case VKI_CDROM_GET_MCN:
-@@ -3332,6 +3351,7 @@
+    case VKI_BLKGETSIZE:
+       PRE_MEM_WRITE( "ioctl(BLKGETSIZE)", ARG3, sizeof(unsigned long));
        break;
-       /* The following two are probably bogus (should check args
- 	 for readability).  JRS 20021117 */
-+   case VKI_CDROMEJECT:
-    case VKI_CDROM_DRIVE_STATUS: /* 0x5326 */
-    case VKI_CDROM_CLEAR_OPTIONS: /* 0x5321 */
+@@ -3558,6 +3588,8 @@
+    case VKI_BLKRAGET:
+       PRE_MEM_WRITE( "ioctl(BLKRAGET)", ARG3, sizeof(long));
        break;
-@@ -3931,14 +3951,31 @@
-       VG_TRACK( post_mem_write,arg3, sizeof(unsigned long));
-       break;
- 
-+   case VKI_BLKRRPART:
 +   case VKI_BLKFLSBUF:
 +      break;
-    case VKI_BLKGETSIZE:
-       VG_TRACK( post_mem_write,arg3, sizeof(unsigned long));
+    case VKI_BLKFRASET:
        break;
-+   case VKI_BLKGETSIZE64:
-+      VG_TRACK( post_mem_write,arg3, sizeof(__vki_u64));
+    case VKI_BLKFRAGET:
+@@ -3624,6 +3656,8 @@
+       PRE_MEM_WRITE( "ioctl(CDROMREADTOCENTRY)", ARG3, 
+ 		     sizeof(struct vki_cdrom_tocentry));
+       break;
++   case VKI_CDROMEJECT:
 +      break;
-+   case VKI_BLKSSZGET:
-+      VG_TRACK( post_mem_write,arg3, sizeof(unsigned long));
+    case VKI_CDROMMULTISESSION: /* 0x5310 */
+       PRE_MEM_WRITE( "ioctl(CDROMMULTISESSION)", ARG3,
+ 		     sizeof(struct vki_cdrom_multisession));
+@@ -4042,6 +4076,28 @@
+    case VKI_SG_GET_SG_TABLESIZE:
+       POST_MEM_WRITE(ARG3, sizeof(int));
+       break;      
++   case VKI_SCSI_IOCTL_GET_IDLUN:
++      POST_MEM_WRITE(ARG3, sizeof(vki_scsi_idlun_t));
 +      break;
-+   case VKI_BLKBSZGET:
-+      VG_TRACK( post_mem_write,arg3, sizeof(unsigned long));
++   case VKI_SCSI_IOCTL_PROBE_HOST:
++      if (RES > 0 && ARG3 )
++	  POST_MEM_WRITE(ARG3, sizeof(char)*RES);
 +      break;
-+   case VKI_BLKBSZSET:
++   case VKI_SCSI_IOCTL_GET_BUS_NUMBER:
++      POST_MEM_WRITE(ARG3, sizeof(int));
 +      break;
++
++   case VKI_FDRESET:
++      break;
++   case VKI_FDGETDRVTYP:
++      POST_MEM_WRITE( ARG3, sizeof(char)*16 );
++      break;
++   case VKI_FDPOLLDRVSTAT:
++      POST_MEM_WRITE( ARG3, sizeof(vki_floppy_drive_struct_t) );
++      break;
++   case VKI_FDGETPRM:
++      POST_MEM_WRITE( ARG3, sizeof(vki_floppy_struct_t) );
++      break;
  
-       /* Hard disks */
-    case VKI_HDIO_GET_IDENTITY: /* 0x030d */
-       VG_TRACK( post_mem_write,arg3, VKI_SIZEOF_STRUCT_HD_DRIVEID );
+    case VKI_IIOCGETCPS:
+       POST_MEM_WRITE( ARG3, VKI_ISDN_MAX_CHANNELS * 2 * sizeof(unsigned long) );
+@@ -4260,6 +4317,8 @@
+    case VKI_BLKROGET:
+       POST_MEM_WRITE(ARG3, sizeof(int));
        break;
-+   case VKI_HDIO_GETGEO: /* 0x0301 */
-+      VG_TRACK( post_mem_write,arg3, sizeof(struct vki_hd_geometry) );
++   case VKI_BLKRRPART:
 +      break;
- 
-       /* CD ROM stuff (??)  */
-    case VKI_CDROMSUBCHNL:
-@@ -3967,6 +4004,7 @@
+    case VKI_BLKGETSIZE:
+       POST_MEM_WRITE(ARG3, sizeof(unsigned long));
        break;
-       /* The following two are probably bogus (should check args
- 	 for readability).  JRS 20021117 */
+@@ -4268,6 +4327,8 @@
+    case VKI_BLKRAGET:
+       POST_MEM_WRITE(ARG3, sizeof(long));
+       break;
++   case VKI_BLKFLSBUF:
++      break;
+    case VKI_BLKFRASET:
+       break;
+    case VKI_BLKFRAGET:
+@@ -4309,6 +4370,8 @@
+    case VKI_CDROMREADTOCENTRY:
+       POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_tocentry));
+       break;
 +   case VKI_CDROMEJECT:
-    case VKI_CDROM_DRIVE_STATUS: /* 0x5326 */
-    case VKI_CDROM_CLEAR_OPTIONS: /* 0x5321 */
++      break;
+    case VKI_CDROMMULTISESSION:
+       POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_multisession));
        break;
-diff -urN ../valgrind-2.4.0/include/linux/vki.h valgrind-2.4.0/include/linux/vki.h
---- ../valgrind-2.4.0/include/linux/vki.h	2005-03-10 23:28:14.000000000 -0700
-+++ valgrind-2.4.0/include/linux/vki.h	2005-07-22 03:42:01.000000000 -0600
-@@ -1389,7 +1389,14 @@
- // From linux-2.6.8.1/include/linux/fs.h
- //----------------------------------------------------------------------
- 
--#define VKI_BLKGETSIZE _VKI_IO(0x12,96) /* return device size /512 (long *arg) */
-+#define VKI_BLKGETSIZE	_VKI_IO(0x12,   96) /* return device size /512 (long *arg) */
-+#define VKI_BLKGETSIZE64 _VKI_IOR(0x12, 114, __vki_u64)	/* return device size in bytes (u64 *arg) */
-+#define VKI_BLKRRPART	_VKI_IO(0x12,	95)	/* re-read partition table */
-+#define VKI_BLKFLSBUF	_VKI_IO(0x12,	97)	/* flush buffer cache */
-+#define VKI_BLKSSZGET	_VKI_IO(0x12,	104)/* get block device sector size */
-+#define VKI_BLKBSZGET	_VKI_IOR(0x12,	112, unsigned long)
-+#define VKI_BLKBSZSET	_VKI_IOW(0x12,	113, unsigned long)
-+
- 
- #define VKI_FIBMAP	_VKI_IO(0x00,1)	/* bmap access */
- #define VKI_FIGETBSZ    _VKI_IO(0x00,2)	/* get the block size used for bmap */
-@@ -1464,6 +1471,7 @@
-                                            (struct cdrom_tochdr) */
- #define VKI_CDROMREADTOCENTRY	0x5306 /* Read TOC entry 
-                                            (struct cdrom_tocentry) */
-+#define VKI_CDROMEJECT		0x5309 /* Ejects the cdrom media */
- #define VKI_CDROMSUBCHNL	0x530b /* Read subchannel data 
-                                            (struct cdrom_subchnl) */
- #define VKI_CDROMREADMODE2	0x530c /* Read CDROM mode 2 data (2336 Bytes) 
-@@ -1674,12 +1682,20 @@
- // From linux-2.6.8.1/include/linux/hdreg.h
- //----------------------------------------------------------------------
- 
-+#define VKI_HDIO_GETGEO		0x0301	/* get device geometry */
- #define VKI_HDIO_GET_IDENTITY	0x030d	/* get IDE identification info */
- 
- // [[Nb: done like this because the original type is a huge struct that will
- //   always be the same size.]]
- #define VKI_SIZEOF_STRUCT_HD_DRIVEID   512
- 
-+struct vki_hd_geometry {
-+      unsigned char heads;
-+      unsigned char sectors;
-+      unsigned short cylinders;
-+      unsigned long start;
-+};
-+
- //----------------------------------------------------------------------
- // From linux-2.6.8.1/include/linux/fb.h
- //----------------------------------------------------------------------
