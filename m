From: Hebbar <gururajakr@sanyo.co.in>
Date: Tue, 18 Mar 2008 18:06:55 -0700 (PDT)
Subject: [Buildroot] [PATCH] Allow users to choose Custom Skeleton directory
Message-ID: <16135129.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

At present, Buildroot allows only 2 skeleton directory for root preparation
other than those for atmel,amd etc.

1. target/generic/target_busybox_skeleton
2. target/generic/target_skeleton

Below patch allows customers to define their own cutom skeleton directory
and patch.

I welcome comments and changes or updates required for the same.

Thanks and regards
Gururaja

Signed-off-by: Gururaja Hebbar <gururaja@sanyo.co.in>

buildroot/package/busybox/Config.in
buildroot/target/generic/Makefile.in

diff -purN buildroot/package/busybox/Config.in
buildroot_kboard/package/busybox/Config.in
--- buildroot/package/busybox/Config.in	2008-03-18 03:15:30.000000000 -0400
+++ buildroot_kboard/package/busybox/Config.in	2008-03-15 20:19:33.000000000
-0400
@@ -92,6 +92,18 @@ config BR2_PACKAGE_BUSYBOX_SKELETON
 	  Use a minimal target skeleton. Make sure to select mdev
 	  which is used to populate /dev/.
 
+config BR2_PACKAGE_CUSTOM_SKELETON
+	bool "use custom target skeleton"	
+	depends on !BR2_PACKAGE_BUSYBOX_SKELETON
+	help
+	  Use a Custom target skeleton. Make sure it includes all
+	  required directories and files.
+	  
+config BR2_PACKAGE_CUSTOM_SKELETON_PATH
+	string "custom target skeleton Path"
+	depends on BR2_PACKAGE_CUSTOM_SKELETON
+	default ""
+
 #config BR2_PACKAGE_BUSYBOX_INITRAMFS
 #	bool "initramfs perusing busybox"
 #	depends on BR2_PACKAGE_BUSYBOX

diff -purN buildroot/target/generic/Makefile.in
buildroot_kboard/target/generic/Makefile.in
--- buildroot/target/generic/Makefile.in	2008-03-18 03:15:20.000000000 -0400
+++ buildroot_kboard/target/generic/Makefile.in	2008-03-18
17:56:48.000000000 -0400
@@ -7,3 +7,6 @@ TARGET_SKELETON=target/generic/target_bu
 TARGET_DEVICE_TABLE=target/generic/mini_device_table.txt
 endif
 
+ifeq ($(BR2_PACKAGE_CUSTOM_SKELETON),y)
+TARGET_SKELETON=$(strip $(subst ",, $(BR2_PACKAGE_CUSTOM_SKELETON_PATH)))
+endif
-- 
View this message in context: http://www.nabble.com/-PATCH--Allow-users-to-choose-Custom-Skeleton-directory-tp16135129p16135129.html
Sent from the BuildRoot mailing list archive at Nabble.com.
