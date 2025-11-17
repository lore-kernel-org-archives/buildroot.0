Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697CFCEACEF
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39FC041330;
	Mon, 17 Nov 2025 21:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uZXaT3OGi7zc; Mon, 17 Nov 2025 21:07:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AEFC41317
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6AEFC41317;
	Mon, 17 Nov 2025 21:07:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 83EA2D5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75ADA83E27
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:07:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kM1A5lyXFqDs for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:07:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B916E83E26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B916E83E26
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B916E83E26
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:07:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 28F1D19F5C2;
 Mon, 17 Nov 2025 22:07:30 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Nov 2025 22:07:30 +0100
MIME-Version: 1.0
Date: Mon, 17 Nov 2025 22:07:30 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251117185703.4082205-1-bernd@kuhls.net>
References: <20251117185703.4082205-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c75fb2f1ec45d43984d85ade5964677a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763413651;
 bh=aMzkT3UvWW38B6EM3EhEyZqKj6ejSACxL1J/AsicihA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mLCyXcMLZpm1gq8EsuP286Kc1xvg/43fl1s+H+tuKuSiAeOhZQ9FBm5/Ujjk4/GUD
 ljD2bNRoXPN452LxDoBjFkyNzDsPDDkZO3NqBwWRabA/fWQLvshaX1Ef92BHjClmFk
 nrcMvpIguuMJPSv2eqBeytrIys/wLvaHQgkL0esgJD44rhzRxdat3GWb89Q/8NcuVb
 HTHT6Fda+8RddurLtwTZqI1GhZyVRu39CxA+YB2tCFdgktqVazWqucaMCbsL/AvRSI
 u8bCjjozNbvoEIywwoM1D0n+5eXlLQySWoFiWOpTdh9QWUlTGH9DyfSQqIpjb/Sd6f
 2e+l5WYbR6FVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mLCyXcML
Subject: Re: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.129
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 17/11/2025 19:57, Bernd Kuhls wrote:
> Release notes:
> https://lists.x.org/archives/xorg-announce/2025-November/003642.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
