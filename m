From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 11:01:48 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/zstd: fix build
 without st_mtime
Message-ID: <20200722085741.74DF3812E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08ccb134de8bc49042df75480bd3113a9ad3d75a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Fixes:
 - http://autobuild.buildroot.org/results/be902c5d110f37bce622a2215191f155b7d3e7e0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 267ce1718edccacdf02bc68b651ba5f8ffe72fa9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...rograms-util.c-fix-build-without-st_mtime.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch b/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch
new file mode 100644
index 0000000000..0f735b8843
--- /dev/null
+++ b/package/zstd/0001-programs-util.c-fix-build-without-st_mtime.patch
@@ -0,0 +1,40 @@
+From 26d01bdb26f1c7487ad4ba0151221dfe28cd878d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 Jul 2020 21:19:14 +0200
+Subject: [PATCH] programs/util.c: fix build without st_mtime
+
+Since version 1.4.5 and commit
+5af8cb7aea8d890b4801e50e5274371510f2cf33, if st_mtime is not defined,
+programs/util.c uses utime without including utime.h which will raise
+the following build failure on some of the buildroot autobuilders:
+
+util.c: In function 'UTIL_setFileStat':
+util.c:161:24: error: storage size of 'timebuf' isn't known
+         struct utimbuf timebuf;
+                        ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/be902c5d110f37bce622a2215191f155b7d3e7e0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/facebook/zstd/pull/2246]
+---
+ programs/util.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/programs/util.c b/programs/util.c
+index a0d45745..2493a4ad 100644
+--- a/programs/util.c
++++ b/programs/util.c
+@@ -28,7 +28,7 @@ extern "C" {
+ #  include <io.h>         /* _chmod */
+ #else
+ #  include <unistd.h>     /* chown, stat */
+-#  if PLATFORM_POSIX_VERSION < 200809L
++#  if PLATFORM_POSIX_VERSION < 200809L || !defined(st_mtime)
+ #    include <utime.h>    /* utime */
+ #  else
+ #    include <fcntl.h>    /* AT_FDCWD */
+-- 
+2.27.0
+
