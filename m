From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 15:35:27 +0200
Subject: [Buildroot] [git commit] mtd: fixup after CPPFLAGS addition
Message-ID: <20121011134021.663E999839@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e280b75341cd616970ce5559a7725201f6c0c53
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/c55e4c9741109c66f8f66ab7e3f4f1664826056a

mtd appends to CFLAGS/CPPFLAGS, but doesn't use override - So we need
to pass flags in the environment and not on the make command line to
get the combination of our flags and mtd's.

At the same time cleanup the host build to use a similar form
(HOST_CONFIGURE_OPTS) as target build.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 7e3a9b8..aef478f 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -20,9 +20,8 @@ endif
 HOST_MTD_DEPENDENCIES = host-zlib host-lzo host-e2fsprogs
 
 define HOST_MTD_BUILD_CMDS
-	CC="$(HOSTCC)" CFLAGS="$(HOST_CFLAGS)" LDFLAGS="$(HOST_LDFLAGS)" \
-		CROSS= $(MAKE1) BUILDDIR=$(@D) \
-		WITHOUT_XATTR=1 -C $(@D)
+	$(HOST_CONFIGURE_OPTS) $(MAKE1) \
+		CROSS= BUILDDIR=$(@D) WITHOUT_XATTR=1 -C $(@D)
 endef
 
 define HOST_MTD_INSTALL_CMDS
@@ -75,7 +74,7 @@ MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
 ifneq ($(MTD_TARGETS_y),)
 
 define MTD_BUILD_CMDS
-	$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
+	$(TARGET_CONFIGURE_OPTS) $(MAKE1) CROSS=$(TARGET_CROSS) \
 		BUILDDIR=$(@D) WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C $(@D) \
 		$(addprefix $(@D)/,$(MTD_TARGETS_y))
 endef
