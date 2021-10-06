Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B094C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:32:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE8D61186
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3CE8D61186
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C2074090F;
	Wed,  6 Oct 2021 19:32:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NTGoQqUOjfeJ; Wed,  6 Oct 2021 19:32:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F5524091C;
	Wed,  6 Oct 2021 19:32:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 394961BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABDDA83E2C
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xs-cdLQ5u3bo for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F5AC83E03
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 8B78E93465; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3b2ce753bbfb07b0033144600518da6300464ed7
X-Git-Newrev: 99c33ea67664560dfa93572b39c52cea32adc195
X-Patchwork-Hint: ignore
Message-Id: <20211006192814.8B78E93465@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/smcroute: cross check PID with
 process name in stop action
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

commit: https://git.buildroot.net/buildroot/commit/?id=99c33ea67664560dfa93572b39c52cea32adc195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
[Arnout: keep the shellcheck comments]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/smcroute/S41smcroute | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/smcroute/S41smcroute b/package/smcroute/S41smcroute
index bdc0f87645..d243e8ec5c 100755
--- a/package/smcroute/S41smcroute
+++ b/package/smcroute/S41smcroute
@@ -9,7 +9,7 @@ PIDFILE="/var/run/$NAME.pid"
 
 cmd()
 {
-    start-stop-daemon -q -p "$PIDFILE" "$@"
+    start-stop-daemon -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" "$@"
     status=$?
     if [ $status -eq 0 ]; then
 	echo "OK"
@@ -23,7 +23,7 @@ case "$1" in
     start)
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	cmd -S -x "/usr/sbin/$DAEMON" -- $SMCROUTED_ARGS
+	cmd -S -- $SMCROUTED_ARGS
 	;;
 
     stop)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
