Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0D7C43458
	for <buildroot@archiver.kernel.org>; Sun, 12 Jul 2026 14:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0CF7B81220;
	Sun, 12 Jul 2026 14:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MhEXvZYzqv7e; Sun, 12 Jul 2026 14:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA11811C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783866039;
	bh=nVzjD/ALbnwbBk/Jv3eeDDVQb7jcRPUV3zfARNAiwPg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZCResAJ1bptaJMWxdROOWYTaLI2T3nm5gy67RHIgJbPNdehNdJJqgbhtC8WJYB3H/
	 JN/I+fexGELrZ/8WDHMdF2OehGUyvmLnTfjQct8Q3IeWeOgM/SyGGk/QQWVlJuOVRW
	 F3vTd4DNsXJHLiFpUCZdOM7HaDS30TV1Irv7R5DX7ofENNg0AoEZuMUKiXC9ggoWeZ
	 q5S3r+sooCYLYDD3t3oVRgP8zSnrsnlim9Lv4C9TaDqlXNLN79ZPRNP+3RKTTnbmPv
	 Auy2C3WMX0QPUVk32pmaEEyGACKzY8YL5PqWz2t+v6ULzwYzMAhjXyWyN1/gozgo6E
	 YF87Oyf/wQv+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA11811C2;
	Sun, 12 Jul 2026 14:20:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D5AA4359
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C730A406E4
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZrDM7NJhlZA for <buildroot@buildroot.org>;
 Sun, 12 Jul 2026 14:20:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 072C540600
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 072C540600
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 072C540600
 for <buildroot@buildroot.org>; Sun, 12 Jul 2026 14:20:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8580B5FFAF;
 Sun, 12 Jul 2026 16:20:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jul 2026 16:20:25 +0200
MIME-Version: 1.0
Date: Sun, 12 Jul 2026 16:20:25 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260617061102.3526174-1-neal.frager@amd.com>
References: <20260617061102.3526174-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <39b44ec42feee38736e8ddaa52fb5efb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783866034;
 bh=Z3C/OR+8T4oiSG/mkOgkTsMRu1WOO7VCkwSVxafRo+8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aeVOesffntaCq5Z4CYhdzzDl+CJxWtZ5uxOrcdSbIp5HG9ruB/sxo3n9gkDfKRmdD
 xrfpanT1krPRgILkQkFywtru4xeAexhyja/GFVz3ikyvEWUN8H6OlLhtDeIq1h2zJp
 aB6pRPLiorMjtnr164Tkov5fr2WTZQqkkzbbtZ/jrH2zup7ACB+rWWL5b39Z48X4NR
 e8tAvaU08hKH94srxngHfDLFyrSB+8XPTgYPOdlLAThq3TrZ0pnGTGjDKesj45qgqF
 S/oYpBkztAwT/ougRR0+SvCghpZcNpnilM+MyHwDPJrk9z/OOhEwLL+vXJBmrY6Ize
 HCJ/ePXlOAT5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aeVOesff
Subject: Re: [Buildroot] [PATCH v3 1/1] package/bootgen: bump to
 xilinx_v2026.1
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

On 17/06/2026 08:11, Neal Frager via buildroot wrote:
> Bump bootgen to xilinx_v2026.1 release.
> 
> The following patches are now included and can be removed:
> 0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
> 0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
> 
> bootgen xilinx_v2026.1 now requires C++ version 14, so the build 
> command has
> been updated to reflect this.
> 
> Add dependency on BR2_HOST_GCC_AT_LEAST_5 as gcc v5 is needed for C++
> version 14 support.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
