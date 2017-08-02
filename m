From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Aug 2017 21:16:45 +0200
Subject: [Buildroot] [git commit] gcc: support grahite only for GCC 5 or
	above
Message-ID: <20170802193535.19B997FC13@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d16b6bf9b9da2d58955bf1abaf15f25c5666b90a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

GCC 4.9.x requires an old version of ISL to support graphite, and this
old version of ISL is not sufficient to support graphite in modern GCC
versions.

Since GCC 4.9.x is getting older, and to keep things simple, we stop
supporting graphite on old GCC < 5.x. This way, we will be able to
bump ISL to a version that is suitable for modern GCC versions.

In addition, this allows to drop the dependency on cloog, which was
only needed for GCC 4.9.

Signed-off-by: Andrey Yurovsky <yurovsky@gmail.com>
[Thomas: rework commit log.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/Config.in.host | 4 ++++
 package/gcc/gcc.mk         | 9 +++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 768dc17..a2e02d7 100644
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
+comment "graphite support needs gcc >= 5.x"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 67d3343..6ee840e 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -173,15 +173,12 @@ else
 HOST_GCC_COMMON_CONF_OPTS += --enable-threads
 endif
 
+# gcc 5 doesn't need cloog any more, see
+# https://gcc.gnu.org/gcc-5/changes.html and we don't support graphite
+# on GCC 4.9.x, so only isl is needed.
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
