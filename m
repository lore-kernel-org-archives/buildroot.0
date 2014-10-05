From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  5 Oct 2014 19:17:37 +0200
Subject: [Buildroot] [PATCH] netcat-openbsd: new package
Message-ID: <1412529457-5978-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/Config.in                                  |   1 +
 .../0001-port-to-linux-with-libsd.patch            | 475 +++++++++++++++++++++
 package/netcat-openbsd/0002-connect-timeout.patch  | 121 ++++++
 package/netcat-openbsd/0003-get-sev-by-name.patch  |  34 ++
 package/netcat-openbsd/0004-poll-hup.patch         |  59 +++
 package/netcat-openbsd/0005-send-crlf.patch        | 108 +++++
 package/netcat-openbsd/0006-quit-timer.patch       | 133 ++++++
 package/netcat-openbsd/0007-udp-scan-timeout.patch |  60 +++
 .../netcat-openbsd/0008-verbose-numeric-port.patch | 106 +++++
 package/netcat-openbsd/0009-dccp-support.patch     | 304 +++++++++++++
 ...0010-serialized-handling-multiple-clients.patch |  75 ++++
 .../0011-misc-failures-and-features.patch          | 457 ++++++++++++++++++++
 package/netcat-openbsd/Config.in                   |  15 +
 package/netcat-openbsd/netcat-openbsd.mk           |  22 +
 14 files changed, 1970 insertions(+)
 create mode 100644 package/netcat-openbsd/0001-port-to-linux-with-libsd.patch
 create mode 100644 package/netcat-openbsd/0002-connect-timeout.patch
 create mode 100644 package/netcat-openbsd/0003-get-sev-by-name.patch
 create mode 100644 package/netcat-openbsd/0004-poll-hup.patch
 create mode 100644 package/netcat-openbsd/0005-send-crlf.patch
 create mode 100644 package/netcat-openbsd/0006-quit-timer.patch
 create mode 100644 package/netcat-openbsd/0007-udp-scan-timeout.patch
 create mode 100644 package/netcat-openbsd/0008-verbose-numeric-port.patch
 create mode 100644 package/netcat-openbsd/0009-dccp-support.patch
 create mode 100644 package/netcat-openbsd/0010-serialized-handling-multiple-clients.patch
 create mode 100644 package/netcat-openbsd/0011-misc-failures-and-features.patch
 create mode 100644 package/netcat-openbsd/Config.in
 create mode 100644 package/netcat-openbsd/netcat-openbsd.mk

diff --git a/package/Config.in b/package/Config.in
index f488728..c4ea688 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1026,6 +1026,7 @@ endif
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/netcat/Config.in"
 endif
+	source "package/netcat-openbsd/Config.in"
 	source "package/netplug/Config.in"
 	source "package/netsnmp/Config.in"
 	source "package/netstat-nat/Config.in"
