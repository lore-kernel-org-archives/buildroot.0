From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Wed, 31 Aug 2016 22:57:18 +0200
Subject: [Buildroot] [PATCH] pppd: musl-related patches
Message-ID: <1472677038-11185-1-git-send-email-Stefan.Nickl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm new to the list and would like to work on the pppd/musl situation.

As was already noticed, I broke up the OE patch and posted some pull
requests over at https://github.com/paulusmack/ppp/pulls.
However given the low activity over there I don't expect them to get
accepted any time soon and thus want to propose corresponding patches
to buildroot.

I've worked on two additonal patches, one to make the configuration
more granular, and a final one to allow configuring pppd with musl.
They should be ready tomorrow.

During this I've noticed that the package is supposed to be called
"ppp" (Paul's PPP package) instead of "pppd" (the main, but not only
program from that package), and hence wonder if the buildroot package
should be renamed accordingly.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
---
 ...s-types.h-include-to-net-linux-ppp_defs.h.patch |  42 ++++++
 .../0002-Add-ppp_defs.h-include-to-magic.-ch.patch |  43 ++++++
 ...hange-include-from-sys-errno.h-to-errno.h.patch |  30 ++++
 ...linux.c-ethernet-ppp-includes-for-both-gl.patch |  39 +++++
 ...e-inclusion-errors-for-ethernet-structure.patch | 159 +++++++++++++++++++++
 .../0006-Define-error-to-print-to-stderr.patch     |  32 +++++
 6 files changed, 345 insertions(+)
 create mode 100644 package/pppd/0001-Add-sys-types.h-include-to-net-linux-ppp_defs.h.patch
 create mode 100644 package/pppd/0002-Add-ppp_defs.h-include-to-magic.-ch.patch
 create mode 100644 package/pppd/0003-Change-include-from-sys-errno.h-to-errno.h.patch
 create mode 100644 package/pppd/0004-Fix-up-sys-linux.c-ethernet-ppp-includes-for-both-gl.patch
 create mode 100644 package/pppd/0005-Fix-multiple-inclusion-errors-for-ethernet-structure.patch
 create mode 100644 package/pppd/0006-Define-error-to-print-to-stderr.patch

