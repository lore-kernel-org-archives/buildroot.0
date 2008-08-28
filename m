From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 27 Aug 2008 21:57:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080828045727.E7DC83C810@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-27 21:57:27 -0700 (Wed, 27 Aug 2008)
New Revision: 23272

Log:
busybox: udhcpc patch for 1.12.0

Added:
   trunk/buildroot/package/busybox/busybox-1.12.0-dhcp.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.12.0-dhcp.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.12.0-dhcp.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.12.0-dhcp.patch	2008-08-28 04:57:27 UTC (rev 23272)
@@ -0,0 +1,15 @@
+--- busybox-1.12.0/networking/udhcp/dhcpc.c	Wed Aug  6 00:55:58 2008
++++ busybox-1.12.0-dhcp/networking/udhcp/dhcpc.c	Thu Aug 28 00:05:23 2008
+@@ -259,9 +259,10 @@
+ 	if (opt & OPT_o)
+ 		client_config.no_default_options = 1;
+ 	while (list_O) {
+-		int n = index_in_strings(dhcp_option_strings, llist_pop(&list_O));
++		char *optstr = llist_pop(&list_O);
++		int n = index_in_strings(dhcp_option_strings, optstr);
+ 		if (n < 0)
+-			bb_error_msg_and_die("unknown option '%s'", list_O->data);
++			bb_error_msg_and_die("unknown option '%s'", optstr);
+ 		n = dhcp_options[n].code;
+ 		client_config.opt_mask[n >> 3] |= 1 << (n & 7);
+ 	}
