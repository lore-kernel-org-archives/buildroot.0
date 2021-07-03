From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 3 Jul 2021 23:47:29 +0200
Subject: [Buildroot] [git commit] package/libgpg-error: fix build issue
 following 1.42 bump
Message-ID: <20210703211617.643A08F6B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fab6a64b52cdd92e0d20331c4ec5eff9f293429a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The build failed with gazillions of:

"gpg-error.h:1211:2: error: stray '\' in program"

This is already fixed by upstream commit
33593864cd54143db594c4237bba41e14179061c, which we backport. It is
backported as patch 0001, and the existing 0001 renamed to 0002, as it
appears later in the libgpg-error Git history.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...eneration-of-lock-obj-pub.native.h-for-cr.patch | 34 ++++++++++++++++++++++
 ....patch => 0002-build-Fix-disable-threads.patch} |  4 +--
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch b/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
new file mode 100644
index 0000000000..621f070ee2
--- /dev/null
+++ b/package/libgpg-error/0001-build-Fix-generation-of-lock-obj-pub.native.h-for-cr.patch
@@ -0,0 +1,34 @@
+From 7350874f6f62314af4c8ec1973c91d305a6f4ddc Mon Sep 17 00:00:00 2001
+From: David Michael <fedora.dm0@gmail.com>
+Date: Fri, 26 Mar 2021 16:06:50 +0900
+Subject: [PATCH] build: Fix generation of lock-obj-pub.native.h for cross
+ build.
+
+* src/gen-lock-obj.sh: Capture echo output with quotes.
+
+--
+
+Fixes-commit: 99ae862a96a569724f49a604ebb7d3f6d2c2d374
+Signed-off-by: David Michael <fedora.dm0@gmail.com>
+Upstream: 33593864cd54143db594c4237bba41e14179061c
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ src/gen-lock-obj.sh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gen-lock-obj.sh b/src/gen-lock-obj.sh
+index a710f0c..258eec6 100755
+--- a/src/gen-lock-obj.sh
++++ b/src/gen-lock-obj.sh
+@@ -38,7 +38,7 @@
+ #     AWK=gawk ./gen-lock-obj.sh
+ #
+ 
+-if test -n `echo -n`; then
++if test -n "`echo -n`"; then
+     ECHO_C='\c'
+     ECHO_N=''
+ else
+-- 
+2.31.1
+
diff --git a/package/libgpg-error/0001-build-Fix-disable-threads.patch b/package/libgpg-error/0002-build-Fix-disable-threads.patch
similarity index 92%
rename from package/libgpg-error/0001-build-Fix-disable-threads.patch
rename to package/libgpg-error/0002-build-Fix-disable-threads.patch
index 2d101aad9b..6ed0f83070 100644
--- a/package/libgpg-error/0001-build-Fix-disable-threads.patch
+++ b/package/libgpg-error/0002-build-Fix-disable-threads.patch
@@ -1,4 +1,4 @@
-From 220a427b4f997ef6af1b2d4e82ef1dc96e0cd6ff Mon Sep 17 00:00:00 2001
+From 7ede0d4ce19e0ed14cd1cec81ba7df4e467f1eeb Mon Sep 17 00:00:00 2001
 From: NIIBE Yutaka <gniibe@fsij.org>
 Date: Mon, 21 Jun 2021 12:16:20 +0900
 Subject: [PATCH] build: Fix --disable-threads.
@@ -35,5 +35,5 @@ index 258eec6..014667f 100755
  ## Local Variables:
  ## mode: c
 -- 
-2.11.0
+2.31.1
 
