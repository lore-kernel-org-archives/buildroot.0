From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Fri,  8 Sep 2017 08:45:10 +0200
Subject: [Buildroot] [PATCH 1/1] Openjpeg: Fix malloc poison issue,
	add C++ and threads dependencies
Message-ID: <20170908064510.4075-1-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The malloc poison issue has been fixed upstream, this patch will thus only
be temporary.

Some of the autobuild issues related to missing g++ compilers
and missing threading libraries.  Thus the dependency should solve that.

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 .../0003-avoid-malloc-poisoning-issue.patch        | 53 ++++++++++++++++++++++
 package/openjpeg/Config.in                         |  5 ++
 2 files changed, 58 insertions(+)
 create mode 100644 package/openjpeg/0003-avoid-malloc-poisoning-issue.patch

diff --git a/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch b/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch
new file mode 100644
index 0000000000..f9eeb26184
--- /dev/null
+++ b/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch
@@ -0,0 +1,53 @@
+From 51a1dcaa6ed5713520dca36fc58cd9240c08b7ca Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 7 Sep 2017 17:52:59 +0200
+Subject: [PATCH] Avoid malloc poisoning issue when including <pthread.h> of
+ uclibc (#1013)
+
+---
+ src/lib/openjp2/thread.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/openjp2/thread.c b/src/lib/openjp2/thread.c
+index 8b56aa4d5..af33c2c80 100644
+--- a/src/lib/openjp2/thread.c
++++ b/src/lib/openjp2/thread.c
+@@ -29,9 +29,6 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
+ 
+-#include "opj_includes.h"
+-
+-#include "thread.h"
+ #include <assert.h>
+ 
+ #ifdef MUTEX_win32
+@@ -46,6 +43,8 @@
+ #include <windows.h>
+ #include <process.h>
+ 
++#include "opj_includes.h"
++
+ OPJ_BOOL OPJ_CALLCONV opj_has_thread_support(void)
+ {
+     return OPJ_TRUE;
+@@ -289,6 +288,10 @@ void opj_thread_join(opj_thread_t* thread)
+ #include <stdlib.h>
+ #include <unistd.h>
+ 
++/* Moved after all system includes, and in particular pthread.h, so as to */
++/* avoid poisoning issuing with malloc() use in pthread.h with ulibc (#1013) */
++#include "opj_includes.h"
++
+ OPJ_BOOL OPJ_CALLCONV opj_has_thread_support(void)
+ {
+     return OPJ_TRUE;
+@@ -425,6 +428,8 @@ void opj_thread_join(opj_thread_t* thread)
+ #else
+ /* Stub implementation */
+ 
++#include "opj_includes.h"
++
+ OPJ_BOOL OPJ_CALLCONV opj_has_thread_support(void)
+ {
+     return OPJ_FALSE;
diff --git a/package/openjpeg/Config.in b/package/openjpeg/Config.in
index 738999fed7..65a629f6e9 100644
--- a/package/openjpeg/Config.in
+++ b/package/openjpeg/Config.in
@@ -1,7 +1,12 @@
 config BR2_PACKAGE_OPENJPEG
 	bool "openjpeg"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The OpenJPEG library is an open-source JPEG 2000 codec
 	  written in C.
 
 	  http://www.openjpeg.org
+
+comment "openjpeg needs a toolchain w/ C++, threads"
+	depends on !(BR2_INSTALL_LIBSTDCPP && BR2_TOOLCHAIN_HAS_THREADS)
-- 
2.11.0
