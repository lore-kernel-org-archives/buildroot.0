From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Nov 2019 18:07:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/safeclib: bump to version 08112019
Message-ID: <20191108170742.29680-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Drop patch (already in version)
- Include a fix for musl on x86_64:
  https://github.com/rurban/safeclib/commit/19e7154e9c5189b0dfb5594b94cb7b883f9b6dcf

Fixes:
 - http://autobuild.buildroot.org/results/7923fe7e609a6b2638492350996cc96582cc9193

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-Define-_GNU_SOURCE-when-needed.patch | 115 ------------------
 package/safeclib/safeclib.hash                |   4 +-
 package/safeclib/safeclib.mk                  |   4 +-
 3 files changed, 4 insertions(+), 119 deletions(-)
 delete mode 100644 package/safeclib/0001-Define-_GNU_SOURCE-when-needed.patch

diff --git a/package/safeclib/0001-Define-_GNU_SOURCE-when-needed.patch b/package/safeclib/0001-Define-_GNU_SOURCE-when-needed.patch
deleted file mode 100644
index cc9e580793..0000000000
--- a/package/safeclib/0001-Define-_GNU_SOURCE-when-needed.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 94c7b765202fe50894425364834beca79e52b255 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Mon, 28 Oct 2019 17:09:43 +0100
-Subject: [PATCH] Define _GNU_SOURCE when needed
-
-Define _GNU_SOURCE to fix build with musl otherwise we'll got the
-following build failures due to localtime_r, strnlen, gmtime_r and
-asctime_r being undefined:
-
-os/localtime_s.c:124:12: error: implicit declaration of function 'localtime_r'; did you mean 'localtime_s'? [-Werror=implicit-function-declaration]
-     dest = localtime_r(timer, dest);
-            ^~~~~~~~~~~
-
-io/gets_s.c:144:32: error: implicit declaration of function 'strnlen'; did you mean 'strlen'? [-Werror=implicit-function-declaration]
-         rsize_t len = (rsize_t)strnlen(dest, dmax);
-                                ^~~~~~~
-                                strlen
-
-An other option would be to define AC_GNU_SOURCE in the configure.ac but
-it seems that there is some handling of _GNU_SOURCE in
-safeclib_private.h
-
-Fixes:
- - http://autobuild.buildroot.net/results/31a4b647ec0dcd9f517f313ec6c7c8f56da1ee47
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/rurban/safeclib/commit/94c7b765202fe50894425364834beca79e52b255]
----
- src/extmem/memzero_s.c | 2 ++
- src/io/gets_s.c        | 2 ++
- src/os/asctime_s.c     | 2 ++
- src/os/ctime_s.c       | 2 ++
- src/os/gmtime_s.c      | 2 ++
- src/os/localtime_s.c   | 2 ++
- 6 files changed, 12 insertions(+)
-
-diff --git a/src/extmem/memzero_s.c b/src/extmem/memzero_s.c
-index 75107215..20cb2784 100644
---- a/src/extmem/memzero_s.c
-+++ b/src/extmem/memzero_s.c
-@@ -31,6 +31,8 @@
-  *------------------------------------------------------------------
-  */
- 
-+#define _GNU_SOURCE
-+
- #ifdef FOR_DOXYGEN
- #include "safe_mem_lib.h"
- #else
-diff --git a/src/io/gets_s.c b/src/io/gets_s.c
-index 09350b3d..be875a1c 100644
---- a/src/io/gets_s.c
-+++ b/src/io/gets_s.c
-@@ -29,6 +29,8 @@
-  *------------------------------------------------------------------
-  */
- 
-+#define _GNU_SOURCE
-+
- #ifdef FOR_DOXYGEN
- #include "safe_lib.h"
- #else
-diff --git a/src/os/asctime_s.c b/src/os/asctime_s.c
-index 42669844..01cefd8f 100644
---- a/src/os/asctime_s.c
-+++ b/src/os/asctime_s.c
-@@ -29,6 +29,8 @@
-  *------------------------------------------------------------------
-  */
- 
-+#define _GNU_SOURCE
-+
- #ifdef FOR_DOXYGEN
- #include "safe_lib.h"
- #else
-diff --git a/src/os/ctime_s.c b/src/os/ctime_s.c
-index 01b31f63..7a1a138c 100644
---- a/src/os/ctime_s.c
-+++ b/src/os/ctime_s.c
-@@ -29,6 +29,8 @@
-  *------------------------------------------------------------------
-  */
- 
-+#define _GNU_SOURCE
-+
- #ifdef FOR_DOXYGEN
- #include "safe_lib.h"
- #else
-diff --git a/src/os/gmtime_s.c b/src/os/gmtime_s.c
-index ff9a0e24..cd8f064f 100644
---- a/src/os/gmtime_s.c
-+++ b/src/os/gmtime_s.c
-@@ -29,6 +29,8 @@
-  *------------------------------------------------------------------
-  */
- 
-+#define _GNU_SOURCE
-+
- #ifdef FOR_DOXYGEN
- #include "safe_lib.h"
- #else
-diff --git a/src/os/localtime_s.c b/src/os/localtime_s.c
-index 0ce3324b..92ea21b9 100644
---- a/src/os/localtime_s.c
-+++ b/src/os/localtime_s.c
-@@ -29,6 +29,8 @@
-  *------------------------------------------------------------------
-  */
- 
-+#define _GNU_SOURCE
-+
- #ifdef FOR_DOXYGEN
- #include "safe_lib.h"
- #else
diff --git a/package/safeclib/safeclib.hash b/package/safeclib/safeclib.hash
index a827855b08..7e1c6794e4 100644
--- a/package/safeclib/safeclib.hash
+++ b/package/safeclib/safeclib.hash
@@ -1,5 +1,5 @@
-# From https://github.com/rurban/safeclib/releases/tag/v17102019
-sha256	b8824429f4281a1fe8cf74ba020e26f4551005c8907f0b6f1e639fee68326159	libsafec-17102019.0-g5d92be.tar.bz2
+# From https://github.com/rurban/safeclib/releases/tag/v08112019
+sha256	bc2f25875522c50a3a5901981020d906db0b6a7d365619b8d72412c126be3923	libsafec-08112019.0-gad76c7.tar.bz2
 
 # Hash for license file
 sha256	c33e77efd5781e3d59a2bb648c82d2a615035ef0d24cf58880380e3af906510b	COPYING
diff --git a/package/safeclib/safeclib.mk b/package/safeclib/safeclib.mk
index 726b27f176..3af8fbb167 100644
--- a/package/safeclib/safeclib.mk
+++ b/package/safeclib/safeclib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SAFECLIB_VERSION = 17102019
+SAFECLIB_VERSION = 08112019
 SAFECLIB_SITE = \
 	https://github.com/rurban/safeclib/releases/download/v$(SAFECLIB_VERSION)
-SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).0-g5d92be.tar.bz2
+SAFECLIB_SOURCE = libsafec-$(SAFECLIB_VERSION).0-gad76c7.tar.bz2
 SAFECLIB_LICENSE = MIT
 SAFECLIB_LICENSE_FILES = COPYING
 SAFECLIB_INSTALL_STAGING = YES
-- 
2.23.0
