Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2649DCD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D54846B1;
	Fri, 15 May 2026 17:47:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tt2Dc3fT5TwS; Fri, 15 May 2026 17:47:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4504D846A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867220;
	bh=EwhjUrtr9Rc64FE2nAVdxnLPCoe2QswxRrU3d/+GFAY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qyKL0wtjCRPEkRhc4QgYxLE4fGT+HQ6I04ZcoXUgUafjir3v7Aaa3i16rHoyf73ss
	 jA4jYKEidw6E447eU86M+RWvg9u9jL/sW0nHJN4JT7yz+PYk+xhHf7dy+tenzXYGpP
	 q/6huIzhSY6gue0CTXCC91BhB07D/BbQEUNCiquzMfrn/ItTCZzstxLcAMQNAi9Tyr
	 1Vdhzy+5Bt9pyVgRf1AnrELoxLamZq80PVnHMJ717yM+ewDNOqj4ZgrDFpSMU24fgp
	 YAJ7XAE3R0qG/22P8j/xp5dHAOydj9BXWCcYRPzu7/0WYo1danpQWP5OMM5FhAYog3
	 bAWQ5mlClqxTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4504D846A6;
	Fri, 15 May 2026 17:47:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 195B245B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B65A41D4D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fUHQ6GESxgFE for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C35A41D92
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C35A41D92
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9A9C863DC; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:20:15 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: c272ee972b03f5bd26999e357d32ce65642211ab
X-Git-Newrev: 0d8372b7e0c66626185fde3a563f03130ccf4a5a
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.C9A9C863DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 package/watchdogd/S01watchdogd: immediately return if sending stop fails
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0d8372b7e0c66626185fde3a563f03130ccf4a5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

If sending the stop signal fails but the PID file exists the following
shutdown wait turns into an endless loop. Avoid that and return the
error immediately.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 6558eb3d65d2b71173e9f7ee1db6c79b4affd7fa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
