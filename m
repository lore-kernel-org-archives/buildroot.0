From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri,  2 Feb 2007 08:15:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070202161551.2FD754861D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-02 08:15:51 -0800 (Fri, 02 Feb 2007)
New Revision: 17728

Log:
- there is something wrong in the new buildsys: If one selects ip and has e..g rule or route unset, ip still wants to build those.
  This fails (correctly) since rtnl_rttable_n2a and rtnl_rtrealm_n2a aren't available if they were turned off. TODO: Talk to vda about this


Added:
   trunk/buildroot/package/busybox/busybox.network-odd-dependencies.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox.network-odd-dependencies.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox.network-odd-dependencies.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox.network-odd-dependencies.patch	2007-02-02 16:15:51 UTC (rev 17728)
@@ -0,0 +1,59 @@
+Index: busybox/networking/libiproute/Kbuild
+===================================================================
+--- busybox/networking/libiproute/Kbuild	(revision 17720)
++++ busybox/networking/libiproute/Kbuild	(working copy)
+@@ -8,11 +8,6 @@
+ lib-y:=
+ lib-$(CONFIG_IP) += \
+ 	ip_parse_common_args.o \
+-	ipaddress.o \
+-	iplink.o \
+-	iproute.o \
+-	iptunnel.o \
+-	iprule.o \
+ 	libnetlink.o \
+ 	ll_addr.o \
+ 	ll_map.o \
+@@ -22,7 +17,7 @@
+ 	rtm_map.o \
+ 	utils.o
+ 
+-lib-$(CONFIG_IPADDR) += \
++lib-$(CONFIG_FEATURE_IP_ADDRESS) += \
+ 	ip_parse_common_args.o \
+ 	ipaddress.o \
+ 	libnetlink.o \
+@@ -32,7 +27,7 @@
+ 	rt_names.o \
+ 	utils.o
+ 
+-lib-$(CONFIG_IPLINK) += \
++lib-$(CONFIG_FEATURE_IP_LINK) += \
+ 	ip_parse_common_args.o \
+ 	ipaddress.o \
+ 	iplink.o \
+@@ -43,7 +38,7 @@
+ 	rt_names.o \
+ 	utils.o
+ 
+-lib-$(CONFIG_IPROUTE) += \
++lib-$(CONFIG_FEATURE_IP_ROUTE) += \
+ 	ip_parse_common_args.o \
+ 	iproute.o \
+ 	libnetlink.o \
+@@ -52,13 +47,13 @@
+ 	rtm_map.o \
+ 	utils.o
+ 
+-lib-$(CONFIG_IPTUNNEL) += \
++lib-$(CONFIG_FEATURE_IP_TUNNEL) += \
+ 	ip_parse_common_args.o \
+ 	iptunnel.o \
+ 	rt_names.o \
+ 	utils.o
+ 
+-lib-$(CONFIG_IPRULE) += \
++lib-$(CONFIG_FEATURE_IP_RULE) += \
+ 	ip_parse_common_args.o \
+ 	iprule.o \
+ 	rt_names.o \
