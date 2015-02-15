From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Feb 2015 23:20:12 +0100
Subject: [Buildroot] [git commit] qt5bse: configure: fix gold linker
	detection
Message-ID: <20150215222118.11DE98079A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ea4501da20d7aaee1b955c84874168a953e3b637
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/92c/92c3fb4ddb934115b228652bb8c972bb7459bb40/

While the -fuse-ld=gold flag is related to linking, it is an argument to the
compiler driver to tell it what linker to execute, NOT an option to tell the
linker to behave differently.

So it shouldn't get prefixed with -Wl when passed though the compiler driver.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...nfigure-fix-gold-linker-support-detection.patch |   36 ++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)

diff --git a/package/qt5/qt5base/0006-configure-fix-gold-linker-support-detection.patch b/package/qt5/qt5base/0006-configure-fix-gold-linker-support-detection.patch
new file mode 100644
index 0000000..053d429
--- /dev/null
+++ b/package/qt5/qt5base/0006-configure-fix-gold-linker-support-detection.patch
@@ -0,0 +1,36 @@
+From 6e750053cd6d183173a4c39f2b1080b3c9814d76 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Sun, 15 Feb 2015 22:58:07 +0100
+Subject: [PATCH] configure: fix gold linker support detection
+
+Submitted upstream: https://bugreports.qt.io/browse/QTBUG-44487
+
+While the -fuse-ld=gold flag is related to linking, it is an argument to the
+compiler driver to tell it what linker to execute, NOT an option to tell the
+linker to behave differently.
+
+So it shouldn't get prefixed with -Wl when passed though the compiler driver.
+
+Fixes http://autobuild.buildroot.net/results/92c/92c3fb4ddb934115b228652bb8c972bb7459bb40/
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 043d9fc..987d7f0 100755
+--- a/configure
++++ b/configure
+@@ -3263,7 +3263,7 @@ fi
+ 
+ # auto-detect -fuse-ld=gold support
+ if [ "$CFG_USE_GOLD_LINKER" != "no" ]; then
+-    if linkerSupportsFlag $TEST_COMPILER -fuse-ld=gold; then
++    if compilerSupportsFlag $TEST_COMPILER -fuse-ld=gold; then
+        CFG_USE_GOLD_LINKER=yes
+     else
+         if [ "$CFG_USE_GOLD_LINKER" = "yes" ]; then
+-- 
+2.1.3
+
