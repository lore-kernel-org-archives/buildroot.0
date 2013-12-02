From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  1 Dec 2013 21:28:33 -0300
Subject: [Buildroot] [PATCH] iproute2: bump to version 3.12.0
Message-ID: <1385944113-16766-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Add arpd support via the new berkeleydb compat option.
* Remove uninstall define.
* Install ifcfg if bash on the target is enabled.
* Misc cleanups.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...-ipv6.patch => iproute2-01-optional-ipv6.patch} |  0
 .../iproute2/iproute2-02-vxlan-optional-ipv6.patch | 84 ++++++++++++++++++++++
 package/iproute2/iproute2.mk                       | 39 +++++-----
 3 files changed, 107 insertions(+), 16 deletions(-)
 rename package/iproute2/{iproute2-optional-ipv6.patch => iproute2-01-optional-ipv6.patch} (100%)
 create mode 100644 package/iproute2/iproute2-02-vxlan-optional-ipv6.patch

diff --git a/package/iproute2/iproute2-optional-ipv6.patch b/package/iproute2/iproute2-01-optional-ipv6.patch
similarity index 100%
rename from package/iproute2/iproute2-optional-ipv6.patch
rename to package/iproute2/iproute2-01-optional-ipv6.patch
diff --git a/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch b/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch
new file mode 100644
index 0000000..0d6cf95
--- /dev/null
+++ b/package/iproute2/iproute2-02-vxlan-optional-ipv6.patch
@@ -0,0 +1,84 @@
+Disable IPv6 support code in vxlan when building with uClibc configured without
+IPv6 support.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura iproute2-3.12.0.orig/ip/iplink_vxlan.c iproute2-3.12.0/ip/iplink_vxlan.c
+--- iproute2-3.12.0.orig/ip/iplink_vxlan.c	2013-11-26 14:09:13.804908955 -0300
++++ iproute2-3.12.0/ip/iplink_vxlan.c	2013-11-26 14:21:55.561997689 -0300
+@@ -9,6 +9,11 @@
+  * Authors:     Stephen Hemminger <shemminger@vyatta.com
+  */
+ 
++#include <features.h>
++#if defined(__UCLIBC__) && !defined (__UCLIBC_HAS_IPV6__)
++#define NO_IPV6
++#endif
++
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -179,26 +184,32 @@
+ 		fprintf(stderr, "vxlan: missing virtual network identifier\n");
+ 		return -1;
+ 	}
++#ifndef NO_IPV6
+ 	if ((gaddr && daddr) ||
+ 		(memcmp(&gaddr6, &in6addr_any, sizeof(gaddr6)) &&
+ 		 memcmp(&daddr6, &in6addr_any, sizeof(daddr6)))) {
+ 		fprintf(stderr, "vxlan: both group and remote cannot be specified\n");
+ 		return -1;
+ 	}
++#endif
+ 	addattr32(n, 1024, IFLA_VXLAN_ID, vni);
+ 	if (gaddr)
+ 		addattr_l(n, 1024, IFLA_VXLAN_GROUP, &gaddr, 4);
+ 	else if (daddr)
+ 		addattr_l(n, 1024, IFLA_VXLAN_GROUP, &daddr, 4);
++#ifndef NO_IPV6
+ 	if (memcmp(&gaddr6, &in6addr_any, sizeof(gaddr6)) != 0)
+ 		addattr_l(n, 1024, IFLA_VXLAN_GROUP6, &gaddr6, sizeof(struct in6_addr));
+ 	else if (memcmp(&daddr6, &in6addr_any, sizeof(daddr6)) != 0)
+ 		addattr_l(n, 1024, IFLA_VXLAN_GROUP6, &daddr6, sizeof(struct in6_addr));
++#endif
+ 
+ 	if (saddr)
+ 		addattr_l(n, 1024, IFLA_VXLAN_LOCAL, &saddr, 4);
++#ifndef NO_IPV6
+ 	else if (memcmp(&saddr6, &in6addr_any, sizeof(saddr6)) != 0)
+ 		addattr_l(n, 1024, IFLA_VXLAN_LOCAL6, &saddr6, sizeof(struct in6_addr));
++#endif
+ 
+ 	if (link)
+ 		addattr32(n, 1024, IFLA_VXLAN_LINK, link);
+@@ -251,6 +262,7 @@
+ 				fprintf(f, "remote %s ",
+ 					format_host(AF_INET, 4, &addr, s1, sizeof(s1)));
+ 		}
++#ifndef NO_IPV6
+ 	} else if (tb[IFLA_VXLAN_GROUP6]) {
+ 		struct in6_addr addr;
+ 		memcpy(&addr, RTA_DATA(tb[IFLA_VXLAN_GROUP6]), sizeof(struct in6_addr));
+@@ -262,6 +274,7 @@
+ 				fprintf(f, "remote %s ",
+ 					format_host(AF_INET6, sizeof(struct in6_addr), &addr, s1, sizeof(s1)));
+ 		}
++#endif
+ 	}
+ 
+ 	if (tb[IFLA_VXLAN_LOCAL]) {
+@@ -269,12 +282,14 @@
+ 		if (addr)
+ 			fprintf(f, "local %s ",
+ 				format_host(AF_INET, 4, &addr, s1, sizeof(s1)));
++#ifndef NO_IPV6
+ 	} else if (tb[IFLA_VXLAN_LOCAL6]) {
+ 		struct in6_addr addr;
+ 		memcpy(&addr, RTA_DATA(tb[IFLA_VXLAN_LOCAL6]), sizeof(struct in6_addr));
+ 		if (memcmp(&addr, &in6addr_any, sizeof(addr)) != 0)
+ 			fprintf(f, "local %s ",
+ 				format_host(AF_INET6, sizeof(struct in6_addr), &addr, s1, sizeof(s1)));
++#endif
+ 	}
+ 
+ 	if (tb[IFLA_VXLAN_LINK] &&
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index a63a096..2350500 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 3.11.0
+IPROUTE2_VERSION = 3.12.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
-IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
+IPROUTE2_DEPENDENCIES = host-bison host-flex
 IPROUTE2_LICENSE = GPLv2
 IPROUTE2_LICENSE_FILES = COPYING
-IPROUTE2_DEPENDENCIES += host-bison host-flex
 
 # If both iproute2 and busybox are selected, make certain we win
 # the fight over who gets to have their utils actually installed.
@@ -33,19 +32,36 @@ define IPROUTE2_WITH_IPTABLES
 endef
 endif
 
+# arpd needs BerkeleyDB
+ifeq ($(BR2_PACKAGE_BERKELEYDB_COMPAT185),y)
+IPROUTE2_DEPENDENCIES += berkeleydb
+else
+define IPROUTE2_DISABLE_ARPD
+	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
+endef
+endif
+
+# ifcfg needs bash
+ifeq ($(BR2_PACKAGE_BASH),)
+define IPROUTE2_REMOVE_IFCFG
+	rm -f $(TARGET_DIR)/sbin/ifcfg
+endef
+endif
+
 define IPROUTE2_CONFIGURE_CMDS
 	$(SED) 's/gcc/$$CC $$CFLAGS/g' $(@D)/configure
 	cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure
-	# arpd needs berkeleydb
-	$(SED) "/^TARGETS=/s: arpd : :" $(IPROUTE2_DIR)/misc/Makefile
 	$(SED) 's/-Werror//' $(IPROUTE2_DIR)/Makefile
 	echo "IPT_LIB_DIR:=/usr/lib/xtables" >>$(IPROUTE2_DIR)/Config
+	$(IPROUTE2_DISABLE_ARPD)
 	$(IPROUTE2_WITH_IPTABLES)
 endef
 
 define IPROUTE2_BUILD_CMDS
 	$(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
-	$(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) \
+		DBM_INCLUDE="$(STAGING_DIR)/usr/include" \
+		CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C $(@D)
 endef
 
 define IPROUTE2_INSTALL_TARGET_CMDS
@@ -53,16 +69,7 @@ define IPROUTE2_INSTALL_TARGET_CMDS
 		SBINDIR=/sbin \
 		DOCDIR=/usr/share/doc/iproute2-$(IPROUTE2_VERSION) \
 		MANDIR=/usr/share/man install
-	# Wants bash
-	rm -f $(TARGET_DIR)/sbin/ifcfg
-endef
-
-define IPROUTE2_UNINSTALL_TARGET_CMDS
-	rm -rf $(TARGET_DIR)/lib/tc
-	rm -rf $(TARGET_DIR)/usr/lib/tc
-	rm -rf $(TARGET_DIR)/etc/iproute2
-	rm -rf $(TARGET_DIR)/var/lib/arpd
-	rm -f $(addprefix $(TARGET_DIR)/sbin/, $(IPROUTE2_TARGET_SBINS))
+	$(IPROUTE2_REMOVE_IFCFG)
 endef
 
 $(eval $(generic-package))
-- 
1.8.3.2
