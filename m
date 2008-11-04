From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  4 Nov 2008 11:58:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20081104195849.373663C822@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-04 11:58:48 -0800 (Tue, 04 Nov 2008)
New Revision: 23924

Log:
Kernel build fix related to external toolchain use

This patch prevents the user from select "linux (Same version as linux
headers)" as a choice for building the kernel when an external binary
toolchain is used, since "same version as linux headers" doesn't make
sense when an external toolchain is used.

It fixes the issue encountered by Hartley <hartleys@visionengravers.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Modified:
   trunk/buildroot/target/Config.in


Changeset:
Modified: trunk/buildroot/target/Config.in
===================================================================
--- trunk/buildroot/target/Config.in	2008-11-04 12:50:38 UTC (rev 23923)
+++ trunk/buildroot/target/Config.in	2008-11-04 19:58:48 UTC (rev 23924)
@@ -45,6 +45,11 @@
 	        kernel headers are just that (headers) and not full
 	        kernels. This is a feature.
 
+# The kernel with the same version as linux headers cannot be compiled
+# when using an external toolchain, because the linux headers are not
+# handled by Buildroot in this case.
+if BR2_TOOLCHAIN_SOURCE
+
 config BR2_KERNEL_LINUX
 	bool "linux (Same version as linux headers)"
 	select BR2_PACKAGE_LINUX
@@ -56,6 +61,8 @@
 	        kernel headers are just that (headers) and not full
 	        kernels. This is a feature.
 
+endif
+
 config BR2_KERNEL_HURD
 	bool "hurd"
 	help
