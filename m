From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Tue,  1 Aug 2017 16:43:00 -0700
Subject: [Buildroot] [PATCH 1/2] gcc: support grahite for GCC 5 or above
In-Reply-To: <20170801234301.23840-1-yurovsky@gmail.com>
References: <20170801234301.23840-1-yurovsky@gmail.com>
Message-ID: <20170801234301.23840-2-yurovsky@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dropping graphite support for 4.X (of which only 4.9 remains) enables us
to build graphite support the modern way (which involves only ISL
rather than ISL and cloog). Newer versions of GCC require a newer ISL
which does not work with cloog.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
---
 package/gcc/Config.in.host | 4 ++++
 package/gcc/gcc.mk         | 9 +++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 768dc176ae..8a2efd39bb 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -159,6 +159,10 @@ config BR2_GCC_ENABLE_LIBMUDFLAP
 
 config BR2_GCC_ENABLE_GRAPHITE
 	bool "Enable graphite support"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  This option enables the graphite optimizations in the
 	  compiler.
+
+comment "graphite support requires at least GCC 5.X"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 67d3343efe..ed1999e43a 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -173,15 +173,12 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --enable-threads
 endif
 
+# gcc 5 doesn't need cloog any more, see
+# https://gcc.gnu.org/gcc-5/changes.html
+# and we don't support graphite on GCC 4.9.x
 ifeq ($(BR2_GCC_ENABLE_GRAPHITE),y)
 HOST_GCC_COMMON_DEPENDENCIES += host-isl
 HOST_GCC_COMMON_CONF_OPTS += --with-isl=$(HOST_DIR)
-# gcc 5 doesn't need cloog any more, see
-# https://gcc.gnu.org/gcc-5/changes.html
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_5),)
-HOST_GCC_COMMON_DEPENDENCIES += host-cloog
-HOST_GCC_COMMON_CONF_OPTS += --with-cloog=$(HOST_DIR)
-endif
 else
 HOST_GCC_COMMON_CONF_OPTS += --without-isl --without-cloog
 endif
-- 
2.13.3
