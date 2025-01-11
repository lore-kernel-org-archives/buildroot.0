Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A81E5E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 17:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B82580BA8;
	Sat, 11 Jan 2025 17:59:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JcTu9Q30UFOw; Sat, 11 Jan 2025 17:59:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B159580A4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B159580A4B;
	Sat, 11 Jan 2025 17:59:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E906F940
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E473660A5C
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7c9qBDsH6HC for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 17:59:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3FE2360708
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE2360708
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3FE2360708
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 17:59:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 836262003E3;
 Sat, 11 Jan 2025 18:59:24 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:44356])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 11 Jan 2025 18:59:24 +0100
MIME-Version: 1.0
Date: Sat, 11 Jan 2025 18:59:24 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111155913.2861443-1-james.hilliard1@gmail.com>
References: <20250111155913.2861443-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <dc7ff6e1bf89e15e1658d20c610f1dcc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736618365;
 bh=JAOiahmly6VxXNzAuIIaafg8uQgbSTPAjXZ94stBfbg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pqlEmEPak+Bpsdi8pEddVxTzVTGxj+zSDR7MMUI35OGE4SN2mJ9VU2CivxXkM0LuK
 M+3iQnUXxy+pJQ4eLKKlbiswcoZ4l54nfbiiLHRdXQkITxPorglZBWfwZ7JVDUgQBH
 0AdLhirSTBdr1L5emSmHZ7IXXX2XOju2/RH4/PPBvsyIErnECGTdNX+RhN1hqdBWJP
 ynBw+K8/hW6P2FAuEelm/kZYaIeWU971d5N8aKtHGKxUGgWJ9PFYfy3LyBw53B3tTp
 5fA/z8hKacppfNJlakfXYV8WG9CZi94F5X0VohnKnE+BcM78JPZM8VmPrnNHlcv6Qj
 KH/rdw1WIXY3A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pqlEmEPa
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to
 version 24.3.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/01/2025 16:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
