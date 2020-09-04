From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 10:28:52 +0200
Subject: [Buildroot] [git commit] package/ethtool: bump version to 5.8
Message-ID: <20200904082052.820C180E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e990368b7d2f523d7e25d470091adf7452b91d6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://lwn.net/Articles/828044/

- remove patch that is in new version

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../ethtool/0001-netlink-fix-build-warnings.patch  | 52 ----------------------
 package/ethtool/ethtool.hash                       |  2 +-
 package/ethtool/ethtool.mk                         |  2 +-
 3 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/package/ethtool/0001-netlink-fix-build-warnings.patch b/package/ethtool/0001-netlink-fix-build-warnings.patch
deleted file mode 100644
index 4e9b520d58..0000000000
--- a/package/ethtool/0001-netlink-fix-build-warnings.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 93b2d0ef0c2be825e56d1f810fbbfba4800fa831 Mon Sep 17 00:00:00 2001
-From: Michal Kubecek <mkubecek@suse.cz>
-Date: Fri, 29 May 2020 01:21:12 +0200
-Subject: [PATCH] netlink: fix build warnings
-
-Depending on compiler version and options, some of these warnings may
-result in build failure.
-
-- gcc 4.8 wants __KERNEL_DIV_ROUND_UP defined before including ethtool.h
-- avoid pointer arithmetic on void *
-
-Signed-off-by: Michal Kubecek <mkubecek@suse.cz>
-
-[Patch was taken from the linux netdev mailinglist and will be applied in the
-upcoming ethtool release 5.8]
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
----
- netlink/desc-ethtool.c | 2 +-
- netlink/parser.c       | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/netlink/desc-ethtool.c b/netlink/desc-ethtool.c
-index 76c6f13..423479d 100644
---- a/netlink/desc-ethtool.c
-+++ b/netlink/desc-ethtool.c
-@@ -4,9 +4,9 @@
-  * Descriptions of ethtool netlink messages and attributes for pretty print.
-  */
- 
-+#include "../internal.h"
- #include <linux/ethtool_netlink.h>
- 
--#include "../internal.h"
- #include "prettymsg.h"
- 
- static const struct pretty_nla_desc __header_desc[] = {
-diff --git a/netlink/parser.c b/netlink/parser.c
-index fff23f2..d790abe 100644
---- a/netlink/parser.c
-+++ b/netlink/parser.c
-@@ -1016,7 +1016,7 @@ int nl_parser(struct nl_context *nlctx, const struct param_parser *params,
- 			buff = tmp_buff_find(buffs, parser->group);
- 		msgbuff = buff ? &buff->msgbuff : &nlsk->msgbuff;
- 
--		param_dest = dest ? (dest + parser->dest_offset) : NULL;
-+		param_dest = dest ? ((char *)dest + parser->dest_offset) : NULL;
- 		ret = parser->handler(nlctx, parser->type, parser->handler_data,
- 				      msgbuff, param_dest);
- 		if (ret < 0)
--- 
-2.20.1
-
diff --git a/package/ethtool/ethtool.hash b/package/ethtool/ethtool.hash
index e3a958ab39..3c17fca51e 100644
--- a/package/ethtool/ethtool.hash
+++ b/package/ethtool/ethtool.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/software/network/ethtool/sha256sums.asc
-sha256  724eb8bd3c3a389fe285735959a1902fbd9310624656ad3220c5f23df1053c39  ethtool-5.7.tar.xz
+sha256  2f3b54d08d048f5977b80cb6cb4744994370def7553ee634d39dbbb6ccf87546  ethtool-5.8.tar.xz
 # Locally calculated
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256	5d632934396f90c82dfebe3c9512648bbb6333b406113d0cd331b0e0aa2d34a1  LICENSE
diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
index 40abe57918..1668171f3a 100644
--- a/package/ethtool/ethtool.mk
+++ b/package/ethtool/ethtool.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ETHTOOL_VERSION = 5.7
+ETHTOOL_VERSION = 5.8
 ETHTOOL_SOURCE = ethtool-$(ETHTOOL_VERSION).tar.xz
 ETHTOOL_SITE = $(BR2_KERNEL_MIRROR)/software/network/ethtool
 ETHTOOL_LICENSE = GPL-2.0
