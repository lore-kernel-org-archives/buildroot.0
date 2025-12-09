Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA158D3B994
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 21:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96CCD61447;
	Tue,  9 Dec 2025 21:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQMgr7uaPWuZ; Tue,  9 Dec 2025 21:19:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DE9B613F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765315171;
	bh=l4bsowbgPJERXhI8hy1V0BcDt2p/xzMspUfhkIVL+GM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RRh64hsoaYL9DF7b3k1Cx9K7yX0vFt7tIt/PvTRo1QVhOqMDAiIiCUrgdxQBXs0oj
	 VOY2hkFX3B6V0wmbi4QpuB7jFCtDXzAZZQjxMcEw/KDBWtIkElI31Oh0m0cuE+fTjG
	 PcDbdj0Zu+T+BkdeXIbPAwOxD/vQzcyWWMoVKIbNOj/iATPCzBLNenkVx8udpwZevG
	 qTqfR+NKsIq5H/qpqMX9xKqV/LU1gZpRNuRdCd59cTM9YmHlHOgi596SxKQUaPxIx7
	 s4TMVcIWhEvgex6JUr4x/Pn5vHsZzy2x47/mn9mW3+04yqgqxTounk/oS1Qn/VVlTb
	 Hcx0+eNylecYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DE9B613F4;
	Tue,  9 Dec 2025 21:19:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4BCD2C0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B6786141C
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g95g8dyYJb28 for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 21:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB8B26142C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB8B26142C
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB8B26142C
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 21:19:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2503419F5C6;
 Tue,  9 Dec 2025 22:19:25 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Dec 2025 22:19:25 +0100
MIME-Version: 1.0
Date: Tue, 09 Dec 2025 22:19:25 +0100
To: Preyas <preyas17@zohomail.in>
Cc: buildroot@buildroot.org
In-Reply-To: <20251209154834.5946-2-preyas17@zohomail.in>
References: <20251209154834.5946-1-preyas17@zohomail.in>
 <20251209154834.5946-2-preyas17@zohomail.in>
User-Agent: Webmail Free/1.6.11
Message-ID: <3302016f889cc42bfe279b546323df0a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765315166;
 bh=qdrHVNG/UaxpEgVdqB27HkLczLx9g5uyqZLyfYHHflM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JsuhGwtCvjQ5kh6Lue65L+3MiuDdGWmnW9n0St+56b/Nui29dyV4xplsoLq/h43uz
 l04n6XDTZRV/DXYY/McQoS8/YBc4V2AC20cPiKlmV7wjZkRH+nINnAYFDTSvNgDXmF
 ZbxMzJFCalAMEdnQB/soyHptzFqt4Ai35kmCGnaMpAX8RpVtoZDN8Ay7IOUYhpzLkG
 73iyzPOhe3IePJ/SH9SNSKXMTGmf3cX/aAE2jZtkPJSMMUdBI7D+Zl4rsXB60JqHXE
 9zbMnaRMWb33a4PfyqCuCtSiUI1uJ3oW1X4tzuN8av2u/EAFXO7/TusEcYNct0Ny28
 WQHCQakFoI2sw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JsuhGwtC
Subject: Re: [Buildroot] [PATCH 2/2] pigz: switch site to HTTPS
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

On 09/12/2025 16:48, Preyas via buildroot wrote:
> Prefer HTTPS for source downloads. No functional change; hashes 
> unchanged. Align comment in .hash.
> 
> Signed-off-by: Preyas <preyas17@zohomail.in>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
