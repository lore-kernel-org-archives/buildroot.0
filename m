From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 24 Jul 2007 06:41:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20070724134107.4B7A7A460F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-24 06:41:05 -0700 (Tue, 24 Jul 2007)
New Revision: 19245

Log:
- add fixups for lzma'ed initramfs


Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch


Changeset:
Added: trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch	2007-07-24 13:41:05 UTC (rev 19245)
@@ -0,0 +1,33 @@
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
