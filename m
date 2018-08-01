From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed,  1 Aug 2018 14:57:20 +0200
Subject: [Buildroot] [PATCH 3/4] minicom: delete patches
In-Reply-To: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
References: <20180801125721.34654-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180801125721.34654-4-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patches are now part of sources.

Delete patches.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../minicom/0001-musl-libc-compile-fix.patch  | 28 ----------
 ...-change-maxnamlen-to-posixs-name-max.patch | 51 -------------------
 2 files changed, 79 deletions(-)
 delete mode 100644 package/minicom/0001-musl-libc-compile-fix.patch
 delete mode 100644 package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch

diff --git a/package/minicom/0001-musl-libc-compile-fix.patch b/package/minicom/0001-musl-libc-compile-fix.patch
deleted file mode 100644
index 94c0da06a5..0000000000
--- a/package/minicom/0001-musl-libc-compile-fix.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-# HG changeset patch
-# User Adam Lackorzynski <adam@os.inf.tu-dresden.de>
-# Date 1432407431 -7200
-#      Sat May 23 20:57:11 2015 +0200
-# Node ID 8bf81e6a8e60e37c2dec9577a1be6357b8d56165
-# Parent  8c784c80c17aa7a346d982db23bca5df67302cda
-musl-libc compile fix
-
-By Felix Janda <felix.janda@posteo.de>:
-VC_MUSIC is enabled by default on linux and in dial.c the
-necessary header are only included for glibc. (The wrong conditional
-include has likely been introduced by the 2003-03-30 GNU/Hurd patch.)
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Taken from upstream Mercurial commit 8bf81e6a8e60]
-
-diff -r 8c784c80c17a -r 8bf81e6a8e60 src/dial.c
---- a/src/dial.c	Sat May 23 20:56:29 2015 +0200
-+++ b/src/dial.c	Sat May 23 20:57:11 2015 +0200
-@@ -39,7 +39,7 @@
- #include "intl.h"
- 
- #ifdef VC_MUSIC
--#  if defined(__GLIBC__)
-+#  if defined(__linux__) || defined(__GLIBC__)
- #    include <sys/ioctl.h>
- #    include <sys/kd.h>
- #    include <sys/time.h>
diff --git a/package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch b/package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch
deleted file mode 100644
index 83e1530600..0000000000
--- a/package/minicom/0002-change-maxnamlen-to-posixs-name-max.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-# HG changeset patch
-# User Adam Lackorzynski <adam@os.inf.tu-dresden.de>
-# Date 1432407475 -7200
-#      Sat May 23 20:57:55 2015 +0200
-# Node ID 93e5dd955c8bd944fd64bb04fd117c963c3758bc
-# Parent  8bf81e6a8e60e37c2dec9577a1be6357b8d56165
-Change MAXNAMLEN to POSIX's NAME_MAX
-
-By Felix Janda <felix.janda@posteo.de>:
-MAXNAMLEN is usually defined in <sys/param.h> but it is
-better to use the equivalent POSIX NAME_MAX.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Taken from upstream Mercurial commit 93e5dd955c8b]
-
-diff -r 8bf81e6a8e60 -r 93e5dd955c8b src/getsdir.c
---- a/src/getsdir.c	Sat May 23 20:57:11 2015 +0200
-+++ b/src/getsdir.c	Sat May 23 20:57:55 2015 +0200
-@@ -145,7 +145,7 @@
-  *
-  *			    The data will be in the form:
-  *				typedef struct dirEntry {
-- *				    char fname[MAXNAMLEN + 1];
-+ *				    char fname[NAME_MAX + 1];
-  *				    time_t time;
-  *				    mode_t mode;
-  *				} GETSDIR_ENTRY;
-@@ -232,7 +232,7 @@
-             }
- 
-           /* copy the filename */
--          strncpy((*datptr)[cnt].fname, dp->d_name, MAXNAMLEN);
-+          strncpy((*datptr)[cnt].fname, dp->d_name, NAME_MAX);
- 
-           /* get information about the directory entry */
-           snprintf(fpath, sizeof(fpath), "%s/%s", dirpath, dp->d_name);
-diff -r 8bf81e6a8e60 -r 93e5dd955c8b src/getsdir.h
---- a/src/getsdir.h	Sat May 23 20:57:11 2015 +0200
-+++ b/src/getsdir.h	Sat May 23 20:57:55 2015 +0200
-@@ -23,9 +23,10 @@
-  */
- 
- #include <dirent.h>
-+#include <limits.h>
- 
- typedef struct dirEntry {		/* structure of data item */
--  char fname[MAXNAMLEN + 1];		/* filename + terminating null */
-+  char fname[NAME_MAX + 1];		/* filename + terminating null */
-   time_t time;				/* last modification date */
-   mode_t mode;				/* file mode (dir? etc.) */
-   ushort cflags;			/* caller field for convenience */
-- 
2.17.1
