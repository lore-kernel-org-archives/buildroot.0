From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Dec 2018 19:49:56 +0200
Subject: [Buildroot] [PATCH] package/sngrep: fix build with musl libc
Message-ID: <04bdf53b08f3f7c511f730fb1bd6bd61f4966115.1546192196.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add upstream patch fixing typo that causes build failure under musl,
where stdin is constant.

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 ...0001-capture-fix-typo-in-FILE-object.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/sngrep/0001-capture-fix-typo-in-FILE-object.patch

diff --git a/package/sngrep/0001-capture-fix-typo-in-FILE-object.patch b/package/sngrep/0001-capture-fix-typo-in-FILE-object.patch
new file mode 100644
index 000000000000..ec8a0f5dc5bc
--- /dev/null
+++ b/package/sngrep/0001-capture-fix-typo-in-FILE-object.patch
@@ -0,0 +1,43 @@
+From 604f6d0ce2ec42ac494d76c95e68850ea6e7da8f Mon Sep 17 00:00:00 2001
+From: Sebastian Kemper <sebastian_ml@gmx.net>
+Date: Sun, 4 Nov 2018 16:58:00 +0100
+Subject: [PATCH] capture: fix typo in FILE object
+
+FILE *fstdin is defined, but when calling freopen() stdin is used instead
+of fstdin.
+
+This causes the compile to fail:
+
+  CC       sngrep-capture.o
+capture.c: In function 'capture_offline':
+capture.c:194:21: error: assignment of read-only variable 'stdin'
+         if (!(stdin = freopen("/dev/tty", "r", stdin))) {
+                     ^
+make[5]: *** [Makefile:519: sngrep-capture.o] Error 1
+
+This commit fixes the typo.
+
+Signed-off-by: Sebastian Kemper <sebastian_ml@gmx.net>
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Upstream status: commit 604f6d0ce2ec
+
+ src/capture.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/capture.c b/src/capture.c
+index 911c35f43a35..a799413e2b0e 100644
+--- a/src/capture.c
++++ b/src/capture.c
+@@ -191,7 +191,7 @@ capture_offline(const char *infile, const char *outfile)
+ 
+     // Reopen tty for ncurses after pcap have used stdin
+     if (!strncmp(infile, "/dev/stdin", 10)) {
+-        if (!(stdin = freopen("/dev/tty", "r", stdin))) {
++        if (!(fstdin = freopen("/dev/tty", "r", stdin))) {
+             fprintf(stderr, "Failed to reopen tty while using stdin for capture.");
+             return 1;
+         }
+-- 
+2.19.2
+
-- 
2.19.2
