From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Dec 2011 22:26:03 +0100
Subject: [Buildroot] [PATCH 2/2] valgrind: bump to 3.7.0 and fix build with
	ccache
In-Reply-To: <cover.1325193931.git.thomas.petazzoni@free-electrons.com>
References: <cover.1325193931.git.thomas.petazzoni@free-electrons.com>
Message-ID: <82cf39463d0cd3b076845e5b784f350fc00bea5b.1325193931.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After bumping to 3.7.0, the valgrind-3.6.1-configure-support-linux-3.patch is
no longer necessary since it was added upstream. The
valgrind-3.7.0-compiler-check.patch patch is added to fix a compiler version
check issue (patch taken from the upstream Subversion repository). The
valgrind-3.7.0-fix-ccache-support.patch is added to fix the build process when
ccache is used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../valgrind-3.6.1-configure-support-linux-3.patch |   30 --------
 .../valgrind/valgrind-3.7.0-compiler-check.patch   |   76 ++++++++++++++++++++
 .../valgrind-3.7.0-fix-ccache-support.patch        |   51 +++++++++++++
 ...gefile.patch => valgrind-3.7.0-largefile.patch} |   22 +++---
 ...ctls.patch => valgrind-3.7.0-more-ioctls.patch} |   34 +++++-----
 package/valgrind/valgrind-3.7.0-readstab-fix.patch |   13 ++++
 ...valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch} |   15 ++---
 package/valgrind/valgrind.mk                       |    3 +-
 8 files changed, 175 insertions(+), 69 deletions(-)
 delete mode 100644 package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch
 create mode 100644 package/valgrind/valgrind-3.7.0-compiler-check.patch
 create mode 100644 package/valgrind/valgrind-3.7.0-fix-ccache-support.patch
 rename package/valgrind/{valgrind-3.6.1-largefile.patch => valgrind-3.7.0-largefile.patch} (71%)
 rename package/valgrind/{valgrind-3.6.1-more-ioctls.patch => valgrind-3.7.0-more-ioctls.patch} (90%)
 create mode 100644 package/valgrind/valgrind-3.7.0-readstab-fix.patch
 rename package/valgrind/{valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch => valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch} (60%)

