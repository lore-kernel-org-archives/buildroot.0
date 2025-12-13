Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3229BD5B162
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 20:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8819815DB;
	Sat, 13 Dec 2025 20:04:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0610tj0afh9X; Sat, 13 Dec 2025 20:04:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 022BA815CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765656242;
	bh=+hBBNrx9dUc3FGNCJ22tSRKaVqQh+gs9ayMOtnA091c=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iQP3MT+3vPLFc88ypoG81uPHMG7mpHlxQiE4MeZjnykUlgj0ix+A2nhnW81Fc1/bl
	 GUILFFstHYsy/W+Z4iEEpQZNM4I+9CCm3GuGddKhT3fBopcctX2/X+Qwj9FBWVfIsL
	 CKNFtz6mGVcNgaoA2dVyjE8QXzcWjqHw+Zr5Be3J52o4tpxXvgi5tw/9EoMktiX6jJ
	 tduvKcLm1NPkKQ24SR4MbHTBI+j3acUNGS3WTNKrQvwr4e7ysOL4l18H2/05DQSxwk
	 +tc6bZkRXCbLk2FKu/FAgDH2wgykhRjMTECzX84QwGtLKrn1YM8RiPtX2FuGj67sMW
	 KdPtGYht9l6lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 022BA815CC;
	Sat, 13 Dec 2025 20:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0DB72C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B33BB4018E
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rP4YzoFE8gnN for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 20:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D5A81400A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5A81400A0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D5A81400A0
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 20:03:59 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0D191B00571;
 Sat, 13 Dec 2025 21:03:56 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 13 Dec 2025 21:03:56 +0100
MIME-Version: 1.0
Date: Sat, 13 Dec 2025 21:03:56 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251208151423.309131-1-dario.binacchi@amarulasolutions.com>
References: <20251208151423.309131-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7c70b378bb7ddabb033ad2a45e857488@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765656238;
 bh=nf/oNr1x9kVrhrBCk0zShjPsT/3D0mrMGkfYPoGZ7O4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hpnBQ66EfzW7t0wnoEnKYsXufoj5NCl9dJda195IRN8E738K44rejPDbq54px2Io3
 P3hzHg0iYaX7fzxUlHSZ8LWZGbMY/V/MjNpHTi4oQmrppWAUuk411ygnVNb5muRCuc
 7wNRS8AW+Z+C2W2F2WfYhCRsyv3v3/296E55sOnzWGZoKBCZH+tr+R24+Dk7K4u337
 bzitzTQP/+PW8qrkMjpUUTc0enh0gag79BPJdAbYDPmoS0CUYKPFVKcHWZqy0LaXof
 YeApg/tP+7gnBZIFiYcgVwPxzWRVQ0NN/9NCGvG9ji5kkKj+VzsoqNckipeoP5M6/9
 4v0mH8VQj/vJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hpnBQ66E
Subject: Re: [Buildroot] [PATCH 1/1] package/cmocka: bump to version 2.0.0
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

On 08/12/2025 16:14, Dario Binacchi wrote:
> The license file has been renamed [1].
> 
> Release notes:
> https://gitlab.com/cmocka/cmocka/-/releases/cmocka-2.0.0
> 
> [1] 
> https://gitlab.com/cmocka/cmocka/-/commit/01cd73ee646870ba5c94a4b53a873229956a2d02
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
