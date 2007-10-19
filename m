From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 19 Oct 2007 14:50:26 -0700
Subject: [Buildroot] [buildroot 0001535]: x86_64 kernel target
Message-ID: <8f6fee7282a36cf8153da947ec0a1a37@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1535 
====================================================================== 
Reported By:                kevint
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1535
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-16-2007 14:27 PDT
Last Modified:              10-19-2007 14:50 PDT
====================================================================== 
Summary:                    x86_64 kernel target
Description: 
x86_64 variables not set for kernel build process in buildroot.

I have been using this trivial patch for a few months now, and it seems
like it could be useful now (considering building the kernel is now a
default option, even if you select x86_64 architecture):

diff -Naur buildroot/target/device/x86/Makefile.in
buildroot-modified/target/device/x86/Makefile.in
--- buildroot/target/device/x86/Makefile.in     2007-10-16
01:15:16.000000000 -0600
+++ buildroot-modified/target/device/x86/Makefile.in    2007-10-16
10:04:43.000000000 -0600
@@ -1,3 +1,7 @@
 ifeq ($(strip $(BR2_i386)),y)
 include target/device/x86/i386/Makefile.in
 endif
+
+ifeq ($(strip $(BR2_x86_64)),y)
+include target/device/x86/x86_64/Makefile.in
+endif
diff -Naur buildroot/target/device/x86/x86_64/Makefile.in
buildroot-modified/target/device/x86/x86_64/Makefile.in
--- buildroot/target/device/x86/x86_64/Makefile.in      1969-12-31
17:00:00.000000000 -0700
+++ buildroot-modified/target/device/x86/x86_64/Makefile.in     2007-10-16
10:04:12.000000000 -0600
@@ -0,0 +1,19 @@
+BR2_BOARD_PATH:=target/device/x86/x86_64
+
+ifeq ($(strip $(BR2_PACKAGE_LINUX_KCONFIG)),)
+ifndef LINUX26_KCONFIG
+LINUX26_KCONFIG=$(BR2_BOARD_PATH)/linux26.config
+endif
+else
+LINUX26_KCONFIG=$(strip $(BR2_PACKAGE_LINUX_KCONFIG))
+endif
+
+ifeq ($(strip $(BR2_PACKAGE_LINUX_FORMAT)),)
+ifndef LINUX26_FORMAT
+LINUX26_FORMAT=bzImage
+endif
+else
+LINUX26_FORMAT=$(strip $(BR2_PACKAGE_LINUX_FORMAT))
+endif
+
+KERNEL_HEADERS_PATCH_DIR:=$(BR2_BOARD_PATH)/kernel-header-patches

The linux26.config and busybox.config are not included in the patch, but
they should be in the target/device/x86/x86_64 directory.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 10-19-07 14:50  
---------------------------------------------------------------------- 
$ cat target/device/x86/Makefile.in 
ifeq ($(findstring y,$(BR2_i386)$(BR2_x86_64)),y)
include target/device/x86/i386/Makefile.in
endif 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 14:27  kevint         New Issue                                    
10-16-07 14:27  kevint         Status                   new => assigned     
10-16-07 14:27  kevint         Assigned To               => buildroot       
10-19-07 14:50  bernhardf      Note Added: 0002846                          
======================================================================
