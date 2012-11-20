From: Alexander Varnin <fenixk19@mail.ru>
Date: Tue, 20 Nov 2012 14:43:42 +0400
Subject: [Buildroot] [PATCH] pppd: ol2tpv* patch updated from 2.6.35 header
	to 3.6
Message-ID: <1353408222-4111-1-git-send-email-fenixk19@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

pppd-2.4.5 doesn't build anymore with v3.6 headers installed.
This patch replaces the old one, for 2.6.35 header, and makes
it to build correctly.

Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
---
 package/pppd/pppd-2.4.5-ol2tp-v3.6.patch     |   99 ++++++++++++++++++++++++++
 package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch |   24 ------
 2 files changed, 99 insertions(+), 24 deletions(-)
 create mode 100644 package/pppd/pppd-2.4.5-ol2tp-v3.6.patch
 delete mode 100644 package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch

diff --git a/package/pppd/pppd-2.4.5-ol2tp-v3.6.patch b/package/pppd/pppd-2.4.5-ol2tp-v3.6.patch
new file mode 100644
index 0000000..b9936eb
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-ol2tp-v3.6.patch
@@ -0,0 +1,99 @@
+diff -rp ppp-2.4.5-old/include/linux/if_pppol2tp.h ppp-2.4.5-new/include/linux/if_pppol2tp.h
+*** ppp-2.4.5-old/include/linux/if_pppol2tp.h	2009-11-17 01:26:07.000000000 +0300
+--- ppp-2.4.5-new/include/linux/if_pppol2tp.h	2012-11-08 20:16:38.000000000 +0400
+***************
+*** 2,8 ****
+   * Linux PPP over L2TP (PPPoL2TP) Socket Implementation (RFC 2661)
+   *
+   * This file supplies definitions required by the PPP over L2TP driver
+!  * (pppol2tp.c).  All version information wrt this file is located in pppol2tp.c
+   *
+   * License:
+   *		This program is free software; you can redistribute it and/or
+--- 2,8 ----
+   * Linux PPP over L2TP (PPPoL2TP) Socket Implementation (RFC 2661)
+   *
+   * This file supplies definitions required by the PPP over L2TP driver
+!  * (l2tp_ppp.c).  All version information wrt this file is located in l2tp_ppp.c
+   *
+   * License:
+   *		This program is free software; you can redistribute it and/or
+***************
+*** 15,28 ****
+  #ifndef __LINUX_IF_PPPOL2TP_H
+  #define __LINUX_IF_PPPOL2TP_H
+  
+! #include <asm/types.h>
+  
+  /* Structure used to connect() the socket to a particular tunnel UDP
+!  * socket.
+   */
+! struct pppol2tp_addr
+! {
+! 	pid_t	pid;			/* pid that owns the fd.
+  					 * 0 => current */
+  	int	fd;			/* FD of UDP socket to use */
+  
+--- 15,28 ----
+  #ifndef __LINUX_IF_PPPOL2TP_H
+  #define __LINUX_IF_PPPOL2TP_H
+  
+! #include <linux/types.h>
+! 
+  
+  /* Structure used to connect() the socket to a particular tunnel UDP
+!  * socket over IPv4.
+   */
+! struct pppol2tp_addr {
+! 	__kernel_pid_t	pid;		/* pid that owns the fd.
+  					 * 0 => current */
+  	int	fd;			/* FD of UDP socket to use */
+  
+*************** struct pppol2tp_addr
+*** 32,37 ****
+--- 32,76 ----
+  	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
+  };
+  
++ /* Structure used to connect() the socket to a particular tunnel UDP
++  * socket over IPv6.
++  */
++ struct pppol2tpin6_addr {
++ 	__kernel_pid_t	pid;		/* pid that owns the fd.
++ 					 * 0 => current */
++ 	int	fd;			/* FD of UDP socket to use */
++ 
++ 	__u16 s_tunnel, s_session;	/* For matching incoming packets */
++ 	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
++ 
++ 	struct sockaddr_in6 addr;	/* IP address and port to send to */
++ };
++ 
++ /* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
++  * bits. So we need a different sockaddr structure.
++  */
++ struct pppol2tpv3_addr {
++ 	__kernel_pid_t	pid;		/* pid that owns the fd.
++ 					 * 0 => current */
++ 	int	fd;			/* FD of UDP or IP socket to use */
++ 
++ 	struct sockaddr_in addr;	/* IP address and port to send to */
++ 
++ 	__u32 s_tunnel, s_session;	/* For matching incoming packets */
++ 	__u32 d_tunnel, d_session;	/* For sending outgoing packets */
++ };
++ 
++ struct pppol2tpv3in6_addr {
++ 	__kernel_pid_t	pid;		/* pid that owns the fd.
++ 					 * 0 => current */
++ 	int	fd;			/* FD of UDP or IP socket to use */
++ 
++ 	__u32 s_tunnel, s_session;	/* For matching incoming packets */
++ 	__u32 d_tunnel, d_session;	/* For sending outgoing packets */
++ 
++ 	struct sockaddr_in6 addr;	/* IP address and port to send to */
++ };
++ 
+  /* Socket options:
+   * DEBUG	- bitmask of debug message categories
+   * SENDSEQ	- 0 => don't send packets with sequence numbers
diff --git a/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch b/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch
deleted file mode 100644
index 0e71e24..0000000
--- a/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- ppp-2.4.5/include/linux/if_pppol2tp.h       2009-11-16 22:26:07.000000000 +0000
-+++ ppp-2.4.5/include/linux/if_pppol2tp.h       2010-07-16 22:35:22.000000000 +0100
-@@ -32,6 +32,20 @@
-  	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
- };
-
-+/* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
-+ * bits. So we need a different sockaddr structure.
-+ */
-+struct pppol2tpv3_addr {
-+       pid_t   pid;                    /* pid that owns the fd.
-+                                        * 0 => current */
-+       int     fd;                     /* FD of UDP or IP socket to use */
-+
-+       struct sockaddr_in addr;        /* IP address and port to send to */
-+
-+       __u32 s_tunnel, s_session;      /* For matching incoming packets */
-+       __u32 d_tunnel, d_session;      /* For sending outgoing packets */
-+};
-+
- /* Socket options:
-  * DEBUG	- bitmask of debug message categories
-  * SENDSEQ	- 0 => don't send packets with sequence numbers
-
-- 
1.7.2.5
