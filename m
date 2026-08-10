Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24FD1C5AD7B
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 19:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B62D60759;
	Mon, 10 Aug 2026 19:15:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JJqaJIqLM7CP; Mon, 10 Aug 2026 19:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7757E6073A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786389303;
	bh=xkYGSYSUkgc47issW9EGJ0kRKmhOSnD+x8G+1B3VvjY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GDFr4wWAu5Ot3yt/e1edABLCL/BlrCeJajTfBJLs8z0jcVUiY77e072dsIU9mbuF6
	 MTidVp5YFUfDyFz9mSubz80IBpuzFI97bKVgfRw8kjxtI32MXJIXNhN50493MenWCX
	 eJG5CzHFzxziVCGwvwWTPp+6AJRNCaGBB84JHulbmYx221ugBVq4TywMGMiyIxpeym
	 18/csZMnUch0C8nDs+ABTixyjZcBfQN4YY8VKHSoIBATKxcIEgscYvJi80VkmtaeEf
	 hWHSeqtA7D34+NXKfb8X5aQM2111o62QkTlDi3xQgoT1DwiUE9l74Aux2DYjWov7uO
	 vbekv7x6O/CMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7757E6073A;
	Mon, 10 Aug 2026 19:15:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1898024E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFFF640670
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9AzYiQH-guBe for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 19:15:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AA70D4066D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA70D4066D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AA70D4066D
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 19:15:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 4CBB219F5A5;
 Mon, 10 Aug 2026 21:14:49 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 10 Aug 2026 21:14:49 +0200
MIME-Version: 1.0
Date: Mon, 10 Aug 2026 21:14:49 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260810051223.4149414-1-neal.frager@amd.com>
References: <20260810051223.4149414-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <280ad54aa88d18ce3424bbf6a3c1b4cd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786389298;
 bh=tNGAacwR00F/txab/CCql6y8pzrvyactU53W9CGti3g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Qfq/awjUqIedZqRmdKeQY/oRIAE+brds+Dptz1VL4e/FWFC6C29esa4jeloQNDVAE
 FGq3RKIPBdvfiHyvjZ8wb71XK3ko1ESYOQxxsmrTJj0jgwG7cCpI7bStfme2YdADOz
 bGMRj7A2lp0SDaUAkkbSO/42VdVdB2FE/7Isxpz7f/GkI0rsmipWTYL5D9o40gCWhB
 6JT78haLGvIDizypjix1FX1qNvTC5xGw1uOOW3HEShVufodrI3eqVWmGfsNA9L3I4F
 wUIZCV+hr7KRwbYMmUOV99I9VLBjNb/RP+sX2BzYeUwkD8tkixEsjkZBcdSokDazKZ
 Y2Lw4ea1s9CEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Qfq/awjU
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 16.2.0
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

On 10/08/2026 07:12, Neal Frager via buildroot wrote:
> https://gcc.gnu.org/pipermail/gcc-announce/2026/000193.html
> 
> GCC 16.2 is a bug-fix release from the GCC 16 branch
> containing important fixes for regressions and serious bugs in
> GCC 16.1 with more than 102 bugs fixed since the previous release.
> 
> For the list of bugs fixed in this version, see:
> https://gcc.gnu.org/gcc-16/changes.html#16.2
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
