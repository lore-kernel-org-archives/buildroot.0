From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Aug 2018 19:34:06 +0200
Subject: [Buildroot] [git commit] ccache: bump to version 3.4.2
Message-ID: <20180907111604.55A6480FBA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b743cb408a357a330f76410c82c8f2fcaa850a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update license info, and remove the patch since it's already on upstream.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...gument-to-sysroot-option-to-relative-path.patch | 43 ----------------------
 package/ccache/ccache.hash                         |  7 ++--
 package/ccache/ccache.mk                           |  8 ++--
 3 files changed, 8 insertions(+), 50 deletions(-)

diff --git a/package/ccache/0001-Convert-argument-to-sysroot-option-to-relative-path.patch b/package/ccache/0001-Convert-argument-to-sysroot-option-to-relative-path.patch
deleted file mode 100644
index 33db7d480f..0000000000
--- a/package/ccache/0001-Convert-argument-to-sysroot-option-to-relative-path.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From fe42d6f7b739e8d42811bf46bcccfafa728847a2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Mathias=20De=20Mar=C3=A9?= <mathias.de_mare@nokia.com>
-Date: Mon, 19 Sep 2016 10:38:13 +0200
-Subject: [PATCH] Convert argument to '--sysroot' option to relative path
-
-Previously, only the argument to '--sysroot=' was converted.
-This changeset adds support for '--sysroot'.
-
-Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
-Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
----
- ccache.c | 15 +++++++++++++++
- 1 file changed, 15 insertions(+)
-
-diff --git a/ccache.c b/ccache.c
-index 8ffadcc..76139b9 100644
---- a/ccache.c
-+++ b/ccache.c
-@@ -2407,6 +2407,21 @@ cc_process_args(struct args *args, struct args **preprocessor_args,
- 			free(option);
- 			continue;
- 		}
-+		// Alternate form of specifying sysroot without =
-+		if (str_eq(argv[i], "--sysroot")) {
-+			if (i == argc-1) {
-+				cc_log("Missing argument to %s", argv[i]);
-+				stats_update(STATS_ARGS);
-+				result = false;
-+				goto out;
-+			}
-+			args_add(stripped_args, argv[i]);
-+			char *relpath = make_relative_path(x_strdup(argv[i+1]));
-+			args_add(stripped_args, relpath);
-+			i++;
-+			free(relpath);
-+			continue;
-+		}
- 		if (str_startswith(argv[i], "-Wp,")) {
- 			if (str_eq(argv[i], "-Wp,-P")
- 			    || strstr(argv[i], ",-P,")
--- 
-2.8.3
-
diff --git a/package/ccache/ccache.hash b/package/ccache/ccache.hash
index c22394b13b..5ed5037ed0 100644
--- a/package/ccache/ccache.hash
+++ b/package/ccache/ccache.hash
@@ -1,3 +1,4 @@
-# Verified key https://samba.org/ftp/ccache/ccache-3.3.4.tar.xz.asc - sha256 computed locally
-sha256  24f15bf389e38c41548c9c259532187774ec0cb9686c3497bbb75504c8dc404f  ccache-3.3.4.tar.xz
-sha256  190576a6e938760ec8113523e6fd380141117303e90766cc4802e770422b30c6  ccache-3.3.5.tar.xz
+# sha256 computed locally
+sha256  18a8b14367d63d3d37fb6c33cba60e1b7fcd7a63d608df97c9771ae0d234fee2  ccache-3.4.2.tar.xz
+sha256  ec6b1a326ff93b2cc21df88a697ae470ff6927a55b8929e7e491b315e1563361  GPL-3.0.txt
+sha256  853e071acb730ca933860a0acf4e44e5dc4bffed6b09503bbcf878e343addcc5  LICENSE.adoc
diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
index 9a11d46d30..851939ebda 100644
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-CCACHE_VERSION = 3.3.5
+CCACHE_VERSION = 3.4.2
 CCACHE_SITE = https://www.samba.org/ftp/ccache
 CCACHE_SOURCE = ccache-$(CCACHE_VERSION).tar.xz
 CCACHE_LICENSE = GPL-3.0+, others
-CCACHE_LICENSE_FILES = LICENSE.txt GPL-3.0.txt
+CCACHE_LICENSE_FILES = LICENSE.adoc GPL-3.0.txt
 
 # Force ccache to use its internal zlib. The problem is that without
 # this, ccache would link against the zlib of the build system, but we
@@ -38,8 +38,8 @@ HOST_CCACHE_CONF_ENV = \
 HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))
 
 define HOST_CCACHE_PATCH_CONFIGURATION
-	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/ccache.c
-	sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/conf.c
+	sed -i 's,getenv("CCACHE_DIR"),getenv("BR_CACHE_DIR"),' $(@D)/src/ccache.c
+	sed -i 's,"%s/.ccache","$(HOST_CCACHE_DEFAULT_CCACHE_DIR)",' $(@D)/src/conf.c
 endef
 
 HOST_CCACHE_POST_PATCH_HOOKS += HOST_CCACHE_PATCH_CONFIGURATION
