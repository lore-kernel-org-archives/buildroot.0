From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 28 Jan 2009 16:37:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: gcc/4.3.1
	gcc/4.3.2 kernel-headers
Message-ID: <20090128163710.1D38C769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-28 16:37:09 +0000 (Wed, 28 Jan 2009)
New Revision: 25105

Log:
toolchain: cris fixes for gcc 4.3.x / linux 2.6.28.x

Patches by Hinko Kocevar <hinko.kocevar@cetrtapot.si>

Added:
   trunk/buildroot/toolchain/gcc/4.3.1/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
   trunk/buildroot/toolchain/gcc/4.3.2/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch


Changeset:
Added: trunk/buildroot/toolchain/gcc/4.3.1/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.1/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.1/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch	2009-01-28 16:37:09 UTC (rev 25105)
@@ -0,0 +1,13 @@
+diff -urN gcc-4.3.1.orig/gcc/config/cris/cris.h gcc-4.3.1/gcc/config/cris/cris.h
+--- gcc-4.3.1.orig/gcc/config/cris/cris.h	2008-02-22 12:11:01.000000000 +0100
++++ gcc-4.3.1/gcc/config/cris/cris.h	2008-07-02 10:42:42.000000000 +0200
+@@ -1529,9 +1529,6 @@
+ 
+ #define NO_IMPLICIT_EXTERN_C
+ 
+-/* No specific purpose other than warningless compatibility.  */
+-#define HANDLE_PRAGMA_PACK_PUSH_POP 1
+-
+ /*
+  * Local variables:
+  * eval: (c-set-style "gnu")

Added: trunk/buildroot/toolchain/gcc/4.3.2/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch
===================================================================
--- trunk/buildroot/toolchain/gcc/4.3.2/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/gcc/4.3.2/999-gcc-4.3.0-cris-pragma-pack-warning-remove.patch	2009-01-28 16:37:09 UTC (rev 25105)
@@ -0,0 +1,13 @@
+diff -urN gcc-4.3.1.orig/gcc/config/cris/cris.h gcc-4.3.1/gcc/config/cris/cris.h
+--- gcc-4.3.1.orig/gcc/config/cris/cris.h	2008-02-22 12:11:01.000000000 +0100
++++ gcc-4.3.1/gcc/config/cris/cris.h	2008-07-02 10:42:42.000000000 +0200
+@@ -1529,9 +1529,6 @@
+ 
+ #define NO_IMPLICIT_EXTERN_C
+ 
+-/* No specific purpose other than warningless compatibility.  */
+-#define HANDLE_PRAGMA_PACK_PUSH_POP 1
+-
+ /*
+  * Local variables:
+  * eval: (c-set-style "gnu")

Added: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-eth-driver-netpoll.patch	2009-01-28 16:37:09 UTC (rev 25105)
@@ -0,0 +1,11 @@
+--- a/drivers/net/cris/eth_v10.c.org	2009-01-28 09:19:09.000000000 +0100
++++ b/drivers/net/cris/eth_v10.c	2009-01-28 09:19:16.000000000 +0100
+@@ -1707,7 +1707,7 @@
+ static void
+ e100_netpoll(struct net_device* netdev)
+ {
+-	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev, NULL);
++	e100rxtx_interrupt(NETWORK_DMA_TX_IRQ_NBR, netdev);
+ }
+ #endif
+ 

Added: trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch	                        (rev 0)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.28.2-cris-klist-warnings.patch	2009-01-28 16:37:09 UTC (rev 25105)
@@ -0,0 +1,12 @@
+--- a/include/linux/klist.h
++++ b/include/linux/klist.h
+@@ -23,7 +23,7 @@ struct klist {
+ 	struct list_head	k_list;
+ 	void			(*get)(struct klist_node *);
+ 	void			(*put)(struct klist_node *);
+-};
++} __attribute__ ((aligned (4)));
+ 
+ #define KLIST_INIT(_name, _get, _put)					\
+ 	{ .k_lock	= __SPIN_LOCK_UNLOCKED(_name.k_lock),		\
+
