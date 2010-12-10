From: Serj Kalichev <serj.kalichev@gmail.com>
Date: Fri, 10 Dec 2010 16:45:11 +0300
Subject: [Buildroot] [PATCH 2/2] iproute2: Fix auto configuration to work in
	cross environment.
In-Reply-To: <1291988711-8162-1-git-send-email-serj.kalichev@gmail.com>
References: <1291988711-8162-1-git-send-email-serj.kalichev@gmail.com>
Message-ID: <1291988711-8162-2-git-send-email-serj.kalichev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The iproute2's configure script was fixed to work with cross
toolchain. Now it can use tools from cross toolchain but not
from the host. So it can automatically generate right Config
file. The checks for the IPv6 support and Berkeley DB
availability were added to the configure script. The
Berkeley DB support is needed to build (or not) arpd.

The iproute2 can be build without IPv6 support now.

The iproute2 can use the libxtables library from iptables
package. So the iptables was conditionally added to the
dependencies. If the iptables is not build it's not a
critical problem, the iproute2 package can be build without
iptables.

Signed-off-by: Serj Kalichev <serj.kalichev@gmail.com>
---
 package/iproute2/Config.in                         |    4 -
 .../iproute2/iproute2-2.6.35-cross-configure.patch |  463 ++++++++++++++++++++
 package/iproute2/iproute2.mk                       |   20 +-
 3 files changed, 475 insertions(+), 12 deletions(-)
 create mode 100644 package/iproute2/iproute2-2.6.35-cross-configure.patch

diff --git a/package/iproute2/Config.in b/package/iproute2/Config.in
index 2412d8e..b6ee86e 100644
--- a/package/iproute2/Config.in
+++ b/package/iproute2/Config.in
@@ -1,11 +1,7 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
-	depends on BR2_INET_IPV6
 	help
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
 
 	  http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2
