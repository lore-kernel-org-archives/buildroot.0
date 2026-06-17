Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC0BCD98F1
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6990E4EC76;
	Wed, 17 Jun 2026 12:53:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8kaTkcmXidZB; Wed, 17 Jun 2026 12:53:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DD54D10E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781700833;
	bh=zIJ/mC+X8EN7GeBh32OxV2BvLJfmOGS1VO1g/4X9VqA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BAaP1+xrM7JxHiK+riJYoLjEoDfJ4wTqyFWpF8Lv+T2HbRfpOjiTeuvgqTkMXz4bj
	 fDaYoSD51/sXCGcdfWlZAfHGMLCrgSOShz4DWU2Quc15GLLcZfh2zvOx3M/p9Uk/1u
	 G+3nDyeoYJERqCoOXI9l+Iw4WPFu6r1DlhWROLs1G0+P4qGDtvecAGY/XLPiYgu4kC
	 YbnmPNYgC9y3w6PEfXIlRabnH//6ysluoitPtoO6SUrxf8YmhXnt8Gdg2FxsAr1jZk
	 ddDSXgwwrF9B+oZq9/VjSpd0Rr5wFRNlRRYuUsrNS7kp3Ju1ILYeekeT0mf1OUMt8d
	 0N5WPE3m+1uDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DD54D10E;
	Wed, 17 Jun 2026 12:53:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 203A2D8
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1249A49832
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 74HJ5Sp3mvmT for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:53:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E9C44C9F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E9C44C9F5
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:53:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDCAF8121B; Wed, 17 Jun 2026 12:53:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 14:52:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dabaf4ab46909ce9b91f27793c91bbefe8be6618
X-Git-Newrev: 59bc42f1a6dbe808a2498ee1fd4b33cac6e097e3
X-Patchwork-Hint: ignore
Message-Id: <20260617125326.BDCAF8121B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd/S40iwd: on stop wait for
 daemon to exit and delete PID file
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59bc42f1a6dbe808a2498ee1fd4b33cac6e097e3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/iwd/S40iwd | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/iwd/S40iwd b/package/iwd/S40iwd
index 978912c67f..c329f3bcc7 100644
--- a/package/iwd/S40iwd
+++ b/package/iwd/S40iwd
@@ -26,13 +26,20 @@ start() {
 
 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon --stop --quiet --pidfile "$PIDFILE"
+	start-stop-daemon --stop --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/$DAEMON"
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
+	while start-stop-daemon --stop --test --quiet --pidfile "$PIDFILE" \
+		--exec "/usr/libexec/$DAEMON"; do
+		sleep 0.1
+	done
+	rm -f "$PIDFILE"
 	return "$status"
 }
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
