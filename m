From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 22:24:27 +0100
Subject: [Buildroot] [git commit] valgrind: bump to 3.8.1
Message-ID: <20130101212433.5B7609A59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85510dae95f90c0d8d5af65715dfa2dd9fe78be5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Status of the patches:

 * valgrind-compiler-check.patch, no longer needed, merged upstream.

 * valgrind-dont-include-a-out-header.patch, kept, just refreshed

 * valgrind-fix-ccache-support.patch, adapted to the newer Valgrind
   release.

 * valgrind-largefile.patch, kept, just refreshed

 * valgrind-more-ioctls.patch, removed. Most of it was merged
   upstream. This patch was anyway a feature addition, so it shouldn't
   be kept in Buildroot.

 * valgrind-workaround-SIGSEGV-on-PPC.patch, kept as is, just
   refreshed.

This bump also fixes the build failure we were experiencing with
Valgrind 3.7.0 against recent Glibc versions.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/valgrind/valgrind-compiler-check.patch     |   76 --------
 .../valgrind-dont-include-a-out-header.patch       |    2 +-
 package/valgrind/valgrind-fix-ccache-support.patch |   54 +++---
 package/valgrind/valgrind-largefile.patch          |   20 +-
 package/valgrind/valgrind-more-ioctls.patch        |  203 --------------------
 .../valgrind-workaround-SIGSEGV-on-PPC.patch       |    6 +-
 package/valgrind/valgrind.mk                       |    2 +-
 7 files changed, 41 insertions(+), 322 deletions(-)

diff --git a/package/valgrind/valgrind-compiler-check.patch b/package/valgrind/valgrind-compiler-check.patch
deleted file mode 100644
index 4a9fcba..0000000
--- a/package/valgrind/valgrind-compiler-check.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Fix the compiler version check so that it doesn't misdetect the
-version when the compiler version contains parenthesis.
-
-Taken from upstream r12274.
-
-Index: valgrind-3.7.0/configure.in
-===================================================================
---- valgrind-3.7.0.orig/configure.in	2011-12-22 15:21:22.269669307 +0100
-+++ valgrind-3.7.0/configure.in	2011-12-22 15:21:54.029135051 +0100
-@@ -98,18 +98,21 @@
- # We don't want gcc < 3.0
- AC_MSG_CHECKING([for a supported version of gcc])
- 
--# Try to get the gcc version, sed-ing out some unexpected stuff
--# that appears with the default gcc on OSX 10.6 and 10.7 respectively.
--# Without this, the version number comes out as 686, 10 or 11 :-(
-+# Obtain the compiler version.
- # 
--# i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
--# i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
-+# A few examples of how the ${CC} --version output looks like:
-+#
-+# Arch Linux: i686-pc-linux-gnu-gcc (GCC) 4.6.2
-+# Debian Linux: gcc (Debian 4.3.2-1.1) 4.3.2
-+# openSUSE: gcc (SUSE Linux) 4.5.1 20101208 [gcc-4_5-branch revision 167585]
-+# Exherbo Linux: x86_64-pc-linux-gnu-gcc (Exherbo gcc-4.6.2) 4.6.2
-+# OS/X 10.6: i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
-+# OS/X 10.7: i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
-+# Clang: clang version 2.9 (tags/RELEASE_29/final)
- #
- [gcc_version=`${CC} --version \
--             | head -n 1 \
--             | $SED 's/i686-apple-darwin10//' \
--             | $SED 's/i686-apple-darwin11//' \
--             | $SED 's/^[^0-9]*\([0-9.]*\).*$/\1/'`]
-+             | $SED -n -e 's/[^ ]*gcc[^ ]* ([^)]*) \([0-9.]*\).*$/\1/p' \
-+                       -e 's/[^ ]*clang version \([0-9.]*\).*$/\1/p'`]
- 
- is_clang="notclang"
- if test "x`${CC} --version | head -n 1 | $SED 's/\(clang\) version.*/\1/'`" = "xclang" ; then
-Index: valgrind-3.7.0/configure
-===================================================================
---- valgrind-3.7.0.orig/configure	2011-12-22 15:22:05.138948143 +0100
-+++ valgrind-3.7.0/configure	2011-12-22 15:23:34.807439246 +0100
-@@ -5122,18 +5122,22 @@
- { $as_echo "$as_me:${as_lineno-$LINENO}: checking for a supported version of gcc" >&5
- $as_echo_n "checking for a supported version of gcc... " >&6; }
- 
--# Try to get the gcc version, sed-ing out some unexpected stuff
--# that appears with the default gcc on OSX 10.6 and 10.7 respectively.
--# Without this, the version number comes out as 686, 10 or 11 :-(
-+# Obtain the compiler version.
-+# 
-+# A few examples of how the ${CC} --version output looks like:
- #
--# i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
--# i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
-+# Arch Linux: i686-pc-linux-gnu-gcc (GCC) 4.6.2
-+# Debian Linux: gcc (Debian 4.3.2-1.1) 4.3.2
-+# openSUSE: gcc (SUSE Linux) 4.5.1 20101208 [gcc-4_5-branch revision 167585]
-+# Exherbo Linux: x86_64-pc-linux-gnu-gcc (Exherbo gcc-4.6.2) 4.6.2
-+# OS/X 10.6: i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
-+# OS/X 10.7: i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
-+# Clang: clang version 2.9 (tags/RELEASE_29/final)
- #
- gcc_version=`${CC} --version \
--             | head -n 1 \
--             | $SED 's/i686-apple-darwin10//' \
--             | $SED 's/i686-apple-darwin11//' \
--             | $SED 's/^[^0-9]*\([0-9.]*\).*$/\1/'`
-+             | $SED -n -e 's/[^ ]*gcc[^ ]* ([^)]*) \([0-9.]*\).*$/\1/p' \
-+                       -e 's/[^ ]*clang version \([0-9.]*\).*$/\1/p'`
-+
- 
- is_clang="notclang"
- if test "x`${CC} --version | head -n 1 | $SED 's/\(clang\) version.*/\1/'`" = "xclang" ; then
diff --git a/package/valgrind/valgrind-dont-include-a-out-header.patch b/package/valgrind/valgrind-dont-include-a-out-header.patch
index ed1c939..2afd44a 100644
--- a/package/valgrind/valgrind-dont-include-a-out-header.patch
+++ b/package/valgrind/valgrind-dont-include-a-out-header.patch
@@ -20,7 +20,7 @@ Index: b/coregrind/m_debuginfo/readstabs.c
 ===================================================================
 --- a/coregrind/m_debuginfo/readstabs.c
 +++ b/coregrind/m_debuginfo/readstabs.c
