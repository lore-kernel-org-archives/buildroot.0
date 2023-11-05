Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A7EC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 18:32:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A48F4820E9;
	Sun,  5 Nov 2023 18:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A48F4820E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqX2CQJnMk2O; Sun,  5 Nov 2023 18:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE24981CE9;
	Sun,  5 Nov 2023 18:32:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE24981CE9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 602FC1BF909
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3800A61013
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 18:31:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3800A61013
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYlNjFI2Uvqr for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24EA661034
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24EA661034
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 056BB867B4; Sun,  5 Nov 2023 18:31:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Nov 2023 18:15:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f04c7ae01e2bbbb88b8e39f786bc91f4a01c07c
X-Git-Newrev: 12e964302174dd299a6ce48fb3f6c349c45dd718
X-Patchwork-Hint: ignore
Message-Id: <20231105183144.056BB867B4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/petitboot: use default logfile dir
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=12e964302174dd299a6ce48fb3f6c349c45dd718
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All the petitboot components assume /var/log/petitboot by default;
pb-console can also put multiple logs there and pb-sos collects that
directory when creating a diagnostic tarball.

Defer to this default when launching pb-discover. If someone wants to
override, let's call the file /etc/default/petitboot which makes more
sense to be shared by all the components.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/petitboot/S15pb-discover | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 9b641298ca..71ab62d998 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -2,12 +2,9 @@
 
 DAEMON="pb-discover"
 PIDFILE="/var/run/$DAEMON.pid"
-LOGFILE="/var/log/$DAEMON.log"
-
-PB_DISCOVER_ARGS="-l $LOGFILE"
 
 # shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+[ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
 
 if [ "$(pb-config debug)" = "enabled" ] ; then
 	PB_DISCOVER_ARGS="$PB_DISCOVER_ARGS --verbose"
@@ -15,6 +12,8 @@ fi
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	mkdir -p /var/log/petitboot
+
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $PB_DISCOVER_ARGS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
