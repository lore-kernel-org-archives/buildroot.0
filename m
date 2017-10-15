From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 15 Oct 2017 22:27:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: bump version to 2.3.0
Message-ID: <20171015202717.22211-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0003, applied upstream:
https://github.com/uclouvain/openjpeg/commit/51a1dcaa6ed5713520dca36fc58cd9240c08b7ca

Renamed patch 0004.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...MakeLists.txt-Don-t-require-a-C-compiler.patch} |  0
 .../0003-avoid-malloc-poisoning-issue.patch        | 54 ----------------------
 package/openjpeg/openjpeg.hash                     |  2 +-
 package/openjpeg/openjpeg.mk                       |  2 +-
 4 files changed, 2 insertions(+), 56 deletions(-)
 rename package/openjpeg/{0004-CMakeLists.txt-Don-t-require-a-C-compiler.patch => 0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch} (100%)
 delete mode 100644 package/openjpeg/0003-avoid-malloc-poisoning-issue.patch

diff --git a/package/openjpeg/0004-CMakeLists.txt-Don-t-require-a-C-compiler.patch b/package/openjpeg/0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch
similarity index 100%
rename from package/openjpeg/0004-CMakeLists.txt-Don-t-require-a-C-compiler.patch
rename to package/openjpeg/0003-CMakeLists.txt-Don-t-require-a-C-compiler.patch
diff --git a/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch b/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch
deleted file mode 100644
index 8463e20d6d..0000000000
--- a/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From 51a1dcaa6ed5713520dca36fc58cd9240c08b7ca Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Thu, 7 Sep 2017 17:52:59 +0200
-Subject: [PATCH] Avoid malloc poisoning issue when including <pthread.h> of
- uclibc (#1013)
-
-Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
----
- src/lib/openjp2/thread.c | 11 ++++++++---
- 1 file changed, 8 insertions(+), 3 deletions(-)
-
-diff --git a/src/lib/openjp2/thread.c b/src/lib/openjp2/thread.c
-index 8b56aa4d5..af33c2c80 100644
---- a/src/lib/openjp2/thread.c
-+++ b/src/lib/openjp2/thread.c
-@@ -29,9 +29,6 @@
-  * POSSIBILITY OF SUCH DAMAGE.
-  */
- 
--#include "opj_includes.h"
--
--#include "thread.h"
- #include <assert.h>
- 
- #ifdef MUTEX_win32
-@@ -46,6 +43,8 @@
- #include <windows.h>
- #include <process.h>
- 
-+#include "opj_includes.h"
-+
- OPJ_BOOL OPJ_CALLCONV opj_has_thread_support(void)
- {
-     return OPJ_TRUE;
-@@ -289,6 +288,10 @@ void opj_thread_join(opj_thread_t* thread)
- #include <stdlib.h>
- #include <unistd.h>
- 
-+/* Moved after all system includes, and in particular pthread.h, so as to */
-+/* avoid poisoning issuing with malloc() use in pthread.h with ulibc (#1013) */
-+#include "opj_includes.h"
-+
- OPJ_BOOL OPJ_CALLCONV opj_has_thread_support(void)
- {
-     return OPJ_TRUE;
-@@ -425,6 +428,8 @@ void opj_thread_join(opj_thread_t* thread)
- #else
- /* Stub implementation */
- 
-+#include "opj_includes.h"
-+
- OPJ_BOOL OPJ_CALLCONV opj_has_thread_support(void)
- {
-     return OPJ_FALSE;
diff --git a/package/openjpeg/openjpeg.hash b/package/openjpeg/openjpeg.hash
index 0e51aaec5e..dd3cf26cf0 100644
--- a/package/openjpeg/openjpeg.hash
+++ b/package/openjpeg/openjpeg.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	6fddbce5a618e910e03ad00d66e7fcd09cc6ee307ce69932666d54c73b7c6e7b  openjpeg-2.2.0.tar.gz
+sha256 3dc787c1bb6023ba846c2a0d9b1f6e179f1cd255172bde9eb75b01f1e6c7d71a  openjpeg-2.3.0.tar.gz
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index eff012f762..df85168b80 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENJPEG_VERSION = 2.2.0
+OPENJPEG_VERSION = 2.3.0
 OPENJPEG_SITE = $(call github,uclouvain,openjpeg,v$(OPENJPEG_VERSION))
 OPENJPEG_LICENSE = BSD-2-Clause
 OPENJPEG_LICENSE_FILES = LICENSE
-- 
2.11.0
