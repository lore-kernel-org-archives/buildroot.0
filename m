From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Apr 2010 10:38:08 +0200
Subject: [Buildroot] [git commit master] busybox: add 1.16.1 sed fix
Message-ID: <20100421083832.D01F820C1A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f935368cc0d5c19893d7262ce95d13768b143100
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/busybox-1.16.1-sed.patch |   47 ++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.1-sed.patch

diff --git a/package/busybox/busybox-1.16.1-sed.patch b/package/busybox/busybox-1.16.1-sed.patch
new file mode 100644
index 0000000..56d2304
--- /dev/null
+++ b/package/busybox/busybox-1.16.1-sed.patch
@@ -0,0 +1,47 @@
+diff -urpN busybox-1.16.1/editors/sed.c busybox-1.16.1-sed/editors/sed.c
+--- busybox-1.16.1/editors/sed.c	2010-03-28 13:43:35.000000000 -0400
++++ busybox-1.16.1-sed/editors/sed.c	2010-04-20 13:33:26.301975462 -0400
+@@ -936,7 +936,15 @@ static void process_files(void)
+ 		/* Skip blocks of commands we didn't match */
+ 		if (sed_cmd->cmd == '{') {
+ 			if (sed_cmd->invert ? matched : !matched) {
+-				while (sed_cmd->cmd != '}') {
++				unsigned nest_cnt = 0;
++				while (1) {
++					if (sed_cmd->cmd == '{')
++						nest_cnt++;
++					if (sed_cmd->cmd == '}') {
++						nest_cnt--;
++						if (nest_cnt == 0)
++							break;
++					}
+ 					sed_cmd = sed_cmd->next;
+ 					if (!sed_cmd)
+ 						bb_error_msg_and_die("unterminated {");
+@@ -1031,7 +1039,7 @@ static void process_files(void)
+ 		case 'c':
+ 			/* Only triggers on last line of a matching range. */
+ 			if (!sed_cmd->in_match)
+-				sed_puts(sed_cmd->string, NO_EOL_CHAR);
++				sed_puts(sed_cmd->string, '\n');
+ 			goto discard_line;
+ 
+ 		/* Read file, append contents to output */
+diff -urpN busybox-1.16.1/testsuite/sed.tests busybox-1.16.1-sed/testsuite/sed.tests
+--- busybox-1.16.1/testsuite/sed.tests	2010-03-19 22:58:07.000000000 -0400
++++ busybox-1.16.1-sed/testsuite/sed.tests	2010-04-20 13:33:26.301975462 -0400
+@@ -248,4 +248,14 @@ testing "sed beginning (^) matches only 
+ 	">/usr</>lib<\n" "" \
+ 	"/usr/lib\n"
+ 
++testing "sed c" \
++	"sed 'crepl'" \
++	"repl\nrepl\n" "" \
++	"first\nsecond\n"
++
++testing "sed nested {}s" \
++	"sed '/asd/ { p; /s/ { s/s/c/ }; p; q }'" \
++	"qwe\nasd\nacd\nacd\n" "" \
++	"qwe\nasd\nzxc\n"
++
+ exit $FAILCOUNT
-- 
1.6.3.3