diff --git a/package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch b/package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch
deleted file mode 100644
index a3b2482..0000000
--- a/package/valgrind/valgrind-3.6.1-configure-support-linux-3.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Add support for kernel 3.x. From upstream r11796 (via Debian).
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
-
-Index: valgrind-3.6.1/configure.in
-===================================================================
---- valgrind-3.6.1.orig/configure.in	2011-02-15 18:31:17.000000000 +0100
-+++ valgrind-3.6.1/configure.in	2011-07-08 22:36:36.051563848 +0200
-@@ -220,7 +220,7 @@
-         kernel=`uname -r`
- 
-         case "${kernel}" in
--             2.6.*) 
-+             2.6.*|3.*) 
-         	    AC_MSG_RESULT([2.6 family (${kernel})])
-         	    AC_DEFINE([KERNEL_2_6], 1, [Define to 1 if you're using Linux 2.6.x])
-         	    ;;
-Index: valgrind-3.6.1/configure
-===================================================================
---- valgrind-3.6.1.orig/configure	2011-07-08 22:37:18.911240743 +0200
-+++ valgrind-3.6.1/configure	2011-07-08 22:37:44.847045178 +0200
-@@ -5348,7 +5348,7 @@
-         kernel=`uname -r`
- 
-         case "${kernel}" in
--             2.6.*)
-+             2.6.*|3.*)
-         	    { $as_echo "$as_me:${as_lineno-$LINENO}: result: 2.6 family (${kernel})" >&5
- $as_echo "2.6 family (${kernel})" >&6; }
- 
diff --git a/package/valgrind/valgrind-3.7.0-compiler-check.patch b/package/valgrind/valgrind-3.7.0-compiler-check.patch
new file mode 100644
index 0000000..4a9fcba
--- /dev/null
+++ b/package/valgrind/valgrind-3.7.0-compiler-check.patch
@@ -0,0 +1,76 @@
+Fix the compiler version check so that it doesn't misdetect the
+version when the compiler version contains parenthesis.
+
+Taken from upstream r12274.
+
+Index: valgrind-3.7.0/configure.in
+===================================================================
+--- valgrind-3.7.0.orig/configure.in	2011-12-22 15:21:22.269669307 +0100
++++ valgrind-3.7.0/configure.in	2011-12-22 15:21:54.029135051 +0100
+@@ -98,18 +98,21 @@
+ # We don't want gcc < 3.0
+ AC_MSG_CHECKING([for a supported version of gcc])
+ 
+-# Try to get the gcc version, sed-ing out some unexpected stuff
+-# that appears with the default gcc on OSX 10.6 and 10.7 respectively.
+-# Without this, the version number comes out as 686, 10 or 11 :-(
++# Obtain the compiler version.
+ # 
+-# i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
+-# i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
++# A few examples of how the ${CC} --version output looks like:
++#
++# Arch Linux: i686-pc-linux-gnu-gcc (GCC) 4.6.2
++# Debian Linux: gcc (Debian 4.3.2-1.1) 4.3.2
++# openSUSE: gcc (SUSE Linux) 4.5.1 20101208 [gcc-4_5-branch revision 167585]
++# Exherbo Linux: x86_64-pc-linux-gnu-gcc (Exherbo gcc-4.6.2) 4.6.2
++# OS/X 10.6: i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
++# OS/X 10.7: i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
++# Clang: clang version 2.9 (tags/RELEASE_29/final)
+ #
+ [gcc_version=`${CC} --version \
+-             | head -n 1 \
+-             | $SED 's/i686-apple-darwin10//' \
+-             | $SED 's/i686-apple-darwin11//' \
+-             | $SED 's/^[^0-9]*\([0-9.]*\).*$/\1/'`]
++             | $SED -n -e 's/[^ ]*gcc[^ ]* ([^)]*) \([0-9.]*\).*$/\1/p' \
++                       -e 's/[^ ]*clang version \([0-9.]*\).*$/\1/p'`]
+ 
+ is_clang="notclang"
+ if test "x`${CC} --version | head -n 1 | $SED 's/\(clang\) version.*/\1/'`" = "xclang" ; then
+Index: valgrind-3.7.0/configure
+===================================================================
+--- valgrind-3.7.0.orig/configure	2011-12-22 15:22:05.138948143 +0100
++++ valgrind-3.7.0/configure	2011-12-22 15:23:34.807439246 +0100
+@@ -5122,18 +5122,22 @@
+ { $as_echo "$as_me:${as_lineno-$LINENO}: checking for a supported version of gcc" >&5
+ $as_echo_n "checking for a supported version of gcc... " >&6; }
+ 
+-# Try to get the gcc version, sed-ing out some unexpected stuff
+-# that appears with the default gcc on OSX 10.6 and 10.7 respectively.
+-# Without this, the version number comes out as 686, 10 or 11 :-(
++# Obtain the compiler version.
++# 
++# A few examples of how the ${CC} --version output looks like:
+ #
+-# i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
+-# i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
++# Arch Linux: i686-pc-linux-gnu-gcc (GCC) 4.6.2
++# Debian Linux: gcc (Debian 4.3.2-1.1) 4.3.2
++# openSUSE: gcc (SUSE Linux) 4.5.1 20101208 [gcc-4_5-branch revision 167585]
++# Exherbo Linux: x86_64-pc-linux-gnu-gcc (Exherbo gcc-4.6.2) 4.6.2
++# OS/X 10.6: i686-apple-darwin10-gcc-4.2.1 (GCC) 4.2.1 (Apple Inc. build 5666) (dot 3)
++# OS/X 10.7: i686-apple-darwin11-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc. build 5658) (LLVM build 2335.15.00)
++# Clang: clang version 2.9 (tags/RELEASE_29/final)
+ #
+ gcc_version=`${CC} --version \
+-             | head -n 1 \
+-             | $SED 's/i686-apple-darwin10//' \
+-             | $SED 's/i686-apple-darwin11//' \
+-             | $SED 's/^[^0-9]*\([0-9.]*\).*$/\1/'`
++             | $SED -n -e 's/[^ ]*gcc[^ ]* ([^)]*) \([0-9.]*\).*$/\1/p' \
++                       -e 's/[^ ]*clang version \([0-9.]*\).*$/\1/p'`
++
+ 
+ is_clang="notclang"
+ if test "x`${CC} --version | head -n 1 | $SED 's/\(clang\) version.*/\1/'`" = "xclang" ; then
diff --git a/package/valgrind/valgrind-3.7.0-fix-ccache-support.patch b/package/valgrind/valgrind-3.7.0-fix-ccache-support.patch
new file mode 100644
index 0000000..56d984b
--- /dev/null
+++ b/package/valgrind/valgrind-3.7.0-fix-ccache-support.patch
@@ -0,0 +1,51 @@
+Fix link_tool_exe_linux.in to work with ccache
+
+The link_tool_exe_linux.in Perl script makes the assumption that the
+compilation command line is always:
+
+  gcc -o foobar foobar.c -someflags
+
+I.e, it assumes that the compiler is the first word of the command
+line. However, this is not true with ccache, where the command line
+is:
+
+  /path/to/ccache /path/to/crossgcc -o foobar foobar.c -someflags
+
+Since this Perl script simply needs to add additional flags to the
+command line, we simply add them at the end of the command line
+instead of trying to add them at the beginning.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: valgrind-3.6.1/coregrind/link_tool_exe_linux.in
+===================================================================
+--- valgrind-3.6.1.orig/coregrind/link_tool_exe_linux.in	2011-12-22 13:59:08.933499060 +0100
++++ valgrind-3.6.1/coregrind/link_tool_exe_linux.in	2011-12-22 13:59:50.302782709 +0100
+@@ -55,25 +55,13 @@
+     if (($#ARGV + 1) < 5);
+ 
+ my $ala = $ARGV[0];
++shift;
+ 
+ # check for plausible-ish alt load address
+ die "Bogus alt-load address"
+     if (length($ala) < 3 || index($ala, "0x") != 0);
+ 
+-# The cc invokation to do the final link
+-my $cc = $ARGV[1];
+-
+-# and the 'restargs' are argv[2 ..]
+-
+-# so, build up the complete command here:
+-# 'cc' -static -Ttext='ala' 'restargs'
+-
+-my $cmd="$cc -static -Wl,-Ttext=$ala";
+-
+-# Add the rest of the parameters
+-foreach my $n (2 .. $#ARGV) {
+-   $cmd = "$cmd $ARGV[$n]";
+-}
++my $cmd=join(" ", @ARGV) . " -static -Wl,-Ttext=$ala";
+ 
+ #print "link_tool_exe_linux: $cmd\n";
+ 
diff --git a/package/valgrind/valgrind-3.6.1-largefile.patch b/package/valgrind/valgrind-3.7.0-largefile.patch
similarity index 71%
rename from package/valgrind/valgrind-3.6.1-largefile.patch
rename to package/valgrind/valgrind-3.7.0-largefile.patch
index d04877b..53b6e6f 100644
--- a/package/valgrind/valgrind-3.6.1-largefile.patch
+++ b/package/valgrind/valgrind-3.7.0-largefile.patch
@@ -6,11 +6,11 @@ is detected.
 
 Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 
-Index: valgrind-3.6.1/coregrind/m_initimg/initimg-linux.c
+Index: valgrind-3.7.0/coregrind/m_initimg/initimg-linux.c
 ===================================================================
---- valgrind-3.6.1.orig/coregrind/m_initimg/initimg-linux.c	2011-07-06 09:45:10.203070009 +0200
-+++ valgrind-3.6.1/coregrind/m_initimg/initimg-linux.c	2011-07-06 09:45:17.343070005 +0200
-@@ -54,7 +54,11 @@
+--- valgrind-3.7.0.orig/coregrind/m_initimg/initimg-linux.c	2011-10-26 23:24:43.000000000 +0200
++++ valgrind-3.7.0/coregrind/m_initimg/initimg-linux.c	2011-12-22 14:53:12.798185055 +0100
+@@ -55,7 +55,11 @@
  
  /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
  #define _GNU_SOURCE
@@ -22,11 +22,11 @@ Index: valgrind-3.6.1/coregrind/m_initimg/initimg-linux.c
  /* This is for ELF types etc, and also the AT_ constants. */
  #include <elf.h>
  /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
-Index: valgrind-3.6.1/coregrind/m_main.c
+Index: valgrind-3.7.0/coregrind/m_main.c
 ===================================================================
---- valgrind-3.6.1.orig/coregrind/m_main.c	2011-07-06 09:44:22.203070033 +0200
-+++ valgrind-3.6.1/coregrind/m_main.c	2011-07-06 09:44:42.803070024 +0200
-@@ -2797,7 +2797,11 @@
+--- valgrind-3.7.0.orig/coregrind/m_main.c	2011-10-26 23:24:45.000000000 +0200
++++ valgrind-3.7.0/coregrind/m_main.c	2011-12-22 14:53:12.798185055 +0100
+@@ -2743,7 +2743,11 @@
  
  /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
  #define _GNU_SOURCE
@@ -38,10 +38,10 @@ Index: valgrind-3.6.1/coregrind/m_main.c
  /* This is in order to get AT_NULL and AT_PAGESIZE. */
  #include <elf.h>
  /* --- !!! --- EXTERNAL HEADERS end --- !!! --- */
-Index: valgrind-3.6.1/coregrind/m_ume/elf.c
+Index: valgrind-3.7.0/coregrind/m_ume/elf.c
 ===================================================================
---- valgrind-3.6.1.orig/coregrind/m_ume/elf.c	2011-07-06 09:44:51.343070018 +0200
-+++ valgrind-3.6.1/coregrind/m_ume/elf.c	2011-07-06 09:44:58.833070015 +0200
+--- valgrind-3.7.0.orig/coregrind/m_ume/elf.c	2011-10-26 23:24:41.000000000 +0200
++++ valgrind-3.7.0/coregrind/m_ume/elf.c	2011-12-22 14:53:12.798185055 +0100
 @@ -48,7 +48,11 @@
  
  /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
diff --git a/package/valgrind/valgrind-3.6.1-more-ioctls.patch b/package/valgrind/valgrind-3.7.0-more-ioctls.patch
similarity index 90%
rename from package/valgrind/valgrind-3.6.1-more-ioctls.patch
rename to package/valgrind/valgrind-3.7.0-more-ioctls.patch
index 62f0135..fb58381 100644
--- a/package/valgrind/valgrind-3.6.1-more-ioctls.patch
+++ b/package/valgrind/valgrind-3.7.0-more-ioctls.patch
@@ -4,11 +4,11 @@ Patch initially written by Eric Andersen <andersen@codepoet.org>.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 
-Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
+Index: valgrind-3.7.0/coregrind/m_syswrap/syswrap-linux.c
 ===================================================================
---- valgrind-3.6.1.orig/coregrind/m_syswrap/syswrap-linux.c	2011-07-06 09:50:32.243069845 +0200
-+++ valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c	2011-07-06 09:53:39.783069751 +0200
-@@ -3900,7 +3900,33 @@
+--- valgrind-3.7.0.orig/coregrind/m_syswrap/syswrap-linux.c	2011-10-27 12:55:05.000000000 +0200
++++ valgrind-3.7.0/coregrind/m_syswrap/syswrap-linux.c	2011-12-22 14:53:16.258126390 +0100
+@@ -4058,7 +4058,33 @@
     case VKI_SG_GET_SG_TABLESIZE: /* 0x227f */
        PRE_MEM_WRITE( "ioctl(SG_GET_SG_TABLESIZE)", ARG3, sizeof(int) );
        break;
@@ -42,7 +42,7 @@ Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
     case VKI_IIOCGETCPS:
        PRE_MEM_WRITE( "ioctl(IIOCGETCPS)", ARG3,
  		     VKI_ISDN_MAX_CHANNELS * 2 * sizeof(unsigned long) );
-@@ -4215,6 +4241,8 @@
+@@ -4373,6 +4399,8 @@
     case VKI_BLKROGET:
        PRE_MEM_WRITE( "ioctl(BLKROGET)", ARG3, sizeof(int));
        break;
@@ -51,7 +51,7 @@ Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
     case VKI_BLKGETSIZE:
        PRE_MEM_WRITE( "ioctl(BLKGETSIZE)", ARG3, sizeof(unsigned long));
        break;
-@@ -4223,6 +4251,8 @@
+@@ -4381,6 +4409,8 @@
     case VKI_BLKRAGET:
        PRE_MEM_WRITE( "ioctl(BLKRAGET)", ARG3, sizeof(long));
        break;
@@ -60,7 +60,7 @@ Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
     case VKI_BLKFRASET:
        break;
     case VKI_BLKFRAGET:
-@@ -4289,6 +4319,8 @@
+@@ -4447,6 +4477,8 @@
        PRE_MEM_WRITE( "ioctl(CDROMREADTOCENTRY)", ARG3, 
  		     sizeof(struct vki_cdrom_tocentry));
        break;
@@ -69,7 +69,7 @@ Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
     case VKI_CDROMMULTISESSION: /* 0x5310 */
        PRE_MEM_WRITE( "ioctl(CDROMMULTISESSION)", ARG3,
  		     sizeof(struct vki_cdrom_multisession));
-@@ -4989,7 +5021,28 @@
+@@ -5321,7 +5353,28 @@
     case VKI_SG_GET_SG_TABLESIZE:
        POST_MEM_WRITE(ARG3, sizeof(int));
        break;      
@@ -98,7 +98,7 @@ Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
     case VKI_IIOCGETCPS:
        POST_MEM_WRITE( ARG3, VKI_ISDN_MAX_CHANNELS * 2 * sizeof(unsigned long) );
        break;
-@@ -5210,6 +5263,8 @@
+@@ -5542,6 +5595,8 @@
     case VKI_BLKROGET:
        POST_MEM_WRITE(ARG3, sizeof(int));
        break;
@@ -107,7 +107,7 @@ Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
     case VKI_BLKGETSIZE:
        POST_MEM_WRITE(ARG3, sizeof(unsigned long));
        break;
-@@ -5218,6 +5273,8 @@
+@@ -5550,6 +5605,8 @@
     case VKI_BLKRAGET:
        POST_MEM_WRITE(ARG3, sizeof(long));
        break;
@@ -116,7 +116,7 @@ Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
     case VKI_BLKFRASET:
        break;
     case VKI_BLKFRAGET:
-@@ -5259,6 +5316,8 @@
+@@ -5591,6 +5648,8 @@
     case VKI_CDROMREADTOCENTRY:
        POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_tocentry));
        break;
