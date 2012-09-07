From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  7 Sep 2012 20:07:31 +0100
Subject: [Buildroot] [PATCH] pppd: fix build failures
Message-ID: <1347044851-24272-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Fix pppd build failures such as Build 8a9369fece696e012249b865708ffee533c5318a

http://autobuild.buildroot.net/results/8a9369fece696e012249b865708ffee533c5318a/build-end.log

Note that, although this is a build failure, the pppd plugin makefile is
such that plugin build failures are not correctly detected. Consequently,
the failure does not appear until the install phase, at which point the
following error occurs.

/usr/bin/install -D /home/test/test/output/build/pppd-2.4.5/pppd/plugins/rp-pppoe/rp-pppoe.so /home/test/test/output/target/usr/lib/pppd/2.4.5/rp-pppoe.so
/usr/bin/install: cannot stat `/home/test/test/output/build/pppd-2.4.5/pppd/plugins/rp-pppoe/rp-pppoe.so': No such file or directory
make: *** [/home/test/test/output/build/pppd-2.4.5/.stamp_target_installed] Error 1

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch |   37 +++++++++++++++++++++-----
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch b/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch
index 0e71e24..f55a2a2 100644
--- a/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch
+++ b/package/pppd/pppd-2.4.5-ol2tpv3-2.6.35.patch
@@ -1,9 +1,24 @@
---- ppp-2.4.5/include/linux/if_pppol2tp.h       2009-11-16 22:26:07.000000000 +0000
-+++ ppp-2.4.5/include/linux/if_pppol2tp.h       2010-07-16 22:35:22.000000000 +0100
-@@ -32,6 +32,20 @@
-  	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
+diff -Nurp a/include/linux/if_pppol2tp.h b/include/linux/if_pppol2tp.h
+--- a/include/linux/if_pppol2tp.h	2009-11-16 22:26:07.000000000 +0000
++++ b/include/linux/if_pppol2tp.h	2012-09-07 18:06:24.920000993 +0100
+@@ -32,6 +32,45 @@ struct pppol2tp_addr
+ 	__u16 d_tunnel, d_session;	/* For sending outgoing packets */
  };
-
+ 
++/* Structure used to connect() the socket to a particular tunnel UDP 
++ *  * socket over IPv6. 
++ *   */ 
++struct pppol2tpin6_addr { 
++       __kernel_pid_t  pid;            /* pid that owns the fd. 
++                                        * 0 => current */ 
++       int     fd;                     /* FD of UDP socket to use */ 
++ 
++       __u16 s_tunnel, s_session;      /* For matching incoming packets */ 
++       __u16 d_tunnel, d_session;      /* For sending outgoing packets */ 
++ 
++       struct sockaddr_in6 addr;       /* IP address and port to send to */ 
++}; 
++ 
 +/* The L2TPv3 protocol changes tunnel and session ids from 16 to 32
 + * bits. So we need a different sockaddr structure.
 + */
@@ -18,7 +33,17 @@
 +       __u32 d_tunnel, d_session;      /* For sending outgoing packets */
 +};
 +
++struct pppol2tpv3in6_addr { 
++       __kernel_pid_t  pid;            /* pid that owns the fd. 
++                                        * 0 => current */ 
++       int     fd;                     /* FD of UDP or IP socket to use */ 
++ 
++       __u32 s_tunnel, s_session;      /* For matching incoming packets */ 
++       __u32 d_tunnel, d_session;      /* For sending outgoing packets */ 
++ 
++       struct sockaddr_in6 addr;       /* IP address and port to send to */ 
++}; 
++ 
  /* Socket options:
   * DEBUG	- bitmask of debug message categories
   * SENDSEQ	- 0 => don't send packets with sequence numbers
-
-- 
1.7.9.5
