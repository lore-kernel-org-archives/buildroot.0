Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FFBCEB2E6
	for <buildroot@archiver.kernel.org>; Sat, 15 Nov 2025 17:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3559783FC8;
	Sat, 15 Nov 2025 17:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bnA1ONckRKc7; Sat, 15 Nov 2025 17:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7931B83F7A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7931B83F7A;
	Sat, 15 Nov 2025 17:36:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B5951158
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B331140DE9
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UraI4QCXgWO7 for <buildroot@buildroot.org>;
 Sat, 15 Nov 2025 17:36:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D005C4035D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D005C4035D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D005C4035D
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 17:36:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 481242003CA;
 Sat, 15 Nov 2025 18:35:57 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Nov 2025 18:35:57 +0100
MIME-Version: 1.0
Date: Sat, 15 Nov 2025 18:35:57 +0100
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20251115112654.392564-1-dario.binacchi@amarulasolutions.com>
References: <20251115112654.392564-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <061b2c35706886519685ab458f31c4b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763228158;
 bh=H0ewSTfgooFahvMukcFo2ziy6oPZpZhoMrJowRAGvlU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BAQYw4/mLq7oHPFSyWXdeOTdVK471WEZxbooNOah66VO19hU/vbkzzApWqEd/CDIJ
 OCcaX/zuAGQ2Ty3myl+XXppmregC7hiS/22p2zZMW0uxy7qTekgs+ae3Wgdnr89r3S
 BE6X8jZJ+UTp523npVZoebtvG2g2OWt+5srZu+t5Kse64EO3UcG14xT1mcCwmN5J9u
 AaKbBDgK3YOMFb+tcd2fw6C/SrNLmepBIMlXHvKbqG6T973X1czszQe1QmTv2OvNms
 qqIM+fiMV7FwFw+Ffj3SYTiKHlmKNmwPmWPiIT5a7mAkeVui8o2N+X1ThVPzID66Ep
 LE/DDoy5+bAgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BAQYw4/m
Subject: Re: [Buildroot] [PATCH 1/1] package/{aardvark-dns,
 netavark}: bump to versions 1.17.0
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

On 15/11/2025 12:26, Dario Binacchi wrote:
> Bump the versions of those two packages, that must be updated in
> lock-step to minor-level compatible versions.
> 
> For release notes, see:
> https://github.com/containers/aardvark-dns/releases
> https://github.com/containers/netavark/releases
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
