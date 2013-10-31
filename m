From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 30 Oct 2013 22:54:24 -0400
Subject: [Buildroot] [PATCH 3/3] ccache: provide capability to do initial
	ccache setup
In-Reply-To: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
References: <1383188064-2380-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1383188064-2380-4-git-send-email-danomimanchego123@gmail.com>
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
 Config.in                |   15 ++++++++++++++-
 package/ccache/ccache.mk |   11 +++++++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index af720ec..c2971df 100644
--- a/Config.in
+++ b/Config.in
@@ -222,7 +222,7 @@ config BR2_CCACHE
 	help
 	  This option will enable the use of ccache, a compiler
 	  cache. It will cache the result of previous builds to speed
-	  up future builds. The cache is stored in
+	  up future builds. By default, the cache is stored in
 	  $HOME/.buildroot-ccache.
 
 	  Note that Buildroot does not try to invalidate the cache
@@ -239,6 +239,19 @@ config BR2_CCACHE_DIR
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
index 1ebe974..cea0701 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -21,6 +21,17 @@ CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 # has zero dependency besides the C library.
 HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
 
+# Provide capability to do initial ccache setup (e.g. increase default size)
+HOST_CCACHE_INITIAL_SETUP = $(call qstrip,$(BR2_CCACHE_INITIAL_SETUP))
+ifneq ($(HOST_CCACHE_INITIAL_SETUP),)
+  define HOST_CCACHE_DO_INITIAIL_SETUP
+	@$(call MESSAGE,"Do initial host ccache setup")
+	$(CCACHE) $(HOST_CCACHE_INITIAL_SETUP)
+	$(CCACHE) -s
+  endef
+  HOST_CCACHE_POST_INSTALL_HOOKS += HOST_CCACHE_DO_INITIAIL_SETUP
+endif
+
 # Patch host-ccache as follows:
 #  - Use BUILDROOT_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
 #    is already used by autotargets for the ccache package.
-- 
1.7.9.5
