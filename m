Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4199E65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8666460769;
	Sun,  1 Feb 2026 20:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MojB-OTOfU4H; Sun,  1 Feb 2026 20:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6607960669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769978212;
	bh=90V4xWZ78cZ/Z3fDjAwFCTcJYkNanlyzjhgWoHa9Qk4=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DkQTwGP3a3krz7Bd8WzO+pZ2rbQI0rjLWG7GztTF56Q5OOsGZbkIdfz+0AM0lm83v
	 4DdGSdYBw+dlTLepbiZcD0FOkw0ttKI0N8XK9A/g9esHvGtt2bQ2Ij1zTp35cf0++E
	 A+KtdFE5omd/BWQnMGd5UEz82gJgom516UVnmFCfFVULjRr7TTcPYzHd2mxxkgaify
	 JRqtvQueW07ePlVZ6CTsX2DY6q4LoUAi2Rf2crYBI+UgkGQYEAhoKDZZo9WDugoZPr
	 s4HyrLuqgUHNFA3cHLcODWmXMEIcDXJKNhegKboGB06aFxRFHc5VMoUTkP7wzTlHzx
	 o5Vz3A/OuRsmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6607960669;
	Sun,  1 Feb 2026 20:36:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A3DD23E
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFA3E40611
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WF8Nzg5SEOd7 for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:36:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A824A405FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A824A405FB
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A824A405FB
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:36:48 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 253812117; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 01 Feb 2026 20:36:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmeBC-00000005k47-3BKe;
 Sun, 01 Feb 2026 21:36:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Daniel Price <daniel.price@gmail.com>,  Martin
 Bark <martin@barkynet.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260201093357.981428-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 1 Feb 2026 10:33:57 +0100")
References: <20260201093357.981428-1-bernd@kuhls.net>
Date: Sun, 01 Feb 2026 21:36:22 +0100
Message-ID: <87qzr49p6h.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=It6Uk7vbh2V4pyBwp9yEXjBg0DkdFkQEGz0S1WxWnyjuZABp0CPGIqSlJ+mGuxdJZ40vY809yLS0AAMEZkU1TedcV8Ht/sVT8RLAzeKe2mvOcrFWYHE6D/VGQmbHs5cS8zpsUgtOVLg+BZ1ONWTVmLJHgGhVBxpSSaUnAYU2bdZb8H4SZN7sQI47aO0zADrHZLHhVQ9hicGkzxKfB363jjWMM53H6zf+WQPcrJRiKul02MCyzk13aUozuF0jZAX0zFf1aiIITaxK50JYSDeuJckfjflZQkPYLpXkJQXeqJ2OWsZ53otgwGV0TpjLApzcbuuHMd4m9/05p2HFSeblEQ==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=q6Ut3/GqiDZjOJmINF97v+kqJJHhHQSM34H2yT3hBv4=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=It6Uk7vb
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump version
 to 22.22.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/nodejs/node/blob/v22.22.0/doc/changelogs/CHANGELOG_V22.md
 > List of security fixes:

 > 22.22.0:
 > (CVE-2025-59465) add TLSSocket default error handler
 > (CVE-2025-55132) disable futimes when permission model is enabled lib,
 > permission:
 > (CVE-2025-55130) require full read and write to symlink APIs src:
 > (CVE-2025-59466) rethrow stack overflow exceptions in async_hooks src,
 > lib:
 > (CVE-2025-55131) refactor unsafe buffer creation to remove zero-fill
 > toggle tls:
 > (CVE-2026-21637) route callback exceptions through error handlers

 > 22.17.1:
 > (CVE-2025-27210) Windows Device Names (CON, PRN, AUX) Bypass Path
 > Traversal Protection in path.normalize()

 > Version 22.18.0 includes
 > https://github.com/nodejs/node/commit/a2d2d36bb1c8a5599cda5c5ed7b65ded2abee72d
 > which fixes build errors with python 3.14
 > "ImportError: cannot import name 'FancyURLopener' from 'urllib.request'"
 > introduced by buildroot commit a0a6abc8b193e5bdab5326324d7299c19d5d8c67.

 > Updated license hash due to upstream commits:
 > https://github.com/nodejs/node/commit/ec60473ab1e4980bf6388b0d5ab34fb86b3ec466
 > https://github.com/nodejs/node/commit/0b5613f9fe38fd0f500d0bd147fa7d442189c7e2
 > https://github.com/nodejs/node/commit/0edf17198fe118c6cc39746feb8707a91d739f94

 > Switched _SITE to https.

 > Fixes:
 > https://autobuild.buildroot.net/results/da8/da82dc03cf0d42463fff1b5d9bf7a3c18cbf44dd/

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
