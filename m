From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 23:01:24 +0100
Subject: [Buildroot] [PATCHv2 1/5] uclibc: adapt thread implementation
	selection to uClibc-ng
In-Reply-To: <1426111288-20529-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1426111288-20529-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1426111288-20529-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng does not support linuxthreads or linuxthreads.old on
architectures that have NPTL support. This creates another complicated
dependency: dependeing on the uClibc version being used, not the same
thread implementations are available.

In order to handle this situation, this patch introduces three hidden
booleans:

 - BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
 - BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 - BR2_UCLIBC_VERSION_SUPPORTS_NPTL

They are selected by the different uClibc versions, depending on which
thread implementation they support on the different architectures.

Then, the choice of the thread implementation can rely on those
booleans to know if a given thread implementation is available in the
current architecture / uClibc version selection.

This makes sure that unusable thread implementation do not get
selected, therefore fixing build issues such as:

  http://autobuild.buildroot.org/results/89e/89e423bee040cbce3e82cd89f1191efaac490c0d/

The support table is as follows (only taking into account
architectures that allow the selection of
BR2_TOOLCHAIN_BUILDROOT_UCLIBC, other architectures are not
considered) :

             ----uclibc----   uclibc-xtensa-   --uclibc-arc--  --uclibc-ng---
             LT LT.old NPTL   LT LT.old NPTL   LT LT.old NPTL  LT LT.old NPTL
arc(le|eb)                                      y   y     n    n    n     n (1)
arm(eb)      y    y     y                                      n    y     y (2)
bfin         n    y     n                                      y    y     n
i386         y    y     y                                      n    n     y (3)
m68k         y    y     y                                      y    y     n
mips(64)(el) y    y     y                                      n    n     y
powerpc      y    y     y                                      n    n     y
sh           y    y     y                                      n    n     y
sparc        y    y     y                                      n    n     y
xtensa                        n    y     n                     n    n     y
x86_64       y    y     y                                      n    n     y

  (1) : uclibc-ng only has NPTL support for ARC but it requires a more
        recent compiler version that hasn't been officially released
        by Synopsys.

  (2) : the general idea of uclibc-ng is to only support NPTL on
        architectures where it is available. However, in order to
        support ARM noMMU platforms, LT.old support has been kept on
        ARM.

  (3) : except i386 itself, which doesn't have what's needed for NPTL
        support. i386 is simply not supported by uclibc-ng basically.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/uclibc/Config.in | 43 +++++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 10 deletions(-)

diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 3a65752..18e02c2 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -7,6 +7,15 @@ config BR2_PACKAGE_UCLIBC
 
 comment "uClibc Options"
 
+config BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
+       bool
+
+config BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
+       bool
+
+config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
+       bool
+
 choice
 	prompt "uClibc C library Version"
 	default BR2_UCLIBC_VERSION_0_9_33
@@ -15,21 +24,39 @@ choice
 
 	config BR2_UCLIBC_VERSION_0_9_33
 		bool "uClibc 0.9.33.x"
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
+		       if !BR2_bfin
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
+		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
+		       if !BR2_bfin && !BR2_x86_i386
 		depends on !(BR2_arc || BR2_xtensa)
 
 	config BR2_UCLIBC_VERSION_ARC_GIT
 		bool "uClibc Git ARC"
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 		depends on BR2_arc
 
 	config BR2_UCLIBC_NG_VERSION_1_0_0
 		bool "uClibc-ng 1.0.0"
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
+		       if BR2_bfin || BR2_m68k
+		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
+		       if BR2_bfin || BR2_m68k || BR2_arm || BR2_armeb
+		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
+		       if !BR2_arc && !BR2_bfin && !BR2_m68k && !BR2_x86_i386
 
 	config BR2_UCLIBC_VERSION_XTENSA_GIT
 		bool "uClibc Git Xtensa"
 		depends on BR2_xtensa
+		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS_OLD
 
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
+		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS if !BR2_bfin && !BR2_xtensa
+		select BR2_UCLIBC_SUPPORTS_LINUXTHREADS_OLD
+		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
+		       if !BR2_bfin && !BR2_x86_i386 && !BR2_xtensa
 		depends on !(BR2_arc)
 
 endchoice
@@ -101,8 +128,9 @@ config BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
 choice
 	prompt "Thread library implementation"
-	default BR2_PTHREADS_NATIVE if !BR2_xtensa
-	default BR2_PTHREADS_OLD
+	default BR2_PTHREADS_NATIVE if BR2_UCLIBC_VERSION_SUPPORTS_NPTL
+	default BR2_PTHREADS_OLD if BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
+	default BR2_PTHREADS if BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
 	help
 	  Use this option to select the thread library implementation
 	  that should be used in your toolchain. Not all thread
@@ -115,24 +143,19 @@ choice
 
 	config BR2_PTHREADS
 		bool "linuxthreads"
-		depends on !BR2_bfin
-		depends on !BR2_xtensa
 		select BR2_TOOLCHAIN_HAS_THREADS
+		depends on BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
 
 	config BR2_PTHREADS_OLD
 		bool "linuxthreads (stable/old)"
 		select BR2_TOOLCHAIN_HAS_THREADS
+		depends on BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
 
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
 		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-		depends on !BR2_arc
-		depends on !BR2_bfin
-		# There is NPTL support for Xtensa in uClibc-ng, but
-		# not in the main uClibc repository.
-		depends on !BR2_xtensa || !BR2_UCLIBC_VERSION_XTENSA_GIT
-		depends on !BR2_x86_i386
+		depends on BR2_UCLIBC_VERSION_SUPPORTS_NPTL
 endchoice
 
 config BR2_PTHREAD_DEBUG
-- 
2.1.0
