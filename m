From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  4 Dec 2013 22:11:00 +0100
Subject: [Buildroot] [PATCH] grub: bump to 0.97-67
Message-ID: <1386191460-10848-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to a more recent version of the Debian patches for grub legacy,
that fix an incorrect build with gcc 4.6.

Fixes #6092 and #2629.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/grub/grub.200-fix_mbr_handling.patch     |   10 +-
 boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch |   14 +-
 boot/grub/grub.400-nic_update2.patch          | 3332 ++++---------------------
 boot/grub/grub.mk                             |    6 +-
 4 files changed, 475 insertions(+), 2887 deletions(-)

diff --git a/boot/grub/grub.200-fix_mbr_handling.patch b/boot/grub/grub.200-fix_mbr_handling.patch
index fdee0ef..21e200f 100644
--- a/boot/grub/grub.200-fix_mbr_handling.patch
+++ b/boot/grub/grub.200-fix_mbr_handling.patch
@@ -1,8 +1,10 @@
---- grub-0.97.oorig/stage2/disk_io.c	2004-05-23 18:35:24.000000000 +0200
-+++ grub-0.97/stage2/disk_io.c	2006-03-12 14:11:51.000000000 +0100
-@@ -365,7 +365,7 @@ rawwrite (int drive, int sector, char *b
+Index: b/stage2/disk_io.c
+===================================================================
+--- a/stage2/disk_io.c
++++ b/stage2/disk_io.c
+@@ -365,7 +365,7 @@
  int
- devwrite (int sector, int sector_count, char *buf)
+ devwrite (unsigned int sector, int sector_count, char *buf)
  {
 -#if defined(GRUB_UTIL) && defined(__linux__)
 +#if defined(GRUB_UTIL) && defined(__linux__) && !defined(SUPPORT_LOOPDEV)
diff --git a/boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch b/boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
index 5b94186..8ed9d76 100644
--- a/boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
+++ b/boot/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
@@ -1,6 +1,7 @@
-diff -rup grub-0.97.orig/grub/asmstub.c grub-0.97/grub/asmstub.c
---- grub-0.97.orig/grub/asmstub.c	2006-11-29 20:36:20.000000000 +0100
-+++ grub-0.97/grub/asmstub.c	2006-11-29 21:26:16.000000000 +0100
+Index: b/grub/asmstub.c
+===================================================================
+--- a/grub/asmstub.c
++++ b/grub/asmstub.c
 @@ -18,10 +18,13 @@
   *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
   */
@@ -15,9 +16,10 @@ diff -rup grub-0.97.orig/grub/asmstub.c grub-0.97/grub/asmstub.c
  
  /* Simulator entry point. */
  int grub_stage2 (void);
-diff -rup grub-0.97.orig/lib/device.c grub-0.97/lib/device.c
---- grub-0.97.orig/lib/device.c	2006-11-29 20:36:20.000000000 +0100
-+++ grub-0.97/lib/device.c	2006-11-29 21:25:19.000000000 +0100
+Index: b/lib/device.c
+===================================================================
+--- a/lib/device.c
++++ b/lib/device.c
 @@ -18,10 +18,13 @@
   *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
   */
diff --git a/boot/grub/grub.400-nic_update2.patch b/boot/grub/grub.400-nic_update2.patch
index 064c953..5e3c16d 100644
--- a/boot/grub/grub.400-nic_update2.patch
+++ b/boot/grub/grub.400-nic_update2.patch
@@ -7,9 +7,10 @@ Description: Adds support for Forcedeth and other NIC's
 	     Fixes for GCC 4.x
 	     Removal of bad network drivers
  
-diff -Naur grub-0.97.orig/configure grub-0.97/configure
---- grub-0.97.orig/configure	2005-05-08 02:48:12.000000000 +0000
-+++ grub-0.97/configure	2005-09-01 00:15:48.000000000 +0000
+Index: b/configure
+===================================================================
+--- a/configure
++++ b/configure
 @@ -872,47 +872,32 @@
    --disable-packet-retransmission
                            turn off packet retransmission
@@ -66,9 +67,9 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
                            set the default memory location for WD/SMC
 -  --enable-cs-scan=LIST   probe for CS89x0 base address using LIST
    --enable-diskless       enable diskless support
+   --disable-graphics      disable graphics terminal support
    --disable-hercules      disable hercules terminal support
-   --disable-serial        disable serial terminal support
-@@ -5559,7 +5544,7 @@
+@@ -5537,7 +5522,7 @@
  
  fi;
  if test "x$enable_packet_retransmission" != xno; then
@@ -77,7 +78,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  fi
  
  # Check whether --enable-pci-direct or --disable-pci-direct was given.
-@@ -5571,26 +5556,6 @@
+@@ -5549,26 +5534,6 @@
    NET_EXTRAFLAGS="$NET_EXTRAFLAGS -DCONFIG_PCI_DIRECT=1"
  fi
  
@@ -104,7 +105,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  # Check whether --enable-3c595 or --disable-3c595 was given.
  if test "${enable_3c595+set}" = set; then
    enableval="$enable_3c595"
-@@ -5611,16 +5576,6 @@
+@@ -5589,16 +5554,6 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS 3c90x.o"
  fi
  
@@ -121,7 +122,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  # Check whether --enable-davicom or --disable-davicom was given.
  if test "${enable_davicom+set}" = set; then
    enableval="$enable_davicom"
-@@ -5631,24 +5586,14 @@
+@@ -5609,24 +5564,14 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS davicom.o"
  fi
  
@@ -152,7 +153,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  fi
  
  # Check whether --enable-eepro100 or --disable-eepro100 was given.
-@@ -5671,64 +5616,14 @@
+@@ -5649,64 +5594,14 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS epic100.o"
  fi
  
@@ -223,7 +224,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  fi
  
  # Check whether --enable-natsemi or --disable-natsemi was given.
-@@ -5741,34 +5636,14 @@
+@@ -5719,34 +5614,14 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS natsemi.o"
  fi
  
@@ -264,7 +265,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  fi
  
  # Check whether --enable-ns8390 or --disable-ns8390 was given.
-@@ -5781,24 +5656,24 @@
+@@ -5759,24 +5634,24 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS ns8390.o"
  fi
  
@@ -301,7 +302,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  fi
  
  # Check whether --enable-rtl8139 or --disable-rtl8139 was given.
-@@ -5811,6 +5686,16 @@
+@@ -5789,6 +5664,16 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS rtl8139.o"
  fi
  
@@ -318,7 +319,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  # Check whether --enable-sis900 or --disable-sis900 was given.
  if test "${enable_sis900+set}" = set; then
    enableval="$enable_sis900"
-@@ -5821,34 +5706,14 @@
+@@ -5799,34 +5684,14 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS sis900.o"
  fi
  
@@ -359,7 +360,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  fi
  
  # Check whether --enable-tulip or --disable-tulip was given.
-@@ -5861,6 +5726,16 @@
+@@ -5839,6 +5704,16 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS tulip.o"
  fi
  
@@ -376,7 +377,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  # Check whether --enable-via-rhine or --disable-via-rhine was given.
  if test "${enable_via_rhine+set}" = set; then
    enableval="$enable_via_rhine"
-@@ -5895,24 +5770,6 @@
+@@ -5873,24 +5748,6 @@
    FSYS_CFLAGS="$FSYS_CFLAGS -DFSYS_TFTP=1"
  fi
  
@@ -401,7 +402,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  # Check whether --enable-compex-rl2000-fix or --disable-compex-rl2000-fix was given.
  if test "${enable_compex_rl2000_fix+set}" = set; then
    enableval="$enable_compex_rl2000_fix"
-@@ -5922,12 +5779,6 @@
+@@ -5900,12 +5757,6 @@
    NET_EXTRAFLAGS="$NET_EXTRAFLAGS -DCOMPEX_RL2000_FIX=1"
  fi
  
@@ -414,7 +415,7 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  # Check whether --enable-ne-scan or --disable-ne-scan was given.
  if test "${enable_ne_scan+set}" = set; then
    enableval="$enable_ne_scan"
-@@ -5944,12 +5795,6 @@
+@@ -5922,12 +5773,6 @@
    NET_EXTRAFLAGS="$NET_EXTRAFLAGS -DWD_DEFAULT_MEM=0xCC000"
  fi;
  
@@ -427,10 +428,11 @@ diff -Naur grub-0.97.orig/configure grub-0.97/configure
  # Check whether --enable-diskless or --disable-diskless was given.
  if test "${enable_diskless+set}" = set; then
    enableval="$enable_diskless"
-diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
---- grub-0.97.orig/configure.ac	2005-05-08 02:36:03.000000000 +0000
-+++ grub-0.97/configure.ac	2005-09-01 00:16:05.000000000 +0000
-@@ -317,7 +317,7 @@
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -344,7 +344,7 @@
    [  --disable-packet-retransmission
                            turn off packet retransmission])
  if test "x$enable_packet_retransmission" != xno; then
@@ -439,7 +441,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  fi
  
  AC_ARG_ENABLE(pci-direct,
-@@ -327,20 +327,6 @@
+@@ -354,20 +354,6 @@
  fi
  
  dnl Device drivers.
@@ -460,7 +462,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  AC_ARG_ENABLE(3c595,
    [  --enable-3c595          enable 3Com595 driver])
  if test "x$enable_3c595" = xyes; then
-@@ -355,13 +341,6 @@
+@@ -382,13 +368,6 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS 3c90x.o"
  fi
  
@@ -474,7 +476,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  AC_ARG_ENABLE(davicom,
    [  --enable-davicom        enable Davicom driver])
  if test "x$enable_davicom" = xyes; then
-@@ -369,18 +348,11 @@
+@@ -396,18 +375,11 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS davicom.o"
  fi
  
@@ -498,7 +500,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  fi
  
  AC_ARG_ENABLE(eepro100,
-@@ -397,46 +369,11 @@
+@@ -424,46 +396,11 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS epic100.o"
  fi
  
@@ -550,7 +552,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  fi
  
  AC_ARG_ENABLE(natsemi,
-@@ -446,25 +383,11 @@
+@@ -473,25 +410,11 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS natsemi.o"
  fi
  
@@ -581,7 +583,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  fi
  
  AC_ARG_ENABLE(ns8390,
-@@ -474,18 +397,18 @@
+@@ -501,18 +424,18 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS ns8390.o"
  fi
  
@@ -610,7 +612,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  fi
  
  AC_ARG_ENABLE(rtl8139,
-@@ -495,6 +418,13 @@
+@@ -522,6 +445,13 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS rtl8139.o"
  fi
  
@@ -624,7 +626,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  AC_ARG_ENABLE(sis900,
    [  --enable-sis900         enable SIS 900 and SIS 7016 driver])
  if test "x$enable_sis900" = xyes; then
-@@ -502,25 +432,11 @@
+@@ -529,25 +459,11 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS sis900.o"
  fi
  
@@ -655,7 +657,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  fi
  
  AC_ARG_ENABLE(tulip,
-@@ -530,6 +446,13 @@
+@@ -557,6 +473,13 @@
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS tulip.o"
  fi
  
@@ -669,7 +671,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  AC_ARG_ENABLE(via-rhine,
    [  --enable-via-rhine      enable Rhine-I/II driver])
  if test "x$enable_via_rhine" = xyes; then
-@@ -538,7 +461,7 @@
+@@ -565,7 +488,7 @@
  fi
  
  AC_ARG_ENABLE(w89c840,
@@ -678,7 +680,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  if test "x$enable_w89c840" = xyes; then
    NET_CFLAGS="$NET_CFLAGS -DINCLUDE_W89C840=1"
    NETBOOT_DRIVERS="$NETBOOT_DRIVERS w89c840.o"
-@@ -550,19 +473,7 @@
+@@ -577,19 +500,7 @@
    FSYS_CFLAGS="$FSYS_CFLAGS -DFSYS_TFTP=1"
  fi
  
@@ -699,7 +701,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  AC_ARG_ENABLE(compex-rl2000-fix,
    [  --enable-compex-rl2000-fix
                            specify this if you have a Compex RL2000 PCI])
-@@ -570,11 +481,6 @@
+@@ -597,11 +508,6 @@
    NET_EXTRAFLAGS="$NET_EXTRAFLAGS -DCOMPEX_RL2000_FIX=1"
  fi
  
@@ -711,7 +713,7 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  AC_ARG_ENABLE(ne-scan,
    [  --enable-ne-scan=LIST   probe for NE base address using LIST],
    [NET_EXTRAFLAGS="$NET_EXTRAFLAGS -DNE_SCAN=$enable_ne_scan"],
-@@ -586,10 +492,6 @@
+@@ -613,10 +519,6 @@
    [NET_EXTRAFLAGS="$NET_EXTRAFLAGS -DWD_DEFAULT_MEM=$enable_wd_default_mem"],
    [NET_EXTRAFLAGS="$NET_EXTRAFLAGS -DWD_DEFAULT_MEM=0xCC000"])
  
@@ -722,9 +724,10 @@ diff -Naur grub-0.97.orig/configure.ac grub-0.97/configure.ac
  dnl Diskless
  AC_ARG_ENABLE(diskless,
    [  --enable-diskless       enable diskless support])
-diff -Naur grub-0.97.orig/netboot/3c509.h grub-0.97/netboot/3c509.h
---- grub-0.97.orig/netboot/3c509.h	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/3c509.h	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/3c509.h
+===================================================================
+--- a/netboot/3c509.h
++++ /dev/null
 @@ -1,397 +0,0 @@
 -/*
 - * Copyright (c) 1993 Herb Peyerl (hpeyerl at novatel.ca) All rights reserved.
@@ -1123,9 +1126,10 @@ diff -Naur grub-0.97.orig/netboot/3c509.h grub-0.97/netboot/3c509.h
 - *  c-basic-offset: 8
 - * End:
 - */
-diff -Naur grub-0.97.orig/netboot/3c595.c grub-0.97/netboot/3c595.c
---- grub-0.97.orig/netboot/3c595.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/3c595.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/3c595.c
+===================================================================
+--- a/netboot/3c595.c
++++ b/netboot/3c595.c
 @@ -20,6 +20,7 @@
  *
  *  Copyright (c) 1994 Herb Peyerl <hpeyerl@novatel.ca>
@@ -1317,9 +1321,10 @@ diff -Naur grub-0.97.orig/netboot/3c595.c grub-0.97/netboot/3c595.c
  /*
   * Local variables:
   *  c-basic-offset: 8
-diff -Naur grub-0.97.orig/netboot/3c90x.c grub-0.97/netboot/3c90x.c
---- grub-0.97.orig/netboot/3c90x.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/3c90x.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/3c90x.c
+===================================================================
+--- a/netboot/3c90x.c
++++ b/netboot/3c90x.c
 @@ -1,7 +1,7 @@
  /*
   * 3c90x.c -- This file implements the 3c90x driver for etherboot.  Written
@@ -1655,9 +1660,10 @@ diff -Naur grub-0.97.orig/netboot/3c90x.c grub-0.97/netboot/3c90x.c
 +	.id_count = sizeof(a3c90x_nics)/sizeof(a3c90x_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/3c90x.txt grub-0.97/netboot/3c90x.txt
---- grub-0.97.orig/netboot/3c90x.txt	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/3c90x.txt	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/3c90x.txt
+===================================================================
+--- a/netboot/3c90x.txt
++++ /dev/null
 @@ -1,307 +0,0 @@
 -
 -	Instructions for use of the 3C90X driver for EtherBoot
@@ -1966,9 +1972,10 @@ diff -Naur grub-0.97.orig/netboot/3c90x.txt grub-0.97/netboot/3c90x.txt
 -without this bugfix parameter, to boot the machine from the PROM chip.
 -
 -[Any recent Etherboot version should do, not just 4.6.10 - Ed.]
-diff -Naur grub-0.97.orig/netboot/Makefile.am grub-0.97/netboot/Makefile.am
---- grub-0.97.orig/netboot/Makefile.am	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/Makefile.am	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/Makefile.am
+===================================================================
+--- a/netboot/Makefile.am
++++ b/netboot/Makefile.am
 @@ -10,58 +10,72 @@
  
  noinst_LIBRARIES = $(LIBDRIVERS)
@@ -2310,10 +2317,11 @@ diff -Naur grub-0.97.orig/netboot/Makefile.am grub-0.97/netboot/Makefile.am
 +undi_o_CFLAGS = -DINCLUDE_UNDI=1
  via_rhine_o_CFLAGS = -DINCLUDE_VIA_RHINE=1
  w89c840_o_CFLAGS = -DINCLUDE_W89C840=1
-diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
---- grub-0.97.orig/netboot/Makefile.in	2005-05-08 02:42:35.000000000 +0000
-+++ grub-0.97/netboot/Makefile.in	2005-09-01 00:14:15.000000000 +0000
-@@ -48,18 +47,51 @@
+Index: b/netboot/Makefile.in
+===================================================================
+--- a/netboot/Makefile.in
++++ b/netboot/Makefile.in
+@@ -46,18 +46,51 @@
  mkinstalldirs = $(SHELL) $(top_srcdir)/mkinstalldirs
  CONFIG_HEADER = $(top_builddir)/config.h
  CONFIG_CLEAN_FILES =
@@ -2369,7 +2377,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  COMPILE = $(CC) $(DEFS) $(DEFAULT_INCLUDES) $(INCLUDES) $(AM_CPPFLAGS) \
  	$(CPPFLAGS) $(AM_CFLAGS) $(CFLAGS)
  CCLD = $(CC)
-@@ -148,8 +180,6 @@
+@@ -148,8 +181,6 @@
  am__include = @am__include@
  am__leading_dot = @am__leading_dot@
  am__quote = @am__quote@
@@ -2378,7 +2386,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  bindir = @bindir@
  build = @build@
  build_alias = @build_alias@
-@@ -186,16 +216,19 @@
+@@ -186,16 +217,19 @@
  # Don't build the netboot support by default.
  @NETBOOT_SUPPORT_TRUE at LIBDRIVERS = libdrivers.a
  noinst_LIBRARIES = $(LIBDRIVERS)
@@ -2408,7 +2416,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  
  libdrivers_a_CFLAGS = $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
  	-DFSYS_TFTP=1 $(NET_CFLAGS) $(NET_EXTRAFLAGS)
-@@ -203,69 +236,83 @@
+@@ -203,69 +237,83 @@
  # Filled by configure.
  libdrivers_a_LIBADD = @NETBOOT_DRIVERS@
  libdrivers_a_DEPENDENCIES = $(libdrivers_a_LIBADD)
@@ -2525,7 +2533,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  tulip_o_CFLAGS = -DINCLUDE_TULIP=1
  via_rhine_o_CFLAGS = -DINCLUDE_VIA_RHINE=1
  w89c840_o_CFLAGS = -DINCLUDE_W89C840=1
-@@ -316,32 +363,32 @@
+@@ -316,32 +364,32 @@
  distclean-compile:
  	-rm -f *.tab.c
  
@@ -2571,7 +2579,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  @AMDEP_TRUE@@am__include@ @am__quote at ./$(DEPDIR)/libdrivers_a-timer.Po at am__quote@
  @AMDEP_TRUE@@am__include@ @am__quote at ./$(DEPDIR)/libdrivers_a-tlan.Po at am__quote@
  @AMDEP_TRUE@@am__include@ @am__quote at ./$(DEPDIR)/libdrivers_a-tulip.Po at am__quote@
-@@ -352,450 +399,513 @@
+@@ -352,450 +400,513 @@
  @am__fastdepCC_TRUE@	if $(COMPILE) -MT $@ -MD -MP -MF "$(DEPDIR)/$*.Tpo" -c -o $@ $<; \
  @am__fastdepCC_TRUE@	then mv -f "$(DEPDIR)/$*.Tpo" "$(DEPDIR)/$*.Po"; else rm -f "$(DEPDIR)/$*.Tpo"; exit 1; fi
  @AMDEP_TRUE@@am__fastdepCC_FALSE@	source='$<' object='$@' libtool=no @AMDEPBACKSLASH@
@@ -3301,7 +3309,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  
  ID: $(HEADERS) $(SOURCES) $(LISP) $(TAGS_FILES)
  	list='$(SOURCES) $(HEADERS) $(LISP) $(TAGS_FILES)'; \
-@@ -817,11 +927,9 @@
+@@ -817,11 +928,9 @@
  	  done | \
  	  $(AWK) '    { files[$$0] = 1; } \
  	       END { for (i in files) print i; }'`; \
@@ -3316,7 +3324,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  ctags: CTAGS
  CTAGS:  $(HEADERS) $(SOURCES)  $(TAGS_DEPENDENCIES) \
  		$(TAGS_FILES) $(LISP)
-@@ -895,7 +1003,7 @@
+@@ -895,7 +1004,7 @@
  clean-generic:
  
  distclean-generic:
@@ -3325,7 +3333,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  
  maintainer-clean-generic:
  	@echo "This command is intended for maintainers to use"
-@@ -962,10 +1070,10 @@
+@@ -962,10 +1071,10 @@
  
  
  # Is it really necessary to specify dependecies explicitly?
@@ -3340,7 +3348,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  
  $(3c595_drivers): 3c595.c 3c595.h
  $(3c595_drivers): %.o: 3c595.c
-@@ -977,23 +1085,28 @@
+@@ -977,23 +1086,28 @@
  	$(COMPILE) $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
  	  $(NET_EXTRAFLAGS) $($(basename $@)_o_CFLAGS) -o $@ -c $<
  
@@ -3379,7 +3387,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  	$(COMPILE) $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
  	  $(NET_EXTRAFLAGS) $($(basename $@)_o_CFLAGS) -o $@ -c $<
  
-@@ -1007,28 +1120,38 @@
+@@ -1007,28 +1121,38 @@
  	$(COMPILE) $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
  	  $(NET_EXTRAFLAGS) $($(basename $@)_o_CFLAGS) -o $@ -c $<
  
@@ -3428,7 +3436,7 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  	$(COMPILE) $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
  	  $(NET_EXTRAFLAGS) $($(basename $@)_o_CFLAGS) -o $@ -c $<
  
-@@ -1037,41 +1160,62 @@
+@@ -1037,41 +1161,62 @@
  	$(COMPILE) $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
  	  $(NET_EXTRAFLAGS) $($(basename $@)_o_CFLAGS) -o $@ -c $<
  
@@ -3505,9 +3513,10 @@ diff -Naur grub-0.97.orig/netboot/Makefile.in grub-0.97/netboot/Makefile.in
  $(tulip_drivers): tulip.c
  $(tulip_drivers): %.o: tulip.c
  	$(COMPILE) $(STAGE2_CFLAGS) -fno-builtin -nostdinc \
-diff -Naur grub-0.97.orig/netboot/basemem.c grub-0.97/netboot/basemem.c
---- grub-0.97.orig/netboot/basemem.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/basemem.c	2005-08-31 19:24:28.000000000 +0000
+Index: b/netboot/basemem.c
+===================================================================
+--- /dev/null
++++ b/netboot/basemem.c
 @@ -0,0 +1,178 @@
 +#include "etherboot.h"
 +#define DEBUG_BASEMEM
@@ -3687,9 +3696,10 @@ diff -Naur grub-0.97.orig/netboot/basemem.c grub-0.97/netboot/basemem.c
 +	adjust_real_mode_stack ();
 +}
 +
-diff -Naur grub-0.97.orig/netboot/big_bswap.h grub-0.97/netboot/big_bswap.h
---- grub-0.97.orig/netboot/big_bswap.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/big_bswap.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/big_bswap.h
+===================================================================
+--- /dev/null
++++ b/netboot/big_bswap.h
 @@ -0,0 +1,17 @@
 +#ifndef ETHERBOOT_BIG_BSWAP_H
 +#define ETHERBOOT_BIG_BSWAP_H
@@ -3708,9 +3718,10 @@ diff -Naur grub-0.97.orig/netboot/big_bswap.h grub-0.97/netboot/big_bswap.h
 +#define be16_to_cpu(x)	(x)
 +
 +#endif /* ETHERBOOT_BIG_BSWAP_H */
-diff -Naur grub-0.97.orig/netboot/bootp.h grub-0.97/netboot/bootp.h
---- grub-0.97.orig/netboot/bootp.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/bootp.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/bootp.h
+===================================================================
+--- /dev/null
++++ b/netboot/bootp.h
 @@ -0,0 +1,182 @@
 +#ifndef	_BOOTP_H
 +#define	_BOOTP_H
@@ -3894,9 +3905,10 @@ diff -Naur grub-0.97.orig/netboot/bootp.h grub-0.97/netboot/bootp.h
 +#define BOOTP_DATA_ADDR (&bootp_data)
 +
 +#endif	/* _BOOTP_H */
-diff -Naur grub-0.97.orig/netboot/byteswap.h grub-0.97/netboot/byteswap.h
---- grub-0.97.orig/netboot/byteswap.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/byteswap.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/byteswap.h
+===================================================================
+--- /dev/null
++++ b/netboot/byteswap.h
 @@ -0,0 +1,20 @@
 +#ifndef ETHERBOOT_BYTESWAP_H
 +#define ETHERBOOT_BYTESWAP_H
@@ -3918,9 +3930,10 @@ diff -Naur grub-0.97.orig/netboot/byteswap.h grub-0.97/netboot/byteswap.h
 +#define bswap_16(x)	__bswap_16(x)
 +	
 +#endif /* ETHERBOOT_BYTESWAP_H */
-diff -Naur grub-0.97.orig/netboot/cards.h grub-0.97/netboot/cards.h
---- grub-0.97.orig/netboot/cards.h	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/cards.h	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/cards.h
+===================================================================
+--- a/netboot/cards.h
++++ /dev/null
 @@ -1,183 +0,0 @@
 -#ifndef	CARDS_H
 -#define CARDS_H
@@ -4105,9 +4118,10 @@ diff -Naur grub-0.97.orig/netboot/cards.h grub-0.97/netboot/cards.h
 -#endif
 -
 -#endif	/* CARDS_H */
-diff -Naur grub-0.97.orig/netboot/config.c grub-0.97/netboot/config.c
---- grub-0.97.orig/netboot/config.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/config.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/config.c
+===================================================================
+--- a/netboot/config.c
++++ b/netboot/config.c
 @@ -1,598 +1,165 @@
  /*
 - *  GRUB  --  GRand Unified Bootloader
@@ -4842,9 +4856,10 @@ diff -Naur grub-0.97.orig/netboot/config.c grub-0.97/netboot/config.c
 +		dev->disable = 0;
 +	}
  }
-diff -Naur grub-0.97.orig/netboot/cpu.h grub-0.97/netboot/cpu.h
---- grub-0.97.orig/netboot/cpu.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/cpu.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/cpu.h
+===================================================================
+--- /dev/null
++++ b/netboot/cpu.h
 @@ -0,0 +1,243 @@
 +#ifndef I386_BITS_CPU_H
 +#define I386_BITS_CPU_H
@@ -5089,10 +5104,14 @@ diff -Naur grub-0.97.orig/netboot/cpu.h grub-0.97/netboot/cpu.h
 +#endif
 +
 +#endif /* I386_BITS_CPU_H */
-diff -Naur grub-0.97.orig/netboot/cs89x0.c grub-0.97/netboot/cs89x0.c
---- grub-0.97.orig/netboot/cs89x0.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/cs89x0.c	1970-01-01 00:00:00.000000000 +0000
-@@ -1,659 +0,0 @@
+Index: b/netboot/cs89x0.c
+===================================================================
+--- a/netboot/cs89x0.c
++++ b/netboot/cs89x0.c
+@@ -16,662 +16,3 @@
+    -- quote from email
+ **/
+ 
 -/* cs89x0.c: A Crystal Semiconductor CS89[02]0 driver for etherboot. */
 -/*
 -  Permission is granted to distribute the enclosed cs89x0.[ch] driver
@@ -5752,10 +5771,14 @@ diff -Naur grub-0.97.orig/netboot/cs89x0.c grub-0.97/netboot/cs89x0.c
 - * End:
 - */
 -
-diff -Naur grub-0.97.orig/netboot/cs89x0.h grub-0.97/netboot/cs89x0.h
---- grub-0.97.orig/netboot/cs89x0.h	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/cs89x0.h	1970-01-01 00:00:00.000000000 +0000
-@@ -1,461 +0,0 @@
+Index: b/netboot/cs89x0.h
+===================================================================
+--- a/netboot/cs89x0.h
++++ b/netboot/cs89x0.h
+@@ -16,464 +16,3 @@
+    -- quote from email
+ **/
+ 
 -/*  Copyright, 1988-1992, Russell Nelson, Crynwr Software
 -
 -   This program is free software; you can redistribute it and/or modify
@@ -6217,9 +6240,10 @@ diff -Naur grub-0.97.orig/netboot/cs89x0.h grub-0.97/netboot/cs89x0.h
 - * End:
 - */
 -
-diff -Naur grub-0.97.orig/netboot/cs89x0.txt grub-0.97/netboot/cs89x0.txt
---- grub-0.97.orig/netboot/cs89x0.txt	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/cs89x0.txt	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/cs89x0.txt
+===================================================================
+--- a/netboot/cs89x0.txt
++++ /dev/null
 @@ -1,26 +0,0 @@
 -Permission is granted to distribute the enclosed cs89x0.[ch] driver
 -only in conjunction with the Etherboot package.  The code is
@@ -6247,9 +6271,10 @@ diff -Naur grub-0.97.orig/netboot/cs89x0.txt grub-0.97/netboot/cs89x0.txt
 -     for writing the Linux device driver for the CS89x0
 -     chipset. Russel's code is very well designed and simplified my
 -     job a lot.
-diff -Naur grub-0.97.orig/netboot/davicom.c grub-0.97/netboot/davicom.c
---- grub-0.97.orig/netboot/davicom.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/davicom.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/davicom.c
+===================================================================
+--- a/netboot/davicom.c
++++ b/netboot/davicom.c
 @@ -1,12 +1,12 @@
 +#ifdef ALLMULTI
 +#error multicast support is not yet implemented
@@ -6523,9 +6548,10 @@ diff -Naur grub-0.97.orig/netboot/davicom.c grub-0.97/netboot/davicom.c
 +	.id_count = sizeof(davicom_nics)/sizeof(davicom_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/depca.c grub-0.97/netboot/depca.c
---- grub-0.97.orig/netboot/depca.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/depca.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/depca.c
+===================================================================
+--- a/netboot/depca.c
++++ /dev/null
 @@ -1,752 +0,0 @@
 -/* Etherboot: depca.h merged, comments from Linux driver retained */
 -/*  depca.c: A DIGITAL DEPCA  & EtherWORKS ethernet driver for linux.
@@ -7279,9 +7305,10 @@ diff -Naur grub-0.97.orig/netboot/depca.c grub-0.97/netboot/depca.c
 -	nic->disable = depca_disable;
 -	return (nic);
 -}
-diff -Naur grub-0.97.orig/netboot/dev.h grub-0.97/netboot/dev.h
---- grub-0.97.orig/netboot/dev.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/dev.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/dev.h
+===================================================================
+--- /dev/null
++++ b/netboot/dev.h
 @@ -0,0 +1,83 @@
 +#ifndef _DEV_H
 +#define _DEV_H
@@ -7366,9 +7393,10 @@ diff -Naur grub-0.97.orig/netboot/dev.h grub-0.97/netboot/dev.h
 +extern void disable(struct dev *dev);
 +
 +#endif /* _DEV_H */
-diff -Naur grub-0.97.orig/netboot/e1000.c grub-0.97/netboot/e1000.c
---- grub-0.97.orig/netboot/e1000.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/e1000.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/e1000.c
+===================================================================
+--- /dev/null
++++ b/netboot/e1000.c
 @@ -0,0 +1,3682 @@
 +/**************************************************************************
 +Etherboot -  BOOTP/TFTP Bootstrap Program
@@ -11052,9 +11080,10 @@ diff -Naur grub-0.97.orig/netboot/e1000.c grub-0.97/netboot/e1000.c
 +	.id_count = sizeof(e1000_nics)/sizeof(e1000_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/e1000_hw.h grub-0.97/netboot/e1000_hw.h
---- grub-0.97.orig/netboot/e1000_hw.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/e1000_hw.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/e1000_hw.h
+===================================================================
+--- /dev/null
++++ b/netboot/e1000_hw.h
 @@ -0,0 +1,2058 @@
 +/*******************************************************************************
 +
@@ -13114,9 +13143,10 @@ diff -Naur grub-0.97.orig/netboot/e1000_hw.h grub-0.97/netboot/e1000_hw.h
 +#define AUTONEG_ADVERTISE_10_ALL        0x0003	/* 10Mbps Full & Half speeds*/
 +
 +#endif /* _E1000_HW_H_ */
-diff -Naur grub-0.97.orig/netboot/eepro.c grub-0.97/netboot/eepro.c
---- grub-0.97.orig/netboot/eepro.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/eepro.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/eepro.c
+===================================================================
+--- a/netboot/eepro.c
++++ /dev/null
 @@ -1,586 +0,0 @@
 -/**************************************************************************
 -Etherboot -  BOOTP/TFTP Bootstrap Program
@@ -13704,9 +13734,10 @@ diff -Naur grub-0.97.orig/netboot/eepro.c grub-0.97/netboot/eepro.c
 -	nic->disable = eepro_disable;
 -	return (nic);
 -}
-diff -Naur grub-0.97.orig/netboot/eepro100.c grub-0.97/netboot/eepro100.c
---- grub-0.97.orig/netboot/eepro100.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/eepro100.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/eepro100.c
+===================================================================
+--- a/netboot/eepro100.c
++++ b/netboot/eepro100.c
 @@ -80,8 +80,8 @@
   *
   * Caveats:
@@ -14538,9 +14569,10 @@ diff -Naur grub-0.97.orig/netboot/eepro100.c grub-0.97/netboot/eepro100.c
 +	.id_count  = sizeof(eepro100_nics)/sizeof(eepro100_nics[0]),
 +	.class     = 0
 +};
-diff -Naur grub-0.97.orig/netboot/elf.h grub-0.97/netboot/elf.h
---- grub-0.97.orig/netboot/elf.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/elf.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/elf.h
+===================================================================
+--- /dev/null
++++ b/netboot/elf.h
 @@ -0,0 +1,234 @@
 +#ifndef ELF_H
 +#define ELF_H
@@ -14776,9 +14808,10 @@ diff -Naur grub-0.97.orig/netboot/elf.h grub-0.97/netboot/elf.h
 +//#include "elf_boot.h"
 +
 +#endif /* ELF_H */
-diff -Naur grub-0.97.orig/netboot/endian.h grub-0.97/netboot/endian.h
---- grub-0.97.orig/netboot/endian.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/endian.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/endian.h
+===================================================================
+--- /dev/null
++++ b/netboot/endian.h
 @@ -0,0 +1,19 @@
 +#ifndef ETHERBOOT_ENDIAN_H
 +#define ETHERBOOT_ENDIAN_H
@@ -14799,9 +14832,10 @@ diff -Naur grub-0.97.orig/netboot/endian.h grub-0.97/netboot/endian.h
 +
 +
 +#endif /* ETHERBOOT_ENDIAN_H */
-diff -Naur grub-0.97.orig/netboot/epic100.c grub-0.97/netboot/epic100.c
---- grub-0.97.orig/netboot/epic100.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/epic100.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/epic100.c
+===================================================================
+--- a/netboot/epic100.c
++++ b/netboot/epic100.c
 @@ -1,15 +1,18 @@
 +
  /* epic100.c: A SMC 83c170 EPIC/100 fast ethernet driver for Etherboot */
@@ -15198,9 +15232,10 @@ diff -Naur grub-0.97.orig/netboot/epic100.c grub-0.97/netboot/epic100.c
 +	.id_count = sizeof(epic100_nics)/sizeof(epic100_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/etherboot.h grub-0.97/netboot/etherboot.h
---- grub-0.97.orig/netboot/etherboot.h	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/etherboot.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/etherboot.h
+===================================================================
+--- a/netboot/etherboot.h
++++ b/netboot/etherboot.h
 @@ -1,6 +1,6 @@
  /*
   *  GRUB  --  GRand Unified Bootloader
@@ -15209,13 +15244,15 @@ diff -Naur grub-0.97.orig/netboot/etherboot.h grub-0.97/netboot/etherboot.h
   *
   *  This program is free software; you can redistribute it and/or modify
   *  it under the terms of the GNU General Public License as published by
-@@ -17,531 +17,45 @@
+@@ -17,528 +17,40 @@
   *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
   */
  
 -/* RULE: You must define the macro ``GRUB'' when including this header
 -   file in GRUB code.  */
--
++#ifndef ETHERBOOT_H
++#define ETHERBOOT_H
+ 
 -/* Based on "src/etherboot.h" in etherboot-5.0.5.  */
 -
 -/**************************************************************************
@@ -15247,36 +15284,31 @@ diff -Naur grub-0.97.orig/netboot/etherboot.h grub-0.97/netboot/etherboot.h
 -
 -#ifndef	MAX_TFTP_RETRIES
 -# define MAX_TFTP_RETRIES	20
--#endif
--
++#include "shared.h"
++#include "osdep.h"
++#include "if_ether.h"
++#include "in.h"
++
++/* Link configuration time in tenths of a second */
++#ifndef VALID_LINK_TIMEOUT
++#define VALID_LINK_TIMEOUT	100 /* 10.0 seconds */
+ #endif
+ 
 -#ifndef	MAX_BOOTP_RETRIES
 -# define MAX_BOOTP_RETRIES	20
 -#endif
 -
 -#define MAX_BOOTP_EXTLEN	(ETH_FRAME_LEN - ETH_HLEN - \
 -				 sizeof (struct bootp_t))
-+/* 
-+ * Transport layer to use Etherboot NIC drivers in GRUB.
-+ */
- 
+-
 -#ifndef	MAX_ARP_RETRIES
 -# define MAX_ARP_RETRIES	20
 -#endif
-+#ifndef ETHERBOOT_H
-+#define ETHERBOOT_H
- 
+-
 -#ifndef	MAX_RPC_RETRIES
 -# define MAX_RPC_RETRIES	20
-+#include "shared.h"
-+#include "osdep.h"
-+#include "if_ether.h"
-+#include "in.h"
-+
-+/* Link configuration time in tenths of a second */
-+#ifndef VALID_LINK_TIMEOUT
-+#define VALID_LINK_TIMEOUT	100 /* 10.0 seconds */
- #endif
- 
+-#endif
+-
 -#define	TICKS_PER_SEC		18
 -
 -/* Inter-packet retry in ticks */
@@ -15289,8 +15321,7 @@ diff -Naur grub-0.97.orig/netboot/etherboot.h grub-0.97/netboot/etherboot.h
 -#define TFTP_REXMT		(3 * TICKS_PER_SEC)
 -
  #ifndef	NULL
--# define NULL			((void *) 0)
-+#define NULL	((void *)0)
+ # define NULL			((void *) 0)
  #endif
  
 -/*
@@ -15741,10 +15772,7 @@ diff -Naur grub-0.97.orig/netboot/etherboot.h grub-0.97/netboot/etherboot.h
 -extern int network_ready;
 -extern struct rom_info rom;
 -extern struct arptable_t arptable[MAX_ARP];
--extern struct bootpd_t bootp_data;
--#define	BOOTP_DATA_ADDR	(&bootp_data)
--extern unsigned char *end_of_rfc1533;
- 
+-
 -/* config.c */
 -extern struct nic nic;
 +#define gateA20_set() gateA20(1)
@@ -15774,9 +15802,10 @@ diff -Naur grub-0.97.orig/netboot/etherboot.h grub-0.97/netboot/etherboot.h
 -# define sprintf etherboot_sprintf
 -#endif /* GRUB */
 +#endif /* ETHERBOOT_H */
-diff -Naur grub-0.97.orig/netboot/fa311.c grub-0.97/netboot/fa311.c
---- grub-0.97.orig/netboot/fa311.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/fa311.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/fa311.c
+===================================================================
+--- a/netboot/fa311.c
++++ /dev/null
 @@ -1,421 +0,0 @@
 -/*
 -        Driver for the National Semiconductor DP83810 Ethernet controller.
@@ -16199,9 +16228,10 @@ diff -Naur grub-0.97.orig/netboot/fa311.c grub-0.97/netboot/fa311.c
 -	return;
 -}
 -
-diff -Naur grub-0.97.orig/netboot/forcedeth.c grub-0.97/netboot/forcedeth.c
---- grub-0.97.orig/netboot/forcedeth.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/forcedeth.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/forcedeth.c
+===================================================================
+--- /dev/null
++++ b/netboot/forcedeth.c
 @@ -0,0 +1,1039 @@
 +/**************************************************************************
 +*    forcedeth.c -- Etherboot device driver for the NVIDIA nForce 
@@ -17242,9 +17272,10 @@ diff -Naur grub-0.97.orig/netboot/forcedeth.c grub-0.97/netboot/forcedeth.c
 +	.id_count = sizeof(forcedeth_nics) / sizeof(forcedeth_nics[0]),
 +	.class = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/fsys_tftp.c grub-0.97/netboot/fsys_tftp.c
---- grub-0.97.orig/netboot/fsys_tftp.c	2004-04-15 11:38:40.000000000 +0000
-+++ grub-0.97/netboot/fsys_tftp.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/fsys_tftp.c
+===================================================================
+--- a/netboot/fsys_tftp.c
++++ b/netboot/fsys_tftp.c
 @@ -29,14 +29,15 @@
  /* #define TFTP_DEBUG	1 */
  
@@ -17465,9 +17496,10 @@ diff -Naur grub-0.97.orig/netboot/fsys_tftp.c grub-0.97/netboot/fsys_tftp.c
    
  #ifdef TFTP_DEBUG
    grub_printf ("send_rrq ()\n");
-diff -Naur grub-0.97.orig/netboot/grub.h grub-0.97/netboot/grub.h
---- grub-0.97.orig/netboot/grub.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/grub.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/grub.h
+===================================================================
+--- /dev/null
++++ b/netboot/grub.h
 @@ -0,0 +1,171 @@
 +#ifndef GRUB_H
 +#define GRUB_H
@@ -17640,9 +17672,10 @@ diff -Naur grub-0.97.orig/netboot/grub.h grub-0.97/netboot/grub.h
 +
 +extern struct nic nic;
 +#endif /* GRUB_H */
-diff -Naur grub-0.97.orig/netboot/i386_byteswap.h grub-0.97/netboot/i386_byteswap.h
---- grub-0.97.orig/netboot/i386_byteswap.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/i386_byteswap.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/i386_byteswap.h
+===================================================================
+--- /dev/null
++++ b/netboot/i386_byteswap.h
 @@ -0,0 +1,46 @@
 +#ifndef ETHERBOOT_BITS_BYTESWAP_H
 +#define ETHERBOOT_BITS_BYTESWAP_H
@@ -17690,9 +17723,10 @@ diff -Naur grub-0.97.orig/netboot/i386_byteswap.h grub-0.97/netboot/i386_byteswa
 +
 +
 +#endif /* ETHERBOOT_BITS_BYTESWAP_H */
-diff -Naur grub-0.97.orig/netboot/i386_elf.h grub-0.97/netboot/i386_elf.h
---- grub-0.97.orig/netboot/i386_elf.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/i386_elf.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/i386_elf.h
+===================================================================
+--- /dev/null
++++ b/netboot/i386_elf.h
 @@ -0,0 +1,91 @@
 +#ifndef I386_BITS_ELF_H
 +#define I386_BITS_ELF_H
@@ -17785,9 +17819,10 @@ diff -Naur grub-0.97.orig/netboot/i386_elf.h grub-0.97/netboot/i386_elf.h
 +#endif	/* IMAGE_FREEBSD */
 +
 +#endif /* I386_BITS_ELF_H */
-diff -Naur grub-0.97.orig/netboot/i386_endian.h grub-0.97/netboot/i386_endian.h
---- grub-0.97.orig/netboot/i386_endian.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/i386_endian.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/i386_endian.h
+===================================================================
+--- /dev/null
++++ b/netboot/i386_endian.h
 @@ -0,0 +1,6 @@
 +#ifndef ETHERBOOT_BITS_ENDIAN_H
 +#define ETHERBOOT_BITS_ENDIAN_H
@@ -17795,9 +17830,10 @@ diff -Naur grub-0.97.orig/netboot/i386_endian.h grub-0.97/netboot/i386_endian.h
 +#define __BYTE_ORDER __LITTLE_ENDIAN
 +
 +#endif /* ETHERBOOT_BITS_ENDIAN_H */
-diff -Naur grub-0.97.orig/netboot/i386_timer.c grub-0.97/netboot/i386_timer.c
---- grub-0.97.orig/netboot/i386_timer.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/i386_timer.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/i386_timer.c
+===================================================================
+--- /dev/null
++++ b/netboot/i386_timer.c
 @@ -0,0 +1,192 @@
 +/* A couple of routines to implement a low-overhead timer for drivers */
 +
@@ -17991,9 +18027,10 @@ diff -Naur grub-0.97.orig/netboot/i386_timer.c grub-0.97/netboot/i386_timer.c
 +}
 +
 +#endif /* RTC_CURRTICKS */
-diff -Naur grub-0.97.orig/netboot/i82586.c grub-0.97/netboot/i82586.c
---- grub-0.97.orig/netboot/i82586.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/i82586.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/i82586.c
+===================================================================
+--- a/netboot/i82586.c
++++ /dev/null
 @@ -1,825 +0,0 @@
 -/**************************************************************************
 -Etherboot -  BOOTP/TFTP Bootstrap Program
@@ -18820,9 +18857,10 @@ diff -Naur grub-0.97.orig/netboot/i82586.c grub-0.97/netboot/i82586.c
 -}
 -
 -#endif
-diff -Naur grub-0.97.orig/netboot/if_arp.h grub-0.97/netboot/if_arp.h
---- grub-0.97.orig/netboot/if_arp.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/if_arp.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/if_arp.h
+===================================================================
+--- /dev/null
++++ b/netboot/if_arp.h
 @@ -0,0 +1,29 @@
 +#ifndef	_IF_ARP_H
 +#define	_IF_ARP_H
@@ -18853,9 +18891,10 @@ diff -Naur grub-0.97.orig/netboot/if_arp.h grub-0.97/netboot/if_arp.h
 +};
 +
 +#endif	/* _IF_ARP_H */
-diff -Naur grub-0.97.orig/netboot/if_ether.h grub-0.97/netboot/if_ether.h
---- grub-0.97.orig/netboot/if_ether.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/if_ether.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/if_ether.h
+===================================================================
+--- /dev/null
++++ b/netboot/if_ether.h
 @@ -0,0 +1,21 @@
 +#ifndef	_IF_ETHER_H
 +#define	_IF_ETHER_H
@@ -18878,9 +18917,10 @@ diff -Naur grub-0.97.orig/netboot/if_ether.h grub-0.97/netboot/if_ether.h
 +#endif
 +
 +#endif	/* _IF_ETHER_H */
-diff -Naur grub-0.97.orig/netboot/igmp.h grub-0.97/netboot/igmp.h
---- grub-0.97.orig/netboot/igmp.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/igmp.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/igmp.h
+===================================================================
+--- /dev/null
++++ b/netboot/igmp.h
 @@ -0,0 +1,27 @@
 +#ifndef	_IGMP_H
 +#define	_IGMP_H
@@ -18909,9 +18949,10 @@ diff -Naur grub-0.97.orig/netboot/igmp.h grub-0.97/netboot/igmp.h
 +};
 +
 +#endif	/* _IGMP_H */
-diff -Naur grub-0.97.orig/netboot/in.h grub-0.97/netboot/in.h
---- grub-0.97.orig/netboot/in.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/in.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/in.h
+===================================================================
+--- /dev/null
++++ b/netboot/in.h
 @@ -0,0 +1,21 @@
 +#ifndef	_IN_H
 +#define	_IN_H
@@ -18934,9 +18975,10 @@ diff -Naur grub-0.97.orig/netboot/in.h grub-0.97/netboot/in.h
 +} in_addr;
 +
 +#endif	/* _IN_H */
-diff -Naur grub-0.97.orig/netboot/io.h grub-0.97/netboot/io.h
---- grub-0.97.orig/netboot/io.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/io.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/io.h
+===================================================================
+--- /dev/null
++++ b/netboot/io.h
 @@ -0,0 +1,239 @@
 +#ifndef	IO_H
 +#define IO_H
@@ -19177,9 +19219,10 @@ diff -Naur grub-0.97.orig/netboot/io.h grub-0.97/netboot/io.h
 +	__inl_p(port))
 +
 +#endif /* ETHERBOOT_IO_H */
-diff -Naur grub-0.97.orig/netboot/ip.h grub-0.97/netboot/ip.h
---- grub-0.97.orig/netboot/ip.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/ip.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/ip.h
+===================================================================
+--- /dev/null
++++ b/netboot/ip.h
 @@ -0,0 +1,36 @@
 +#ifndef	_IP_H
 +#define	_IP_H
@@ -19217,9 +19260,10 @@ diff -Naur grub-0.97.orig/netboot/ip.h grub-0.97/netboot/ip.h
 +
 +
 +#endif	/* _IP_H */
-diff -Naur grub-0.97.orig/netboot/isa.h grub-0.97/netboot/isa.h
---- grub-0.97.orig/netboot/isa.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/isa.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/isa.h
+===================================================================
+--- /dev/null
++++ b/netboot/isa.h
 @@ -0,0 +1,27 @@
 +#if !defined(ISA_H) && defined(CONFIG_ISA)
 +#define ISA_H
@@ -19248,9 +19292,10 @@ diff -Naur grub-0.97.orig/netboot/isa.h grub-0.97/netboot/isa.h
 +
 +#endif /* ISA_H */
 +
-diff -Naur grub-0.97.orig/netboot/lance.c grub-0.97/netboot/lance.c
---- grub-0.97.orig/netboot/lance.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/lance.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/lance.c
+===================================================================
+--- a/netboot/lance.c
++++ /dev/null
 @@ -1,564 +0,0 @@
 -/**************************************************************************
 -Etherboot -  BOOTP/TFTP Bootstrap Program
@@ -19816,9 +19861,10 @@ diff -Naur grub-0.97.orig/netboot/lance.c grub-0.97/netboot/lance.c
 -	/* no board found */
 -	return 0;
 -}
-diff -Naur grub-0.97.orig/netboot/latch.h grub-0.97/netboot/latch.h
---- grub-0.97.orig/netboot/latch.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/latch.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/latch.h
+===================================================================
+--- /dev/null
++++ b/netboot/latch.h
 @@ -0,0 +1,10 @@
 +#ifndef LATCH_H
 +#define LATCH_H
@@ -19830,9 +19876,10 @@ diff -Naur grub-0.97.orig/netboot/latch.h grub-0.97/netboot/latch.h
 + */
 +
 +#endif /* LATCH_H */
-diff -Naur grub-0.97.orig/netboot/linux-asm-io.h grub-0.97/netboot/linux-asm-io.h
---- grub-0.97.orig/netboot/linux-asm-io.h	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/linux-asm-io.h	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/linux-asm-io.h
+===================================================================
+--- a/netboot/linux-asm-io.h
++++ /dev/null
 @@ -1,187 +0,0 @@
 -#ifndef	_ASM_IO_H
 -#define _ASM_IO_H
@@ -20021,9 +20068,10 @@ diff -Naur grub-0.97.orig/netboot/linux-asm-io.h grub-0.97/netboot/linux-asm-io.
 -	__inl_p(port))
 -
 -#endif
-diff -Naur grub-0.97.orig/netboot/linux-asm-string.h grub-0.97/netboot/linux-asm-string.h
---- grub-0.97.orig/netboot/linux-asm-string.h	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/linux-asm-string.h	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/linux-asm-string.h
+===================================================================
+--- a/netboot/linux-asm-string.h
++++ /dev/null
 @@ -1,291 +0,0 @@
 -/*
 - * Taken from Linux /usr/include/asm/string.h
@@ -20316,9 +20364,10 @@ diff -Naur grub-0.97.orig/netboot/linux-asm-string.h grub-0.97/netboot/linux-asm
 -}
 -
 -#endif
-diff -Naur grub-0.97.orig/netboot/little_bswap.h grub-0.97/netboot/little_bswap.h
---- grub-0.97.orig/netboot/little_bswap.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/little_bswap.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/little_bswap.h
+===================================================================
+--- /dev/null
++++ b/netboot/little_bswap.h
 @@ -0,0 +1,17 @@
 +#ifndef ETHERBOOT_LITTLE_BSWAP_H
 +#define ETHERBOOT_LITTLE_BSWAP_H
@@ -20337,1184 +20386,10 @@ diff -Naur grub-0.97.orig/netboot/little_bswap.h grub-0.97/netboot/little_bswap.
 +#define be16_to_cpu(x)	__bswap_16(x)
 +
 +#endif /* ETHERBOOT_LITTLE_BSWAP_H */
-diff -Naur grub-0.97.orig/netboot/main.c grub-0.97/netboot/main.c
---- grub-0.97.orig/netboot/main.c	2004-05-20 22:19:33.000000000 +0000
-+++ grub-0.97/netboot/main.c	1970-01-01 00:00:00.000000000 +0000
-@@ -1,1171 +0,0 @@
--/*
-- *  GRUB  --  GRand Unified Bootloader
-- *  Copyright (C) 2000,2001,2002  Free Software Foundation, Inc.
-- *
-- *  This program is free software; you can redistribute it and/or modify
-- *  it under the terms of the GNU General Public License as published by
-- *  the Free Software Foundation; either version 2 of the License, or
-- *  (at your option) any later version.
-- *
-- *  This program is distributed in the hope that it will be useful,
-- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
-- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- *  GNU General Public License for more details.
-- *
-- *  You should have received a copy of the GNU General Public License
-- *  along with this program; if not, write to the Free Software
-- *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
-- */
--
--/* Based on "src/main.c" in etherboot-5.0.5.  */
--
--/**************************************************************************
--ETHERBOOT -  BOOTP/TFTP Bootstrap Program
--
--Author: Martin Renters
--  Date: Dec/93
--  
--Literature dealing with the network protocols:
--       ARP - RFC826
--       RARP - RFC903
--       UDP - RFC768
--       BOOTP - RFC951, RFC2132 (vendor extensions)
--       DHCP - RFC2131, RFC2132 (options)
--       TFTP - RFC1350, RFC2347 (options), RFC2348 (blocksize), RFC2349 (tsize)
--       RPC - RFC1831, RFC1832 (XDR), RFC1833 (rpcbind/portmapper)
--       NFS - RFC1094, RFC1813 (v3, useful for clarifications, not implemented)
--
--**************************************************************************/
--
--#define GRUB	1
--#include <etherboot.h>
--#include <nic.h>
--
--/* #define DEBUG	1 */
--
--struct arptable_t arptable[MAX_ARP];
--
--/* Set if the user pushes Control-C.  */
--int ip_abort = 0;
--/* Set if an ethernet card is probed and IP addresses are set.  */
--int network_ready = 0;
--
--struct rom_info rom;
--
--static int vendorext_isvalid;
--static unsigned long netmask;
--static struct bootpd_t bootp_data;
--static unsigned long xid;
--static unsigned char *end_of_rfc1533 = NULL;
--
--#ifndef	NO_DHCP_SUPPORT
--#endif /* NO_DHCP_SUPPORT */
--
--/* ?Eth */
--static unsigned char vendorext_magic[] = {0xE4, 0x45, 0x74, 0x68};
--static const unsigned char broadcast[] = {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF};
--
--#ifdef	NO_DHCP_SUPPORT
--
--static unsigned char rfc1533_cookie[5] = {RFC1533_COOKIE, RFC1533_END};
--
--#else /* ! NO_DHCP_SUPPORT */
--
--static int dhcp_reply;
--static in_addr dhcp_server = {0L};
--static in_addr dhcp_addr = {0L};
--static unsigned char rfc1533_cookie[] = {RFC1533_COOKIE};
--static unsigned char rfc1533_end[] = {RFC1533_END};
--
--static const unsigned char dhcpdiscover[] =
--{
--  RFC2132_MSG_TYPE, 1, DHCPDISCOVER,	
--  RFC2132_MAX_SIZE,2,	/* request as much as we can */
--  ETH_MAX_MTU / 256, ETH_MAX_MTU % 256,
--  RFC2132_PARAM_LIST, 4, RFC1533_NETMASK, RFC1533_GATEWAY,
--  RFC1533_HOSTNAME, RFC1533_EXTENSIONPATH
--};
--
--static const unsigned char dhcprequest[] =
--{
--  RFC2132_MSG_TYPE, 1, DHCPREQUEST,
--  RFC2132_SRV_ID, 4, 0, 0, 0, 0,
--  RFC2132_REQ_ADDR, 4, 0, 0, 0, 0,
--  RFC2132_MAX_SIZE, 2,	/* request as much as we can */
--  ETH_MAX_MTU / 256, ETH_MAX_MTU % 256,
--  /* request parameters */
--  RFC2132_PARAM_LIST,
--  /* 4 standard + 2 vendortags */
--  4 + 2,
--  /* Standard parameters */
--  RFC1533_NETMASK, RFC1533_GATEWAY,
--  RFC1533_HOSTNAME, RFC1533_EXTENSIONPATH,
--  /* Etherboot vendortags */
--  RFC1533_VENDOR_MAGIC,
--  RFC1533_VENDOR_CONFIGFILE,
--};
--
--#endif /* ! NO_DHCP_SUPPORT */
--
--static unsigned short ipchksum (unsigned short *ip, int len);
--static unsigned short udpchksum (struct iphdr *packet);
--
--void
--print_network_configuration (void)
--{
--  if (! eth_probe ())
--    grub_printf ("No ethernet card found.\n");
--  else if (! network_ready)
--    grub_printf ("Not initialized yet.\n");
--  else
--    {
--      etherboot_printf ("Address: %@\n", arptable[ARP_CLIENT].ipaddr.s_addr);
--      etherboot_printf ("Netmask: %@\n", netmask);
--      etherboot_printf ("Server: %@\n", arptable[ARP_SERVER].ipaddr.s_addr);
--      etherboot_printf ("Gateway: %@\n", arptable[ARP_GATEWAY].ipaddr.s_addr);
--    }
--}
--
--
--/**************************************************************************
--DEFAULT_NETMASK - Return default netmask for IP address
--**************************************************************************/
--static inline unsigned long 
--default_netmask (void)
--{
--  int net = ntohl (arptable[ARP_CLIENT].ipaddr.s_addr) >> 24;
--  if (net <= 127)
--    return (htonl (0xff000000));
--  else if (net < 192)
--    return (htonl (0xffff0000));
--  else
--    return (htonl (0xffffff00));
--}
--
--/* ifconfig - configure network interface.  */
--int
--ifconfig (char *ip, char *sm, char *gw, char *svr)
--{
--  in_addr tmp;
--  
--  if (sm) 
--    {
--      if (! inet_aton (sm, &tmp))
--	return 0;
--      
--      netmask = tmp.s_addr;
--    }
--  
--  if (ip) 
--    {
--      if (! inet_aton (ip, &arptable[ARP_CLIENT].ipaddr)) 
--	return 0;
--      
--      if (! netmask && ! sm) 
--	netmask = default_netmask ();
--    }
--  
--  if (gw && ! inet_aton (gw, &arptable[ARP_GATEWAY].ipaddr)) 
--    return 0;
--
--  /* Clear out the ARP entry.  */
--  grub_memset (arptable[ARP_GATEWAY].node, 0, ETH_ALEN);
--  
--  if (svr && ! inet_aton (svr, &arptable[ARP_SERVER].ipaddr)) 
--    return 0;
--
--  /* Likewise.  */
--  grub_memset (arptable[ARP_SERVER].node, 0, ETH_ALEN);
--  
--  if (ip || sm)
--    {
--      if (IP_BROADCAST == (netmask | arptable[ARP_CLIENT].ipaddr.s_addr)
--	  || netmask == (netmask | arptable[ARP_CLIENT].ipaddr.s_addr)
--	  || ! netmask)
--	network_ready = 0;
--      else
--	network_ready = 1;
--    }
--  
--  return 1;
--}
--
--
--/**************************************************************************
--UDP_TRANSMIT - Send a UDP datagram
--**************************************************************************/
--int 
--udp_transmit (unsigned long destip, unsigned int srcsock,
--	      unsigned int destsock, int len, const void *buf)
--{
--  struct iphdr *ip;
--  struct udphdr *udp;
--  struct arprequest arpreq;
--  int arpentry, i;
--  int retry;
--
--  ip = (struct iphdr *) buf;
--  udp = (struct udphdr *) ((unsigned long) buf + sizeof (struct iphdr));
--  ip->verhdrlen = 0x45;
--  ip->service = 0;
--  ip->len = htons (len);
--  ip->ident = 0;
--  ip->frags = 0;
--  ip->ttl = 60;
--  ip->protocol = IP_UDP;
--  ip->chksum = 0;
--  ip->src.s_addr = arptable[ARP_CLIENT].ipaddr.s_addr;
--  ip->dest.s_addr = destip;
--  ip->chksum = ipchksum ((unsigned short *) buf, sizeof (struct iphdr));
--  udp->src = htons (srcsock);
--  udp->dest = htons (destsock);
--  udp->len = htons (len - sizeof (struct iphdr));
--  udp->chksum = 0;
--  udp->chksum = htons (udpchksum (ip));
--
--  if (udp->chksum == 0)
--    udp->chksum = 0xffff;
--  
--  if (destip == IP_BROADCAST)
--    {
--      eth_transmit (broadcast, IP, len, buf);
--    }
--  else
--    {
--      if (((destip & netmask)
--	   != (arptable[ARP_CLIENT].ipaddr.s_addr & netmask))
--	  && arptable[ARP_GATEWAY].ipaddr.s_addr)
--	destip = arptable[ARP_GATEWAY].ipaddr.s_addr;
--      
--      for (arpentry = 0; arpentry < MAX_ARP; arpentry++)
--	if (arptable[arpentry].ipaddr.s_addr == destip)
--	  break;
--      
--      if (arpentry == MAX_ARP)
--	{
--	  etherboot_printf ("%@ is not in my arp table!\n", destip);
--	  return 0;
--	}
--      
--      for (i = 0; i < ETH_ALEN; i++)
--	if (arptable[arpentry].node[i])
--	  break;
--      
--      if (i == ETH_ALEN)
--	{
--	  /* Need to do arp request.  */
--#ifdef DEBUG
--	  grub_printf ("arp request.\n");
--#endif
--	  arpreq.hwtype = htons (1);
--	  arpreq.protocol = htons (IP);
--	  arpreq.hwlen = ETH_ALEN;
--	  arpreq.protolen = 4;
--	  arpreq.opcode = htons (ARP_REQUEST);
--	  grub_memmove (arpreq.shwaddr, arptable[ARP_CLIENT].node,
--			ETH_ALEN);
--	  grub_memmove (arpreq.sipaddr, (char *) &arptable[ARP_CLIENT].ipaddr,
--			sizeof (in_addr));
--	  grub_memset (arpreq.thwaddr, 0, ETH_ALEN);
--	  grub_memmove (arpreq.tipaddr, (char *) &destip, sizeof (in_addr));
--	  
--	  for (retry = 1; retry <= MAX_ARP_RETRIES; retry++)
--	    {
--	      long timeout;
--	      
--	      eth_transmit (broadcast, ARP, sizeof (arpreq), &arpreq);
--	      timeout = rfc2131_sleep_interval (TIMEOUT, retry);
--	      
--	      if (await_reply (AWAIT_ARP, arpentry, arpreq.tipaddr, timeout))
--		goto xmit;
--
--	      if (ip_abort)
--		return 0;
--	    }
--	  
--	  return 0;
--	}
--      
--    xmit:
--      eth_transmit (arptable[arpentry].node, IP, len, buf);
--    }
--  
--  return 1;
--}
--
--/**************************************************************************
--TFTP - Download extended BOOTP data, or kernel image
--**************************************************************************/
--static int
--tftp (const char *name, int (*fnc) (unsigned char *, int, int, int))
--{
--  int retry = 0;
--  static unsigned short iport = 2000;
--  unsigned short oport = 0;
--  unsigned short len, block = 0, prevblock = 0;
--  int bcounter = 0;
--  struct tftp_t *tr;
--  struct tftpreq_t tp;
--  int rc;
--  int packetsize = TFTP_DEFAULTSIZE_PACKET;
--  
--  /* Clear out the Rx queue first.  It contains nothing of interest,
--   * except possibly ARP requests from the DHCP/TFTP server.  We use
--   * polling throughout Etherboot, so some time may have passed since we
--   * last polled the receive queue, which may now be filled with
--   * broadcast packets.  This will cause the reply to the packets we are
--   * about to send to be lost immediately.  Not very clever.  */
--  await_reply (AWAIT_QDRAIN, 0, NULL, 0);
--  
--  tp.opcode = htons (TFTP_RRQ);
--  len = (grub_sprintf ((char *) tp.u.rrq, "%s%coctet%cblksize%c%d",
--		       name, 0, 0, 0, TFTP_MAX_PACKET)
--	 + sizeof (tp.ip) + sizeof (tp.udp) + sizeof (tp.opcode) + 1);
--  if (! udp_transmit (arptable[ARP_SERVER].ipaddr.s_addr, ++iport,
--		      TFTP_PORT, len, &tp))
--    return 0;
--  
--  for (;;)
--    {
--      long timeout;
--      
--#ifdef CONGESTED
--      timeout = rfc2131_sleep_interval (block ? TFTP_REXMT : TIMEOUT, retry);
--#else
--      timeout = rfc2131_sleep_interval (TIMEOUT, retry);
--#endif
--
--      if (! await_reply (AWAIT_TFTP, iport, NULL, timeout))
--	{
--	  if (! block && retry++ < MAX_TFTP_RETRIES)
--	    {
--	      /* Maybe initial request was lost.  */
--	      if (! udp_transmit (arptable[ARP_SERVER].ipaddr.s_addr,
--				  ++iport, TFTP_PORT, len, &tp))
--		return 0;
--	      
--	      continue;
--	    }
--	  
--#ifdef CONGESTED
--	  if (block && ((retry += TFTP_REXMT) < TFTP_TIMEOUT))
--	    {
--	      /* We resend our last ack.  */
--#ifdef MDEBUG
--	      grub_printf ("<REXMT>\n");
--#endif
--	      udp_transmit (arptable[ARP_SERVER].ipaddr.s_addr,
--			    iport, oport,
--			    TFTP_MIN_PACKET, &tp);
--	      continue;
--	    }
--#endif
--	  /* Timeout.  */
--	  break;
--	}
--      
--      tr = (struct tftp_t *) &nic.packet[ETH_HLEN];
--      if (tr->opcode == ntohs (TFTP_ERROR))
--	{
--	  grub_printf ("TFTP error %d (%s)\n",
--		       ntohs (tr->u.err.errcode),
--		       tr->u.err.errmsg);
--	  break;
--	}
--      
--      if (tr->opcode == ntohs (TFTP_OACK))
--	{
--	  char *p = tr->u.oack.data, *e;
--	  
--	  /* Shouldn't happen.  */
--	  if (prevblock)
--	    /* Ignore it.  */
--	    continue;
--	  
--	  len = ntohs (tr->udp.len) - sizeof (struct udphdr) - 2;
--	  if (len > TFTP_MAX_PACKET)
--	    goto noak;
--	  
--	  e = p + len;
--	  while (*p != '\000' && p < e)
--	    {
--	      if (! grub_strcmp ("blksize", p))
--		{
--		  p += 8;
--		  if ((packetsize = getdec (&p)) < TFTP_DEFAULTSIZE_PACKET)
--		    goto noak;
--		  
--		  while (p < e && *p)
--		    p++;
--		  
--		  if (p < e)
--		    p++;
--		}
--	      else
--		{
--		noak:
--		  tp.opcode = htons (TFTP_ERROR);
--		  tp.u.err.errcode = 8;
--		  len = (grub_sprintf ((char *) tp.u.err.errmsg,
--				       "RFC1782 error")
--			 + sizeof (tp.ip) + sizeof (tp.udp)
--			 + sizeof (tp.opcode) + sizeof (tp.u.err.errcode)
--			 + 1);
--		  udp_transmit (arptable[ARP_SERVER].ipaddr.s_addr,
--				iport, ntohs (tr->udp.src),
--				len, &tp);
--		  return 0;
--		}
--	    }
--	  
--	  if (p > e)
--	    goto noak;
--	  
--	  /* This ensures that the packet does not get processed as data!  */
--	  block = tp.u.ack.block = 0; 
--	}
--      else if (tr->opcode == ntohs (TFTP_DATA))
--	{
--	  len = ntohs (tr->udp.len) - sizeof (struct udphdr) - 4;
--	  /* Shouldn't happen.  */
--	  if (len > packetsize)
--	    /* Ignore it.  */
--	    continue;
--	  
--	  block = ntohs (tp.u.ack.block = tr->u.data.block);
--	}
--      else
--	/* Neither TFTP_OACK nor TFTP_DATA.  */
--	break;
--      
--      if ((block || bcounter) && (block != prevblock + 1))
--	/* Block order should be continuous */
--	tp.u.ack.block = htons (block = prevblock);
--      
--      /* Should be continuous.  */
--      tp.opcode = htons (TFTP_ACK);
--      oport = ntohs (tr->udp.src);
--      /* Ack.  */
--      udp_transmit (arptable[ARP_SERVER].ipaddr.s_addr, iport,
--		    oport, TFTP_MIN_PACKET, &tp);
--      
--      if ((unsigned short) (block - prevblock) != 1)
--	/* Retransmission or OACK, don't process via callback
--	 * and don't change the value of prevblock.  */
--	continue;
--      
--      prevblock = block;
--      /* Is it the right place to zero the timer?  */
--      retry = 0;
--      
--      if ((rc = fnc (tr->u.data.download,
--		     ++bcounter, len, len < packetsize)) >= 0)
--	return rc;
--
--      /* End of data.  */
--      if (len < packetsize)           
--	return 1;
--    }
--  
--  return 0;
--}
--
--/**************************************************************************
--RARP - Get my IP address and load information
--**************************************************************************/
--int 
--rarp (void)
--{
--  int retry;
--
--  /* arp and rarp requests share the same packet structure.  */
--  struct arprequest rarpreq;
--
--  /* Make sure that an ethernet is probed.  */
--  if (! eth_probe ())
--    return 0;
--
--  /* Clear the ready flag.  */
--  network_ready = 0;
--  
--  grub_memset (&rarpreq, 0, sizeof (rarpreq));
--
--  rarpreq.hwtype = htons (1);
--  rarpreq.protocol = htons (IP);
--  rarpreq.hwlen = ETH_ALEN;
--  rarpreq.protolen = 4;
--  rarpreq.opcode = htons (RARP_REQUEST);
--  grub_memmove ((char *) &rarpreq.shwaddr, arptable[ARP_CLIENT].node,
--		ETH_ALEN);
--  /* sipaddr is already zeroed out */
--  grub_memmove ((char *) &rarpreq.thwaddr, arptable[ARP_CLIENT].node,
--		ETH_ALEN);
--  /* tipaddr is already zeroed out */
--
--  for (retry = 0; retry < MAX_ARP_RETRIES; ++retry)
--    {
--      long timeout;
--      
--      eth_transmit (broadcast, RARP, sizeof (rarpreq), &rarpreq);
--
--      timeout = rfc2131_sleep_interval (TIMEOUT, retry);
--      if (await_reply (AWAIT_RARP, 0, rarpreq.shwaddr, timeout))
--	break;
--
--      if (ip_abort)
--	return 0;
--    }
--
--  if (retry < MAX_ARP_RETRIES)
--    {
--      network_ready = 1;
--      return 1;
--    }
--
--  return 0;
--}
--
--/**************************************************************************
--BOOTP - Get my IP address and load information
--**************************************************************************/
--int 
--bootp (void)
--{
--  int retry;
--#ifndef	NO_DHCP_SUPPORT
--  int reqretry;
--#endif /* ! NO_DHCP_SUPPORT */
--  struct bootpip_t ip;
--  unsigned long starttime;
--
--  /* Make sure that an ethernet is probed.  */
--  if (! eth_probe ())
--    return 0;
--
--  /* Clear the ready flag.  */
--  network_ready = 0;
--
--#ifdef DEBUG
--  grub_printf ("network is ready.\n");
--#endif
--  
--  grub_memset (&ip, 0, sizeof (struct bootpip_t));
--  ip.bp.bp_op = BOOTP_REQUEST;
--  ip.bp.bp_htype = 1;
--  ip.bp.bp_hlen = ETH_ALEN;
--  starttime = currticks ();
--  /* Use lower 32 bits of node address, more likely to be
--     distinct than the time since booting */
--  grub_memmove (&xid, &arptable[ARP_CLIENT].node[2], sizeof(xid));
--  ip.bp.bp_xid = xid += htonl (starttime);
--  grub_memmove (ip.bp.bp_hwaddr, arptable[ARP_CLIENT].node, ETH_ALEN);
--#ifdef DEBUG
--  etherboot_printf ("bp_op = %d\n", ip.bp.bp_op);
--  etherboot_printf ("bp_htype = %d\n", ip.bp.bp_htype);
--  etherboot_printf ("bp_hlen = %d\n", ip.bp.bp_hlen);
--  etherboot_printf ("bp_xid = %d\n", ip.bp.bp_xid);
--  etherboot_printf ("bp_hwaddr = %!\n", ip.bp.bp_hwaddr);
--  etherboot_printf ("bp_hops = %d\n", (int) ip.bp.bp_hops);
--  etherboot_printf ("bp_secs = %d\n", (int) ip.bp.bp_hwaddr);
--#endif
--  
--#ifdef	NO_DHCP_SUPPORT
--  /* Request RFC-style options.  */
--  grub_memmove (ip.bp.bp_vend, rfc1533_cookie, 5);
--#else
--  /* Request RFC-style options.  */
--  grub_memmove (ip.bp.bp_vend, rfc1533_cookie, sizeof rfc1533_cookie);
--  grub_memmove (ip.bp.bp_vend + sizeof rfc1533_cookie, dhcpdiscover,
--		sizeof dhcpdiscover);
--  grub_memmove (ip.bp.bp_vend + sizeof rfc1533_cookie + sizeof dhcpdiscover,
--		rfc1533_end, sizeof rfc1533_end);
--#endif /* ! NO_DHCP_SUPPORT */
--
--  for (retry = 0; retry < MAX_BOOTP_RETRIES;)
--    {
--      long timeout;
--
--#ifdef DEBUG
--      grub_printf ("retry = %d\n", retry);
--#endif
--      
--      /* Clear out the Rx queue first.  It contains nothing of
--       * interest, except possibly ARP requests from the DHCP/TFTP
--       * server.  We use polling throughout Etherboot, so some time
--       * may have passed since we last polled the receive queue,
--       * which may now be filled with broadcast packets.  This will
--       * cause the reply to the packets we are about to send to be
--       * lost immediately.  Not very clever.  */
--      await_reply (AWAIT_QDRAIN, 0, NULL, 0);
--
--      udp_transmit (IP_BROADCAST, BOOTP_CLIENT, BOOTP_SERVER,
--		    sizeof (struct bootpip_t), &ip);
--      timeout = rfc2131_sleep_interval (TIMEOUT, retry++);
--#ifdef NO_DHCP_SUPPORT
--      if (await_reply (AWAIT_BOOTP, 0, NULL, timeout))
--	{
--	  network_ready = 1;
--	  return 1;
--	}
--#else /* ! NO_DHCP_SUPPORT */
--      if (await_reply (AWAIT_BOOTP, 0, NULL, timeout))
--	{
--	  if (dhcp_reply != DHCPOFFER)
--	    {
--	      network_ready = 1;
--	      return 1;
--	    }
--
--	  dhcp_reply = 0;
--#ifdef DEBUG
--  etherboot_printf ("bp_op = %d\n", (int) ip.bp.bp_op);
--  etherboot_printf ("bp_htype = %d\n", (int) ip.bp.bp_htype);
--  etherboot_printf ("bp_hlen = %d\n", (int) ip.bp.bp_hlen);
--  etherboot_printf ("bp_xid = %d\n", (int) ip.bp.bp_xid);
--  etherboot_printf ("bp_hwaddr = %!\n", ip.bp.bp_hwaddr);
--  etherboot_printf ("bp_hops = %d\n", (int) ip.bp.bp_hops);
--  etherboot_printf ("bp_secs = %d\n", (int) ip.bp.bp_hwaddr);
--#endif
--	  grub_memmove (ip.bp.bp_vend, rfc1533_cookie, sizeof rfc1533_cookie);
--	  grub_memmove (ip.bp.bp_vend + sizeof rfc1533_cookie,
--			dhcprequest, sizeof dhcprequest);
--	  grub_memmove (ip.bp.bp_vend + sizeof rfc1533_cookie
--			+ sizeof dhcprequest,
--			rfc1533_end, sizeof rfc1533_end);
--	  grub_memmove (ip.bp.bp_vend + 9, (char *) &dhcp_server,
--			sizeof (in_addr));
--	  grub_memmove (ip.bp.bp_vend + 15, (char *) &dhcp_addr,
--			sizeof (in_addr));
--#ifdef DEBUG
--	  grub_printf ("errnum = %d\n", errnum);
--#endif
--	  for (reqretry = 0; reqretry < MAX_BOOTP_RETRIES;)
--	    {
--	      int ret;
--#ifdef DEBUG
--	      grub_printf ("reqretry = %d\n", reqretry);
--#endif
--	      
--	      ret = udp_transmit (IP_BROADCAST, BOOTP_CLIENT, BOOTP_SERVER,
--				  sizeof (struct bootpip_t), &ip);
--	      if (! ret)
--		grub_printf ("udp_transmit failed.\n");
--	      
--	      dhcp_reply = 0;
--	      timeout = rfc2131_sleep_interval (TIMEOUT, reqretry++);
--	      if (await_reply (AWAIT_BOOTP, 0, NULL, timeout))
--		if (dhcp_reply == DHCPACK)
--		  {
--		    network_ready = 1;
--		    return 1;
--		  }
--
--#ifdef DEBUG
--	      grub_printf ("dhcp_reply = %d\n", dhcp_reply);
--#endif
--	      
--	      if (ip_abort)
--		return 0;
--	    }
--	}
--#endif /* ! NO_DHCP_SUPPORT */
--      
--      if (ip_abort)
--	return 0;
--      
--      ip.bp.bp_secs = htons ((currticks () - starttime) / TICKS_PER_SEC);
--    }
--
--  /* Timeout.  */
--  return 0;
--}
--
--/**************************************************************************
--UDPCHKSUM - Checksum UDP Packet (one of the rare cases when assembly is
--            actually simpler...)
-- RETURNS: checksum, 0 on checksum error. This
--          allows for using the same routine for RX and TX summing:
--          RX  if (packet->udp.chksum && udpchksum(packet))
--                  error("checksum error");
--          TX  packet->udp.chksum=0;
--              if (0==(packet->udp.chksum=udpchksum(packet)))
--                  packet->upd.chksum=0xffff;
--**************************************************************************/
--static inline void
--dosum (unsigned short *start, unsigned int len, unsigned short *sum)
--{
--  __asm__ __volatile__
--    ("clc\n"
--     "1:\tlodsw\n\t"
--     "xchg %%al,%%ah\n\t"	/* convert to host byte order */
--     "adcw %%ax,%0\n\t"		/* add carry of previous iteration */
--     "loop 1b\n\t"
--     "adcw $0,%0"		/* add carry of last iteration */
--     : "=b" (*sum), "=S"(start), "=c"(len)
--     : "0"(*sum), "1"(start), "2"(len)
--     : "ax", "cc"
--     );
--}
--
--/* UDP sum:
-- * proto, src_ip, dst_ip, udp_dport, udp_sport, 2*udp_len, payload
-- */
--static unsigned short
--udpchksum (struct iphdr *packet)
--{
--  int len = ntohs (packet->len);
--  unsigned short rval;
--  
--  /* add udplength + protocol number */
--  rval = (len - sizeof (struct iphdr)) + IP_UDP;
--  
--  /* pad to an even number of bytes */
--  if (len % 2) {
--    ((char *) packet)[len++] = 0;
--  }
--  
--  /* sum over src/dst ipaddr + udp packet */
--  len -= (char *) &packet->src - (char *) packet;
--  dosum ((unsigned short *) &packet->src, len >> 1, &rval);
--  
--  /* take one's complement */
--  return ~rval;
--}
--
--/**************************************************************************
--AWAIT_REPLY - Wait until we get a response for our request
--**************************************************************************/
--int 
--await_reply (int type, int ival, void *ptr, int timeout)
--{
--  unsigned long time;
--  struct iphdr *ip;
--  struct udphdr *udp;
--  struct arprequest *arpreply;
--  struct bootp_t *bootpreply;
--  unsigned short ptype;
--  unsigned int protohdrlen = (ETH_HLEN + sizeof (struct iphdr)
--			      + sizeof (struct udphdr));
--
--  /* Clear the abort flag.  */
--  ip_abort = 0;
--  
--  time = timeout + currticks ();
--  /* The timeout check is done below.  The timeout is only checked if
--   * there is no packet in the Rx queue.  This assumes that eth_poll()
--   * needs a negligible amount of time.  */
--  for (;;)
--    {
--      if (eth_poll ())
--	{
--	  /* We have something!  */
--	  
--	  /* Check for ARP - No IP hdr.  */
--	  if (nic.packetlen >= ETH_HLEN)
--	    {
--	      ptype = (((unsigned short) nic.packet[12]) << 8
--		       | ((unsigned short) nic.packet[13]));
--	    }
--	  else
--	    /* What else could we do with it?  */
--	    continue;
--	  
--	  if (nic.packetlen >= ETH_HLEN + sizeof (struct arprequest)
--	      && ptype == ARP)
--	    {
--	      unsigned long tmp;
--
--	      arpreply = (struct arprequest *) &nic.packet[ETH_HLEN];
--	      
--	      if (arpreply->opcode == htons (ARP_REPLY)
--		  && ! grub_memcmp (arpreply->sipaddr, ptr, sizeof (in_addr))
--		  && type == AWAIT_ARP)
--		{
--		  grub_memmove ((char *) arptable[ival].node,
--				arpreply->shwaddr,
--				ETH_ALEN);
--		  return 1;
--		}
--	      
--	      grub_memmove ((char *) &tmp, arpreply->tipaddr,
--			    sizeof (in_addr));
--	      
--	      if (arpreply->opcode == htons (ARP_REQUEST)
--		  && tmp == arptable[ARP_CLIENT].ipaddr.s_addr)
--		{
--		  arpreply->opcode = htons (ARP_REPLY);
--		  grub_memmove (arpreply->tipaddr, arpreply->sipaddr,
--				sizeof (in_addr));
--		  grub_memmove (arpreply->thwaddr, (char *) arpreply->shwaddr,
--				ETH_ALEN);
--		  grub_memmove (arpreply->sipaddr,
--				(char *) &arptable[ARP_CLIENT].ipaddr,
--				sizeof (in_addr));
--		  grub_memmove (arpreply->shwaddr,
--				arptable[ARP_CLIENT].node,
--				ETH_ALEN);
--		  eth_transmit (arpreply->thwaddr, ARP,
--				sizeof (struct arprequest),
--				arpreply);
--#ifdef MDEBUG
--		  grub_memmove (&tmp, arpreply->tipaddr, sizeof (in_addr));
--		  etherboot_printf ("Sent ARP reply to: %@\n", tmp);
--#endif	/* MDEBUG */
--		}
--	      
--	      continue;
--	    }
--
--	  if (type == AWAIT_QDRAIN)
--	    continue;
--	  
--	  /* Check for RARP - No IP hdr.  */
--	  if (type == AWAIT_RARP
--	      && nic.packetlen >= ETH_HLEN + sizeof (struct arprequest)
--	      && ptype == RARP)
--	    {
--	      arpreply = (struct arprequest *) &nic.packet[ETH_HLEN];
--	      
--	      if (arpreply->opcode == htons (RARP_REPLY)
--		  && ! grub_memcmp (arpreply->thwaddr, ptr, ETH_ALEN))
--		{
--		  grub_memmove ((char *) arptable[ARP_SERVER].node,
--				arpreply->shwaddr, ETH_ALEN);
--		  grub_memmove ((char *) &arptable[ARP_SERVER].ipaddr,
--				arpreply->sipaddr, sizeof (in_addr));
--		  grub_memmove ((char *) &arptable[ARP_CLIENT].ipaddr,
--				arpreply->tipaddr, sizeof (in_addr));
--		  return 1;
--		}
--	      
--	      continue;
--	    }
--
--	  /* Anything else has IP header.  */
--	  if (nic.packetlen < protohdrlen || ptype != IP)
--	    continue;
--	  
--	  ip = (struct iphdr *) &nic.packet[ETH_HLEN];
--	  if (ip->verhdrlen != 0x45
--	      || ipchksum ((unsigned short *) ip, sizeof (struct iphdr))
--	      || ip->protocol != IP_UDP)
--	    continue;
--	  
--	  /*
--	    - Till Straumann <Till.Straumann@TU-Berlin.de>
--	    added udp checksum (safer on a wireless link)
--	    added fragmentation check: I had a corrupted image
--	    in memory due to fragmented TFTP packets - took me
--	    3 days to find the cause for this :-(
--	  */
--	  
--	  /* If More Fragments bit and Fragment Offset field
--	     are non-zero then packet is fragmented */
--	  if (ip->frags & htons(0x3FFF))
--	    {
--	      grub_printf ("ALERT: got a fragmented packet - reconfigure your server\n");
--	      continue;
--	    }
--	  
--	  udp = (struct udphdr *) &nic.packet[(ETH_HLEN
--					       + sizeof (struct iphdr))];
--	  if (udp->chksum && udpchksum (ip))
--	    {
--	      grub_printf ("UDP checksum error\n");
--	      continue;
--	    }
--	  
--	  /* BOOTP ?  */
--	  bootpreply = (struct bootp_t *)
--	    &nic.packet[(ETH_HLEN + sizeof (struct iphdr)
--			 + sizeof (struct udphdr))];
--	  if (type == AWAIT_BOOTP
--#ifdef NO_DHCP_SUPPORT
--	      && (nic.packetlen
--		  >= (ETH_HLEN + sizeof (struct bootp_t) - BOOTP_VENDOR_LEN))
--#else
--	      && (nic.packetlen
--		  >= (ETH_HLEN + sizeof (struct bootp_t) - DHCP_OPT_LEN))
--#endif /* ! NO_DHCP_SUPPORT */
--	      && udp->dest == htons (BOOTP_CLIENT)
--	      && bootpreply->bp_op == BOOTP_REPLY
--	      && bootpreply->bp_xid == xid
--	      && (! grub_memcmp (broadcast, bootpreply->bp_hwaddr, ETH_ALEN)
--		  || ! grub_memcmp (arptable[ARP_CLIENT].node,
--				    bootpreply->bp_hwaddr, ETH_ALEN)))
--	    {
--#ifdef DEBUG
--	      grub_printf ("BOOTP packet was received.\n");
--#endif
--	      arptable[ARP_CLIENT].ipaddr.s_addr
--		= bootpreply->bp_yiaddr.s_addr;
--#ifndef	NO_DHCP_SUPPORT
--	      dhcp_addr.s_addr = bootpreply->bp_yiaddr.s_addr;
--#ifdef DEBUG
--	      etherboot_printf ("dhcp_addr = %@\n", dhcp_addr.s_addr);
--#endif
--#endif /* ! NO_DHCP_SUPPORT */
--	      netmask = default_netmask ();
--	      arptable[ARP_SERVER].ipaddr.s_addr
--		= bootpreply->bp_siaddr.s_addr;
--	      /* Kill arp.  */
--	      grub_memset (arptable[ARP_SERVER].node, 0, ETH_ALEN);
--	      arptable[ARP_GATEWAY].ipaddr.s_addr
--		= bootpreply->bp_giaddr.s_addr;
--	      /* Kill arp.  */
--	      grub_memset (arptable[ARP_GATEWAY].node, 0, ETH_ALEN);
--
--	      grub_memmove ((char *) BOOTP_DATA_ADDR, (char *) bootpreply,
--			    sizeof (struct bootpd_t));
--#ifdef NO_DHCP_SUPPORT
--	      decode_rfc1533 (BOOTP_DATA_ADDR->bootp_reply.bp_vend,
--			      0, BOOTP_VENDOR_LEN + MAX_BOOTP_EXTLEN, 1);
--#else
--	      decode_rfc1533 (BOOTP_DATA_ADDR->bootp_reply.bp_vend,
--			      0, DHCP_OPT_LEN + MAX_BOOTP_EXTLEN, 1);
--#endif /* ! NO_DHCP_SUPPORT */
--	      
--	      return 1;
--	    }
--	  
--	  /* TFTP ? */
--	  if (type == AWAIT_TFTP && ntohs (udp->dest) == ival)
--	    return 1;
--	}
--      else
--	{
--	  /* Check for abort key only if the Rx queue is empty -
--	   * as long as we have something to process, don't
--	   * assume that something failed.  It is unlikely that
--	   * we have no processing time left between packets.  */
--	  if (checkkey () != -1 && ASCII_CHAR (getkey ()) == CTRL_C)
--	    {
--	      ip_abort = 1;
--	      return 0;
--	    }
--	  
--	  /* Do the timeout after at least a full queue walk.  */
--	  if ((timeout == 0) || (currticks() > time))
--	    {
--	      break;
--	    }
--	}
--    }
--  
--  return 0;
--}
--
--/**************************************************************************
--DECODE_RFC1533 - Decodes RFC1533 header
--**************************************************************************/
--int
--decode_rfc1533 (unsigned char *p, int block, int len, int eof)
--{
--  static unsigned char *extdata = NULL, *extend = NULL;
--  unsigned char *extpath = NULL;
--  unsigned char *endp;
--  
--  if (block == 0)
--    {
--      end_of_rfc1533 = NULL;
--      vendorext_isvalid = 0;
--      
--      if (grub_memcmp (p, rfc1533_cookie, 4))
--	/* no RFC 1533 header found */
--	return 0;
--      
--      p += 4;
--      endp = p + len;
--    }
--  else
--    {
--      if (block == 1)
--	{
--	  if (grub_memcmp (p, rfc1533_cookie, 4))
--	    /* no RFC 1533 header found */
--	    return 0;
--	  
--	  p += 4;
--	  len -= 4;
--	}
--      
--      if (extend + len
--	  <= ((unsigned char *)
--	      &(BOOTP_DATA_ADDR->bootp_extension[MAX_BOOTP_EXTLEN])))
--	{
--	  grub_memmove (extend, p, len);
--	  extend += len;
--	}
--      else
--	{
--	  grub_printf ("Overflow in vendor data buffer! Aborting...\n");
--	  *extdata = RFC1533_END;
--	  return 0;
--	}
--      
--      p = extdata;
--      endp = extend;
--    }
--
--  if (! eof)
--    return -1;
--  
--  while (p < endp)
--    {
--      unsigned char c = *p;
--      
--      if (c == RFC1533_PAD)
--	{
--	  p++;
--	  continue;
--	}
--      else if (c == RFC1533_END)
--	{
--	  end_of_rfc1533 = endp = p;
--	  continue;
--	}
--      else if (c == RFC1533_NETMASK)
--	{
--	  grub_memmove ((char *) &netmask, p + 2, sizeof (in_addr));
--	}
--      else if (c == RFC1533_GATEWAY)
--	{
--	  /* This is a little simplistic, but it will
--	     usually be sufficient.
--	     Take only the first entry.  */
--	  if (TAG_LEN (p) >= sizeof (in_addr))
--	    grub_memmove ((char *) &arptable[ARP_GATEWAY].ipaddr, p + 2,
--			  sizeof (in_addr));
--	}
--      else if (c == RFC1533_EXTENSIONPATH)
--	extpath = p;
--#ifndef	NO_DHCP_SUPPORT
--      else if (c == RFC2132_MSG_TYPE)
--	{
--	  dhcp_reply = *(p + 2);
--	}
--      else if (c == RFC2132_SRV_ID)
--	{
--	  grub_memmove ((char *) &dhcp_server, p + 2, sizeof (in_addr));
--#ifdef DEBUG
--	  etherboot_printf ("dhcp_server = %@\n", dhcp_server.s_addr);
--#endif
--	}
--#endif /* ! NO_DHCP_SUPPORT */
--      else if (c == RFC1533_VENDOR_MAGIC
--	       && TAG_LEN(p) >= 6
--	       && ! grub_memcmp (p + 2, vendorext_magic, 4)
--	       && p[6] == RFC1533_VENDOR_MAJOR)
--	vendorext_isvalid++;
--      /* GRUB now handles its own tag. Get the name of a configuration
--	 file from the network. Cool...  */
--      else if (c == RFC1533_VENDOR_CONFIGFILE)
--	{
--	  int l = TAG_LEN (p);
--	  
--	  /* Eliminate the trailing NULs according to RFC 2132.  */
--	  while (*(p + 2 + l - 1) == '\000' && l > 0)
--	    l--;
--	  
--	  /* XXX: Should check if LEN is less than the maximum length
--	     of CONFIG_FILE. This kind of robustness will be a goal
--	     in GRUB 1.0.  */
--	  grub_memmove (config_file, p + 2, l);
--	  config_file[l] = 0;
--	}
--      
--      p += TAG_LEN (p) + 2;
--    }
--  
--  extdata = extend = endp;
--  
--  /* Perhaps we can eliminate this because we doesn't require so
--     much information, but I leave this alone.  */
--  if (block == 0 && extpath != NULL)
--    {
--      char fname[64];
--      int fnamelen = TAG_LEN (extpath);
--      
--      while (*(extpath + 2 + fnamelen - 1) == '\000' && fnamelen > 0)
--	fnamelen--;
--      
--      if (fnamelen + 1 > sizeof (fname))
--	{
--	  grub_printf ("Too long file name for Extensions Path\n");
--	  return 0;
--	}
--      else if (! fnamelen)
--	{
--	  grub_printf ("Empty file name for Extensions Path\n");
--	  return 0;
--	}
--      
--      grub_memmove (fname, extpath + 2, fnamelen);
--      fname[fnamelen] = '\000';
--      grub_printf ("Loading BOOTP-extension file: %s\n", fname);
--      tftp (fname, decode_rfc1533);
--    }
--  
--  /* Proceed with next block.  */
--  return -1;
--}
--
--/**************************************************************************
--IPCHKSUM - Checksum IP Header
--**************************************************************************/
--static unsigned short 
--ipchksum (unsigned short *ip, int len)
--{
--  unsigned long sum = 0;
--  len >>= 1;
--  while (len--)
--    {
--      sum += *(ip++);
--      if (sum > 0xFFFF)
--	sum -= 0xFFFF;
--    }
--  return (~sum) & 0x0000FFFF;
--}
--
--#define TWO_SECOND_DIVISOR (2147483647l/TICKS_PER_SEC)
--
--/**************************************************************************
--RFC2131_SLEEP_INTERVAL - sleep for expotentially longer times
--**************************************************************************/
--long
--rfc2131_sleep_interval (int base, int exp)
--{
--  static long seed = 0;
--  long q;
--  unsigned long tmo;
--  
--#ifdef BACKOFF_LIMIT
--  if (exp > BACKOFF_LIMIT)
--    exp = BACKOFF_LIMIT;
--#endif
--  if (!seed)
--    /* Initialize linear congruential generator */
--    seed = (currticks () + *((long *) &arptable[ARP_CLIENT].node)
--	    + ((short *) arptable[ARP_CLIENT].node)[2]);
--  /* simplified version of the LCG given in Bruce Schneier's
--     "Applied Cryptography" */
--  q = seed / 53668;
--  if ((seed = 40014 * (seed - 53668 * q) - 12211 *q ) < 0)
--    seed += 2147483563L;
--  tmo = (base << exp) + (TICKS_PER_SEC - (seed / TWO_SECOND_DIVISOR));
--  return tmo;
--}
--
--/**************************************************************************
--CLEANUP - shut down networking
--**************************************************************************/
--void
--cleanup_net (void)
--{
--  if (network_ready)
--    {
--      /* Stop receiving packets.  */
--      eth_disable ();
--      network_ready = 0;
--    }
--}
-diff -Naur grub-0.97.orig/netboot/mii.h grub-0.97/netboot/mii.h
---- grub-0.97.orig/netboot/mii.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/mii.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/mii.h
+===================================================================
+--- /dev/null
++++ b/netboot/mii.h
 @@ -0,0 +1,105 @@
 +/*
 + * linux/mii.h: definitions for MII-compatible transceivers
@@ -21621,9 +20496,10 @@ diff -Naur grub-0.97.orig/netboot/mii.h grub-0.97/netboot/mii.h
 +#define NWAYTEST_LOOPBACK       0x0100  /* Enable loopback for N-way   */
 +#define NWAYTEST_RESV2          0xfe00  /* Unused...                   */
 +
-diff -Naur grub-0.97.orig/netboot/misc.c grub-0.97/netboot/misc.c
---- grub-0.97.orig/netboot/misc.c	2003-07-09 11:45:37.000000000 +0000
-+++ grub-0.97/netboot/misc.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/misc.c
+===================================================================
+--- a/netboot/misc.c
++++ b/netboot/misc.c
 @@ -19,37 +19,90 @@
  
  /* Based on "src/misc.c" in etherboot-5.0.5.  */
@@ -21743,9 +20619,10 @@ diff -Naur grub-0.97.orig/netboot/misc.c grub-0.97/netboot/misc.c
  }
 +
 +
-diff -Naur grub-0.97.orig/netboot/natsemi.c grub-0.97/netboot/natsemi.c
---- grub-0.97.orig/netboot/natsemi.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/natsemi.c	2005-08-31 19:53:07.000000000 +0000
+Index: b/netboot/natsemi.c
+===================================================================
+--- a/netboot/natsemi.c
++++ b/netboot/natsemi.c
 @@ -47,15 +47,15 @@
  /* Revision History */
  
@@ -21966,7 +20843,7 @@ diff -Naur grub-0.97.orig/netboot/natsemi.c grub-0.97/netboot/natsemi.c
  {
 -    u32 status, to, nstype;
 +    u32 to, nstype;
-     u32 tx_status;
+     volatile u32 tx_status;
      
      /* Stop the transmitter */
      outl(TxOff, ioaddr + ChipCmd);
@@ -21990,8 +20867,8 @@ diff -Naur grub-0.97.orig/netboot/natsemi.c grub-0.97/netboot/natsemi.c
  
      to = currticks() + TX_TIMEOUT;
  
--    while ((((volatile u32) tx_status=txd.cmdsts) & OWN) && (currticks() < to))
-+    while ((volatile u32) ( tx_status=txd.cmdsts & OWN) && (currticks() < to))
+-    while (((tx_status=txd.cmdsts) & OWN) && (currticks() < to))
++    while (((tx_status=txd.cmdsts & OWN) && (currticks() < to))
          /* wait */ ;
  
      if (currticks() >= to) {
@@ -22076,9 +20953,10 @@ diff -Naur grub-0.97.orig/netboot/natsemi.c grub-0.97/netboot/natsemi.c
 +	.id_count = sizeof(natsemi_nics)/sizeof(natsemi_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/nfs.h grub-0.97/netboot/nfs.h
---- grub-0.97.orig/netboot/nfs.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/nfs.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/nfs.h
+===================================================================
+--- /dev/null
++++ b/netboot/nfs.h
 @@ -0,0 +1,63 @@
 +#ifndef	_NFS_H
 +#define	_NFS_H
@@ -22143,9 +21021,10 @@ diff -Naur grub-0.97.orig/netboot/nfs.h grub-0.97/netboot/nfs.h
 +};
 +
 +#endif	/* _NFS_H */
-diff -Naur grub-0.97.orig/netboot/ni5010.c grub-0.97/netboot/ni5010.c
---- grub-0.97.orig/netboot/ni5010.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/ni5010.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/ni5010.c
+===================================================================
+--- a/netboot/ni5010.c
++++ /dev/null
 @@ -1,371 +0,0 @@
 -/**************************************************************************
 -Etherboot -  BOOTP/TFTP Bootstrap Program
@@ -22518,9 +21397,10 @@ diff -Naur grub-0.97.orig/netboot/ni5010.c grub-0.97/netboot/ni5010.c
 -	nic->disable = ni5010_disable;
 -	return (nic);
 -}
-diff -Naur grub-0.97.orig/netboot/nic.c grub-0.97/netboot/nic.c
---- grub-0.97.orig/netboot/nic.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/nic.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/nic.c
+===================================================================
+--- /dev/null
++++ b/netboot/nic.c
 @@ -0,0 +1,1198 @@
 +/**************************************************************************
 +Etherboot -  Network Bootstrap Program
@@ -23720,9 +22600,10 @@ diff -Naur grub-0.97.orig/netboot/nic.c grub-0.97/netboot/nic.c
 +		network_ready = 0;
 +	}
 +}
-diff -Naur grub-0.97.orig/netboot/nic.h grub-0.97/netboot/nic.h
---- grub-0.97.orig/netboot/nic.h	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/nic.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/nic.h
+===================================================================
+--- a/netboot/nic.h
++++ b/netboot/nic.h
 @@ -8,24 +8,38 @@
  #ifndef	NIC_H
  #define NIC_H
@@ -23767,9 +22648,10 @@ diff -Naur grub-0.97.orig/netboot/nic.h grub-0.97/netboot/nic.h
 +extern void eth_disable(void);
 +extern void eth_irq(irq_action_t action);
  #endif	/* NIC_H */
-diff -Naur grub-0.97.orig/netboot/ns83820.c grub-0.97/netboot/ns83820.c
---- grub-0.97.orig/netboot/ns83820.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/ns83820.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/ns83820.c
+===================================================================
+--- /dev/null
++++ b/netboot/ns83820.c
 @@ -0,0 +1,1020 @@
 +/**************************************************************************
 +*    ns83820.c: Etherboot device driver for the National Semiconductor 83820
@@ -24791,9 +23673,10 @@ diff -Naur grub-0.97.orig/netboot/ns83820.c grub-0.97/netboot/ns83820.c
 +	.id_count = sizeof(ns83820_nics) / sizeof(ns83820_nics[0]),
 +	.class = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/ns8390.c grub-0.97/netboot/ns8390.c
---- grub-0.97.orig/netboot/ns8390.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/ns8390.c	2005-08-31 21:13:41.000000000 +0000
+Index: b/netboot/ns8390.c
+===================================================================
+--- a/netboot/ns8390.c
++++ b/netboot/ns8390.c
 @@ -13,11 +13,15 @@
    the proper functioning of this software, nor do the authors assume any
    responsibility for damages incurred with its use.
@@ -25409,9 +24292,10 @@ diff -Naur grub-0.97.orig/netboot/ns8390.c grub-0.97/netboot/ns8390.c
  /*
   * Local variables:
   *  c-basic-offset: 8
-diff -Naur grub-0.97.orig/netboot/osdep.h grub-0.97/netboot/osdep.h
---- grub-0.97.orig/netboot/osdep.h	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/osdep.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/osdep.h
+===================================================================
+--- a/netboot/osdep.h
++++ b/netboot/osdep.h
 @@ -1,94 +1,18 @@
 -#ifndef	__OSDEP_H__
 -#define __OSDEP_H__
@@ -25516,9 +24400,10 @@ diff -Naur grub-0.97.orig/netboot/osdep.h grub-0.97/netboot/osdep.h
 - *  c-basic-offset: 8
 - * End:
 - */
-diff -Naur grub-0.97.orig/netboot/otulip.c grub-0.97/netboot/otulip.c
---- grub-0.97.orig/netboot/otulip.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/otulip.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/otulip.c
+===================================================================
+--- a/netboot/otulip.c
++++ /dev/null
 @@ -1,374 +0,0 @@
 -/*
 -  Etherboot DEC Tulip driver
@@ -25894,9 +24779,10 @@ diff -Naur grub-0.97.orig/netboot/otulip.c grub-0.97/netboot/otulip.c
 -	nic->disable = tulip_disable;
 -        return nic;
 -}
-diff -Naur grub-0.97.orig/netboot/otulip.h grub-0.97/netboot/otulip.h
---- grub-0.97.orig/netboot/otulip.h	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/otulip.h	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/otulip.h
+===================================================================
+--- a/netboot/otulip.h
++++ /dev/null
 @@ -1,76 +0,0 @@
 -/* mostly stolen from FreeBSD if_de.c, if_devar.h */
 -
@@ -25974,9 +24860,10 @@ diff -Naur grub-0.97.orig/netboot/otulip.h grub-0.97/netboot/otulip.h
 -	unsigned char	*buf1addr;	/* buffer 1 address */
 -	unsigned char	*buf2addr;	/* buffer 2 address */
 -};
-diff -Naur grub-0.97.orig/netboot/pci.c grub-0.97/netboot/pci.c
---- grub-0.97.orig/netboot/pci.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/pci.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/pci.c
+===================================================================
+--- a/netboot/pci.c
++++ b/netboot/pci.c
 @@ -1,15 +1,3 @@
 -/*
 -** Support for NE2000 PCI clones added David Monro June 1997
@@ -26914,9 +25801,10 @@ diff -Naur grub-0.97.orig/netboot/pci.c grub-0.97/netboot/pci.c
 +	return 0;
 +}
 +
-diff -Naur grub-0.97.orig/netboot/pci.h grub-0.97/netboot/pci.h
---- grub-0.97.orig/netboot/pci.h	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/pci.h	2005-08-31 21:31:46.000000000 +0000
+Index: b/netboot/pci.h
+===================================================================
+--- a/netboot/pci.h
++++ b/netboot/pci.h
 @@ -1,4 +1,4 @@
 -#ifndef	PCI_H
 +#if !defined(PCI_H) && defined(CONFIG_PCI)
@@ -27334,9 +26222,10 @@ diff -Naur grub-0.97.orig/netboot/pci.h grub-0.97/netboot/pci.h
 -extern int pcibios_write_config_dword(unsigned int bus, unsigned int device_fn, unsigned int where, unsigned int value);
 -void adjust_pci_device(struct pci_device *p);
  #endif	/* PCI_H */
-diff -Naur grub-0.97.orig/netboot/pci_ids.h grub-0.97/netboot/pci_ids.h
---- grub-0.97.orig/netboot/pci_ids.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/pci_ids.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/pci_ids.h
+===================================================================
+--- /dev/null
++++ b/netboot/pci_ids.h
 @@ -0,0 +1,1809 @@
 +/*
 + *	PCI Class, Vendor and Device IDs
@@ -29147,9 +28036,10 @@ diff -Naur grub-0.97.orig/netboot/pci_ids.h grub-0.97/netboot/pci_ids.h
 +#define PCI_DEVICE_ID_ARK_STINGARK	0xa099
 +#define PCI_DEVICE_ID_ARK_2000MT	0xa0a1
 +
-diff -Naur grub-0.97.orig/netboot/pci_io.c grub-0.97/netboot/pci_io.c
---- grub-0.97.orig/netboot/pci_io.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/pci_io.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/pci_io.c
+===================================================================
+--- /dev/null
++++ b/netboot/pci_io.c
 @@ -0,0 +1,431 @@
 +/*
 +** Support for NE2000 PCI clones added David Monro June 1997
@@ -29582,9 +28472,10 @@ diff -Naur grub-0.97.orig/netboot/pci_io.c grub-0.97/netboot/pci_io.c
 +	LeaveFunction("find_pci");
 +	return scan_pci_bus(type, dev);
 +}
-diff -Naur grub-0.97.orig/netboot/pcnet32.c grub-0.97/netboot/pcnet32.c
---- grub-0.97.orig/netboot/pcnet32.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/pcnet32.c	2005-08-31 22:57:50.000000000 +0000
+Index: b/netboot/pcnet32.c
+===================================================================
+--- /dev/null
++++ b/netboot/pcnet32.c
 @@ -0,0 +1,1004 @@
 +/**************************************************************************
 +*
@@ -30590,9 +29481,10 @@ diff -Naur grub-0.97.orig/netboot/pcnet32.c grub-0.97/netboot/pcnet32.c
 +	.id_count = sizeof(pcnet32_nics) / sizeof(pcnet32_nics[0]),
 +	.class = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/pic8259.c grub-0.97/netboot/pic8259.c
---- grub-0.97.orig/netboot/pic8259.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/pic8259.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/pic8259.c
+===================================================================
+--- /dev/null
++++ b/netboot/pic8259.c
 @@ -0,0 +1,267 @@
 +/*
 + * Basic support for controlling the 8259 Programmable Interrupt Controllers.
@@ -30861,9 +29753,10 @@ diff -Naur grub-0.97.orig/netboot/pic8259.c grub-0.97/netboot/pic8259.c
 +	}
 +}
 +#endif
-diff -Naur grub-0.97.orig/netboot/pic8259.h grub-0.97/netboot/pic8259.h
---- grub-0.97.orig/netboot/pic8259.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/pic8259.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/pic8259.h
+===================================================================
+--- /dev/null
++++ b/netboot/pic8259.h
 @@ -0,0 +1,99 @@
 +/*
 + * Basic support for controlling the 8259 Programmable Interrupt Controllers.
@@ -30964,9 +29857,10 @@ diff -Naur grub-0.97.orig/netboot/pic8259.h grub-0.97/netboot/pic8259.h
 +#endif
 +
 +#endif /* PIC8259_H */
-diff -Naur grub-0.97.orig/netboot/pnic.c grub-0.97/netboot/pnic.c
---- grub-0.97.orig/netboot/pnic.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/pnic.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/pnic.c
+===================================================================
+--- /dev/null
++++ b/netboot/pnic.c
 @@ -0,0 +1,267 @@
 +/**************************************************************************
 +Etherboot -  BOOTP/TFTP Bootstrap Program
@@ -31235,9 +30129,10 @@ diff -Naur grub-0.97.orig/netboot/pnic.c grub-0.97/netboot/pnic.c
 +	.id_count = sizeof(pnic_nics)/sizeof(pnic_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/pnic_api.h grub-0.97/netboot/pnic_api.h
---- grub-0.97.orig/netboot/pnic_api.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/pnic_api.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/pnic_api.h
+===================================================================
+--- /dev/null
++++ b/netboot/pnic_api.h
 @@ -0,0 +1,59 @@
 +/*
 + * Constants etc. for the Bochs/Etherboot pseudo-NIC
@@ -31298,9 +30193,10 @@ diff -Naur grub-0.97.orig/netboot/pnic_api.h grub-0.97/netboot/pnic_api.h
 + */
 +
 +#define PNIC_API_VERSION	0x0101		/* 1.1 */
-diff -Naur grub-0.97.orig/netboot/pxe.h grub-0.97/netboot/pxe.h
---- grub-0.97.orig/netboot/pxe.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/pxe.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/pxe.h
+===================================================================
+--- /dev/null
++++ b/netboot/pxe.h
 @@ -0,0 +1,521 @@
 +/*
 + * Copyright (c) 2000 Alfred Perlstein <alfred@freebsd.org>
@@ -31823,9 +30719,10 @@ diff -Naur grub-0.97.orig/netboot/pxe.h grub-0.97/netboot/pxe.h
 +typedef struct {
 +	PXENV_STATUS_t	Status;
 +} PACKED t_PXENV_STOP_BASE;
-diff -Naur grub-0.97.orig/netboot/r8169.c grub-0.97/netboot/r8169.c
---- grub-0.97.orig/netboot/r8169.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/r8169.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/r8169.c
+===================================================================
+--- /dev/null
++++ b/netboot/r8169.c
 @@ -0,0 +1,854 @@
 +/**************************************************************************
 +*    r8169.c: Etherboot device driver for the RealTek RTL-8169 Gigabit
@@ -32681,9 +31578,10 @@ diff -Naur grub-0.97.orig/netboot/r8169.c grub-0.97/netboot/r8169.c
 +	.id_count = sizeof(r8169_nics) / sizeof(r8169_nics[0]),
 +	.class = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/rtl8139.c grub-0.97/netboot/rtl8139.c
---- grub-0.97.orig/netboot/rtl8139.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/rtl8139.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/rtl8139.c
+===================================================================
+--- a/netboot/rtl8139.c
++++ b/netboot/rtl8139.c
 @@ -17,6 +17,8 @@
  /*********************************************************************/
  
@@ -33103,9 +32001,10 @@ diff -Naur grub-0.97.orig/netboot/rtl8139.c grub-0.97/netboot/rtl8139.c
 +	.id_count = sizeof(rtl8139_nics)/sizeof(rtl8139_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/segoff.h grub-0.97/netboot/segoff.h
---- grub-0.97.orig/netboot/segoff.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/segoff.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/segoff.h
+===================================================================
+--- /dev/null
++++ b/netboot/segoff.h
 @@ -0,0 +1,43 @@
 +/*
 + * Segment:offset types and macros
@@ -33150,9 +32049,10 @@ diff -Naur grub-0.97.orig/netboot/segoff.h grub-0.97/netboot/segoff.h
 +#define VIRTUAL(x,y) ( phys_to_virt ( ( ( x ) << 4 ) + ( y ) ) )
 +
 +#endif /* SEGOFF_H */
-diff -Naur grub-0.97.orig/netboot/sis900.c grub-0.97/netboot/sis900.c
---- grub-0.97.orig/netboot/sis900.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/sis900.c	2005-08-31 20:02:38.000000000 +0000
+Index: b/netboot/sis900.c
+===================================================================
+--- a/netboot/sis900.c
++++ b/netboot/sis900.c
 @@ -27,6 +27,11 @@
  /* Revision History */
  
@@ -33910,7 +32810,7 @@ diff -Naur grub-0.97.orig/netboot/sis900.c grub-0.97/netboot/sis900.c
  {
 -    u32 status, to, nstype;
 +    u32 to, nstype;
-     u32 tx_status;
+     volatile u32 tx_status;
      
      /* Stop the transmitter */
 -    outl(TxDIS, ioaddr + cr);
@@ -33939,8 +32839,8 @@ diff -Naur grub-0.97.orig/netboot/sis900.c grub-0.97/netboot/sis900.c
  
      to = currticks() + TX_TIMEOUT;
  
--    while ((((volatile u32) tx_status=txd.cmdsts) & OWN) && (currticks() < to))
-+    while ((volatile u32) ( tx_status=txd.cmdsts & OWN) && (currticks() < to))
+-    while (((tx_status=txd.cmdsts) & OWN) && (currticks() < to))
++    while (((tx_status=txd.cmdsts & OWN) && (currticks() < to))
          /* wait */ ;
  
      if (currticks() >= to) {
@@ -34048,9 +32948,10 @@ diff -Naur grub-0.97.orig/netboot/sis900.c grub-0.97/netboot/sis900.c
 +	.id_count = sizeof(sis900_nics)/sizeof(sis900_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/sis900.h grub-0.97/netboot/sis900.h
---- grub-0.97.orig/netboot/sis900.h	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/sis900.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/sis900.h
+===================================================================
+--- a/netboot/sis900.h
++++ b/netboot/sis900.h
 @@ -39,14 +39,16 @@
  
  /* Symbolic names for bits in various registers */
@@ -34132,9 +33033,10 @@ diff -Naur grub-0.97.orig/netboot/sis900.h grub-0.97/netboot/sis900.h
  };
  
  enum sis630_revision_id {
-diff -Naur grub-0.97.orig/netboot/sis900.txt grub-0.97/netboot/sis900.txt
---- grub-0.97.orig/netboot/sis900.txt	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/sis900.txt	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/sis900.txt
+===================================================================
+--- a/netboot/sis900.txt
++++ /dev/null
 @@ -1,91 +0,0 @@
 -How I added the SIS900 card to Etherboot
 -
@@ -34227,1345 +33129,10 @@ diff -Naur grub-0.97.orig/netboot/sis900.txt grub-0.97/netboot/sis900.txt
 -assistance.
 -
 -Enjoy.
-diff -Naur grub-0.97.orig/netboot/sk_g16.c grub-0.97/netboot/sk_g16.c
---- grub-0.97.orig/netboot/sk_g16.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/sk_g16.c	1970-01-01 00:00:00.000000000 +0000
-@@ -1,1160 +0,0 @@
--/**************************************************************************
--Etherboot -  BOOTP/TFTP Bootstrap Program
--Schneider & Koch G16 NIC driver for Etherboot
--heavily based on SK G16 driver from Linux 2.0.36
--Changes to make it work with Etherboot by Georg Baum <Georg.Baum@gmx.de>
--***************************************************************************/
--
--/*-
-- * Copyright (C) 1994 by PJD Weichmann & SWS Bern, Switzerland
-- *
-- * This software may be used and distributed according to the terms
-- * of the GNU Public License, incorporated herein by reference.
-- *
-- * Module         : sk_g16.c
-- *
-- * Version        : $Revision: 1.4 $
-- *
-- * Author         : Patrick J.D. Weichmann
-- *
-- * Date Created   : 94/05/26
-- * Last Updated   : $Date: 2002/01/02 21:56:40 $
-- *
-- * Description    : Schneider & Koch G16 Ethernet Device Driver for
-- *                  Linux Kernel >= 1.1.22
-- * Update History :
-- *
---*/
--
--/*
-- * The Schneider & Koch (SK) G16 Network device driver is based
-- * on the 'ni6510' driver from Michael Hipp which can be found at
-- * ftp://sunsite.unc.edu/pub/Linux/system/Network/drivers/nidrivers.tar.gz
-- *
-- * Sources: 1) ni6510.c by M. Hipp
-- *          2) depca.c  by D.C. Davies
-- *          3) skeleton.c by D. Becker
-- *          4) Am7990 Local Area Network Controller for Ethernet (LANCE),
-- *             AMD, Pub. #05698, June 1989
-- *
-- * Many Thanks for helping me to get things working to:
-- *
-- *                 A. Cox (A.Cox at swansea.ac.uk)
-- *                 M. Hipp (mhipp at student.uni-tuebingen.de)
-- *                 R. Bolz (Schneider & Koch, Germany)
-- *
-- * See README.sk_g16 for details about limitations and bugs for the
-- * current version.
-- *
-- * To Do:
-- *        - Support of SK_G8 and other SK Network Cards.
-- *        - Autoset memory mapped RAM. Check for free memory and then
-- *          configure RAM correctly.
-- *        - SK_close should really set card in to initial state.
-- *        - Test if IRQ 3 is not switched off. Use autoirq() functionality.
-- *          (as in /drivers/net/skeleton.c)
-- *        - Implement Multicast addressing. At minimum something like
-- *          in depca.c.
-- *        - Redo the statistics part.
-- *        - Try to find out if the board is in 8 Bit or 16 Bit slot.
-- *          If in 8 Bit mode don't use IRQ 11.
-- *        - (Try to make it slightly faster.)
-- */
--
--/* to get some global routines like printf */
--#include "etherboot.h"
--/* to get the interface to the body of the program */
--#include "nic.h"
--
--/* From linux/if_ether.h: */
--#define ETH_ZLEN	60		/* Min. octets in frame sans FCS */
--
--#include "sk_g16.h"
--
--/*
-- * Schneider & Koch Card Definitions
-- * =================================
-- */
--
--#define SK_NAME   "SK_G16"
--
--/*
-- * SK_G16 Configuration
-- * --------------------
-- */
--
--/*
-- * Abbreviations
-- * -------------
-- *
-- * RAM - used for the 16KB shared memory
-- * Boot_ROM, ROM - are used for referencing the BootEPROM
-- *
-- * SK_ADDR is a symbolic constant used to configure
-- * the behaviour of the driver and the SK_G16.
-- *
-- * SK_ADDR defines the address where the RAM will be mapped into the real
-- *         host memory.
-- *         valid addresses are from 0xa0000 to 0xfc000 in 16Kbyte steps.
-- */
--
--#define SK_ADDR         0xcc000
--
--/*
-- * In POS3 are bits A14-A19 of the address bus. These bits can be set
-- * to choose the RAM address. That's why we only can choose the RAM address
-- * in 16KB steps.
-- */
--
--#define POS_ADDR       (rom_addr>>14)  /* Do not change this line */
--
--/*
-- * SK_G16 I/O PORT's + IRQ's + Boot_ROM locations
-- * ----------------------------------------------
-- */
--
--/*
-- * As nearly every card has also SK_G16 a specified I/O Port region and
-- * only a few possible IRQ's.
-- * In the Installation Guide from Schneider & Koch is listed a possible
-- * Interrupt IRQ2. IRQ2 is always IRQ9 in boards with two cascaded interrupt
-- * controllers. So we use in SK_IRQS IRQ9.
-- */
--
--/* Don't touch any of the following #defines. */
--
--#define SK_IO_PORTS     { 0x100, 0x180, 0x208, 0x220, 0x288, 0x320, 0x328, 0x390, 0 }
--
--/*
-- * SK_G16 POS REGISTERS
-- * --------------------
-- */
--
--/*
-- * SK_G16 has a Programmable Option Select (POS) Register.
-- * The POS is composed of 8 separate registers (POS0-7) which
-- * are I/O mapped on an address set by the W1 switch.
-- *
-- */
--
--#define SK_POS_SIZE 8           /* 8 I/O Ports are used by SK_G16 */
--
--#define SK_POS0     ioaddr      /* Card-ID Low (R) */
--#define SK_POS1     ioaddr+1    /* Card-ID High (R) */
--#define SK_POS2     ioaddr+2    /* Card-Enable, Boot-ROM Disable (RW) */
--#define SK_POS3     ioaddr+3    /* Base address of RAM */
--#define SK_POS4     ioaddr+4    /* IRQ */
--
--/* POS5 - POS7 are unused */
--
--/*
-- * SK_G16 MAC PREFIX
-- * -----------------
-- */
--
--/*
-- * Scheider & Koch manufacturer code (00:00:a5).
-- * This must be checked, that we are sure it is a SK card.
-- */
--
--#define SK_MAC0         0x00
--#define SK_MAC1         0x00
--#define SK_MAC2         0x5a
--
--/*
-- * SK_G16 ID
-- * ---------
-- */
--
--/*
-- * If POS0,POS1 contain the following ID, then we know
-- * at which I/O Port Address we are.
-- */
--
--#define SK_IDLOW  0xfd
--#define SK_IDHIGH 0x6a
--
--
--/*
-- * LANCE POS Bit definitions
-- * -------------------------
-- */
--
--#define SK_ROM_RAM_ON  (POS2_CARD)
--#define SK_ROM_RAM_OFF (POS2_EPROM)
--#define SK_ROM_ON      (inb(SK_POS2) & POS2_CARD)
--#define SK_ROM_OFF     (inb(SK_POS2) | POS2_EPROM)
--#define SK_RAM_ON      (inb(SK_POS2) | POS2_CARD)
--#define SK_RAM_OFF     (inb(SK_POS2) & POS2_EPROM)
--
--#define POS2_CARD  0x0001              /* 1 = SK_G16 on      0 = off */
--#define POS2_EPROM 0x0002              /* 1 = Boot EPROM off 0 = on */
--
--/*
-- * SK_G16 Memory mapped Registers
-- * ------------------------------
-- *
-- */
--
--#define SK_IOREG        (board->ioreg) /* LANCE data registers.     */
--#define SK_PORT         (board->port)  /* Control, Status register  */
--#define SK_IOCOM        (board->iocom) /* I/O Command               */
--
--/*
-- * SK_G16 Status/Control Register bits
-- * -----------------------------------
-- *
-- * (C) Controlreg (S) Statusreg
-- */
--
--/*
-- * Register transfer: 0 = no transfer
-- *                    1 = transferring data between LANCE and I/O reg
-- */
--#define SK_IORUN        0x20
--
--/*
-- * LANCE interrupt: 0 = LANCE interrupt occurred
-- *                  1 = no LANCE interrupt occurred
-- */
--#define SK_IRQ          0x10
--
--#define SK_RESET        0x08   /* Reset SK_CARD: 0 = RESET 1 = normal */
--#define SK_RW           0x02   /* 0 = write to 1 = read from */
--#define SK_ADR          0x01   /* 0 = REG DataPort 1 = RAP Reg addr port */
--
--
--#define SK_RREG         SK_RW  /* Transferdirection to read from lance */
--#define SK_WREG         0      /* Transferdirection to write to lance */
--#define SK_RAP          SK_ADR /* Destination Register RAP */
--#define SK_RDATA        0      /* Destination Register REG DataPort */
--
--/*
-- * SK_G16 I/O Command
-- * ------------------
-- */
--
--/*
-- * Any bitcombination sets the internal I/O bit (transfer will start)
-- * when written to I/O Command
-- */
--
--#define SK_DOIO         0x80   /* Do Transfer */
--
--/*
-- * LANCE RAP (Register Address Port).
-- * ---------------------------------
-- */
--
--/*
-- * The LANCE internal registers are selected through the RAP.
-- * The Registers are:
-- *
-- * CSR0 - Status and Control flags
-- * CSR1 - Low order bits of initialize block (bits 15:00)
-- * CSR2 - High order bits of initialize block (bits 07:00, 15:08 are reserved)
-- * CSR3 - Allows redefinition of the Bus Master Interface.
-- *        This register must be set to 0x0002, which means BSWAP = 0,
-- *        ACON = 1, BCON = 0;
-- *
-- */
--
--#define CSR0            0x00
--#define CSR1            0x01
--#define CSR2            0x02
--#define CSR3            0x03
--
--/*
-- * General Definitions
-- * ===================
-- */
--
--/*
-- * Set the number of Tx and Rx buffers, using Log_2(# buffers).
-- * We have 16KB RAM which can be accessed by the LANCE. In the
-- * memory are not only the buffers but also the ring descriptors and
-- * the initialize block.
-- * Don't change anything unless you really know what you do.
-- */
--
--#define LC_LOG_TX_BUFFERS 1               /* (2 == 2^^1) 2 Transmit buffers */
--#define LC_LOG_RX_BUFFERS 2               /* (8 == 2^^3) 8 Receive buffers */
--
--/* Descriptor ring sizes */
--
--#define TMDNUM (1 << (LC_LOG_TX_BUFFERS)) /* 2 Transmit descriptor rings */
--#define RMDNUM (1 << (LC_LOG_RX_BUFFERS)) /* 8 Receive Buffers */
--
--/* Define Mask for setting RMD, TMD length in the LANCE init_block */
--
--#define TMDNUMMASK (LC_LOG_TX_BUFFERS << 29)
--#define RMDNUMMASK (LC_LOG_RX_BUFFERS << 29)
--
--/*
-- * Data Buffer size is set to maximum packet length.
-- */
--
--#define PKT_BUF_SZ              1518
--
--/*
-- * The number of low I/O ports used by the ethercard.
-- */
--
--#define ETHERCARD_TOTAL_SIZE    SK_POS_SIZE
--
--/*
-- * Portreserve is there to mark the Card I/O Port region as used.
-- * Check_region is to check if the region at ioaddr with the size "size"
-- * is free or not.
-- * Snarf_region allocates the I/O Port region.
-- */
--
--#ifndef	HAVE_PORTRESERVE
--
--#define check_region(ioaddr1, size)              0
--#define request_region(ioaddr1, size,name)       do ; while (0)
--
--#endif
--
--/*
-- * SK_DEBUG
-- *
-- * Here you can choose what level of debugging wanted.
-- *
-- * If SK_DEBUG and SK_DEBUG2 are undefined, then only the
-- *  necessary messages will be printed.
-- *
-- * If SK_DEBUG is defined, there will be many debugging prints
-- *  which can help to find some mistakes in configuration or even
-- *  in the driver code.
-- *
-- * If SK_DEBUG2 is defined, many many messages will be printed
-- *  which normally you don't need. I used this to check the interrupt
-- *  routine.
-- *
-- * (If you define only SK_DEBUG2 then only the messages for
-- *  checking interrupts will be printed!)
-- *
-- * Normal way of live is:
-- *
-- * For the whole thing get going let both symbolic constants
-- * undefined. If you face any problems and you know what's going
-- * on (you know something about the card and you can interpret some
-- * hex LANCE register output) then define SK_DEBUG
-- *
-- */
--
--#undef  SK_DEBUG	/* debugging */
--#undef  SK_DEBUG2	/* debugging with more verbose report */
--
--#ifdef	SK_DEBUG
--#define PRINTF(x) printf x
--#else
--#define PRINTF(x) /**/
--#endif
--
--#ifdef	SK_DEBUG2
--#define PRINTF2(x) printf x
--#else
--#define PRINTF2(x) /**/
--#endif
--
--/*
-- * SK_G16 RAM
-- *
-- * The components are memory mapped and can be set in a region from
-- * 0x00000 through 0xfc000 in 16KB steps.
-- *
-- * The Network components are: dual ported RAM, Prom, I/O Reg, Status-,
-- * Controlregister and I/O Command.
-- *
-- * dual ported RAM: This is the only memory region which the LANCE chip
-- *      has access to. From the Lance it is addressed from 0x0000 to
-- *      0x3fbf. The host accesses it normally.
-- *
-- * PROM: The PROM obtains the ETHERNET-MAC-Address. It is realised as a
-- *       8-Bit PROM, this means only the 16 even addresses are used of the
-- *       32 Byte Address region. Access to a odd address results in invalid
-- *       data.
-- *
-- * LANCE I/O Reg: The I/O Reg is build of 4 single Registers, Low-Byte Write,
-- *       Hi-Byte Write, Low-Byte Read, Hi-Byte Read.
-- *       Transfer from or to the LANCE is always in 16Bit so Low and High
-- *       registers are always relevant.
-- *
-- *       The Data from the Readregister is not the data in the Writeregister!!
-- *
-- * Port: Status- and Controlregister.
-- *       Two different registers which share the same address, Status is
-- *       read-only, Control is write-only.
-- *
-- * I/O Command:
-- *       Any bitcombination written in here starts the transmission between
-- *       Host and LANCE.
-- */
--
--typedef struct
--{
--	unsigned char  ram[0x3fc0];   /* 16KB dual ported ram */
--	unsigned char  rom[0x0020];   /* 32Byte PROM containing 6Byte MAC */
--	unsigned char  res1[0x0010];  /* reserved */
--	unsigned volatile short ioreg;/* LANCE I/O Register */
--	unsigned volatile char  port; /* Statusregister and Controlregister */
--	unsigned char  iocom;         /* I/O Command Register */
--} SK_RAM;
--
--/* struct  */
--
--/*
-- * This is the structure for the dual ported ram. We
-- * have exactly 16 320 Bytes. In here there must be:
-- *
-- *     - Initialize Block   (starting@a word boundary)
-- *     - Receive and Transmit Descriptor Rings (quadword boundary)
-- *     - Data Buffers (arbitrary boundary)
-- *
-- * This is because LANCE has on SK_G16 only access to the dual ported
-- * RAM and nowhere else.
-- */
--
--struct SK_ram
--{
--    struct init_block ib;
--    struct tmd tmde[TMDNUM];
--    struct rmd rmde[RMDNUM];
--    char tmdbuf[TMDNUM][PKT_BUF_SZ];
--    char rmdbuf[RMDNUM][PKT_BUF_SZ];
--};
--
--/*
-- * Structure where all necessary information is for ring buffer
-- * management and statistics.
-- */
--
--struct priv
--{
--    struct SK_ram *ram;  /* dual ported ram structure */
--    struct rmd *rmdhead; /* start of receive ring descriptors */
--    struct tmd *tmdhead; /* start of transmit ring descriptors */
--    int        rmdnum;   /* actual used ring descriptor */
--    int        tmdnum;   /* actual transmit descriptor for transmitting data */
--    int        tmdlast;  /* last sent descriptor used for error handling, etc */
--    void       *rmdbufs[RMDNUM]; /* pointer to the receive buffers */
--    void       *tmdbufs[TMDNUM]; /* pointer to the transmit buffers */
--};
--
--/* global variable declaration */
--
--/* static variables */
--
--static SK_RAM *board;  /* pointer to our memory mapped board components */
--static unsigned short	ioaddr; /* base io address */
--static struct priv	p_data;
--
--/* Macros */
--
--
--/* Function Prototypes */
--
--/*
-- * Device Driver functions
-- * -----------------------
-- * See for short explanation of each function its definitions header.
-- */
--
--static int   SK_probe1(struct nic *nic, short ioaddr1);
--
--static void SK_reset(struct nic *nic);
--static int SK_poll(struct nic *nic);
--static void SK_transmit(
--struct nic *nic,
--const char *d,			/* Destination */
--unsigned int t,			/* Type */
--unsigned int s,			/* size */
--const char *p);			/* Packet */
--static void SK_disable(struct nic *nic);
--struct nic *SK_probe(struct nic *nic, unsigned short *probe_addrs);
--
--/*
-- * LANCE Functions
-- * ---------------
-- */
--
--static int SK_lance_init(struct nic *nic, unsigned short mode);
--static void SK_reset_board(void);
--static void SK_set_RAP(int reg_number);
--static int SK_read_reg(int reg_number);
--static int SK_rread_reg(void);
--static void SK_write_reg(int reg_number, int value);
--
--/*
-- * Debugging functions
-- * -------------------
-- */
--
--static void SK_print_pos(struct nic *nic, char *text);
--static void SK_print_ram(struct nic *nic);
--
--
--/**************************************************************************
--RESET - Reset adapter
--***************************************************************************/
--static void SK_reset(struct nic *nic)
--{
--	/* put the card in its initial state */
--	SK_lance_init(nic, MODE_NORMAL);
--}
--
--/**************************************************************************
--POLL - Wait for a frame
--***************************************************************************/
--static int SK_poll(struct nic *nic)
--{
--	/* return true if there's an ethernet packet ready to read */
--	struct priv *p;         /* SK_G16 private structure */
--	struct rmd *rmdp;
--	int csr0, rmdstat, packet_there;
--    PRINTF2(("## %s: At beginning of SK_poll(). CSR0: %#hX\n",
--           SK_NAME, SK_read_reg(CSR0)));
--
--	p = nic->priv_data;
--    csr0 = SK_read_reg(CSR0);      /* store register for checking */
--
--    /*
--     * Acknowledge all of the current interrupt sources, disable
--     * Interrupts (INEA = 0)
--     */
--
--    SK_write_reg(CSR0, csr0 & CSR0_CLRALL);
--
--    if (csr0 & CSR0_ERR) /* LANCE Error */
--    {
--	printf("%s: error: %#hX", SK_NAME, csr0);
--
--        if (csr0 & CSR0_MISS)      /* No place to store packet ? */
--        {
--		printf(", Packet dropped.");
--        }
--	putchar('\n');
--    }
--
--    rmdp = p->rmdhead + p->rmdnum;
--    packet_there = 0;
--    /* As long as we own the next entry, check status and send
--     * it up to higher layer
--     */
--
--    while (!( (rmdstat = rmdp->u.s.status) & RX_OWN))
--    {
--	/*
--         * Start and end of packet must be set, because we use
--	 * the ethernet maximum packet length (1518) as buffer size.
--	 *
--	 * Because our buffers are at maximum OFLO and BUFF errors are
--	 * not to be concerned (see Data sheet)
--	 */
--
--	if ((rmdstat & (RX_STP | RX_ENP)) != (RX_STP | RX_ENP))
--	{
--	    /* Start of a frame > 1518 Bytes ? */
--
--	    if (rmdstat & RX_STP)
--	    {
--		printf("%s: packet too long\n", SK_NAME);
--	    }
--
--	    /*
--             * All other packets will be ignored until a new frame with
--	     * start (RX_STP) set follows.
--	     *
--	     * What we do is just give descriptor free for new incoming
--	     * packets.
--	     */
--
--	    rmdp->u.s.status = RX_OWN;      /* Relinquish ownership to LANCE */
--
--	}
--	else if (rmdstat & RX_ERR)          /* Receive Error ? */
--	{
--	    printf("%s: RX error: %#hX\n", SK_NAME, (int) rmdstat);
--	    rmdp->u.s.status = RX_OWN;      /* Relinquish ownership to LANCE */
--	}
--	else /* We have a packet which can be queued for the upper layers */
--	{
--
--	    int len = (rmdp->mlen & 0x0fff);  /* extract message length from receive buffer */
--
--	    /*
--             * Copy data out of our receive descriptor into nic->packet.
--	     *
--	     * (rmdp->u.buffer & 0x00ffffff) -> get address of buffer and
--	     * ignore status fields)
--	     */
--
--	    memcpy(nic->packet, (unsigned char *) (rmdp->u.buffer & 0x00ffffff), nic->packetlen = len);
--	    packet_there = 1;
--
--
--	    /*
--             * Packet is queued and marked for processing so we
--	     * free our descriptor
--	     */
--
--	    rmdp->u.s.status = RX_OWN;
--
--	    p->rmdnum++;
--	    p->rmdnum %= RMDNUM;
--
--	    rmdp = p->rmdhead + p->rmdnum;
--	}
--    }
--    SK_write_reg(CSR0, CSR0_INEA); /* Enable Interrupts */
--	return (packet_there);
--}
--
--/**************************************************************************
--TRANSMIT - Transmit a frame
--***************************************************************************/
--static void SK_transmit(
--struct nic *nic,
--const char *d,			/* Destination */
--unsigned int t,			/* Type */
--unsigned int s,			/* size */
--const char *pack)		/* Packet */
--{
--	/* send the packet to destination */
--    struct priv *p;         /* SK_G16 private structure */
--    struct tmd *tmdp;
--    short len;
--    int csr0, i, tmdstat;
--
--    PRINTF2(("## %s: At beginning of SK_transmit(). CSR0: %#hX\n",
--           SK_NAME, SK_read_reg(CSR0)));
--	p = nic->priv_data;
--	tmdp = p->tmdhead + p->tmdnum; /* Which descriptor for transmitting */
--
--	/* Copy data into dual ported ram */
--
--	memcpy(&p->ram->tmdbuf[p->tmdnum][0], d, ETH_ALEN);	/* dst */
--	memcpy(&p->ram->tmdbuf[p->tmdnum][ETH_ALEN], nic->node_addr, ETH_ALEN); /* src */
--	p->ram->tmdbuf[p->tmdnum][ETH_ALEN + ETH_ALEN] = t >> 8;	/* type */
--	p->ram->tmdbuf[p->tmdnum][ETH_ALEN + ETH_ALEN + 1] = t;	/* type */
--	memcpy(&p->ram->tmdbuf[p->tmdnum][ETH_HLEN], pack, s);
--	s += ETH_HLEN;
--	while (s < ETH_ZLEN)	/* pad to min length */
--		p->ram->tmdbuf[p->tmdnum][s++] = 0;
--	p->ram->tmde[p->tmdnum].status2 = 0x0;
--
--	/* Evaluate Packet length */
--	len = ETH_ZLEN < s ? s : ETH_ZLEN;
--
--	/* Fill in Transmit Message Descriptor */
--
--	tmdp->blen = -len;            /* set length to transmit */
--
--	/*
--	 * Packet start and end is always set because we use the maximum
--	 * packet length as buffer length.
--	 * Relinquish ownership to LANCE
--	 */
--
--	tmdp->u.s.status = TX_OWN | TX_STP | TX_ENP;
--
--	/* Start Demand Transmission */
--	SK_write_reg(CSR0, CSR0_TDMD | CSR0_INEA);
--
--    csr0 = SK_read_reg(CSR0);      /* store register for checking */
--
--    /*
--     * Acknowledge all of the current interrupt sources, disable
--     * Interrupts (INEA = 0)
--     */
--
--    SK_write_reg(CSR0, csr0 & CSR0_CLRALL);
--
--    if (csr0 & CSR0_ERR) /* LANCE Error */
--    {
--	printf("%s: error: %#hX", SK_NAME, csr0);
--
--        if (csr0 & CSR0_MISS)      /* No place to store packet ? */
--        {
--		printf(", Packet dropped.");
--        }
--	putchar('\n');
--    }
--
--
--    /* Set next buffer */
--    p->tmdlast++;
--    p->tmdlast &= TMDNUM-1;
--
--    tmdstat = tmdp->u.s.status & 0xff00; /* filter out status bits 15:08 */
--
--    /*
--     * We check status of transmitted packet.
--     * see LANCE data-sheet for error explanation
--     */
--    if (tmdstat & TX_ERR) /* Error occurred */
--    {
--	printf("%s: TX error: %#hX %#hX\n", SK_NAME, (int) tmdstat,
--		(int) tmdp->status2);
--
--	if (tmdp->status2 & TX_TDR)    /* TDR problems? */
--	{
--	    printf("%s: tdr-problems \n", SK_NAME);
--	}
--
--        if (tmdp->status2 & TX_UFLO)   /* Underflow error ? */
--        {
--            /*
--             * If UFLO error occurs it will turn transmitter of.
--             * So we must reinit LANCE
--             */
--
--            SK_lance_init(nic, MODE_NORMAL);
--        }
--
--	tmdp->status2 = 0;             /* Clear error flags */
--    }
--
--    SK_write_reg(CSR0, CSR0_INEA); /* Enable Interrupts */
--
--	/* Set pointer to next transmit buffer */
--	p->tmdnum++;
--	p->tmdnum &= TMDNUM-1;
--
--}
--
--/**************************************************************************
--DISABLE - Turn off ethernet interface
--***************************************************************************/
--static void SK_disable(struct nic *nic)
--{
--    PRINTF(("## %s: At beginning of SK_disable(). CSR0: %#hX\n",
--           SK_NAME, SK_read_reg(CSR0)));
--    PRINTF(("%s: Shutting %s down CSR0 %#hX\n", SK_NAME, SK_NAME,
--           (int) SK_read_reg(CSR0)));
--
--    SK_write_reg(CSR0, CSR0_STOP); /* STOP the LANCE */
--}
--
--/**************************************************************************
--PROBE - Look for an adapter, this routine's visible to the outside
--***************************************************************************/
--struct nic *SK_probe(struct nic *nic, unsigned short *probe_addrs)
--{
--	unsigned short		*p;
--	static unsigned short	io_addrs[] = SK_IO_PORTS;
--	/* if probe_addrs is 0, then routine can use a hardwired default */
--	putchar('\n');
--	nic->priv_data = &p_data;
--	if (probe_addrs == 0)
--		probe_addrs = io_addrs;
--	for (p = probe_addrs; (ioaddr = *p) != 0; ++p)
--	{
--		long		offset1, offset0 = inb(ioaddr);
--		if ((offset0 == SK_IDLOW) &&
--		 ((offset1 = inb(ioaddr + 1)) == SK_IDHIGH))
--			if (SK_probe1(nic, ioaddr) >= 0)
--				break;
--	}
--	/* if board found */
--	if (ioaddr != 0)
--	{
--		/* point to NIC specific routines */
--		nic->reset = SK_reset;
--		nic->poll = SK_poll;
--		nic->transmit = SK_transmit;
--		nic->disable = SK_disable;
--		return nic;
--	}
--	/* else */
--	{
--		return 0;
--	}
--}
--
--int SK_probe1(struct nic *nic, short ioaddr1)
--{
--    int i,j;                /* Counters */
--    int sk_addr_flag = 0;   /* SK ADDR correct? 1 - no, 0 - yes */
--    unsigned int rom_addr;  /* used to store RAM address used for POS_ADDR */
--
--    struct priv *p;         /* SK_G16 private structure */
--
--    if (SK_ADDR & 0x3fff || SK_ADDR < 0xa0000)
--    {
--       /*
--        * Now here we could use a routine which searches for a free
--        * place in the ram and set SK_ADDR if found. TODO.
--        */
--            printf("%s: SK_ADDR %#hX is not valid. Check configuration.\n",
--                    SK_NAME, SK_ADDR);
--            return -1;
--    }
--
--    rom_addr = SK_ADDR;
--
--    outb(SK_ROM_RAM_OFF, SK_POS2); /* Boot_ROM + RAM off */
--    outb(POS_ADDR, SK_POS3);       /* Set RAM address */
--    outb(SK_ROM_RAM_ON, SK_POS2);  /* RAM on, BOOT_ROM on */
--#ifdef	SK_DEBUG
--    SK_print_pos(nic, "POS registers after ROM, RAM config");
--#endif
--
--    board = (SK_RAM *) rom_addr;
--	PRINTF(("adr[0]: %hX, adr[1]: %hX, adr[2]: %hX\n",
--	board->rom[0], board->rom[2], board->rom[4]));
--
--    /* Read in station address */
--    for (i = 0, j = 0; i < ETH_ALEN; i++, j+=2)
--    {
--	*(nic->node_addr+i) = board->rom[j];
--    }
--
--    /* Check for manufacturer code */
--#ifdef	SK_DEBUG
--    if (!(*(nic->node_addr+0) == SK_MAC0 &&
--	  *(nic->node_addr+1) == SK_MAC1 &&
--	  *(nic->node_addr+2) == SK_MAC2) )
--    {
--        PRINTF(("## %s: We did not find SK_G16 at RAM location.\n",
--                SK_NAME));
--	return -1;                     /* NO SK_G16 found */
--    }
--#endif
--
--    p = nic->priv_data;
--
--    /* Initialize private structure */
--
--    p->ram = (struct SK_ram *) rom_addr; /* Set dual ported RAM addr */
--    p->tmdhead = &(p->ram)->tmde[0];     /* Set TMD head */
--    p->rmdhead = &(p->ram)->rmde[0];     /* Set RMD head */
--
--    printf("Schneider & Koch G16 at %#hX, mem at %#hX, HW addr: %!\n",
--	    (unsigned int) ioaddr, (unsigned int) p->ram, nic->node_addr);
--
--    /* Initialize buffer pointers */
--
--    for (i = 0; i < TMDNUM; i++)
--    {
--	p->tmdbufs[i] = p->ram->tmdbuf[i];
--    }
--
--    for (i = 0; i < RMDNUM; i++)
--    {
--	p->rmdbufs[i] = p->ram->rmdbuf[i];
--    }
--    i = 0;
--
--    if (!(i = SK_lance_init(nic, MODE_NORMAL)))  /* LANCE init OK? */
--    {
--
--#ifdef	SK_DEBUG
--        /*
--         * This debug block tries to stop LANCE,
--         * reinit LANCE with transmitter and receiver disabled,
--         * then stop again and reinit with NORMAL_MODE
--         */
--
--        printf("## %s: After lance init. CSR0: %#hX\n",
--               SK_NAME, SK_read_reg(CSR0));
--        SK_write_reg(CSR0, CSR0_STOP);
--        printf("## %s: LANCE stopped. CSR0: %#hX\n",
--               SK_NAME, SK_read_reg(CSR0));
--        SK_lance_init(nic, MODE_DTX | MODE_DRX);
--        printf("## %s: Reinit with DTX + DRX off. CSR0: %#hX\n",
--               SK_NAME, SK_read_reg(CSR0));
--        SK_write_reg(CSR0, CSR0_STOP);
--        printf("## %s: LANCE stopped. CSR0: %#hX\n",
--               SK_NAME, SK_read_reg(CSR0));
--        SK_lance_init(nic, MODE_NORMAL);
--        printf("## %s: LANCE back to normal mode. CSR0: %#hX\n",
--               SK_NAME, SK_read_reg(CSR0));
--        SK_print_pos(nic, "POS regs before returning OK");
--
--#endif	/* SK_DEBUG */
--
--    }
--    else /* LANCE init failed */
--    {
--
--	PRINTF(("## %s: LANCE init failed: CSR0: %#hX\n",
--               SK_NAME, SK_read_reg(CSR0)));
--	return -1;
--    }
--
--#ifdef	SK_DEBUG
--    SK_print_pos(nic, "End of SK_probe1");
--    SK_print_ram(nic);
--#endif
--
--    return 0;                            /* Initialization done */
--
--} /* End of SK_probe1() */
--
--static int SK_lance_init(struct nic *nic, unsigned short mode)
--{
--    int i;
--    struct priv *p = (struct priv *) nic->priv_data;
--    struct tmd  *tmdp;
--    struct rmd  *rmdp;
--
--    PRINTF(("## %s: At beginning of LANCE init. CSR0: %#hX\n",
--           SK_NAME, SK_read_reg(CSR0)));
--
--    /* Reset LANCE */
--    SK_reset_board();
--
--    /* Initialize TMD's with start values */
--    p->tmdnum = 0;                   /* First descriptor for transmitting */
--    p->tmdlast = 0;                  /* First descriptor for reading stats */
--
--    for (i = 0; i < TMDNUM; i++)     /* Init all TMD's */
--    {
--	tmdp = p->tmdhead + i;
--
--	tmdp->u.buffer = (unsigned long) p->tmdbufs[i]; /* assign buffer */
--
--	/* Mark TMD as start and end of packet */
--	tmdp->u.s.status = TX_STP | TX_ENP;
--    }
--
--
--    /* Initialize RMD's with start values */
--
--    p->rmdnum = 0;                   /* First RMD which will be used */
--
--    for (i = 0; i < RMDNUM; i++)     /* Init all RMD's */
--    {
--	rmdp = p->rmdhead + i;
--
--
--	rmdp->u.buffer = (unsigned long) p->rmdbufs[i]; /* assign buffer */
--
--	/*
--         * LANCE must be owner at beginning so that he can fill in
--	 * receiving packets, set status and release RMD
--	 */
--
--	rmdp->u.s.status = RX_OWN;
--
--	rmdp->blen = -PKT_BUF_SZ;    /* Buffer Size in a two's complement */
--
--	rmdp->mlen = 0;              /* init message length */
--
--    }
--
--    /* Fill LANCE Initialize Block */
--
--    (p->ram)->ib.mode = mode;        /* Set operation mode */
--
--    for (i = 0; i < ETH_ALEN; i++)   /* Set physical address */
--    {
--	(p->ram)->ib.paddr[i] = *(nic->node_addr+i);
--    }
--
--    for (i = 0; i < 8; i++)          /* Set multicast, logical address */
--    {
--	(p->ram)->ib.laddr[i] = 0;   /* We do not use logical addressing */
--    }
--
--    /* Set ring descriptor pointers and set number of descriptors */
--
--    (p->ram)->ib.rdrp = (int)  p->rmdhead | RMDNUMMASK;
--    (p->ram)->ib.tdrp = (int)  p->tmdhead | TMDNUMMASK;
--
--    /* Prepare LANCE Control and Status Registers */
--
--    SK_write_reg(CSR3, CSR3_ACON);   /* Ale Control !!!THIS MUST BE SET!!!! */
--
--    /*
--     * LANCE addresses the RAM from 0x0000 to 0x3fbf and has no access to
--     * PC Memory locations.
--     *
--     * In structure SK_ram is defined that the first thing in ram
--     * is the initialization block. So his address is for LANCE always
--     * 0x0000
--     *
--     * CSR1 contains low order bits 15:0 of initialization block address
--     * CSR2 is built of:
--     *    7:0  High order bits 23:16 of initialization block address
--     *   15:8  reserved, must be 0
--     */
--
--    /* Set initialization block address (must be on word boundary) */
--    SK_write_reg(CSR1, 0);          /* Set low order bits 15:0 */
--    SK_write_reg(CSR2, 0);          /* Set high order bits 23:16 */
--
--
--    PRINTF(("## %s: After setting CSR1-3. CSR0: %#hX\n",
--           SK_NAME, SK_read_reg(CSR0)));
--
--    /* Initialize LANCE */
--
--    /*
--     * INIT = Initialize, when set, causes the LANCE to begin the
--     * initialization procedure and access the Init Block.
--     */
--
--    SK_write_reg(CSR0, CSR0_INIT);
--
--    /* Wait until LANCE finished initialization */
--
--    SK_set_RAP(CSR0);              /* Register Address Pointer to CSR0 */
--
--    for (i = 0; (i < 100) && !(SK_rread_reg() & CSR0_IDON); i++)
--	; /* Wait until init done or go ahead if problems (i>=100) */
--
--    if (i >= 100) /* Something is wrong ! */
--    {
--	printf("%s: can't init am7990, status: %#hX "
--	       "init_block: %#hX\n",
--		SK_NAME, (int) SK_read_reg(CSR0),
--		(unsigned int) &(p->ram)->ib);
--
--#ifdef	SK_DEBUG
--	SK_print_pos(nic, "LANCE INIT failed");
--#endif
--
--	return -1;                 /* LANCE init failed */
--    }
--
--    PRINTF(("## %s: init done after %d ticks\n", SK_NAME, i));
--
--    /* Clear Initialize done, enable Interrupts, start LANCE */
--
--    SK_write_reg(CSR0, CSR0_IDON | CSR0_INEA | CSR0_STRT);
--
--    PRINTF(("## %s: LANCE started. CSR0: %#hX\n", SK_NAME,
--            SK_read_reg(CSR0)));
--
--    return 0;                      /* LANCE is up and running */
--
--} /* End of SK_lance_init() */
--
--/* LANCE access functions
-- *
-- * ! CSR1-3 can only be accessed when in CSR0 the STOP bit is set !
-- */
--
--static void SK_reset_board(void)
--{
--    int i;
--
--	PRINTF(("## %s: At beginning of SK_reset_board.\n", SK_NAME));
--    SK_PORT = 0x00;           /* Reset active */
--    for (i = 0; i < 10 ; i++) /* Delay min 5ms */
--	;
--    SK_PORT = SK_RESET;       /* Set back to normal operation */
--
--} /* End of SK_reset_board() */
--
--static void SK_set_RAP(int reg_number)
--{
--    SK_IOREG = reg_number;
--    SK_PORT  = SK_RESET | SK_RAP | SK_WREG;
--    SK_IOCOM = SK_DOIO;
--
--    while (SK_PORT & SK_IORUN)
--	;
--} /* End of SK_set_RAP() */
--
--static int SK_read_reg(int reg_number)
--{
--    SK_set_RAP(reg_number);
--
--    SK_PORT  = SK_RESET | SK_RDATA | SK_RREG;
--    SK_IOCOM = SK_DOIO;
--
--    while (SK_PORT & SK_IORUN)
--	;
--    return (SK_IOREG);
--
--} /* End of SK_read_reg() */
--
--static int SK_rread_reg(void)
--{
--    SK_PORT  = SK_RESET | SK_RDATA | SK_RREG;
--
--    SK_IOCOM = SK_DOIO;
--
--    while (SK_PORT & SK_IORUN)
--	;
--    return (SK_IOREG);
--
--} /* End of SK_rread_reg() */
--
--static void SK_write_reg(int reg_number, int value)
--{
--    SK_set_RAP(reg_number);
--
--    SK_IOREG = value;
--    SK_PORT  = SK_RESET | SK_RDATA | SK_WREG;
--    SK_IOCOM = SK_DOIO;
--
--    while (SK_PORT & SK_IORUN)
--	;
--} /* End of SK_write_reg */
--
--/*
-- * Debugging functions
-- * -------------------
-- */
--
--#ifdef	SK_DEBUG
--static void SK_print_pos(struct nic *nic, char *text)
--{
--
--    unsigned char pos0 = inb(SK_POS0),
--		  pos1 = inb(SK_POS1),
--		  pos2 = inb(SK_POS2),
--		  pos3 = inb(SK_POS3),
--		  pos4 = inb(SK_POS4);
--
--
--    printf("## %s: %s.\n"
--           "##   pos0=%#hX pos1=%#hX pos2=%#hX pos3=%#hX pos4=%#hX\n",
--           SK_NAME, text, pos0, pos1, pos2, (pos3<<14), pos4);
--
--} /* End of SK_print_pos() */
--
--static void SK_print_ram(struct nic *nic)
--{
--
--    int i;
--    struct priv *p = (struct priv *) nic->priv_data;
--
--    printf("## %s: RAM Details.\n"
--           "##   RAM at %#hX tmdhead: %#hX rmdhead: %#hX initblock: %#hX\n",
--           SK_NAME,
--           (unsigned int) p->ram,
--           (unsigned int) p->tmdhead,
--           (unsigned int) p->rmdhead,
--           (unsigned int) &(p->ram)->ib);
--
--    printf("##   ");
--
--    for(i = 0; i < TMDNUM; i++)
--    {
--           if (!(i % 3)) /* Every third line do a newline */
--           {
--               printf("\n##   ");
--           }
--        printf("tmdbufs%d: %#hX ", (i+1), (int) p->tmdbufs[i]);
--    }
--    printf("##   ");
--
--    for(i = 0; i < RMDNUM; i++)
--    {
--         if (!(i % 3)) /* Every third line do a newline */
--           {
--               printf("\n##   ");
--           }
--        printf("rmdbufs%d: %#hX ", (i+1), (int) p->rmdbufs[i]);
--    }
--    putchar('\n');
--
--} /* End of SK_print_ram() */
--#endif
-diff -Naur grub-0.97.orig/netboot/sk_g16.h grub-0.97/netboot/sk_g16.h
---- grub-0.97.orig/netboot/sk_g16.h	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/sk_g16.h	1970-01-01 00:00:00.000000000 +0000
-@@ -1,168 +0,0 @@
--/*-
-- *
-- * This software may be used and distributed according to the terms
-- * of the GNU Public License, incorporated herein by reference.
-- *
-- * Module         : sk_g16.h
-- * Version        : $Revision: 1.3 $
-- *
-- * Author         : M.Hipp (mhipp at student.uni-tuebingen.de)
-- * changes by     : Patrick J.D. Weichmann
-- *
-- * Date Created   : 94/05/25
-- *
-- * Description    : In here are all necessary definitions of
-- *                  the am7990 (LANCE) chip used for writing a
-- *                  network device driver which uses this chip
-- *
-- * $Log: sk_g16.h,v $
-- * Revision 1.3  2000/07/29 19:22:54  okuji
-- * update the network support to etherboot-4.6.4.
-- *
---*/
--
--#ifndef	SK_G16_H
--
--#define SK_G16_H
--
--
--/*
-- *	Control and Status Register 0 (CSR0) bit definitions
-- *
-- * (R=Readable) (W=Writeable) (S=Set on write) (C-Clear on write)
-- *
-- */
--
--#define CSR0_ERR	0x8000	/* Error summary (R) */
--#define CSR0_BABL	0x4000	/* Babble transmitter timeout error (RC) */
--#define CSR0_CERR	0x2000	/* Collision Error (RC) */
--#define CSR0_MISS	0x1000	/* Missed packet (RC) */
--#define CSR0_MERR	0x0800	/* Memory Error  (RC) */
--#define CSR0_RINT	0x0400	/* Receiver Interrupt (RC) */
--#define CSR0_TINT       0x0200	/* Transmit Interrupt (RC) */
--#define CSR0_IDON	0x0100	/* Initialization Done (RC) */
--#define CSR0_INTR	0x0080	/* Interrupt Flag (R) */
--#define CSR0_INEA	0x0040	/* Interrupt Enable (RW) */
--#define CSR0_RXON	0x0020	/* Receiver on (R) */
--#define CSR0_TXON	0x0010  /* Transmitter on (R) */
--#define CSR0_TDMD	0x0008	/* Transmit Demand (RS) */
--#define CSR0_STOP	0x0004	/* Stop (RS) */
--#define CSR0_STRT	0x0002	/* Start (RS) */
--#define CSR0_INIT	0x0001	/* Initialize (RS) */
--
--#define CSR0_CLRALL     0x7f00  /* mask for all clearable bits */
--
--/*
-- *    Control and Status Register 3 (CSR3) bit definitions
-- *
-- */
--
--#define CSR3_BSWAP	0x0004	/* Byte Swap (RW) */
--#define CSR3_ACON	0x0002  /* ALE Control (RW) */
--#define CSR3_BCON	0x0001	/* Byte Control (RW) */
--
--/*
-- *	Initialization Block Mode operation Bit Definitions.
-- */
--
--#define MODE_PROM	0x8000	/* Promiscuous Mode */
--#define MODE_INTL	0x0040  /* Internal Loopback */
--#define MODE_DRTY	0x0020  /* Disable Retry */
--#define MODE_COLL	0x0010	/* Force Collision */
--#define MODE_DTCR	0x0008	/* Disable Transmit CRC) */
--#define MODE_LOOP	0x0004	/* Loopback */
--#define MODE_DTX	0x0002	/* Disable the Transmitter */
--#define MODE_DRX	0x0001  /* Disable the Receiver */
--
--#define MODE_NORMAL	0x0000  /* Normal operation mode */
--
--/*
-- *	Receive message descriptor status bit definitions.
-- */
--
--#define RX_OWN		0x80	/* Owner bit 0 = host, 1 = lance */
--#define RX_ERR		0x40	/* Error Summary */
--#define RX_FRAM		0x20	/* Framing Error */
--#define RX_OFLO		0x10	/* Overflow Error */
--#define RX_CRC		0x08	/* CRC Error */
--#define RX_BUFF		0x04	/* Buffer Error */
--#define RX_STP		0x02	/* Start of Packet */
--#define RX_ENP		0x01	/* End of Packet */
--
--
--/*
-- *	Transmit message descriptor status bit definitions.
-- */
--
--#define TX_OWN		0x80	/* Owner bit 0 = host, 1 = lance */
--#define TX_ERR		0x40    /* Error Summary */
--#define TX_MORE		0x10	/* More the 1 retry needed to Xmit */
--#define TX_ONE		0x08	/* One retry needed to Xmit */
--#define TX_DEF		0x04	/* Deferred */
--#define TX_STP		0x02	/* Start of Packet */
--#define TX_ENP		0x01	/* End of Packet */
--
--/*
-- *      Transmit status (2) (valid if TX_ERR == 1)
-- */
--
--#define TX_BUFF		0x8000  /* Buffering error (no ENP) */
--#define TX_UFLO		0x4000  /* Underflow (late memory) */
--#define TX_LCOL		0x1000  /* Late collision */
--#define TX_LCAR		0x0400  /* Loss of Carrier */
--#define TX_RTRY		0x0200  /* Failed after 16 retransmissions  */
--#define TX_TDR          0x003f  /* Time-domain-reflectometer-value */
--
--
--/*
-- * Structures used for Communication with the LANCE
-- */
--
--/* LANCE Initialize Block */
--
--struct init_block
--{
--  unsigned short mode;     /* Mode Register */
--  unsigned char  paddr[6]; /* Physical Address (MAC) */
--  unsigned char  laddr[8]; /* Logical Filter Address (not used) */
--  unsigned int   rdrp;     /* Receive Descriptor Ring pointer */
--  unsigned int   tdrp;     /* Transmit Descriptor Ring pointer */
--};
--
--
--/* Receive Message Descriptor Entry */
--
--struct rmd
--{
--  union rmd_u
--  {
--    unsigned long buffer;     /* Address of buffer */
--    struct rmd_s
--    {
--      unsigned char unused[3];
--      unsigned volatile char status;   /* Status Bits */
--    } s;
--  } u;
--  volatile short blen;        /* Buffer Length (two's complement) */
--  unsigned short mlen;        /* Message Byte Count */
--};
--
--
--/* Transmit Message Descriptor Entry */
--
--struct tmd
--{
--  union tmd_u
--  {
--    unsigned long  buffer;    /* Address of buffer */
--    struct tmd_s
--    {
--      unsigned char unused[3];
--      unsigned volatile char status;   /* Status Bits */
--    } s;
--  } u;
--  unsigned short blen;             /* Buffer Length (two's complement) */
--  unsigned volatile short status2; /* Error Status Bits */
--};
--
--#endif	/* End of SK_G16_H */
-diff -Naur grub-0.97.orig/netboot/smc9000.c grub-0.97/netboot/smc9000.c
---- grub-0.97.orig/netboot/smc9000.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/smc9000.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/smc9000.c
+===================================================================
+--- a/netboot/smc9000.c
++++ /dev/null
 @@ -1,522 +0,0 @@
 - /*------------------------------------------------------------------------
 - * smc9000.c
@@ -36089,9 +33656,10 @@ diff -Naur grub-0.97.orig/netboot/smc9000.c grub-0.97/netboot/smc9000.c
 -
 -
 -
-diff -Naur grub-0.97.orig/netboot/smc9000.h grub-0.97/netboot/smc9000.h
---- grub-0.97.orig/netboot/smc9000.h	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/smc9000.h	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/smc9000.h
+===================================================================
+--- a/netboot/smc9000.h
++++ /dev/null
 @@ -1,205 +0,0 @@
 -/*------------------------------------------------------------------------
 - * smc9000.h
@@ -36298,9 +33866,10 @@ diff -Naur grub-0.97.orig/netboot/smc9000.h grub-0.97/netboot/smc9000.h
 -
 -#endif	/* _SMC_9000_H_ */
 -
-diff -Naur grub-0.97.orig/netboot/stdint.h grub-0.97/netboot/stdint.h
---- grub-0.97.orig/netboot/stdint.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/stdint.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/stdint.h
+===================================================================
+--- /dev/null
++++ b/netboot/stdint.h
 @@ -0,0 +1,18 @@
 +#ifndef STDINT_H
 +#define STDINT_H
@@ -36320,9 +33889,10 @@ diff -Naur grub-0.97.orig/netboot/stdint.h grub-0.97/netboot/stdint.h
 +typedef signed long long   int64_t;
 +
 +#endif /* STDINT_H */
-diff -Naur grub-0.97.orig/netboot/tftp.h grub-0.97/netboot/tftp.h
---- grub-0.97.orig/netboot/tftp.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/tftp.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/tftp.h
+===================================================================
+--- /dev/null
++++ b/netboot/tftp.h
 @@ -0,0 +1,82 @@
 +#ifndef	_TFTP_H
 +#define	_TFTP_H
@@ -36406,9 +33976,10 @@ diff -Naur grub-0.97.orig/netboot/tftp.h grub-0.97/netboot/tftp.h
 +int tftp_file_read(const char *name, read_actor_t);
 +
 +#endif	/* _TFTP_H */
-diff -Naur grub-0.97.orig/netboot/tg3.c grub-0.97/netboot/tg3.c
---- grub-0.97.orig/netboot/tg3.c	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/tg3.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/tg3.c
+===================================================================
+--- /dev/null
++++ b/netboot/tg3.c
 @@ -0,0 +1,3322 @@
 +/* $Id: grub-0.95-diskless-patch-2.patch,v 1.1.1.1 2005/06/14 08:18:50 wesolows Exp $
 + * tg3.c: Broadcom Tigon3 ethernet driver.
@@ -39732,9 +37303,10 @@ diff -Naur grub-0.97.orig/netboot/tg3.c grub-0.97/netboot/tg3.c
 +	.id_count = sizeof(tg3_nics)/sizeof(tg3_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/tg3.h grub-0.97/netboot/tg3.h
---- grub-0.97.orig/netboot/tg3.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/tg3.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/tg3.h
+===================================================================
+--- /dev/null
++++ b/netboot/tg3.h
 @@ -0,0 +1,2203 @@
 +/* $Id: grub-0.95-diskless-patch-2.patch,v 1.1.1.1 2005/06/14 08:18:50 wesolows Exp $
 + * tg3.h: Definitions for Broadcom Tigon3 ethernet driver.
@@ -41939,9 +39511,10 @@ diff -Naur grub-0.97.orig/netboot/tg3.h grub-0.97/netboot/tg3.h
 +};
 +
 +#endif /* !(_T3_H) */
-diff -Naur grub-0.97.orig/netboot/tiara.c grub-0.97/netboot/tiara.c
---- grub-0.97.orig/netboot/tiara.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/tiara.c	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/tiara.c
+===================================================================
+--- a/netboot/tiara.c
++++ /dev/null
 @@ -1,255 +0,0 @@
 -/**************************************************************************
 -Etherboot -  BOOTP/TFTP Bootstrap Program
@@ -42198,9 +39771,10 @@ diff -Naur grub-0.97.orig/netboot/tiara.c grub-0.97/netboot/tiara.c
 -	else
 -		return (0);
 -}
-diff -Naur grub-0.97.orig/netboot/timer.c grub-0.97/netboot/timer.c
---- grub-0.97.orig/netboot/timer.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/timer.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/timer.c
+===================================================================
+--- a/netboot/timer.c
++++ b/netboot/timer.c
 @@ -6,122 +6,24 @@
   * published by the Free Software Foundation; either version 2, or (at
   * your option) any later version.
@@ -42335,9 +39909,10 @@ diff -Naur grub-0.97.orig/netboot/timer.c grub-0.97/netboot/timer.c
  }
 -
 -#endif /* RTC_CURRTICKS */
-diff -Naur grub-0.97.orig/netboot/timer.h grub-0.97/netboot/timer.h
---- grub-0.97.orig/netboot/timer.h	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/timer.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/timer.h
+===================================================================
+--- a/netboot/timer.h
++++ b/netboot/timer.h
 @@ -36,7 +36,8 @@
  #define	BCD_COUNT	0x01
  
@@ -42379,9 +39954,10 @@ diff -Naur grub-0.97.orig/netboot/timer.h grub-0.97/netboot/timer.h
 +};
  
  #endif	/* TIMER_H */
-diff -Naur grub-0.97.orig/netboot/tlan.c grub-0.97/netboot/tlan.c
---- grub-0.97.orig/netboot/tlan.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/tlan.c	2005-09-01 00:05:20.000000000 +0000
+Index: b/netboot/tlan.c
+===================================================================
+--- a/netboot/tlan.c
++++ b/netboot/tlan.c
 @@ -1,3746 +1,1814 @@
 +#define EB51
 +
@@ -47600,9 +45176,10 @@ diff -Naur grub-0.97.orig/netboot/tlan.c grub-0.97/netboot/tlan.c
 +	.class = 0,
 +};
  #endif
-diff -Naur grub-0.97.orig/netboot/tlan.h grub-0.97/netboot/tlan.h
---- grub-0.97.orig/netboot/tlan.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/tlan.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/tlan.h
+===================================================================
+--- /dev/null
++++ b/netboot/tlan.h
 @@ -0,0 +1,536 @@
 +/**************************************************************************
 +*
@@ -48140,9 +45717,10 @@ diff -Naur grub-0.97.orig/netboot/tlan.h grub-0.97/netboot/tlan.h
 +}
 +
 +#endif				/* I_LIKE_A_FAST_HASH_FUNCTION */
-diff -Naur grub-0.97.orig/netboot/tulip.c grub-0.97/netboot/tulip.c
---- grub-0.97.orig/netboot/tulip.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/tulip.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/tulip.c
+===================================================================
+--- a/netboot/tulip.c
++++ b/netboot/tulip.c
 @@ -48,6 +48,7 @@
  /*********************************************************************/
  
@@ -48619,9 +46197,10 @@ diff -Naur grub-0.97.orig/netboot/tulip.c grub-0.97/netboot/tulip.c
 +	.id_count = sizeof(tulip_nics)/sizeof(tulip_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/netboot/tulip.txt grub-0.97/netboot/tulip.txt
---- grub-0.97.orig/netboot/tulip.txt	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/tulip.txt	1970-01-01 00:00:00.000000000 +0000
+Index: b/netboot/tulip.txt
+===================================================================
+--- a/netboot/tulip.txt
++++ /dev/null
 @@ -1,53 +0,0 @@
 -This software may be used and distributed according to the terms of
 -the GNU Public License, incorporated herein by reference.
@@ -48676,9 +46255,10 @@ diff -Naur grub-0.97.orig/netboot/tulip.txt grub-0.97/netboot/tulip.txt
 -Marty Connor
 -mdc at thinguin.org
 -http://www.thinguin.org/
-diff -Naur grub-0.97.orig/netboot/types.h grub-0.97/netboot/types.h
---- grub-0.97.orig/netboot/types.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/types.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/types.h
+===================================================================
+--- /dev/null
++++ b/netboot/types.h
 @@ -0,0 +1,44 @@
 +#ifndef _TYPES_H
 +#define _TYPES_H
@@ -48724,9 +46304,10 @@ diff -Naur grub-0.97.orig/netboot/types.h grub-0.97/netboot/types.h
 +typedef char * caddr_t;
 +
 +#endif /* _TYPES_H */
-diff -Naur grub-0.97.orig/netboot/udp.h grub-0.97/netboot/udp.h
---- grub-0.97.orig/netboot/udp.h	1970-01-01 00:00:00.000000000 +0000
-+++ grub-0.97/netboot/udp.h	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/udp.h
+===================================================================
+--- /dev/null
++++ b/netboot/udp.h
 @@ -0,0 +1,30 @@
 +#ifndef	_UDP_H
 +#define	_UDP_H
@@ -48758,9 +46339,10 @@ diff -Naur grub-0.97.orig/netboot/udp.h grub-0.97/netboot/udp.h
 +			unsigned int __destsock, int __len, const void * __buf);
 +
 +#endif	/* _UDP_H */
-diff -Naur grub-0.97.orig/netboot/via-rhine.c grub-0.97/netboot/via-rhine.c
---- grub-0.97.orig/netboot/via-rhine.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/via-rhine.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/via-rhine.c
+===================================================================
+--- a/netboot/via-rhine.c
++++ b/netboot/via-rhine.c
 @@ -18,7 +18,7 @@
  
  */
@@ -49118,9 +46700,10 @@ diff -Naur grub-0.97.orig/netboot/via-rhine.c grub-0.97/netboot/via-rhine.c
 +};
 +
  /* EOF via-rhine.c */
-diff -Naur grub-0.97.orig/netboot/w89c840.c grub-0.97/netboot/w89c840.c
---- grub-0.97.orig/netboot/w89c840.c	2003-07-09 11:45:38.000000000 +0000
-+++ grub-0.97/netboot/w89c840.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/netboot/w89c840.c
+===================================================================
+--- a/netboot/w89c840.c
++++ b/netboot/w89c840.c
 @@ -43,6 +43,9 @@
   *                                       using timer2 routines. Proposed
   *                                       by Ken Yap to eliminate CPU speed
@@ -49467,9 +47050,10 @@ diff -Naur grub-0.97.orig/netboot/w89c840.c grub-0.97/netboot/w89c840.c
 +	.id_count = sizeof(w89c840_nics)/sizeof(w89c840_nics[0]),
 +	.class    = 0,
 +};
-diff -Naur grub-0.97.orig/stage2/disk_io.c grub-0.97/stage2/disk_io.c
---- grub-0.97.orig/stage2/disk_io.c	2004-05-23 16:35:24.000000000 +0000
-+++ grub-0.97/stage2/disk_io.c	2005-08-31 19:03:35.000000000 +0000
+Index: b/stage2/disk_io.c
+===================================================================
+--- a/stage2/disk_io.c
++++ b/stage2/disk_io.c
 @@ -25,6 +25,7 @@
  #ifdef SUPPORT_NETBOOT
  # define GRUB	1
diff --git a/boot/grub/grub.mk b/boot/grub/grub.mk
index eb066af..7653e5b 100644
--- a/boot/grub/grub.mk
+++ b/boot/grub/grub.mk
@@ -6,8 +6,8 @@
 
 GRUB_VERSION = 0.97
 GRUB_SOURCE = grub_$(GRUB_VERSION).orig.tar.gz
-GRUB_PATCH  = grub_$(GRUB_VERSION)-35.diff.gz
-GRUB_SITE   = http://snapshot.debian.org/archive/debian/20080329T000000Z/pool/main/g/grub/
+GRUB_PATCH  = grub_$(GRUB_VERSION)-67.diff.gz
+GRUB_SITE   = http://snapshot.debian.org/archive/debian/20130129T225227Z/pool/main/g/grub/
 
 GRUB_LICENSE = GPLv2+
 GRUB_LICENSE_FILES = COPYING
@@ -61,7 +61,7 @@ GRUB_CONFIG-y = \
 
 define GRUB_DEBIAN_PATCHES
 	# Apply the patches from the Debian patch
-	(cd $(@D) ; for f in `cat debian/patches/00list | grep -v ^#` ; do \
+	(cd $(@D) ; for f in `cat debian/patches/series | grep -v ^#` ; do \
 		cat debian/patches/$$f | patch -g0 -p1 ; \
 	done)
 endef
-- 
1.8.1.2
