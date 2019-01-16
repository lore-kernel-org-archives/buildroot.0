From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 16 Jan 2019 20:29:10 +0100
Subject: [Buildroot] [PATCH 1/1] odhcp6c: fix build with gcc 8
Message-ID: <20190116192910.8922-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Retrieve and backport upstream patch to fix build with gcc 8

Fixes:
 - http://autobuild.buildroot.org/results/1c6f0d1f2fcd3474af81b3851d875f834a3a0a4f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch   | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch

diff --git a/package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch b/package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch
new file mode 100644
index 0000000000..abf5191522
--- /dev/null
+++ b/package/odhcp6c/0001-dhcpv6-fix-strncpy-bounds.patch
@@ -0,0 +1,28 @@
+From 327f73dd7093d04c2dbea13ee30fc3dfafc5e944 Mon Sep 17 00:00:00 2001
+From: Hans Dedecker <dedeckeh@gmail.com>
+Date: Sat, 21 Apr 2018 13:40:29 +0200
+Subject: [PATCH] dhcpv6: fix strncpy bounds
+
+Fixes dhcpv6.c:138:2: error: 'strncpy' specified bound 16 equals destination size [-Werror=stringop-truncation]                                                                                                        strncpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name));
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Hans Dedecker <dedeckeh@gmail.com>
+[Retrieved (and backported) from:
+https://github.com/openwrt/odhcp6c/commit/327f73dd7093d04c2dbea13ee30fc3dfafc5e944]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/dhcpv6.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcpv6.c b/src/dhcpv6.c
+index 0b3585c..d70d533 100644
+--- a/src/dhcpv6.c
++++ b/src/dhcpv6.c
+@@ -135,7 +135,7 @@ int init_dhcpv6(const char *ifname, unsigned int options, int sol_timeout)
+ 	// Detect interface
+ 	struct ifreq ifr;
+-	strncpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name));
++	strncpy(ifr.ifr_name, ifname, sizeof(ifr.ifr_name) - 1);
+ 	if (ioctl(sock, SIOCGIFINDEX, &ifr) < 0)
+ 		return -1;
+ 
-- 
2.14.1