@@ -125,11 +125,11 @@ Index: valgrind-3.6.1/coregrind/m_syswrap/syswrap-linux.c
     case VKI_CDROMMULTISESSION:
        POST_MEM_WRITE(ARG3, sizeof(struct vki_cdrom_multisession));
        break;
-Index: valgrind-3.6.1/include/vki/vki-linux.h
+Index: valgrind-3.7.0/include/vki/vki-linux.h
 ===================================================================
---- valgrind-3.6.1.orig/include/vki/vki-linux.h	2011-07-06 09:48:16.733069914 +0200
-+++ valgrind-3.6.1/include/vki/vki-linux.h	2011-07-06 09:49:49.413069868 +0200
-@@ -1646,7 +1646,9 @@
+--- valgrind-3.7.0.orig/include/vki/vki-linux.h	2011-10-26 23:24:31.000000000 +0200
++++ valgrind-3.7.0/include/vki/vki-linux.h	2011-12-22 14:53:16.258126390 +0100
+@@ -1654,7 +1654,9 @@
  
  #define VKI_BLKROSET   _VKI_IO(0x12,93)	/* set device read-only (0 = read-write) */
  #define VKI_BLKROGET   _VKI_IO(0x12,94)	/* get read-only status (0 = read_write) */
@@ -139,7 +139,7 @@ Index: valgrind-3.6.1/include/vki/vki-linux.h
  #define VKI_BLKRASET   _VKI_IO(0x12,98)	/* set read ahead for block device */
  #define VKI_BLKRAGET   _VKI_IO(0x12,99)	/* get current read ahead setting */
  #define VKI_BLKFRASET  _VKI_IO(0x12,100)/* set filesystem (mm/filemap.c) read-ahead */
