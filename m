Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D6BCFC281
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 21:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13BB742B9D;
	Fri, 21 Nov 2025 21:27:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id At28No1tINEK; Fri, 21 Nov 2025 21:27:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3408E42B97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3408E42B97;
	Fri, 21 Nov 2025 21:27:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A0E531CD
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 21:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9288F40219
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 21:27:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nP0HQax70Lxe for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 21:27:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81F094020F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81F094020F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81F094020F
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 21:27:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B432519F574;
 Fri, 21 Nov 2025 22:27:06 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Nov 2025 22:27:06 +0100
MIME-Version: 1.0
Date: Fri, 21 Nov 2025 22:27:06 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251104214250.3738188-1-bernd@kuhls.net>
References: <20251104214250.3738188-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <a01bb11e95079ac3ebdddb3aa8177e4d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763760428;
 bh=TjZZD11TsED6MtGfvX7ockgsjJD6STnS19bidsN0EI8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GcihUX7Cy9eMnmxiD0LvMJh92uUSrEGSE9fm1f88qfAGBDFG40+MeL8raM+tBT1FP
 0xobYHKTC27dotuHeacmZEnjtQ/kZR5+0gSPFnz8ZUc2HGLtG940yKa3Nt05f8Q69+
 ta8NvURHGwNdzx8SQlNRsTLTYWXtXBRd0Z5SIi46j6wfokK10KpUuSIa310/uGrZEO
 /3kCjR2HZGXR3Qh55lGxtgK/v/cAmNQTbXI04owKtxuwyWZpBOZ7Mny+csG9UUl9tF
 3BvMK8qtd1AASqgqMvZHd3sc5z0GMqr6gIkHLWL+05dIa4Erlpr6SJOKBV5TmhWzgz
 90fvOFisb9tJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GcihUX7C
Subject: Re: [Buildroot] [PATCH 1/1] package/sane-backends: fix build with
 gcc >= 15.x
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

On 04/11/2025 22:42, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/296/2961e7aa23d66e7cf364c2caeafc1c226ccd48d9/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
