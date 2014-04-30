From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 29 Apr 2014 22:52:39 -0400
Subject: [Buildroot] [PATCH v2 2/2] ccache: provide capability to do initial
	ccache setup
In-Reply-To: <1398826359-2711-1-git-send-email-danomimanchego123@gmail.com>
References: <1398826359-2711-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1398826359-2711-3-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For example, if your project is known to require more space
than the default max cache size, then you might want to
automatically increase the cache size to a suitable amount
using the -M option.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Changes v1 -> v2:
* Refresh against latest
* Also, remove needless line-breaks in existing hooks
---
 Config.in                |   15 ++++++++++++++-
 package/ccache/ccache.mk |   18 ++++++++++++++----
 2 files changed, 28 insertions(+), 5 deletions(-)

diff --git a/Config.in b/Config.in
index 5823274..8ecd4ed 100644
--- a/Config.in
+++ b/Config.in
@@ -256,7 +256,7 @@ config BR2_CCACHE
 	help
 	  This option will enable the use of ccache, a compiler
 	  cache. It will cache the result of previous builds to speed
-	  up future builds. The cache is stored in
+	  up future builds. By default, the cache is stored in
 	  $HOME/.buildroot-ccache.
 
 	  Note that Buildroot does not try to invalidate the cache
@@ -273,6 +273,19 @@ config BR2_CCACHE_DIR
 	help
 	  Where ccache should store cached files.
 
+config BR2_CCACHE_INITIAL_SETUP
+	string "Compiler cache initial setup"
+	depends on BR2_CCACHE
+	help
+	  Additional ccache setup options, such as max-files or max-size.
+
+	  For example, if your project is known to require more space
+	  than the default max cache size, then you might want to
+	  automatically increase the cache size to a suitable amount
+	  using the -M option.
+
+	  Applied at time of ccache compilation.
+
 config BR2_DEPRECATED
 	bool "Show packages that are deprecated or obsolete"
 	help
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index df92c5e..5be6b16 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -38,15 +38,25 @@ define HOST_CCACHE_PATCH_CONFIGURATION
 	sed -i 's,"%s/.ccache","$(BR_CACHE_DIR)",' $(@D)/ccache.c
 endef
 
-HOST_CCACHE_POST_CONFIGURE_HOOKS += \
-	HOST_CCACHE_PATCH_CONFIGURATION
+HOST_CCACHE_POST_CONFIGURE_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
 
 define HOST_CCACHE_MAKE_CACHE_DIR
 	mkdir -p $(BR_CACHE_DIR)
 endef
 
-HOST_CCACHE_POST_INSTALL_HOOKS += \
-	HOST_CCACHE_MAKE_CACHE_DIR
+HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_MAKE_CACHE_DIR
+
+# Provide capability to do initial ccache setup (e.g. increase default size)
+BR_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
+ifneq ($(BR_CCACHE_INITIAL_SETUP),)
+define HOST_CCACHE_DO_INITIAIL_SETUP
+	@$(call MESSAGE,"Do initial host ccache setup")
+	$(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
+	$(CCACHE) -s
+endef
+
+HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAIL_SETUP
+endif
 
 $(eval $(host-autotools-package))
 
-- 
1.7.9.5
