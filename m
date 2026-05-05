Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8378ECD3436
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 10:51:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8411560832;
	Tue,  5 May 2026 10:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCD-b8-4lr1s; Tue,  5 May 2026 10:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E36796082B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777978306;
	bh=MFA18sLMIRyFy+zGG411nlOf+Ax5wBZwBAeSoTsWfmE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ui1AB/+agO24pFYk/0GCvWRheELf7QBbWzadNFBR2NoaOalBcFSCHQfcL5stfJBOw
	 w+frjXfk4c0XQ95rYL4I73mdhrmwz0XwKgZcSRU5BJ8YShfsXUD9y3uSCFZrkQXkvh
	 N/jkCyr8Ne81SCg0Lbla9erNsa6vcKGWEx3QhSqEDty2tEhsNhFkjXAQbpPBPU1E+B
	 QpwlJIBKdCBQXmYwwszZ0SLZ0oRcop4IM6R7YgMJE1PVPymGkMmEm10nK9xNBPQl3E
	 2f9tYKgx9rUIg2MSpRMw7vIQ2OFmG6daw+0+EJQbh3RFOKlMCDCSi5YB2B4D6dRK0K
	 EccqllpCmjzHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E36796082B;
	Tue,  5 May 2026 10:51:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FD8A30A
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FD8D40232
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4c3g1twixH3 for <buildroot@buildroot.org>;
 Tue,  5 May 2026 10:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1BF40231
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE1BF40231
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D505843C9; Tue,  5 May 2026 10:51:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 11:54:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34f4732f1a9b6d79bd78d2efa951837cda296097
X-Git-Newrev: 6558eb3d65d2b71173e9f7ee1db6c79b4affd7fa
X-Patchwork-Hint: ignore
Message-Id: <20260505105143.0D505843C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/watchdogd/S01watchdogd:
 immediately return if sending stop fails
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6558eb3d65d2b71173e9f7ee1db6c79b4affd7fa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

If sending the stop signal fails but the PID file exists the following
shutdown wait turns into an endless loop. Avoid that and return the
error immediately.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/watchdogd/S01watchdogd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/watchdogd/S01watchdogd b/package/watchdogd/S01watchdogd
index 8f811ac0fc..316787c2ff 100644
--- a/package/watchdogd/S01watchdogd
+++ b/package/watchdogd/S01watchdogd
@@ -29,6 +29,7 @@ stop() {
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
 	# watchdogd deletes its PID file on exit, wait for it to be gone
 	while [ -f "$PIDFILE" ]; do
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
