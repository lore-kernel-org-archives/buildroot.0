From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon,  4 Dec 2006 07:54:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20061204155455.1EA4E485EE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-04 07:54:54 -0800 (Mon, 04 Dec 2006)
New Revision: 16778

Log:
- re-add IFA_ and IFLA_ defines that were removed by YOSHIFUJI Hideaki in cbde1668e4f08e0a150207646010bc65e1e2a42b
  Userspace still needs those.


Added:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.19-IF-defines.patch


Changeset:
Added: trunk/buildroot/toolchain/kernel-headers/linux-2.6.19-IF-defines.patch
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/linux-2.6.19-IF-defines.patch	2006-12-04 13:39:50 UTC (rev 16777)
+++ trunk/buildroot/toolchain/kernel-headers/linux-2.6.19-IF-defines.patch	2006-12-04 15:54:54 UTC (rev 16778)
@@ -0,0 +1,35 @@
+diff -Naur linux-headers-2.6.19.orig/include/linux/if_addr.h linux-headers-2.6.19/include/linux/if_addr.h
+--- linux-headers-2.6.19.orig/include/linux/if_addr.h	2006-11-29 13:57:37.000000000 -0800
++++ linux-headers-2.6.19/include/linux/if_addr.h	2006-11-30 08:28:48.000000000 -0800
+@@ -52,4 +52,7 @@
+ 	__u32	tstamp; /* updated timestamp, hundredths of seconds */
+ };
+ 
++#define IFA_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct ifaddrmsg))))
++#define IFA_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct ifaddrmsg))
++
+ #endif
+diff -Naur linux-headers-2.6.19.orig/include/linux/if_link.h linux-headers-2.6.19/include/linux/if_link.h
+--- linux-headers-2.6.19.orig/include/linux/if_link.h	2006-11-29 13:57:37.000000000 -0800
++++ linux-headers-2.6.19/include/linux/if_link.h	2006-11-30 08:28:48.000000000 -0800
+@@ -82,6 +82,9 @@
+ 
+ #define IFLA_MAX (__IFLA_MAX - 1)
+ 
++#define IFLA_RTA(r)  ((struct rtattr*)(((char*)(r)) + NLMSG_ALIGN(sizeof(struct ifinfomsg))))
++#define IFLA_PAYLOAD(n) NLMSG_PAYLOAD(n,sizeof(struct ifinfomsg))
++
+ /* ifi_flags.
+ 
+    IFF_* flags.
+diff -Naur linux-headers-2.6.19.orig/include/linux/rtnetlink.h linux-headers-2.6.19/include/linux/rtnetlink.h
+--- linux-headers-2.6.19.orig/include/linux/rtnetlink.h	2006-11-29 13:57:37.000000000 -0800
++++ linux-headers-2.6.19/include/linux/rtnetlink.h	2006-11-30 08:28:48.000000000 -0800
+@@ -2,6 +2,7 @@
+ #define __LINUX_RTNETLINK_H
+ 
+ #include <linux/netlink.h>
++#include <linux/if_addr.h>
+ #include <linux/if_link.h>
+ 
+ /****
