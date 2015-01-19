From: Steve Kenton <skenton@ou.edu>
Date: Mon, 19 Jan 2015 15:43:14 -0600
Subject: [Buildroot] [PATCH V5] dvd+rw-tools: new package
Message-ID: <54BD7A72.2060304@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The dvd+rw-tools are used to master Blu-ray Disc
and DVD Disc media, both +RW/+R and -RW/-R. The
+RW in the name is a historical artifact. This
package contains the widely used growisofs program.
	
http://fy.chalmers.se/~appro/linux/DVD+RW/tools

Patch to dvd+rw-tools mkisofs->xorrisofs based on LFS instructions.
http://www.linuxfromscratch.org/blfs/view/svn/multimedia/dvd-rw-tools.html

sed -i '/stdlib/a #include <limits.h>' transport.hxx &&
sed -i 's#mkisofs"#xorrisofs"#' growisofs.c &&
sed -i 's#mkisofs#xorrisofs#;s#MKISOFS#XORRISOFS#' growisofs.1 &&

Signed-off-by Stephen M. Kenton <skenton@ou.edu>
---
The xorriso dependency is only needed at run time, not build time
so it is selected in Config.in but not a dependency in dvdrw-tools.mk

Is there a good way to select between two alternate patches at build time?
I'd like to give people the option of both xorriso and cdrtools backends
The only buildroot difference is which of two patches gets applied at build time.

V5 - with the patch for xorriso backend instead of cdrtools - oops

V4 - added mmu and thread dependencies and locally computed hash file

V3 - added xorriso dependency and followed LFS directions
     for replacing cdrtools with GNU xorriso

V2 - added the licensing information

diff -pruN buildroot.ori/package/Config.in buildroot/package/Config.in
--- buildroot.ori/package/Config.in	2015-01-16 15:37:56.000000000 -0600
+++ buildroot/package/Config.in	2015-01-19 15:38:29.877609340 -0600
@@ -7,6 +7,7 @@ menu "Audio and video applications"
 	source "package/aumix/Config.in"
 	source "package/bellagio/Config.in"
 	source "package/dvdauthor/Config.in"
+	source "package/dvdrw-tools/Config.in"
 	source "package/espeak/Config.in"
 	source "package/faad2/Config.in"
 	source "package/ffmpeg/Config.in"
