From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Oct 2012 13:46:09 +0200
Subject: [Buildroot] [PATCH] unionfs: convert to cmake-package
Message-ID: <1350128769-13518-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes e.g. http://autobuild.buildroot.net/results/c279007dd8b89a1c6fc9b58d3c2cda01ab84279e

The addition of CPPFLAGS overrides the defines added in unionfs's
Makefile.  Since unionfs now has CMake support, use that instead.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
With CMake, buildroot's CPPFLAGS are just not used.  This should
probably be corrected in cmake.mk.
 package/unionfs/unionfs.mk |   10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/unionfs/unionfs.mk b/package/unionfs/unionfs.mk
index eb8109e..6c86c57 100644
--- a/package/unionfs/unionfs.mk
+++ b/package/unionfs/unionfs.mk
@@ -11,12 +11,4 @@ UNIONFS_DEPENDENCIES = libfuse host-pkg-config
 UNIONFS_LICENSE = BSD-3c
 UNIONFS_LICENSE_FILES = LICENSE
 
-define UNIONFS_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
-
-define UNIONFS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX=/usr DESTDIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
tg: (0132e36..) t/unionfs-cmake (depends on: master)
