From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 24 Jul 2007 09:34:29 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070724163429.6FAB3A45F6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-24 09:34:28 -0700 (Tue, 24 Jul 2007)
New Revision: 19252

Log:
- adjust lzma arguments for current version


Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-002-lzma-vmlinuz.01.patch

Modified:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch


Changeset:
Copied: trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-002-lzma-vmlinuz.01.patch (from rev 19245, trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch)
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-002-lzma-vmlinuz.01.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-002-lzma-vmlinuz.01.patch	2007-07-24 16:34:28 UTC (rev 19252)
@@ -0,0 +1,54 @@
+diff -rdup linux-2.6.21.5.oorig/arch/i386/boot/compressed/Makefile linux-2.6.21.5/arch/i386/boot/compressed/Makefile
+--- linux-2.6.21.5.oorig/arch/i386/boot/compressed/Makefile	2007-07-24 13:08:51.000000000 +0200
++++ linux-2.6.21.5/arch/i386/boot/compressed/Makefile	2007-07-24 14:54:38.000000000 +0200
+@@ -4,7 +4,7 @@
+ # create a compressed vmlinux image from the original vmlinux
+ #
+ 
+-tragets		:= head.o lzma_misc.o piggy.o \
++targets		:= head.o lzma_misc.o piggy.o \
+ 			vmlinux.bin.all vmlinux.relocs \
+ 			vmlinux vmlinux.bin vmlinux.bin.gz
+ EXTRA_AFLAGS	:= -traditional
+diff -rdup linux-2.6.21.5.oorig/scripts/gen_lzma_initramfs_list.sh linux-2.6.21.5/scripts/gen_lzma_initramfs_list.sh
+--- linux-2.6.21.5.oorig/scripts/gen_lzma_initramfs_list.sh	2007-07-24 13:08:51.000000000 +0200
++++ linux-2.6.21.5/scripts/gen_lzma_initramfs_list.sh	2007-07-24 15:12:10.000000000 +0200
+@@ -253,7 +253,7 @@ while [ $# -gt 0 ]; do
+ 			shift
+ 			;;
+ 		"-s")
+-			opt="-d16"
++			#opt="-d16" ? what was that supposed to do?
+ 			;;
+ 		"-d")	# display default initramfs list
+ 			default_list="$arg"
+@@ -286,7 +286,7 @@ if [ ! -z ${output_file} ]; then
+ 		cpio_tfile=${cpio_file}
+ 	fi
+ 	rm ${cpio_list}
+-	lzma e ${cpio_tfile} ${output_file} ${opt}
++	lzma -z ${cpio_tfile} ${opt} -c > ${output_file}
+ 	[ -z ${cpio_file} ] && rm ${cpio_tfile}
+ fi
+ exit 0
+--- linux-2.6.21.5.oorig/arch/i386/boot/compressed/lzma_misc.c	2007-07-24 15:24:44.000000000 +0200
++++ linux-2.6.21.5/arch/i386/boot/compressed/lzma_misc.c	2007-07-24 17:09:40.000000000 +0200
+@@ -241,7 +241,6 @@ static int lzma_unzip(uch* output)
+ 
+ static int read_byte(void *object, const unsigned char **buffer, SizeT *bufferSize)
+ {
+-	static unsigned int i = 0;
+ 	static unsigned char val;
+ 	*bufferSize = 1;
+ 	val = get_byte();
+--- linux-2.6.21.5.oorig/scripts/Makefile.lib	2007-07-24 15:24:44.000000000 +0200
++++ linux-2.6.21.5/scripts/Makefile.lib	2007-07-24 18:03:57.000000000 +0200
+@@ -165,6 +165,7 @@ cmd_gzip = gzip -f -9 < $< > $@
+ # LZMA
+ #
+ quiet_cmd_lzma = LZMA    $@
+-cmd_lzma = lzma e $< $@ -lc7 -lp0 -pb0 2>/dev/null
++#cmd_lzma = lzma e $< $@ -lc7 -lp0 -pb0 2>/dev/null
++cmd_lzma = lzma -z $< -c > $@
+ 
+ 

Modified: trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch	2007-07-24 15:54:42 UTC (rev 19251)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch	2007-07-24 16:34:28 UTC (rev 19252)
@@ -31,3 +31,24 @@
  	[ -z ${cpio_file} ] && rm ${cpio_tfile}
  fi
  exit 0
+--- linux-2.6.21.5.oorig/arch/i386/boot/compressed/lzma_misc.c	2007-07-24 15:24:44.000000000 +0200
++++ linux-2.6.21.5/arch/i386/boot/compressed/lzma_misc.c	2007-07-24 17:09:40.000000000 +0200
+@@ -241,7 +241,6 @@ static int lzma_unzip(uch* output)
+ 
+ static int read_byte(void *object, const unsigned char **buffer, SizeT *bufferSize)
+ {
+-	static unsigned int i = 0;
+ 	static unsigned char val;
+ 	*bufferSize = 1;
+ 	val = get_byte();
+--- linux-2.6.21.5.oorig/scripts/Makefile.lib	2007-07-24 15:24:44.000000000 +0200
++++ linux-2.6.21.5/scripts/Makefile.lib	2007-07-24 18:03:57.000000000 +0200
+@@ -165,6 +165,7 @@ cmd_gzip = gzip -f -9 < $< > $@
+ # LZMA
+ #
+ quiet_cmd_lzma = LZMA    $@
+-cmd_lzma = lzma e $< $@ -lc7 -lp0 -pb0 2>/dev/null
++#cmd_lzma = lzma e $< $@ -lc7 -lp0 -pb0 2>/dev/null
++cmd_lzma = lzma -z $< -c > $@
+ 
+ 
