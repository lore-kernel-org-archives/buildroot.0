From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 31 Dec 2008 09:35:22 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20081231093523.1A2F476FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-31 09:35:21 +0000 (Wed, 31 Dec 2008)
New Revision: 24626

Log:
busybox: bump 1.12.x / 1.13.x versions

Removed:
   trunk/buildroot/package/busybox/busybox-1.13.1-bindtodevice.patch
   trunk/buildroot/package/busybox/busybox-1.13.1-crond.patch
   trunk/buildroot/package/busybox/busybox-1.13.1-dc.patch
   trunk/buildroot/package/busybox/busybox-1.13.1-init.patch
   trunk/buildroot/package/busybox/busybox-1.13.1-ip.patch
   trunk/buildroot/package/busybox/busybox-1.13.1-iptunnel-fix-problems-with-linux-include.patch
   trunk/buildroot/package/busybox/busybox-1.13.1-printf.patch

Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2008-12-31 09:35:15 UTC (rev 24625)
+++ trunk/buildroot/package/busybox/Config.in	2008-12-31 09:35:21 UTC (rev 24626)
@@ -65,8 +65,8 @@
 	default "1.9.2"		if BR2_BUSYBOX_VERSION_1_9_X
 	default "1.10.4"	if BR2_BUSYBOX_VERSION_1_10_X
 	default "1.11.3"	if BR2_BUSYBOX_VERSION_1_11_X
-	default "1.12.3"	if BR2_BUSYBOX_VERSION_1_12_X
-	default "1.13.1"	if BR2_BUSYBOX_VERSION_1_13_X
+	default "1.12.4"	if BR2_BUSYBOX_VERSION_1_12_X
+	default "1.13.2"	if BR2_BUSYBOX_VERSION_1_13_X
 
 config BR2_PACKAGE_BUSYBOX_FULLINSTALL
 	bool "Run BusyBox's own full installation"