-@@ -1721,6 +1723,53 @@
+@@ -1729,6 +1731,53 @@
  //#define SG_GET_COMMAND_Q 0x2270   /* Yields 0 (queuing off) or 1 (on) */
  #define VKI_SG_SET_COMMAND_Q 0x2271   /* Change queuing state with 0 or 1 */
  
@@ -193,7 +193,7 @@ Index: valgrind-3.6.1/include/vki/vki-linux.h
  //----------------------------------------------------------------------
  // From linux-2.6.8.1/include/linux/cdrom.h
  //----------------------------------------------------------------------
-@@ -1730,6 +1779,7 @@
+@@ -1738,6 +1787,7 @@
                                             (struct cdrom_tochdr) */
  #define VKI_CDROMREADTOCENTRY	0x5306 /* Read TOC entry 
                                             (struct cdrom_tocentry) */
diff --git a/package/valgrind/valgrind-3.7.0-readstab-fix.patch b/package/valgrind/valgrind-3.7.0-readstab-fix.patch
new file mode 100644
index 0000000..20aae53
--- /dev/null
+++ b/package/valgrind/valgrind-3.7.0-readstab-fix.patch
@@ -0,0 +1,13 @@
+Index: valgrind-3.7.0/coregrind/m_debuginfo/readstabs.c
+===================================================================
+--- valgrind-3.7.0.orig/coregrind/m_debuginfo/readstabs.c	2011-12-22 16:32:08.748824822 +0100
++++ valgrind-3.7.0/coregrind/m_debuginfo/readstabs.c	2011-12-22 16:35:21.525614713 +0100
+@@ -52,7 +52,7 @@
+ 
+ /* --- !!! --- EXTERNAL HEADERS start --- !!! --- */
+ #if defined(VGO_linux)
+-#  include <a.out.h> /* stabs defns */
++#  include <linux/nlist.h> /* stabs defns */
+ #elif defined(VGO_darwin)
+ #  include <mach-o/nlist.h>
+ #  define n_other n_sect
diff --git a/package/valgrind/valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch
similarity index 60%
rename from package/valgrind/valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch
rename to package/valgrind/valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch
index a788511..ea91a00 100644
--- a/package/valgrind/valgrind-3.6.1-workaround-SIGSEGV-on-PPC.patch
+++ b/package/valgrind/valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch
@@ -8,11 +8,11 @@ Signed-off-by: Pierre Habouzit <madcoder@debian.org>
  coregrind/m_machine.c |    4 ++++
  1 files changed, 4 insertions(+), 0 deletions(-)
 
