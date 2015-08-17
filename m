From: Brendan Heading <brendanheading@gmail.com>
Date: Mon, 17 Aug 2015 22:51:33 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/canfestival: fix musl compilation
Message-ID: <1439848293-26836-1-git-send-email-brendanheading@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes: http://autobuild.buildroot.net/results/75a/75aa6e7e4f3dcd74e4b65496060328ec7bd0e747/

ANSI signal handlers take an int parameter, not sigval_t.

Upstream-status: pending

---
v1 -> v2 - added missing link to autobuild failure in commit comment
---

Signed-off-by: Brendan Heading <brendanheading@gmail.com>
---
 .../canfestival/0003-fix-musl-compilation.patch    | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 package/canfestival/0003-fix-musl-compilation.patch

diff --git a/package/canfestival/0003-fix-musl-compilation.patch b/package/canfestival/0003-fix-musl-compilation.patch
new file mode 100644
index 0000000..dfe16a7
--- /dev/null
+++ b/package/canfestival/0003-fix-musl-compilation.patch
@@ -0,0 +1,22 @@
+# HG changeset patch
+# User Brendan Heading <brendanheading@gmail.com>
+# Date 1439845818 -3600
+#      Mon Aug 17 22:10:18 2015 +0100
+# Node ID 7d62beec4f813074ba250231762f4b84395cc354
+# Parent  8bfe0ac00cdb4d473664fcbf1228a0f6a42eee15
+Fix MUSL compilation issue
+
+signal handler parameter fixed to be int instead of sigval_t.
+
+diff -r 8bfe0ac00cdb -r 7d62beec4f81 drivers/timers_unix/timers_unix.c
+--- a/drivers/timers_unix/timers_unix.c	Mon Aug 03 18:01:58 2015 +0200
++++ b/drivers/timers_unix/timers_unix.c	Mon Aug 17 22:10:18 2015 +0100
+@@ -33,7 +33,7 @@
+ 	}
+ }
+ 
+-void timer_notify(sigval_t val)
++void timer_notify(int val)
+ {
+ 	if(gettimeofday(&last_sig,NULL)) {
+ 		perror("gettimeofday()");
-- 
2.4.3
