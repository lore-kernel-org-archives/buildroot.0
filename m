Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC2AC77B7C
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 16:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D88820D4;
	Mon, 23 Jun 2025 16:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eUZGurIuguqI; Mon, 23 Jun 2025 16:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E266820B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E266820B4;
	Mon, 23 Jun 2025 16:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B40A7443
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:24:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5BEF403AB
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:24:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOd8xsl5N2_B for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 16:24:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9C179401C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C179401C8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9C179401C8
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:24:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44CF61C0D40; Mon, 23 Jun 2025 18:24:06 +0200 (CEST)
Message-ID: <1f81ede7-bb56-4e84-b873-edfbaa8d010e@rnout.be>
Date: Mon, 23 Jun 2025 18:24:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
Content-Language: en-GB, fr-BE
Cc: Buildroot Mailing List <buildroot@buildroot.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1750695846; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=KpsZFtA+IfymwMxvkfq7fg69WxaeZ8CdtA/mt1ylGeA=;
 b=XfF8RAyJOP1rJDqHIu59c6pGzrGBJWcx8K1SSxtbl0agaH9zaFlbjlJZpfVNwJmbLBwtIa
 ib7Ef63u0Ug5fZsLztVdJKgEAzGFkp7b792iI7qno0RZrKsdH/FN2VnjPmJNAJqF2KV002
 hEBZwZ4KFXlEXUxORs04fzbcVPIuiSLz3Yh41yLn1HTyznQeUzQg9LuMZ2XXDiZTPx/n5A
 WrEQA0sJbAyKFwPbDanSq9KtVbRusSVTIZuuFuJw38BfpOC2y0pjTrmlW3FIJXig1DyJic
 r3yOI7DukNA1sXAMjsTAP2XKKnVmJig+Goo+Nya2WkHOemJxJQD0UynuwExvTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=XfF8RAyJ
Subject: [Buildroot] armabuilder failures on host-tar
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBTZcyBYmFzdGllbiwKCiAgU2luY2UgYSBjb3VwbGUgb2YgZGF5cyAocHJvYmFibHkgc2lu
Y2UgMjAyNS0wNi0yMiAyMzo0MzozOSksIHRoZSBhcm1hYnVpbGRlciAKYXV0b2J1aWxkZXIgaXMg
ZmFpbGluZyBjb250aW51b3VzbHkgWzFdIG9uIGhvc3QtdGFyIChvciBvdGhlciBob3N0IHBhY2th
Z2VzKSAKd2l0aCB0aGlzIGVycm9yOgoKbWFrZVszXTogL2Jpbi9zaDogT3BlcmF0aW9uIG5vdCBw
ZXJtaXR0ZWQKCiAgQ291bGQgeW91IHRha2UgYSBsb29rIGF0IHdoYXQgaXMgZ29pbmcgb24/Cgog
IFJlZ2FyZHMsCiAgQXJub3V0CgpbMV0gCmh0dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcv
P3N1Ym1pdHRlcj1TJUMzJUE5YmFzdGllbiUyMFN6eW1hbnNraSUyMChhcm1hYnVpbGRlcikKCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
