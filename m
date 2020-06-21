From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 21 Jun 2020 21:03:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/dropwatch: bump to version 1.5.3
Message-ID: <20200621190305.1546524-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Fix-build-on-32-bit-systems.patch    | 87 -------------------
 package/dropwatch/dropwatch.hash              |  4 +-
 package/dropwatch/dropwatch.mk                |  2 +-
 3 files changed, 3 insertions(+), 90 deletions(-)
 delete mode 100644 package/dropwatch/0001-Fix-build-on-32-bit-systems.patch

diff --git a/package/dropwatch/0001-Fix-build-on-32-bit-systems.patch b/package/dropwatch/0001-Fix-build-on-32-bit-systems.patch
deleted file mode 100644
index 355a01c99f..0000000000
--- a/package/dropwatch/0001-Fix-build-on-32-bit-systems.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 3004f23d38400cd4a8619bcacd55a625d3bd7e1f Mon Sep 17 00:00:00 2001
-From: Alexander Dahl <post@lespocky.de>
-Date: Fri, 13 Mar 2020 13:20:27 +0100
-Subject: [PATCH] Fix build on 32-bit systems
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Because -Werror is set, some printf statements caused build errors on
-32-bit systems when printing uint64_t. This can be handled in a portable
-way by using the macros from inttypes.h ?
-
-Fixes: #12
-Signed-off-by: Alexander Dahl <post@lespocky.de>
----
-PR upstream: https://github.com/nhorman/dropwatch/pull/24
----
- src/dwdump.c | 3 ++-
- src/main.c   | 9 +++++----
- 2 files changed, 7 insertions(+), 5 deletions(-)
-
-diff --git a/src/dwdump.c b/src/dwdump.c
-index 0c3ba6f..0ea9fd0 100644
---- a/src/dwdump.c
-+++ b/src/dwdump.c
-@@ -3,6 +3,7 @@
-  */
- 
- #include <errno.h>
-+#include <inttypes.h>
- #include <getopt.h>
- #include <pcap.h>
- #include <signal.h>
-@@ -246,7 +247,7 @@ static void dwdump_nested_stats_print(struct nlattr *attr)
- 		return;
- 
- 	if (attrs[NET_DM_ATTR_STATS_DROPPED])
--		printf("Tail dropped: %lu\n",
-+		printf("Tail dropped: %" PRIu64 "\n",
- 		       nla_get_u64(attrs[NET_DM_ATTR_STATS_DROPPED]));
- }
- 
-diff --git a/src/main.c b/src/main.c
-index 1a1515c..bd87085 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -10,6 +10,7 @@
- #include <stdlib.h>
- #include <stdio.h>
- #include <errno.h>
-+#include <inttypes.h>
- #include <signal.h>
- #include <stdint.h>
- #include <stdbool.h>
-@@ -486,9 +487,9 @@ void handle_dm_packet_alert_msg(struct netlink_message *msg, int err)
- 		goto out_free;
- 
- 	if (attrs[NET_DM_ATTR_PC] && attrs[NET_DM_ATTR_SYMBOL])
--		printf("drop at: %s (%p)\n",
-+		printf("drop at: %s (0x%" PRIx64 ")\n",
- 		       nla_get_string(attrs[NET_DM_ATTR_SYMBOL]),
--		       (void *) nla_get_u64(attrs[NET_DM_ATTR_PC]));
-+		       nla_get_u64(attrs[NET_DM_ATTR_PC]));
- 	else if (attrs[NET_DM_ATTR_HW_TRAP_GROUP_NAME] &&
- 		 attrs[NET_DM_ATTR_HW_TRAP_NAME])
- 		printf("drop at: %s (%s)\n",
-@@ -524,7 +525,7 @@ void handle_dm_packet_alert_msg(struct netlink_message *msg, int err)
- 
- 		tstr = asctime(tm);
- 		tstr[strlen(tstr) - 1] = 0;
--		printf("timestamp: %s %09ld nsec\n", tstr, ts % 1000000000);
-+		printf("timestamp: %s %09" PRId64 " nsec\n", tstr, ts % 1000000000);
- 	}
- 
- 	if (attrs[NET_DM_ATTR_PROTO])
-@@ -599,7 +600,7 @@ void print_nested_stats(struct nlattr *attr)
- 		return;
- 
- 	if (attrs[NET_DM_ATTR_STATS_DROPPED])
--		printf("Tail dropped: %lu\n",
-+		printf("Tail dropped: %" PRIu64 "\n",
- 		       nla_get_u64(attrs[NET_DM_ATTR_STATS_DROPPED]));
- }
- 
--- 
-2.20.1
-
diff --git a/package/dropwatch/dropwatch.hash b/package/dropwatch/dropwatch.hash
index e4b687ae75..867a7f12fb 100644
--- a/package/dropwatch/dropwatch.hash
+++ b/package/dropwatch/dropwatch.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 a2049a68d2cc2f81df977c7a732f50de3ec71283bc7bd94389ba33574af9aaa6  dropwatch-1.5.2.tar.gz
-sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
+sha256  b748b66a816c1f94531446c0451da5461a4a31b0949244bb867d741c6ac0148b  dropwatch-1.5.3.tar.gz
+sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/dropwatch/dropwatch.mk b/package/dropwatch/dropwatch.mk
index 4cebe041db..36608ad8b3 100644
--- a/package/dropwatch/dropwatch.mk
+++ b/package/dropwatch/dropwatch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPWATCH_VERSION = 1.5.2
+DROPWATCH_VERSION = 1.5.3
 DROPWATCH_SITE = $(call github,nhorman,dropwatch,v$(DROPWATCH_VERSION))
 DROPWATCH_DEPENDENCIES = libnl readline libpcap host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 DROPWATCH_LICENSE = GPL-2.0+
-- 
2.26.2
