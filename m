From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Jun 2014 20:00:35 +0200
Subject: [Buildroot] [git commit] ccache: provide capability to do initial
	ccache setup
Message-ID: <20140614180052.A22189CFE8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd79f2dfae6db7f677bfb10b149ce67f294b91e2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For example, if your project is known to require more space than the
default max cache size, then you might want to increase the cache size
to a suitable amount using the -M (--max-size) option.

The string you specify here is passed verbatim to ccache.  Refer to
ccache documentation for more details.

These initial settings are applied after ccache has been compiled.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                |   21 +++++++++++++++++++--
 package/ccache/ccache.mk |   18 ++++++++++++++----
 2 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/Config.in b/Config.in
index f13ae36..bf1ca86 100644
--- a/Config.in
+++ b/Config.in
@@ -266,7 +266,7 @@ config BR2_CCACHE
 	help
 	  This option will enable the use of ccache, a compiler
 	  cache. It will cache the result of previous builds to speed
-	  up future builds. The cache is stored in
+	  up future builds. By default, the cache is stored in
 	  $HOME/.buildroot-ccache.
 
 	  Note that Buildroot does not try to invalidate the cache
@@ -276,13 +276,30 @@ config BR2_CCACHE
 	  ccache cache by removing the $HOME/.buildroot-ccache
 	  directory.
 
+if BR2_CCACHE
+
 config BR2_CCACHE_DIR
 	string "Compiler cache location"
-	depends on BR2_CCACHE
 	default "$(HOME)/.buildroot-ccache"
 	help
 	  Where ccache should store cached files.
 
+config BR2_CCACHE_INITIAL_SETUP
+	string "Compiler cache initial setup"
+	help
+	  Initial ccache settings to apply, such as --max-files or --max-size.
+
+	  For example, if your project is known to require more space than the
+	  default max cache size, then you might want to increase the cache size
+	  to a suitable amount using the -M (--max-size) option.
+
+	  The string you specify here is passed verbatim to ccache.  Refer to
+	  ccache documentation for more details.
+
+	  These initial settings are applied after ccache has been compiled.
+
+endif
+
 config BR2_DEPRECATED
 	bool "Show packages that are deprecated or obsolete"
 	help
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index df92c5e..f1ec162 100644
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
+define HOST_CCACHE_DO_INITIAL_SETUP
+	@$(call MESSAGE,"Applying initial settings")
+	$(CCACHE) $(BR_CCACHE_INITIAL_SETUP)
+	$(CCACHE) -s
+endef
+
+HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAL_SETUP
+endif
 
 $(eval $(host-autotools-package))
 
