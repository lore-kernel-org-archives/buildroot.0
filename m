From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Apr 2020 22:28:44 +0200
Subject: [Buildroot] [git commit] package/dhcp: bump to version 4.4.2
Message-ID: <20200427201527.D63819096A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=20c87ac251457f6229e3bb8855f2ebb736891d3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed 0001-*.patch as it is included with the maintenance release.
The LICENSE file hash changed due to Copyright year updating to
include 2020.

Signed-off-by: Ryan Barnett <ryanbarnett3@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ompatibility-headers-updated-util-bind-sh.patch | 87 ----------------------
 package/dhcp/dhcp.hash                             |  6 +-
 package/dhcp/dhcp.mk                               |  2 +-
 3 files changed, 4 insertions(+), 91 deletions(-)

diff --git a/package/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-headers-updated-util-bind-sh.patch b/package/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-headers-updated-util-bind-sh.patch
deleted file mode 100644
index b8b187f17b..0000000000
--- a/package/dhcp/0001-master-Added-includes-of-new-BIND9-compatibility-headers-updated-util-bind-sh.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From 8194daabfd590f17825f0c61e9534bee5c99cc86 Mon Sep 17 00:00:00 2001
-From: Thomas Markwalder <tmark@isc.org>
-Date: Fri, 14 Sep 2018 13:41:41 -0400
-Subject: [PATCH] [master] Added includes of new BIND9 compatibility headers,
- updated util/bind.sh
-
-    Merges in rt48072.
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved (and updated to remvove bind.sh update) from:
-https://gitlab.isc.org/isc-projects/dhcp/commit/8194daabfd590f17825f0c61e9534bee5c99cc86]
----
- includes/omapip/isclib.h |  3 +++
- includes/omapip/result.h |  1 +
- server/dhcpv6.c          | 13 +++++++++----
- 3 files changed, 39 insertions(+), 12 deletions(-)
-
-diff --git a/includes/omapip/isclib.h b/includes/omapip/isclib.h
-index 75a87ff6..538b927f 100644
---- a/includes/omapip/isclib.h
-+++ b/includes/omapip/isclib.h
-@@ -48,6 +48,9 @@
- #include <string.h>
- #include <netdb.h>
- 
-+#include <isc/boolean.h>
-+#include <isc/int.h>
-+
- #include <isc/buffer.h>
- #include <isc/lex.h>
- #include <isc/lib.h>
-diff --git a/includes/omapip/result.h b/includes/omapip/result.h
-index 91243e1b..860298f6 100644
---- a/includes/omapip/result.h
-+++ b/includes/omapip/result.h
-@@ -26,6 +26,7 @@
- #ifndef DHCP_RESULT_H
- #define DHCP_RESULT_H 1
- 
-+#include <isc/boolean.h>
- #include <isc/lang.h>
- #include <isc/resultclass.h>
- #include <isc/types.h>
-diff --git a/server/dhcpv6.c b/server/dhcpv6.c
-index a7110f98..cde4f617 100644
---- a/server/dhcpv6.c
-+++ b/server/dhcpv6.c
-@@ -1034,7 +1034,8 @@ void check_pool6_threshold(struct reply_state *reply,
- 				  shared_name,
- 				  inet_ntop(AF_INET6, &lease->addr,
- 					    tmp_addr, sizeof(tmp_addr)),
--				  used, count);
-+				  (long long unsigned)(used),
-+				  (long long unsigned)(count));
- 		}
- 		return;
- 	}
-@@ -1066,7 +1067,8 @@ void check_pool6_threshold(struct reply_state *reply,
- 		  "address: %s; high threshold %d%% %llu/%llu.",
- 		  shared_name,
- 		  inet_ntop(AF_INET6, &lease->addr, tmp_addr, sizeof(tmp_addr)),
--		  poolhigh, used, count);
-+		  poolhigh, (long long unsigned)(used),
-+		  (long long unsigned)(count));
- 
- 	/* handle the low threshold now, if we don't
- 	 * have one we default to 0. */
-@@ -1436,12 +1438,15 @@ pick_v6_address(struct reply_state *reply)
- 		log_debug("Unable to pick client address: "
- 			  "no addresses available  - shared network %s: "
- 			  " 2^64-1 < total, %llu active,  %llu abandoned",
--			  shared_name, active - abandoned, abandoned);
-+			  shared_name, (long long unsigned)(active - abandoned),
-+			  (long long unsigned)(abandoned));
- 	} else {
- 		log_debug("Unable to pick client address: "
- 			  "no addresses available  - shared network %s: "
- 			  "%llu total, %llu active,  %llu abandoned",
--			  shared_name, total, active - abandoned, abandoned);
-+			  shared_name, (long long unsigned)(total),
-+			  (long long unsigned)(active - abandoned),
-+		          (long long unsigned)(abandoned));
- 	}
- 
- 	return ISC_R_NORESOURCES;
--- 
-2.18.1
-
diff --git a/package/dhcp/dhcp.hash b/package/dhcp/dhcp.hash
index df07a32557..92ecdfec58 100644
--- a/package/dhcp/dhcp.hash
+++ b/package/dhcp/dhcp.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/dhcp/4.4.1/dhcp-4.4.1.tar.gz.sha256.asc
-sha256 2a22508922ab367b4af4664a0472dc220cc9603482cf3c16d9aff14f3a76b608  dhcp-4.4.1.tar.gz
+# Verified from https://ftp.isc.org/isc/dhcp/4.4.2/dhcp-4.4.2.tar.gz.sha256.asc
+sha256  1a7ccd64a16e5e68f7b5e0f527fd07240a2892ea53fe245620f4f5f607004521  dhcp-4.4.2.tar.gz
 # Locally calculated
-sha256 18add1790d1ed47d6ef6f3ed5945aa0cb2f7785fa8bc7fd859f8ae2f9f78567d  LICENSE
+sha256  89e7b0661134cc118bdcdeb87ff0493d544bc5723c9ca6616fa05f03539738af  LICENSE
diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 335c631119..ad59804d3b 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DHCP_VERSION = 4.4.1
+DHCP_VERSION = 4.4.2
 DHCP_SITE = http://ftp.isc.org/isc/dhcp/$(DHCP_VERSION)
 DHCP_INSTALL_STAGING = YES
 DHCP_LICENSE = MPL-2.0
