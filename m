From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 19 Aug 2008 08:01:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20080819150136.E673B3C870@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-19 08:01:36 -0700 (Tue, 19 Aug 2008)
New Revision: 23108

Log:
kernel-headers: rename aout patch so it gets applied to 2.6.25.15

Needed by valgrind.

Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.15-export-linux-aout.patch

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch


Changeset:
Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.15-export-linux-aout.patch (from rev 23107, trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.15-export-linux-aout.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.15-export-linux-aout.patch	2008-08-19 15:01:36 UTC (rev 23108)
@@ -0,0 +1,24 @@
+[PATCH] export linux/a.out.h
+
+Export linux/a.out.h like we do for asm/a.out.h. One minor complication is
+that the interesting stuff is protected by an CONFIG_ARCH_SUPPORTS_AOUT ifdef,
+so make sure this gets defined for unifdef.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ include/linux/Kbuild |    2 ++
+ 1 file changed, 2 insertions(+)
+
+Index: linux-2.6.25.6/include/linux/Kbuild
+===================================================================
+--- linux-2.6.25.6.orig/include/linux/Kbuild
++++ linux-2.6.25.6/include/linux/Kbuild
+@@ -159,6 +159,8 @@
+ header-y += videotext.h
+ header-y += x25.h
+ 
++UNIFDEF += -DCONFIG_ARCH_SUPPORTS_AOUT
++unifdef-y += a.out.h
+ unifdef-y += acct.h
+ unifdef-y += adb.h
+ unifdef-y += adfs_fs.h

Deleted: trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch	2008-08-19 15:01:33 UTC (rev 23107)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.25.9-export-linux-aout.patch	2008-08-19 15:01:36 UTC (rev 23108)
@@ -1,24 +0,0 @@
-[PATCH] export linux/a.out.h
-
-Export linux/a.out.h like we do for asm/a.out.h. One minor complication is
-that the interesting stuff is protected by an CONFIG_ARCH_SUPPORTS_AOUT ifdef,
-so make sure this gets defined for unifdef.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- include/linux/Kbuild |    2 ++
- 1 file changed, 2 insertions(+)
-
-Index: linux-2.6.25.6/include/linux/Kbuild
-===================================================================
---- linux-2.6.25.6.orig/include/linux/Kbuild
-+++ linux-2.6.25.6/include/linux/Kbuild
-@@ -159,6 +159,8 @@
- header-y += videotext.h
- header-y += x25.h
- 
-+UNIFDEF += -DCONFIG_ARCH_SUPPORTS_AOUT
-+unifdef-y += a.out.h
- unifdef-y += acct.h
- unifdef-y += adb.h
- unifdef-y += adfs_fs.h
