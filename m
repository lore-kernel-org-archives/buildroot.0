From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 12 Feb 2007 09:42:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target:  device
Message-ID: <20070212174221.9F2E6C80C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-12 09:42:18 -0800 (Mon, 12 Feb 2007)
New Revision: 17866

Log:
- revert incorrect parts from sjhill's r17800 and add some more documentation.
  Now the kernel as well as /lib/modules are properly included in the final tarball and all other tarroot/genfs targets.


Modified:
   trunk/buildroot/target/Makefile.in
   trunk/buildroot/target/device/Makefile.in


Changeset:
Modified: trunk/buildroot/target/Makefile.in
===================================================================
--- trunk/buildroot/target/Makefile.in	2007-02-12 14:43:57 UTC (rev 17865)
+++ trunk/buildroot/target/Makefile.in	2007-02-12 17:42:18 UTC (rev 17866)
@@ -1,13 +1,15 @@
 # make sure to put everything that is board-specific before the tarroot targets
 include target/generic/Makefile.in
+
+# this eventually adds the kernel target to TARGETS:
 include target/device/Makefile.in
 include target/x86/Makefile.in
 include target/arm/Makefile.in
 include target/powerpc/Makefile.in
 # and finally build the filesystems/tarballs
 include target/*/*.mk
+
 # kernel rules
-ifeq ($(BR2_PACKAGE_LINUX),y)
-TARGETS+=linux26
-endif
+# We already did add the kernel target to TARGETS and now just pull in the rules
+# to actually build this target.
 include target/linux*.mk

Modified: trunk/buildroot/target/device/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Makefile.in	2007-02-12 14:43:57 UTC (rev 17865)
+++ trunk/buildroot/target/device/Makefile.in	2007-02-12 17:42:18 UTC (rev 17866)
@@ -1,3 +1,8 @@
 TARGET_DEVICE_DEPMOD:=target/device/x86/depmod.pl
 
 -include target/device/*/Makefile.in
+
+ifeq ($(BR2_PACKAGE_LINUX),y)
+TARGETS+=linux26
+endif
+
