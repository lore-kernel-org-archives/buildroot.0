From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 09:48:47 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/kernel-headers/lzma
Message-ID: <20070821164847.CE7C5A5D27@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 09:48:47 -0700 (Tue, 21 Aug 2007)
New Revision: 19620

Log:
- forgot to add this file to go with r19619


Added:
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-003-lzma-vmlinuz.patch


Changeset:
Added: trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-003-lzma-vmlinuz.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-003-lzma-vmlinuz.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-003-lzma-vmlinuz.patch	2007-08-21 16:48:47 UTC (rev 19620)
@@ -0,0 +1,44 @@
+diff -rdup linux-2.6.22.1.old/scripts/Makefile.lib linux-2.6.22.1/scripts/Makefile.lib
+--- linux-2.6.22.1.old/scripts/Makefile.lib	2007-08-21 16:32:19.000000000 +0200
++++ linux-2.6.22.1/scripts/Makefile.lib	2007-08-21 16:43:20.000000000 +0200
+@@ -166,6 +166,6 @@ cmd_gzip = gzip -f -9 < $< > $@
+ #
+ quiet_cmd_lzma = LZMA    $@
+ #cmd_lzma = lzma e $< $@ -lc7 -lp0 -pb0 2>/dev/null
+-cmd_lzma = lzma -z $< -c > $@
++cmd_lzma = $(LZMA) -z $< -c > $@
+ 
+ 
+diff -rdup linux-2.6.22.1.old/scripts/gen_lzma_initramfs_list.sh linux-2.6.22.1/scripts/gen_lzma_initramfs_list.sh
+--- linux-2.6.22.1.old/scripts/gen_lzma_initramfs_list.sh	2007-08-21 16:32:19.000000000 +0200
++++ linux-2.6.22.1/scripts/gen_lzma_initramfs_list.sh	2007-08-21 16:42:56.000000000 +0200
+@@ -11,7 +11,7 @@
+ 
+ # error out on errors
+ set -e
+-
++test "x$LZMA" = "x" && LZMA=lzma
+ usage() {
+ cat << EOF
+ Usage:
+@@ -286,7 +286,7 @@ if [ ! -z ${output_file} ]; then
+ 		cpio_tfile=${cpio_file}
+ 	fi
+ 	rm ${cpio_list}
+-	lzma -z ${cpio_tfile} ${opt} -c > ${output_file}
++	$LZMA -z ${cpio_tfile} ${opt} -c > ${output_file}
+ 	[ -z ${cpio_file} ] && rm ${cpio_tfile}
+ fi
+ exit 0
+diff -rdup linux-2.6.22.1.old/usr/Makefile linux-2.6.22.1/usr/Makefile
+--- linux-2.6.22.1.old/usr/Makefile	2007-08-21 16:32:19.000000000 +0200
++++ linux-2.6.22.1/usr/Makefile	2007-08-21 16:46:22.000000000 +0200
+@@ -19,7 +19,7 @@ $(obj)/initramfs_data.o: $(obj)/initramf
+ 
+ hostprogs-y := gen_init_cpio
+ initramfs   := $(CONFIG_SHELL) $(srctree)/scripts/gen_initramfs_list.sh
+-lzma_initramfs := $(CONFIG_SHELL) $(srctree)/scripts/gen_lzma_initramfs_list.sh
++lzma_initramfs := LZMA=$(LZMA) $(CONFIG_SHELL) $(srctree)/scripts/gen_lzma_initramfs_list.sh
+ ramfs-input := $(if $(filter-out "",$(CONFIG_INITRAMFS_SOURCE)), \
+ 			$(shell echo $(CONFIG_INITRAMFS_SOURCE)),-d)
+ ramfs-args  := \
