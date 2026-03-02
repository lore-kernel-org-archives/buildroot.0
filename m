Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC260D58E79
	for <buildroot@archiver.kernel.org>; Mon,  2 Mar 2026 07:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88D6860F18;
	Mon,  2 Mar 2026 07:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hUMQyvuchdpz; Mon,  2 Mar 2026 07:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD16D60F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772437724;
	bh=2Jg6BtNroHH/qztpM+6sRbY9MvZ0jk7zCpV1iKRAHwM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wp/1L44UgOwCZeBg2RJP0sppmV4b62XEGfVlkqQDRdjhJAm5spcj/jlPANHjUvPb0
	 lhsaT6XwBljuaFOlrRiQeXbEawqpqTi+geJVmdz65E+98OlsCjFMSJC3PZb5iNoFmE
	 ExbMSYmdqftDDlwkYQyUgLFaXpdorss0haaULCqcaWCSYBxl80Vsv+4Wwq+CP6S+9I
	 t/R2brBC1gA+redXg3mSghdiub9j9k0y7f9kdLTU8thJwz23OeGE3V/8aukQQUxDcG
	 3P2YNOLNDMJB0W4TOzNnwIF09yv4dnh61QIB6E9xbdJlC8h4wBhm71cLwffh7dtzJX
	 YzztSPU4VlBiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD16D60F13;
	Mon,  2 Mar 2026 07:48:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 628D51EB
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 07:48:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6024283CCB
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 07:48:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxaw9ZL86IqF for <buildroot@buildroot.org>;
 Mon,  2 Mar 2026 07:48:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=109.202.192.35;
 helo=mail.codelabs.ch; envelope-from=martin@strongswan.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1371A83CB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1371A83CB8
