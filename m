From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Mar 2014 20:50:46 +0100
Subject: [Buildroot] [git commit] ccache: Make the cache directory after
	ccache is built
Message-ID: <20140323195541.CEC7A9C1CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ffe3540efa44ae9f0fd09d4cc3ee73b6bf876eea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This ensures that the cache directory (and all of its ancestor
directories) exist. This is a nice thing to do because, if the parent
of the cache directory doesn't exist, then ccache will complain that
it cannot create the cache directory, causing the build to fail.

[Peter: drop BR2_CCACHE conditional, use POST_INSTALL hook]
Signed-off-by: Dan Moulding <dan.moulding@rackwareinc.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ccache/ccache.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index c2c9731..650290d 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -38,6 +38,13 @@ endef
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
 	HOST_CCACHE_PATCH_CONFIGURATION
 
+define HOST_CCACHE_MAKE_CACHE_DIR
+	mkdir -p $(BR_CACHE_DIR)
+endef
+
+HOST_CCACHE_POST_INSTALL_HOOKS += \
+	HOST_CCACHE_MAKE_CACHE_DIR
+
 $(eval $(host-autotools-package))
 
 ifeq ($(BR2_CCACHE),y)
