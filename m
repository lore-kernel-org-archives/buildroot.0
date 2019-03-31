From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 31 Mar 2019 18:03:56 +0200
Subject: [Buildroot] [PATCH] package/dropbear: bump to version 2019.78
Message-ID: <20190331160356.29392-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...here-TTY-modes-weren-t-reset-for-cli.patch | 56 -------------------
 package/dropbear/dropbear.hash                |  2 +-
 package/dropbear/dropbear.mk                  |  2 +-
 3 files changed, 2 insertions(+), 58 deletions(-)
 delete mode 100644 package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch

diff --git a/package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch b/package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch
deleted file mode 100644
index 9967aebc9..000000000
--- a/package/dropbear/0001-Fix-regression-where-TTY-modes-weren-t-reset-for-cli.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 7bc6280613f5ab4ee86c14c779739070e5784dfe Mon Sep 17 00:00:00 2001
-From: Matt Johnston <matt@ucc.asn.au>
-Date: Sun, 24 Mar 2019 20:41:02 +0800
-Subject: [PATCH] Fix regression where TTY modes weren't reset for client
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- cli-chansession.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/cli-chansession.c b/cli-chansession.c
-index 8b72e27..cfd3401 100644
---- a/cli-chansession.c
-+++ b/cli-chansession.c
-@@ -35,7 +35,7 @@
- #include "chansession.h"
- #include "agentfwd.h"
- 
--static void cli_cleanupchansess(const struct Channel *channel);
-+static void cli_closechansess(const struct Channel *channel);
- static int cli_initchansess(struct Channel *channel);
- static void cli_chansessreq(struct Channel *channel);
- static void send_chansess_pty_req(const struct Channel *channel);
-@@ -51,8 +51,8 @@ const struct ChanType clichansess = {
- 	cli_initchansess, /* inithandler */
- 	NULL, /* checkclosehandler */
- 	cli_chansessreq, /* reqhandler */
--	NULL, /* closehandler */
--	cli_cleanupchansess, /* cleanup */
-+	cli_closechansess, /* closehandler */
-+	NULL, /* cleanup */
- };
- 
- static void cli_chansessreq(struct Channel *channel) {
-@@ -84,7 +84,7 @@ out:
- 	
- 
- /* If the main session goes, we close it up */
--static void cli_cleanupchansess(const struct Channel *UNUSED(channel)) {
-+static void cli_closechansess(const struct Channel *UNUSED(channel)) {
- 	cli_tty_cleanup(); /* Restore tty modes etc */
- 
- 	/* This channel hasn't gone yet, so we have > 1 */
-@@ -388,8 +388,8 @@ static const struct ChanType cli_chan_netcat = {
- 	cli_init_netcat, /* inithandler */
- 	NULL,
- 	NULL,
-+	cli_closechansess,
- 	NULL,
--	cli_cleanupchansess
- };
- 
- void cli_send_netcat_request() {
--- 
-2.11.0
-
diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
index dcd85aa53..aa0e80a20 100644
--- a/package/dropbear/dropbear.hash
+++ b/package/dropbear/dropbear.hash
@@ -1,5 +1,5 @@
 # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
-sha256 d91f78ebe633be1d071fd1b7e5535b9693794048b019e9f4bea257e1992b458d dropbear-2019.77.tar.bz2
+sha256 525965971272270995364a0eb01f35180d793182e63dd0b0c3eb0292291644a4 dropbear-2019.78.tar.bz2
 
 # License file, locally computed
 sha256 cfa32d49e9022265375e533a4a5ef9e37d4aaa604119d612c46816aa1e59fe52 LICENSE
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index ea3fe4c98..e10c85160 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DROPBEAR_VERSION = 2019.77
+DROPBEAR_VERSION = 2019.78
 DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
 DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
 DROPBEAR_LICENSE = MIT, BSD-2-Clause-like, BSD-2-Clause
-- 
2.17.1
