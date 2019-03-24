From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Mar 2019 15:29:12 +0100
Subject: [Buildroot] [PATCH] package/dropbear: add upstream patch fixing TTY
 mode reset regression
Message-ID: <20190324142912.25518-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2019.77 added a regression related to resetting TTY mode on exit.  Add an
upstream patch to fix it.

For more details, see the mailing list:
https://lists.ucc.gu.uwa.edu.au/pipermail/dropbear/2019q1/002157.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...ion-where-TTY-modes-weren-t-reset-for-cli.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch

diff --git a/package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch b/package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch
new file mode 100644
index 0000000000..9967aebc96
--- /dev/null
+++ b/package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch
@@ -0,0 +1,56 @@
+From 7bc6280613f5ab4ee86c14c779739070e5784dfe Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sun, 24 Mar 2019 20:41:02 +0800
+Subject: [PATCH] Fix regression where TTY modes weren't reset for client
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ cli-chansession.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/cli-chansession.c b/cli-chansession.c
+index 8b72e27..cfd3401 100644
+--- a/cli-chansession.c
++++ b/cli-chansession.c
+@@ -35,7 +35,7 @@
+ #include "chansession.h"
+ #include "agentfwd.h"
+ 
+-static void cli_cleanupchansess(const struct Channel *channel);
++static void cli_closechansess(const struct Channel *channel);
+ static int cli_initchansess(struct Channel *channel);
+ static void cli_chansessreq(struct Channel *channel);
+ static void send_chansess_pty_req(const struct Channel *channel);
+@@ -51,8 +51,8 @@ const struct ChanType clichansess = {
+ 	cli_initchansess, /* inithandler */
+ 	NULL, /* checkclosehandler */
+ 	cli_chansessreq, /* reqhandler */
+-	NULL, /* closehandler */
+-	cli_cleanupchansess, /* cleanup */
++	cli_closechansess, /* closehandler */
++	NULL, /* cleanup */
+ };
+ 
+ static void cli_chansessreq(struct Channel *channel) {
+@@ -84,7 +84,7 @@ out:
+ 	
+ 
+ /* If the main session goes, we close it up */
+-static void cli_cleanupchansess(const struct Channel *UNUSED(channel)) {
++static void cli_closechansess(const struct Channel *UNUSED(channel)) {
+ 	cli_tty_cleanup(); /* Restore tty modes etc */
+ 
+ 	/* This channel hasn't gone yet, so we have > 1 */
+@@ -388,8 +388,8 @@ static const struct ChanType cli_chan_netcat = {
+ 	cli_init_netcat, /* inithandler */
+ 	NULL,
+ 	NULL,
++	cli_closechansess,
+ 	NULL,
+-	cli_cleanupchansess
+ };
+ 
+ void cli_send_netcat_request() {
+-- 
+2.11.0
+
-- 
2.11.0
