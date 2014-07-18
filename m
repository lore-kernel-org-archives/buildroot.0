From: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Date: Fri, 18 Jul 2014 17:27:43 +0530
Subject: [Buildroot] [PATCH] quagga: Do not use fork on noMMU platforms
Message-ID: <1405684663-3100-1-git-send-email-yuvaraj.patil@wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fork() is not available in noMMU platforms, hence use vfork instead

fixes:
http://autobuild.buildroot.net/results/1c5/1c5fdfe3a0248b65efdea0594d8367ff907015d4//

Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
---
 arch/Config.in              |    2 +-
 package/quagga/quagga.patch |   28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 1 deletion(-)
 create mode 100644 package/quagga/quagga.patch

diff --git a/arch/Config.in b/arch/Config.in
index 77fae7a..9cd85a5 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -60,7 +60,7 @@ config BR2_avr32
 	# do the lack of upstream support in the major toolchain
 	# components. If you're interested by AVR32, contact the
 	# Buildroot community. Otherwise, its support will be removed
-	# in 2014.11.
+	# by the 2015.02 release.
 	depends on BR2_DEPRECATED_SINCE_2014_08
 	help
 	  The AVR32 is a 32-bit RISC microprocessor architecture designed by
diff --git a/package/quagga/quagga.patch b/package/quagga/quagga.patch
new file mode 100644
index 0000000..2949b2c
--- /dev/null
+++ b/package/quagga/quagga.patch
@@ -0,0 +1,28 @@
+diff -Nurp quagga-0.99.23_orig/babeld/util.c quagga-0.99.23/babeld/util.c
+--- quagga-0.99.23_orig/babeld/util.c	2014-07-18 15:31:02.078625470 +0530
++++ quagga-0.99.23/babeld/util.c	2014-07-18 15:33:45.838618612 +0530
+@@ -430,7 +430,11 @@ daemonise()
+     fflush(stdout);
+     fflush(stderr);
+ 
++#ifdef HAVE_FORK
+     rc = fork();
++#else
++    rc = vfork();
++#endif
+     if(rc < 0)
+         return -1;
+ 
+diff -Nurp quagga-0.99.23_orig/configure.ac quagga-0.99.23/configure.ac
+--- quagga-0.99.23_orig/configure.ac	2014-07-18 15:31:02.098625470 +0530
++++ quagga-0.99.23/configure.ac	2014-07-18 15:32:41.710621299 +0530
+@@ -724,6 +724,9 @@ AC_CHECK_LIB(pam, pam_start,
+ fi
+ AC_SUBST(LIBPAM)
+ 
++dnl checks for library functions
++AC_CHECK_FUNC([fork])
++
+ dnl -------------------------------
+ dnl Endian-ness check
+ dnl -------------------------------
-- 
1.7.9.5
