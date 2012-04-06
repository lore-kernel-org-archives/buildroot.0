From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 06 Apr 2012 20:47:17 +0200
Subject: [Buildroot] [PATCH v2] ccache: allow dynamic selection of cache
	directory
Message-ID: <962414f85797a188de79.1333738037@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The existing ccache infrastructure sets the cache directory hardcoded in the
ccache binary. As this directory was set to ~/.buildroot-ccache, the cache
is not necessarily local (e.g. in corporate environments the home directories
may be mounted over NFS.)
Previous versions of buildroot did allow to set the cache directory, but this
was also hardcoded (so you had to rebuild ccache to change it), plus that
support was removed.
See http://lists.busybox.net/pipermail/buildroot/2011-July/044511.html for
a discussion on this.

This patch introduces a ccache wrapper script that uses a shell variable
(exported from the Makefile and coming from .config) to set the right
CCACHE_DIR.

Additionally it migrates the COMPILERCHECK setting to the wrapper script
as well.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v2: Update based on Arnout's comments: move compilercheck to wrapper, move
    wrapper to version-controlled file instead of generating it, use exec,
    rename cache_dir variable, fix whitespace.

 Config.in                     |   7 +++++++
 Makefile                      |   5 +++--
 package/ccache/ccache-wrapper |  18 ++++++++++++++++++
 package/ccache/ccache.mk      |  19 +++++--------------
 4 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/Config.in b/Config.in
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
--- a/Makefile
+++ b/Makefile
@@ -285,8 +285,9 @@ TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
 ifeq ($(BR2_CCACHE),y)
-CCACHE:=$(HOST_DIR)/usr/bin/ccache
-CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
+CCACHE = $(HOST_DIR)/usr/bin/ccache-wrapper
+BUILDROOT_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
+export BUILDROOT_CACHE_DIR
 HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
diff --git a/package/ccache/ccache-wrapper b/package/ccache/ccache-wrapper
new file mode 100644
--- /dev/null
+++ b/package/ccache/ccache-wrapper
@@ -0,0 +1,18 @@
+#!/bin/sh
+# ccache wrapper tweaking the ccache environment
+
+# Set cache dir based on .config
+CCACHE_DIR="$BUILDROOT_CACHE_DIR"
+export CCACHE_DIR
+
+# ccache shouldn't use the compiler binary mtime to
+# detect a change in the compiler, because in the context of
+# Buildroot, that completely defeats the purpose of ccache. Of
+# course, that leaves the user responsible for purging its cache
+# when the compiler changes.
+CCACHE_COMPILERCHECK=none
+export CCACHE_COMPILERCHECK
+
+
+CCACHE_BIN="`dirname $0`/ccache"
+exec "$CCACHE_BIN" "$@"
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -25,22 +25,13 @@ HOST_CCACHE_CONF_ENV = \
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
-	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
+define HOST_CCACHE_INSTALL_WRAPPER
+	$(INSTALL) -D -m 0755 package/ccache/ccache-wrapper \
+		$(HOST_DIR)/usr/bin/ccache-wrapper
 endef
 
-HOST_CCACHE_POST_CONFIGURE_HOOKS += \
-	HOST_CCACHE_FIX_CCACHE_DIR
+HOST_CCACHE_POST_INSTALL_HOOKS += \
+	HOST_CCACHE_INSTALL_WRAPPER
 
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