diff --git a/package/pppd/0001-Add-sys-types.h-include-to-net-linux-ppp_defs.h.patch b/package/pppd/0001-Add-sys-types.h-include-to-net-linux-ppp_defs.h.patch
new file mode 100644
index 0000000..319123f
--- /dev/null
+++ b/package/pppd/0001-Add-sys-types.h-include-to-net-linux-ppp_defs.h.patch
@@ -0,0 +1,42 @@
+From 00e54f36d3e32dfdeeebfc029f1a323e67479b96 Mon Sep 17 00:00:00 2001
+From: Stefan Nickl <Stefan.Nickl@gmail.com>
+Date: Tue, 9 Aug 2016 23:32:21 +0200
+Subject: [PATCH] Add sys/types.h include to {net,linux}/ppp_defs.h
+
+struct ppp_idle makes use of the type time_t, which is defined in sys/types.h.
+Therefore, ppp_defs.h should include this header.
+
+This issue goes unnoticed with glibc, but causes a compilation error with musl
+libc.
+
+Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
+
+diff --git a/include/linux/ppp_defs.h b/include/linux/ppp_defs.h
+index 314339e..15d4bbe 100644
+--- a/include/linux/ppp_defs.h
++++ b/include/linux/ppp_defs.h
+@@ -50,6 +50,8 @@
+ #ifndef _PPP_DEFS_H_
+ #define _PPP_DEFS_H_
+ 
++#include <sys/types.h>
++
+ /*
+  * The basic PPP frame.
+  */
+diff --git a/include/net/ppp_defs.h b/include/net/ppp_defs.h
+index b06eda5..5f478f0 100644
+--- a/include/net/ppp_defs.h
++++ b/include/net/ppp_defs.h
+@@ -38,6 +38,8 @@
+ #ifndef _PPP_DEFS_H_
+ #define _PPP_DEFS_H_
+ 
++#include <sys/types.h>
++
+ /*
+  * The basic PPP frame.
+  */
+-- 
+2.7.4
+
diff --git a/package/pppd/0002-Add-ppp_defs.h-include-to-magic.-ch.patch b/package/pppd/0002-Add-ppp_defs.h-include-to-magic.-ch.patch
new file mode 100644
index 0000000..3aa17fd
--- /dev/null
+++ b/package/pppd/0002-Add-ppp_defs.h-include-to-magic.-ch.patch
@@ -0,0 +1,43 @@
+From f64987e2ad943ef3fcd38dbef3c6bce843479c80 Mon Sep 17 00:00:00 2001
+From: Stefan Nickl <Stefan.Nickl@gmail.com>
+Date: Tue, 9 Aug 2016 23:40:52 +0200
+Subject: [PATCH] Add ppp_defs.h include to magic.[ch]
+
+magic.[ch] make use of the __P() macro provided by ppp_defs.h, therefore
+they should include this header.
+
+This omission did not cause compilation errors with glibc because it
+also provides this legacy macro in the non-standard header sys/cdefs.h,
+deprecated by musl.
+
+Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
+
+diff --git a/pppd/magic.c b/pppd/magic.c
+index 2fb23ff..9620033 100644
+--- a/pppd/magic.c
++++ b/pppd/magic.c
+@@ -47,7 +47,7 @@
+ #include <unistd.h>
+ #include <sys/types.h>
+ #include <sys/time.h>
+-
++#include "net/ppp_defs.h"
+ #include "pppd.h"
+ #include "magic.h"
+ 
+diff --git a/pppd/magic.h b/pppd/magic.h
+index c81213b..61d0428 100644
+--- a/pppd/magic.h
++++ b/pppd/magic.h
+@@ -42,6 +42,8 @@
+  * $Id: magic.h,v 1.5 2003/06/11 23:56:26 paulus Exp $
+  */
+ 
++#include "net/ppp_defs.h"
++
+ void magic_init __P((void));	/* Initialize the magic number generator */
+ u_int32_t magic __P((void));	/* Returns the next magic number */
+ 
+-- 
+2.7.4
+
diff --git a/package/pppd/0003-Change-include-from-sys-errno.h-to-errno.h.patch b/package/pppd/0003-Change-include-from-sys-errno.h-to-errno.h.patch
new file mode 100644
index 0000000..d605f6b
--- /dev/null
+++ b/package/pppd/0003-Change-include-from-sys-errno.h-to-errno.h.patch
@@ -0,0 +1,30 @@
+From ee8e14a124a3beb4c43f55adcc84814354473cec Mon Sep 17 00:00:00 2001
+From: Stefan Nickl <Stefan.Nickl@gmail.com>
+Date: Wed, 10 Aug 2016 21:32:21 +0200
+Subject: [PATCH] Change include from sys/errno.h to errno.h
+
+According to POSIX, the canonical location for errno.h is on the top level.
+
+Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
+
+diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
+index b4a435d..20b42ac 100644
+--- a/pppd/sys-linux.c
++++ b/pppd/sys-linux.c
+@@ -73,12 +73,12 @@
+ #include <sys/types.h>
+ #include <sys/socket.h>
+ #include <sys/time.h>
+-#include <sys/errno.h>
+ #include <sys/file.h>
+ #include <sys/stat.h>
+ #include <sys/utsname.h>
+ #include <sys/sysmacros.h>
+ 
++#include <errno.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <syslog.h>
+-- 
+2.7.4
+
diff --git a/package/pppd/0004-Fix-up-sys-linux.c-ethernet-ppp-includes-for-both-gl.patch b/package/pppd/0004-Fix-up-sys-linux.c-ethernet-ppp-includes-for-both-gl.patch
new file mode 100644
index 0000000..e662a89
--- /dev/null
+++ b/package/pppd/0004-Fix-up-sys-linux.c-ethernet-ppp-includes-for-both-gl.patch
@@ -0,0 +1,39 @@
+From 73368fc41b450bafc4a17a4967551d98c0a89569 Mon Sep 17 00:00:00 2001
+From: Stefan Nickl <Stefan.Nickl@gmail.com>
+Date: Wed, 10 Aug 2016 21:22:52 +0200
+Subject: [PATCH] Fix up sys-linux.c ethernet/ppp includes for both glibc and
+ musl
+
+Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
+
+diff --git a/pppd/sys-linux.c b/pppd/sys-linux.c
+index 20b42ac..7442a5d 100644
+--- a/pppd/sys-linux.c
++++ b/pppd/sys-linux.c
+@@ -102,22 +102,13 @@
+ #define MAX_ADDR_LEN 7
+ #endif
+ 
+-#if __GLIBC__ >= 2
+-#include <asm/types.h>		/* glibc 2 conflicts with linux/types.h */
+ #include <net/if.h>
+ #include <net/if_arp.h>
+ #include <net/route.h>
+-#include <netinet/if_ether.h>
+-#else
+-#include <linux/types.h>
+-#include <linux/if.h>
+-#include <linux/if_arp.h>
+-#include <linux/route.h>
+-#include <linux/if_ether.h>
+-#endif
+ #include <netinet/in.h>
+ #include <arpa/inet.h>
+ 
++#include <linux/types.h>	/* need linux-style fixed-size integer typedefs */
+ #include <linux/ppp_defs.h>
+ #include <linux/if_ppp.h>
+ 
+-- 
+2.7.4
+
diff --git a/package/pppd/0005-Fix-multiple-inclusion-errors-for-ethernet-structure.patch b/package/pppd/0005-Fix-multiple-inclusion-errors-for-ethernet-structure.patch
new file mode 100644
index 0000000..500dbb9
--- /dev/null
+++ b/package/pppd/0005-Fix-multiple-inclusion-errors-for-ethernet-structure.patch
@@ -0,0 +1,159 @@
+From 73efcc2508064f6befc0171e9910411546d9fc85 Mon Sep 17 00:00:00 2001
+From: Stefan Nickl <Stefan.Nickl@gmail.com>
+Date: Wed, 10 Aug 2016 11:37:57 +0200
+Subject: [PATCH] Fix multiple inclusion errors for ethernet structure
+
+Inclusion for the low-level ethernet headers in the rp-pppoe plugin is
+quite a mess and does not work for musl libc as-is.  Since this code is
+Linux-only and uses a static config.h, the patch gets rid of the
+pointless flexibility, replacing it by a single inclusion of
+linux/if_pppox.h in pppoe.h.
+
+Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
+
+diff --git a/pppd/plugins/rp-pppoe/config.h b/pppd/plugins/rp-pppoe/config.h
+index 5703087..f7ee4e2 100644
+--- a/pppd/plugins/rp-pppoe/config.h
++++ b/pppd/plugins/rp-pppoe/config.h
+@@ -59,27 +59,15 @@
+ /* Define if you have the <getopt.h> header file.  */
+ #define HAVE_GETOPT_H 1
+ 
+-/* Define if you have the <linux/if_ether.h> header file.  */
+-#define HAVE_LINUX_IF_ETHER_H 1
+-
+-/* Define if you have kernel-mode PPPoE in Linux file.  */
+-#define HAVE_LINUX_KERNEL_PPPOE 1
+-
+ /* Define if you have the <linux/if_packet.h> header file.  */
+ #define HAVE_LINUX_IF_PACKET_H 1
+ 
+-/* Define if you have the <linux/if_pppox.h> header file.  */
+-#define HAVE_LINUX_IF_PPPOX_H 1
+-
+ /* Define if you have the <net/bpf.h> header file.  */
+ #define HAVE_NET_BPF_H 1
+ 
+ /* Define if you have the <net/if_arp.h> header file.  */
+ #define HAVE_NET_IF_ARP_H 1
+ 
+-/* Define if you have the <net/ethernet.h> header file.  */
+-#define HAVE_NET_ETHERNET_H 1
+-
+ /* Define if you have the <net/if.h> header file.  */
+ #define HAVE_NET_IF_H 1
+ 
+@@ -89,24 +77,12 @@
+ /* Define if you have the <net/if_dl.h> header file.  */
+ /* #undef HAVE_NET_IF_DL_H */
+ 
+-/* Define if you have the <net/if_ether.h> header file.  */
+-/* #undef HAVE_NET_IF_ETHER_H */
+-
+ /* Define if you have the <net/if_types.h> header file.  */
+ /* #undef HAVE_NET_IF_TYPES_H */
+ 
+-/* Define if you have the <netinet/if_ether.h> header file.  */
+-#define HAVE_NETINET_IF_ETHER_H 1
+-
+ /* Define if you have the <netpacket/packet.h> header file.  */
+ #define HAVE_NETPACKET_PACKET_H 1
+ 
+-/* Define if you have the <sys/cdefs.h> header file.  */
+-#define HAVE_SYS_CDEFS_H 1
+-
+-/* Define if you have the <sys/dlpi.h> header file.  */
+-/* #undef HAVE_SYS_DLPI_H */
+-
+ /* Define if you have the <sys/ioctl.h> header file.  */
+ #define HAVE_SYS_IOCTL_H 1
+ 
+diff --git a/pppd/plugins/rp-pppoe/if.c b/pppd/plugins/rp-pppoe/if.c
+index 91e9a57..9c0fac3 100644
+--- a/pppd/plugins/rp-pppoe/if.c
++++ b/pppd/plugins/rp-pppoe/if.c
+@@ -30,10 +30,6 @@ static char const RCSID[] =
+ #include <linux/if_packet.h>
+ #endif
+ 
+-#ifdef HAVE_NET_ETHERNET_H
+-#include <net/ethernet.h>
+-#endif
+-
+ #ifdef HAVE_ASM_TYPES_H
+ #include <asm/types.h>
+ #endif
+diff --git a/pppd/plugins/rp-pppoe/plugin.c b/pppd/plugins/rp-pppoe/plugin.c
+index c89be94..6697ad9 100644
+--- a/pppd/plugins/rp-pppoe/plugin.c
++++ b/pppd/plugins/rp-pppoe/plugin.c
+@@ -46,10 +46,8 @@ static char const RCSID[] =
+ #include <unistd.h>
+ #include <fcntl.h>
+ #include <signal.h>
+-#include <net/ethernet.h>
+ #include <net/if_arp.h>
+ #include <linux/ppp_defs.h>
+-#include <linux/if_pppox.h>
+ 
+ #ifndef _ROOT_PATH
+ #define _ROOT_PATH ""
+diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
+index 3d3bf4e..d6e0131 100644
+--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
++++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
+@@ -27,10 +27,6 @@
+ #include <linux/if_packet.h>
+ #endif
+ 
+-#ifdef HAVE_NET_ETHERNET_H
+-#include <net/ethernet.h>
+-#endif
+-
+ #ifdef HAVE_ASM_TYPES_H
+ #include <asm/types.h>
+ #endif
+diff --git a/pppd/plugins/rp-pppoe/pppoe.h b/pppd/plugins/rp-pppoe/pppoe.h
+index 9ab2eee..36cb0ae 100644
+--- a/pppd/plugins/rp-pppoe/pppoe.h
++++ b/pppd/plugins/rp-pppoe/pppoe.h
+@@ -39,10 +39,6 @@
+ #error Unknown method for accessing raw Ethernet frames
+ #endif
+ 
+-#ifdef HAVE_SYS_CDEFS_H
+-#include <sys/cdefs.h>
+-#endif
+-
+ #ifdef HAVE_SYS_SOCKET_H
+ #include <sys/socket.h>
+ #endif
+@@ -80,24 +76,12 @@ typedef unsigned long UINT32_t;
+ #error Could not find a 32-bit integer type
+ #endif
+ 
+-#ifdef HAVE_LINUX_IF_ETHER_H
+-#include <linux/if_ether.h>
+-#endif
+-
+ #include <netinet/in.h>
+-
+-#ifdef HAVE_NETINET_IF_ETHER_H
+-#include <sys/types.h>
++#include <linux/if_pppox.h>
+ 
+ #ifdef HAVE_SYS_SOCKET_H
+ #include <sys/socket.h>
+ #endif
+-#ifndef HAVE_SYS_DLPI_H
+-#include <netinet/if_ether.h>
+-#endif
+-#endif
+-
+-
+ 
+ /* Ethernet frame types according to RFC 2516 */
+ #define ETH_PPPOE_DISCOVERY 0x8863
+-- 
+2.7.4
+
diff --git a/package/pppd/0006-Define-error-to-print-to-stderr.patch b/package/pppd/0006-Define-error-to-print-to-stderr.patch
new file mode 100644
index 0000000..51c2200
--- /dev/null
+++ b/package/pppd/0006-Define-error-to-print-to-stderr.patch
@@ -0,0 +1,32 @@
+From 5fb581a5efa26138ba5847f7de2b12b53ae837c0 Mon Sep 17 00:00:00 2001
+From: Stefan Nickl <Stefan.Nickl@gmail.com>
+Date: Wed, 10 Aug 2016 16:52:12 +0200
+Subject: [PATCH] Define error() to print to stderr
+
+The pppoe-discovery program calls error() from the CHECK_ROOM macro
+defined in pppoe.h. Since this standalone program is not linked with the
+rest of pppd, the only way this can build is by linking to glibc's
+proprietary error(3) function instead of the function of the same name
+(but with different arguments) defined in pppd/utils.c.
+
+So when linked with glibc, this probably crashes when the assertion
+fails. With musl libc, the binary cannot be built in the first place
+because it does not provide the doppelganger.
+
+Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
+
+diff --git a/pppd/plugins/rp-pppoe/pppoe-discovery.c b/pppd/plugins/rp-pppoe/pppoe-discovery.c
+index d6e0131..8cfbc29 100644
+--- a/pppd/plugins/rp-pppoe/pppoe-discovery.c
++++ b/pppd/plugins/rp-pppoe/pppoe-discovery.c
+@@ -15,6 +15,7 @@
+ #include <errno.h>
+ #include <string.h>
+ 
++#define error(format, ...) fprintf(stderr, format, ##__VA_ARGS__)
+ #include "pppoe.h"
+ 
+ #ifdef HAVE_UNISTD_H
+-- 
+2.7.4
+
-- 
2.7.4