-@@ -52,7 +52,21 @@
+@@ -53,7 +53,21 @@
  
  /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
  #if defined(VGO_linux)
diff --git a/package/valgrind/valgrind-fix-ccache-support.patch b/package/valgrind/valgrind-fix-ccache-support.patch
index 56d984b..40ada8d 100644
--- a/package/valgrind/valgrind-fix-ccache-support.patch
+++ b/package/valgrind/valgrind-fix-ccache-support.patch
@@ -11,41 +11,39 @@ is:
 
   /path/to/ccache /path/to/crossgcc -o foobar foobar.c -someflags
 
-Since this Perl script simply needs to add additional flags to the
-command line, we simply add them at the end of the command line
-instead of trying to add them at the beginning.
+Therefore, we tune the script to take into account the case where
+ccache is used.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: valgrind-3.6.1/coregrind/link_tool_exe_linux.in
+Index: b/coregrind/link_tool_exe_linux.in
 ===================================================================
---- valgrind-3.6.1.orig/coregrind/link_tool_exe_linux.in	2011-12-22 13:59:08.933499060 +0100
-+++ valgrind-3.6.1/coregrind/link_tool_exe_linux.in	2011-12-22 13:59:50.302782709 +0100
-@@ -55,25 +55,13 @@
-     if (($#ARGV + 1) < 5);
- 
- my $ala = $ARGV[0];
-+shift;
- 
- # check for plausible-ish alt load address
+--- a/coregrind/link_tool_exe_linux.in
++++ b/coregrind/link_tool_exe_linux.in
+@@ -60,8 +60,16 @@
  die "Bogus alt-load address"
      if (length($ala) < 3 || index($ala, "0x") != 0);
  
--# The cc invokation to do the final link
++shift(@ARGV);
++
++if ($ARGV[0] =~ /.*ccache/) {
++    shift(@ARGV);
++}
++
+ # The cc invokation to do the final link
 -my $cc = $ARGV[1];
--
--# and the 'restargs' are argv[2 ..]
--
--# so, build up the complete command here:
--# 'cc' -static -Ttext='ala' 'restargs'
--
--my $cmd="$cc -static -Wl,-Ttext=$ala";
--
--# Add the rest of the parameters
--foreach my $n (2 .. $#ARGV) {
--   $cmd = "$cmd $ARGV[$n]";
--}
-+my $cmd=join(" ", @ARGV) . " -static -Wl,-Ttext=$ala";
++my $cc = $ARGV[0];
++
++shift(@ARGV);
  
- #print "link_tool_exe_linux: $cmd\n";
+ # and the 'restargs' are argv[2 ..]
+ 
+@@ -82,7 +90,7 @@
+ }
+ 
+ # Add the rest of the parameters
+-foreach my $n (2 .. $#ARGV) {
++foreach my $n (0 .. $#ARGV) {
+    $cmd = "$cmd $ARGV[$n]";
+ }
  
diff --git a/package/valgrind/valgrind-largefile.patch b/package/valgrind/valgrind-largefile.patch
index 53b6e6f..3a8a780 100644
--- a/package/valgrind/valgrind-largefile.patch
+++ b/package/valgrind/valgrind-largefile.patch
@@ -6,10 +6,10 @@ is detected.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 
-Index: valgrind-3.7.0/coregrind/m_initimg/initimg-linux.c
+Index: b/coregrind/m_initimg/initimg-linux.c
 ===================================================================
---- valgrind-3.7.0.orig/coregrind/m_initimg/initimg-linux.c	2011-10-26 23:24:43.000000000 +0200
-+++ valgrind-3.7.0/coregrind/m_initimg/initimg-linux.c	2011-12-22 14:53:12.798185055 +0100
+--- a/coregrind/m_initimg/initimg-linux.c
++++ b/coregrind/m_initimg/initimg-linux.c
 @@ -55,7 +55,11 @@
  
  /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
@@ -22,11 +22,11 @@ Index: valgrind-3.7.0/coregrind/m_initimg/initimg-linux.c
  /* This is for ELF types etc, and also the AT_ constants. */
  #include <elf.h>
  /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
-Index: valgrind-3.7.0/coregrind/m_main.c
+Index: b/coregrind/m_main.c
 ===================================================================
---- valgrind-3.7.0.orig/coregrind/m_main.c	2011-10-26 23:24:45.000000000 +0200
-+++ valgrind-3.7.0/coregrind/m_main.c	2011-12-22 14:53:12.798185055 +0100
-@@ -2743,7 +2743,11 @@
+--- a/coregrind/m_main.c
++++ b/coregrind/m_main.c
+@@ -2948,7 +2948,11 @@
  
  /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
  #define _GNU_SOURCE
@@ -38,10 +38,10 @@ Index: valgrind-3.7.0/coregrind/m_main.c
  /* This is in order to get AT_NULL and AT_PAGESIZE. */
  #include <elf.h>
  /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
-Index: valgrind-3.7.0/coregrind/m_ume/elf.c
+Index: b/coregrind/m_ume/elf.c
 ===================================================================
---- valgrind-3.7.0.orig/coregrind/m_ume/elf.c	2011-10-26 23:24:41.000000000 +0200
-+++ valgrind-3.7.0/coregrind/m_ume/elf.c	2011-12-22 14:53:12.798185055 +0100
+--- a/coregrind/m_ume/elf.c
++++ b/coregrind/m_ume/elf.c
 @@ -48,7 +48,11 @@
  
  /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
diff --git a/package/valgrind/valgrind-more-ioctls.patch b/package/valgrind/valgrind-more-ioctls.patch
deleted file mode 100644
index fb58381..0000000
--- a/package/valgrind/valgrind-more-ioctls.patch
+++ /dev/null
@@ -1,203 +0,0 @@
-Add various ioctl()s
-
-Patch initially written by Eric Andersen <andersen@codepoet.org>.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: valgrind-3.7.0/coregrind/m_syswrap/syswrap-linux.c
-===================================================================
---- valgrind-3.7.0.orig/coregrind/m_syswrap/syswrap-linux.c	2011-10-27 12:55:05.000000000 +0200
-+++ valgrind-3.7.0/coregrind/m_syswrap/syswrap-linux.c	2011-12-22 14:53:16.258126390 +0100
-@@ -4058,7 +4058,33 @@
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
- 
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
-    case VKI_IIOCGETCPS:
-       PRE_MEM_WRITE( "ioctl(IIOCGETCPS)", ARG3,
- 		     VKI_ISDN_MAX_CHANNELS * 2 * sizeof(unsigned long) );
-@@ -4373,6 +4399,8 @@
-    case VKI_BLKROGET:
-       PRE_MEM_WRITE( "ioctl(BLKROGET)", ARG3, sizeof(int));
-       break;
-+   case VKI_BLKRRPART:
-+      break;
-    case VKI_BLKGETSIZE:
-       PRE_MEM_WRITE( "ioctl(BLKGETSIZE)", ARG3, sizeof(unsigned long));
-       break;
-@@ -4381,6 +4409,8 @@
-    case VKI_BLKRAGET:
-       PRE_MEM_WRITE( "ioctl(BLKRAGET)", ARG3, sizeof(long));
-       break;
-+   case VKI_BLKFLSBUF:
-+      break;
-    case VKI_BLKFRASET:
-       break;
-    case VKI_BLKFRAGET:
-@@ -4447,6 +4477,8 @@
-       PRE_MEM_WRITE( "ioctl(CDROMREADTOCENTRY)", ARG3, 
- 		     sizeof(struct vki_cdrom_tocentry));
-       break;
-+   case VKI_CDROMEJECT:
-+      break;
-    case VKI_CDROMMULTISESSION: /* 0x5310 */
-       PRE_MEM_WRITE( "ioctl(CDROMMULTISESSION)", ARG3,
- 		     sizeof(struct vki_cdrom_multisession));
-@@ -5321,7 +5353,28 @@
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
- 
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
-    case VKI_IIOCGETCPS:
-       POST_MEM_WRITE( ARG3, VKI_ISDN_MAX_CHANNELS * 2 * sizeof(unsigned long) );
-       break;
-@@ -5542,6 +5595,8 @@
-    case VKI_BLKROGET:
-       POST_MEM_WRITE(ARG3, sizeof(int));
-       break;
-+   case VKI_BLKRRPART:
-+      break;
-    case VKI_BLKGETSIZE:
-       POST_MEM_WRITE(ARG3, sizeof(unsigned long));
-       break;
-@@ -5550,6 +5605,8 @@
-    case VKI_BLKRAGET:
-       POST_MEM_WRITE(ARG3, sizeof(long));
-       break;
-+   case VKI_BLKFLSBUF:
-+      break;
-    case VKI_BLKFRASET:
-       break;
-    case VKI_BLKFRAGET:
-@@ -5591,6 +5648,8 @@
-    case VKI_CDROMREADTOCENTRY:
-       POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_tocentry));
-       break;
-+   case VKI_CDROMEJECT:
-+      break;
-    case VKI_CDROMMULTISESSION:
-       POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_multisession));
-       break;
-Index: valgrind-3.7.0/include/vki/vki-linux.h
-===================================================================
---- valgrind-3.7.0.orig/include/vki/vki-linux.h	2011-10-26 23:24:31.000000000 +0200
-+++ valgrind-3.7.0/include/vki/vki-linux.h	2011-12-22 14:53:16.258126390 +0100
-@@ -1654,7 +1654,9 @@
- 
- #define VKI_BLKROSET   _VKI_IO(0x12,93)	/* set device read-only (0 = read-write) */
- #define VKI_BLKROGET   _VKI_IO(0x12,94)	/* get read-only status (0 = read_write) */
-+#define VKI_BLKRRPART  _VKI_IO(0x12,95) /* re-read partition table */
- #define VKI_BLKGETSIZE _VKI_IO(0x12,96) /* return device size /512 (long *arg) */
-+#define VKI_BLKFLSBUF  _VKI_IO(0x12,97) /* flush buffer cache */
- #define VKI_BLKRASET   _VKI_IO(0x12,98)	/* set read ahead for block device */
- #define VKI_BLKRAGET   _VKI_IO(0x12,99)	/* get current read ahead setting */
- #define VKI_BLKFRASET  _VKI_IO(0x12,100)/* set filesystem (mm/filemap.c) read-ahead */
-@@ -1729,6 +1731,53 @@
- //#define SG_GET_COMMAND_Q 0x2270   /* Yields 0 (queuing off) or 1 (on) */
- #define VKI_SG_SET_COMMAND_Q 0x2271   /* Change queuing state with 0 or 1 */
- 
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
-@@ -1738,6 +1787,7 @@
-                                            (struct cdrom_tochdr) */
- #define VKI_CDROMREADTOCENTRY	0x5306 /* Read TOC entry 
-                                            (struct cdrom_tocentry) */
-+#define VKI_CDROMEJECT		0x5309 /* Eject cdrom media */
- #define VKI_CDROMSUBCHNL	0x530b /* Read subchannel data 
-                                            (struct cdrom_subchnl) */
- #define VKI_CDROMREADMODE2	0x530c /* Read CDROM mode 2 data (2336 Bytes) 
diff --git a/package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch
index ea91a00..3358c24 100644
--- a/package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch
+++ b/package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch
@@ -8,10 +8,10 @@ Signed-off-by: Pierre Habouzit <madcoder@debian.org>
  coregrind/m_machine.c |    4 ++++
  1 files changed, 4 insertions(+), 0 deletions(-)
 
-Index: valgrind-3.7.0/coregrind/m_machine.c
+Index: b/coregrind/m_machine.c
 ===================================================================
---- valgrind-3.7.0.orig/coregrind/m_machine.c	2011-10-27 12:45:52.000000000 +0200
-+++ valgrind-3.7.0/coregrind/m_machine.c	2011-12-22 14:53:19.758067046 +0100
+--- a/coregrind/m_machine.c
++++ b/coregrind/m_machine.c
 @@ -27,6 +27,10 @@
     The GNU General Public License is contained in the file COPYING.
  */
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index cdebbec..ff35e6c 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-VALGRIND_VERSION = 3.7.0
+VALGRIND_VERSION = 3.8.1
 VALGRIND_SITE    = http://valgrind.org/downloads/
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
 VALGRIND_LICENSE = GPLv2 GFDLv1.2
