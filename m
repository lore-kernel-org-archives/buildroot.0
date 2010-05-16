From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 16 May 2010 22:30:22 +0200
Subject: [Buildroot] [git commit master] busybox: 1.16.1 fixes for dhcpd and
	sed
Message-ID: <20100517052223.C518112E85D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7bb2b4826e9b129f6b1b1bba2847b15a10641a95
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                    |    2 +
 package/busybox/busybox-1.16.1-dhcpd.patch |   12 ++++++
 package/busybox/busybox-1.16.1-sed.patch   |   56 ++++++++++++++++++++++++---
 3 files changed, 63 insertions(+), 7 deletions(-)
 create mode 100644 package/busybox/busybox-1.16.1-dhcpd.patch

diff --git a/CHANGES b/CHANGES
index 564a8d5..76f5651 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,6 +2,8 @@
 
 	Fixes all over the tree.
 
+	Updated/fixed packages: busybox
+
 2010.05-rc2, Released May 11th, 2010:
 
 	Fixes all over the tree.
diff --git a/package/busybox/busybox-1.16.1-dhcpd.patch b/package/busybox/busybox-1.16.1-dhcpd.patch
new file mode 100644
index 0000000..6867e24
--- /dev/null
+++ b/package/busybox/busybox-1.16.1-dhcpd.patch
@@ -0,0 +1,12 @@
+diff -urpN busybox-1.16.1/networking/udhcp/leases.c busybox-1.16.1-dhcpd/networking/udhcp/leases.c
+--- busybox-1.16.1/networking/udhcp/leases.c	2010-03-28 19:43:36.000000000 +0200
++++ busybox-1.16.1-dhcpd/networking/udhcp/leases.c	2010-05-15 20:47:08.000000000 +0200
+@@ -64,6 +64,8 @@ struct dyn_lease* FAST_FUNC add_lease(
+ 		oldest->hostname[0] = '\0';
+ 		if (hostname) {
+ 			char *p;
++
++			hostname_len++; /* include NUL */
+ 			if (hostname_len > sizeof(oldest->hostname))
+ 				hostname_len = sizeof(oldest->hostname);
+ 			p = safe_strncpy(oldest->hostname, hostname, hostname_len);
diff --git a/package/busybox/busybox-1.16.1-sed.patch b/package/busybox/busybox-1.16.1-sed.patch
index 56d2304..0376cc9 100644
--- a/package/busybox/busybox-1.16.1-sed.patch
+++ b/package/busybox/busybox-1.16.1-sed.patch
@@ -1,7 +1,35 @@
 diff -urpN busybox-1.16.1/editors/sed.c busybox-1.16.1-sed/editors/sed.c
---- busybox-1.16.1/editors/sed.c	2010-03-28 13:43:35.000000000 -0400
-+++ busybox-1.16.1-sed/editors/sed.c	2010-04-20 13:33:26.301975462 -0400
-@@ -936,7 +936,15 @@ static void process_files(void)
+--- busybox-1.16.1/editors/sed.c	2010-03-28 19:43:35.000000000 +0200
++++ busybox-1.16.1-sed/editors/sed.c	2010-05-12 01:46:57.000000000 +0200
+@@ -487,7 +487,7 @@ static const char *parse_cmd_args(sed_cm
+ static void add_cmd(const char *cmdstr)
+ {
+ 	sed_cmd_t *sed_cmd;
+-	int temp;
++	unsigned len, n;
+ 
+ 	/* Append this line to any unfinished line from last time. */
+ 	if (G.add_cmd_line) {
+@@ -496,12 +496,14 @@ static void add_cmd(const char *cmdstr)
+ 		cmdstr = G.add_cmd_line = tp;
+ 	}
+ 
+-	/* If this line ends with backslash, request next line. */
+-	temp = strlen(cmdstr);
+-	if (temp && cmdstr[--temp] == '\\') {
++	/* If this line ends with unescaped backslash, request next line. */
++	n = len = strlen(cmdstr);
++	while (n && cmdstr[n-1] == '\\')
++		n--;
++	if ((len - n) & 1) { /* if odd number of trailing backslashes */
+ 		if (!G.add_cmd_line)
+ 			G.add_cmd_line = xstrdup(cmdstr);
+-		G.add_cmd_line[temp] = '\0';
++		G.add_cmd_line[len-1] = '\0';
+ 		return;
+ 	}
+ 
+@@ -936,7 +938,15 @@ static void process_files(void)
  		/* Skip blocks of commands we didn't match */
  		if (sed_cmd->cmd == '{') {
  			if (sed_cmd->invert ? matched : !matched) {
@@ -18,7 +46,7 @@ diff -urpN busybox-1.16.1/editors/sed.c busybox-1.16.1-sed/editors/sed.c
  					sed_cmd = sed_cmd->next;
  					if (!sed_cmd)
  						bb_error_msg_and_die("unterminated {");
-@@ -1031,7 +1039,7 @@ static void process_files(void)
+@@ -1031,7 +1041,7 @@ static void process_files(void)
  		case 'c':
  			/* Only triggers on last line of a matching range. */
  			if (!sed_cmd->in_match)
@@ -28,9 +56,9 @@ diff -urpN busybox-1.16.1/editors/sed.c busybox-1.16.1-sed/editors/sed.c
  
  		/* Read file, append contents to output */
 diff -urpN busybox-1.16.1/testsuite/sed.tests busybox-1.16.1-sed/testsuite/sed.tests
---- busybox-1.16.1/testsuite/sed.tests	2010-03-19 22:58:07.000000000 -0400
-+++ busybox-1.16.1-sed/testsuite/sed.tests	2010-04-20 13:33:26.301975462 -0400
-@@ -248,4 +248,14 @@ testing "sed beginning (^) matches only 
+--- busybox-1.16.1/testsuite/sed.tests	2010-03-20 03:58:07.000000000 +0100
++++ busybox-1.16.1-sed/testsuite/sed.tests	2010-05-12 01:46:57.000000000 +0200
+@@ -248,4 +248,28 @@ testing "sed beginning (^) matches only 
  	">/usr</>lib<\n" "" \
  	"/usr/lib\n"
  
@@ -44,4 +72,18 @@ diff -urpN busybox-1.16.1/testsuite/sed.tests busybox-1.16.1-sed/testsuite/sed.t
 +	"qwe\nasd\nacd\nacd\n" "" \
 +	"qwe\nasd\nzxc\n"
 +
++testing "sed a cmd ended by double backslash" \
++	"sed -e '/| one /a \\
++	| three \\\\' -e '/| one-/a \\
++	| three-* \\\\'" \
++'	| one \\
++	| three \\
++	| two \\
++' '' \
++'	| one \\
++	| two \\
++'
++
++# testing "description" "arguments" "result" "infile" "stdin"
++
  exit $FAILCOUNT
-- 
1.6.3.3
