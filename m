Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107C3CD98E4
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 12:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C283E85D2E;
	Wed, 17 Jun 2026 12:19:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugyUwgsqDxXu; Wed, 17 Jun 2026 12:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42B4F85D0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781698798;
	bh=qoI24tKLCsuc68up1TWFZZBODv8owmCUH2Q7QVda77I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=caXj5ziTcgC5tWbLPtilfvmdjPAq3lmvd9OB69l6F6vzsaejlPVtrjhrEQL2ho8EA
	 IbGeSCyNlWeijSl+DfwOuSg4rpWDPV5VU89mQmbt1ldnb6wZhDasAak9QadakLsM+V
	 dAcNSDaQcUOO5s3LeSGpTsPCUJG+KEcwkDQVQcfcK7JAdMX0qAY5CXE9UZe1CCnMWU
	 erUOtHjx4a1bqqvEdsfOiI/d6rcWCxkXY6HJifN4Dx5PjWxH04mybv63RfL0bPxtTI
	 +kPqcaIk/c7/nJlDifUHqeiujOyh8BGr8APOlRMgCV+zkzIQdG0mZk1YowBjtzX6i/
	 koILVD3O9JIVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42B4F85D0C;
	Wed, 17 Jun 2026 12:19:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 755AF355
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 53FAB4ECDE
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zik5OSR2UuVK for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 12:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABEBC4E7D0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABEBC4E7D0
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 12:19:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E14E81200; Wed, 17 Jun 2026 12:19:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jun 2026 14:18:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 118ffb20b5c739c61448ac6036f38a2aca6afcbc
X-Git-Newrev: b2d84525f9115f4f04a4814f29b87a17db58569e
X-Patchwork-Hint: ignore
Message-Id: <20260617121934.1E14E81200@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd/S95mpd: do not wait for exit
 if sending stop failed
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b2d84525f9115f4f04a4814f29b87a17db58569e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

If sending the stop signal failed for whatever reason, waiting for an
existing PID file to disappear is likely to block indefinitely.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Tested-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
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
