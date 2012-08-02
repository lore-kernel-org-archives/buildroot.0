From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:49 -0000
Subject: [Buildroot] [git commit branch/next] mii-diag: link statically if
	configured to do so
Message-ID: <20120802195246.3FED88C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a0f965dda8365c538c2a868a48675265522c70c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/mii-diag/mii-diag.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/mii-diag/mii-diag.mk b/package/mii-diag/mii-diag.mk
index 0731bf7..f74fa3d 100644
--- a/package/mii-diag/mii-diag.mk
+++ b/package/mii-diag/mii-diag.mk
@@ -8,6 +8,12 @@ MII_DIAG_SOURCE  = mii-diag_$(MII_DIAG_VERSION).orig.tar.gz
 MII_DIAG_PATCH   = mii-diag_$(MII_DIAG_VERSION)-3.diff.gz
 MII_DIAG_SITE    = $(BR2_DEBIAN_MIRROR)/debian/pool/main/m/mii-diag
 
+MII_DIAG_MAKE_OPT = $(TARGET_CONFIGURE_OPTS)
+
+ifeq ($(BR2_PREFER_STATIC_LIB),y)
+MII_DIAG_MAKE_OPT += CFLAGS="$(TARGET_CFLAGS) -static"
+endif
+
 define MII_DIAG_DEBIAN_PATCHES
 	if [ -d $(@D)/debian/patches ]; then \
 		support/scripts/apply-patches.sh $(@D) $(@D)/debian/patches \*.patch; \
@@ -17,7 +23,7 @@ endef
 MII_DIAG_POST_PATCH_HOOKS = MII_DIAG_DEBIAN_PATCHES
 
 define MII_DIAG_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(MAKE) $(MII_DIAG_MAKE_OPT) -C $(@D)
 endef
 
 define MII_DIAG_INSTALL_TARGET_CMDS
