From: Francois Perrad <fperrad@gmail.com>
Date: Fri, 16 Jan 2015 22:09:55 +0100
Subject: [Buildroot] [PATCH 6/6] luafilesystem: bump to version 1.6.3
In-Reply-To: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
References: <1421442595-27575-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1421442595-27575-6-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luafilesystem/0001-without_large_file.patch | 20 --------------------
 package/luafilesystem/luafilesystem.mk              |  6 +++++-
 2 files changed, 5 insertions(+), 21 deletions(-)
 delete mode 100644 package/luafilesystem/0001-without_large_file.patch

diff --git a/package/luafilesystem/0001-without_large_file.patch b/package/luafilesystem/0001-without_large_file.patch
deleted file mode 100644
index 5b24b99..0000000
--- a/package/luafilesystem/0001-without_large_file.patch
+++ /dev/null
@@ -1,20 +0,0 @@
-Index: b/luafilesystem-1.6.2/src/lfs.c
-===================================================================
---- a/luafilesystem-1.6.2/src/lfs.c
-+++ b/luafilesystem-1.6.2/src/lfs.c
-@@ -22,13 +22,13 @@
- 
- #ifndef _WIN32
- #ifndef _AIX
--#define _FILE_OFFSET_BITS 64 /* Linux, Solaris and HP-UX */
-+//#define _FILE_OFFSET_BITS 64 /* Linux, Solaris and HP-UX */
- #else
- #define _LARGE_FILES 1 /* AIX */
- #endif
- #endif
- 
--#define _LARGEFILE64_SOURCE
-+//#define _LARGEFILE64_SOURCE
- 
- #include <errno.h>
- #include <stdio.h>
diff --git a/package/luafilesystem/luafilesystem.mk b/package/luafilesystem/luafilesystem.mk
index f466010..ea80753 100644
--- a/package/luafilesystem/luafilesystem.mk
+++ b/package/luafilesystem/luafilesystem.mk
@@ -4,7 +4,11 @@
 #
 ################################################################################
 
-LUAFILESYSTEM_VERSION = 1.6.2-2
+LUAFILESYSTEM_VERSION = 1.6.3-1
 LUAFILESYSTEM_LICENSE = MIT
+LUAFILESYSTEM_SUBDIR = luafilesystem
+ifneq ($(BR2_LARGEFILE),y)
+LUAFILESYSTEM_BUILD_OPTS += CFLAGS="$(LUAROCKS_CFLAGS) -DLFS_DO_NOT_USE_LARGE_FILE"
+endif
 
 $(eval $(luarocks-package))
-- 
2.1.0
