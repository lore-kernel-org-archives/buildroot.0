From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 00:04:15 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot/2009.01-rc1
Message-ID: <20090103000415.50CE2769FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 00:04:14 +0000 (Sat, 03 Jan 2009)
New Revision: 24655

Log:
Fix issue with AT91/AVR32 Ethernet MACB

Added:
   trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-006-drivers-net-macb.c.patch


Changeset:
Added: trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-006-drivers-net-macb.c.patch
===================================================================
--- trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-006-drivers-net-macb.c.patch	                        (rev 0)
+++ trunk/buildroot/target/u-boot/2009.01-rc1/u-boot-2009.01-rc1-006-drivers-net-macb.c.patch	2009-01-03 00:04:14 UTC (rev 24655)
@@ -0,0 +1,28 @@
+diff -urN u-boot-2008.10-0rig/drivers/net/macb.c u-boot-2008.10/drivers/net/macb.c
+--- u-boot-2008.10-0rig/drivers/net/macb.c	2008-10-18 21:30:31.000000000 +0200
++++ u-boot-2008.10/drivers/net/macb.c	2008-12-28 23:44:11.000000000 +0100
+@@ -415,18 +415,16 @@
+ 
+ 	/* choose RMII or MII mode. This depends on the board */
+ #ifdef CONFIG_RMII
+-#if defined(CONFIG_AT91CAP9) || defined(CONFIG_AT91SAM9260) || \
+-    defined(CONFIG_AT91SAM9263)
+-	macb_writel(macb, USRIO, MACB_BIT(RMII) | MACB_BIT(CLKEN));
+-#else
++#if defined(CONFIG_AVR32)
+ 	macb_writel(macb, USRIO, 0);
+-#endif
+ #else
+-#if defined(CONFIG_AT91CAP9) || defined(CONFIG_AT91SAM9260) || \
+-    defined(CONFIG_AT91SAM9263)
+-	macb_writel(macb, USRIO, MACB_BIT(CLKEN));
++	macb_writel(macb, USRIO, MACB_BIT(RMII) | MACB_BIT(CLKEN));
++#endif
+ #else
++#if defined(CONFIG_AVR32)
+ 	macb_writel(macb, USRIO, MACB_BIT(MII));
++#else
++	macb_writel(macb, USRIO, MACB_BIT(CLKEN));
+ #endif
+ #endif /* CONFIG_RMII */
+ 
