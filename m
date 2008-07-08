From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  8 Jul 2008 12:45:35 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5
Message-ID: <20080708194535.52B4E3C697@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-08 12:45:34 -0700 (Tue, 08 Jul 2008)
New Revision: 22694

Log:
Add latest gcc patch for AVR32 gcc-4.2.2 prepatched source

Added:
   trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/ext_source/Atmel/avr32/4.2.2-avr32-2.1.5/903-avr32-fix-removal-of-redundant-cast-operations.patch	2008-07-08 19:45:34 UTC (rev 22694)
@@ -0,0 +1,16 @@
+Index: trunk/gcc/config/avr32/avr32.c
+===================================================================
+--- trunk/gcc/config/avr32/avr32.c	(revision 43495)
++++ trunk/gcc/config/avr32/avr32.c	(revision 43496)
+@@ -6499,6 +6499,11 @@
+ 		    break;
+ 		}
+ 
++              /* Check if we have a call and the register is used as an argument. */
++              if (CALL_P (scan)
++                  && find_reg_fusage (scan, USE, reg) )
++                break;
++
+ 	      if (!reg_mentioned_p (reg, PATTERN (scan)))
+ 		continue;
+ 
