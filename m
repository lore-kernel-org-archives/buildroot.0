From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 31 Jul 2016 20:22:20 +0200
Subject: [Buildroot] [git commit] triggerhappy: unbreak build against 4.7+
	kernel headers
Message-ID: <20160731183025.3BBA5802F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=009564314339a16828c7ae121b56dc1f1bd27aaa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.org/results/3d0/3d07de291ec64a16d03e10f0cf1faeb19d546412/
http://autobuild.buildroot.org/results/b03/b03500e7d85786c6eee8f0adc38801340129aa14/
http://autobuild.buildroot.org/results/dd0/dd05caf0db318a9287d239cc6fa5470ccdc2ce7c/
http://autobuild.buildroot.org/results/76b/76bb000d041bd0828d15aa04138e222a4773ce94/

Triggerhappy used the wrong constants for array sizes, causing a compilation
error about out of array bounds initializers with the SW_PEN_INSERTED switch
event added in 4.7. Fix it by using the correct constants (<foo>_CNT) instead.

Patch submitted upstream: https://github.com/wertarbyte/triggerhappy/pull/12

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...h-use-correct-array-sizes-to-fix-building.patch | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/package/triggerhappy/0001-eventtable.h-use-correct-array-sizes-to-fix-building.patch b/package/triggerhappy/0001-eventtable.h-use-correct-array-sizes-to-fix-building.patch
new file mode 100644
index 0000000..80f2640
--- /dev/null
+++ b/package/triggerhappy/0001-eventtable.h-use-correct-array-sizes-to-fix-building.patch
@@ -0,0 +1,66 @@
+From d3cfa80631a7e314fee9b2e0822e403fcf2a5c5c Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sun, 31 Jul 2016 10:28:43 +0200
+Subject: [PATCH] eventtable.h: use correct array sizes to fix building against
+ 4.7+ headers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+During the 4.7 development cycle, commit 9a9b6aa6a8 (Input: add
+SW_PEN_INSERTED define) got added, which has the same numerical value as
+SW_MAX:
+
++#define SW_PEN_INSERTED                0x0f  /* set = pen inserted */
++#define SW_MAX                 0x0f
+
+This breaks the build as the SW_NAME array is sized using the SW_MAX macro:
+
+In file included from eventtable.h:21:0,
+                 from eventnames.c:11:
+evtable_SW.inc:17:1: error: array index in initializer exceeds array bounds
+ EV_MAP(SW_PEN_INSERTED),
+ ^
+evtable_SW.inc:17:1: error: (near initialization for ???SW_NAME???)
+
+The arrays should be sized using the <foo>_CNT (which is MAX+1) macros
+instead of <foo>_MAX.  These got added during the 2.6.24 development cycle,
+so it should be safe to do so unconditially:
+
+commit 7b19ada2ed3c1eccb9fe94d74b05e1428224663d
+Author: Jiri Slaby <jirislaby@gmail.com>
+Date:   Thu Oct 18 23:40:32 2007 -0700
+
+    get rid of input BIT* duplicate defines
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ eventtable.h | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/eventtable.h b/eventtable.h
+index 349d9d7..7cd99aa 100644
+--- a/eventtable.h
++++ b/eventtable.h
+@@ -8,15 +8,15 @@
+ 
+ #define EV_MAP( N ) [ N ] = #N
+ 
+-static const char *EV_NAME[EV_MAX] = {
++static const char *EV_NAME[EV_CNT] = {
+ #include "evtable_EV.inc"
+ };
+ 
+-static const char *KEY_NAME[KEY_MAX] = {
++static const char *KEY_NAME[KEY_CNT] = {
+ #include "evtable_KEY.inc"
+ #include "evtable_BTN.inc"
+ };
+ 
+-static const char *SW_NAME[SW_MAX] = {
++static const char *SW_NAME[SW_CNT] = {
+ #include "evtable_SW.inc"
+ };
+-- 
+2.8.1
+
