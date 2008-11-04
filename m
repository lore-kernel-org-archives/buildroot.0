From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Nov 2008 20:10:21 +0100
Subject: [Buildroot] [PATCH] Kernel build fix related to external toolchain
	use
In-Reply-To: <20081104182314.580215e5@surf>
References: <20081103101839.6021A3C915@busybox.net>
	<BD79186B4FD85F4B8E60E381CAEE1909C91694@mi8nycmail19.Mi8.com>
	<20081104001754.5fb48c87@surf>
	<BD79186B4FD85F4B8E60E381CAEE1909C9177C@mi8nycmail19.Mi8.com>
	<20081104182314.580215e5@surf>
Message-ID: <20081104201021.32179357@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 4 Nov 2008 18:23:14 +0100,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

>  1) remove the option "linux (same version as linux headers)" when an
>     external toolchain is used ;

Kernel build fix related to external toolchain use

This patch prevents the user from select "linux (Same version as linux
headers)" as a choice for building the kernel when an external binary
toolchain is used, since "same version as linux headers" doesn't make
sense when an external toolchain is used.

It fixes the issue encountered by Hartley <hartleys@visionengravers.com>

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/Config.in |    7 +++++++
 1 file changed, 7 insertions(+)

Index: buildroot2/target/Config.in
===================================================================
--- buildroot2.orig/target/Config.in
+++ buildroot2/target/Config.in
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


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
