Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328FBC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 16:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B107E83ED0;
	Sun, 14 Aug 2022 16:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B107E83ED0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MiRM-nKM8Q0S; Sun, 14 Aug 2022 16:47:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D715883ECC;
	Sun, 14 Aug 2022 16:46:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D715883ECC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B1141BF96B
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53B4560D69
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 16:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53B4560D69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9BPFFQ2T_-IQ for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 16:46:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F72760D50
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 16:46:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F72760D50
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1D32087523; Sun, 14 Aug 2022 16:32:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 18:37:32 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 659310bc8f30427c62ca0ec8ff51414f0a371365
X-Git-Newrev: 6f381e7aef87b2c8aca7a1d17f717efda3a4b5cb
X-Patchwork-Hint: ignore
Message-Id: <20220814163217.1D32087523@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/mstpd: fix mstpd
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

commit: https://git.buildroot.net/buildroot/commit/?id=6f381e7aef87b2c8aca7a1d17f717efda3a4b5cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
