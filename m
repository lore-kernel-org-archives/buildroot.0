Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39274CCF2C4
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 21:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7FA181540;
	Fri, 16 Oct 2026 21:42:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Hduhj4IK2ib; Fri, 16 Oct 2026 21:42:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B502A81541
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792186964;
	b=Mb6PCu7pihdyK3+toR4NnkOufvg9Gm6B8wNLnZyB6kgub8iTc6tw3iArbkvIvwkMECNn
	 Y2QqinC2A5uwCT4ECMZ7yhYzM4bvmU+Ol90N8yNGPXYQknCKGv2PEySF8zh3M85RRI7wy
	 KEbs7yPK8Th5H0akYkyfOno2I9M/wyvL+ycAszKQuArYCT5VIW5eTSYdoLrpfxELhCdXW
	 6AOHvs5aVKEiBtqZHRsjcAQU/Yc/+7BB+uvrzMpu3OhnPMVEweOeDFbH9lz9LLUlcRQge
	 fe3Ins9WiXdHSv2l6Ocl50euESMmnB1h9VRm6/tlbgL+0W/EF2yujFu7qKorPs+gNaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792186964;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:Date:
	 To:Cc:Message-ID:References:MIME-Version:Content-Disposition:
	 In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FqhiObfXHirt6ANc2QiklGyDSkbafyG36Elf9MnPEkM=;
	b=rnPa39QksS2O9ChC07xtDPfItMZ1sVWovNdkUf4TwSkHX3WYlq44Mv2M91eDD1F4P8dj
	 8z3GOk22MUlTHe1B3bWp2BPwJXoftbsiEICPlsPLy77Msq4hgd/4MT1BVirVdPTPNtt0c
	 ReqIEJYDx480kbuePFZVT3e9qDfoGfi1jJcCKN3s2Mhx1u0jA12aacIrmaL+jGOKskH8J
	 nyYl/ndt4dplVeaHytAK+RyKUIc5BJfxVmaN+bZzhEKNO+MJ9JtUiwD2L0/0gdZ/oygsF
	 Oy9cPnsLvuhURvQLGBlFz+ze2YXHYKcfCDwwUJ19hxhBocFX6dhtwGuxp1zIObivWzA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792186964;
	bh=FqhiObfXHirt6ANc2QiklGyDSkbafyG36Elf9MnPEkM=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Wb0CsKaoFoJOmV0eBaku014bX3YMolj+uIdjes6KPDJI0uhi/erfNEFUdL1kBNH/W
	 lTXmkGmWE3Qu29ypkHMn8mSOkHKZUOcNF7l9jx2bf0vyyjGFotXzA5IeSy/T5aAcVw
	 39sFwttqkVC8z67eEfgV4e7Y6GZzrIuPlLDvbVpmdjSgHxWWTAINT0ubZ5Sfo4mLux
	 EBXpiONAPmNzUUeXZQuxsKfMMUYqJbianppxp+7P+rwsAtxLS38L5dkikEoj/bmk9X
	 7NiG1cIPbg0PqrOZvzPiECSAMLsKJYkDkaHw2pN7nf6LPEagYzqJaOUDE6StviXPZa
	 GR63wHAMn2Knw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B502A81541;
	Fri, 16 Oct 2026 21:42:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E44105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36662403FB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqWtae-gvrqc for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 21:42:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7D187400D7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792186962;
 b=poZDubiUIcHjOPL97buuzlybQaThMrV5V2l5g5fU0pemlWsZ7U4Xoj2bOAHvl/zgn4cT
 /NdyOqNF5qEsQENfHkbmtBPD2zsd603OZvM0JetbrYgnAd8yzvUhdKBXLFypmye4qkeBd
 vceEGdi95gyxu75Tyefgl4W0Uq1W6Vly39JMouicDAH9N9NKu0OqG8QEZLL4MPEgkjOMA
 ceHiqsC3InildhzNR85o+iF0hGIkVp3GzlyZt0wT20+LiQ7/dEknzPepcgUlGodFb2FYA
 FYFW1RY1GC2eGaQv/K9iXul/FGe/b0tbSzlfZkoQx6nSm4DyyHRBrEdbWQ20vZ7GgEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792186962;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=QaIQZa+RFHao1PXHo2oA095dQPL9KfLy0poEEwPVFc4=;
 b=AddvOfF0P7m/JBbQJoPDah6MQ0IomxOaP7RP9rzCTnIIebL46A9Vmb3cc2tYSjmu1NRj
 6HidCAVya05ZoIhINDj0ErnQZHs1JNDzzQ2teY84PYgESxc1KDCM30GFapCxj8ik1znMo
 f49yddlL/HtM19IdOQ9JNDmuzLxQLfKJiKmK6SAnqsXSmSJKYHivShrqcP5fxnATozAmz
 Femaz8kipcpHZqlJO++KTalNM3LJiB5VM4aF3sH5BC1VISLqbMRC4vkGYov8Av/4TnjMW
 miyCZs0U7MqLWiRUtgAIKE0caH/n6MuGjZpNDim5c37CE2NVscKvyoP5nPL+sAKnxzA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SSXq2NZx; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D187400D7
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 21:42:40 +0000 (UTC)
Received: from L30177.local (unknown
 [IPv6:2a01:e0a:ac2:22b0:803c:ad0:954e:6d94])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id EF5E013F86E;
 Fri, 16 Oct 2026 23:42:34 +0200 (CEST)
Date: Fri, 16 Oct 2026 23:42:33 +0200
To: =?iso-8859-1?B?TOlv?= Denieul <leo.denieul.yoshino@gmail.com>
Cc: buildroot@buildroot.org, maxime@leroys.fr, olteanv@gmail.com
Message-ID: <atKaSVV5QBy2EaCt@L30177.local>
References: <atITVOsM6wltVHct@leo-ThinkPad-P16s-Gen-4-AMD>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <atITVOsM6wltVHct@leo-ThinkPad-P16s-Gen-4-AMD>
Subject: Re: [Buildroot] [PATCH v6 0/3] board/lx2160ardb new platform
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Leo,

> This series adds support for the NXP LX2160A-RDB board. It is a
> repost of Maxime Leroy's v5 [1].

Some of the sender names in your patches look wrong :

 From: Maxime Leroy leo.denieul.yoshino@gmail.com
 Subject: [PATCH v6 1/3] package/qoriq-restool: add runtime dependencies

 From: Vladimir Oltean leo.denieul.yoshino@gmail.com
 Subject: [PATCH v6 3/3] board/lx2160ardb: new platform

?

I do not understand how you ended up in such a state.

Besides this issue, this series LGTM.

Best regards,
  Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
