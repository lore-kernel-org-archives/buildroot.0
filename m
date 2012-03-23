From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 23 Mar 2012 15:52:03 +0100
Subject: [Buildroot] [PATCH] ccache: allow dynamic selection of cache
	directory
Message-ID: <3be175a4efe814978ed4.1332514323@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The existing ccache infrastructure set the cache directory hardcoded in the
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

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
Note: I'm not sure what to do with the recently added COMPILERCHECK. Should
it remain hardcoded, or also use the wrapper script for uniformity?


 Config.in                |   7 +++++++
 Makefile                 |   6 ++++--
 package/ccache/ccache.mk |  21 ++++++++++++++-------
 3 files changed, 25 insertions(+), 9 deletions(-)

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
@@ -285,8 +285,10 @@ TOOLCHAIN_DIR=$(BASE_DIR)/toolchain
 TARGET_SKELETON=$(TOPDIR)/fs/skeleton
 
 ifeq ($(BR2_CCACHE),y)
-CCACHE:=$(HOST_DIR)/usr/bin/ccache
-CCACHE_CACHE_DIR=$(HOME)/.buildroot-ccache
+CCACHE:=$(HOST_DIR)/usr/bin/ccache-wrapper
+CCACHE_BIN:=$(HOST_DIR)/usr/bin/ccache
+CCACHE_CACHE_DIR:=$(call qstrip,$(BR2_CCACHE_DIR))
+export CCACHE_CACHE_DIR
 HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -25,23 +25,30 @@ HOST_CCACHE_CONF_ENV = \
 # has zero dependency besides the C library.
 HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
 
-# We directly hardcode configuration into the binary, as it is much
+# We directly hardcode some configuration into the binary, as it is much
 # easier to handle than passing an environment variable. Our
 # configuration is:
-#  - the cache location
 #  - the fact that ccache shouldn't use the compiler binary mtime to
-#  - detect a change in the compiler, because in the context of
-#  - Buildroot, that completely defeats the purpose of ccache. Of
-#  - course, that leaves the user responsible for purging its cache
-#  - when the compiler changes.
+#    detect a change in the compiler, because in the context of
+#    Buildroot, that completely defeats the purpose of ccache. Of
+#    course, that leaves the user responsible for purging its cache
+#    when the compiler changes.
 define HOST_CCACHE_FIX_CCACHE_DIR
-	sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",' $(@D)/ccache.c
 	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
 endef
 
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
 	HOST_CCACHE_FIX_CCACHE_DIR
 
+define HOST_CCACHE_CREATE_WRAPPER
+	echo "#!/bin/sh" > $(CCACHE)
+	echo 'CCACHE_DIR=$$CCACHE_CACHE_DIR $(CCACHE_BIN) "$$@"' >> $(CCACHE)
+	chmod +x $(CCACHE)
+endef
+
+HOST_CCACHE_POST_INSTALL_HOOKS += \
+	HOST_CCACHE_CREATE_WRAPPER
+
 $(eval $(call AUTOTARGETS))
 $(eval $(call AUTOTARGETS,host))
 
