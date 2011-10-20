From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 20 Oct 2011 14:48:50 -0300
Subject: [Buildroot] [PATCH 1/4] pppd: bugfixes and enhancements
Message-ID: <1319132933-13938-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix exponential timeout bug for PPPoE.
Fix undefined (0.0.0.0) default gateway issue.
Add adaptive LCP echo patch and gateway metric functionality.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pppd/pppd-2.4.5-defaultgateway.patch       |   95 ++++++++++++++++
 package/pppd/pppd-2.4.5-defaultmetric.patch        |  115 ++++++++++++++++++++
 package/pppd/pppd-2.4.5-lcp-echo-adaptive.patch    |   64 +++++++++++
 .../pppd/pppd-2.4.5-no-exponential-timeout.patch   |   28 +++++
 4 files changed, 302 insertions(+), 0 deletions(-)
 create mode 100644 package/pppd/pppd-2.4.5-defaultgateway.patch
 create mode 100644 package/pppd/pppd-2.4.5-defaultmetric.patch
 create mode 100644 package/pppd/pppd-2.4.5-lcp-echo-adaptive.patch
 create mode 100644 package/pppd/pppd-2.4.5-no-exponential-timeout.patch

diff --git a/package/pppd/pppd-2.4.5-defaultgateway.patch b/package/pppd/pppd-2.4.5-defaultgateway.patch
new file mode 100644
index 0000000..8a4f621
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-defaultgateway.patch
@@ -0,0 +1,95 @@
+This patch reverses revision 1.114 of the pppd/sys-linux.c file.
+The default gateway is needed by the openswan's %defaultroute.
+
+Obtained from gentoo patchset.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nur ppp-2.4.5.orig/pppd/sys-linux.c ppp-2.4.5/pppd/sys-linux.c
+--- ppp-2.4.5.orig/pppd/sys-linux.c	2010-08-08 09:44:29.000000000 +0200
++++ ppp-2.4.5/pppd/sys-linux.c	2010-08-08 09:53:02.000000000 +0200
+@@ -209,7 +209,7 @@
+ static unsigned char inbuf[512]; /* buffer for chars read from loopback */
+ 
+ static int	if_is_up;	/* Interface has been marked up */
+-static int	have_default_route;	/* Gateway for default route added */
++static u_int32_t default_route_gateway;	/* Gateway for default route added */
+ static u_int32_t proxy_arp_addr;	/* Addr for proxy arp entry added */
+ static char proxy_arp_dev[16];		/* Device for proxy arp entry */
+ static u_int32_t our_old_addr;		/* for detecting address changes */
+@@ -346,8 +346,8 @@
+ /*
+  * Delete any routes through the device.
+  */
+-    if (have_default_route)
+-	cifdefaultroute(0, 0, 0);
++    if (default_route_gateway != 0)
++	cifdefaultroute(0, 0, default_route_gateway);
+ 
+     if (has_proxy_arp)
+ 	cifproxyarp(0, proxy_arp_addr);
+@@ -1639,17 +1639,17 @@
+     struct rtentry rt;
+ 
+     if (defaultroute_exists(&rt) && strcmp(rt.rt_dev, ifname) != 0) {
+-	if (rt.rt_flags & RTF_GATEWAY)
+-	    error("not replacing existing default route via %I",
+-		  SIN_ADDR(rt.rt_gateway));
+-	else
+-	    error("not replacing existing default route through %s",
+-		  rt.rt_dev);
++	u_int32_t old_gateway = SIN_ADDR(rt.rt_gateway);
++
++	if (old_gateway != gateway)
++	    error("not replacing existing default route to %s [%I]",
++		  rt.rt_dev, old_gateway);
+ 	return 0;
+     }
+ 
+-    memset (&rt, 0, sizeof (rt));
+-    SET_SA_FAMILY (rt.rt_dst, AF_INET);
++    memset (&rt, '\0', sizeof (rt));
++    SET_SA_FAMILY (rt.rt_dst,     AF_INET);
++    SET_SA_FAMILY (rt.rt_gateway, AF_INET);
+ 
+     rt.rt_dev = ifname;
+ 
+@@ -1658,14 +1658,16 @@
+ 	SIN_ADDR(rt.rt_genmask) = 0L;
+     }
+ 
+-    rt.rt_flags = RTF_UP;
++    SIN_ADDR(rt.rt_gateway) = gateway;
++
++    rt.rt_flags = RTF_UP | RTF_GATEWAY;
+     if (ioctl(sock_fd, SIOCADDRT, &rt) < 0) {
+ 	if ( ! ok_error ( errno ))
+ 	    error("default route ioctl(SIOCADDRT): %m");
+ 	return 0;
+     }
+ 
+-    have_default_route = 1;
++    default_route_gateway = gateway;
+     return 1;
+ }
+ 
+@@ -1678,7 +1680,7 @@
+ {
+     struct rtentry rt;
+ 
+-    have_default_route = 0;
++    default_route_gateway = 0;
+ 
+     memset (&rt, '\0', sizeof (rt));
+     SET_SA_FAMILY (rt.rt_dst,     AF_INET);
+@@ -1691,7 +1693,9 @@
+ 	SIN_ADDR(rt.rt_genmask) = 0L;
+     }
+ 
+-    rt.rt_flags = RTF_UP;
++    SIN_ADDR(rt.rt_gateway) = gateway;
++
++    rt.rt_flags = RTF_UP | RTF_GATEWAY;
+     if (ioctl(sock_fd, SIOCDELRT, &rt) < 0 && errno != ESRCH) {
+ 	if (still_ppp()) {
+ 	    if ( ! ok_error ( errno ))
diff --git a/package/pppd/pppd-2.4.5-defaultmetric.patch b/package/pppd/pppd-2.4.5-defaultmetric.patch
new file mode 100644
index 0000000..e32055e
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-defaultmetric.patch
@@ -0,0 +1,115 @@
+Introduce an option to set metric for the gateway.
+Most useful for multiple PPP links.
+
+Obtained from gentoo patchset.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nru ppp-2.4.5.orig/pppd/options.c ppp-2.4.5/pppd/options.c
+--- ppp-2.4.5.orig/pppd/options.c	2010-08-08 09:44:29.000000000 +0200
++++ ppp-2.4.5/pppd/options.c	2010-08-08 10:07:50.000000000 +0200
+@@ -94,6 +94,7 @@
+ int	kdebugflag = 0;		/* Tell kernel to print debug messages */
+ int	default_device = 1;	/* Using /dev/tty or equivalent */
+ char	devnam[MAXPATHLEN];	/* Device name */
++int defaultmetric = 0;		/* Metric of the default route */
+ bool	nodetach = 0;		/* Don't detach from controlling tty */
+ bool	updetach = 0;		/* Detach once link is up */
+ int	maxconnect = 0;		/* Maximum connect time */
+@@ -289,6 +290,10 @@
+       "Number of seconds to wait for child processes at exit",
+       OPT_PRIO },
+ 
++    { "defaultmetric", o_int, &defaultmetric,
++      "The metric of the default route",
++      OPT_LIMITS, 0, 32766 },
++
+ #ifdef HAVE_MULTILINK
+     { "multilink", o_bool, &multilink,
+       "Enable multilink operation", OPT_PRIO | 1 },
+diff -Nru ppp-2.4.5.orig/pppd/pppd.8 ppp-2.4.5/pppd/pppd.8
+--- ppp-2.4.5.orig/pppd/pppd.8	2010-08-08 10:06:57.000000000 +0200
++++ ppp-2.4.5/pppd/pppd.8	2010-08-08 10:07:50.000000000 +0200
+@@ -121,6 +121,9 @@
+ This entry is removed when the PPP connection is broken.  This option
+ is privileged if the \fInodefaultroute\fR option has been specified.
+ .TP
++.B defaultmetric \fIn
++The metric of the default route configured by pppd; default is 0.
++.TP
+ .B disconnect \fIscript
+ Execute the command specified by \fIscript\fR, by passing it to a
+ shell, after
+diff -Nru ppp-2.4.5.orig/pppd/pppd.h ppp-2.4.5/pppd/pppd.h
+--- ppp-2.4.5.orig/pppd/pppd.h	2010-08-08 09:58:19.000000000 +0200
++++ ppp-2.4.5/pppd/pppd.h	2010-08-08 10:07:50.000000000 +0200
+@@ -276,6 +276,7 @@
+ extern int	kdebugflag;	/* Tell kernel to print debug messages */
+ extern int	default_device;	/* Using /dev/tty or equivalent */
+ extern char	devnam[MAXPATHLEN];	/* Device name */
++extern int defaultmetric;		/* Metric of the default route */
+ extern int	crtscts;	/* Use hardware flow control */
+ extern bool	modem;		/* Use modem control lines */
+ extern int	inspeed;	/* Input/Output speed requested */
+diff -Nru ppp-2.4.5.orig/pppd/sys-linux.c ppp-2.4.5/pppd/sys-linux.c
+--- ppp-2.4.5.orig/pppd/sys-linux.c	2010-08-08 09:53:56.000000000 +0200
++++ ppp-2.4.5/pppd/sys-linux.c	2010-08-08 10:07:50.000000000 +0200
+@@ -1465,7 +1465,7 @@
+ FILE *route_fd = (FILE *) 0;
+ static char route_buffer[512];
+ static int route_dev_col, route_dest_col, route_gw_col;
+-static int route_flags_col, route_mask_col;
++static int route_flags_col, route_mask_col, route_metric_col;
+ static int route_num_cols;
+ 
+ static int open_route_table (void);
+@@ -1508,6 +1508,7 @@
+     route_dest_col = 1;
+     route_gw_col = 2;
+     route_flags_col = 3;
++    route_metric_col = 6;
+     route_mask_col = 7;
+     route_num_cols = 8;
+ 
+@@ -1527,6 +1528,8 @@
+ 		route_gw_col = col;
+ 	    else if (strcasecmp(q, "flags") == 0)
+ 		route_flags_col = col;
++	    else if (strcasecmp(q, "metric") == 0)
++		route_metric_col = col;
+ 	    else if (strcasecmp(q, "mask") == 0)
+ 		route_mask_col = col;
+ 	    else
+@@ -1569,6 +1572,7 @@
+ 
+     rt->rt_flags = (short) strtoul(cols[route_flags_col], NULL, 16);
+     rt->rt_dev   = cols[route_dev_col];
++    rt->rt_metric = (short) strtoul(cols[route_metric_col], NULL, 16);
+ 
+     return 1;
+ }
+@@ -1591,6 +1595,8 @@
+ 
+ 	if (kernel_version > KVERSION(2,1,0) && SIN_ADDR(rt->rt_genmask) != 0)
+ 	    continue;
++	if (rt->rt_metric != defaultmetric) /* consider only routes with the same metric */
++	    continue;
+ 	if (SIN_ADDR(rt->rt_dst) == 0L) {
+ 	    result = 1;
+ 	    break;
+@@ -1661,6 +1667,7 @@
+     SIN_ADDR(rt.rt_gateway) = gateway;
+ 
+     rt.rt_flags = RTF_UP | RTF_GATEWAY;
++    rt.rt_metric = defaultmetric + 1; /* +1 for binary compatibility */
+     if (ioctl(sock_fd, SIOCADDRT, &rt) < 0) {
+ 	if ( ! ok_error ( errno ))
+ 	    error("default route ioctl(SIOCADDRT): %m");
+@@ -1696,6 +1703,7 @@
+     SIN_ADDR(rt.rt_gateway) = gateway;
+ 
+     rt.rt_flags = RTF_UP | RTF_GATEWAY;
++    rt.rt_metric = defaultmetric + 1; /* +1 for binary compatibility */
+     if (ioctl(sock_fd, SIOCDELRT, &rt) < 0 && errno != ESRCH) {
+ 	if (still_ppp()) {
+ 	    if ( ! ok_error ( errno ))
diff --git a/package/pppd/pppd-2.4.5-lcp-echo-adaptive.patch b/package/pppd/pppd-2.4.5-lcp-echo-adaptive.patch
new file mode 100644
index 0000000..dbd926a
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-lcp-echo-adaptive.patch
@@ -0,0 +1,64 @@
+Introduce an adaptive LCP echo option to avoid unnecessary traffic.
+
+Obtained from gentoo patchset.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nru ppp-2.4.5.orig/pppd/lcp.c ppp-2.4.5/pppd/lcp.c
+--- ppp-2.4.5.orig/pppd/lcp.c	2009-11-16 23:26:07.000000000 +0100
++++ ppp-2.4.5/pppd/lcp.c	2010-11-27 10:46:26.000000000 +0100
+@@ -73,6 +73,7 @@
+  */
+ int	lcp_echo_interval = 0; 	/* Interval between LCP echo-requests */
+ int	lcp_echo_fails = 0;	/* Tolerance to unanswered echo-requests */
++bool	lcp_echo_adaptive = 0;	/* request echo only if the link was idle */
+ bool	lax_recv = 0;		/* accept control chars in asyncmap */
+ bool	noendpoint = 0;		/* don't send/accept endpoint discriminator */
+ 
+@@ -151,6 +152,8 @@
+       OPT_PRIO },
+     { "lcp-echo-interval", o_int, &lcp_echo_interval,
+       "Set time in seconds between LCP echo requests", OPT_PRIO },
++    { "lcp-echo-adaptive", o_bool, &lcp_echo_adaptive,
++      "Suppress LCP echo requests if traffic was received", 1 },
+     { "lcp-restart", o_int, &lcp_fsm[0].timeouttime,
+       "Set time in seconds between LCP retransmissions", OPT_PRIO },
+     { "lcp-max-terminate", o_int, &lcp_fsm[0].maxtermtransmits,
+@@ -2322,6 +2325,22 @@
+     }
+ 
+     /*
++     * If adaptive echos have been enabled, only send the echo request if
++     * no traffic was received since the last one.
++     */
++    if (lcp_echo_adaptive) {
++       static unsigned int last_pkts_in = 0;
++
++       update_link_stats(f->unit);
++       link_stats_valid = 0;
++
++       if (link_stats.pkts_in != last_pkts_in) {
++           last_pkts_in = link_stats.pkts_in;
++           return;
++       }
++    }
++
++    /*
+      * Make and send the echo request frame.
+      */
+     if (f->state == OPENED) {
+diff -Nru ppp-2.4.5.orig/pppd/pppd.8 ppp-2.4.5/pppd/pppd.8
+--- ppp-2.4.5.orig/pppd/pppd.8	2009-11-16 23:26:07.000000000 +0100
++++ ppp-2.4.5/pppd/pppd.8	2010-11-27 10:44:58.000000000 +0100
+@@ -549,6 +549,11 @@
+ dynamic IP address option (i.e. set /proc/sys/net/ipv4/ip_dynaddr to
+ 1) in demand mode if the local address changes.
+ .TP
++.B lcp\-echo\-adaptive
++If this option is used with the \fIlcp\-echo\-failure\fR option then
++pppd will send LCP echo\-request frames only if no traffic was received
++from the peer since the last echo\-request was sent.
++.TP
+ .B lcp\-echo\-failure \fIn
+ If this option is given, pppd will presume the peer to be dead
+ if \fIn\fR LCP echo\-requests are sent without receiving a valid LCP
diff --git a/package/pppd/pppd-2.4.5-no-exponential-timeout.patch b/package/pppd/pppd-2.4.5-no-exponential-timeout.patch
new file mode 100644
index 0000000..431f7bf
--- /dev/null
+++ b/package/pppd/pppd-2.4.5-no-exponential-timeout.patch
@@ -0,0 +1,28 @@
+Fix exponential timeout bug for PPPoE.
+
+Obtained from OpenWRT svn.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+--- a/pppd/plugins/rp-pppoe/discovery.c
++++ b/pppd/plugins/rp-pppoe/discovery.c
+@@ -548,7 +548,9 @@ discovery(PPPoEConnection *conn)
+ 	conn->discoveryState = STATE_SENT_PADI;
+ 	waitForPADO(conn, timeout);
+ 
++#if 0
+ 	timeout *= 2;
++#endif
+     } while (conn->discoveryState == STATE_SENT_PADI);
+ 
+     timeout = conn->discoveryTimeout;
+@@ -563,7 +565,9 @@ discovery(PPPoEConnection *conn)
+ 	sendPADR(conn);
+ 	conn->discoveryState = STATE_SENT_PADR;
+ 	waitForPADS(conn, timeout);
++#if 0
+ 	timeout *= 2;
++#endif
+     } while (conn->discoveryState == STATE_SENT_PADR);
+ 
+     /* We're done. */
-- 
1.7.3.4
