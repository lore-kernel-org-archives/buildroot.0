From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 18 Nov 2010 21:50:25 +0100
Subject: [Buildroot] [git commit master 1/1] mtd-utils: ensure libmtd.a
	always gets built
Message-ID: <20101118205247.9B5008A404@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=adb0dfff6fb7da35b4ea79008da2aa1e7b8aadbe
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #2785

If only ubi* is selected, libmtd.a wouldn't get built breaking the build.

Based on patch by Patrick Ziegler <patrick.ziegler@fh-kl.de>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES            |    4 +++-
 package/mtd/mtd.mk |    4 +---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/CHANGES b/CHANGES
index e07c798..c73fdbf 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,11 +2,13 @@
 
 	Fixes all over the tree.
 
-	Updated/fixed packages: libglib2, module-init-tools, qt
+	Updated/fixed packages: libglib2, module-init-tools,
+	mtd-utils, qt
 
 	Issues resolved (http://bugs.uclibc.org):
 
 	#2479: host-module-init-tools 3.11 fails to build
+	#2785: mtd-utils build fails due to missing libmtd
 	#2809: failed to compile libglib2
 	#2821: [PATCH] Patch for JavaScriptCore in QtWebKit module
 	#2827: qt-4.7.0-pthread_getattr_np.patch invalid for qt 4.6...
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index ae2d433..ec8c663 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -68,14 +68,12 @@ MTD_MAKE_COMMON_FLAGS = \
 	$(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
 	WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1
 
-ifneq ($(MTD_TARGETS_y),)
 define MTD_TARGETS_BUILD
 	$(MAKE1) $(MTD_MAKE_COMMON_FLAGS) \
 		BUILDDIR=$(@D) \
 		-C $(@D) \
-		$(addprefix $(@D)/, $(MTD_TARGETS_y))
+		$(addprefix $(@D)/, lib/libmtd.a $(MTD_TARGETS_y))
 endef
-endif
 
 ifneq ($(MTD_TARGETS_UBI_y),)
 define MTD_TARGETS_UBI_BUILD
-- 
1.7.2.2
