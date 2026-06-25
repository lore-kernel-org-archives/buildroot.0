Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA28C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4602760F2B;
	Fri, 26 Jun 2026 14:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLBOd0tGoV9m; Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D036B60F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485495;
	bh=XN8HMynEMmR2M2G3ijnZTEYWlHjVUJS2uoKWqFuXtcA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MSRdgG3J9RqPrCdbi/WODwYA1tq4CGktc7E0r4qKQ2ZDaLQ+dT6P9D/Two3LG6UYf
	 3bD3jXI5Bi9ALXqmJ8UVarXgV/v/SrWTp3vLSQQsyDYuzRHspRnUsR1wyo7MgAtb13
	 2JsKgbUOeYiA9rSYC6sJnvb7bF1OhapYUHcwqMi8Sa4hYMd3kJ8mVMwTn4sNUrtom3
	 OeTJpXSbJ7PRsxQCYAVjwjf8nccs8O1CpOO8+C8TGpr9knG9ONTqVCr8gPll8kA67Z
	 x7lGXsHeCPBg9lY3COmygxHMXWmgq97vAvvid95Rz69XoeHYhJXFVr3ypLrpFIvDsj
	 kq7Bc2Gh1AZoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D036B60F30;
	Fri, 26 Jun 2026 14:51:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 476133A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3603F60F61
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lg555g9u-udh for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66CF160F4A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66CF160F4A
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:51:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 63C9E864B9; Fri, 26 Jun 2026 14:51:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:28:22 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 834c844e3b52b9f55c55d8e6c30284c8ce48afcf
X-Git-Newrev: 1708ca006197afc4dd14c041dc06e45a3f07d066
X-Patchwork-Hint: ignore
Message-Id: <20260626145106.63C9E864B9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/mpd/S95mpd: do
 not wait for exit if sending stop failed
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1708ca006197afc4dd14c041dc06e45a3f07d066
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

If sending the stop signal failed for whatever reason, waiting for an
existing PID file to disappear is likely to block indefinitely.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Tested-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit b2d84525f9115f4f04a4814f29b87a17db58569e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/mpd/S95mpd | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/S95mpd b/package/mpd/S95mpd
index e33654a501..485747e96e 100644
--- a/package/mpd/S95mpd
+++ b/package/mpd/S95mpd
@@ -31,6 +31,7 @@ stop() {
 		echo "OK"
 	else
 		echo "FAIL"
+		return "$status"
 	fi
 	# $DAEMON deletes its PID file on exit, wait for it to be gone
 	while [ -f "$PIDFILE" ]; do
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