Deleted: trunk/buildroot/package/busybox/busybox-1.13.1-bindtodevice.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-bindtodevice.patch	2008-12-31 09:35:15 UTC (rev 24625)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-bindtodevice.patch	2008-12-31 09:35:21 UTC (rev 24626)
@@ -1,86 +0,0 @@
---- busybox-1.13.1/include/libbb.h	Sun Nov  9 18:28:17 2008
-+++ busybox-1.13.1-bindtodevice/include/libbb.h	Wed Dec 10 12:10:30 2008
-@@ -437,6 +437,7 @@
-  * Turn it on before you call bind(). */
- void setsockopt_reuseaddr(int fd) FAST_FUNC; /* On Linux this never fails. */
- int setsockopt_broadcast(int fd) FAST_FUNC;
-+int setsockopt_bindtodevice(int fd, const char *iface) FAST_FUNC;
- /* NB: returns port in host byte order */
- unsigned bb_lookup_port(const char *port, const char *protocol, unsigned default_port) FAST_FUNC;
- typedef struct len_and_sockaddr {
---- busybox-1.13.1/libbb/xconnect.c	Sun Nov  9 18:28:09 2008
-+++ busybox-1.13.1-bindtodevice/libbb/xconnect.c	Wed Dec 10 23:20:29 2008
-@@ -7,6 +7,7 @@
-  */
- 
- #include <netinet/in.h>
-+#include <net/if.h>
- #include "libbb.h"
- 
- void FAST_FUNC setsockopt_reuseaddr(int fd)
-@@ -17,6 +18,20 @@
- {
- 	return setsockopt(fd, SOL_SOCKET, SO_BROADCAST, &const_int_1, sizeof(const_int_1));
- }
-+int FAST_FUNC setsockopt_bindtodevice(int fd, const char *iface)
-+{
-+	int r;
-+	struct ifreq ifr;
-+	strncpy(ifr.ifr_name, iface, IFNAMSIZ);
-+	/* Actually, ifr_name is at offset 0, and in practice
-+	 * just giving char[IFNAMSIZ] instead of struct ifreq works too.
-+	 * But just in case it's not true on some obscure arch... */
-+	r = setsockopt(fd, SOL_SOCKET, SO_BINDTODEVICE, &ifr, sizeof(ifr));
-+	if (r)
-+		bb_perror_msg("can't bind to interface %s", iface);
-+	return r;
-+}
-+
- 
- void FAST_FUNC xconnect(int s, const struct sockaddr *s_addr, socklen_t addrlen)
- {
---- busybox-1.13.1/networking/arping.c	Sun Nov  9 18:27:59 2008
-+++ busybox-1.13.1-bindtodevice/networking/arping.c	Wed Dec 10 12:10:30 2008
-@@ -322,8 +322,7 @@
- 		struct sockaddr_in saddr;
- 		int probe_fd = xsocket(AF_INET, SOCK_DGRAM, 0);
- 
--		if (setsockopt(probe_fd, SOL_SOCKET, SO_BINDTODEVICE, device, strlen(device) + 1) == -1)
--			bb_perror_msg("cannot bind to device %s", device);
-+		setsockopt_bindtodevice(probe_fd, device);
- 		memset(&saddr, 0, sizeof(saddr));
- 		saddr.sin_family = AF_INET;
- 		if (src.s_addr) {
---- busybox-1.13.1/networking/ping.c	Sun Nov  9 18:27:59 2008
-+++ busybox-1.13.1-bindtodevice/networking/ping.c	Wed Dec 10 12:10:30 2008
-@@ -572,7 +572,7 @@
- 		xbind(pingsock, &source_lsa->u.sa, source_lsa->len);
- 	}
- 	if (str_I)
--		setsockopt(pingsock, SOL_SOCKET, SO_BINDTODEVICE, str_I, strlen(str_I) + 1);
-+		setsockopt_bindtodevice(pingsock, str_I);
- 
- 	/* enable broadcast pings */
- 	setsockopt_broadcast(pingsock);
-@@ -622,7 +622,7 @@
- 	if (source_lsa)
- 		xbind(pingsock, &source_lsa->u.sa, source_lsa->len);
- 	if (str_I)
--		setsockopt(pingsock, SOL_SOCKET, SO_BINDTODEVICE, str_I, strlen(str_I) + 1);
-+		setsockopt_bindtodevice(pingsock, str_I);
- 
- #ifdef ICMP6_FILTER
- 	{
---- busybox-1.13.1/networking/udhcp/socket.c	Sun Nov  9 18:27:58 2008
-+++ busybox-1.13.1-bindtodevice/networking/udhcp/socket.c	Wed Dec 10 12:10:30 2008
-@@ -98,8 +98,8 @@
- 		bb_perror_msg_and_die("SO_BROADCAST");
- 
- 	/* NB: bug 1032 says this doesn't work on ethernet aliases (ethN:M) */
--	if (setsockopt(fd, SOL_SOCKET, SO_BINDTODEVICE, &inf, strlen(inf) + 1) == -1)
--		bb_perror_msg_and_die("SO_BINDTODEVICE");
-+	if (setsockopt_bindtodevice(fd, inf))
-+		xfunc_die(); /* warning is already printed */
- 
- 	memset(&addr, 0, sizeof(addr));
- 	addr.sin_family = AF_INET;

Deleted: trunk/buildroot/package/busybox/busybox-1.13.1-crond.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-crond.patch	2008-12-31 09:35:15 UTC (rev 24625)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-crond.patch	2008-12-31 09:35:21 UTC (rev 24626)
@@ -1,20 +0,0 @@
---- busybox-1.13.1/miscutils/crond.c	Sun Nov  9 18:28:17 2008
-+++ busybox-1.13.1-crond/miscutils/crond.c	Thu Dec  4 14:56:10 2008
-@@ -779,6 +779,8 @@
- 			xmove_fd(mailFd, mail_filename ? 1 : 0);
- 			dup2(1, 2);
- 		}
-+		/* crond 3.0pl1-100 puts tasks in separate process groups */
-+		bb_setpgrp();
- 		execlp(prog, prog, cmd, arg, NULL);
- 		crondlog(ERR20 "can't exec, user %s cmd %s %s %s", user, prog, cmd, arg);
- 		if (mail_filename) {
-@@ -914,6 +916,8 @@
- 		if (DebugOpt) {
- 			crondlog(LVL5 "child running %s", DEFAULT_SHELL);
- 		}
-+		/* crond 3.0pl1-100 puts tasks in separate process groups */
-+		bb_setpgrp();
- 		execl(DEFAULT_SHELL, DEFAULT_SHELL, "-c", line->cl_Shell, NULL);
- 		crondlog(ERR20 "can't exec, user %s cmd %s %s %s", user,
- 				 DEFAULT_SHELL, "-c", line->cl_Shell);

Deleted: trunk/buildroot/package/busybox/busybox-1.13.1-dc.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-dc.patch	2008-12-31 09:35:15 UTC (rev 24625)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-dc.patch	2008-12-31 09:35:21 UTC (rev 24626)
@@ -1,13 +0,0 @@
---- busybox-1.13.1/miscutils/dc.c	Sun Nov  9 18:28:16 2008
-+++ busybox-1.13.1-dc/miscutils/dc.c	Tue Dec 30 11:36:52 2008
-@@ -19,7 +19,9 @@
- #define pointer   (G.pointer   )
- #define base      (G.base      )
- #define stack     (G.stack     )
--#define INIT_G() do { } while (0)
-+#define INIT_G() do { \
-+	base = 10; \
-+} while (0)
- 
- 
- static void push(double a)

Deleted: trunk/buildroot/package/busybox/busybox-1.13.1-init.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-init.patch	2008-12-31 09:35:15 UTC (rev 24625)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-init.patch	2008-12-31 09:35:21 UTC (rev 24626)
@@ -1,28 +0,0 @@
---- busybox-1.13.1/init/init.c	Sat Nov 29 07:48:56 2008
-+++ busybox-1.13.1-init/init/init.c	Tue Dec  9 22:17:43 2008
-@@ -118,18 +118,18 @@
- 
- 	msg[0] = '\r';
- 	va_start(arguments, fmt);
--	l = vsnprintf(msg + 1, sizeof(msg) - 2, fmt, arguments);
--	if (l > sizeof(msg) - 2)
--		l = sizeof(msg) - 2;
-+	l = 1 + vsnprintf(msg + 1, sizeof(msg) - 2, fmt, arguments);
-+	if (l > sizeof(msg) - 1)
-+		l = sizeof(msg) - 1;
- 	msg[l] = '\0';
- 	va_end(arguments);
- 
- 	if (ENABLE_FEATURE_INIT_SYSLOG) {
--		/* Log the message to syslogd */
- 		if (where & L_LOG) {
--			/* don't print out "\r" */
--			openlog(applet_name, 0, LOG_DAEMON);
--			syslog(LOG_INFO, "init: %s", msg + 1);
-+			/* Log the message to syslogd */
-+			openlog("init", 0, LOG_DAEMON);
-+			/* don't print "\r" */
-+			syslog(LOG_INFO, "%s", msg + 1);
- 			closelog();
- 		}
- 		msg[l++] = '\n';

Deleted: trunk/buildroot/package/busybox/busybox-1.13.1-ip.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-ip.patch	2008-12-31 09:35:15 UTC (rev 24625)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-ip.patch	2008-12-31 09:35:21 UTC (rev 24626)
@@ -1,11 +0,0 @@
---- busybox-1.13.1/networking/ip.c	Sun Nov  9 18:27:59 2008
-+++ busybox-1.13.1-ip/networking/ip.c	Thu Dec  4 13:16:29 2008
-@@ -31,7 +31,7 @@
- 
- static int ip_do(int (*ip_func)(char **argv), char **argv)
- {
--	argv = ip_parse_common_args(argv);
-+	argv = ip_parse_common_args(argv + 1);
- 	return ip_func(argv);
- }
- 

Deleted: trunk/buildroot/package/busybox/busybox-1.13.1-iptunnel-fix-problems-with-linux-include.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-iptunnel-fix-problems-with-linux-include.patch	2008-12-31 09:35:15 UTC (rev 24625)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-iptunnel-fix-problems-with-linux-include.patch	2008-12-31 09:35:21 UTC (rev 24626)
@@ -1,80 +0,0 @@
-From 2534c277b4b1c519ec05689eb3525e95d4f6c602 Mon Sep 17 00:00:00 2001
-From: vda <vda@69ca8d6d-28ef-0310-b511-8ec308f3f277>
-Date: Wed, 3 Dec 2008 20:16:11 +0000
-Subject: [PATCH] iptunnel: fix problems with including linux/ip_tunnel.h
-  on some systems
-
-git-svn-id: svn://busybox.net/trunk/busybox at 24253 69ca8d6d-28ef-0310-b511-8ec308f3f277
----
- networking/libiproute/iptunnel.c |   45 ++++++++++++++++++++++++++++++++++++-
- 1 files changed, 43 insertions(+), 2 deletions(-)
-
-diff --git a/networking/libiproute/iptunnel.c b/networking/libiproute/iptunnel.c
-index ab4d65b..5349587 100644
---- a/networking/libiproute/iptunnel.c
-+++ b/networking/libiproute/iptunnel.c
-@@ -6,7 +6,6 @@
-  *
-  * Authors:	Alexey Kuznetsov, <kuznet@ms2.inr.ac.ru>
-  *
-- *
-  * Changes:
-  *
-  * Rani Assaf <rani@magic.metawire.com> 980929:	resolve addresses
-@@ -18,10 +17,52 @@
- #include <net/if.h>
- #include <net/if_arp.h>
- #include <asm/types.h>
-+
- #ifndef __constant_htons
- #define __constant_htons htons
- #endif
--#include <linux/if_tunnel.h>
-+
-+// FYI: #define SIOCDEVPRIVATE 0x89F0
-+
-+/* From linux/if_tunnel.h. #including it proved troublesome
-+ * (redefiniton errors due to name collisions in linux/ and net[inet]/) */
-+#define SIOCGETTUNNEL   (SIOCDEVPRIVATE + 0)
-+#define SIOCADDTUNNEL   (SIOCDEVPRIVATE + 1)
-+#define SIOCDELTUNNEL   (SIOCDEVPRIVATE + 2)
-+#define SIOCCHGTUNNEL   (SIOCDEVPRIVATE + 3)
-+//#define SIOCGETPRL      (SIOCDEVPRIVATE + 4)
-+//#define SIOCADDPRL      (SIOCDEVPRIVATE + 5)
-+//#define SIOCDELPRL      (SIOCDEVPRIVATE + 6)
-+//#define SIOCCHGPRL      (SIOCDEVPRIVATE + 7)
-+#define GRE_CSUM        __constant_htons(0x8000)
-+//#define GRE_ROUTING     __constant_htons(0x4000)
-+#define GRE_KEY         __constant_htons(0x2000)
-+#define GRE_SEQ         __constant_htons(0x1000)
-+//#define GRE_STRICT      __constant_htons(0x0800)
-+//#define GRE_REC         __constant_htons(0x0700)
-+//#define GRE_FLAGS       __constant_htons(0x00F8)
-+//#define GRE_VERSION     __constant_htons(0x0007)
-+struct ip_tunnel_parm {
-+	char            name[IFNAMSIZ];
-+	int             link;
-+	uint16_t        i_flags;
-+	uint16_t        o_flags;
-+	uint32_t        i_key;
-+	uint32_t        o_key;
-+	struct iphdr    iph;
-+};
-+/* SIT-mode i_flags */
-+//#define SIT_ISATAP 0x0001
-+//struct ip_tunnel_prl {
-+//	uint32_t          addr;
-+//	uint16_t          flags;
-+//	uint16_t          __reserved;
-+//	uint32_t          datalen;
-+//	uint32_t          __reserved2;
-+//	/* data follows */
-+//};
-+///* PRL flags */
-+//#define PRL_DEFAULT 0x0001
- 
- #include "ip_common.h"  /* #include "libbb.h" is inside */
- #include "rt_names.h"
--- 
-1.5.6.5
-

Deleted: trunk/buildroot/package/busybox/busybox-1.13.1-printf.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.13.1-printf.patch	2008-12-31 09:35:15 UTC (rev 24625)
+++ trunk/buildroot/package/busybox/busybox-1.13.1-printf.patch	2008-12-31 09:35:21 UTC (rev 24626)
@@ -1,19 +0,0 @@
---- busybox-1.13.1/coreutils/printf.c	Sun Nov  9 18:28:07 2008
-+++ busybox-1.13.1-printf/coreutils/printf.c	Wed Dec 10 12:50:55 2008
-@@ -359,8 +359,15 @@
- 	 * We will mimic coreutils. */
- 	if (argv[1] && argv[1][0] == '-' && argv[1][1] == '-' && !argv[1][2])
- 		argv++;
--	if (!argv[1])
-+	if (!argv[1]) {
-+		if (ENABLE_ASH_BUILTIN_PRINTF
-+		 && applet_name[0] != 'p'
-+		) {
-+			bb_error_msg("usage: printf FORMAT [ARGUMENT...]");
-+			return 2; /* bash compat */
-+		}
- 		bb_show_usage();
-+	}
- 
- 	format = argv[1];
- 	argv2 = argv + 2;
