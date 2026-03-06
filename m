Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0AABFCC05A
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 18:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85BA6613BB;
	Fri,  6 Mar 2026 18:41:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqsD1JJLtzTx; Fri,  6 Mar 2026 18:41:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC32660824
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772822507;
	bh=6bxDXoR5/HhpgY/WuvFjVRBL9W9CZ5Z6tRPDd6rsTQQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eDseV1oraG9a9jft2GF76INvz4AahwTgEaaJCFMA7Sc6ziLoT+eoIipQcdEfqS+qk
	 KEsUWTxWf+2y9Z1yB296gajZvgdiDRNwoPQrAuwAUX7ixSBsCHTaV0l0K9YOLCzosO
	 JgO8/Bm3gjcwT3lHcS+G8VEOqPsQAhpWuQVrtfaYmq+u3eE9PA7Atbz2W8PcQ4PgvP
	 xSS5Cq+Ddo2Ljck8QkqronW8/s97WvzCsLnS2xZfILQHcotoG8EJqT6U/UjCYuuWY9
	 5BAUg5NJtz7gGQbLJ2lS4DYX2QzGXrlrfS8UYxRI6ADhTCSAEirqZ/OJXC+Oq1NXxu
	 1H48DBswdzNiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC32660824;
	Fri,  6 Mar 2026 18:41:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76E7825B
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C7DD40549
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:41:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HswTRQVWQFXw for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 18:41:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D23240147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D23240147
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D23240147
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 18:41:44 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4EEBA2003CE;
 Fri,  6 Mar 2026 19:41:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Mar 2026 19:41:32 +0100
MIME-Version: 1.0
Date: Fri, 06 Mar 2026 19:41:32 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, =?UTF-8?Q?Andr=C3=A9_Zwing?=
 <nerv@dawncrow.de>, =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel
 <petr.vorel@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260305210950.3471974-2-bernd@kuhls.net>
References: <20260305210950.3471974-1-bernd@kuhls.net>
 <20260305210950.3471974-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <37d586c2b5d770d0804a285d847aa089@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772822502;
 bh=HUttGUBgcjcxA3CoP4yBI1vfi94yPGaHh18mbl0phIs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ckvA7AoiKEiU95n0klIxeidr4N0VnqB5E5z9nw/d8g0Dp9dsWbUrepXK0NZXSP2qZ
 zTBBH5hmwPR9jzW8EZbldivywm1F9qfHkvtliSp3M8nGspRq+mPKGBBIHcN47d+whD
 PFP1pjGNp4J4fqaKmWxRx2/oaH1zreYeVFSQKKqdlEhHynN6FGPuXMS1++w4jBsT2K
 /E1fGpOnHqwRDKhOljlW1KISjTHeWt8aw0u7JF45UPy4vdvAd8w03FZpzesCrsjjv9
 TvjZ1d3BGisn5eqh4dnHscixdeKU1tqBbfxNMJDoIDPMH/z7HXd08hlFqN5EyHM8NR
 wmaJjdCUKxoyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ckvA7Aoi
Subject: Re: [Buildroot] [PATCH v2 01/14] package/socat: bump version to
 1.8.1.1
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

Hi Bernd,

On 05/03/2026 22:09, Bernd Kuhls wrote:
> http://www.dest-unreach.org/socat/
> 
> 2026-02-12: Socat version 1.8.1.1 has been released.
>  It fixes compilation with glibc 2.43, xio-netlink.c for Musl, and a 
> few
>  minor bugs, see file CHANGES
> 
> 2025-12-08: Socat version 1.8.1.0 has been released. It fixes a couple
>  of minor issues and provides new address types TEXT and STALL and a 
> few
>  new address options.
> 
> Rebased patch 0001 due to upstream commit
> https://repo.or.cz/socat.git/commitdiff/2cc1f11d02928e7eca9560506dfc6e97a0ac92e3
> 
> Updated hash of README, used as license file, due to version bumps:
> https://repo.or.cz/socat.git/history/HEAD:/README
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Reviewed-by: Baruch Siach <baruch@tkos.co.il>

I applied patches 1 to 12 of this series to master.
The actual glibc bump might need a small rework (see
my separate answer).

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
