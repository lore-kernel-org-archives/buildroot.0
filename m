From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 6 Dec 2007 13:28:25 -0800
Subject: [Buildroot] [buildroot 0001535]: x86_64 kernel target
Message-ID: <911e9de8e5daf2eb4f83e418531be05c@bugs.uclibc.org>
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
Last Modified:              12-06-2007 13:28 PST
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

---------------------------------------------------------------------- 
 kevint - 12-06-07 13:28  
---------------------------------------------------------------------- 
Sorry I couldn't reply sooner- haven't been working on buildroot for a few
weeks.  In response to the note:  won't this pull in the config from the
i386 kernel?

BR2_BOARD_PATH:=target/device/x86/i386 will be set by the i386 Makefile.in
and the linux26.config for i386 would be used.

What do you think about having directories contain patches, configs for
each kernel header option?  Instead of using:

target/device/x86/i386 for the location for linux26.config and
kernel-patches, what if there were directories:

target/device/x86/i386/linux_$DEFAULT_KERNEL_HEADERS (2.6.21, etc)
target/device/x86/i386/linux_default

If DEFAULT_KERNEL_HEADERS were specified, we would first look for a
directory that matched.  If it didn't exist we would use the default.  To
the stock buildroot, linux_default could be populated for all of the
architectures.  People using their own configs, kernel_patches, could
populate directories rather than typing out paths to each in the buildroot
config.

I have had a hard time keeping kernel patches and configs organized in its
current state.  By selecting different headers, I would like it to
automatically negotiate the proper configs and patches for that kernel. 
If there is any interest, I could throw together a proof of concept. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-16-07 14:27  kevint         New Issue                                    
10-16-07 14:27  kevint         Status                   new => assigned     
10-16-07 14:27  kevint         Assigned To               => buildroot       
10-19-07 14:50  bernhardf      Note Added: 0002846                          
10-19-07 14:50  bernhardf      Note View State: public: 2846                    
12-06-07 13:28  kevint         Note Added: 0003049                          
======================================================================
