Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED8ACD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 248F9846CE;
	Fri, 15 May 2026 17:47:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGLNLGUC4aFO; Fri, 15 May 2026 17:47:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD11A846C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867223;
	bh=W+uPSA/RLE9pk+tMSNIVka/IKF/J0I/b52NKPwrdeeA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OunKH4Han7ew+9BLvrE3Tdg8iBJYttJ8iXhT/nk5qV9CWLUFYJhwjpebsWWu9lkMV
	 HvpBHoLq21VK1WDK3WkpPsoqhQbdXBmkIczH2rVykNJBYR8w0m7pi1jBMvV12BRJHZ
	 2SMsOzxZYZk8UpQJRHWeLmMW6S5MNInS5C9B/ZqUlutF25M/AC1Cq8ZaeKbH9KLe2m
	 W3n2VKG+HLuHf6UqD/f9/8fRGLjNo0F+vn2RSeJLfXdnimGWbgnzwOStVG8Kke5dsO
	 zmddHWblNt9CsjQJV1892hugGfEd6fJa2SiVawCy2tUVsJaHmawlVr4LtvA9YYntkX
	 0VnP0/q1ruB7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD11A846C0;
	Fri, 15 May 2026 17:47:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE1545B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C39340FB1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gdhS9L7OhwZ for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A7F540FAA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A7F540FAA
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCA1C863DB; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:19:52 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: dd1ddca614246ca31cc4755632d538f41dc2682c
X-Git-Newrev: c272ee972b03f5bd26999e357d32ce65642211ab
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.BCA1C863DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/openssh/S50sshd:
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c272ee972b03f5bd26999e357d32ce65642211ab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

If sending the stop signal fails but the PID file exists the following
shutdown wait turns into an endless loop. Avoid that and return the
error immediately.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 34f4732f1a9b6d79bd78d2efa951837cda296097)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openssh/S50sshd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
index a5ff385acc..7d862db14c 100644
--- a/package/openssh/S50sshd
+++ b/package/openssh/S50sshd
@@ -36,6 +36,7 @@ stop() {
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
 	# sshd deletes its PID file on exit, wait for it to be gone
 	while [ -f "$PIDFILE" ]; do
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
