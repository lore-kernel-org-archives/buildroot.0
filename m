From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Nov 2015 23:45:32 +0100
Subject: [Buildroot] [git commit] ushare: fix linking issue with gcc 5.x
Message-ID: <20151116224600.D85988050E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=66e28e98151d10e832645076eab77612714410f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/1d4/1d4d621f3bd7862a75bd7e95e275ccb6694b54c9/
http://autobuild.buildroot.net/results/140/140767a7437b60a62f553ab49c104c37a4949c6c/
http://autobuild.buildroot.net/results/a88/a88ae349d4d7cdff4f15c8ad9e3a1eac74dc6c4b/
http://autobuild.buildroot.net/results/599/59946c728593502e4a17cb7e2d75eabac54db537/

And many more.

GCC5 defaults to -std=gnu11, which has different semantics for inline than
previous versions:

https://gcc.gnu.org/gcc-5/porting_to.html

Which causes linker issues when display_headers() and start_log() are
referenced from other files.  There's no real reason why these needs to be
inline, so just drop the keyword.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-ushare-fix-building-with-gcc-5.x.patch    |   49 ++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/package/ushare/0002-ushare-fix-building-with-gcc-5.x.patch b/package/ushare/0002-ushare-fix-building-with-gcc-5.x.patch
new file mode 100644
index 0000000..abef81f
--- /dev/null
+++ b/package/ushare/0002-ushare-fix-building-with-gcc-5.x.patch
@@ -0,0 +1,49 @@
+From 6abc52190accc8d8b17455420e234a1d7dc7ba55 Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 16 Nov 2015 23:15:27 +0100
+Subject: [PATCH] ushare: fix building with gcc 5.x
+
+GCC5 defaults to -std=gnu11, which has different semantics for inline than
+previous versions:
+
+https://gcc.gnu.org/gcc-5/porting_to.html
+
+Which causes linker issues when display_headers() and start_log() are
+referenced from other files.  There's no real reason why these needs to be
+inline, so just drop the keyword.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/trace.c  | 2 +-
+ src/ushare.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/trace.c b/src/trace.c
+index 50729ef..4e314ef 100644
+--- a/src/trace.c
++++ b/src/trace.c
+@@ -57,7 +57,7 @@ print_log (log_level level, const char *format, ...)
+   va_end (va);
+ }
+ 
+-inline void
++void
+ start_log (void)
+ {
+   openlog (PACKAGE_NAME, LOG_PID, LOG_DAEMON);
+diff --git a/src/ushare.c b/src/ushare.c
+index b64451e..af46e78 100644
+--- a/src/ushare.c
++++ b/src/ushare.c
+@@ -496,7 +496,7 @@ reload_config (int s __attribute__ ((unused)))
+   }
+ }
+ 
+-inline void
++void
+ display_headers (void)
+ {
+   printf (_("%s (version %s), a lightweight UPnP A/V and DLNA Media Server.\n"),
+-- 
+2.1.4
+
