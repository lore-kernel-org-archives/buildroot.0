Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C687CAC592
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 18:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC9A884680;
	Mon, 22 Sep 2025 18:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NMENa5H41TJg; Mon, 22 Sep 2025 18:43:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E0F6846E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E0F6846E7;
	Mon, 22 Sep 2025 18:43:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7978C498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60364846E7
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:43:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 57qAi114KHwQ for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 18:43:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E00A684680
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E00A684680
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E00A684680
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 18:43:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id AB756B00539;
 Mon, 22 Sep 2025 20:42:57 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 20:42:57 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 20:42:57 +0200
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <4fad4381479c4d50e4c8fa839c8e5d0b44e3a7f0.1758536738.git.yann.morin@orange.com>
References: <4fad4381479c4d50e4c8fa839c8e5d0b44e3a7f0.1758536738.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <0f5439e4b574217276b4710488604484@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758566578;
 bh=cTzeonKm9z/4ETs5UhTYMz8NxXvbNjW113t/Q9hjqsI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qYO/Bf+Pos5I4kyoh9eITOyqm6927W35svpFsCZLPd1VwUDiTNHRm5oi7H81lDMpz
 N/EzFu2GP/n4WziB1XUIoaA2chDHV/WBBYTkoWjBovvnp2ypaRA+WTWRuoUdEuy58L
 n41ovXL8CHvzYc/pZplbC40vjgMV+bpTRKM0mGT3fRN4pxDO4FINhwSfLaJwHhtCl2
 hgQZ1vecuFCg3nEK9ZWZ476M28BgxRW4n9EOfUlAYgjGgubi9lSxhZTbi5t0o/7PjF
 iNIaThXXopQyIsq/+sN7FL0pPxCSk/RpQ6Fh829cR9l534GmMppmb8eLP6QNF/uYaH
 U+rGCyCd1DMLg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qYO/Bf+P
Subject: Re: [Buildroot] [PATCH] package/skopeo: bump to 1.20.0
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

On 22/09/2025 12:25, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> In 1.20.0, skopeo gained a new optional dependency on sqlite, so enable
> that when available, and use that in the runtime tests.
> 
> Changes since 1.18.0:
>     https://github.com/containers/skopeo/releases/tag/v1.19.0
>     https://github.com/containers/skopeo/releases/tag/v1.20.0
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
