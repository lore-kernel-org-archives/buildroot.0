From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 24 Apr 2017 10:46:32 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] libnspr: use __nios2__
	instead of nios2
Message-ID: <20170424193336.2D394800A5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d302e43c944408064259b85165deadad2bfe5ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Our patch adding nios2 support to libnspr uses the built-in compiler
define "nios2". However, this doesn't work with C++11, where only the
__nios2__ define is available. Since __nios2__ is always available,
use that instead:

$ ./output/host/usr/bin/nios2-linux-gcc -dM -E - < /dev/null | grep -E "( nios2 | __nios2__ )"

$ ./output/host/usr/bin/nios2-linux-gcc -std=c++11 -x c++ -dM -E - < /dev/null | grep -E "( nios2 | __nios2__ )"

Patch 0001-nios2.patch is therefore changed to use __nios2__ (the rest
of the change noise is due to using quilt to format the patch). Patch
0002-microblaze.patch is simply updated to apply correctly on top of
the modified 0001-nios2.patch.

This fixes the build of the poppler library on nios2. It is built with
-std=c++11, and includes nspr headers (through nss), causing a build
issue.

Fixes:

  http://autobuild.buildroot.net/results/9fee58076157d814616fa0da51afde8da21a8973/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 9a521546ed553d2be23740bbf1a7aa05bce9eb09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnspr/0001-nios2.patch      | 18 ++++++++++--------
 package/libnspr/0002-microblaze.patch |  2 +-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/libnspr/0001-nios2.patch b/package/libnspr/0001-nios2.patch
index 22cacd7..e10e7e9 100644
--- a/package/libnspr/0001-nios2.patch
+++ b/package/libnspr/0001-nios2.patch
@@ -3,14 +3,15 @@ Add Nios-II support
 [Gustavo: update for nspr 4.10.9]
 Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 
-diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg nspr-4.10.9/nspr/pr/include/md/_linux.cfg
---- nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg	2015-10-03 08:11:43.229387215 -0300
-+++ nspr-4.10.9/nspr/pr/include/md/_linux.cfg	2015-10-03 08:11:55.277798841 -0300
+Index: b/nspr/pr/include/md/_linux.cfg
+===================================================================
+--- a/nspr/pr/include/md/_linux.cfg
++++ b/nspr/pr/include/md/_linux.cfg
 @@ -1017,6 +1017,51 @@
  #define PR_BYTES_PER_WORD_LOG2   2
  #define PR_BYTES_PER_DWORD_LOG2  3
  
-+#elif defined(nios2)
++#elif defined(__nios2__)
 +
 +#define IS_LITTLE_ENDIAN 1
 +#undef  IS_BIG_ENDIAN
@@ -58,14 +59,15 @@ diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.cfg nspr-4.10.9/nspr/pr/in
  #else
  
  #error "Unknown CPU architecture"
-diff -Nura nspr-4.10.9.orig/nspr/pr/include/md/_linux.h nspr-4.10.9/nspr/pr/include/md/_linux.h
---- nspr-4.10.9.orig/nspr/pr/include/md/_linux.h	2015-10-03 08:11:43.229387215 -0300
-+++ nspr-4.10.9/nspr/pr/include/md/_linux.h	2015-10-03 08:12:22.474728003 -0300
+Index: b/nspr/pr/include/md/_linux.h
+===================================================================
+--- a/nspr/pr/include/md/_linux.h
++++ b/nspr/pr/include/md/_linux.h
 @@ -57,6 +57,8 @@
  #define _PR_SI_ARCHITECTURE "m32r"
  #elif defined(__or1k__)
  #define _PR_SI_ARCHITECTURE "or1k"
-+#elif defined(nios2)
++#elif defined(__nios2__)
 +#define _PR_SI_ARCHITECTURE "nios2"
  #else
  #error "Unknown CPU architecture"
diff --git a/package/libnspr/0002-microblaze.patch b/package/libnspr/0002-microblaze.patch
index 7fd650c..7cf1f0d 100644
--- a/package/libnspr/0002-microblaze.patch
+++ b/package/libnspr/0002-microblaze.patch
@@ -74,6 +74,6 @@ Index: b/nspr/pr/include/md/_linux.h
  #define _PR_SI_ARCHITECTURE "or1k"
 +#elif defined(__microblaze__)
 +#define _PR_SI_ARCHITECTURE "microblaze"
- #elif defined(nios2)
+ #elif defined(__nios2__)
  #define _PR_SI_ARCHITECTURE "nios2"
  #else
