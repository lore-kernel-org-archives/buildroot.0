From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  4 Feb 2014 16:18:50 +0100
Subject: [Buildroot] [PATCH 1/3] ccache: replace BUILDROOT_CACHE_DIR with
	BR_CACHE_DIR.
Message-ID: <1391527132-20103-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To make the naming consistent (qstripped variant of a config option
should be named BR_XXX).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                 | 4 ++--
 package/ccache/ccache.mk | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 4a675d4..15d110e 100644
--- a/Makefile
+++ b/Makefile
@@ -316,8 +316,8 @@ TARGET_DIR_WARNING_FILE=$(TARGET_DIR)/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
 
 ifeq ($(BR2_CCACHE),y)
 CCACHE:=$(HOST_DIR)/usr/bin/ccache
-BUILDROOT_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
-export BUILDROOT_CACHE_DIR
+BR_CACHE_DIR = $(call qstrip,$(BR2_CCACHE_DIR))
+export BR_CACHE_DIR
 HOSTCC  := $(CCACHE) $(HOSTCC)
 HOSTCXX := $(CCACHE) $(HOSTCXX)
 endif
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 82a53f3..40485d1 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -22,16 +22,16 @@ CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
 HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
 
 # Patch host-ccache as follows:
-#  - Use BUILDROOT_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
+#  - Use BR_CACHE_DIR instead of CCACHE_DIR, because CCACHE_DIR
 #    is already used by autotargets for the ccache package.
-#    BUILDROOT_CACHE_DIR is exported by Makefile based on config option
+#    BR_CACHE_DIR is exported by Makefile based on config option
 #    BR2_CCACHE_DIR.
 #  - ccache shouldn't use the compiler binary mtime to detect a change in
 #    the compiler, because in the context of Buildroot, that completely
 #    defeats the purpose of ccache. Of course, that leaves the user
 #    responsible for purging its cache when the compiler changes.
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),' $(@D)/ccache.c
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
 	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
 endef
 
-- 
1.9.rc1
