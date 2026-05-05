Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE4FFF885A
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 10:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2CDA409C7;
	Tue,  5 May 2026 10:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hx8kwVbCDh8U; Tue,  5 May 2026 10:51:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB5B3409C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777978304;
	bh=yNBCekfokl1YS4xDdGzsZ9sf3utc5VRk4M3XztDwcog=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fRkbnebyia12pEiH4l4hEYsnyHHE7nf1KgClbgO2NFGYizNOagwtWK26bN5TrcJKM
	 K2Hu1fM2SZPoj35C3kDiYTDPxXFkndFyYyTrqBgaqSUIMZy5cQtvmxAnCH5gEuSPNA
	 28RqDMcNbd8ateqvcVk3D90uWQ4T1IGe2pbeCOZuIzwtFrwixmX6xqjQIsGr01X877
	 HYGLalYU5Sg0miW1gyWDnA4PCmBlxcp7Foff4MNNof/wQPsw20jbFHULC/mgzzhAJu
	 txs2KEvzOJ2LkciO50E/rRwdj49ulKK//vJKS6mgj/rqyCaKl6UDIr6WK/ERhN0MAH
	 NvM4OWGYx0+qg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB5B3409C8;
	Tue,  5 May 2026 10:51:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 858582DF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7323D409C8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PluTmUSMuMsD for <buildroot@buildroot.org>;
 Tue,  5 May 2026 10:51:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74CBD409C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74CBD409C7
 for <buildroot@buildroot.org>; Tue,  5 May 2026 10:51:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A9D8844F5; Tue,  5 May 2026 10:51:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 11:54:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 986a30bf9ba561b0d5acd7e39e16093639a82917
X-Git-Newrev: 34f4732f1a9b6d79bd78d2efa951837cda296097
X-Patchwork-Hint: ignore
Message-Id: <20260505105142.6A9D8844F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh/S50sshd: immediately
 return if sending stop fails
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34f4732f1a9b6d79bd78d2efa951837cda296097
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

If sending the stop signal fails but the PID file exists the following
shutdown wait turns into an endless loop. Avoid that and return the
error immediately.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
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
