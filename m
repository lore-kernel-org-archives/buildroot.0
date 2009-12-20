From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Dec 2009 22:27:35 +0100
Subject: [Buildroot] [git commit master] mtd-utils: move phony dependencies
	to toplevel mtd-host target
Message-ID: <20091220213801.53A32777E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=14aa5ee54f33d05a0bd01f21635e095ba07f83ec
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Real targets shouldn't have phony dependencies, as make otherwise
always consider them out of date.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd-utils/mtd.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index ddae44e..6647373 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -34,7 +34,7 @@ $(MTD_HOST_DIR)/.unpacked: $(DL_DIR)/$(MTD_SOURCE)
 	touch $@
 
 
-$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked host-lzo
+$(MKFS_JFFS2): $(MTD_HOST_DIR)/.unpacked
 	CC="$(HOSTCC)" CROSS= LDFLAGS=-L$(HOST_DIR)/usr/lib \
 		$(MAKE) CFLAGS='-I$(HOST_DIR)/usr/include -I./include' \
 		LINUXDIR=$(LINUX_DIR) BUILDDIR=$(MTD_HOST_DIR) \
@@ -46,7 +46,7 @@ $(SUMTOOL): $(MTD_HOST_DIR)/.unpacked
 		LINUXDIR=$(LINUX_DIR) BUILDDIR=$(MTD_HOST_DIR) \
 		-C $(MTD_HOST_DIR) sumtool
 
-mtd-host: $(MKFS_JFFS2) $(SUMTOOL)
+mtd-host: host-lzo $(MKFS_JFFS2) $(SUMTOOL)
 
 mtd-host-source: $(DL_DIR)/$(MTD_SOURCE)
 
-- 
1.6.3.3
