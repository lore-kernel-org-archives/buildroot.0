Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B8BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 10:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E260E404C6;
	Sun, 26 Dec 2021 10:51:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GLS99HjnV5cq; Sun, 26 Dec 2021 10:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 21B92405A7;
	Sun, 26 Dec 2021 10:51:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A369D1BF476
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99F3540966
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 10:51:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ds4xHlgIHckV for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 10:51:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C770B4091B
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:51:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 21BA081213; Sun, 26 Dec 2021 10:45:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 11:50:48 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7c2ada7583eee504d6fb6e832381dae88fb38d4
X-Git-Newrev: 218f16e6874d8c59c1bc84c94d4cd9604504f76a
X-Patchwork-Hint: ignore
Message-Id: <20211226104531.21BA081213@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/memcached: fix build with gcc 10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=218f16e6874d8c59c1bc84c94d4cd9604504f76a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 1.6.12 in
commit f727b6da04c21732bbd07d8c70aa814bc56014a1:

logger.c: In function '_logger_parse_cce':
logger.c:297:13: error: 'rport' may be used uninitialized in this function [-Werror=maybe-uninitialized]
  297 |     total = snprintf(scratch, LOGGER_PARSE_SCRATCH,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  298 |             "ts=%d.%d gid=%llu type=conn_close rip=%s rport=%hu transport=%s reason=%s cfd=%d\n",
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  299 |             (int) e->tv.tv_sec, (int) e->tv.tv_usec, (unsigned long long) e->gid,
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  300 |             rip, rport, transport_map[le->transport],
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  301 |             reason_map[le->reason], le->sfd);
      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7a46ac38d10b1859034017e0294961daa8f48dd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../memcached/0001-logger.c-initialize-rport.patch | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/package/memcached/0001-logger.c-initialize-rport.patch b/package/memcached/0001-logger.c-initialize-rport.patch
new file mode 100644
index 0000000000..5fb13d5eee
--- /dev/null
+++ b/package/memcached/0001-logger.c-initialize-rport.patch
@@ -0,0 +1,55 @@
+From b3431c4fcaf65e66fda80ef89b79ff3da1912b4f Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 25 Dec 2021 20:05:29 +0100
+Subject: [PATCH] logger.c: initialize rport
+
+Fix the following build failure raised since version 1.6.11 and
+https://github.com/memcached/memcached/commit/617d7cd64d04698b76fee74882627690017e20ad:
+
+logger.c: In function '_logger_parse_cce':
+logger.c:297:13: error: 'rport' may be used uninitialized in this function [-Werror=maybe-uninitialized]
+  297 |     total = snprintf(scratch, LOGGER_PARSE_SCRATCH,
+      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  298 |             "ts=%d.%d gid=%llu type=conn_close rip=%s rport=%hu transport=%s reason=%s cfd=%d\n",
+      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  299 |             (int) e->tv.tv_sec, (int) e->tv.tv_usec, (unsigned long long) e->gid,
+      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  300 |             rip, rport, transport_map[le->transport],
+      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+  301 |             reason_map[le->reason], le->sfd);
+      |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7a46ac38d10b1859034017e0294961daa8f48dd2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: not sent yet]
+---
+ logger.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/logger.c b/logger.c
+index 667f3c7..394adae 100644
+--- a/logger.c
++++ b/logger.c
+@@ -269,7 +269,7 @@ static int _logger_parse_extw(logentry *e, char *scratch) {
+ 
+ static int _logger_parse_cne(logentry *e, char *scratch) {
+     int total;
+-    unsigned short rport;
++    unsigned short rport = 0;
+     char rip[64];
+     struct logentry_conn_event *le = (struct logentry_conn_event *) e->data;
+     const char * const transport_map[] = { "local", "tcp", "udp" };
+@@ -286,7 +286,7 @@ static int _logger_parse_cne(logentry *e, char *scratch) {
+ 
+ static int _logger_parse_cce(logentry *e, char *scratch) {
+     int total;
+-    unsigned short rport;
++    unsigned short rport = 0;
+     char rip[64];
+     struct logentry_conn_event *le = (struct logentry_conn_event *) e->data;
+     const char * const transport_map[] = { "local", "tcp", "udp" };
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
