From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Oct 2019 22:47:19 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/safeclib: fix
 build with musl
Message-ID: <20191031214042.AC8338E3A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6afc30313b48bf45f5b74c2b3a5a80629cc1c89c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes:
 - http://autobuild.buildroot.net/results/31a4b647ec0dcd9f517f313ec6c7c8f56da1ee47

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 802e3a3af141aca305765a9a2bd6f6d805b18937)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-Define-_GNU_SOURCE-when-needed.patch      | 115 +++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/package/safeclib/0003-Define-_GNU_SOURCE-when-needed.patch b/package/safeclib/0003-Define-_GNU_SOURCE-when-needed.patch
new file mode 100644
index 0000000000..cc9e580793
--- /dev/null
+++ b/package/safeclib/0003-Define-_GNU_SOURCE-when-needed.patch
@@ -0,0 +1,115 @@
+From 94c7b765202fe50894425364834beca79e52b255 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 28 Oct 2019 17:09:43 +0100
+Subject: [PATCH] Define _GNU_SOURCE when needed
+
+Define _GNU_SOURCE to fix build with musl otherwise we'll got the
+following build failures due to localtime_r, strnlen, gmtime_r and
+asctime_r being undefined:
+
+os/localtime_s.c:124:12: error: implicit declaration of function 'localtime_r'; did you mean 'localtime_s'? [-Werror=implicit-function-declaration]
+     dest = localtime_r(timer, dest);
+            ^~~~~~~~~~~
+
+io/gets_s.c:144:32: error: implicit declaration of function 'strnlen'; did you mean 'strlen'? [-Werror=implicit-function-declaration]
+         rsize_t len = (rsize_t)strnlen(dest, dmax);
+                                ^~~~~~~
+                                strlen
+
+An other option would be to define AC_GNU_SOURCE in the configure.ac but
+it seems that there is some handling of _GNU_SOURCE in
+safeclib_private.h
+
+Fixes:
+ - http://autobuild.buildroot.net/results/31a4b647ec0dcd9f517f313ec6c7c8f56da1ee47
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/rurban/safeclib/commit/94c7b765202fe50894425364834beca79e52b255]
+---
+ src/extmem/memzero_s.c | 2 ++
+ src/io/gets_s.c        | 2 ++
+ src/os/asctime_s.c     | 2 ++
+ src/os/ctime_s.c       | 2 ++
+ src/os/gmtime_s.c      | 2 ++
+ src/os/localtime_s.c   | 2 ++
+ 6 files changed, 12 insertions(+)
+
+diff --git a/src/extmem/memzero_s.c b/src/extmem/memzero_s.c
+index 75107215..20cb2784 100644
+--- a/src/extmem/memzero_s.c
++++ b/src/extmem/memzero_s.c
+@@ -31,6 +31,8 @@
+  *------------------------------------------------------------------
+  */
+ 
++#define _GNU_SOURCE
++
+ #ifdef FOR_DOXYGEN
+ #include "safe_mem_lib.h"
+ #else
+diff --git a/src/io/gets_s.c b/src/io/gets_s.c
+index 09350b3d..be875a1c 100644
+--- a/src/io/gets_s.c
++++ b/src/io/gets_s.c
+@@ -29,6 +29,8 @@
+  *------------------------------------------------------------------
+  */
+ 
++#define _GNU_SOURCE
++
+ #ifdef FOR_DOXYGEN
+ #include "safe_lib.h"
+ #else
+diff --git a/src/os/asctime_s.c b/src/os/asctime_s.c
+index 42669844..01cefd8f 100644
+--- a/src/os/asctime_s.c
++++ b/src/os/asctime_s.c
+@@ -29,6 +29,8 @@
+  *------------------------------------------------------------------
+  */
+ 
++#define _GNU_SOURCE
++
+ #ifdef FOR_DOXYGEN
+ #include "safe_lib.h"
+ #else
+diff --git a/src/os/ctime_s.c b/src/os/ctime_s.c
+index 01b31f63..7a1a138c 100644
+--- a/src/os/ctime_s.c
++++ b/src/os/ctime_s.c
+@@ -29,6 +29,8 @@
+  *------------------------------------------------------------------
+  */
+ 
++#define _GNU_SOURCE
++
+ #ifdef FOR_DOXYGEN
+ #include "safe_lib.h"
+ #else
+diff --git a/src/os/gmtime_s.c b/src/os/gmtime_s.c
+index ff9a0e24..cd8f064f 100644
+--- a/src/os/gmtime_s.c
++++ b/src/os/gmtime_s.c
+@@ -29,6 +29,8 @@
+  *------------------------------------------------------------------
+  */
+ 
++#define _GNU_SOURCE
++
+ #ifdef FOR_DOXYGEN
+ #include "safe_lib.h"
+ #else
+diff --git a/src/os/localtime_s.c b/src/os/localtime_s.c
+index 0ce3324b..92ea21b9 100644
+--- a/src/os/localtime_s.c
++++ b/src/os/localtime_s.c
+@@ -29,6 +29,8 @@
+  *------------------------------------------------------------------
+  */
+ 
++#define _GNU_SOURCE
++
+ #ifdef FOR_DOXYGEN
+ #include "safe_lib.h"
+ #else
