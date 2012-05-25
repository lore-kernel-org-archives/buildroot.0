From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 25 May 2012 21:02:55 +0200
Subject: [Buildroot] [git commit] mtd: fix build when no sub options are
	enabled
Message-ID: <20120525191024.AE29796CBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=573a740998f6345317dca1d62f3efcda4d067499
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mtd-utils with no sub options enabled should be a noop, but we end up
calling make with the default target (E.G. to build everything), breaking
the build if zlib/lzo aren't available.

Fixes http://autobuild.buildroot.net/results/a0781db394792e6d3831c1884fc4bb3525fedb2e/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mtd/mtd.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 8ccd4dd..b4d981d 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -68,12 +68,17 @@ MTD_TARGETS_UBI_$(BR2_PACKAGE_MTD_UBIUPDATEVOL)	+= ubiupdatevol
 
 MTD_TARGETS_y += $(addprefix ubi-utils/,$(MTD_TARGETS_UBI_y))
 
+# only call make if atleast a single tool is enabled
+ifneq ($(MTD_TARGETS_y),)
+
 define MTD_BUILD_CMDS
 	$(MAKE1) $(TARGET_CONFIGURE_OPTS) CROSS=$(TARGET_CROSS) \
 		BUILDDIR=$(@D) WITHOUT_XATTR=1 WITHOUT_LARGEFILE=1 -C $(@D) \
 		$(addprefix $(@D)/,$(MTD_TARGETS_y))
 endef
 
+endif
+
 define MTD_INSTALL_TARGET_CMDS
  for f in $(MTD_TARGETS_y) ; do \
   install -D -m 0755 $(@D)/$$f $(TARGET_DIR)/usr/sbin/$${f##*/} ; \
