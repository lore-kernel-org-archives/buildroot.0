From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 27 Aug 2018 21:23:26 -0400
Subject: [Buildroot] [PATCH 1/1] ccache: fix initial setup failure
Message-ID: <1535419406-2407-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The BR2_CCACHE_INITIAL_SETUP can fail if CCACHE_DISABLE is defined in the
environment, because ccache refuses to create a ccache.conf file when
caching is disabled.  To avoid this failure, we unset CCACHE_DISABLE prior
to doing any initial cache setup, just on the call setting up the initial
config.  The rest of the build can proceed with CCACHE_DISABLE set, if the
user wishes it so.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/ccache/ccache.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 9a11d46..6c83a1c 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -55,7 +55,7 @@ BR_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
 ifneq ($(BR_CCACHE_INITIAL_SETUP),)
 define HOST_CCACHE_DO_INITIAL_SETUP
 	@$(call MESSAGE,"Applying initial settings")
-	$(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
+	unset CCACHE_DISABLE; $(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
 	$(CCACHE) -s
 endef
 
-- 
2.7.4