diff --git a/package/netcat-openbsd/0001-port-to-linux-with-libsd.patch b/package/netcat-openbsd/0001-port-to-linux-with-libsd.patch
new file mode 100644
index 0000000..08567c7
--- /dev/null
+++ b/package/netcat-openbsd/0001-port-to-linux-with-libsd.patch
@@ -0,0 +1,475 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 15:59:31 +0800
+Subject: port to linux with libsd
+
+---
+ Makefile |   17 ++++++++--
+ nc.1     |    4 +--
+ netcat.c |  105 +++++++++++++++++++++++++++++++++++++++++++++++++++++---------
+ socks.c  |   46 +++++++++++++--------------
+ 4 files changed, 130 insertions(+), 42 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 150f829..96a6587 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,19 @@
+-#	$OpenBSD: Makefile,v 1.6 2001/09/02 18:45:41 jakob Exp $
++#       $OpenBSD: Makefile,v 1.6 2001/09/02 18:45:41 jakob Exp $
+ 
+ PROG=	nc
+ SRCS=	netcat.c atomicio.c socks.c
+ 
+-.include <bsd.prog.mk>
++LIBS=  `pkg-config --libs libbsd` -lresolv
++OBJS=  $(SRCS:.c=.o)
++CFLAGS=  -g -O2
++LDFLAGS=  -Wl,--no-add-needed
++
++all: nc
++nc: $(OBJS)
++	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o nc
++
++$(OBJS): %.o: %.c
++	$(CC) $(CFLAGS) -c $< -o $@
++
++clean:
++	rm -f $(OBJS) nc
+diff --git a/nc.1 b/nc.1
+index 75d1437..b7014a2 100644
+--- a/nc.1
++++ b/nc.1
+@@ -146,9 +146,6 @@ Proxy authentication is only supported for HTTP CONNECT proxies@present.
+ Specifies the source port
+ .Nm
+ should use, subject to privilege restrictions and availability.
+-It is an error to use this option in conjunction with the
+-.Fl l
+-option.
+ .It Fl r
+ Specifies that source and/or destination ports should be chosen randomly
+ instead of sequentially within a range or in the order that the system
+@@ -170,6 +167,7 @@ Change IPv4 TOS value.
+ may be one of
+ .Ar critical ,
+ .Ar inetcontrol ,
++.Ar lowcost ,
+ .Ar lowdelay ,
+ .Ar netcontrol ,
+ .Ar throughput ,
+diff --git a/netcat.c b/netcat.c
+index cc4683a..9b2def2 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -42,6 +42,46 @@
+ #include <netinet/ip.h>
+ #include <arpa/telnet.h>
+ 
++#ifndef IPTOS_LOWDELAY
++# define IPTOS_LOWDELAY 0x10
++# define IPTOS_THROUGHPUT 0x08
++# define IPTOS_RELIABILITY 0x04
++# define IPTOS_LOWCOST 0x02
++# define IPTOS_MINCOST IPTOS_LOWCOST
++#endif /* IPTOS_LOWDELAY */
++
++# ifndef IPTOS_DSCP_AF11
++# define	IPTOS_DSCP_AF11		0x28
++# define	IPTOS_DSCP_AF12		0x30
++# define	IPTOS_DSCP_AF13		0x38
++# define	IPTOS_DSCP_AF21		0x48
++# define	IPTOS_DSCP_AF22		0x50
++# define	IPTOS_DSCP_AF23		0x58
++# define	IPTOS_DSCP_AF31		0x68
++# define	IPTOS_DSCP_AF32		0x70
++# define	IPTOS_DSCP_AF33		0x78
++# define	IPTOS_DSCP_AF41		0x88
++# define	IPTOS_DSCP_AF42		0x90
++# define	IPTOS_DSCP_AF43		0x98
++# define	IPTOS_DSCP_EF		0xb8
++#endif /* IPTOS_DSCP_AF11 */
++
++#ifndef IPTOS_DSCP_CS0
++# define	IPTOS_DSCP_CS0		0x00
++# define	IPTOS_DSCP_CS1		0x20
++# define	IPTOS_DSCP_CS2		0x40
++# define	IPTOS_DSCP_CS3		0x60
++# define	IPTOS_DSCP_CS4		0x80
++# define	IPTOS_DSCP_CS5		0xa0
++# define	IPTOS_DSCP_CS6		0xc0
++# define	IPTOS_DSCP_CS7		0xe0
++#endif /* IPTOS_DSCP_CS0 */
++
++#ifndef IPTOS_DSCP_EF
++# define	IPTOS_DSCP_EF		0xb8
++#endif /* IPTOS_DSCP_EF */
++
++
+ #include <err.h>
+ #include <errno.h>
+ #include <netdb.h>
+@@ -53,6 +93,8 @@
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <limits.h>
++#include <bsd/stdlib.h>
++#include <bsd/string.h>
+ #include "atomicio.h"
+ 
+ #ifndef SUN_LEN
+@@ -118,7 +160,7 @@ main(int argc, char *argv[])
+ 	struct servent *sv;
+ 	socklen_t len;
+ 	struct sockaddr_storage cliaddr;
+-	char *proxy;
++	char *proxy = NULL;
+ 	const char *errstr, *proxyhost = "", *proxyport = NULL;
+ 	struct addrinfo proxyhints;
+ 	char unix_dg_tmp_socket_buf[UNIX_DG_TMP_SOCKET_SIZE];
+@@ -164,7 +206,11 @@ main(int argc, char *argv[])
+ 				errx(1, "interval %s: %s", errstr, optarg);
+ 			break;
+ 		case 'j':
++# if defined(SO_JUMBO)
+ 			jflag = 1;
++# else
++			errx(1, "no jumbo frame support available");
++# endif
+ 			break;
+ 		case 'k':
+ 			kflag = 1;
+@@ -194,10 +240,14 @@ main(int argc, char *argv[])
+ 			uflag = 1;
+ 			break;
+ 		case 'V':
++# if defined(RT_TABLEID_MAX)
+ 			rtableid = (unsigned int)strtonum(optarg, 0,
+ 			    RT_TABLEID_MAX, &errstr);
+ 			if (errstr)
+ 				errx(1, "rtable %s: %s", errstr, optarg);
++# else
++			errx(1, "no alternate routing table support available");
++# endif
+ 			break;
+ 		case 'v':
+ 			vflag = 1;
+@@ -232,7 +282,11 @@ main(int argc, char *argv[])
+ 				    errstr, optarg);
+ 			break;
+ 		case 'S':
++# if defined(TCP_MD5SIG)
+ 			Sflag = 1;
++# else
++			errx(1, "no TCP MD5 signature support available");
++# endif
+ 			break;
+ 		case 'T':
+ 			errstr = NULL;
+@@ -259,6 +313,15 @@ main(int argc, char *argv[])
+ 	if (argv[0] && !argv[1] && family == AF_UNIX) {
+ 		host = argv[0];
+ 		uport = NULL;
++	} else if (!argv[0] && lflag) {
++		if (sflag)
++			errx(1, "cannot use -s and -l");
++		if (zflag)
++			errx(1, "cannot use -z and -l");
++		if (pflag)
++			uport=pflag;
++	} else if (!lflag && kflag) {
++		errx(1, "cannot use -k without -l");
+ 	} else if (argv[0] && !argv[1]) {
+ 		if  (!lflag)
+ 			usage(1);
+@@ -270,14 +333,7 @@ main(int argc, char *argv[])
+ 	} else
+ 		usage(1);
+ 
+-	if (lflag && sflag)
+-		errx(1, "cannot use -s and -l");
+-	if (lflag && pflag)
+-		errx(1, "cannot use -p and -l");
+-	if (lflag && zflag)
+-		errx(1, "cannot use -z and -l");
+-	if (!lflag && kflag)
+-		errx(1, "must use -l with -k");
++
+ 
+ 	/* Get name of temporary socket for unix datagram client */
+ 	if ((family == AF_UNIX) && uflag && !lflag) {
+@@ -286,8 +342,8 @@ main(int argc, char *argv[])
+ 		} else {
+ 			strlcpy(unix_dg_tmp_socket_buf, "/tmp/nc.XXXXXXXXXX",
+ 				UNIX_DG_TMP_SOCKET_SIZE);
+-			if (mktemp(unix_dg_tmp_socket_buf) == NULL)
+-				err(1, "mktemp");
++			if (mkstemp(unix_dg_tmp_socket_buf) == -1)
++				err(1, "mkstemp");
+ 			unix_dg_tmp_socket = unix_dg_tmp_socket_buf;
+ 		}
+ 	}
+@@ -563,18 +619,22 @@ remote_connect(const char *host, const char *port, struct addrinfo hints)
+ 		    res0->ai_protocol)) < 0)
+ 			continue;
+ 
++# if defined(RT_TABLEID_MAX)
+ 		if (rtableid) {
+ 			if (setsockopt(s, SOL_SOCKET, SO_RTABLE, &rtableid,
+ 			    sizeof(rtableid)) == -1)
+ 				err(1, "setsockopt SO_RTABLE");
+ 		}
++# endif
+ 
+ 		/* Bind to a local port or source address if specified. */
+ 		if (sflag || pflag) {
+ 			struct addrinfo ahints, *ares;
+ 
++# if defined (SO_BINDANY)
+ 			/* try SO_BINDANY, but don't insist */
+ 			setsockopt(s, SOL_SOCKET, SO_BINDANY, &on, sizeof(on));
++# endif
+ 			memset(&ahints, 0, sizeof(struct addrinfo));
+ 			ahints.ai_family = res0->ai_family;
+ 			ahints.ai_socktype = uflag ? SOCK_DGRAM : SOCK_STREAM;
+@@ -674,15 +734,23 @@ local_listen(char *host, char *port, struct addrinfo hints)
+ 		    res0->ai_protocol)) < 0)
+ 			continue;
+ 
++# if defined(RT_TABLEID_MAX)
+ 		if (rtableid) {
+ 			if (setsockopt(s, IPPROTO_IP, SO_RTABLE, &rtableid,
+ 			    sizeof(rtableid)) == -1)
+ 				err(1, "setsockopt SO_RTABLE");
+ 		}
++# endif
++
++		ret = setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &x, sizeof(x));
++		if (ret == -1)
++			err(1, NULL);
+ 
++# if defined(SO_REUSEPORT)
+ 		ret = setsockopt(s, SOL_SOCKET, SO_REUSEPORT, &x, sizeof(x));
+ 		if (ret == -1)
+ 			err(1, NULL);
++# endif
+ 
+ 		set_common_sockopts(s);
+ 
+@@ -886,21 +954,25 @@ set_common_sockopts(int s)
+ {
+ 	int x = 1;
+ 
++# if defined(TCP_MD5SIG)
+ 	if (Sflag) {
+ 		if (setsockopt(s, IPPROTO_TCP, TCP_MD5SIG,
+ 			&x, sizeof(x)) == -1)
+ 			err(1, NULL);
+ 	}
++# endif
+ 	if (Dflag) {
+ 		if (setsockopt(s, SOL_SOCKET, SO_DEBUG,
+ 			&x, sizeof(x)) == -1)
+ 			err(1, NULL);
+ 	}
++# if defined(SO_JUMBO)
+ 	if (jflag) {
+ 		if (setsockopt(s, SOL_SOCKET, SO_JUMBO,
+ 			&x, sizeof(x)) == -1)
+ 			err(1, NULL);
+ 	}
++# endif
+ 	if (Tflag != -1) {
+ 		if (setsockopt(s, IPPROTO_IP, IP_TOS,
+ 		    &Tflag, sizeof(Tflag)) == -1)
+@@ -949,6 +1021,7 @@ map_tos(char *s, int *val)
+ 		{ "cs7",		IPTOS_DSCP_CS7 },
+ 		{ "ef",			IPTOS_DSCP_EF },
+ 		{ "inetcontrol",	IPTOS_PREC_INTERNETCONTROL },
++		{ "lowcost",		IPTOS_LOWCOST },
+ 		{ "lowdelay",		IPTOS_LOWDELAY },
+ 		{ "netcontrol",		IPTOS_PREC_NETCONTROL },
+ 		{ "reliability",	IPTOS_RELIABILITY },
+@@ -969,6 +1042,9 @@ map_tos(char *s, int *val)
+ void
+ help(void)
+ {
++# if defined(DEBIAN_VERSION)
++        fprintf(stderr, "OpenBSD netcat (Debian patchlevel " DEBIAN_VERSION ")\n");
++# endif
+ 	usage(0);
+ 	fprintf(stderr, "\tCommand Summary:\n\
+ 	\t-4		Use IPv4\n\
+@@ -978,6 +1054,7 @@ help(void)
+ 	\t-h		This help text\n\
+ 	\t-I length	TCP receive buffer length\n\
+ 	\t-i secs\t	Delay interval for lines sent, ports scanned\n\
++	\t-j		Use jumbo frame\n\
+ 	\t-k		Keep inbound sockets open for multiple connects\n\
+ 	\t-l		Listen mode, for inbound connects\n\
+ 	\t-n		Suppress name/port resolutions\n\
+@@ -998,15 +1075,15 @@ help(void)
+ 	\t-x addr[:port]\tSpecify proxy address and port\n\
+ 	\t-z		Zero-I/O mode [used for scanning]\n\
+ 	Port numbers can be individual or ranges: lo-hi [inclusive]\n");
+-	exit(1);
++	exit(0);
+ }
+ 
+ void
+ usage(int ret)
+ {
+ 	fprintf(stderr,
+-	    "usage: nc [-46DdhklnrStUuvz] [-I length] [-i interval] [-O length]\n"
+-	    "\t  [-P proxy_username] [-p source_port] [-s source] [-T ToS]\n"
++	    "usage: nc [-46DdhjklnrStUuvz] [-I length] [-i interval] [-O length]\n"
++	    "\t  [-P proxy_username] [-p source_port] [-s source] [-T toskeyword]\n"
+ 	    "\t  [-V rtable] [-w timeout] [-X proxy_protocol]\n"
+ 	    "\t  [-x proxy_address[:port]] [destination] [port]\n");
+ 	if (ret)
+diff --git a/socks.c b/socks.c
+index 71108d5..befd0a9 100644
+--- a/socks.c
++++ b/socks.c
+@@ -38,7 +38,7 @@
+ #include <string.h>
+ #include <unistd.h>
+ #include <resolv.h>
+-#include <readpassphrase.h>
++#include <bsd/readpassphrase.h>
+ #include "atomicio.h"
+ 
+ #define SOCKS_PORT	"1080"
+@@ -167,11 +167,11 @@ socks_connect(const char *host, const char *port,
+ 		buf[2] = SOCKS_NOAUTH;
+ 		cnt = atomicio(vwrite, proxyfd, buf, 3);
+ 		if (cnt != 3)
+-			err(1, "write failed (%zu/3)", cnt);
++			err(1, "write failed (%zu/3)", (size_t)cnt);
+ 
+ 		cnt = atomicio(read, proxyfd, buf, 2);
+ 		if (cnt != 2)
+-			err(1, "read failed (%zu/3)", cnt);
++			err(1, "read failed (%zu/3)", (size_t)cnt);
+ 
+ 		if (buf[1] == SOCKS_NOMETHOD)
+ 			errx(1, "authentication method negotiation failed");
+@@ -220,23 +220,23 @@ socks_connect(const char *host, const char *port,
+ 
+ 		cnt = atomicio(vwrite, proxyfd, buf, wlen);
+ 		if (cnt != wlen)
+-			err(1, "write failed (%zu/%zu)", cnt, wlen);
++			err(1, "write failed (%zu/%zu)", (size_t)cnt, (size_t)wlen);
+ 
+ 		cnt = atomicio(read, proxyfd, buf, 4);
+ 		if (cnt != 4)
+-			err(1, "read failed (%zu/4)", cnt);
++			err(1, "read failed (%zu/4)", (size_t)cnt);
+ 		if (buf[1] != 0)
+ 			errx(1, "connection failed, SOCKS error %d", buf[1]);
+ 		switch (buf[3]) {
+ 		case SOCKS_IPV4:
+ 			cnt = atomicio(read, proxyfd, buf + 4, 6);
+ 			if (cnt != 6)
+-				err(1, "read failed (%d/6)", cnt);
++				err(1, "read failed (%lu/6)", (unsigned long)cnt);
+ 			break;
+ 		case SOCKS_IPV6:
+ 			cnt = atomicio(read, proxyfd, buf + 4, 18);
+ 			if (cnt != 18)
+-				err(1, "read failed (%d/18)", cnt);
++				err(1, "read failed (%lu/18)", (unsigned long)cnt);
+ 			break;
+ 		default:
+ 			errx(1, "connection failed, unsupported address type");
+@@ -256,11 +256,11 @@ socks_connect(const char *host, const char *port,
+ 
+ 		cnt = atomicio(vwrite, proxyfd, buf, wlen);
+ 		if (cnt != wlen)
+-			err(1, "write failed (%zu/%zu)", cnt, wlen);
++			err(1, "write failed (%zu/%zu)", (size_t)cnt, (size_t)wlen);
+ 
+ 		cnt = atomicio(read, proxyfd, buf, 8);
+ 		if (cnt != 8)
+-			err(1, "read failed (%zu/8)", cnt);
++			err(1, "read failed (%zu/8)", (size_t)cnt);
+ 		if (buf[1] != 90)
+ 			errx(1, "connection failed, SOCKS error %d", buf[1]);
+ 	} else if (socksv == -1) {
+@@ -272,39 +272,39 @@ socks_connect(const char *host, const char *port,
+ 
+ 		/* Try to be sane about numeric IPv6 addresses */
+ 		if (strchr(host, ':') != NULL) {
+-			r = snprintf(buf, sizeof(buf),
++			r = snprintf((char*)buf, sizeof(buf),
+ 			    "CONNECT [%s]:%d HTTP/1.0\r\n",
+ 			    host, ntohs(serverport));
+ 		} else {
+-			r = snprintf(buf, sizeof(buf),
++			r = snprintf((char*)buf, sizeof(buf),
+ 			    "CONNECT %s:%d HTTP/1.0\r\n",
+ 			    host, ntohs(serverport));
+ 		}
+ 		if (r == -1 || (size_t)r >= sizeof(buf))
+ 			errx(1, "hostname too long");
+-		r = strlen(buf);
++		r = strlen((char*)buf);
+ 
+ 		cnt = atomicio(vwrite, proxyfd, buf, r);
+ 		if (cnt != r)
+-			err(1, "write failed (%zu/%d)", cnt, r);
++			err(1, "write failed (%zu/%d)", (size_t)cnt, (int)r);
+ 
+ 		if (authretry > 1) {
+ 			char resp[1024];
+ 
+ 			proxypass = getproxypass(proxyuser, proxyhost);
+-			r = snprintf(buf, sizeof(buf), "%s:%s",
++			r = snprintf((char*)buf, sizeof(buf), "%s:%s",
+ 			    proxyuser, proxypass);
+ 			if (r == -1 || (size_t)r >= sizeof(buf) ||
+-			    b64_ntop(buf, strlen(buf), resp,
++			    b64_ntop(buf, strlen((char*)buf), resp,
+ 			    sizeof(resp)) == -1)
+ 				errx(1, "Proxy username/password too long");
+-			r = snprintf(buf, sizeof(buf), "Proxy-Authorization: "
++			r = snprintf((char*)buf, sizeof((char*)buf), "Proxy-Authorization: "
+ 			    "Basic %s\r\n", resp);
+ 			if (r == -1 || (size_t)r >= sizeof(buf))
+ 				errx(1, "Proxy auth response too long");
+-			r = strlen(buf);
++			r = strlen((char*)buf);
+ 			if ((cnt = atomicio(vwrite, proxyfd, buf, r)) != r)
+-				err(1, "write failed (%zu/%d)", cnt, r);
++				err(1, "write failed (%zu/%d)", (size_t)cnt, r);
+ 		}
+ 
+ 		/* Terminate headers */
+@@ -312,22 +312,22 @@ socks_connect(const char *host, const char *port,
+ 			err(1, "write failed (2/%d)", r);
+ 
+ 		/* Read status reply */
+-		proxy_read_line(proxyfd, buf, sizeof(buf));
++		proxy_read_line(proxyfd, (char*)buf, sizeof(buf));
+ 		if (proxyuser != NULL &&
+-		    strncmp(buf, "HTTP/1.0 407 ", 12) == 0) {
++		    strncmp((char*)buf, "HTTP/1.0 407 ", 12) == 0) {
+ 			if (authretry > 1) {
+ 				fprintf(stderr, "Proxy authentication "
+ 				    "failed\n");
+ 			}
+ 			close(proxyfd);
+ 			goto again;
+-		} else if (strncmp(buf, "HTTP/1.0 200 ", 12) != 0 &&
+-		    strncmp(buf, "HTTP/1.1 200 ", 12) != 0)
++		} else if (strncmp((char*)buf, "HTTP/1.0 200 ", 12) != 0 &&
++		    strncmp((char*)buf, "HTTP/1.1 200 ", 12) != 0)
+ 			errx(1, "Proxy error: \"%s\"", buf);
+ 
+ 		/* Headers continue until we hit an empty line */
+ 		for (r = 0; r < HTTP_MAXHDRS; r++) {
+-			proxy_read_line(proxyfd, buf, sizeof(buf));
++			proxy_read_line(proxyfd, (char*)buf, sizeof(buf));
+ 			if (*buf == '\0')
+ 				break;
+ 		}
+-- 
diff --git a/package/netcat-openbsd/0002-connect-timeout.patch b/package/netcat-openbsd/0002-connect-timeout.patch
new file mode 100644
index 0000000..30d1d55
--- /dev/null
+++ b/package/netcat-openbsd/0002-connect-timeout.patch
@@ -0,0 +1,121 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 14:43:56 +0800
+Subject: connect timeout
+
+---
+ netcat.c |   77 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 75 insertions(+), 2 deletions(-)
+
+diff --git a/netcat.c b/netcat.c
+index 9b2def2..f3cc8c1 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -106,6 +106,10 @@
+ #define PORT_MAX_LEN	6
+ #define UNIX_DG_TMP_SOCKET_SIZE	19
+ 
++#define CONNECTION_SUCCESS 0
++#define CONNECTION_FAILED 1
++#define CONNECTION_TIMEOUT 2
++
+ /* Command Line Options */
+ int	dflag;					/* detached, no stdin */
+ unsigned int iflag;				/* Interval Flag */
+@@ -151,6 +155,9 @@ void	set_common_sockopts(int);
+ int	map_tos(char *, int *);
+ void	usage(int);
+ 
++static int connect_with_timeout(int fd, const struct sockaddr *sa,
++        socklen_t salen, int ctimeout);
++
+ int
+ main(int argc, char *argv[])
+ {
+@@ -651,11 +658,14 @@ remote_connect(const char *host, const char *port, struct addrinfo hints)
+ 
+ 		set_common_sockopts(s);
+ 
+-		if (timeout_connect(s, res0->ai_addr, res0->ai_addrlen) == 0)
++                if ((error = connect_with_timeout(s, res0->ai_addr, res0->ai_addrlen, timeout))== CONNECTION_SUCCESS)
+ 			break;
+-		else if (vflag)
++		else if (vflag && error == CONNECTION_FAILED)
+ 			warn("connect to %s port %s (%s) failed", host, port,
+ 			    uflag ? "udp" : "tcp");
++                else if (vflag && error == CONNECTION_TIMEOUT)
++                    warn("connect to %s port %s (%s) timed out", host, port,
++                            uflag ? "udp" : "tcp");
+ 
+ 		close(s);
+ 		s = -1;
+@@ -703,6 +713,69 @@ timeout_connect(int s, const struct sockaddr *name, socklen_t namelen)
+ 	return (ret);
+ }
+ 
++static int connect_with_timeout(int fd, const struct sockaddr *sa,
++		                socklen_t salen, int ctimeout)
++{
++	int err;
++	struct timeval tv, *tvp = NULL;
++	fd_set connect_fdset;
++	socklen_t len;
++	int orig_flags;
++
++	orig_flags = fcntl(fd, F_GETFL, 0);
++	if (fcntl(fd, F_SETFL, orig_flags | O_NONBLOCK) < 0 ) {
++		warn("can't set O_NONBLOCK - timeout not available");
++		if (connect(fd, sa, salen) == 0)
++			return CONNECTION_SUCCESS;
++		else
++			return CONNECTION_FAILED;
++	}
++
++	/* set connect timeout */
++	if (ctimeout > 0) {
++		tv.tv_sec = (time_t)ctimeout/1000;
++		tv.tv_usec = 0;
++		tvp = &tv;
++	}
++
++	/* attempt the connection */
++	err = connect(fd, sa, salen);
++	if (err != 0 && errno == EINPROGRESS) {
++		/* connection is proceeding
++		 * it is complete (or failed) when select returns */
++
++		/* initialize connect_fdset */
++		FD_ZERO(&connect_fdset);
++		FD_SET(fd, &connect_fdset);
++
++		/* call select */
++		do {
++			err = select(fd + 1, NULL, &connect_fdset,
++				     NULL, tvp);
++		} while (err < 0 && errno == EINTR);
++
++		/* select error */
++		if (err < 0)
++			errx(1,"select error: %s", strerror(errno));
++		/* we have reached a timeout */
++		if (err == 0)
++			return CONNECTION_TIMEOUT;
++		/* select returned successfully, but we must test socket
++		 * error for result */
++		len = sizeof(err);
++		if (getsockopt(fd, SOL_SOCKET, SO_ERROR, &err, &len) < 0)
++			errx(1, "getsockopt error: %s", strerror(errno));
++		/* setup errno according to the result returned by
++		 * getsockopt */
++		if (err != 0)
++			errno = err;
++	}
++
++	/* return aborted if an error occured, and valid otherwise */
++	fcntl(fd, F_SETFL, orig_flags);
++	return (err != 0)? CONNECTION_FAILED : CONNECTION_SUCCESS;
++}
++
+ /*
+  * local_listen()
+  * Returns a socket listening on a local port, binds to specified source
+-- 
diff --git a/package/netcat-openbsd/0003-get-sev-by-name.patch b/package/netcat-openbsd/0003-get-sev-by-name.patch
new file mode 100644
index 0000000..1d1cca8
--- /dev/null
+++ b/package/netcat-openbsd/0003-get-sev-by-name.patch
@@ -0,0 +1,34 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 14:45:08 +0800
+Subject: get sev by name
+
+---
+ netcat.c |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/netcat.c b/netcat.c
+index f3cc8c1..d912544 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -949,12 +949,19 @@ atelnet(int nfd, unsigned char *buf, unsigned int size)
+ void
+ build_ports(char *p)
+ {
++        struct servent *sv;
+ 	const char *errstr;
+ 	char *n;
+ 	int hi, lo, cp;
+ 	int x = 0;
+ 
+-	if ((n = strchr(p, '-')) != NULL) {
++        sv = getservbyname(p, uflag ? "udp" : "tcp");
++        if (sv) {
++                portlist[0] = calloc(1, PORT_MAX_LEN);
++                if (portlist[0] == NULL)
++                        err(1, NULL);
++                snprintf(portlist[0], PORT_MAX_LEN, "%d", ntohs(sv->s_port));
++        } else if ((n = strchr(p, '-')) != NULL) {
+ 		*n = '\0';
+ 		n++;
+ 
+-- 
diff --git a/package/netcat-openbsd/0004-poll-hup.patch b/package/netcat-openbsd/0004-poll-hup.patch
new file mode 100644
index 0000000..14923cb
--- /dev/null
+++ b/package/netcat-openbsd/0004-poll-hup.patch
@@ -0,0 +1,59 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 15:08:33 +0800
+Subject: poll hup
+
+---
+ netcat.c |   24 +++++++++++++++++-------
+ 1 file changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/netcat.c b/netcat.c
+index d912544..fdaca44 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -884,9 +884,7 @@ readwrite(int nfd)
+ 			if ((n = read(nfd, buf, plen)) < 0)
+ 				return;
+ 			else if (n == 0) {
+-				shutdown(nfd, SHUT_RD);
+-				pfd[0].fd = -1;
+-				pfd[0].events = 0;
++				goto shutdown_rd;
+ 			} else {
+ 				if (tflag)
+ 					atelnet(nfd, buf, n);
+@@ -894,18 +892,30 @@ readwrite(int nfd)
+ 					return;
+ 			}
+ 		}
++		else if (pfd[0].revents & POLLHUP) {
++		shutdown_rd:
++			shutdown(nfd, SHUT_RD);
++			pfd[0].fd = -1;
++			pfd[0].events = 0;
++		}
+ 
+-		if (!dflag && pfd[1].revents & POLLIN) {
++		if (!dflag) {
++		    if(pfd[1].revents & POLLIN) {
+ 			if ((n = read(wfd, buf, plen)) < 0)
+ 				return;
+ 			else if (n == 0) {
+-				shutdown(nfd, SHUT_WR);
+-				pfd[1].fd = -1;
+-				pfd[1].events = 0;
++				goto shutdown_wr;
+ 			} else {
+ 				if (atomicio(vwrite, nfd, buf, n) != n)
+ 					return;
+ 			}
++			}
++			else if (pfd[1].revents & POLLHUP) {
++			shutdown_wr:
++				shutdown(nfd, SHUT_WR);
++				pfd[1].fd = -1;
++				pfd[1].events = 0;
++			}
+ 		}
+ 	}
+ }
+-- 
diff --git a/package/netcat-openbsd/0005-send-crlf.patch b/package/netcat-openbsd/0005-send-crlf.patch
new file mode 100644
index 0000000..1a5fc6e
--- /dev/null
+++ b/package/netcat-openbsd/0005-send-crlf.patch
@@ -0,0 +1,108 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 14:57:45 +0800
+Subject: send crlf
+
+---
+ nc.1     |    6 ++++--
+ netcat.c |   21 +++++++++++++++++----
+ 2 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/nc.1 b/nc.1
+index b7014a2..af44976 100644
+--- a/nc.1
++++ b/nc.1
+@@ -34,7 +34,7 @@
+ .Sh SYNOPSIS
+ .Nm nc
+ .Bk -words
+-.Op Fl 46DdhklnrStUuvz
++.Op Fl 46CDdhklnrStUuvz
+ .Op Fl I Ar length
+ .Op Fl i Ar interval
+ .Op Fl O Ar length
+@@ -98,6 +98,8 @@ to use IPv4 addresses only.
+ Forces
+ .Nm
+ to use IPv6 addresses only.
++.It Fl C
++Send CRLF as line-ending.
+ .It Fl D
+ Enable debugging on the socket.
+ .It Fl d
+@@ -355,7 +357,7 @@ More complicated examples can be built up when the user knows the format
+ of requests required by the server.
+ As another example, an email may be submitted to an SMTP server using:
+ .Bd -literal -offset indent
+-$ nc localhost 25 \*(Lt\*(Lt EOF
++$ nc [\-C] localhost 25 \*(Lt\*(Lt EOF
+ HELO host.example.com
+ MAIL FROM:\*(Ltuser at host.example.com\*(Gt
+ RCPT TO:\*(Ltuser2 at host.example.com\*(Gt
+diff --git a/netcat.c b/netcat.c
+index fdaca44..4f4d2bf 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -111,6 +111,7 @@
+ #define CONNECTION_TIMEOUT 2
+ 
+ /* Command Line Options */
++int     Cflag = 0;                              /* CRLF line-ending */
+ int	dflag;					/* detached, no stdin */
+ unsigned int iflag;				/* Interval Flag */
+ int	jflag;					/* use jumbo frames if we can */
+@@ -180,7 +181,7 @@ main(int argc, char *argv[])
+ 	sv = NULL;
+ 
+ 	while ((ch = getopt(argc, argv,
+-	    "46DdhI:i:jklnO:P:p:rSs:tT:UuV:vw:X:x:z")) != -1) {
++	    "46CDdhI:i:jklnO:P:p:rSs:tT:UuV:vw:X:x:z")) != -1) {
+ 		switch (ch) {
+ 		case '4':
+ 			family = AF_INET;
+@@ -309,6 +310,9 @@ main(int argc, char *argv[])
+ 			if (Tflag < 0 || Tflag > 255 || errstr || errno)
+ 				errx(1, "illegal tos value %s", optarg);
+ 			break;
++                case 'C':
++                        Cflag = 1;
++                        break;
+ 		default:
+ 			usage(1);
+ 		}
+@@ -906,8 +910,16 @@ readwrite(int nfd)
+ 			else if (n == 0) {
+ 				goto shutdown_wr;
+ 			} else {
+-				if (atomicio(vwrite, nfd, buf, n) != n)
+-					return;
++				if ((Cflag) && (buf[n-1]=='\n')) {
++					if (atomicio(vwrite, nfd, buf, n-1) != (n-1))
++						return;
++					if (atomicio(vwrite, nfd, "\r\n", 2) != 2)
++						return;
++				}
++				else {
++					if (atomicio(vwrite, nfd, buf, n) != n)
++						return;
++				}
+ 			}
+ 			}
+ 			else if (pfd[1].revents & POLLHUP) {
+@@ -1139,6 +1151,7 @@ help(void)
+ 	fprintf(stderr, "\tCommand Summary:\n\
+ 	\t-4		Use IPv4\n\
+ 	\t-6		Use IPv6\n\
++	\t-C		Send CRLF as line-ending\n\
+ 	\t-D		Enable the debug socket option\n\
+ 	\t-d		Detach from stdin\n\
+ 	\t-h		This help text\n\
+@@ -1172,7 +1185,7 @@ void
+ usage(int ret)
+ {
+ 	fprintf(stderr,
+-	    "usage: nc [-46DdhjklnrStUuvz] [-I length] [-i interval] [-O length]\n"
++	    "usage: nc [-46CDdhjklnrStUuvz] [-I length] [-i interval] [-O length]\n"
+ 	    "\t  [-P proxy_username] [-p source_port] [-s source] [-T toskeyword]\n"
+ 	    "\t  [-V rtable] [-w timeout] [-X proxy_protocol]\n"
+ 	    "\t  [-x proxy_address[:port]] [destination] [port]\n");
+-- 
diff --git a/package/netcat-openbsd/0006-quit-timer.patch b/package/netcat-openbsd/0006-quit-timer.patch
new file mode 100644
index 0000000..40d6a2a
--- /dev/null
+++ b/package/netcat-openbsd/0006-quit-timer.patch
@@ -0,0 +1,133 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 15:16:04 +0800
+Subject: quit timer
+
+---
+ nc.1     |    5 +++++
+ netcat.c |   38 +++++++++++++++++++++++++++++++++-----
+ 2 files changed, 38 insertions(+), 5 deletions(-)
+
+diff --git a/nc.1 b/nc.1
+index af44976..0d92b74 100644
+--- a/nc.1
++++ b/nc.1
+@@ -40,6 +40,7 @@
+ .Op Fl O Ar length
+ .Op Fl P Ar proxy_username
+ .Op Fl p Ar source_port
++.Op Fl q Ar seconds
+ .Op Fl s Ar source
+ .Op Fl T Ar toskeyword
+ .Op Fl V Ar rtable
+@@ -148,6 +149,10 @@ Proxy authentication is only supported for HTTP CONNECT proxies at present.
+ Specifies the source port
+ .Nm
+ should use, subject to privilege restrictions and availability.
++.It Fl q Ar seconds
++after EOF on stdin, wait the specified number of seconds and then quit. If
++.Ar seconds
++is negative, wait forever.
+ .It Fl r
+ Specifies that source and/or destination ports should be chosen randomly
+ instead of sequentially within a range or in the order that the system
+diff --git a/netcat.c b/netcat.c
+index 4f4d2bf..29ecf1a 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -86,6 +86,7 @@
+ #include <errno.h>
+ #include <netdb.h>
+ #include <poll.h>
++#include <signal.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -120,6 +121,7 @@ int	lflag;					/* Bind to local port */
+ int	nflag;					/* Don't do name look up */
+ char   *Pflag;					/* Proxy username */
+ char   *pflag;					/* Localport flag */
++int     qflag = 0;                             /* Quit after some secs */
+ int	rflag;					/* Random ports flag */
+ char   *sflag;					/* Source Address */
+ int	tflag;					/* Telnet Emulation */
+@@ -158,6 +160,7 @@ void	usage(int);
+ 
+ static int connect_with_timeout(int fd, const struct sockaddr *sa,
+         socklen_t salen, int ctimeout);
++static void quit();
+ 
+ int
+ main(int argc, char *argv[])
+@@ -181,7 +184,7 @@ main(int argc, char *argv[])
+ 	sv = NULL;
+ 
+ 	while ((ch = getopt(argc, argv,
+-	    "46CDdhI:i:jklnO:P:p:rSs:tT:UuV:vw:X:x:z")) != -1) {
++	    "46CDdhI:i:jklnO:P:p:q:rSs:tT:UuV:vw:X:x:z")) != -1) {
+ 		switch (ch) {
+ 		case '4':
+ 			family = AF_INET;
+@@ -235,6 +238,11 @@ main(int argc, char *argv[])
+ 		case 'p':
+ 			pflag = optarg;
+ 			break;
++                case 'q':
++			qflag = strtonum(optarg, INT_MIN, INT_MAX, &errstr);
++			if (errstr)
++				errx(1, "quit timer %s: %s", errstr, optarg);
++			break;
+ 		case 'r':
+ 			rflag = 1;
+ 			break;
+@@ -924,9 +932,18 @@ readwrite(int nfd)
+ 			}
+ 			else if (pfd[1].revents & POLLHUP) {
+ 			shutdown_wr:
++			/* if the user asked to exit on EOF, do it */
++			if (qflag == 0) {
+ 				shutdown(nfd, SHUT_WR);
+-				pfd[1].fd = -1;
+-				pfd[1].events = 0;
++				close(wfd);
++			}
++			/* if user asked to die after a while, arrange for it */
++			if (qflag > 0) {
++				signal(SIGALRM, quit);
++				alarm(qflag);
++			}
++			pfd[1].fd = -1;
++			pfd[1].events = 0;
+ 			}
+ 		}
+ 	}
+@@ -1164,6 +1181,7 @@ help(void)
+ 	\t-O length	TCP send buffer length\n\
+ 	\t-P proxyuser\tUsername for proxy authentication\n\
+ 	\t-p port\t	Specify local port for remote connects\n\
++        \t-q secs\t	quit after EOF on stdin and delay of secs\n\
+ 	\t-r		Randomize remote ports\n\
+ 	\t-S		Enable the TCP MD5 signature option\n\
+ 	\t-s addr\t	Local source address\n\
+@@ -1186,9 +1204,19 @@ usage(int ret)
+ {
+ 	fprintf(stderr,
+ 	    "usage: nc [-46CDdhjklnrStUuvz] [-I length] [-i interval] [-O length]\n"
+-	    "\t  [-P proxy_username] [-p source_port] [-s source] [-T toskeyword]\n"
+-	    "\t  [-V rtable] [-w timeout] [-X proxy_protocol]\n"
++	    "\t  [-P proxy_username] [-p source_port] [-q seconds] [-s source]\n"
++	    "\t  [-T toskeyword] [-V rtable] [-w timeout] [-X proxy_protocol]\n"
+ 	    "\t  [-x proxy_address[:port]] [destination] [port]\n");
+ 	if (ret)
+ 		exit(1);
+ }
++
++/*
++ * quit()
++ * handler for a "-q" timeout (exit 0 instead of 1)
++ */
++static void quit()
++{
++        /* XXX: should explicitly close fds here */
++        exit(0);
++}
+-- 
diff --git a/package/netcat-openbsd/0007-udp-scan-timeout.patch b/package/netcat-openbsd/0007-udp-scan-timeout.patch
new file mode 100644
index 0000000..c63775a
--- /dev/null
+++ b/package/netcat-openbsd/0007-udp-scan-timeout.patch
@@ -0,0 +1,60 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 15:29:37 +0800
+Subject: udp scan timeout
+
+---
+ netcat.c |   25 ++++++++++++++++---------
+ 1 file changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/netcat.c b/netcat.c
+index 29ecf1a..baab909 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -111,6 +111,8 @@
+ #define CONNECTION_FAILED 1
+ #define CONNECTION_TIMEOUT 2
+ 
++#define UDP_SCAN_TIMEOUT 3			/* Seconds */
++
+ /* Command Line Options */
+ int     Cflag = 0;                              /* CRLF line-ending */
+ int	dflag;					/* detached, no stdin */
+@@ -497,7 +499,7 @@ main(int argc, char *argv[])
+ 				continue;
+ 
+ 			ret = 0;
+-			if (vflag || zflag) {
++			if (vflag) {
+ 				/* For UDP, make sure we are connected. */
+ 				if (uflag) {
+ 					if (udptest(s) == -1) {
+@@ -1057,15 +1059,20 @@ build_ports(char *p)
+ int
+ udptest(int s)
+ {
+-	int i, ret;
+-
+-	for (i = 0; i <= 3; i++) {
+-		if (write(s, "X", 1) == 1)
+-			ret = 1;
+-		else
+-			ret = -1;
++	int i, t;
++
++	if ((write(s, "X", 1) != 1) ||
++	    ((write(s, "X", 1) != 1) && (errno == ECONNREFUSED)))
++		return -1;
++
++	/* Give the remote host some time to reply. */
++	for (i = 0, t = (timeout == -1) ? UDP_SCAN_TIMEOUT : (timeout / 1000);
++	     i < t; i++) {
++		sleep(1);
++		if ((write(s, "X", 1) != 1) && (errno == ECONNREFUSED))
++			return -1;
+ 	}
+-	return (ret);
++	return 1;
+ }
+ 
+ void
+-- 
diff --git a/package/netcat-openbsd/0008-verbose-numeric-port.patch b/package/netcat-openbsd/0008-verbose-numeric-port.patch
new file mode 100644
index 0000000..fa1cf99
--- /dev/null
+++ b/package/netcat-openbsd/0008-verbose-numeric-port.patch
@@ -0,0 +1,106 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 15:38:15 +0800
+Subject: verbose numeric port
+
+---
+ netcat.c |   59 +++++++++++++++++++++++++++++++++++++++++++++++++++++++----
+ 1 file changed, 55 insertions(+), 4 deletions(-)
+
+diff --git a/netcat.c b/netcat.c
+index baab909..eb3453e 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -41,6 +41,7 @@
+ #include <netinet/tcp.h>
+ #include <netinet/ip.h>
+ #include <arpa/telnet.h>
++#include <arpa/inet.h>
+ 
+ #ifndef IPTOS_LOWDELAY
+ # define IPTOS_LOWDELAY 0x10
+@@ -424,6 +425,18 @@ main(int argc, char *argv[])
+ 				s = local_listen(host, uport, hints);
+ 			if (s < 0)
+ 				err(1, NULL);
++
++			char* local;
++			if (family == AF_INET6
++				local = "0.0.0.0";
++			else if (family == AF_INET)
++				local = ":::";
++			else
++				local = "unknown"
++			fprintf(stderr, "Listening on [%s] (family %d, port %d)\n",
++				host ?: local,
++				family,
++				*uport);
+ 			/*
+ 			 * For UDP, we will use recvfrom() initially
+ 			 * to wait for a caller, then use the regular
+@@ -432,16 +445,15 @@ main(int argc, char *argv[])
+ 			if (uflag) {
+ 				int rv, plen;
+ 				char buf[16384];
+-				struct sockaddr_storage z;
+ 
+-				len = sizeof(z);
++				len = sizeof(cliaddr);
+ 				plen = jflag ? 16384 : 2048;
+ 				rv = recvfrom(s, buf, plen, MSG_PEEK,
+-				    (struct sockaddr *)&z, &len);
++				    (struct sockaddr *)&cliaddr, &len);
+ 				if (rv < 0)
+ 					err(1, "recvfrom");
+ 
+-				rv = connect(s, (struct sockaddr *)&z, len);
++				rv = connect(s, (struct sockaddr *)&cliaddr, len);
+ 				if (rv < 0)
+ 					err(1, "connect");
+ 
+@@ -450,6 +462,45 @@ main(int argc, char *argv[])
+ 				len = sizeof(cliaddr);
+ 				connfd = accept(s, (struct sockaddr *)&cliaddr,
+ 				    &len);
++				if(vflag) {
++				/* Don't look up port if -n. */
++					if (nflag)
++						sv = NULL;
++					else
++						sv = getservbyport(ntohs(atoi(uport)),
++							uflag ? "udp" : "tcp");
++
++					if (((struct sockaddr *)&cliaddr)->sa_family == AF_INET) {
++						char dst[INET_ADDRSTRLEN];
++						inet_ntop(((struct sockaddr *)&cliaddr)->sa_family,&(((struct sockaddr_in *)&cliaddr)->sin_addr),dst,INET_ADDRSTRLEN);
++						fprintf(stderr, "Connection from [%s] port %s [%s/%s] accepted (family %d, sport %d)\n",
++							dst,
++							uport,
++							uflag ? "udp" : "tcp",
++							sv ? sv->s_name : "*",
++							((struct sockaddr *)(&cliaddr))->sa_family,
++							ntohs(((struct sockaddr_in *)&cliaddr)->sin_port));
++					}
++					else if(((struct sockaddr *)&cliaddr)->sa_family == AF_INET6) {
++						char dst[INET6_ADDRSTRLEN];
++						inet_ntop(((struct sockaddr *)&cliaddr)->sa_family,&(((struct sockaddr_in6 *)&cliaddr)->sin6_addr),dst,INET6_ADDRSTRLEN);
++						fprintf(stderr, "Connection from [%s] port %s [%s/%s] accepted (family %d, sport %d)\n",
++							dst,
++							uport,
++							uflag ? "udp" : "tcp",
++							sv ? sv->s_name : "*",
++							((struct sockaddr *)&cliaddr)->sa_family,
++							ntohs(((struct sockaddr_in6 *)&cliaddr)->sin6_port));
++					}
++					else {
++						fprintf(stderr, "Connection from unknown port %s [%s/%s] accepted (family %d, sport %d)\n",
++							uport,
++							uflag ? "udp" : "tcp",
++							sv ? sv->s_name : "*",
++							((struct sockaddr *)(&cliaddr))->sa_family,
++							ntohs(((struct sockaddr_in *)&cliaddr)->sin_port));
++					}
++				}
+ 				readwrite(connfd);
+ 				close(connfd);
+ 			}
+-- 
diff --git a/package/netcat-openbsd/0009-dccp-support.patch b/package/netcat-openbsd/0009-dccp-support.patch
new file mode 100644
index 0000000..3a81b4b
--- /dev/null
+++ b/package/netcat-openbsd/0009-dccp-support.patch
@@ -0,0 +1,304 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 15:56:51 +0800
+Subject: dccp support
+
+---
+ nc.1     |    4 ++-
+ netcat.c |  111 ++++++++++++++++++++++++++++++++++++++++++++++++++------------
+ 2 files changed, 93 insertions(+), 22 deletions(-)
+
+diff --git a/nc.1 b/nc.1
+index 0d92b74..60e3668 100644
+--- a/nc.1
++++ b/nc.1
+@@ -34,7 +34,7 @@
+ .Sh SYNOPSIS
+ .Nm nc
+ .Bk -words
+-.Op Fl 46CDdhklnrStUuvz
++.Op Fl 46CDdhklnrStUuvZz
+ .Op Fl I Ar length
+ .Op Fl i Ar interval
+ .Op Fl O Ar length
+@@ -257,6 +257,8 @@ If
+ .Ar port
+ is not specified, the well-known port for the proxy protocol is used (1080
+ for SOCKS, 3128 for HTTPS).
++.It Fl Z
++DCCP mode.
+ .It Fl z
+ Specifies that
+ .Nm
+diff --git a/netcat.c b/netcat.c
+index eb3453e..56cc15e 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -129,6 +129,7 @@ int	rflag;					/* Random ports flag */
+ char   *sflag;					/* Source Address */
+ int	tflag;					/* Telnet Emulation */
+ int	uflag;					/* UDP - Default to TCP */
++int	dccpflag;				/* DCCP - Default to TCP */
+ int	vflag;					/* Verbosity */
+ int	xflag;					/* Socks proxy */
+ int	zflag;					/* Port Scan Flag */
+@@ -160,6 +161,7 @@ int	unix_listen(char *);
+ void	set_common_sockopts(int);
+ int	map_tos(char *, int *);
+ void	usage(int);
++char    *proto_name(int uflag, int dccpflag);
+ 
+ static int connect_with_timeout(int fd, const struct sockaddr *sa,
+         socklen_t salen, int ctimeout);
+@@ -187,7 +189,7 @@ main(int argc, char *argv[])
+ 	sv = NULL;
+ 
+ 	while ((ch = getopt(argc, argv,
+-	    "46CDdhI:i:jklnO:P:p:q:rSs:tT:UuV:vw:X:x:z")) != -1) {
++	    "46CDdhI:i:jklnO:P:p:q:rSs:tT:UuV:vw:X:x:Zz")) != -1) {
+ 		switch (ch) {
+ 		case '4':
+ 			family = AF_INET;
+@@ -258,6 +260,13 @@ main(int argc, char *argv[])
+ 		case 'u':
+ 			uflag = 1;
+ 			break;
++		case 'Z':
++# if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
++			dccpflag = 1;
++# else
++			errx(1, "no DCCP support available");
++# endif
++			break;
+ 		case 'V':
+ # if defined(RT_TABLEID_MAX)
+ 			rtableid = (unsigned int)strtonum(optarg, 0,
+@@ -333,6 +342,12 @@ main(int argc, char *argv[])
+ 
+ 	/* Cruft to make sure options are clean, and used properly. */
+ 	if (argv[0] && !argv[1] && family == AF_UNIX) {
++ 		if (uflag)
++ 			errx(1, "cannot use -u and -U");
++# if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
++		if (dccpflag)
++			errx(1, "cannot use -Z and -U");
++# endif
+ 		host = argv[0];
+ 		uport = NULL;
+ 	} else if (!argv[0] && lflag) {
+@@ -374,8 +389,20 @@ main(int argc, char *argv[])
+ 	if (family != AF_UNIX) {
+ 		memset(&hints, 0, sizeof(struct addrinfo));
+ 		hints.ai_family = family;
+-		hints.ai_socktype = uflag ? SOCK_DGRAM : SOCK_STREAM;
+-		hints.ai_protocol = uflag ? IPPROTO_UDP : IPPROTO_TCP;
++		if (uflag) {
++		    hints.ai_socktype = SOCK_DGRAM;
++		    hints.ai_protocol = IPPROTO_UDP;
++		}
++# if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
++		else if (dccpflag) {
++		    hints.ai_socktype = SOCK_DCCP;
++		    hints.ai_protocol = IPPROTO_DCCP;
++		}
++# endif
++		else {
++		    hints.ai_socktype = SOCK_STREAM;
++		    hints.ai_protocol = IPPROTO_TCP;
++		}
+ 		if (nflag)
+ 			hints.ai_flags |= AI_NUMERICHOST;
+ 	}
+@@ -383,7 +410,10 @@ main(int argc, char *argv[])
+ 	if (xflag) {
+ 		if (uflag)
+ 			errx(1, "no proxy support for UDP mode");
+-
++# if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
++		if (dccpflag)
++			errx(1, "no proxy support for DCCP mode");
++# endif
+ 		if (lflag)
+ 			errx(1, "no proxy support for listen");
+ 
+@@ -427,12 +457,12 @@ main(int argc, char *argv[])
+ 				err(1, NULL);
+ 
+ 			char* local;
+-			if (family == AF_INET6
++			if (family == AF_INET6 )
+ 				local = "0.0.0.0";
+ 			else if (family == AF_INET)
+ 				local = ":::";
+ 			else
+-				local = "unknown"
++				local = "unknown";
+ 			fprintf(stderr, "Listening on [%s] (family %d, port %d)\n",
+ 				host ?: local,
+ 				family,
+@@ -463,12 +493,13 @@ main(int argc, char *argv[])
+ 				connfd = accept(s, (struct sockaddr *)&cliaddr,
+ 				    &len);
+ 				if(vflag) {
++					char *proto = proto_name(uflag, dccpflag);
+ 				/* Don't look up port if -n. */
+ 					if (nflag)
+ 						sv = NULL;
+ 					else
+ 						sv = getservbyport(ntohs(atoi(uport)),
+-							uflag ? "udp" : "tcp");
++							proto);
+ 
+ 					if (((struct sockaddr *)&cliaddr)->sa_family == AF_INET) {
+ 						char dst[INET_ADDRSTRLEN];
+@@ -476,7 +507,7 @@ main(int argc, char *argv[])
+ 						fprintf(stderr, "Connection from [%s] port %s [%s/%s] accepted (family %d, sport %d)\n",
+ 							dst,
+ 							uport,
+-							uflag ? "udp" : "tcp",
++							proto,
+ 							sv ? sv->s_name : "*",
+ 							((struct sockaddr *)(&cliaddr))->sa_family,
+ 							ntohs(((struct sockaddr_in *)&cliaddr)->sin_port));
+@@ -487,7 +518,7 @@ main(int argc, char *argv[])
+ 						fprintf(stderr, "Connection from [%s] port %s [%s/%s] accepted (family %d, sport %d)\n",
+ 							dst,
+ 							uport,
+-							uflag ? "udp" : "tcp",
++							proto,
+ 							sv ? sv->s_name : "*",
+ 							((struct sockaddr *)&cliaddr)->sa_family,
+ 							ntohs(((struct sockaddr_in6 *)&cliaddr)->sin6_port));
+@@ -495,7 +526,7 @@ main(int argc, char *argv[])
+ 					else {
+ 						fprintf(stderr, "Connection from unknown port %s [%s/%s] accepted (family %d, sport %d)\n",
+ 							uport,
+-							uflag ? "udp" : "tcp",
++							proto,
+ 							sv ? sv->s_name : "*",
+ 							((struct sockaddr *)(&cliaddr))->sa_family,
+ 							ntohs(((struct sockaddr_in *)&cliaddr)->sin_port));
+@@ -559,19 +590,20 @@ main(int argc, char *argv[])
+ 					}
+ 				}
+ 
++				char *proto = proto_name(uflag, dccpflag);
+ 				/* Don't look up port if -n. */
+ 				if (nflag)
+ 					sv = NULL;
+ 				else {
+ 					sv = getservbyport(
+ 					    ntohs(atoi(portlist[i])),
+-					    uflag ? "udp" : "tcp");
++					    proto);
+ 				}
+ 
+ 				fprintf(stderr,
+ 				    "Connection to %s %s port [%s/%s] "
+ 				    "succeeded!\n", host, portlist[i],
+-				    uflag ? "udp" : "tcp",
++				    proto,
+ 				    sv ? sv->s_name : "*");
+ 			}
+ 			if (!zflag)
+@@ -671,6 +703,24 @@ unix_listen(char *path)
+ 	return (s);
+ }
+ 
++char *proto_name(uflag, dccpflag) {
++
++    char *proto = NULL;
++    if (uflag) {
++	proto = "udp";
++    }
++# if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
++    else if (dccpflag) {
++	proto = "dccp";
++    }
++# endif
++    else {
++	proto = "tcp";
++    }
++
++    return proto;
++}
++
+ /*
+  * remote_connect()
+  * Returns a socket connected to a remote host. Properly binds to a local
+@@ -709,8 +759,21 @@ remote_connect(const char *host, const char *port, struct addrinfo hints)
+ # endif
+ 			memset(&ahints, 0, sizeof(struct addrinfo));
+ 			ahints.ai_family = res0->ai_family;
+-			ahints.ai_socktype = uflag ? SOCK_DGRAM : SOCK_STREAM;
+-			ahints.ai_protocol = uflag ? IPPROTO_UDP : IPPROTO_TCP;
++			if (uflag) {
++			    ahints.ai_socktype = SOCK_DGRAM;
++			    ahints.ai_protocol = IPPROTO_UDP;
++
++			}
++# if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
++			else if (dccpflag) {
++			    hints.ai_socktype = SOCK_DCCP;
++			    hints.ai_protocol = IPPROTO_DCCP;
++			}
++# endif
++			else {
++		    	    ahints.ai_socktype = SOCK_STREAM;
++			    ahints.ai_protocol = IPPROTO_TCP;
++			}
+ 			ahints.ai_flags = AI_PASSIVE;
+ 			if ((error = getaddrinfo(sflag, pflag, &ahints, &ares)))
+ 				errx(1, "getaddrinfo: %s", gai_strerror(error));
+@@ -722,15 +785,19 @@ remote_connect(const char *host, const char *port, struct addrinfo hints)
+ 		}
+ 
+ 		set_common_sockopts(s);
++		char *proto = proto_name(uflag, dccpflag);
+ 
+-                if ((error = connect_with_timeout(s, res0->ai_addr, res0->ai_addrlen, timeout))== CONNECTION_SUCCESS)
++                if ((error = connect_with_timeout(s, res0->ai_addr, res0->ai_addrlen, timeout))== CONNECTION_SUCCESS) {
+ 			break;
+-		else if (vflag && error == CONNECTION_FAILED)
++		}
++		else if (vflag && error == CONNECTION_FAILED) {
+ 			warn("connect to %s port %s (%s) failed", host, port,
+-			    uflag ? "udp" : "tcp");
+-                else if (vflag && error == CONNECTION_TIMEOUT)
++			     proto);
++		}
++                else if (vflag && error == CONNECTION_TIMEOUT) {
+                     warn("connect to %s port %s (%s) timed out", host, port,
+-                            uflag ? "udp" : "tcp");
++                             proto);
++		}
+ 
+ 		close(s);
+ 		s = -1;
+@@ -1047,7 +1114,8 @@ build_ports(char *p)
+ 	int hi, lo, cp;
+ 	int x = 0;
+ 
+-        sv = getservbyname(p, uflag ? "udp" : "tcp");
++	char *proto = proto_name(uflag, dccpflag);
++	sv = getservbyname(p, proto);
+         if (sv) {
+                 portlist[0] = calloc(1, PORT_MAX_LEN);
+                 if (portlist[0] == NULL)
+@@ -1252,6 +1320,7 @@ help(void)
+ 	\t-w secs\t	Timeout for connects and final net reads\n\
+ 	\t-X proto	Proxy protocol: \"4\", \"5\" (SOCKS) or \"connect\"\n\
+ 	\t-x addr[:port]\tSpecify proxy address and port\n\
++	\t-Z		DCCP mode\n\
+ 	\t-z		Zero-I/O mode [used for scanning]\n\
+ 	Port numbers can be individual or ranges: lo-hi [inclusive]\n");
+ 	exit(0);
+@@ -1261,7 +1330,7 @@ void
+ usage(int ret)
+ {
+ 	fprintf(stderr,
+-	    "usage: nc [-46CDdhjklnrStUuvz] [-I length] [-i interval] [-O length]\n"
++	    "usage: nc [-46CDdhjklnrStUuvZz] [-I length] [-i interval] [-O length]\n"
+ 	    "\t  [-P proxy_username] [-p source_port] [-q seconds] [-s source]\n"
+ 	    "\t  [-T toskeyword] [-V rtable] [-w timeout] [-X proxy_protocol]\n"
+ 	    "\t  [-x proxy_address[:port]] [destination] [port]\n");
+-- 
diff --git a/package/netcat-openbsd/0010-serialized-handling-multiple-clients.patch b/package/netcat-openbsd/0010-serialized-handling-multiple-clients.patch
new file mode 100644
index 0000000..0d3ea68
--- /dev/null
+++ b/package/netcat-openbsd/0010-serialized-handling-multiple-clients.patch
@@ -0,0 +1,75 @@
+From: Aron Xu <aron@debian.org>
+Date: Tue, 14 Feb 2012 23:02:00 +0800
+Subject: serialized handling multiple clients
+
+---
+ netcat.c |   39 +++++++++++++++++++--------------------
+ 1 file changed, 19 insertions(+), 20 deletions(-)
+
+diff --git a/netcat.c b/netcat.c
+index 56cc15e..bf9940f 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -447,26 +447,24 @@ main(int argc, char *argv[])
+ 				s = unix_bind(host);
+ 			else
+ 				s = unix_listen(host);
+-		}
++		} else
++			s = local_listen(host, uport, hints);
++		if (s < 0)
++			err(1, NULL);
++
++		char* local;
++		if (family == AF_INET6)
++			local = ":::";
++		else
++			local = "0.0.0.0";
++		fprintf(stderr, "Listening on [%s] (family %d, port %d)\n",
++			host ?: local,
++			family,
++			*uport);
+ 
+ 		/* Allow only one connection at a time, but stay alive. */
+ 		for (;;) {
+-			if (family != AF_UNIX)
+-				s = local_listen(host, uport, hints);
+-			if (s < 0)
+-				err(1, NULL);
+ 
+-			char* local;
+-			if (family == AF_INET6 )
+-				local = "0.0.0.0";
+-			else if (family == AF_INET)
+-				local = ":::";
+-			else
+-				local = "unknown";
+-			fprintf(stderr, "Listening on [%s] (family %d, port %d)\n",
+-				host ?: local,
+-				family,
+-				*uport);
+ 			/*
+ 			 * For UDP, we will use recvfrom() initially
+ 			 * to wait for a caller, then use the regular
+@@ -536,15 +534,16 @@ main(int argc, char *argv[])
+ 				close(connfd);
+ 			}
+ 
+-			if (family != AF_UNIX)
++			if (kflag)
++				continue;
++			if (family != AF_UNIX) {
+ 				close(s);
++			}
+ 			else if (uflag) {
+ 				if (connect(s, NULL, 0) < 0)
+ 					err(1, "connect");
+ 			}
+-
+-			if (!kflag)
+-				break;
++			break;
+ 		}
+ 	} else if (family == AF_UNIX) {
+ 		ret = 0;
+-- 
diff --git a/package/netcat-openbsd/0011-misc-failures-and-features.patch b/package/netcat-openbsd/0011-misc-failures-and-features.patch
new file mode 100644
index 0000000..3ed0523
--- /dev/null
+++ b/package/netcat-openbsd/0011-misc-failures-and-features.patch
@@ -0,0 +1,457 @@
+From: Aron Xu <aron@debian.org>
+Date: Mon, 13 Feb 2012 19:06:52 +0800
+Subject: misc connection failures
+
+---
+ nc.1     |   76 ++++++++++++++++++++++++++++++++++++---
+ netcat.c |  119 ++++++++++++++++++++++++++++++++++++++++++--------------------
+ 2 files changed, 153 insertions(+), 42 deletions(-)
+
+diff --git a/nc.1 b/nc.1
+index 60e3668..477cb1b 100644
+--- a/nc.1
++++ b/nc.1
+@@ -34,7 +34,7 @@
+ .Sh SYNOPSIS
+ .Nm nc
+ .Bk -words
+-.Op Fl 46CDdhklnrStUuvZz
++.Op Fl 46bCDdhklnrStUuvZz
+ .Op Fl I Ar length
+ .Op Fl i Ar interval
+ .Op Fl O Ar length
+@@ -99,6 +99,8 @@ to use IPv4 addresses only.
+ Forces
+ .Nm
+ to use IPv6 addresses only.
++.It Fl b
++Allow broadcast.
+ .It Fl C
+ Send CRLF as line-ending.
+ .It Fl D
+@@ -323,6 +325,54 @@ and which side is being used as a
+ The connection may be terminated using an
+ .Dv EOF
+ .Pq Sq ^D .
++.Pp
++There is no
++.Fl c
++or
++.Fl e
++option in this netcat, but you still can execute a command after connection
++being established by redirecting file descriptors. Be cautious here because
++opening a port and let anyone connected execute arbitrary command on your
++site is DANGEROUS. If you really need to do this, here is an example:
++.Pp
++On
++.Sq server
++side:
++.Pp
++.Dl $ rm -f /tmp/f; mkfifo /tmp/f
++.Dl $ cat /tmp/f | /bin/sh -i 2>&1 | nc -l 127.0.0.1 1234 > /tmp/f
++.Pp
++On
++.Sq client
++side:
++.Pp
++.Dl $ nc host.example.com 1234
++.Dl $ (shell prompt from host.example.com)
++.Pp
++By doing this, you create a fifo at /tmp/f and make nc listen at port 1234
++of address 127.0.0.1 on
++.Sq server
++side, when a
++.Sq client
++establishes a connection successfully to that port, /bin/sh gets executed
++on
++.Sq server
++side and the shell prompt is given to
++.Sq client
++side.
++.Pp
++When connection is terminated,
++.Nm
++quits as well. Use
++.Fl k
++if you want it keep listening, but if the command quits this option won't
++restart it or keep
++.Nm
++running. Also don't forget to remove the file descriptor once you don't need
++it anymore:
++.Pp
++.Dl $ rm -f /tmp/f
++.Pp
+ .Sh DATA TRANSFER
+ The example in the previous section can be expanded to build a
+ basic data transfer model.
+@@ -382,15 +432,30 @@ The
+ flag can be used to tell
+ .Nm
+ to report open ports,
+-rather than initiate a connection.
++rather than initiate a connection. Usually it's useful to turn on verbose
++output to stderr by use this option in conjunction with
++.Fl v
++option.
++.Pp
+ For example:
+ .Bd -literal -offset indent
+-$ nc -z host.example.com 20-30
++$ nc \-zv host.example.com 20-30
+ Connection to host.example.com 22 port [tcp/ssh] succeeded!
+ Connection to host.example.com 25 port [tcp/smtp] succeeded!
+ .Ed
+ .Pp
+-The port range was specified to limit the search to ports 20 \- 30.
++The port range was specified to limit the search to ports 20 \- 30, and is
++scanned by increasing order.
++.Pp
++You can also specify a list of ports to scan, for example:
++.Bd -literal -offset indent
++$ nc \-zv host.example.com 80 20 22
++nc: connect to host.example.com 80 (tcp) failed: Connection refused
++nc: connect to host.example.com 20 (tcp) failed: Connection refused
++Connection to host.example.com port [tcp/ssh] succeeded!
++.Ed
++.Pp
++The ports are scanned by the order you given.
+ .Pp
+ Alternatively, it might be useful to know which server software
+ is running, and which versions.
+@@ -455,6 +520,9 @@ Original implementation by *Hobbit*
+ .br
+ Rewritten with IPv6 support by
+ .An Eric Jackson Aq ericj at monkey.org .
++.br
++Modified for Debian port by Aron Xu
++.Aq aron at debian.org .
+ .Sh CAVEATS
+ UDP port scans using the
+ .Fl uz
+diff --git a/netcat.c b/netcat.c
+index bf9940f..c938d11 100644
+--- a/netcat.c
++++ b/netcat.c
+@@ -88,6 +88,7 @@
+ #include <netdb.h>
+ #include <poll.h>
+ #include <signal.h>
++#include <stddef.h>
+ #include <stdarg.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+@@ -115,6 +116,7 @@
+ #define UDP_SCAN_TIMEOUT 3			/* Seconds */
+ 
+ /* Command Line Options */
++int	bflag;					/* Allow Broadcast */
+ int     Cflag = 0;                              /* CRLF line-ending */
+ int	dflag;					/* detached, no stdin */
+ unsigned int iflag;				/* Interval Flag */
+@@ -146,7 +148,7 @@ char *portlist[PORT_MAX+1];
+ char *unix_dg_tmp_socket;
+ 
+ void	atelnet(int, unsigned char *, unsigned int);
+-void	build_ports(char *);
++void	build_ports(char **);
+ void	help(void);
+ int	local_listen(char *, char *, struct addrinfo);
+ void	readwrite(int);
+@@ -171,11 +173,14 @@ int
+ main(int argc, char *argv[])
+ {
+ 	int ch, s, ret, socksv;
+-	char *host, *uport;
++	char *host, **uport;
+ 	struct addrinfo hints;
+ 	struct servent *sv;
+ 	socklen_t len;
+-	struct sockaddr_storage cliaddr;
++	union {
++        	struct sockaddr_storage storage;
++		struct sockaddr_un forunix;
++	} cliaddr;
+ 	char *proxy = NULL;
+ 	const char *errstr, *proxyhost = "", *proxyport = NULL;
+ 	struct addrinfo proxyhints;
+@@ -189,7 +194,7 @@ main(int argc, char *argv[])
+ 	sv = NULL;
+ 
+ 	while ((ch = getopt(argc, argv,
+-	    "46CDdhI:i:jklnO:P:p:q:rSs:tT:UuV:vw:X:x:Zz")) != -1) {
++	    "46bCDdhI:i:jklnO:P:p:q:rSs:tT:UuV:vw:X:x:Zz")) != -1) {
+ 		switch (ch) {
+ 		case '4':
+ 			family = AF_INET;
+@@ -197,6 +202,13 @@ main(int argc, char *argv[])
+ 		case '6':
+ 			family = AF_INET6;
+ 			break;
++		case 'b':
++# if defined(SO_BROADCAST)
++			bflag = 1;
++# else
++			errx(1, "no broadcast frame support available");
++# endif
++			break;
+ 		case 'U':
+ 			family = AF_UNIX;
+ 			break;
+@@ -342,35 +354,40 @@ main(int argc, char *argv[])
+ 
+ 	/* Cruft to make sure options are clean, and used properly. */
+ 	if (argv[0] && !argv[1] && family == AF_UNIX) {
+- 		if (uflag)
+- 			errx(1, "cannot use -u and -U");
+ # if defined(IPPROTO_DCCP) && defined(SOCK_DCCP)
+ 		if (dccpflag)
+ 			errx(1, "cannot use -Z and -U");
+ # endif
+ 		host = argv[0];
+ 		uport = NULL;
+-	} else if (!argv[0] && lflag) {
+-		if (sflag)
+-			errx(1, "cannot use -s and -l");
+-		if (zflag)
+-			errx(1, "cannot use -z and -l");
+-		if (pflag)
+-			uport=pflag;
+-	} else if (!lflag && kflag) {
+-		errx(1, "cannot use -k without -l");
+-	} else if (argv[0] && !argv[1]) {
+-		if  (!lflag)
+-			usage(1);
+-		uport = argv[0];
++	} else if (argv[0] && !argv[1] && lflag) {
++		if (pflag) {
++			uport = &pflag;
++			host = argv[0];
++		} else {
++			uport = argv;
++			host = NULL;
++		}
++	} else if (!argv[0] && lflag && pflag) {
++		uport = &pflag;
+ 		host = NULL;
+ 	} else if (argv[0] && argv[1]) {
+ 		host = argv[0];
+-		uport = argv[1];
++		uport = &argv[1];
+ 	} else
+ 		usage(1);
+ 
+-
++	if (lflag) {
++		if (sflag)
++			errx(1, "cannot use -s and -l");
++		if (zflag)
++			errx(1, "cannot use -z and -l");
++		if (pflag)
++			/* This still does not work well because of getopt mess
++			errx(1, "cannot use -p and -l"); */
++			uport = &pflag;
++	} else if (!lflag && kflag)
++		errx(1, "cannot use -k without -l");
+ 
+ 	/* Get name of temporary socket for unix datagram client */
+ 	if ((family == AF_UNIX) && uflag && !lflag) {
+@@ -448,7 +465,7 @@ main(int argc, char *argv[])
+ 			else
+ 				s = unix_listen(host);
+ 		} else
+-			s = local_listen(host, uport, hints);
++			s = local_listen(host, *uport, hints);
+ 		if (s < 0)
+ 			err(1, NULL);
+ 
+@@ -457,7 +474,8 @@ main(int argc, char *argv[])
+ 			local = ":::";
+ 		else
+ 			local = "0.0.0.0";
+-		fprintf(stderr, "Listening on [%s] (family %d, port %d)\n",
++		if (vflag && (family != AF_UNIX))
++		fprintf(stderr, "Listening on [%s] (family %d, port %s)\n",
+ 			host ?: local,
+ 			family,
+ 			*uport);
+@@ -490,13 +508,17 @@ main(int argc, char *argv[])
+ 				len = sizeof(cliaddr);
+ 				connfd = accept(s, (struct sockaddr *)&cliaddr,
+ 				    &len);
+-				if(vflag) {
++				if(vflag && family == AF_UNIX) {
++					fprintf(stderr, "Connection from \"%.*s\" accepted\n",
++						(len - (int)offsetof(struct sockaddr_un, sun_path)),
++						((struct sockaddr_un*)&cliaddr)->sun_path);
++				} else if(vflag) {
+ 					char *proto = proto_name(uflag, dccpflag);
+ 				/* Don't look up port if -n. */
+ 					if (nflag)
+ 						sv = NULL;
+ 					else
+-						sv = getservbyport(ntohs(atoi(uport)),
++						sv = getservbyport(ntohs(atoi(*uport)),
+ 							proto);
+ 
+ 					if (((struct sockaddr *)&cliaddr)->sa_family == AF_INET) {
+@@ -504,7 +526,7 @@ main(int argc, char *argv[])
+ 						inet_ntop(((struct sockaddr *)&cliaddr)->sa_family,&(((struct sockaddr_in *)&cliaddr)->sin_addr),dst,INET_ADDRSTRLEN);
+ 						fprintf(stderr, "Connection from [%s] port %s [%s/%s] accepted (family %d, sport %d)\n",
+ 							dst,
+-							uport,
++							*uport,
+ 							proto,
+ 							sv ? sv->s_name : "*",
+ 							((struct sockaddr *)(&cliaddr))->sa_family,
+@@ -515,7 +537,7 @@ main(int argc, char *argv[])
+ 						inet_ntop(((struct sockaddr *)&cliaddr)->sa_family,&(((struct sockaddr_in6 *)&cliaddr)->sin6_addr),dst,INET6_ADDRSTRLEN);
+ 						fprintf(stderr, "Connection from [%s] port %s [%s/%s] accepted (family %d, sport %d)\n",
+ 							dst,
+-							uport,
++							*uport,
+ 							proto,
+ 							sv ? sv->s_name : "*",
+ 							((struct sockaddr *)&cliaddr)->sa_family,
+@@ -523,17 +545,21 @@ main(int argc, char *argv[])
+ 					}
+ 					else {
+ 						fprintf(stderr, "Connection from unknown port %s [%s/%s] accepted (family %d, sport %d)\n",
+-							uport,
++							*uport,
+ 							proto,
+ 							sv ? sv->s_name : "*",
+ 							((struct sockaddr *)(&cliaddr))->sa_family,
+ 							ntohs(((struct sockaddr_in *)&cliaddr)->sin_port));
+ 					}
+ 				}
++                                if(!kflag)
++                                        close(s);
+ 				readwrite(connfd);
+ 				close(connfd);
+ 			}
+ 
++			if (vflag && kflag)
++                                fprintf(stderr, "Connection closed, listening again.\n");
+ 			if (kflag)
+ 				continue;
+ 			if (family != AF_UNIX) {
+@@ -641,6 +667,8 @@ unix_bind(char *path)
+ 		return (-1);
+ 	}
+ 
++        unlink(path);
++
+ 	if (bind(s, (struct sockaddr *)&sun, SUN_LEN(&sun)) < 0) {
+ 		close(s);
+ 		return (-1);
+@@ -662,8 +690,10 @@ unix_connect(char *path)
+ 		if ((s = unix_bind(unix_dg_tmp_socket)) < 0)
+ 			return (-1);
+ 	} else {
+-		if ((s = socket(AF_UNIX, SOCK_STREAM, 0)) < 0)
++		if ((s = socket(AF_UNIX, SOCK_STREAM, 0)) < 0) {
++                        errx(1,"create unix socket failed");
+ 			return (-1);
++                }
+ 	}
+ 	(void)fcntl(s, F_SETFD, 1);
+ 
+@@ -674,9 +704,11 @@ unix_connect(char *path)
+ 	    sizeof(sun.sun_path)) {
+ 		close(s);
+ 		errno = ENAMETOOLONG;
++                warn("unix connect abandoned");
+ 		return (-1);
+ 	}
+ 	if (connect(s, (struct sockaddr *)&sun, SUN_LEN(&sun)) < 0) {
++                warn("unix connect failed");
+ 		close(s);
+ 		return (-1);
+ 	}
+@@ -1105,22 +1137,23 @@ atelnet(int nfd, unsigned char *buf, unsigned int size)
+  * that we should try to connect to.
+  */
+ void
+-build_ports(char *p)
++build_ports(char **p)
+ {
+         struct servent *sv;
+ 	const char *errstr;
+ 	char *n;
+ 	int hi, lo, cp;
+ 	int x = 0;
++	int i;
+ 
+ 	char *proto = proto_name(uflag, dccpflag);
+-	sv = getservbyname(p, proto);
++	sv = getservbyname(*p, proto);
+         if (sv) {
+                 portlist[0] = calloc(1, PORT_MAX_LEN);
+                 if (portlist[0] == NULL)
+                         err(1, NULL);
+                 snprintf(portlist[0], PORT_MAX_LEN, "%d", ntohs(sv->s_port));
+-        } else if ((n = strchr(p, '-')) != NULL) {
++        } else if ((n = strchr(*p, '-')) != NULL) {
+ 		*n = '\0';
+ 		n++;
+ 
+@@ -1128,9 +1161,9 @@ build_ports(char *p)
+ 		hi = strtonum(n, 1, PORT_MAX, &errstr);
+ 		if (errstr)
+ 			errx(1, "port number %s: %s", errstr, n);
+-		lo = strtonum(p, 1, PORT_MAX, &errstr);
++		lo = strtonum(*p, 1, PORT_MAX, &errstr);
+ 		if (errstr)
+-			errx(1, "port number %s: %s", errstr, p);
++			errx(1, "port number %s: %s", errstr, *p);
+ 
+ 		if (lo > hi) {
+ 			cp = hi;
+@@ -1160,10 +1193,12 @@ build_ports(char *p)
+ 			}
+ 		}
+ 	} else {
+-		hi = strtonum(p, 1, PORT_MAX, &errstr);
++		hi = strtonum(*p, 1, PORT_MAX, &errstr);
+ 		if (errstr)
+-			errx(1, "port number %s: %s", errstr, p);
+-		portlist[0] = strdup(p);
++			errx(1, "port number %s: %s", errstr, *p);
++		for (i=0;p[i];i++) {
++			portlist[i] = strdup(p[i]);
++		}
+ 		if (portlist[0] == NULL)
+ 			err(1, NULL);
+ 	}
+@@ -1198,6 +1233,13 @@ set_common_sockopts(int s)
+ {
+ 	int x = 1;
+ 
++# if defined(SO_BROADCAST)
++	if (bflag) {
++		if (setsockopt(s, IPPROTO_TCP, SO_BROADCAST,
++			&x, sizeof(x)) == -1)
++			err(1, NULL);
++	}
++# endif
+ # if defined(TCP_MD5SIG)
+ 	if (Sflag) {
+ 		if (setsockopt(s, IPPROTO_TCP, TCP_MD5SIG,
+@@ -1293,6 +1335,7 @@ help(void)
+ 	fprintf(stderr, "\tCommand Summary:\n\
+ 	\t-4		Use IPv4\n\
+ 	\t-6		Use IPv6\n\
++	\t-b		Allow broadcast\n\
+ 	\t-C		Send CRLF as line-ending\n\
+ 	\t-D		Enable the debug socket option\n\
+ 	\t-d		Detach from stdin\n\
+@@ -1329,7 +1372,7 @@ void
+ usage(int ret)
+ {
+ 	fprintf(stderr,
+-	    "usage: nc [-46CDdhjklnrStUuvZz] [-I length] [-i interval] [-O length]\n"
++	    "usage: nc [-46bCDdhjklnrStUuvZz] [-I length] [-i interval] [-O length]\n"
+ 	    "\t  [-P proxy_username] [-p source_port] [-q seconds] [-s source]\n"
+ 	    "\t  [-T toskeyword] [-V rtable] [-w timeout] [-X proxy_protocol]\n"
+ 	    "\t  [-x proxy_address[:port]] [destination] [port]\n");
+-- 
diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
new file mode 100644
index 0000000..5b16103
--- /dev/null
+++ b/package/netcat-openbsd/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_NETCAT_OPENBSD
+	bool "netcat-openbsd"
+	help
+          A simple Unix utility which reads and writes data across network
+          connections using TCP or UDP protocol. It is designed to be a
+          reliable "back-end" tool that can be used directly or easily driven
+          by other programs and scripts. At the same time it is a feature-rich
+          network debugging and exploration tool, since it can create almost
+          any kind of connection you would need and has several interesting
+          built-in capabilities.
+
+          This package contains the OpenBSD rewrite of netcat, including
+          support for IPv6, proxies, and Unix sockets.
+
+          https://packages.debian.org/sid/netcat-openbsd
diff --git a/package/netcat-openbsd/netcat-openbsd.mk b/package/netcat-openbsd/netcat-openbsd.mk
new file mode 100644
index 0000000..0c1ebd7
--- /dev/null
+++ b/package/netcat-openbsd/netcat-openbsd.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# netcat-openbsd
+#
+################################################################################
+
+NETCAT_OPENBSD_VERSION = 1.105
+NETCAT_OPENBSD_SOURCE = netcat-openbsd_$(NETCAT_OPENBSD_VERSION).orig.tar.gz
+NETCAT_OPENBSD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/n/netcat-openbsd/
+NETCAT_OPENBSD_LICENSE =
+NETCAT_OPENBSD_LICENSE_FILES =
+NETCAT_OPENBSD_DEPENDENCIES = libbsd
+
+define NETCAT_OPENBSD_BUILD_CMDS
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
+endef
+
+define NETCAT_OPENBSD_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 755 -D $(@D)/nc $(TARGET_DIR)/usr/bin/nc
+endef
+
+$(eval $(generic-package))
-- 
2.1.1
