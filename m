From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Fri,  9 Nov 2007 02:07:15 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/elf2flt
Message-ID: <20071109100715.A050930062@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-09 02:07:15 -0800 (Fri, 09 Nov 2007)
New Revision: 20394

Log:
update elf2flt nios2 support, thanks atle

Modified:
   trunk/buildroot/toolchain/elf2flt/elf2flt.nios2.conditional


Changeset:
Modified: trunk/buildroot/toolchain/elf2flt/elf2flt.nios2.conditional
===================================================================
--- trunk/buildroot/toolchain/elf2flt/elf2flt.nios2.conditional	2007-11-09 09:57:25 UTC (rev 20393)
+++ trunk/buildroot/toolchain/elf2flt/elf2flt.nios2.conditional	2007-11-09 10:07:15 UTC (rev 20394)
@@ -1,5 +1,5 @@
 --- elf2flt/elf2flt.ld
-++ elf2flt/elf2flt.ld
++++ elf2flt/elf2flt.ld
 @@ -62,6 +62,10 @@
  		*(.eh_frame)
  		*(.gcc_except_table)
@@ -11,3 +11,32 @@
  		/* Microblaze has .sdata and .sbss (small bss).  They must
  		   be contiguous, so please don't move any of this. JW */
  		_ssrw = . ;			
+@@ -72,7 +72,7 @@
+ 		_ssrw = . ;			
+ 		*(.sdata) 
+ 		*(.sdata.*)
+-		*(.sbss)			/* Don't move this! */
++		*(.sbss .gnu.linkonce.sb*)		/* Don't move this! */
+ 		_essrw = . ;
+ 
+ 		_ssrw_size = _essrw - _ssrw;
+--- elf2flt/ld-elf2flt.in
++++ elf2flt/ld-elf2flt.in
+@@ -132,7 +132,7 @@
+ 			esac
+ 			ARG1="$ARG1 -defsym $GOT_OFFSET=`expr ${SHARED_ID} '*' -4 - 4`"
+ 		fi
+-		if [ "@emit_relocs@" = "yes" ]
++		if [ "no" = "yes" ]
+ 		then
+ 			SEDOP="$SEDOP -e s/^SINGLE_LINK://"
+ 		else
+@@ -155,7 +155,7 @@
+ 			LDSCRIPT="$NEWLDSCRIPT"
+ 		fi
+ 
+-		if [ "@emit_relocs@" = "yes" ]
++		if [ "no" = "yes" ]
+ 		then
+ 		 $LINKER $EMUL $SDIRS -T $LDSCRIPT -q -o "$OFILE.gdb" $ARG1             ||exit $?
+ 		 RFILE="$OFILE.gdb"
