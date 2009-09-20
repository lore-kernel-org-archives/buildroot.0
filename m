From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Sun, 20 Sep 2009 13:54:02 +0200
Subject: [Buildroot] [PATCH] iptables: fix disable-ipv6 option
In-Reply-To: <>
References: <>
Message-ID: <1253447642-25865-1-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- bumb version to v1.4.5
- add fix for --disable-ipv6 option
  (upstream bug: http://bugzilla.netfilter.org/show_bug.cgi?id=608)

Signed-off-by: Olaf Rempel <razzor@kopf-tisch.de>
---
 package/iptables/iptables-1.4.5-disable-ipv6.patch |   19 +++++++++++++++++++
 package/iptables/iptables.mk                       |    2 +-
 2 files changed, 20 insertions(+), 1 deletions(-)
 create mode 100644 package/iptables/iptables-1.4.5-disable-ipv6.patch

diff --git a/package/iptables/iptables-1.4.5-disable-ipv6.patch b/package/iptables/iptables-1.4.5-disable-ipv6.patch
new file mode 100644
index 0000000..9f22a0c
--- /dev/null
+++ b/package/iptables/iptables-1.4.5-disable-ipv6.patch
@@ -0,0 +1,19 @@
+--- iptables-1.4.5/xtables.c.org	2009-09-14 18:36:55.000000000 +0200
++++ iptables-1.4.5/xtables.c	2009-09-20 13:24:11.000000000 +0200
+@@ -1484,6 +1484,7 @@
+ xtables_ip6parse_multiple(const char *name, struct in6_addr **addrpp,
+ 		      struct in6_addr **maskpp, unsigned int *naddrs)
+ {
++	static const struct in6_addr zero_addr;
+ 	struct in6_addr *addrp;
+ 	char buf[256], *p;
+ 	unsigned int len, i, j, n, count = 1;
+@@ -1526,7 +1527,7 @@
+ 		memcpy(*maskpp + i, addrp, sizeof(*addrp));
+ 
+ 		/* if a null mask is given, the name is ignored, like in "any/0" */
+-		if (memcmp(*maskpp + i, &in6addr_any, sizeof(in6addr_any)) == 0)
++		if (memcmp(*maskpp + i, &zero_addr, sizeof(zero_addr)) == 0)
+ 			strcpy(buf, "::");
+ 
+ 		addrp = ip6parse_hostnetwork(buf, &n);
diff --git a/package/iptables/iptables.mk b/package/iptables/iptables.mk
index 48e5d33..1c3d9be 100644
--- a/package/iptables/iptables.mk
+++ b/package/iptables/iptables.mk
@@ -3,7 +3,7 @@
 # iptables
 #
 #############################################################
-IPTABLES_VERSION = 1.4.4
+IPTABLES_VERSION = 1.4.5
 IPTABLES_SOURCE = iptables-$(IPTABLES_VERSION).tar.bz2
 IPTABLES_SITE = http://ftp.netfilter.org/pub/iptables
 
-- 
1.5.4.3
