From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 13:17:52 +0200
Subject: [Buildroot] [git commit] trace-cmd: fix build with musl
Message-ID: <20170701111640.14A9A81DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be937fa82251ce565e33215c6937f418b22966b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch adding missing header.

Fixes:
http://autobuild.buildroot.net/results/21f/21f6037df667918be5e4c8a91f01ddf1552915d3/
http://autobuild.buildroot.net/results/303/30369e328189cfc5d0e281a479dea48e6dcf9903/
http://autobuild.buildroot.net/results/7eb/7eb976b9ada0c364d2c834c91b7a09e6cfc54153/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-trace-listen-add-missing-header.patch     | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/trace-cmd/0001-trace-listen-add-missing-header.patch b/package/trace-cmd/0001-trace-listen-add-missing-header.patch
new file mode 100644
index 0000000..350e523
--- /dev/null
+++ b/package/trace-cmd/0001-trace-listen-add-missing-header.patch
@@ -0,0 +1,38 @@
+From c68c868b573acc73e144312326750be2ed96632f Mon Sep 17 00:00:00 2001
+From: Baruch Siach <baruch@tkos.co.il>
+Date: Thu, 29 Jun 2017 14:43:19 +0300
+Subject: [PATCH] trace-listen: add missing header
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The PATH_MAX macro requires the limits.h header. This fixes build with musl
+libc:
+
+.../trace-cmd-trace-cmd-v2.6.1/trace-listen.c: In function ???make_pid_name???:
+.../trace-cmd-trace-cmd-v2.6.1/trace-listen.c:167:16: error: ???PATH_MAX??? undeclared (first use in this function)
+  snprintf(buf, PATH_MAX, VAR_RUN_DIR "/trace-cmd-net.pid");
+                ^~~~~~~~
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: https://lkml.org/lkml/2017/6/29/286
+
+ trace-listen.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/trace-listen.c b/trace-listen.c
+index 17ff9d8c160c..838d6bcf3649 100644
+--- a/trace-listen.c
++++ b/trace-listen.c
+@@ -31,6 +31,7 @@
+ #include <fcntl.h>
+ #include <signal.h>
+ #include <errno.h>
++#include <limits.h>
+ 
+ #include "trace-local.h"
+ #include "trace-msg.h"
+-- 
+2.11.0
+
