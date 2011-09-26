From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 26 Sep 2011 21:35:12 +0200
Subject: [Buildroot] [git commit] busybox: add 1.19.2 tail fix
Message-ID: <20110926204530.248158DA7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f83cacf3b5e3f8b32a16f7557b29241f5a2da246
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../busybox-1.19.2/busybox-1.19.2-tail.patch       |   43 ++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)

diff --git a/package/busybox/busybox-1.19.2/busybox-1.19.2-tail.patch b/package/busybox/busybox-1.19.2/busybox-1.19.2-tail.patch
new file mode 100644
index 0000000..f3cc798
--- /dev/null
+++ b/package/busybox/busybox-1.19.2/busybox-1.19.2-tail.patch
@@ -0,0 +1,43 @@
+--- busybox-1.19.2/coreutils/tail.c
++++ busybox-1.19.2-tail/coreutils/tail.c
+@@ -203,7 +203,7 @@ int tail_main(int argc, char **argv)
+ 		int fd = fds[i];
+ 
+ 		if (ENABLE_FEATURE_FANCY_TAIL && fd < 0)
+-			continue; /* may happen with -E */
++			continue; /* may happen with -F */
+ 
+ 		if (nfiles > header_threshhold) {
+ 			tail_xprint_header(fmt, argv[i]);
+@@ -252,14 +252,14 @@ int tail_main(int argc, char **argv)
+ 		 * Used only by +N code ("start from Nth", 1-based): */
+ 		seen = 1;
+ 		newlines_seen = 0;
+-		while ((nread = tail_read(fd, buf, tailbufsize-taillen)) > 0) {
++		while ((nread = tail_read(fd, buf, tailbufsize - taillen)) > 0) {
+ 			if (G.from_top) {
+ 				int nwrite = nread;
+ 				if (seen < count) {
+ 					/* We need to skip a few more bytes/lines */
+ 					if (COUNT_BYTES) {
+ 						nwrite -= (count - seen);
+-						seen = count;
++						seen += nread;
+ 					} else {
+ 						char *s = buf;
+ 						do {
+--- busybox-1.19.2/testsuite/tail.tests
++++ busybox-1.19.2-tail/testsuite/tail.tests
+@@ -14,4 +14,12 @@ testing "tail: +N with N > file length" 
+ 	"0\n" \
+ 	"" "qw"
+ 
++testing "tail: -c +N with largish N" \
++	"
++	dd if=/dev/zero bs=16k count=1 2>/dev/null | tail -c +8200 | wc -c;
++	dd if=/dev/zero bs=16k count=1 2>/dev/null | tail -c +8208 | wc -c;
++	" \
++	"8185\n8177\n" \
++	"" ""
++
+ exit $FAILCOUNT
