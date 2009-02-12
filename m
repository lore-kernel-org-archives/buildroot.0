From: Eric Malkowski <eric@bvwireless.net>
Date: Thu, 12 Feb 2009 16:17:15 -0500
Subject: [Buildroot] Patch to allow menuconfig specified target_skeleton dir
	and device_table.txt
Message-ID: <499491DB.9050406@bvwireless.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm posting this to see if anyone else might benefit from being able to 
select in the buildroot config a target_skeleton and device_table.txt file.
I find it convenient to be able to specify the following via the main 
menuconfig to be able to make my complete project:

buildroot.config
linux-2.6.28.x.config
busybox-1.13.x.config
uClibc-0.9.30.config
target_skeleton
device_table.txt

The first 4 come with buildroot now and are easy to override with your 
own, the last two can be specified in the "Target filesystem Options" 
submenu only when the "Custom target skeleton / device table" option is 
chosen as added by my patch below -- it enables two strings that default 
to the ones in target/generic and the user can override if they wish.

I just override the 6 items above with buildroot config and place the 
files pointed to in a directory and it gets everything I need to build 
up a setup customized for my AMD GeodeLX based boards.  Also -- I don't 
select any "Preset Devices" or "Generic System Support" options on the 
"Target Options" submenu and use a default ext2 rootfs to get a bootable 
kernel and ramdisk.

Note -- SVN revisions below are from my own that has buildroot imported, 
should apply fine to current buildroot.

If you guys don't think this is useful, that's fine too -- curious what 
you think.

svn diff target/Makefile.in target/Config.in
Index: target/Makefile.in
===================================================================
--- target/Makefile.in  (revision 890)
+++ target/Makefile.in  (working copy)
@@ -61,6 +61,13 @@
 include target/x86/Makefile.in
 include target/powerpc/Makefile.in
 
+# Allow custom user specified target_skeleton/device_table.txt to override
+# everything else if chosen in target filesystem options menu
+ifeq ($(BR2_TARGET_CUSTOM_SKELETON),y)
+TARGET_SKELETON=$(subst ",,$(strip $(BR2_TARGET_CUSTOM_SKELETON_DIR)))
+TARGET_DEVICE_TABLE=$(subst ",,$(strip 
$(BR2_TARGET_CUSTOM_SKELETON_DEVICE_TABLE)))
+endif
+
 ifeq ($(BR2_TARGET_UBOOT),y)
 include target/u-boot/Makefile.in
 endif
Index: target/Config.in
===================================================================
--- target/Config.in    (revision 890)
+++ target/Config.in    (working copy)
@@ -12,6 +12,27 @@
        help
          Add a custom string to the end of the root file system name.
 
+config BR2_TARGET_CUSTOM_SKELETON
+       bool "Custom target skeleton / device table"
+       help
+         Some people may wish to use their own modified target skeleton
+         and device_table.txt file to have full control of their final
+         rootfs.  Select this option and specify the directory
+         containing your target_skeleton and file containing your
+         customized device_table.txt file or leave this option
+         cleared to use target/generic or the board support chosen
+         in target options.
+
+config BR2_TARGET_CUSTOM_SKELETON_DIR
+       string "Path to target_skeleton directory"
+       depends on BR2_TARGET_CUSTOM_SKELETON
+       default target/generic/target_skeleton
+
+config BR2_TARGET_CUSTOM_SKELETON_DEVICE_TABLE
+       string "Path to device_table.txt file"
+       depends on BR2_TARGET_CUSTOM_SKELETON
+       default target/generic/device_table.txt
+
 comment "filesystem for target device"
 
 source "target/cramfs/Config.in"
