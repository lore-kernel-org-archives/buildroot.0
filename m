Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73747E92704
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 15:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B1AA406CC;
	Sat, 27 Dec 2025 15:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0z24tXUPJ2Fd; Sat, 27 Dec 2025 15:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E5F406A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766849251;
	bh=56SuPzivqsmBJitxDQDmb3Sxh+KM9vCinZMWsIY0DQ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R8fuod2htjskp1gLM7vtQPWQh6KWKY4sLUnGfU4N0hRR9WTNah9f+T4OAtV8/bW2d
	 8n/1uQ9MJqspFAeSk+Zm1mvUbmIrAAKnvjAYBdR01OcxNaJGB0A8d9RECLNpB8NJFj
	 22vecGvyUyDflFUUxN3Ic2ZFvgnmvDEzCgG/I4yKXpV630/LJrnWQiTiJyjIkbGO7D
	 6Z4YWiLcSYdBDAslK+BLAeT/wVS61w9fImlJe/jvLFzronjkayxwXOCxeTDRI23C6S
	 UT8BqegL+FNds080cKMYyjhUBiU5DLOSHg5/6X2rB1CTKXC2H2hsLgPluK1zj8obOd
	 6Ert+/KgeU/Pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3E5F406A1;
	Sat, 27 Dec 2025 15:27:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF08E119
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0C0980E9C
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TtVtZgJg5Mft for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 15:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B675480E0D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B675480E0D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B675480E0D
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 15:27:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 84F7CB0056A;
 Sat, 27 Dec 2025 16:27:24 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 16:27:24 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 16:27:24 +0100
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20251214153711.766150-1-thomas.petazzoni@bootlin.com>
References: <20251214153711.766150-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <133c2ef2d4ecab859c1abcf39fa141e1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766849246;
 bh=6GOVTnSmCpDaikEenjHcRKrc+xvQ2JemD5oGW5NfO50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=av3W0Jcez4EQghsFQACtU+BO1HPXqn2Ql4H8nOU+dUHlUKe4xdBZzLXHmYABIkSIR
 N8yLpVnoIiH9HD+ARbO1MLq0TZPmAZZoBNMRJ8Yrqkqig7omyQWECRaqUM1/R6KyqJ
 PFZMr6lIo2SvKtmiUVn/fzLlO/jJIq0YatmLBQdFe51egS2fAO7Fvzos6k3r1JAUCW
 9wihY8rnPnfZnTcYGjLoEgEiRtQxizos/Kcs0SWWB0m7qHp5D6btVHC8NGYo3ofriQ
 ILTokJwnEj5G1/cbc051dcBHiCkEHnlHtXdvyG9kv7S+BNycAWF3lmLJZdt5yTGJM8
 0x77LdWcbY2qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=av3W0Jce
Subject: Re: [Buildroot] [PATCH 1/2] package/python3: make SuperH tweak
 actually effective
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

On 14/12/2025 16:37, Thomas Petazzoni via buildroot wrote:
> In commit a68899d49ec4c7f97dea0dcb9995e6a5d7b282c9 ("package/python3:
> work around GCC bug 121567"), we introduced a work around for a gcc
> bug, by reducing to -O1 the optimization level on SuperH.
> 
> However, it turns out that this is not sufficient, as the build will
> only succeeded at -O0.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/31f/31f34a983036b4135c12e5797b5c2258ab33e6c2/
> 
> Which is a config with BR2_OPTIMIZE_2=y, which means
> BR2_TOOLCHAIN_HAS_GCC_BUG_121567=y, and therefore -O1 is passed, but
> still the build fails. At -O0 the build doesn't fail.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
