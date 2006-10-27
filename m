From: Paugam Luc <luc.paugam@thomson.net>
Date: Fri, 27 Oct 2006 17:12:19 +0200
Subject: [Buildroot] [Patch] Toolchain generation for 32-bit HOST systems
Message-ID: <E55CA8ECFBA85E4CB8E8173566B9EFEB287E05@rennsmail04.eu.thmulti.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

In order to generate a toolchain suitable for both 32-bit and 64-bit
HOST systems, I had to force the build to 32-bit environment by adding
another buildroot directive: BR2_HOSTCC_FORCE_TO_32BITS

Please see patch below.

Thanks for your comments.
Regards - Luc

diff -urN --exclude-from=/home/prome_lp/scripts/dontdiff
buildroot-20061012/package/Makefile.in
compile-uClibc-armeb-20061012-GCC3.4.6/package/Makefile.in
--- buildroot-20061012/package/Makefile.in	2006-10-12
09:15:16.000000000 +0200
+++ compile-uClibc-armeb-20061012-GCC3.4.6/package/Makefile.in
2006-10-25 14:57:20.000000000 +0200
@@ -20,7 +20,12 @@
 DISABLE_LARGEFILE= --disable-largefile
 endif
 TARGET_CFLAGS=$(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
+
+ifeq ($(BR2_HOSTCC_FORCE_TO_32BITS),y)
+HOSTCC:=gcc -m32
+else
 HOSTCC:=gcc
+endif
 
 BASE_DIR:=${shell pwd}
 
diff -urN --exclude-from=/home/prome_lp/scripts/dontdiff
buildroot-20061012/toolchain/gcc/Config.in
compile-uClibc-armeb-20061012-GCC3.4.6/toolchain/gcc/Config.in
--- buildroot-20061012/toolchain/gcc/Config.in	2006-10-12
09:15:05.000000000 +0200
+++ compile-uClibc-armeb-20061012-GCC3.4.6/toolchain/gcc/Config.in
2006-10-25 15:08:30.000000000 +0200
@@ -92,6 +92,14 @@
 	default "4.2"       if BR2_GCC_VERSION_4_2
 
 
+config BR2_HOSTCC_FORCE_TO_32BITS
+	bool "Generate code for a 32-bit environment?"
+	default n
+	help
+	    Force HOSTCC to generate code for a 32-bit environment.
+	    The 32-bit environment sets int, long and pointer to 32 bits
+	    and generates code that runs on any 32-bit HOST system.
+
 config BR2_GCC_USE_SJLJ_EXCEPTIONS
 	bool "Enable setjmp/longjmp exceptions?"
 	default n
