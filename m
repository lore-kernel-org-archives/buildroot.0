Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB78C43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:49:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B92A240EE4;
	Fri, 26 Jun 2026 14:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOj8jaCdrH30; Fri, 26 Jun 2026 14:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB65040E17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485390;
	bh=xaSztx6u9nNcS9TjB8gS1pgpeLt0ErI3Thhtp1O3JI4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=H1tDZei/Hv6NN85QZ0adyfTabKMrvts6gFTYnzuq2QIvvRjFVXh7yCTKSZtE6KLWD
	 DNqrsavIBm2xihiFYX2fx0pbZXmH9IYbQqXyuOXlSbVGSIbl5Wc6QhsX+FvRndbDw9
	 HkRcQkZhXtGQ3BXQd/Us1n1e9rE1QyrSm9b2mqVQ5sxLp7zYyZYxXF/VNQo4+UMXeZ
	 kwDNuUwpgEbNpRPtkiTfekAu/7fOvDVqkpqeFXxC25Y7EkYRrvmahvCF585fWx1NLz
	 Tw+pkpuuDqKPpbHVvtka5A5V+iK6LI01v3e1K5SqXgI40H713v4nLnqSlQy21Br5h8
	 Jq6BxH+4wJhLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB65040E17;
	Fri, 26 Jun 2026 14:49:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DDC014A2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03EF38221D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIdZVJW1jB6w for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F196E81FC8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F196E81FC8
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F24B8864AD; Fri, 26 Jun 2026 14:49:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:28:20 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 26af331ea3073e396044ff5340609b1612cb1f82
X-Git-Newrev: 4cc43ad01416e6c817d825c64ed9fc09bc742ed2
X-Patchwork-Hint: ignore
Message-Id: <20260626144919.F24B8864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/mpd/S95mpd: do
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4cc43ad01416e6c817d825c64ed9fc09bc742ed2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
