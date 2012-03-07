From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Mar 2012 20:26:50 +0100
Subject: [Buildroot] [PATCH 2/2] ccache: set COMPILERCHECK to 'none'
In-Reply-To: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
References: <cover.1331148403.git.thomas.petazzoni@free-electrons.com>
Message-ID: <351a3eaf5539eda4c54d1f9eb655d3e4d8b9654c.1331148403.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allows ccache to re-use its cache contents even if the compiler
binary mtime has changed. It is the simplest approach to solve this
problem, and it works for the internal, external and crosstool-ng
toolchain backends.

Of course, it leaves the user responsible for invalidating the cache
when necessary, but there doesn't seem to be a real good solution that
allows both to: 1/ keep the cache contents accross builds and re-use
it and 2/ invalidate the cache automatically when the compiler chances
in an incompatible way.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in                |    7 +++++++
 package/ccache/ccache.mk |   12 ++++++++++--
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/Config.in b/Config.in
index 8579a63..2002996 100644
--- a/Config.in
+++ b/Config.in
@@ -191,6 +191,13 @@ config BR2_CCACHE
 	  up future builds. The cache is stored in
 	  $HOME/.buildroot-ccache.
 
+	  Note that Buildroot does not try to invalidate the cache
+	  contents when the compiler changes in an incompatible
+	  way. Therefore, if you make a change to the compiler version
+	  and/or configuration, you are responsible for purging the
+	  ccache cache by removing the $HOME/.buildroot-ccache
+	  directory.
+
 config BR2_DEPRECATED
 	bool "Show packages that are deprecated or obsolete"
 	help
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 393989f..f71376e 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -25,10 +25,18 @@ HOST_CCACHE_CONF_ENV = \
 # has zero dependency besides the C library.
 HOST_CCACHE_CONF_OPT += ccache_cv_zlib_1_2_3=no
 
-# We directly hardcode the cache location into the binary, as it is
-# much easier to handle than passing an environment variable.
+# We directly hardcode configuration into the binary, as it is much
+# easier to handle than passing an environment variable. Our
+# configuration is:
+#  - the cache location
+#  - the fact that ccache shouldn't use the compiler binary mtime to
+#  - detect a change in the compiler, because in the context of
+#  - Buildroot, that completely defeats the purpose of ccache. Of
+#  - course, that leaves the user responsible for purging its cache
+#  - when the compiler changes.
 define HOST_CCACHE_FIX_CCACHE_DIR
 	sed -i 's,getenv("CCACHE_DIR"),"$(CCACHE_CACHE_DIR)",' $(@D)/ccache.c
+	sed -i 's,getenv("CCACHE_COMPILERCHECK"),"none",' $(@D)/ccache.c
 endef
 
 HOST_CCACHE_POST_CONFIGURE_HOOKS += \
-- 
1.7.4.1
