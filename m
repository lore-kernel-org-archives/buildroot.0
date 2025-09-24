Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3262CCAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 19:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2BE141390;
	Wed, 24 Sep 2025 19:35:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nf-bYeOCWwJp; Wed, 24 Sep 2025 19:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10AD041348
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10AD041348;
	Wed, 24 Sep 2025 19:35:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 44621177
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 369A340D0E
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVCLhaqlYdZP for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 19:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3193B40D2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3193B40D2A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3193B40D2A
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 19:35:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 35C065FFAF;
 Wed, 24 Sep 2025 21:35:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 24 Sep 2025 21:35:52 +0200
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 21:35:52 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20250924154316.17015-1-fancp2007@gmail.com>
References: <20250924154316.17015-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <ffbdc8fbbd0a337948dc828cfe615475@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758742554;
 bh=hXqui7J7Pj+rDVhy8DfAV3jjCCgw2Ntnpu5FtBRDUSY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NwDkG79N6QrkPrlcEEGyjzNzkC3Yh7/R3u26FEJFhxq3elJYxA2LOx6r7Weq/nkiW
 TP+VMDDgtmQC6f/9bgc75ruRzBVh1Je6yx5KB6aaEYJ74wQUKRKWpx5oDK4zSj+Xkb
 3Zg8C8xLX6WdawrWzP+gbdLtABjueOiG5wA5GfSOITERIijQQ84LoUqzCQl7Te+UI8
 RLAw1s+iS+3GPslJp0VCBu+Wmbt0FrXkbbU8Qph7yAvzjzSRKIW7AshCuCFavIetYS
 0Q4x61fgphF8szMXILnR48GtjnQPOTl7kIVXkVHug/foqeLDyyT4Sej6AK/zcwgYHE
 lvXAJ1IgucL2A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NwDkG79N
Subject: Re: [Buildroot] [PATCH] board/qemu/{x86,
 x86_64}: fix shellcheck warning in post-build.sh
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

On 24/09/2025 17:43, Scott Fan wrote:
> This removes a warning reported by shellcheck: "Double quote to prevent
> globbing and word splitting". As a result, the file can be removed from
> .checkpackageignore.
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
