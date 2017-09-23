From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Sep 2017 16:44:09 +0200
Subject: [Buildroot] [git commit] openjpeg: Fix malloc poison issue
Message-ID: <20170923143906.81A648045D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19d80818654977948f32496cde2537719b150850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The malloc poison issue has been fixed upstream, this patch will thus only
be temporary.

Fixes the following autobuild issues

       sparc | http://autobuild.buildroot.net/results/c1b7a316ca2a4db49023f304dbc7fd5fed05bd9d
        bfin | http://autobuild.buildroot.net/results/031ece7a72e76a9155938cb283de859bd12a8171
         sh4 | http://autobuild.buildroot.net/results/88664451f71c12ccd94e874d408fbb680bea1695
      xtensa | http://autobuild.buildroot.net/results/fbede64a5a86d4868b6da0ab1275e75803235af0
     powerpc | http://autobuild.buildroot.net/results/6c641650509048039b18fbeb010dbca0f0fc5292
microblazeel | http://autobuild.buildroot.net/results/fa2d5272b2db73cbfa441ead9250157c5626ab15
    mips64el | http://autobuild.buildroot.net/results/fc96f6628f71e05d9a74e0e13e50178d29a2c495
         sh4 | http://autobuild.buildroot.net/results/a6d6a6dcb9b4fa250edaaf5935762c5820457b23
      x86_64 | http://autobuild.buildroot.net/results/47b4ca2cc661582d86830b9353a6c8af86e4ba35
         arc | http://autobuild.buildroot.net/results/08e2e4eca6c3dbde8116a649dbf46e52ded45d10
         arc | http://autobuild.buildroot.net/results/899fa044aab7ee28acfa71544f2105da4a5c97d5
         arm | http://autobuild.buildroot.net/results/6016f6885b21d6e8c6199a6833c7acce6210ecc6
         arm | http://autobuild.buildroot.net/results/adbb3c76497e89161535c711de98809a0fa168a7
        or1k | http://autobuild.buildroot.net/results/de3ef69a72d2c2082e202fbed702c53a51274fef
    mips64el | http://autobuild.buildroot.net/results/39b186b13001a810e0992b52321f1015b445d2fd
      x86_64 | http://autobuild.buildroot.net/results/22c6a29a1ded6aedf01adfdfcf26302248dba80c
         arm | http://autobuild.buildroot.net/results/b62c54b727eb5f576c4a517a69c495b537c3b69a
        m68k | http://autobuild.buildroot.net/results/a826561c5786be5f0088b50b633210593e23ffff
         arm | http://autobuild.buildroot.net/results/d32ec927a5e4d5644cb3641014bcf6ebe5c14490

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0003-avoid-malloc-poisoning-issue.patch        | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch b/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch
new file mode 100644
index 0000000..8463e20
--- /dev/null
+++ b/package/openjpeg/0003-avoid-malloc-poisoning-issue.patch
@@ -0,0 +1,54 @@
+From 51a1dcaa6ed5713520dca36fc58cd9240c08b7ca Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 7 Sep 2017 17:52:59 +0200
+Subject: [PATCH] Avoid malloc poisoning issue when including <pthread.h> of
+ uclibc (#1013)
+
+Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
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
