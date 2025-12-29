Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F94DE92FE0
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32EC381D3D;
	Mon, 29 Dec 2025 21:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgi9ZCndAFcr; Mon, 29 Dec 2025 21:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB59481D24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767045537;
	bh=6SshxI2hXXFYjMIk/90cOBM5L2ZUIIgXRcYm7eugMM0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=r/HFmcULIyBspKJ2KX9WznVmZ59xXL76L7q7yKn/Sizv62fC4DojvjjjiPimRqGv2
	 V1twHbeGcuJor9cwzSmzqbwa7yULj6YBG8k0rSOfi+eKBplVALyidbiZ+xKP6DnwFN
	 P9RzWuYF6oGgK9Izqj/zIkh5XPm43zi1ZDzcgP4az/Fyh0PuGH42uwAIbtjFfaFh+d
	 ipscL/VqILGUZQXonr2QvbJmkEmONtMODugFh5Kntyr/Q2AddcF0QC49Ig7fHmLuQC
	 IchEFXHgseuB5rcMBnOTI68JF51TcvKabar697sUg2Jv5imZr/8s6UGHXzEfLFaLIl
	 i+WBzm2+IIjHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB59481D24;
	Mon, 29 Dec 2025 21:58:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A3C75D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88ECB608A2
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLf3TgW_SvXH for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:58:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B7CC9606D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7CC9606D6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B7CC9606D6
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:58:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7B8415FFA3;
 Mon, 29 Dec 2025 22:58:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 29 Dec 2025 22:58:50 +0100
MIME-Version: 1.0
Date: Mon, 29 Dec 2025 22:58:50 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251229074459.503126-1-bernd@kuhls.net>
References: <20251229074459.503126-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <286977fc16011bfb70d4c5eee919efa1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767045531;
 bh=DqFWIJe1zeE9XAB44+xbhbmPjpV12USy7jJ5034VpKs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=l5H4CKMFfyaZIbZg74RzAra6dnTIIQ2JrSWl83zCZ4BvbPXKkBf4u9ZhsdPy7w2+D
 zK/kja2Mngk5Tlf0xw+0RFUrTa3cSkKefUt1YKfU8YI6Te+4wB74K2tFPCxN5/mCWJ
 bM/eLhwyDft8CF8gsaKw7YUv69DrGIkKVjvzGlCsjDfbvozEuw91RsQGuK7nk0SG5k
 44PrGspjAoIYm9fiF96UKWg6nTcddlldP/Lh1SOZJkyTFzyFbz5OWY0rcIuRJX6Px6
 kcfSGV7GWu780F6h/pta54Z7nSXsnUEpz1DtlomXfQsinmNfI0Yu6BUwhrFENnzrM+
 xd6vMegLxPjiw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=l5H4CKMF
Subject: Re: [Buildroot] [PATCH 1/1] package/xmrig: bump version to 6.25.0
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

On 29/12/2025 08:44, Bernd Kuhls wrote:
> Changelog: https://github.com/xmrig/xmrig/blob/v6.25.0/CHANGELOG.md
> 
> Added armv8 and riscv64 (riscv32 is broken) as supported archs.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
