From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 16 Oct 2008 14:32:25 -0600
Subject: [Buildroot] [PATCH 2/9] Fix link flags of mtdutils
In-Reply-To: <20081016203220.15826.26173.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
Message-ID: <20081016203225.15826.71097.stgit@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Grant Likely <grant.likely@secretlab.ca>

The mtd makefile fragment doesn't specify LDFLAGS.  This can cause the
linking to fail when trying to find libz if using an external toolchain
---

 package/mtd/mtd-utils/mtd.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)


diff --git a/package/mtd/mtd-utils/mtd.mk b/package/mtd/mtd-utils/mtd.mk
index 86acc93..fdf256e 100644
--- a/package/mtd/mtd-utils/mtd.mk
+++ b/package/mtd/mtd-utils/mtd.mk
@@ -97,6 +97,7 @@ MTD_BUILD_TARGETS := $(addprefix $(MTD_DIR)/, $(MTD_TARGETS_y))
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 	mkdir -p $(TARGET_DIR)/usr/sbin
 	$(MAKE) CFLAGS="-I. -I./include -I$(LINUX_HEADERS_DIR)/include -I$(STAGING_DIR)/usr/include $(TARGET_CFLAGS)" \
+		LDFLAGS="$(TARGET_LDFLAGS)" \
 		BUILDDIR=$(MTD_DIR) \
 		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) LINUXDIR=$(LINUX26_DIR) WITHOUT_XATTR=1 -C $(MTD_DIR)
 
