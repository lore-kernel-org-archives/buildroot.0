From: Steve Kenton <skenton@ou.edu>
Date: Thu, 19 Feb 2015 10:25:28 -0600
Subject: [Buildroot] [RFC] new package: dvd+rw-tools and multiple back ends
Message-ID: <54E60E78.7060004@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using the dvd+rw-tools package and would like to get it into buildroot.
The problem is that it does not do it's own disc media manipulations but
rather uses a back end package to handle it. I'm unsure how to proceed.

The default back end package is cdrtools which is not in buildroot and will
likely be hard to add. I've hacked up a local x86 install that I can use.

The LFS project uses the xorriso package as a back end and xorriso has now
been merged into buildroot.

Ubuntu uses the cdrkit package as a backend and cdrkit has been part of
buildroot for a while.

I've used all 3 back ends and they all have their strengths and weakness.

Beside being difficult to add to buildroot there are license issues with
cdrtools which makes it unattractive to some users. Development has been
quite slow for several years but the package still works well.

Xorriso is being actively developed and is quite capable with the execption
that is does not currently support the UDF (DVD/BD) video disc format. The
LFS project used xorriso as the back end for dvd+rw-tools.

Cdrkit is an essentially frozen old fork of cdrtools from before the change
in it's license. But, it's already part of buildroot and it's also the
back end that Ubuntu uses for dvd+rw-tools. They don't patch dvd+rw-t0ols
like LFS does, but rather make symlinks from the cdrkit programs to the
corresponding names from cdrtools that dvd+rw-tools uses by default.

I started to try and add build time selection but that turns out to be
strongly discouraged. Below are the .in, .mk and .patch files as they
currently stand. The limits.h patch is always needed so I kept it separate,
the others are up for discussion. Shred away.

config BR2_PACKAGE_DVDRW_TOOLS
	bool "dvdrw-tools"
	depends on BR2_USE_WCHAR
	depends on BR2_LARGEFILE
	depends on BR2_TOOLCHAIN_HAS_THREADS
	depends on BR2_USE_MMU # fork()
	help
	  The dvd+rw-tools are used to master Blu-ray Disc
	  and DVD Disc media, both +RW/+R and -RW/-R. The
	  +RW in the name is a historical artifact. This
	  package contains the widely used growisofs program.

	  Because dvd+rw-tools does not directly interact with
	  disc media it has to use a separate back end package.
	  The default back end is the cdrtools package. However
	  the cdrtools package is not currently in buildroot
	  and is likely to be very difficult to add properly.

	  As is done by LFS this version has been patched to
	  use xorriso as the media back end instead of cdrtools.
	  NOTE: xorriso does not currently support UDF.
	  An alternate patch is available to use cdrkit instead
	  as is done by Ubuntu.
	
	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools

comment "dvdrw-tools needs a toolchain w/ wchar, largefile"
	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE \
		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU
choice
	prompt "Media Backend"
	default PACKAGE_CDRTOOLS
	help
	  Choose which media backend dvd+rw-tools will use

config PACKAGE_CDRTOOLS
	bool "dvdrw-cdrtools"
	help
	  Use the default cdrtools package

config PACKAGE_CDRKIT
	bool "dvdrw-cdrkit"
	help
	  Replace cdrtools with the cdrkit package

config PACKAGE_XORRISO
	bool "dvdrw-xorriso"
	help
	  Replace cdrtools with the xorriso package

endchoice
################################################################################
#
# dvdrw-tools
#
################################################################################

DVDRW_TOOLS_VERSION = 7.1
DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
DVDRW_TOOLS_LICENSE = GPLv2
DVDRW_TOOLS_LICENSE_FILES = LICENSE

define DVDRW_TOOLS_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define DVDRW_TOOLS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/dvd-ram-control $(TARGET_DIR)/usr/bin/dvd-ram-control
	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-booktype $(TARGET_DIR)/usr/bin/dvd+rw-booktype
	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-format $(TARGET_DIR)/usr/bin/dvd+rw-format
	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-mediainfo $(TARGET_DIR)/usr/bin/dvd+rw-mediainfo
	$(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
endef

$(eval $(generic-package))

diff -pruN dvd+rw-tools-7.1.ori/transport.hxx dvd+rw-tools-7.1/transport.hxx
--- dvd+rw-tools-7.1.ori/transport.hxx	2008-03-01 04:34:43.000000000 -0600
+++ dvd+rw-tools-7.1/transport.hxx	2015-01-18 15:47:24.245863631 -0600
@@ -9,6 +9,7 @@
 #if defined(__unix) || defined(__unix__)
 #include <stdio.h>
 #include <stdlib.h>
+#include <limits.h>
 #include <unistd.h>
 #include <string.h>
 #include <sys/types.h>
@@ -40,6 +41,7 @@ inline long getmsecs()
 #include <stddef.h>
 #include <stdio.h>
 #include <stdlib.h>
+#include <limits.h>
 #define ssize_t		LONG_PTR
 #define off64_t		__int64

diff -pruN dvd+rw-tools-7.1.ori/growisofs.c dvd+rw-tools-7.1/growisofs.c
--- dvd+rw-tools-7.1.ori/growisofs.c	2008-03-04 03:15:03.000000000 -0600
+++ dvd+rw-tools-7.1/growisofs.c	2015-01-17 23:33:27.178239162 -0600
@@ -2724,7 +2724,7 @@ void pipe_mkisofs_up (char *mkisofs_argv
         perror (":-( unable to create pipe"), exit(FATAL_START(errno));

     if ((mkisofs_pid=fork ()) == (pid_t)-1)
-	perror (":-( unable to fork mkisofs"), exit(FATAL_START(errno));
+	perror (":-( unable to fork xorrisofs"), exit(FATAL_START(errno));
     else if (mkisofs_pid == 0)
     {	dup2  (fildes[1],1);
 	close (fildes[0]);
@@ -2964,7 +2964,7 @@ int main (int argc, char *argv[])

 #if defined(__unix) || defined(__unix__)
     env = getenv ("MKISOFS");
-    mkisofs_argv[0] = (env?env:"mkisofs");
+    mkisofs_argv[0] = (env?env:"xorrisofs");
 #elif defined(_WIN32)
     /*
      * On Windows I insist on mkisofs.exe to reside in very same


diff -pruN dvd+rw-tools-7.1.ori/growisofs.c dvd+rw-tools-7.1/growisofs.c
--- dvd+rw-tools-7.1.ori/growisofs.c	2008-03-04 03:15:03.000000000 -0600
+++ dvd+rw-tools-7.1/growisofs.c	2015-01-17 23:33:27.178239162 -0600
@@ -2724,7 +2724,7 @@ void pipe_mkisofs_up (char *mkisofs_argv
         perror (":-( unable to create pipe"), exit(FATAL_START(errno));

     if ((mkisofs_pid=fork ()) == (pid_t)-1)
-	perror (":-( unable to fork mkisofs"), exit(FATAL_START(errno));
+	perror (":-( unable to fork genisoimage"), exit(FATAL_START(errno));
     else if (mkisofs_pid == 0)
     {	dup2  (fildes[1],1);
 	close (fildes[0]);
@@ -2964,7 +2964,7 @@ int main (int argc, char *argv[])

 #if defined(__unix) || defined(__unix__)
     env = getenv ("MKISOFS");
-    mkisofs_argv[0] = (env?env:"mkisofs");
+    mkisofs_argv[0] = (env?env:"genisoimage");
 #elif defined(_WIN32)
     /*
      * On Windows I insist on mkisofs.exe to reside in very same
