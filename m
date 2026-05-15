Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6EABCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A579A41D24;
	Fri, 15 May 2026 17:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVDN8iDKDMT1; Fri, 15 May 2026 17:45:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B512D41D25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867102;
	bh=rOlmb0jRL19S/pnBZHmMQqbRPMYTIJmwpKmKQZWjGvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c/K2E6MFQADvttOAYLWYjDzdLr0+H/J3dPxPRglNLrUDc5+6glWDcgfWjCU/ut01N
	 XsJlwkjWuXASQe73LVHISKJaAtQkHLSP6f/XEoS6ogn/iGKmyTtVoql3DA4JzqJK51
	 JxT4096CarVMS7lE6j3kb6TPxDh9j9UNGawvjnKwNezGMvRDgflCFzOl2nvB6gnWLx
	 Usv4iyOq5LZLkAThRw7sDEhyzkVxeT2ewHCizEFWNX6DQ9iYgED+pXV8V7RAKx3dc7
	 XBuYxoFT2HxLkNxR74GXTXVPxwnz+WNH9QJHSuUyZiNmczX9TLYN2DBH0lknMcGG/O
	 BLzI8ye3fL94w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B512D41D25;
	Fri, 15 May 2026 17:45:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5451649B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B79DC84192
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DEbHSTZM1Jps for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:44:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D5184172
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8D5184172
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:44:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03C7486395; Fri, 15 May 2026 17:44:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:20:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9b0561e2e102c1e16ad348f3f197f75133fa6cad
X-Git-Newrev: f1167baf9e36bbf59919ad0fb8c6e79c73e3f50a
X-Patchwork-Hint: ignore
Message-Id: <20260515174449.03C7486395@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f1167baf9e36bbf59919ad0fb8c6e79c73e3f50a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