diff -pruN buildroot.ori/package/dvdrw-tools/0001-xorriso_and_limits.h.patch buildroot/package/dvdrw-tools/0001-xorriso_and_limits.h.patch
--- buildroot.ori/package/dvdrw-tools/0001-xorriso_and_limits.h.patch	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/0001-xorriso_and_limits.h.patch	2015-01-19 15:38:09.905608957 -0600
@@ -0,0 +1,159 @@
+diff -pruN dvd+rw-tools-7.1.ori/growisofs.1 dvd+rw-tools-7.1/growisofs.1
+--- dvd+rw-tools-7.1.ori/growisofs.1	2008-03-01 04:40:06.000000000 -0600
++++ dvd+rw-tools-7.1/growisofs.1	2015-01-17 23:33:49.442239589 -0600
+@@ -1,6 +1,6 @@
+ .TH GROWISOFS 1m "1 Mar 2008" "growisofs 7.1"
+ .SH NAME
+-growisofs \- combined mkisofs frontend/DVD recording program.
++growisofs \- combined xorrisofs frontend/DVD recording program.
+ .SH SYNOPSIS
+ .B growisofs
+ [\fB\-dry\-run\fP]
+@@ -9,10 +9,10 @@ growisofs \- combined mkisofs frontend/D
+ [\fB\-speed=1\fP]
+ \-[\fBZ|M\fP]
+ .I /dev/dvd
+-.I <mkisofs-options>
++.I <xorrisofs-options>
+
+ .SH DESCRIPTION
+-\fBgrowisofs\fP was originally designed as a frontend to \fBmkisofs\fP
++\fBgrowisofs\fP was originally designed as a frontend to \fBxorrisofs\fP
+ to facilitate appending of data to ISO9660 volumes residing on
+ random-access media such as DVD+RW, DVD\-RAM, plain files, hard disk
+ partitions. In the course of development general purpose DVD recording
+@@ -35,7 +35,7 @@ EXAMPLES section for further details.
+ Merge a new session to an existing one.
+ .TP
+ .BI \-version
+-Print version information and invoke \fBmkisofs\fP, also with \-version
++Print version information and invoke \fBxorrisofs\fP, also with \-version
+ option.
+ .TP
+ .BI \-dvd\-compat
+@@ -47,7 +47,7 @@ explicitly burn [otherwise optional] lea
+ .BI \-dry\-run
+ At dry\-run \fBgrowisofs\fP performs all the steps till, but not
+ including the first write operation. Most notably check for "overburn"
+-condition is performed, which implies that mkisofs is invoked and
++condition is performed, which implies that xorrisofs is invoked and
+ terminated prematurely.
+ .TP
+ .BI \-overburn
+@@ -68,8 +68,8 @@ be found in \fBdvd+rw\-mediainfo\fP outp
+ recordings are commonly performed at ~1/2 of advertised speed, because
+ of defect management being in effect.
+ .TP
+-.BI <mkisofs-options>
+-More options can be found in the manpage for \fBmkisofs\fP.
++.BI <xorrisofs-options>
++More options can be found in the manpage for \fBxorrisofs\fP.
+
+ .P
+ There are several undocumented options commonly denoted with
+@@ -82,7 +82,7 @@ these options undocumented is that those
+ need to use them directly can as well consult the source code or obtain
+ specific instructions elsewhere.
+
+-.SH DIFFERENCES WITH RUNNING MKISOFS DIRECTLY
++.SH DIFFERENCES WITH RUNNING XORRISOFS DIRECTLY
+ .P
+ When using growisofs you may not use the
+ .B \-o
+@@ -99,13 +99,13 @@ will construct one for you;
+ Otherwise everything that applies to
+ .I [multisession]
+ mastering with
+-.B mkisofs
++.B xorrisofs
+ applies to
+ .B growisofs
+ as well.
+ .B growisofs
+ needs at least
+-.B mkisofs
++.B xorrisofs
+ version 1.14, version 2.0 is required for multisession write-once
+ recordings.
+
+@@ -146,12 +146,12 @@ command name is not intuitive in this co
+ .SH NOTES
+ If executed under sudo(8) growisofs refuses to start. This is done for
+ the following reason. Naturally growisofs has to access the data set to
+-be recorded to optical media, either indirectly by letting mkisofs
++be recorded to optical media, either indirectly by letting xorrisofs
+ generate ISO9660 layout on-the-fly or directly if a pre-mastered image
+ is to be recorded. Being executed under sudo(8), growisofs effectively
+ grants sudoers read access to \fIany\fP file in the file system. The
+-situation is intensified by the fact that growisofs parses MKISOFS
+-environment variable in order to determine alternative path to mkisofs
++situation is intensified by the fact that growisofs parses XORRISOFS
++environment variable in order to determine alternative path to xorrisofs
+ executable image. This means that being executed under sudo(8),
+ growisofs effectively grants sudoers right to execute program of their
+ choice with elevated privileges. If you for any reason still find the
+@@ -162,13 +162,13 @@ real growisofs binary.
+ .nf
+ 	#!/bin/ksh
+ 	unset SUDO_COMMAND
+-	export MKISOFS=/path/to/trusted/mkisofs
++	export XORRISOFS=/path/to/trusted/xorrisofs
+ 	exec growisofs "$@"
+ .fi
+
+ But note that the recommended alternative to the above "workaround" is
+ actually to install growisofs set\-root\-uid, in which case it will drop
+-privileges prior accessing data or executing mkisofs in order to
++privileges prior accessing data or executing xorrisofs in order to
+ preclude unauthorized access to the data.
+
+ If the media already carries isofs and \fBgrowisofs\fP is invoked with
+@@ -214,7 +214,7 @@ it gets pre-formatted with minimal spare
+ Most up-to-date information on dvd+rw\-tools is available at
+ http://fy.chalmers.se/~appro/linux/DVD+RW/.
+ .PP
+-The manpage for \fBmkisofs\fP.
++The manpage for \fBxorrisofs\fP.
+
+ .SH AUTHORS
+ Andy Polyakov <appro@fy.chalmers.se> stands for programming and on-line
+diff -pruN dvd+rw-tools-7.1.ori/growisofs.c dvd+rw-tools-7.1/growisofs.c
+--- dvd+rw-tools-7.1.ori/growisofs.c	2008-03-04 03:15:03.000000000 -0600
++++ dvd+rw-tools-7.1/growisofs.c	2015-01-17 23:33:27.178239162 -0600
+@@ -2724,7 +2724,7 @@ void pipe_mkisofs_up (char *mkisofs_argv
+         perror (":-( unable to create pipe"), exit(FATAL_START(errno));
+
+     if ((mkisofs_pid=fork ()) == (pid_t)-1)
+-	perror (":-( unable to fork mkisofs"), exit(FATAL_START(errno));
++	perror (":-( unable to fork xorrisofs"), exit(FATAL_START(errno));
+     else if (mkisofs_pid == 0)
+     {	dup2  (fildes[1],1);
+ 	close (fildes[0]);
+@@ -2964,7 +2964,7 @@ int main (int argc, char *argv[])
+
+ #if defined(__unix) || defined(__unix__)
+     env = getenv ("MKISOFS");
+-    mkisofs_argv[0] = (env?env:"mkisofs");
++    mkisofs_argv[0] = (env?env:"xorrisofs");
+ #elif defined(_WIN32)
+     /*
+      * On Windows I insist on mkisofs.exe to reside in very same
+diff -pruN dvd+rw-tools-7.1.ori/transport.hxx dvd+rw-tools-7.1/transport.hxx
+--- dvd+rw-tools-7.1.ori/transport.hxx	2008-03-01 04:34:43.000000000 -0600
++++ dvd+rw-tools-7.1/transport.hxx	2015-01-17 23:33:13.078238891 -0600
+@@ -9,6 +9,7 @@
+ #if defined(__unix) || defined(__unix__)
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <limits.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <sys/types.h>
+@@ -40,6 +41,7 @@ inline long getmsecs()
+ #include <stddef.h>
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <limits.h>
+ #define ssize_t		LONG_PTR
+ #define off64_t		__int64
+
diff -pruN buildroot.ori/package/dvdrw-tools/Config.in buildroot/package/dvdrw-tools/Config.in
--- buildroot.ori/package/dvdrw-tools/Config.in	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/Config.in	2015-01-19 15:38:09.905608957 -0600
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_DVDRW_TOOLS
+	bool "dvdrw-tools"
+	select BR2_PACKAGE_XORRISO
+	depends on BR2_USE_WCHAR
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	help
+	  The dvd+rw-tools are used to master Blu-ray Disc
+	  and DVD Disc media, both +RW/+R and -RW/-R. The
+	  +RW in the name is a historical artifact. This
+	  package contains the widely used growisofs program.
+	
+	  http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+
+comment "dvdrw-tools needs a toolchain w/ wchar, largefile"
+	depends on !BR2_USE_WCHAR || !BR2_LARGEFILE \
+		|| !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_MMU
diff -pruN buildroot.ori/package/dvdrw-tools/dvdrw-tools.hash buildroot/package/dvdrw-tools/dvdrw-tools.hash
--- buildroot.ori/package/dvdrw-tools/dvdrw-tools.hash	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/dvdrw-tools.hash	2015-01-19 15:38:09.905608957 -0600
@@ -0,0 +1,4 @@
+# Locally computed using openssl dgst
+md5	8acb3c885c87f6838704a0025e435871	dvd+rw-tools-7.1.tar.gz
+sha1	6400e013934ff589b4b224eced03fd9f42ed719b	dvd+rw-tools-7.1.tar.gz
+
diff -pruN buildroot.ori/package/dvdrw-tools/dvdrw-tools.mk buildroot/package/dvdrw-tools/dvdrw-tools.mk
--- buildroot.ori/package/dvdrw-tools/dvdrw-tools.mk	1969-12-31 18:00:00.000000000 -0600
+++ buildroot/package/dvdrw-tools/dvdrw-tools.mk	2015-01-19 15:38:09.905608957 -0600
@@ -0,0 +1,24 @@
+#############################################################
+#
+# dvdrw-tools
+#
+#############################################################
+DVDRW_TOOLS_VERSION = 7.1
+DVDRW_TOOLS_SOURCE = dvd+rw-tools-$(DVDRW_TOOLS_VERSION).tar.gz
+DVDRW_TOOLS_SITE = http://fy.chalmers.se/~appro/linux/DVD+RW/tools
+DVDRW_TOOLS_LICENSE = GPLv2
+DVDRW_TOOLS_LICENSE_FILES = LICENSE
+
+define DVDRW_TOOLS_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+define DVDRW_TOOLS_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/dvd-ram-control $(TARGET_DIR)/usr/bin/dvd-ram-control
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-booktype $(TARGET_DIR)/usr/bin/dvd+rw-booktype
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-format $(TARGET_DIR)/usr/bin/dvd+rw-format
+	$(INSTALL) -m 0755 -D $(@D)/dvd+rw-mediainfo $(TARGET_DIR)/usr/bin/dvd+rw-mediainfo
+	$(INSTALL) -m 0755 -D $(@D)/growisofs $(TARGET_DIR)/usr/bin/growisofs
+endef
+
+$(eval $(generic-package))
