From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Mar 2016 10:35:09 +0100
Subject: [Buildroot] [PATCH] pppd: fix MUSL build
In-Reply-To: <1458561219-28017-1-git-send-email-yegorslists@googlemail.com>
References: <1458561219-28017-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <20160322103509.4f5197e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Mar 2016 12:53:39 +0100, yegorslists at googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Apply a patch provided by OpemEmbedded:
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-connectivity/ppp/ppp/0001-Fix-build-with-musl.patch
> 
> This patch separates glibc related includes/defines from non-glibc, like
> including sys/cdefs.h etc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/24c/24c8316e579965deb408caef8b4fc81ca8119a70/
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Thanks for this patch, but I'm going to give it the same answer as the
one I gave to Bernd when he submitted a lot of musl related fixes.

The OE patch fixes the problem, but is not good. It's one single patch
fixing lots of different things, with just a vague explanation "fix
with musl". This might be OK for OpenEmbedded, but it's not OK for
Buildroot. We want individual patches for the different problems, as
well as a better explanation for what is being fixed. In general, it's
not just about "fixing musl", but about "being more standard compliant".

Also, there is one thing that is definitely not upstreamable. Read on
below.

pppd seems to have a Github repository at
https://github.com/paulusmack/ppp, so it would be good to send a pull
request with the musl fixes.

> diff --git a/package/pppd/0001-Fix-build-with-musl.patch b/package/pppd/0001-Fix-build-with-musl.patch
> new file mode 100644
> index 0000000..a1aeeb3
> --- /dev/null
> +++ b/package/pppd/0001-Fix-build-with-musl.patch
> @@ -0,0 +1,161 @@
> +From 473f60b1dfcd287bc9d40a69a9c614579d0f64bf Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 29 May 2015 14:57:05 -0700
> +Subject: [PATCH] Fix build with musl
> +
> +There are several assumption about glibc
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>

When you import patches from others, you should add your SoB here.

> +diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
> +index b06eda5..dafa36c 100644
> +--- a/include/net/ppp_defs.h
> ++++ b/include/net/ppp_defs.h
> +@@ -38,6 +38,8 @@
> + #ifndef _PPP_DEFS_H_
> + #define _PPP_DEFS_H_
> + 
> ++#include <sys/time.h>

This change looks OK, just needs to be justified by a proper commit log.

> ++
> + /*
> +  * The basic PPP frame.
> +  */
> +diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
> +index a74c914..7acd2cf 100644
> +--- a/pppd/Makefile.linux
> ++++ b/pppd/Makefile.linux
> +@@ -126,7 +126,7 @@ LIBS	+= -lcrypt
> + endif
> + 
> + ifdef USE_LIBUTIL
> +-CFLAGS	+= -DHAVE_LOGWTMP=1
> ++#CFLAGS	+= -DHAVE_LOGWTMP=1

This is definitely not OK, since it changes the behavior for everyone,
not just musl users.

> + LIBS	+= -lutil
> + endif
> + 
> +diff --git a/pppd/magic.h b/pppd/magic.h
> +index c81213b..9d399e3 100644
> +--- a/pppd/magic.h
> ++++ b/pppd/magic.h
> +@@ -42,8 +42,8 @@
> +  * $Id: magic.h,v 1.5 2003/06/11 23:56:26 paulus Exp $
> +  */
> + 
> +-void magic_init __P((void));	/* Initialize the magic number generator */
> +-u_int32_t magic __P((void));	/* Returns the next magic number */
> ++void magic_init (void);	/* Initialize the magic number generator */
> ++u_int32_t magic (void);	/* Returns the next magic number */
> + 
> + /* Fill buffer with random bytes */
> +-void random_bytes __P((unsigned char *buf, int len));
> ++void random_bytes (unsigned char *buf, int len);

This is OK, but it should be justified why __P is not needed.

> +diff --git a/pppd/plugins/rp-pppoe/config.h b/pppd/plugins/rp-pppoe/config.h
> +index 5703087..fff032e 100644
> +--- a/pppd/plugins/rp-pppoe/config.h
> ++++ b/pppd/plugins/rp-pppoe/config.h
> +@@ -78,8 +78,9 @@
> + #define HAVE_NET_IF_ARP_H 1
> + 
> + /* Define if you have the <net/ethernet.h> header file.  */
> ++#ifdef __GLIBC__
> + #define HAVE_NET_ETHERNET_H 1
> +-
> ++#endif
> + /* Define if you have the <net/if.h> header file.  */
> + #define HAVE_NET_IF_H 1
> + 
> +@@ -102,7 +103,9 @@
> + #define HAVE_NETPACKET_PACKET_H 1
> + 
> + /* Define if you have the <sys/cdefs.h> header file.  */
> ++#ifdef __GLIBC__
> + #define HAVE_SYS_CDEFS_H 1
> ++#endif

Is the <sys/cdefs.h> header file really used anywhere now that you have
removed the __P usage ?

> + 
> + /* Define if you have the <sys/dlpi.h> header file.  */
> + /* #undef HAVE_SYS_DLPI_H */
> +diff --git a/pppd/plugins/rp-pppoe/plugin.c b/pppd/plugins/rp-pppoe/plugin.c
> +index a8c2bb4..ca34d79 100644
> +--- a/pppd/plugins/rp-pppoe/plugin.c
> ++++ b/pppd/plugins/rp-pppoe/plugin.c
> +@@ -46,7 +46,6 @@ static char const RCSID[] =
> + #include <unistd.h>
> + #include <fcntl.h>
> + #include <signal.h>
> +-#include <net/ethernet.h>

So this place was not using the HAVE_NET_ETHERNET_H definition?

> + #include <net/if_arp.h>
> + #include <linux/ppp_defs.h>
> + #include <linux/if_pppox.h>
> +diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
> +index 3d3bf4e..d42f619 100644
> +--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
> ++++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
> +@@ -27,10 +27,6 @@
> + #include <linux/if_packet.h>
> + #endif
> + 
> +-#ifdef HAVE_NET_ETHERNET_H
> +-#include <net/ethernet.h>
> +-#endif

Why ?

> +-
> + #ifdef HAVE_ASM_TYPES_H
> + #include <asm/types.h>
> + #endif
> +@@ -47,6 +43,10 @@
> + #include <net/if_arp.h>
> + #endif
> + 
> ++#ifndef __GLIBC__
> ++#define error(x...) fprintf(stderr, x)
> ++#endif

This looks weird, here is what man error says:

   void error(int status, int errnum, const char *format, ...);

> +-#ifndef HAVE_SYS_DLPI_H
> ++#if !defined HAVE_SYS_DLPI_H && defined HAVE_NET_ETHERNET_H
> + #include <netinet/if_ether.h>

This also looks weird, as the header file being included has nothing to
do with the definitions being tested.

> + #endif
> + #endif
> +diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
> +index e5e9baf..1008cb1 100644
> +--- a/pppd/sys-linux.c
> ++++ b/pppd/sys-linux.c
> +@@ -112,7 +112,7 @@
> + #include <linux/types.h>
> + #include <linux/if.h>
> + #include <linux/if_arp.h>
> +-#include <linux/route.h>
> ++/* #include <linux/route.h> */

Commenting out code is not good, remove it if it's useless.

> + #include <linux/if_ether.h>
> + #endif
> + #include <netinet/in.h>
> +@@ -145,6 +145,7 @@
> + #endif
> + 
> + #ifdef INET6
> ++#include <net/route.h>
> + #ifndef _LINUX_IN6_H
> + /*
> +  *    This is in linux/include/net/ipv6.h.
> +-- 
> +2.1.4
> +

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
