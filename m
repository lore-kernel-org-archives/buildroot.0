Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F94E668B4
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 11:51:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C1D940898;
	Sat, 20 Dec 2025 11:51:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HzzYVJnBOlW3; Sat, 20 Dec 2025 11:51:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEFD8407A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766231463;
	bh=vzaiBKsOrguX7FwdJzrDvcORqr2B+Eq/IPDQTNhuTEQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kJwW2liH7FUjmOPb/PYwBlIXYKkc7Xs5yJE4sxPPW8vpogVuPjoRjfuqmICCtxR/S
	 /veOMCXHAmEOAXY6yQPTjEd2IC7GfG+x32qfIEV926i42vFaukj6LBjfZdmNWhsidl
	 ROaee6uuJdxCSt36SspyHlXhe2pFilWwAt1aMw9aPLzVMC830pk66pRQkg5hWte1YL
	 2aPRZ9dwLQMstly9yRyvJQevvfv/08OUItZyllCggVz7WEO7/Hs19GVXW1P2sJDrw7
	 OB2kl0khKZL7533m71K3T+C+oyuacJBiQDg4Bs3+xTGGki5e8WBU41O3qjDmFVrQ5m
	 BsTqojP5VisNg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEFD8407A9;
	Sat, 20 Dec 2025 11:51:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 22CFA1A6
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:51:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09615401BB
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:51:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMl4EHLK6a5M for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 11:51:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6BAB400B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6BAB400B9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6BAB400B9
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 11:51:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id F28F3B00571;
 Sat, 20 Dec 2025 12:50:58 +0100 (CET)
Received: from 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9
 via 2a0d:e487:416e:b4c0:bc35:8e33:c88c:ebb9 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 12:50:58 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 12:50:58 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251203170002.1768608-1-bernd@kuhls.net>
References: <20251203170002.1768608-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <1e4ca4ccb31f78a14e9f53b482465c77@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766231460;
 bh=+9Sp3Kiqacb4lEld3nzKMTRpcnWayJpPro49ntgdjEI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=GdEpo8B1ZMdfP5paQS8YXxq+tIOe8/sJxSrmIARsF5e7amRwM+yOl5E+S7zSE7ekZ
 RzOckAxug6VATEr0WHcsDT9h4k+riFrDtAjV43MWvozaSTjoMmIJ8u7gTARtKoisVB
 tjKtbB1NuLt0hNdy36lxtcRSNmtv7gCyr3tmipy7ZB8J67tqJMkB+9AMICsVhJNYs0
 c3n9QJ6ds4uec8yM6irmIsfeXLocfMnnsESiLjkTTZtpNVhiz9UKeBLgAqC+810G1f
 uxFII8UtCBCuE9nr9xcenooVwjsLNJnzcfC79QFZBmyqnqK9CSpp+nqJhZbMkTlhWK
 dA4P7nEThD3hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=GdEpo8B1
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi-inputstream-adaptive: bump
 version to 21.5.18-Omega
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

On 03/12/2025 18:00, Bernd Kuhls wrote:
> Release notes of this bugfix release:
> https://github.com/xbmc/inputstream.adaptive/releases/tag/21.5.18-Omega
> 
> Removed patch 0001 which is included in this release:
> https://github.com/xbmc/inputstream.adaptive/commit/a224dc66e93aa0d79152ef283cc7dd2207f7cf7d
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
