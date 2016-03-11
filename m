From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 11 Mar 2016 04:34:00 +0300
Subject: [Buildroot] [PATCH] Revert "package/gcc: fix libgcc build for
	xtensa"
Message-ID: <1457660040-13917-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit c44cf2cc97df1729577263d2b0cb5263e8cdc4c1.
Now that xtensa gas don't move literals into .init and .fini this fix is
no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/gcc/gcc.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 0fb73c9..5646b66 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -97,13 +97,6 @@ HOST_GCC_COMMON_CONF_ENV = \
 GCC_COMMON_TARGET_CFLAGS = $(TARGET_CFLAGS)
 GCC_COMMON_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# Xtensa libgcc can't be built with -mauto-litpools
-# because of the trick used to generate .init/.fini sections.
-ifeq ($(BR2_xtensa),y)
-GCC_COMMON_TARGET_CFLAGS = $(filter-out -mauto-litpools,$(TARGET_CFLAGS))
-GCC_COMMON_TARGET_CXXFLAGS = $(filter-out -mauto-litpools,$(TARGET_CXXFLAGS))
-endif
-
 # Propagate options used for target software building to GCC target libs
 HOST_GCC_COMMON_CONF_ENV += CFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CFLAGS)"
 HOST_GCC_COMMON_CONF_ENV += CXXFLAGS_FOR_TARGET="$(GCC_COMMON_TARGET_CXXFLAGS)"
-- 
2.1.4
