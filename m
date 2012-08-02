From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:35 -0000
Subject: [Buildroot] [git commit branch/next] ccache: allow dynamic
	selection of cache directory
Message-ID: <20120802195232.A35DC96FF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=433290761fceb476b095548eec10adf72405e050
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The existing ccache infrastructure sets the cache directory hardcoded in the
ccache binary. As this directory was set to ~/.buildroot-ccache, the cache
is not necessarily local (e.g. in corporate environments the home directories
may be mounted over NFS.)
Previous versions of buildroot did allow to set the cache directory, but this
was also hardcoded (so you had to rebuild ccache to change it), plus that
support was removed.
See http://lists.busybox.net/pipermail/buildroot/2011-July/044511.html for
a discussion on this.

This patch modifies ccache to respect a new shell variable (exported from
the Makefile, based on a configuration option) instead of CCACHE_DIR.
The name CCACHE_DIR itself is already used by autotargets for the ccache
package.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Config.in                |    7 +++++++
 Makefile                 |    3 ++-
 package/ccache/ccache.mk |   24 ++++++++++++------------
 3 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/Config.in b/Config.in
index 68abb9b..95c2e8c 100644
--- a/Config.in
+++ b/Config.in
@@ -198,6 +198,13 @@ config BR2_CCACHE
 	  ccache cache by removing the $HOME/.buildroot-ccache
 	  directory.
 
+config BR2_CCACHE_DIR
+	string "Compiler cache location"
+	depends on BR2_CCACHE
+	default "$(HOME)/.buildroot-ccache"
+	help
+	  Where ccache should store cached files.
+
 config BR2_DEPRECATED
 	bool "Show packages that are deprecated or obsolete"
 	help
diff --git a/Makefile b/Makefile
index 96f9412..4427c40 100644
--- a/Makefile
+++ b/Makefile
@@ -252,7 +252,8 @@ TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
-CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
+BUILDROOT_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
+export BUILDROOT_CACHE_DIR
 HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index f71376e..d7106ee 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -25,22 +25,22 @@ HOST_CCACHE_CONF_ENV = \
 # has zero dependency besides the C library.
 HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
 
-# We directly hardcode configuration into the binary, as it is much
-# easier to handle than passing an environment variable. Our
-# configuration is:
-#  - the cache location
-#  - the fact that ccache shouldn't use the compiler binary mtime to
-#  - detect a change in the compiler, because in the context of
-#  - Buildroot, that completely defeats the purpose of ccache. Of
-#  - course, that leaves the user responsible for purging its cache
-#  - when the compiler changes.
-define HOST_CCACHE_FIX_CCACHE_DIR
-	sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",' $(@D)/ccache.c
+# Patch host-ccache as follows:
+#  - Use BUILDROOT_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
+#    is already used by autotargets for the ccache package.
+#    BUILDROOT_CACHE_DIR is exported by Makefile based on config option
+#    BR2_CCACHE_DIR.
+#  - ccache shouldn't use the compiler binary mtime to detect a change in
+#    the compiler, because in the context of Buildroot, that completely
+#    defeats the purpose of ccache. Of course, that leaves the user
+#    responsible for purging its cache when the compiler changes.
+define HOST_CCACHE_PATCH_CONFIGURATION
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),' $(@D)/ccache.c
 	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
 endef
 
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
-	HOST_CCACHE_FIX_CCACHE_DIR
+	HOST_CCACHE_PATCH_CONFIGURATION
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