-diff --git a/coregrind/m_machine.c b/coregrind/m_machine.c
-index 8dc3e17..7921502 100644
---- a/coregrind/m_machine.c
-+++ b/coregrind/m_machine.c
-@@ -28,6 +28,10 @@
+Index: valgrind-3.7.0/coregrind/m_machine.c
+===================================================================
+--- valgrind-3.7.0.orig/coregrind/m_machine.c	2011-10-27 12:45:52.000000000 +0200
++++ valgrind-3.7.0/coregrind/m_machine.c	2011-12-22 14:53:19.758067046 +0100
+@@ -27,6 +27,10 @@
     The GNU General Public License is contained in the file COPYING.
  */
  
@@ -22,7 +22,4 @@ index 8dc3e17..7921502 100644
 +
  #include "pub_core_basics.h"
  #include "pub_core_vki.h"
- #include "pub_core_threadstate.h"
--- 
-1.7.5.1.290.g2095dc
-
+ #include "pub_core_libcsetjmp.h"   // setjmp facilities
diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
index 537639f..24523bf 100644
--- a/package/valgrind/valgrind.mk
+++ b/package/valgrind/valgrind.mk
@@ -4,10 +4,9 @@
 #
 #############################################################
 
-VALGRIND_VERSION = 3.6.1
+VALGRIND_VERSION = 3.7.0
 VALGRIND_SITE    = http://valgrind.org/downloads/
 VALGRIND_SOURCE  = valgrind-$(VALGRIND_VERSION).tar.bz2
-
 VALGRIND_CONF_OPT = --disable-tls
 
 # On ARM, Valgrind only supports ARMv7, and uses the arch part of the
-- 
1.7.4.1
