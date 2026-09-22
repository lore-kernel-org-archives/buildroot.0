Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2BDC982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 17:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4064260710;
	Tue, 22 Sep 2026 17:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gzSj2XKzdzsK; Tue, 22 Sep 2026 17:22:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B172360613
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790097752;
	b=KYy3tXabt2FGZFi9jf6nHOqCurZQKFPxt9I4Vk3NfaEYNHQaEyT0RXKsPQwQgf67b87B
	 NmgRp5KjhRNskidoIKLdZJIUa9DO7dObLAtlMrOeBSqrdEZzS1wU2swyaiqAr5gydsaHQ
	 UTvjf3tVzcZ2+fivxF4b5/U2D3iOAhxO27m5GmIIXz0uQGQmJ2Pq1EkHWxBu4Veh6yOOd
	 LknSlvNYqZUnZ+Utw8cmg2sYenHACMTTsiav3wmDe2kpNTYjXnNX+D5YWS3D+PYEGtQUy
	 RUqs6Q7to5VBLx1fkfQbq67sy15ApYPK0gufHZH/dbaA6B5Fj75IGQkkTksGdkzWAUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790097752;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OUcCdzM0ZG38q4HcZNJppLuPsabJPDcL/FHqExeX8As=;
	b=A1P7As2KZtXYntOPnEUunNScqj0tsITxTI6PLV1RlTKmBVtpUTQCxOcnD5YUKEMufaOQ
	 /xh33tIHT7QBVtrIiRYMrp8IYfybwZFtPUyFKjdlNjxHkrI4YrLFKLsfK+oYX0v8NrLD9
	 rzpjI3IMMBrO4cy62mB3wzDZ0wATbsK285wftNlEhR3KTpQNIxSEFvajFy6InSKupEMcK
	 sAOTeuu3y757RUE5CT3FsSFesYThd8zpbDXIhNPHsuzjwqE4cz4gliexj554eA2ea0W4Z
	 Ap0ENUqAlpT2nDOpf9Mg12Igset1qFJG4REVSuI09tVCC37XlQgpVqDHkDNuCQTLyug==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790097752;
	bh=OUcCdzM0ZG38q4HcZNJppLuPsabJPDcL/FHqExeX8As=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RvrlNt4y+B0gt+Za7fwUyTWCpXbHBvxRYzmY/qSqyWellYMy+jorAWaK+imKyUySY
	 hROM3uJSI/nweKq+Btp1rSYjiUTE9nni2DfzuqQxc7njzzcsFSVoTayCi30liyxr/V
	 ahtMB7yaartuWWYbeig9btOnujnKeNhPwpNP9WVnwhvHMt2MTs4TYhtOtZQMa6v/h5
	 b3siK1jMXimoNl2jqjRFaUQjPvu1gtX97G/LZLbUmqFgYO/5JHo4R7IxxAT6pCIzPn
	 BsGshV3lXk8exqMxXAwphAHvaEVMnQ/kE9UnSlEsgVjX4dkM2qxsh6PjQguCNOqZcH
	 JKgMom92c16Ug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B172360613;
	Tue, 22 Sep 2026 17:22:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0A8D1
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF71A60613
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:22:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YCcdcLZIxZ4N for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 17:22:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 87363605DA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790097749;
 b=TjD2vlQmpNwrAYOGTEPIRAVLiXVqeNC2a7Nwz2NhDhb96BaYLeYLrP5dPKq3WFIRFYsb
 H3zjYG4IlxlIhldXtTHwNvQohKKmJllt1E8ssv1ZoDBEHRjmlB6o5n1EcbUc9bVzFTvGJ
 M63ECh+ZWbhiRoow7XvnQ4it8w3BV8PtfkIAjMAg4ii828SGl7wC/TGAhmGTmkTGE7+/I
 8IvzY3lu0yfzd5Qx/t7kJSHBqYn2FwBrOO2P6kO5gpaemIG+R0L2v6fkx5F+YFLuHZCPj
 Wbj3Sc5JVPmUPUfL6sPNvE0lXwi2wi3ttNlAbZTjlKUzH8u/MpJbeq6NqG+ZYLLsh4g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790097749;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=61PZ3xevoeAcDBVGbyBi6uM7FTP45eCt14K66h4l+nc=;
 b=MEcGjepZgr0WqvkJ53ZtP0nagwrFYYQ04dsgO6MeSTZXV3ItBrSudvNqbkPJR7i6C5Is
 b1FMrvM2UTrDZ2Li+hEic0WQYZH5+tBwYqFzJ7fQnETZVilNk37ah2OL6OHXPApy/LbUS
 pPjbTcLUaBjU0ratK33JuYn9ONAHNQn3M4g/Y4u/Ze023qdQJ90PDl/1+MQ5HIeM2zu5P
 Okii/u3802cVbp77K7kQng6+1/mtvPofXDhtvR6lbTuQTiulwZ06MhX3R9HVsC4TEtyVV
 fzuQ02AI/39f6mq30azsFcLMiUE6RCCyPomfq9xh5FPCptUZsPtQxqeiFH6/inQILCA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87363605DA
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 17:22:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 27B45976A8; Tue, 22 Sep 2026 17:21:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 19:08:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ce1dc60fb6209d7ed3e82be6a5d79d3635b45ea
X-Git-Newrev: d8f408b1f16d067d2e676f3db91e7b337aebe160
X-Patchwork-Hint: ignore
Message-Id: <20260922172120.27B45976A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mrouted: fix invalid daemon path
 in S41mrouted
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d8f408b1f16d067d2e676f3db91e7b337aebe160
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

S41mrouted hard-coded /sbin/mrouted, but mrouted has always installed
to /usr/sbin/mrouted. This went unnoticed with BR2_ROOTFS_MERGED_USR=y,
but the daemon fails to start without it.

Also drop the script's executable bit to match other sysv init
scripts that do not set it.

Introduced in c25115daf2b2761a2f0f411790c6d24b460c7999
(package/mrouted: add sysv init script).

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mrouted/S41mrouted | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mrouted/S41mrouted b/package/mrouted/S41mrouted
old mode 100755
new mode 100644
index 7dca258255..d653425719
--- a/package/mrouted/S41mrouted
+++ b/package/mrouted/S41mrouted
@@ -11,7 +11,7 @@ MROUTED_ARGS="-w 30"
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $MROUTED_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