-
-comment "iproute2 requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
diff --git a/package/iproute2/iproute2-2.6.35-cross-configure.patch b/package/iproute2/iproute2-2.6.35-cross-configure.patch
new file mode 100644
index 0000000..06f92b7
--- /dev/null
+++ b/package/iproute2/iproute2-2.6.35-cross-configure.patch
@@ -0,0 +1,463 @@
+diff -uNr iproute2-2.6.35-old//configure iproute2-2.6.35-new//configure
+--- iproute2-2.6.35-old//configure	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//configure	2010-12-09 22:10:08.000000000 +0300
+@@ -1,6 +1,12 @@
+ #! /bin/bash
+ # This is not an autconf generated configure
+ #
++
++# Get compiler from CC environment variable
++if test ! -n "$CC"; then
++	CC=gcc
++fi
++
+ INCLUDE=${1:-"$PWD/include"}
+ 
+ TABLES=
+@@ -15,7 +21,7 @@
+ 	return 0;
+ }
+ EOF
+-gcc -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c -latm >/dev/null 2>&1 
++$CC $CFLAGS $CPPFLAGS -I$INCLUDE -o /tmp/atmtest /tmp/atmtest.c $LDFLAGS -latm >/dev/null 2>&1
+ if [ $? -eq 0 ]
+ then
+     echo "TC_CONFIG_ATM:=y" >>Config
+@@ -49,7 +55,7 @@
+ 
+ EOF
+ 
+-if gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl -lxtables >/dev/null 2>&1
++if $CC $CFLAGS $CPPFLAGS -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $LDFLAGS $IPTL -ldl -lxtables >/dev/null 2>&1
+ then
+ 	echo "TC_CONFIG_XT:=y" >>Config
+ 	echo "using xtables"
+@@ -86,7 +92,7 @@
+ }
+ 
+ EOF
+-gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
++$CC $CFLAGS $CPPFLAGS -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $LDFLAGS $IPTL -ldl >/dev/null 2>&1
+ 
+ if [ $? -eq 0 ]
+ then
+@@ -126,7 +132,7 @@
+ }
+ 
+ EOF
+-gcc -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $IPTL -ldl >/dev/null 2>&1
++$CC $CFLAGS $CPPFLAGS -I$INCLUDE $IPTC -o /tmp/ipttest /tmp/ipttest.c $LDFLAGS $IPTL -ldl >/dev/null 2>&1
+ 
+ if [ $? -eq 0 ]
+ then
+@@ -152,7 +158,7 @@
+ 	IPT_LIB_DIR=""
+ 	for dir in /lib /usr/lib /usr/local/lib
+ 	do
+-		for file in $dir/$TABLES/lib*t_*so ; do
++		for file in $SYSROOT$dir/$TABLES/lib*t_*so ; do
+ 			if [ -f $file ]; then
+ 				echo $dir/$TABLES
+ 				echo "IPT_LIB_DIR:=$dir/$TABLES" >> Config
+@@ -163,6 +169,57 @@
+ 	echo "not found!"
+ }
+ 
++check_ipv6()
++{
++cat >/tmp/ipv6_test.c <<EOF
++#include <sys/types.h>
++#include <sys/socket.h>
++#include <netinet/in.h>
++#include <netinet/ip6.h>
++int main(int argc, char **argv) {
++	struct sockaddr_in6 s;
++	struct in6_addr t=in6addr_any;
++	int i=AF_INET6; s;
++	struct ip6_opt;
++	t.s6_addr[0] = 0;
++	return 0;
++}
++EOF
++$CC $CFLAGS $CPPFLAGS -I$INCLUDE -o /tmp/ipv6_test /tmp/ipv6_test.c $LDFLAGS >/dev/null 2>&1
++if [ $? -eq 0 ]
++then
++    echo "CONFIG_IPV6=y" >> Config
++    echo "yes"
++else
++    echo "# CONFIG_IPV6 is not set" >> Config
++    echo "no"
++fi
++rm -f /tmp/ipv6_test.c /tmp/ipv6_test
++}
++
++check_bdb()
++{
++cat >/tmp/bdb_test.c <<EOF
++#include <stdio.h>
++#include <db.h>
++int main(int argc, char **argv) {
++	int major,minor,patch;
++	db_version(&major,&minor,&patch);
++	return 0;
++}
++EOF
++$CC $CFLAGS $CPPFLAGS -I$INCLUDE -o /tmp/bdb_test /tmp/bdb_test.c $LDFLAGS -ldb >/dev/null 2>&1
++if [ $? -eq 0 ]
++then
++    echo "CONFIG_BDB=y" >> Config
++    echo "yes"
++else
++    echo "# CONFIG_BDB is not set" >> Config
++    echo "no"
++fi
++rm -f /tmp/bdb_test.c /tmp/bdb_test
++}
++
+ echo "# Generated config based on" $INCLUDE >Config
+ 
+ echo "TC schedulers"
+@@ -178,3 +235,8 @@
+ 
+ echo -n "iptables modules directory: "
+ check_ipt_lib_dir
++
++echo -n "IPv6 support: "
++check_ipv6
++echo -n "BerkeleyDB support: "
++check_bdb
+diff -uNr iproute2-2.6.35-old//genl/Makefile iproute2-2.6.35-new//genl/Makefile
+--- iproute2-2.6.35-old//genl/Makefile	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//genl/Makefile	2010-12-09 21:33:18.000000000 +0300
+@@ -11,12 +11,14 @@
+ GENLLIB :=
+ 
+ ifeq ($(SHARED_LIBS),y)
+-LDFLAGS += -Wl,-export-dynamic
+-LDLIBS  += -lm -ldl
++INT_LDFLAGS += -Wl,-export-dynamic
++INT_LDLIBS  += -lm -ldl
+ endif
+ 
+ all: genl
+ 
++include ../Makefile.rules
++
+ genl: $(GENLOBJ) $(LIBNETLINK) $(LIBUTIL) $(GENLLIB)
+ 
+ install: all
+diff -uNr iproute2-2.6.35-old//ip/ipprefix.c iproute2-2.6.35-new//ip/ipprefix.c
+--- iproute2-2.6.35-old//ip/ipprefix.c	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//ip/ipprefix.c	2010-12-09 21:14:33.000000000 +0300
+@@ -26,7 +26,9 @@
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#ifdef CONFIG_IPV6
+ #include <netinet/icmp6.h>
++#endif /* CONFIG_IPV6 */
+ #include "utils.h"
+ 
+ /* prefix flags; see kernel's net/ipv6/addrconf.c and include/net/if_inet6.h */
+@@ -35,6 +37,7 @@
+ 
+ int print_prefix(const struct sockaddr_nl *who, struct nlmsghdr *n, void *arg)
+ {
++#ifdef CONFIG_IPV6
+ 	FILE *fp = (FILE*)arg;
+ 	struct prefixmsg *prefix = NLMSG_DATA(n);
+ 	int len = n->nlmsg_len;
+@@ -100,6 +103,7 @@
+ 
+ 	fprintf(fp, "\n");
+ 	fflush(fp);
++#endif /* CONFIG_IPV6 */
+ 
+ 	return 0;
+ }
+diff -uNr iproute2-2.6.35-old//ip/iptunnel.c iproute2-2.6.35-new//ip/iptunnel.c
+--- iproute2-2.6.35-old//ip/iptunnel.c	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//ip/iptunnel.c	2010-12-09 19:06:47.000000000 +0300
+@@ -80,6 +80,7 @@
+ 					exit(-1);
+ 				}
+ 				p->iph.protocol = IPPROTO_GRE;
++#ifdef CONFIG_IPV6
+ 			} else if (strcmp(*argv, "sit") == 0 ||
+ 				   strcmp(*argv, "ipv6/ip") == 0) {
+ 				if (p->iph.protocol && p->iph.protocol != IPPROTO_IPV6) {
+@@ -94,6 +95,7 @@
+ 				}
+ 				p->iph.protocol = IPPROTO_IPV6;
+ 				isatap++;
++#endif /* CONFIG_IPV6 */
+ 			} else {
+ 				fprintf(stderr,"Cannot guess tunnel mode.\n");
+ 				exit(-1);
+@@ -215,12 +217,14 @@
+ 			p->iph.protocol = IPPROTO_GRE;
+ 		else if (memcmp(p->name, "ipip", 4) == 0)
+ 			p->iph.protocol = IPPROTO_IPIP;
++#ifdef CONFIG_IPV6
+ 		else if (memcmp(p->name, "sit", 3) == 0)
+ 			p->iph.protocol = IPPROTO_IPV6;
+ 		else if (memcmp(p->name, "isatap", 6) == 0) {
+ 			p->iph.protocol = IPPROTO_IPV6;
+ 			isatap++;
+ 		}
++#endif /* CONFIG_IPV6 */
+ 	}
+ 
+ 	if (p->iph.protocol == IPPROTO_IPIP || p->iph.protocol == IPPROTO_IPV6) {
+@@ -272,8 +276,10 @@
+ 		return tnl_add_ioctl(cmd, "tunl0", p.name, &p);
+ 	case IPPROTO_GRE:
+ 		return tnl_add_ioctl(cmd, "gre0", p.name, &p);
++#ifdef CONFIG_IPV6
+ 	case IPPROTO_IPV6:
+ 		return tnl_add_ioctl(cmd, "sit0", p.name, &p);
++#endif /* CONFIG_IPV6 */
+ 	default:
+ 		fprintf(stderr, "cannot determine tunnel mode (ipip, gre or sit)\n");
+ 		return -1;
+@@ -293,8 +299,10 @@
+ 		return tnl_del_ioctl("tunl0", p.name, &p);
+ 	case IPPROTO_GRE:
+ 		return tnl_del_ioctl("gre0", p.name, &p);
++#ifdef CONFIG_IPV6
+ 	case IPPROTO_IPV6:
+ 		return tnl_del_ioctl("sit0", p.name, &p);
++#endif /* CONFIG_IPV6 */
+ 	default:
+ 		return tnl_del_ioctl(p.name, p.name, &p);
+ 	}
+@@ -477,9 +485,11 @@
+ 	case IPPROTO_GRE:
+ 		err = tnl_get_ioctl(p.name[0] ? p.name : "gre0", &p);
+ 		break;
++#ifdef CONFIG_IPV6
+ 	case IPPROTO_IPV6:
+ 		err = tnl_get_ioctl(p.name[0] ? p.name : "sit0", &p);
+ 		break;
++#endif /* CONFIG_IPV6 */
+ 	default:
+ 		do_tunnels_list(&p);
+ 		return 0;
+@@ -601,8 +611,10 @@
+ 	 * protocol-independent because of unarranged structure between
+ 	 * IPv4 and IPv6.
+ 	 */
++#ifdef CONFIG_IPV6
+ 	case AF_INET6:
+ 		return do_ip6tunnel(argc, argv);
++#endif /* CONFIG_IPV6 */
+ 	default:
+ 		fprintf(stderr, "Unsupported family:%d\n", preferred_family);
+ 		exit(-1);
+diff -uNr iproute2-2.6.35-old//ip/Makefile iproute2-2.6.35-new//ip/Makefile
+--- iproute2-2.6.35-old//ip/Makefile	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//ip/Makefile	2010-12-09 20:39:38.000000000 +0300
+@@ -1,10 +1,19 @@
++# Get global settings
++include ../Config
++
+ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o \
+-    rtm_map.o iptunnel.o ip6tunnel.o tunnel.o ipneigh.o ipntable.o iplink.o \
++    rtm_map.o iptunnel.o tunnel.o ipneigh.o ipntable.o iplink.o \
+     ipmaddr.o ipmonitor.o ipmroute.o ipprefix.o iptuntap.o \
+     ipxfrm.o xfrm_state.o xfrm_policy.o xfrm_monitor.o \
+     iplink_vlan.o link_veth.o link_gre.o iplink_can.o \
+     iplink_macvlan.o
+ 
++# Optional IPv6 support
++ifneq ($(CONFIG_IPV6),)
++INT_CFLAGS += -DCONFIG_IPV6=1
++IPOBJ += ip6tunnel.o
++endif
++
+ RTMONOBJ=rtmon.o
+ 
+ ALLOBJ=$(IPOBJ) $(RTMONOBJ)
+@@ -13,6 +22,8 @@
+ 
+ all: $(TARGETS) $(SCRIPTS) $(LIBS)
+ 
++include ../Makefile.rules
++
+ ip: $(IPOBJ) $(LIBNETLINK) $(LIBUTIL)
+ 
+ rtmon: $(RTMONOBJ) $(LIBNETLINK)
+@@ -27,8 +38,8 @@
+ SHARED_LIBS ?= y
+ ifeq ($(SHARED_LIBS),y)
+ 
+-LDLIBS += -ldl
+-LDFLAGS += -Wl,-export-dynamic
++INT_LDLIBS += -ldl
++INT_LDFLAGS += -Wl,-export-dynamic
+ 
+ else
+ 
+diff -uNr iproute2-2.6.35-old//lib/Makefile iproute2-2.6.35-new//lib/Makefile
+--- iproute2-2.6.35-old//lib/Makefile	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//lib/Makefile	2010-12-09 20:32:21.000000000 +0300
+@@ -6,6 +6,8 @@
+ 
+ all: libnetlink.a libutil.a
+ 
++include ../Makefile.rules
++
+ libnetlink.a: $(NLOBJ)
+ 	$(AR) rcs $@ $(NLOBJ)
+ 
+diff -uNr iproute2-2.6.35-old//Makefile iproute2-2.6.35-new//Makefile
+--- iproute2-2.6.35-old//Makefile	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//Makefile	2010-12-09 21:30:42.000000000 +0300
+@@ -18,7 +18,7 @@
+ endif
+ 
+ #options if you have a bind>=4.9.4 libresolv (or, maybe, glibc)
+-LDLIBS=-lresolv
++INT_LDLIBS=-lresolv
+ ADDLIB=
+ 
+ #options for decnet
+@@ -29,11 +29,12 @@
+ 
+ CC = gcc
+ HOSTCC = gcc
+-CCOPTS = -D_GNU_SOURCE -O2 -Wstrict-prototypes -Wall
+-CFLAGS = $(CCOPTS) -I../include $(DEFINES)
++CCOPTS = -O2 -Wstrict-prototypes -Wall
++INT_CFLAGS = -D_GNU_SOURCE -I../include $(DEFINES)
++CFLAGS = $(CCOPTS)
+ YACCFLAGS = -d -t -v
+ 
+-LDLIBS += -L../lib -lnetlink -lutil
++INT_LDLIBS += -L../lib -lnetlink -lutil
+ 
+ SUBDIRS=lib ip tc misc netem genl
+ 
+diff -uNr iproute2-2.6.35-old//Makefile.rules iproute2-2.6.35-new//Makefile.rules
+--- iproute2-2.6.35-old//Makefile.rules	1970-01-01 03:00:00.000000000 +0300
++++ iproute2-2.6.35-new//Makefile.rules	2010-12-09 20:35:39.000000000 +0300
+@@ -0,0 +1,5 @@
++%.o: %.c
++	$(CC) $(CPPFLAGS) $(INT_CPPFLAGS) $(CFLAGS) $(INT_CFLAGS) -c $(<)
++
++%: %.o
++	$(CC) -o $(@) $(LDFLAGS) $(INT_LDFLAGS) $(^) $(LOADLIBES) $(INT_LOADLIBES) $(LDLIBS) $(INT_LDLIBS)
+diff -uNr iproute2-2.6.35-old//misc/Makefile iproute2-2.6.35-new//misc/Makefile
+--- iproute2-2.6.35-old//misc/Makefile	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//misc/Makefile	2010-12-09 21:23:09.000000000 +0300
+@@ -1,25 +1,33 @@
++# Get global settings
++include ../Config
++
+ SSOBJ=ss.o ssfilter.o
+ LNSTATOBJ=lnstat.o lnstat_util.o
+ 
+-TARGETS=ss nstat ifstat rtacct arpd lnstat
++TARGETS=ss nstat ifstat rtacct lnstat
+ 
+-include ../Config
++# The arpd needs Berkeley db libraries
++ifneq ($(CONFIG_BDB),)
++TARGETS += arpd
++endif
+ 
+ all: $(TARGETS)
+ 
++include ../Makefile.rules
++
+ ss: $(SSOBJ) $(LIBUTIL)
+ 
+ nstat: nstat.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o nstat nstat.c -lm
++	$(CC) $(CFLAGS) $(INT_CFLAGS) $(LDFLAGS) $(INT_LDFLAGS) -o nstat nstat.c -lm
+ 
+ ifstat: ifstat.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o ifstat ifstat.c $(LIBNETLINK) -lm
++	$(CC) $(CFLAGS) $(INT_CFLAGS) $(LDFLAGS) $(INT_LDFLAGS) -o ifstat ifstat.c $(LIBNETLINK) -lm
+ 
+ rtacct: rtacct.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -o rtacct rtacct.c $(LIBNETLINK) -lm
++	$(CC) $(CFLAGS) $(INT_CFLAGS) $(LDFLAGS) $(INT_LDFLAGS) -o rtacct rtacct.c $(LIBNETLINK) -lm
+ 
+ arpd: arpd.c
+-	$(CC) $(CFLAGS) -I$(DBM_INCLUDE) $(LDFLAGS) -o arpd arpd.c $(LIBNETLINK) -ldb -lpthread
++	$(CC) $(CFLAGS) $(INT_CFLAGS) -I$(DBM_INCLUDE) $(LDFLAGS) $(INT_LDFLAGS) -o arpd arpd.c $(LIBNETLINK) -ldb -lpthread
+ 
+ ssfilter.c: ssfilter.y
+ 	bison ssfilter.y -o ssfilter.c
+diff -uNr iproute2-2.6.35-old//tc/Makefile iproute2-2.6.35-new//tc/Makefile
+--- iproute2-2.6.35-old//tc/Makefile	2010-08-04 21:45:59.000000000 +0400
++++ iproute2-2.6.35-new//tc/Makefile	2010-12-09 21:20:34.000000000 +0300
+@@ -55,7 +55,7 @@
+     TCSO += m_xt_old.so
+   else
+     ifeq ($(TC_CONFIG_XT_OLD_H),y)
+-	CFLAGS += -DTC_CONFIG_XT_H
++	INT_CFLAGS += -DTC_CONFIG_XT_H
+ 	TCSO += m_xt_old.so
+     else
+       TCMODULES += m_ipt.o
+@@ -64,11 +64,11 @@
+ endif
+ 
+ TCOBJ += $(TCMODULES)
+-LDLIBS += -L. -ltc -lm
++INT_LDLIBS += -L. -ltc -lm
+ 
+ ifeq ($(SHARED_LIBS),y)
+-LDLIBS += -ldl
+-LDFLAGS += -Wl,-export-dynamic
++INT_LDLIBS += -ldl
++INT_LDFLAGS += -Wl,-export-dynamic
+ endif
+ 
+ TCLIB := tc_core.o
+@@ -77,9 +77,9 @@
+ TCLIB += tc_estimator.o
+ TCLIB += tc_stab.o
+ 
+-CFLAGS += -DCONFIG_GACT -DCONFIG_GACT_PROB
++INT_CFLAGS += -DCONFIG_GACT -DCONFIG_GACT_PROB
+ ifneq ($(IPT_LIB_DIR),)
+-	CFLAGS += -DIPT_LIB_DIR=\"$(IPT_LIB_DIR)\"
++	INT_CFLAGS += -DIPT_LIB_DIR=\"$(IPT_LIB_DIR)\"
+ endif
+ 
+ YACC := bison
+@@ -88,11 +88,13 @@
+ MODDESTDIR := $(DESTDIR)$(patsubst /usr%,%,$(LIBDIR))/tc
+ 
+ %.so: %.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -shared -fpic $< -o $@
++	$(CC) $(CFLAGS) $(INT_CFLAGS) $(LDFLAGS) $(INT_LDFLAGS) -shared -fpic $< -o $@
+ 
+ 
+ all: libtc.a tc $(TCSO)
+ 
++include ../Makefile.rules
++
+ tc: $(TCOBJ) $(LIBNETLINK) $(LIBUTIL) $(TCLIB)
+ 
+ libtc.a: $(TCLIB)
+@@ -117,13 +119,13 @@
+ 	rm -f emp_ematch.yacc.output
+ 
+ q_atm.so: q_atm.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -shared -fpic -o q_atm.so q_atm.c -latm
++	$(CC) $(CFLAGS) $(INT_CFLAGS) $(LDFLAGS) $(INT_LDFLAGS) -shared -fpic -o q_atm.so q_atm.c -latm
+ 
+ m_xt.so: m_xt.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -shared -fpic -o m_xt.so m_xt.c -lxtables
++	$(CC) $(CFLAGS) $(INT_CFLAGS) $(LDFLAGS) $(INT_LDFLAGS) -shared -fpic -o m_xt.so m_xt.c -lxtables
+ 
+ m_xt_old.so: m_xt_old.c
+-	$(CC) $(CFLAGS) $(LDFLAGS) -shared -fpic -o m_xt_old.so m_xt_old.c -lxtables
++	$(CC) $(CFLAGS) $(INT_CFLAGS) $(LDFLAGS) $(INT_LDFLAGS) -shared -fpic -o m_xt_old.so m_xt_old.c -lxtables
+ 
+ %.yacc.c: %.y
+ 	$(YACC) $(YACCFLAGS) -o $@ $<
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0f99894..9229d17 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -8,19 +8,23 @@ IPROUTE2_VERSION = 2.6.35
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.bz2
 IPROUTE2_SITE = http://devresources.linuxfoundation.org/dev/iproute2/download
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
+ifneq ($(BR2_PACKAGE_IPTABLES),)
+IPROUTE2_DEPENDENCIES += iptables
+endif
+IPROUTE2_CONF_INCLUDE = $(STAGING_DIR)/usr/include
 
 define IPROUTE2_CONFIGURE_CMDS
-	# Use kernel headers
-	rm -r $(IPROUTE2_DIR)/include/netinet
-	# arpd needs berkeleydb
-	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
-	$(SED) "s:-O2:$(TARGET_CFLAGS):" $(IPROUTE2_DIR)/Makefile
-	( cd $(@D); ./configure )
-	echo "IPT_LIB_DIR=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
+	( cd $(@D); \
+	$(TARGET_CONFIGURE_OPTS) \
+	SYSROOT="$(STAGING_DIR)" \
+	./configure $(IPROUTE2_CONF_INCLUDE))
 endef
 
 define IPROUTE2_BUILD_CMDS
-	$(MAKE) CC="$(TARGET_CC)" -C $(@D)
+	$(MAKE) -C $(@D) \
+	$(TARGET_CONFIGURE_OPTS) \
+	SYSROOT="$(STAGING_DIR)" \
+	KERNEL_INCLUDE="$(IPROUTE2_CONF_INCLUDE)"
 endef
 
 define IPROUTE2_INSTALL_TARGET_CMDS
-- 
1.7.3.3
