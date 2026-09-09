Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9057EC79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 21:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0944580E84;
	Wed,  9 Sep 2026 21:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id srWGoADHBas9; Wed,  9 Sep 2026 21:16:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 30BCE80E87
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788988580;
	b=SQZ3oAeiQMc7jpsuSS+R1i/fYHfz+dS1wEgzmXDIhHVP5vU1/Q679hLN8VVzJEiGjnrb
	 8lpePOoNhEoPsI2AOpC+RJWrgYFcJHi6k2VvzFUg8o70liZKjN02IPtF+uwAcvjAagPFH
	 tsfSrcxrJD9PmX4/ZgdDeBfxeuJU1TcBZarIM9htE6qRaM0n/mfpVu2egksucC2bedvu/
	 CBXZP9o6tgvIeCz6Gv5pm8CKscdaJpuizeLBwZR0PRXLXNaouYR3jYWWUTXW6gm7ACads
	 rXLgc/6sbJrr5cdDKaavoVm+4uyyK4spG9HeDBbgjTQflL7cNvnHu1I8xyHkmCeCNgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788988580;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tFJNSFyQ/MZ3kng8TpZHDhQH3WqimvN0mmh7CmujGbY=;
	b=ZW4zqRGII+ucYCLBThww2Ct6sg2HjBhpXNBYn+zqNo91Jcclyea8DJh7baKvsFc+1zsI
	 okmjuQrPXHy9ogpbBDiNWC3RzFJK8gw2VDj9Q4ik+8EXCoOliaFD/XdP5hWnaQbIcntAb
	 52+jFNQzMn3a1Jegn7zAATE/+2kr00tfEQGP69yg9DQqFEoSkUNuetFVSb3j3cRyCI84e
	 q6tKF3YgzDoOrJoopLtxKu7SGYJLBDDr/MBL3d+ATP2KXg5pd9O1XZG9wBsLTg2A7sza+
	 9ranyiqJMFv2ycoDwCVbHxvG7pzpYd+wBd9co8iKYupzPLKNTKmyl4q8L3KN5RRVDBw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788988580;
	bh=tFJNSFyQ/MZ3kng8TpZHDhQH3WqimvN0mmh7CmujGbY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PB+0T3d12Hwqjp1q26QEYwdX8f74cagUx6cP/IAj/SQww9gaVM6HOeU0ga7umCpTu
	 SwXDQyxijLXW5SerKJazqbjRRpXXvxV0FL6QRw/Q2DmnDAh1yoGSOasNOdfvrwj0uD
	 olfvEFtSW5xcxGOsBiBdT6KvC1ybxRB+XFnlhF8wR4eRDsjdaXQRA+rlJfYVt3htcX
	 gkeJhY7Qfif8kOt0Gi6XPTqL8jmP1aw8aChM8psNDuYJ104W0NO+7dWuP8MBr6Efki
	 AiTkJ74N4njuFjY5SSwd8ijawTQweVQCsvptmLCf9MZAVk5emrnaqrTa8lIkyL6J/D
	 yrzyHywVlZU/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BCE80E87;
	Wed,  9 Sep 2026 21:16:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8402E43F
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:16:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A7DE4026D
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YIrrjDxpmNAz for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 21:16:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 70E8F4026C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788988577;
 b=euuWUoPAeEsOzqfMiPYkbdb6qfPw3Wx85wAi9eT4RIwjZEgEG/ydF8hX91DNnzBbUJuh
 WOX364rS3AKSh53YVcGwmUUHYFfikAXyVlB4rHnASNPS2DlSAb9GJdvuD9UyPEGbiZkUo
 KpcGgtx7AmfDMRqJBW/tyQ5+/JwQk8a03G+bGPY9FGEsjW34wdxBZfUO3ZkoD+1H6xd/r
 0VlpBrxTZpW+lRSboqc0gL5lXNDbn3E0LmPlwfAqlm7Qd76tiPesXTIe4bE231eBjYDKg
 TK9r2Os27RrFJtuPn+2bHzSaqSP8ikfWn//Ounhwwmz8xBEl0r62+Of62KGoruo3upw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788988577;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=oTCV32xijB/gGlUJOyvDMbNC4WEk5PnpDO77TQqRM1o=;
 b=A7tWOdQ1hB0E6IxZAI7segrGAP7lSz7el+ZYnnP+T+61MjLp3npkwHJqfbGHanIgp6KO
 auF1IG1dXJAu+wGU/kmHlZwlNaAbJSV+XmQfYW3t0Uojvff+4kSWVkOc4SzQ7yCW5WG1o
 VD1X0OSkNtqgJugNORmazTA1jSUvqrJXOPeY/yyiRCLKhosBZShSFnInK/F8V2v0HRv67
 oQG1IaVbfqZ1JolUZfzplnSQuvt7jiAt+f5go8yVDTHNbB3BppJ5zBX2OL8KE9SgVg6Ve
 l4OB+0wKPVeYwPFlkivAi+dyMf6uZt/A1eeTjDItdtvQQQfjWHXbeZGnUqJmg+Ud29w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70E8F4026C
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:16:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4ECB995507; Wed,  9 Sep 2026 21:15:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 23:10:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9643c31c6a117d064bf0838ebb27e9dd089390b
X-Git-Newrev: 271bad50ffb2d4495f4bde4d28a51e23a3571918
X-Patchwork-Hint: ignore
Message-Id: <20260909211514.4ECB995507@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website/sponsors.html: announce Smile
 as sponsor for the February 2026 Buildroot meeting
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/271bad50ffb2d4495f4bde4d28a51e23a3571918
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Thank Smile for sponsoring the Buildroot Developers Meeting of
February 2026 by providing the meeting room.

https://elinux.org/Buildroot:DeveloperDaysFOSDEM2026

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 docs/website/sponsors.html | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/website/sponsors.html b/docs/website/sponsors.html
index 1facb3c2d9..02622babec 100644
--- a/docs/website/sponsors.html
+++ b/docs/website/sponsors.html
@@ -136,8 +136,8 @@
 	      <div class="sponsor-body">
 		<a href="http://www.smile.eu">Smile</a> is sponsoring the
 		Buildroot project by hosting
-		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2025">Buildroot
-		Developers Meeting of February 2025</a> in Brussels,
+		the <a href="https://elinux.org/Buildroot:DeveloperDaysFOSDEM2026">Buildroot
+		Developers Meeting of February 2026</a> in Brussels,
 		after the FOSDEM
 		<a href="https://www.fosdem.org">conference</a>.
 	      </div>
@@ -218,7 +218,7 @@
 	      <div class="sponsor-body">
 	        <a href="https://www.smile.eu">Smile</a> provided the
 	        meeting location Buildroot Developers days after
-	        FOSDEM 2023, 2024 and 2025, for the
+	        FOSDEM each year since 2023, for the
 		<a href="https://elinux.org/Buildroot:DeveloperDaysELCE2019">ELCE
 		2019</a> meeting and sponsored the Buildroot Summer
 		Camp 2016: Smile sponsored the participation of Romain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
