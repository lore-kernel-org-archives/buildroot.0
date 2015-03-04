From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 4 Mar 2015 15:48:17 +0100
Subject: [Buildroot] [PATCH] disable linuxthreads for NPTL only
 architectures for uClibc-ng
Message-ID: <20150304144816.GA14815@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng does not support multiple thread implementations for
an architecture and MMU configuration.
BFIN, ARM noMMU and m68k/Coldfire noMMU still uses linuxthreads in uClibc-ng.
The other buildroot supported architectures support NPTL.
Reflect this in Buildroot configuration.
ARC would work with uClibc-ng 1.0.0 and TLS/NPTL, but the correct
toolchain must be used.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc/Config.in |   29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 3a65752..c939f3f 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -5,6 +5,10 @@ config BR2_PACKAGE_UCLIBC
 	bool
 	default y
 
+# helper symbol robust against releases
+config BR2_PACKAGE_UCLIBC_NG
+	bool
+
 comment "uClibc Options"
 
 choice
@@ -23,6 +27,7 @@ choice
 
 	config BR2_UCLIBC_NG_VERSION_1_0_0
 		bool "uClibc-ng 1.0.0"
+		select BR2_PACKAGE_UCLIBC_NG
 
 	config BR2_UCLIBC_VERSION_XTENSA_GIT
 		bool "uClibc Git Xtensa"
@@ -117,10 +122,34 @@ choice
 		bool "linuxthreads"
 		depends on !BR2_bfin
 		depends on !BR2_xtensa
+		depends on !BR2_arm && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_armeb && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_i386 && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_mips && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_mipsel && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_mips64 && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_mips64el && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_sh && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_powerpc && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_sparc && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_x86_64 && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_xtensa && BR2_PACKAGE_UCLIBC_NG
 		select BR2_TOOLCHAIN_HAS_THREADS
 
 	config BR2_PTHREADS_OLD
 		bool "linuxthreads (stable/old)"
+		depends on !BR2_arm && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_armeb && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_i386 && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_mips && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_mipsel && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_mips64 && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_mips64el && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_sh && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_powerpc && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_sparc && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_x86_64 && BR2_PACKAGE_UCLIBC_NG
+		depends on !BR2_xtensa && BR2_PACKAGE_UCLIBC_NG
 		select BR2_TOOLCHAIN_HAS_THREADS
 
 	config BR2_PTHREADS_NATIVE
-- 
1.7.10.4
