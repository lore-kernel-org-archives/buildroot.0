Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D7BC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 16:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9567640621;
	Sun, 14 Aug 2022 16:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9567640621
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhRUWUIJ3zvn; Sun, 14 Aug 2022 16:46:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECF38405D8;
	Sun, 14 Aug 2022 16:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECF38405D8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 069E21BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5E51405D8
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5E51405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KoEOAvhW1dft for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 16:46:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E090401B7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:46:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E090401B7
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9A5D68751C; Sun, 14 Aug 2022 16:31:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 18:36:42 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 1cebbbcdb59fd6efa8678d9bc37088f1bfba516b
X-Git-Newrev: 443df533182d6d225a961cad8eb9c172b2689987
X-Patchwork-Hint: ignore
Message-Id: <20220814163132.9A5D68751C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/mstpd: fix mstpd
 bridge-stp use of pidof
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

commit: https://git.buildroot.net/buildroot/commit/?id=443df533182d6d225a961cad8eb9c172b2689987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Through mstpd version 0.1.0, the bridge-stp script uses the '-c'
option to the pidof command. Busybox does not support this option, so
mstpd does not work.

This has been fixed in the main development branch of mstpd, but it is
unclear when the next release will be. In the meantime, apply the fix
here so that mstpd will be useable until the next version release.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e19051a1a1573da7f250e00f8a3877606717a34c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...in-support-different-versions-of-pidof-13.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch b/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
new file mode 100644
index 0000000000..daa591131b
--- /dev/null
+++ b/package/mstpd/0001-bridge-stp.in-support-different-versions-of-pidof-13.patch
@@ -0,0 +1,48 @@
+From 181c453fc1a00573e19f14960dcc54ad84beea7c Mon Sep 17 00:00:00 2001
+From: colin-foster-in-advantage <colin.foster@in-advantage.com>
+Date: Tue, 12 Jul 2022 23:01:09 -0700
+Subject: [PATCH] bridge-stp.in: support different versions of pidof (#137)
+
+* bridge-stp.in: support different versions of pidof
+
+Busybox uses a version of pdiof that doesn't support the -c option. As
+such, this renders mstpd non-functional on any Busybox system.
+
+Just use the standard form of pidof to detect any running instances of mstpd.
+
+Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
+---
+ bridge-stp.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/bridge-stp.in b/bridge-stp.in
+index 47cbe79..3807873 100755
+--- a/bridge-stp.in
++++ b/bridge-stp.in
+@@ -139,7 +139,7 @@ case "$action" in
+         fi
+ 
+         # Start mstpd if necessary.
+-        if ! pidof -c -s mstpd >/dev/null; then
++        if ! pidof -s mstpd >/dev/null; then
+             if [ "$MANAGE_MSTPD" != 'y' ]; then
+                 errmsg 'mstpd is not running'
+                 exit 3
+@@ -212,12 +212,12 @@ case "$action" in
+         done
+ 
+         # Kill mstpd, since no bridges are currently using it.
+-        kill $(pidof -c mstpd)
++        kill $(pidof mstpd)
+         ;;
+     restart|restart_config)
+         if [ "$action" = 'restart' ]; then
+             # Kill mstpd.
+-            pids="$(pidof -c mstpd)" ; Err=$?
++            pids="$(pidof mstpd)" ; Err=$?
+             if [ $Err -eq 0 ]; then
+                 echo 'Stopping mstpd ...'
+                 kill $pids
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
