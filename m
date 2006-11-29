From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 29 Nov 2006 12:26:06 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/grub
Message-ID: <20061129202606.98CCB4859A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-29 12:26:05 -0800 (Wed, 29 Nov 2006)
New Revision: 16727

Log:
- honor uclibc's notion of LFS support


Added:
   trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch

Modified:
   trunk/buildroot/target/x86/grub/grub.mk


Changeset:
Added: trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch
===================================================================
--- trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch	2006-11-29 19:28:41 UTC (rev 16726)
+++ trunk/buildroot/target/x86/grub/grub.300-honor_UCLIBC_HAS_LFS.patch	2006-11-29 20:26:05 UTC (rev 16727)
@@ -0,0 +1,34 @@
+diff -rup grub-0.97.orig/grub/asmstub.c grub-0.97/grub/asmstub.c
+--- grub-0.97.orig/grub/asmstub.c	2006-11-29 20:36:20.000000000 +0100
++++ grub-0.97/grub/asmstub.c	2006-11-29 21:26:16.000000000 +0100
+@@ -18,10 +18,13 @@
+  *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+ 
++#include <features.h>
++#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
+ /* Try to use glibc's transparant LFS support. */
+ #define _LARGEFILE_SOURCE	1
+ /* lseek becomes synonymous with lseek64.  */
+ #define _FILE_OFFSET_BITS	64
++#endif
+ 
+ /* Simulator entry point. */
+ int grub_stage2 (void);
+diff -rup grub-0.97.orig/lib/device.c grub-0.97/lib/device.c
+--- grub-0.97.orig/lib/device.c	2006-11-29 20:36:20.000000000 +0100
++++ grub-0.97/lib/device.c	2006-11-29 21:25:19.000000000 +0100
+@@ -18,10 +18,13 @@
+  *  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+  */
+ 
++#include <features.h>
++#if !defined __UCLIBC__ || (defined __UCLIBC__ && defined __UCLIBC_HAS_LFS__)
+ /* Try to use glibc's transparant LFS support. */
+ #define _LARGEFILE_SOURCE       1
+ /* lseek becomes synonymous with lseek64.  */
+ #define _FILE_OFFSET_BITS       64
++#endif
+ 
+ #include <stdio.h>
+ #include <stdlib.h>

Modified: trunk/buildroot/target/x86/grub/grub.mk
===================================================================
--- trunk/buildroot/target/x86/grub/grub.mk	2006-11-29 19:28:41 UTC (rev 16726)
+++ trunk/buildroot/target/x86/grub/grub.mk	2006-11-29 20:26:05 UTC (rev 16727)
@@ -36,6 +36,10 @@
 endif
 GRUB_CFLAGS=-DSUPPORT_LOOPDEV
 
+ifeq ($(BR2_LARGEFILE),)
+GRUB_CFLAGS+=-U_FILE_OFFSET_BITS
+endif
+
 $(DL_DIR)/$(GRUB_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(GRUB_SITE)/$(GRUB_SOURCE)
 
