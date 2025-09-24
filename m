Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C47CAC5AE
	for <buildroot@archiver.kernel.org>; Wed, 24 Sep 2025 20:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 360644148A;
	Wed, 24 Sep 2025 20:20:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPVOgG0_OuoW; Wed, 24 Sep 2025 20:20:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6082341440
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6082341440;
	Wed, 24 Sep 2025 20:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6DFD3199
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 603E082733
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tYP2DxxSbyHZ for <buildroot@buildroot.org>;
 Wed, 24 Sep 2025 20:20:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39B33813AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39B33813AB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39B33813AB
 for <buildroot@buildroot.org>; Wed, 24 Sep 2025 20:20:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D24DB5FFBA;
 Wed, 24 Sep 2025 22:20:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 24 Sep 2025 22:20:29 +0200
MIME-Version: 1.0
Date: Wed, 24 Sep 2025 22:20:29 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250619154811.936265-1-neal.frager@amd.com>
References: <20250619154811.936265-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7f9348dcffb7e934e439f458ce656306@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758745238;
 bh=cDZrMF/QkNngxbLT9gBG4XgpQ0cEzEDNihszDbTuEsU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JD2UCqLTD5cttbrA8rU0r7hqZ4DW9eUkmGJyns2b1kLKPCz3R659QHPusc479ff7L
 UUMQJmjXwlEse5wOQNwBpoAgXgtJfAGUm0EBbwVwvVZusX0jxO2u1jA7+tg9i24ZUD
 CTo8s20CD2Fu6h/2Vw3cAwLRgMHyb0DdmQeoYLP9NOlaES2eYevMYCSXmLQEoQqzoJ
 iP4qvTPPOs3RYhkpW3tykm11UM2xQJ7fwT3hTJBJLwcTZmb+hB6efoiq8PU6PxdJJg
 Da17/UDcMzctTICkAgvUI00KN/Vwo2ecZJgjZ0adQqSPiN4eUQaRiooFiO0OjXvNBU
 6gk5vaFUFpVaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JD2UCqLT
Subject: Re: [Buildroot] [PATCH v1 1/1]
 toolchain/toolchain-bare-metal-buildroot: add multilib option
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

On 19/06/2025 17:48, Neal Frager via buildroot wrote:
> Sometimes the default GCC and newlib libraries built for a given
> architecture tuple are not based on the desired ABI. Since ABI 
> definitions are
> different between architectures, the simplest solution is to allow 
> users to
> build bare-metal toolchains with --enable-multilib. This way, the 
> libraries
> for every available ABI will be built and users will be able to select 
> the
> desired library for their user applications.
> 
> This patch adds the option BR2_TOOLCHAIN_BARE_METAL_BUILDROOT_MULTILIB 
> to give
> users the choice to enable multilib, if desired.
> 
> Please note that when using a string of architecture tuples, this 
> option will
> apply to all architectures in the string, so it can significantly 
> increase
> build time.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
