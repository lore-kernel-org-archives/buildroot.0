Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083F2C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 17:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF21341686;
	Thu,  9 Nov 2023 17:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF21341686
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LZelrrEnHDjb; Thu,  9 Nov 2023 17:00:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAB58416EC;
	Thu,  9 Nov 2023 17:00:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB58416EC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8E10E1BF990
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 672F460F71
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 17:00:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 672F460F71
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TD9PSYdyaxRP for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 17:00:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8947D60F6B
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 17:00:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8947D60F6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7918C86DFF; Thu,  9 Nov 2023 17:00:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 17:56:40 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 3b977a0f4d09203f7f4ee055aa46c1f9731e56df
X-Git-Newrev: 3434b72fabf3f7c2ed244bca840f418dadc05264
X-Patchwork-Hint: ignore
Message-Id: <20231109170033.7918C86DFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/petitboot: use
 default logfile dir
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

commit: https://git.buildroot.net/buildroot/commit/?id=3434b72fabf3f7c2ed244bca840f418dadc05264
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

All the petitboot components assume /var/log/petitboot by default;
pb-console can also put multiple logs there and pb-sos collects that
directory when creating a diagnostic tarball.

Defer to this default when launching pb-discover. If someone wants to
override, let's call the file /etc/default/petitboot which makes more
sense to be shared by all the components.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 12e964302174dd299a6ce48fb3f6c349c45dd718)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/petitboot/S15pb-discover | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 7ecc12e991..0d960b54ac 100644
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
 	start-stop-daemon -S -q -b -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $PB_DISCOVER_ARGS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
