Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B88C982FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 09:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FB274070E;
	Tue, 22 Sep 2026 09:02:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c2zQG7PQNk_t; Tue, 22 Sep 2026 09:02:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4BAF44070B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790067756;
	b=GxLUif9pWZoGmQf6Ld/XsD6UhHKNoalE0JDSXFJZDEV+AYgryM8xgnuYiCGheniBSyr0
	 LVWKczncJs/RPfYEEn+Y9lgOM6YhWjWoCVlOaZv7+YSeXfqvHMXE+lBuyEFSzCuGKfVdJ
	 ZJrqzpqXL/uZfGz0dS5t1kgCXsALSIRZo7Ftw6NFrFP8GU72jnYFJOaBECnvKinPa4Hec
	 9wSkeM7Si7V0TrGBVa2ie5a4QmAJ7pLe1iTMjj5n8nRmUl9tPTITR9Q3Z52iSDdQygnSS
	 Y0gPI/sztc5JR866LXRtpXYMH4eT7Z9HsL7/VVSAfDMByNN/kOdj/r1qlnMYNDJVQGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790067756;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tSuVUM0A5tzHDZMjX2Zh6L6uxNS4BSyA3nrlLW4UDo8=;
	b=TMSKu/fVKVj2xYcdshq3uYjMWQqaFrfUel22eC7L6Pr1nF9Oys5skybXaJeKVfYhKXI4
	 79Svdy1QdPxkLelYGYe69B/MBcs0hmh0pd7Tc7CSQLFvWBSyizvPQI7GZJHE4q9MqWchj
	 FubCWEOQ/YW+6x0EJSGu+V/uM+t/s1jJvhq2TsAC84B+f5VGsDMQWZB0jtpfTXqfKIzU4
	 WTQqJ3du960C00S2oYN4yyy3SdX6pS/rLnUHYIfPe79lKQaftTS+Zf/Pzi7a3vX5Rzlua
	 yumrCtC7OsQ9cFn/+qf0c9SCbHudK6mcFnkot53Ur/Yw+2m6yuAAyD7jnApJEzHVPag==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790067756;
	bh=tSuVUM0A5tzHDZMjX2Zh6L6uxNS4BSyA3nrlLW4UDo8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ewTZcP2Ra7TcUK7t6txLeHHMUx1YXQC6Tjh+KrN2Gc/7OlM54U+tlrLfidBvN29U7
	 2N90gMEPhVFpfEb5V4x9dkBkO2mcP+Qd50bLs25NNEy1yCOo9f/aWWUM9NlfkWgaNU
	 NtY4xLrrUP+azShgyskG6DP9SBDgqfk9NSCKLU/tx3yFrvm05O+khTgt+3M7qYOqmg
	 mhojWgL03WEwAA93DoGnc8Fe5gOup7bTHxtXWIdufuMM2jHOMJ/MQwRLOFNpVsW7oK
	 ElAGDVD3C6T4TdX9OyesL/HyBGvBCfirFPp/RvCo65apejK0rqrAo8Az+MYKxvCckU
	 up7fwCEXXIYgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4BAF44070B;
	Tue, 22 Sep 2026 09:02:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A895012C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F396401F0
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:02:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-CsWuE8m5aC for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 09:02:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org B451C40194
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790067753;
 b=BahnMJ73WDPcHPnnMwwAcdABXWiUHVGfAEGb5yUFH+fPn7Buy/JRGOYsNOmmWMU7wXd/
 DsQvDtlCoB/UVGcvOV15ZWOK9fzwcn30u4YzKbycY4H794S0V6VRRHXUwRWgLHE9++Hnj
 EufouTiRWM7soWQgqTKVk3xhSsC6ebfnmaMW0N7u5RCl7GnAMv4NQVHE8qA6l3efKfpXB
 q5TjICxkmU+UNjIZNZyCs22JMEqDpOrY2trMOCurrNTaV/hcHokGf+8CDahUoU7QRRKev
 qdB7tP+9rOcLL8kslYlEhy32KgTN/2zXtd3gwv9CIiAIvVCkIth3QcZtRf53t4pTZmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790067753;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Dja+oHL3igEL1uLA1pW2U/Afh++JLDmd4J6UDK5SeKs=;
 b=AHF7rq1eI5lg4RFtaIPqU2nQr+zk4VOWqdI7vCHIbp4GbW9o5Wx5KUwcLxdDJjZPzLHL
 8qgqchz7C/Ff7qg2RCypdlIzG3u4WFJ9e7QCH6NdGqcw15eczZjoLDeRFka5EdqSDQjoF
 6HrSKxAQ5Npibwr+04OaLv+3QE3qcCJPOTb3PC/53IVeL5c37hWdi1SoVfiQzTrX/p/MY
 cDPa2FleyGbB4+x44FK0osrs7BxbjTFAfDwv0vc3jYfWtYlFvOpqQMBIbazEupL/1jFVQ
 Uio+9h1wOWw5cdvd8Jvd4gx2rcjXDmkmwh2ohRa357AgDaqmBXReqxR1mgOlZl7mV9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B451C40194
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:02:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 743D78D5DC; Tue, 22 Sep 2026 09:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 11:01:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a489e7c212b1e8b6d5ccc23bfa0b9c8e1a4621f4
X-Git-Newrev: 81060d467fed41280001ad1c31d002a712b2a134
X-Patchwork-Hint: ignore
Message-Id: <20260922090124.743D78D5DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: remove Koen Martens from
 capnproto and linuxconsoletools
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81060d467fed41280001ad1c31d002a712b2a134
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

I have left the field of software engineering and will no longer
contribute.

Signed-off-by: Koen Martens <gmc@sonologic.nl>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 DEVELOPERS | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 62e3eb278d..5cce270296 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2131,10 +2131,6 @@ F:	package/rockchip-rkbin/
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
 
-N:	Koen Martens <gmc@sonologic.nl>
-F:	package/capnproto/
-F:	package/linuxconsoletools/
-
 N:	Kory Maincent <kory.maincent@bootlin.com>
 F:	board/octavo/osd32mp1-brk/
 F:	board/octavo/osd32mp1-red/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