Received: from mail.codelabs.ch (mail.codelabs.ch [109.202.192.35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1371A83CB8
 for <buildroot@buildroot.org>; Mon,  2 Mar 2026 07:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.codelabs.ch (Postfix) with ESMTP id 606495A0004;
 Mon, 02 Mar 2026 08:48:39 +0100 (CET)
Received: from mail.codelabs.ch ([127.0.0.1])
 by localhost (fenrir.codelabs.ch [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMzFS24P8iFX; Mon,  2 Mar 2026 08:48:38 +0100 (CET)
Received: from [10.6.32.203] (unknown [185.12.128.224])
 by mail.codelabs.ch (Postfix) with ESMTPSA id EFF215A0003;
 Mon, 02 Mar 2026 08:48:37 +0100 (CET)
Message-ID: <658c9868d761c74320479f185325e185bbab506d.camel@strongswan.org>
From: Martin Willi <martin@strongswan.org>
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 02 Mar 2026 08:48:37 +0100
In-Reply-To: <cddc9fd4-b1e1-40e9-be1a-6ca8a0e41941@gmx.de>
References: <20260226142023.1064241-1-martin@strongswan.org>
 <20260226142023.1064241-3-martin@strongswan.org>
 <53b6b6d9-dad5-4591-b708-f86f5a55a940@gmx.de>
 <74f10bbfc9b67fcd28b002964c050c784b8c3a1e.camel@strongswan.org>
 <cddc9fd4-b1e1-40e9-be1a-6ca8a0e41941@gmx.de>
Autocrypt: addr=martin@strongswan.org; prefer-encrypt=mutual;
 keydata=mQENBEhbeIwBCADbKW4rqhkBsvQumeWTAfy+Q+YciIbbqLvxwRZPKpxz19nxJQPbWF7pG
 oiPb3TWLK3TitWVKKZuNILStsKTGiR4RqLUs8n3sESPoz5HmRqsijm6yJDzzPAE3/B7IWHBeAOssV
 TWS7b9ROz4iFI+fNLnqMqE22zMEItC2r9zi6GpDmi/QP3CcxHFzPMF5iQkMPp6QJMwOdPvYR9kBb1
 x1ubDOjsfWqI41neJTGlv3EVFc5nkv0s7PfoYxMkf8/VStd29pMe4csKJUaPDkLqenLl8Omq8Z3F+
 sbjdo+hcim4i3EsROYh59kA4/UuMFfI0hxaIaoW6UAb6gyqOHkS6vC+VABEBAAG0Jk1hcnRpbiBXa
 WxsaSA8bWFydGluLndpbGxpQHJldm9zZWMuY2g+iQE4BBMBAgAiBQJRsHoSAhsvBgsJCAcDAgYVCA
 IJCgsEFgIDAQIeAQIXgAAKCRAQGu6ewTL0wxf8B/9EThZXuVqNTK2nH2QuRi2zQntFXkK2QbU11sv
 zkfZV8xDfWKHdq67LLako/FOE1dXN6iurWFChgMexs0bSMzaftCmHGSSgGaQhBhANSObKu8M+UyHd
 bes88zNpQKdwVd9guIo6oRrX33IYkb63ifZReChcBffu6cjXQky7/79kpnl6f3qlP5ZluyNGX9Iwe
 z1EpmG2zHkJlc+3oPQbsQbFKjUOdR1hfyKbcVVQHs1ddv830Z0cpM6QbcknR81VsCQ7FYBrH5Hw3N
 AKhrfbIaZMvwBgQfXIgc7mwPZFg2oONZMzauzX6EpZ29Z+kCsy3AArnZssVAwxk+ydRJhUWlZmtCR
 NYXJ0aW4gV2lsbGkgPG1hcnRpbkBzdHJvbmdzd2FuLm9yZz6JATYEEwECACAFAkhbeIwCGy8GCwkI
 BwMCBBUCCAMEFgIDAQIeAQIXgAAKCRAQGu6ewTL0w9ruCADDGN0JgrImHOPGgsJwdP2nKwBytO8mM
 Z/Z/folgH20zqiMqyNR4lOZW9L3DF4rz83fKXQFbP7nCf6GZ/tmjmrImiTZBkKwr37ZsaBRaCz3i9
 rYITY94njenYp7jy6roMcvlBMhNjSI04AvLjaA/hcPuSexqqso+qoNTa7+VplF7OpikB8vKPt+fMp
 XuGP8TF/q8v9TrY+gcVv0c8ZOrGDnI5vJt1Fp0PvoH/vXFx3Jy90g+hRUYFbLW2S76geiGVML9AeK
 IQKjEpp2bxsd+JYGo91MeKBqjlllonxZ17eKNtlA+X+iluwcDJZzdabB19EQG7ZEf0jAy6Sy09au6
 MYFtCBNYXJ0aW4gV2lsbGkgPG1hcnRpbkByZXZvc2VjLmNoPokBNgQTAQIAIAUCSzjspgIbLwYLCQ
 gHAwIEFQIIAwQWAgMBAh4BAheAAAoJEBAa7p7BMvTDaP4IALJRUmUEagBRrdAi1SrxxcsgPDr5vo8
 1UrPADXKnMdf6KXPqfPMN4hIeS4zbFyC/FA9cg0T9680pVk8hLmcD3iCRMMnL9d38hOQmMxw2TYnd
 7rth1LuoDRhIwI1bfADw3EJGEMsTy49zVtVl1KwmqBZDDk3PGHvukHYawleOrTRVitOEvavg0vfgg
 CgqvSeSBy3tkX2EIlagC/5eXpYLguj1iI84xG01M4bZ9PU+PuzZADaHL+a9iPelBvk0uNjwKvKjPx
 OPDfaxsmEgjNG7M9gZjBkjSjvclRUlLMpe+3qHhGEYf2yKsv72hCLYy8my5jRnu59eZq72lX9YWVs
 jlXU=
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=strongswan.org; s=default; t=1772437718;
 bh=7Z/nYvNJrPzx1gqZl36Nck9spPbo5ea9n1OytI5JqjE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=sn0JsUC4KjDF9KZN83GLpvJBUfIwdo880KYfsAL3orx9vPUtd5N2o49ieZ5SBO19g
 iS/0XFBWjFIt8jlNsHAg7LfDon4U83HopW//tEpNMSJNT/disMREWmQ0cU5dzPtUnN
 36ZSnleTIVkXtsj2jh/tdJP5a4Tqh4Wbc3jQ1Wh3LDM3fc/54iiONoKo6QcLW9s0Q3
 2AqBhkZnkskfNFhm1YVoMKm+Vrw9iXbMkWVEmTKsni7zRuGLAZCE+cTC9zwiItampM
 3rq7gkA2f2R2R4SM52vC8BAUb8uhGEp/YkwvJG5x9ypQNKDsltBiGeTkNahEJR1Cs2
 kuWK4g7J6OX1g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=strongswan.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=strongswan.org header.i=@strongswan.org
 header.a=rsa-sha256 header.s=default header.b=sn0JsUC4
Subject: Re: [Buildroot] [PATCH 2/8] utils/generate-cyclonedx: allow
 referencing patches by upstream URL if available
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

> My main concern is not to place blame on upstream developers for
> patches they haven't accepted (yet) by marking them as "backport".

Makes sense. I'll drop the "backport" from a next iteration and keep
all patches as "unofficial" for now.

> I don't have a strong opinion on that. If it's helpful despite the 
> limitation I mentioned above, why not? On the other hand I'm a bit
> wary of adding information that may quickly become outdated, so if
> such a tag is added it should probably be one that confirms "this is
> a backport".

So having a "backport" status probably needs a separate patch tag. This
requires broader consensus, so I'll keep it outside of this series.

Thanks,
Martin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
