From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 8 Mar 2010 22:44:28 +0100
Subject: [Buildroot] [git commit master] mtd-utils: fix build with external
	toolchain
Message-ID: <20100308214621.980A977708@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=d5bf5f967009733da99c55febacb3fb0be686cad
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported by H Hartley Sweeten.

Make sure we pass proper CFLAGS to mtd-utils, so builds needing --sysroot
works (E.G. external toolchains).

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    2 +-
 package/mtd/mtd.mk |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/CHANGES b/CHANGES
index 9111344..9746c60 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	 X.org updated to 7.5.
 
-	 Updated/fixed packages: dosfstools, e2fsprogs, squashfs
+	 Updated/fixed packages: dosfstools, e2fsprogs, mtd-utils, squashfs
 
 2010.02, Release February 26th, 2010:
 
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 244fd8e..3e0fcaf 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -111,14 +111,14 @@ MTD_BUILD_TARGETS := $(MTD_TARGETS) $(MTD_UBI_TARGETS)
 
 $(MTD_BUILD_TARGETS): $(MTD_DIR)/.unpacked
 ifneq ($(MTD_TARGETS),)
-	$(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(MAKE) $(TARGET_CONFIGURE_ENV) \
 		BUILDDIR=$(MTD_DIR) \
 		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
 		WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 \
 		-C $(MTD_DIR) $(MTD_TARGETS)
 endif
 ifneq ($(MTD_UBI_TARGETS),)
-	$(MAKE) LDFLAGS="$(TARGET_LDFLAGS)" \
+	$(MAKE) $(TARGET_CONFIGURE_ENV) \
 		BUILDDIR=$(MTD_DIR)/ubi-utils \
 		CROSS=$(TARGET_CROSS) CC=$(TARGET_CC) \
 		WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 \
-- 
1.6.3.3
