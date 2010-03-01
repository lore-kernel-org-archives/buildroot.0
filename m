From: Darcy L. Watkins <dwatkins@tranzeo.com>
Date: Mon, 01 Mar 2010 11:54:28 -0800
Subject: [Buildroot] Patch to allow iproute2 without IPv6 requirement
In-Reply-To: <1267220120.28886.99.camel@localhost.localdomain>
References: <D61182AC8012EA4EBC531B3AF23BE10992A96A@tranzeo-mail2.12stewart.tranzeo.com>
	<1267220120.28886.99.camel@localhost.localdomain>
Message-ID: <1267473268.25711.10.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I noticed that when I upgraded from 2009.02 to 2010.02 I lost iproute2
in my config that doesn't use IPv6.  The patch below applies to 2010.02
and should allow the iproute2 to build without IPv6.  It builds OK (and
doesn't appear to misbehave) on my powerpc 405 platform and I am also
building it to try out later today on an ARM11 platform.

Anyone else who wants to test drive it is welcome to do so.

------------

Signed-off-by: Darcy L. Watkins <dwatkins@tranzeo.com>


--- buildroot-2010.02_powerpc/package/iproute2/Config.in.theorig	2010-02-26 06:52:48.000000000 -0800
+++ buildroot-2010.02_powerpc/package/iproute2/Config.in	2010-03-01 11:01:09.000000000 -0800
@@ -1,11 +1,8 @@
 config BR2_PACKAGE_IPROUTE2
 	bool "iproute2"
-	depends on BR2_INET_IPV6
 	help
 	  Kernel routing and traffic control utilities.  Provides things
 	  like ip and tc.
 
 	  http://developer.osdl.org/dev/iproute2/
 
-comment "iproute2 requires a toolchain with IPv6 support"
-	depends on !BR2_INET_IPV6
--- buildroot-2010.02_powerpc/package/iproute2/iproute2.mk.theorig	2010-02-26 06:52:48.000000000 -0800
+++ buildroot-2010.02_powerpc/package/iproute2/iproute2.mk	2010-03-01 10:59:05.000000000 -0800
@@ -11,6 +11,10 @@ IPROUTE2_CAT:=$(BZCAT)
 IPROUTE2_BINARY:=tc/tc
 IPROUTE2_TARGET_BINARY:=sbin/tc
 
+ifeq ($(BR2_INET_IPV6),)
+IPV6_OPT= SUPPRESS_IPV6_SUPPORT=y
+endif
+
 $(DL_DIR)/$(IPROUTE2_SOURCE):
 	$(call DOWNLOAD,$(IPROUTE2_SITE),$(IPROUTE2_SOURCE))
 
@@ -18,6 +22,7 @@ iproute2-source: $(DL_DIR)/$(IPROUTE2_SO
 
 $(IPROUTE2_DIR)/.unpacked: $(DL_DIR)/$(IPROUTE2_SOURCE)
 	$(IPROUTE2_CAT) $(DL_DIR)/$(IPROUTE2_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
+	toolchain/patch-kernel.sh $(IPROUTE2_DIR) package/iproute2 iproute2-$(IPROUTE2_VERSION)\*.patch
 	touch $@
 
 $(IPROUTE2_DIR)/.configured: $(IPROUTE2_DIR)/.unpacked
@@ -31,6 +36,7 @@ $(IPROUTE2_DIR)/$(IPROUTE2_BINARY): $(IP
 	$(MAKE) \
 		-C $(IPROUTE2_DIR) \
 		KERNEL_INCLUDE=$(LINUX_SOURCE_DIR)/include \
+		$(IPV6_OPT) \
 		CC=$(TARGET_CC) \
 		AR=$(TARGET_CROSS)ar \
 		NETEM_DIST="" \
--- buildroot-2010.02_powerpc/package/iproute2/iproute2-2.6.28-no-ipv6-option.patch.theorig	1969-12-31 16:00:00.000000000 -0800
+++ buildroot-2010.02_powerpc/package/iproute2/iproute2-2.6.28-no-ipv6-option.patch	2010-03-01 11:02:44.000000000 -0800
@@ -0,0 +1,97 @@
+--- iproute2-2.6.28/ip/Makefile.theorig	2009-01-15 12:25:04.000000000 -0800
++++ iproute2-2.6.28/ip/Makefile	2010-03-01 10:43:53.000000000 -0800
+@@ -1,9 +1,15 @@
+ IPOBJ=ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o \
+-    rtm_map.o iptunnel.o ip6tunnel.o tunnel.o ipneigh.o ipntable.o iplink.o \
++    rtm_map.o iptunnel.o tunnel.o ipneigh.o ipntable.o iplink.o \
+     ipmaddr.o ipmonitor.o ipmroute.o ipprefix.o \
+     ipxfrm.o xfrm_state.o xfrm_policy.o xfrm_monitor.o \
+     iplink_vlan.o link_veth.o link_gre.o
+ 
++ifneq ($(SUPPRESS_IPV6_SUPPORT),)
++CFLAGS += -DSUPPRESS_IPV6_SUPPORT=1
++else
++IPOBJ += ip6tunnel.o 
++endif
++
+ RTMONOBJ=rtmon.o
+ 
+ ALLOBJ=$(IPOBJ) $(RTMONOBJ)
+--- iproute2-2.6.28/ip/iptunnel.c.theorig	2009-01-15 12:25:04.000000000 -0800
++++ iproute2-2.6.28/ip/iptunnel.c	2010-03-01 10:40:35.000000000 -0800
+@@ -84,6 +84,7 @@ static int parse_args(int argc, char **a
+ 					exit(-1);
+ 				}
+ 				p->iph.protocol = IPPROTO_GRE;
++#ifndef SUPPRESS_IPV6_SUPPORT
+ 			} else if (strcmp(*argv, "sit") == 0 ||
+ 				   strcmp(*argv, "ipv6/ip") == 0) {
+ 				if (p->iph.protocol && p->iph.protocol != IPPROTO_IPV6) {
+@@ -98,6 +99,7 @@ static int parse_args(int argc, char **a
+ 				}
+ 				p->iph.protocol = IPPROTO_IPV6;
+ 				isatap++;
++#endif
+ 			} else {
+ 				fprintf(stderr,"Cannot guess tunnel mode.\n");
+ 				exit(-1);
+@@ -219,12 +221,14 @@ static int parse_args(int argc, char **a
+ 			p->iph.protocol = IPPROTO_GRE;
+ 		else if (memcmp(p->name, "ipip", 4) == 0)
+ 			p->iph.protocol = IPPROTO_IPIP;
++#ifndef SUPPRESS_IPV6_SUPPORT
+ 		else if (memcmp(p->name, "sit", 3) == 0)
+ 			p->iph.protocol = IPPROTO_IPV6;
+ 		else if (memcmp(p->name, "isatap", 6) == 0) {
+ 			p->iph.protocol = IPPROTO_IPV6;
+ 			isatap++;
+ 		}
++#endif
+ 	}
+ 
+ 	if (p->iph.protocol == IPPROTO_IPIP || p->iph.protocol == IPPROTO_IPV6) {
+@@ -281,8 +285,10 @@ static int do_add(int cmd, int argc, cha
+ 		return tnl_add_ioctl(cmd, "tunl0", p.name, &p);
+ 	case IPPROTO_GRE:
+ 		return tnl_add_ioctl(cmd, "gre0", p.name, &p);
++#ifndef SUPPRESS_IPV6_SUPPORT
+ 	case IPPROTO_IPV6:
+ 		return tnl_add_ioctl(cmd, "sit0", p.name, &p);
++#endif
+ 	default:
+ 		fprintf(stderr, "cannot determine tunnel mode (ipip, gre or sit)\n");
+ 		return -1;
+@@ -302,8 +308,10 @@ static int do_del(int argc, char **argv)
+ 		return tnl_del_ioctl("tunl0", p.name, &p);
+ 	case IPPROTO_GRE:
+ 		return tnl_del_ioctl("gre0", p.name, &p);
++#ifndef SUPPRESS_IPV6_SUPPORT
+ 	case IPPROTO_IPV6:
+ 		return tnl_del_ioctl("sit0", p.name, &p);
++#endif
+ 	default:
+ 		return tnl_del_ioctl(p.name, p.name, &p);
+ 	}
+@@ -454,9 +462,11 @@ static int do_show(int argc, char **argv
+ 	case IPPROTO_GRE:
+ 		err = tnl_get_ioctl(p.name[0] ? p.name : "gre0", &p);
+ 		break;
++#ifndef SUPPRESS_IPV6_SUPPORT
+ 	case IPPROTO_IPV6:
+ 		err = tnl_get_ioctl(p.name[0] ? p.name : "sit0", &p);
+ 		break;
++#endif
+ 	default:
+ 		do_tunnels_list(&p);
+ 		return 0;
+@@ -482,8 +492,10 @@ int do_iptunnel(int argc, char **argv)
+ 	 * protocol-independent because of unarranged structure between
+ 	 * IPv4 and IPv6.
+ 	 */
++#ifndef SUPPRESS_IPV6_SUPPORT
+ 	case AF_INET6:
+ 		return do_ip6tunnel(argc, argv);
++#endif
+ 	default:
+ 		fprintf(stderr, "Unsupported family:%d\n", preferred_family);
+ 		exit(-1);


------------




Regards,

Darcy
