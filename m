Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DF4D3B7DD
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 07:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CDAB40B29;
	Mon,  8 Dec 2025 07:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dIuaSq0NOEb4; Mon,  8 Dec 2025 07:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C311740B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765178451;
	bh=lS8oKSuDvVOgO6oBiFnNlHG44ZC2VSvvcBH1UShkQPE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NdT2qUuvMvLjQ8wRRRNevaSrPBoHRA8Ize6a1V/rbqlWoCdNRtwofjvGEjIzL3Sjz
	 hUbGCPQKyo+YKZN2CrdYu2yW+j6NOceV8oWzKXvXOx7nfpP4Ouhtml5k9LH3zwU2bH
	 9ZOb00Or28kdcIQp1ssNqXXJaLnVPTT+nbrK2CiRNCFOYpigR9XFK6Bsxm3gPrCqqv
	 EyeS4vvuWg6d5zmw9fcWvhsnyK+wd/q8TG6nXluARjHC5vPEt0aM7v6lXvr1Ob9cPe
	 lzIYOkjPWbcv00MSoclVASB7P4JfdYxOit1W7niDSI7brl++nl6GCWMDzt/lDSXWNC
	 tvL3YcgcDUnUg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C311740B2D;
	Mon,  8 Dec 2025 07:20:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4BFB151
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 07:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A68A582386
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 07:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJLgLAr7S9wg for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 07:20:49 +0000 (UTC)
X-Greylist: delayed 418 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 08 Dec 2025 07:20:48 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 468D682380
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 468D682380
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 468D682380
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 07:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id 4DC96162C9;
 Mon, 08 Dec 2025 08:13:47 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail0.hostpark.net [127.0.0.1]) (amavis, port 10224) with ESMTP
 id G1-0_zTymYrE; Mon,  8 Dec 2025 08:13:46 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id C1494162C7;
 Mon, 08 Dec 2025 08:13:45 +0100 (CET)
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Cc: Christian Hitz <christian@klarinett.li>, Bernd Kuhls <bernd@kuhls.net>,
 Christian Hitz <christian.hitz@bbv.ch>
Date: Mon,  8 Dec 2025 08:13:28 +0100
Message-ID: <20251208071336.69971-1-christian@klarinett.li>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251207152721.043daf5b@windsurf>
References: 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1765178026; bh=cFFRVk7BQN9rGPZD272koqF2IwW64qi052PN6
 Zfuy6E=; b=p9g+dVPeKvePVy3hHYKkTeV0xVz874piz9LEqNqWp2X2B1JKhnMUI
 wVsX151CoDYGYHilx5D0nkP1nUSyPQ/JoefrmyMvxp/YFuanBqSpKpalnQccIz9W
 Bf5zGxp30itNvMPnYS3m/tlMkwZ8S8b+Pq9AqefOw/aj+dehx87QbM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=p9g+dVPe
X-Mailman-Original-Authentication-Results: mail0.hostpark.net (amavis);
 dkim=pass (1024-bit key)
 reason="pass (just generated, assumed good)" header.d=klarinett.li
Subject: Re: [Buildroot] [PATCH/next v2 1/4] package/libvncserver: bump to
 version 0.9.15
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas

On Sun, 7 Dec 2025 15:27:21 +0100 Thomas Petazzoni via buildroot <buildroot@buildroot.org> wrote:

> On Wed,  3 Dec 2025 20:56:37 +0100
> Bernd Kuhls <bernd@kuhls.net> wrote:
> 
> > From: Christian Hitz <christian.hitz@bbv.ch>
> > 
> > Fixes building with OpenSSL >= 3.0.0.
> 
> We have been using OpenSSL >= 3.0.0 in Buildroot for a while, but I
> don't seem to see any (recent) libvncserver build issue in our
> autobuilders.
> 
> Could you clarify this? Is this fixing an actual build issue we are
> facing? If not, why?

It's not an actual builing issue, but a runtime issue when built with
OpenSSL >= 3 [1].

The comment should therefore be "Fixes VNC authentication with OpenSSL >= 3.0.0."

[1] https://github.com/LibVNC/libvncserver/commit/f135856fc3ce515afd16dbf91c44b89bab332726

Regards
Christian

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Sent using hkml (https://github.com/sjp38/hackermail)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
