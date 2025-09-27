Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DC1CAC5B0
	for <buildroot@archiver.kernel.org>; Sat, 27 Sep 2025 11:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 195B18480C;
	Sat, 27 Sep 2025 11:20:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pGDQ0dgq-Zn6; Sat, 27 Sep 2025 11:20:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A427848AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A427848AB;
	Sat, 27 Sep 2025 11:20:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 608CB12D
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:20:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5257F40F0C
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:20:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfpX75cQLqgn for <buildroot@buildroot.org>;
 Sat, 27 Sep 2025 11:20:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5D75440EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D75440EB6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D75440EB6
 for <buildroot@buildroot.org>; Sat, 27 Sep 2025 11:20:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 6D40C780333;
 Sat, 27 Sep 2025 13:20:06 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Sep 2025 13:20:06 +0200
MIME-Version: 1.0
Date: Sat, 27 Sep 2025 13:20:06 +0200
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250927064542.174906-1-fancp2007@gmail.com>
References: <20250927064542.174906-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e87508c606813a44f830d41750c2f3dd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758972009;
 bh=yG6yDUZAXzB2ow9zQpuS8/AOa13byK3Ts14tz5dpIOw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=llK+mg1hAFFzrDiYHPWChPc8lmu8qTepvE1+vJEItwpfuxjfyG5rtkB96E+SHsswO
 N824a2hvLBGdCq+QcYMXrHEGS/njcM06lx0xDDQDRJ8LulVp6zuG1n87IKjOc0dux3
 k8WrC7i8j7VsSAjVyepA6KovMs311ON64bjALkQTE+WXnLAZhTYet6WX8qv4HOhyXK
 GRmiMcW6SwSWsph5G0ciSrgT9B9WwCsqKiGlOHxbtZ9n6j44Gtx3YvYKiTlWSToEpO
 2LLvNla9xBQa53Lx13WWEls4NZQ9X9kDV6KMK2fNQR8sHKBpQmkJuFLjIxQ9U5e9x+
 peXmsx3xcPXNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=llK+mg1h
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.21.4
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

On 27/09/2025 08:45, Scott Fan wrote:
> Release notes: 
> https://github.com/timescale/timescaledb/blob/2.21.4/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
