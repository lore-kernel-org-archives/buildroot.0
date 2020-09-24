From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 24 Sep 2020 12:22:18 +0200
Subject: [Buildroot] [PATCH] package/gcc: drop leftovers from PowerPC
 conditional patching
Message-ID: <20200924102219.3443175-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We used to have a conditional patch applied on PowerPC soft-float, but
this logic was dropped in commit
0c82f3f63563c4d4d7e034d0e9e4ceb766d92322 ("package/gcc: remove powerpc
conditional patching logic"). However, we still have some related
leftovers in the calculation of the hashes for ccache, which can now
be dropped.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/gcc/gcc.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index d9c4b4ef83..cc1dbbcf3a 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -279,11 +279,6 @@ HOST_GCC_COMMON_CCACHE_HASH_FILES += \
 ifeq ($(BR2_xtensa),y)
 HOST_GCC_COMMON_CCACHE_HASH_FILES += $(ARCH_XTENSA_OVERLAY_TAR)
 endif
-ifeq ($(ARCH),powerpc)
-ifneq ($(BR2_SOFT_FLOAT),)
-HOST_GCC_COMMON_CCACHE_HASH_FILES += package/gcc/$(GCC_VERSION)/1000-powerpc-link-with-math-lib.patch.conditional
-endif
-endif
 
 # _CONF_OPTS contains some references to the absolute path of $(HOST_DIR)
 # and a reference to the Buildroot git revision (BR2_VERSION_FULL),
-- 
2.26.2
