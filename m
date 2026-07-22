Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D20C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 19:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF0FA80FF4;
	Wed, 22 Jul 2026 19:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vIxFPOMYdkF7; Wed, 22 Jul 2026 19:57:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9727580FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784750230;
	bh=PW2uZoPsDeqLV+R2NPBS30QfXrO1adT6iLpTQwwgvpg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RBvi7THUXac96p5RYn59ziSl6/XNLoAjIfihemw7vkPIixX8ZLXKmjtcYErHsIZr4
	 s4DH5TjtX+w4UB/T5Ie7kVjPVH2/FMPDpR6Jjk7ufOE3puM30cpZ86N9jgmmx2pW6U
	 tM+/kNrhKAnqP8h1eqkEeeGEywZ/mgJLKD9becHEasEN8HdZt8jSlTDJOa77AnfiV3
	 BGJh8RbmTLh4NQt1AMZwq2xUnGXOSLObZqzioN5pZfYTj1s2r5WvNmQjFAfKHkpXeG
	 KZyjcKqFBGH/ldwKDMC8VFzOQVQT07+f2aWyHCm2Hin2FmxfAIU80V6sRmuWswOumJ
	 4eVlrdDn6lkyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9727580FEF;
	Wed, 22 Jul 2026 19:57:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 474D4390
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:57:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 394B660878
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:57:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVYzFDiTr0DJ for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 19:57:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1091E60873
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1091E60873
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1091E60873
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 19:57:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id CD001780505;
 Wed, 22 Jul 2026 21:57:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 22 Jul 2026 21:57:04 +0200
MIME-Version: 1.0
Date: Wed, 22 Jul 2026 21:57:04 +0200
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260722124524.1678904-1-maxime@leroys.fr>
References: <20260722124524.1678904-1-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.17
Message-ID: <9cf2ea58e1ab50a8a2880ca572de875c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784750225;
 bh=1p0bjTlbyXy5itIfPudS1lsphdK9Q4aRSnsyEKIB2U4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RtIy1FltqJ8ep8wo2KYXwYYMtaao5QquG35yUw0ZP0OXqZhwjtHJemvg/9NOil8eD
 lDJS9+isBzWSypKQjNHODzvhZIYW8EaBLboW8rdJjfX7A77Hk2h/boxiBh45VB+R3R
 BR+96UuLqjxCLnfXiYjRtSczPBZ5e7TGeFG7nm4/2L40QgBQqAVTrnbRSXRtKAAOmr
 VuAoFjETML0iAVaqIfypCxQLxxcxAkheAw0oRIz8kqqhK9OuSmaEFUcvWyELOvv8/B
 Ly4wEJjT4ULAfB40fyInhTv5Ut8iTlpEdarpbNVq5C17w/YKoqlUaop124PkZ/gnT4
 9RT9hJb+9qcyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=RtIy1Flt
Subject: Re: [Buildroot] [PATCH] package/grout: bump version to 0.16.2
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

On 22/07/2026 14:45, Maxime Leroy wrote:
> See the release notes of the new versions:
> https://github.com/DPDK/grout/releases/tag/v0.16.0
> https://github.com/DPDK/grout/releases/tag/v0.16.1
> https://github.com/DPDK/grout/releases/tag/v0.16.2
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
