Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BFB3C88E5C
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 19:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25509405A7;
	Sun, 13 Sep 2026 19:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEzAmt9ChLsZ; Sun, 13 Sep 2026 19:35:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 48FCB404A2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789328122;
	b=oJvteNdhVG58aT8sMNTODSNivQANirg0xPQ4eqf2QfocErcaRp8CBYb4l/wB2fnoPE9r
	 dIspDv/t+/ivF5Iw613Ga3fMI9CURCbvEOtLM/WlAZOXcbCdEvqXqXybdhbIq9Hh0cDa6
	 hCVXJF5FziPlXCHeAlwZk/e1712LYgL/usCsKGdrcnPVZWcz8mE84kyZYh2CR5zotqng3
	 mUsiO6s6fV0jR5wO5QgwLdndNfwkOKd99MP6Hx7rHBn//sy6G3LhrLZ8JI75pFmrWodYN
	 ieudBOyIM+TCIFHMOwWtnCWmGwGaCw1LwjgsgETR3jyuJ+tj1BCWBQKuhzJq86YdA8Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789328122;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=AOFbHalkCWv/lzVeLUPO+BPE63bdIsrMcxXPYtJi1k0=;
	b=tD9C+gH61+zkw1rq5DUAQNC8DtLNN50QwX1beFInWuE7UxoRanD9SsHn5lH0Nkq0nmoq
	 gHvfloTMGYgTVxymTYcTzqivc01s/KkwHufzIC7jjFuywyDSf2pTHsnC4g9PgaAWJLuyt
	 y0RUpCl4KQmvtLOobPQuQa6gjpqYWp48Lx4PMVUj9w0YZYuDnHN9WW42unKwcbBc9kpXR
	 iZeAhYyHmEKI1RfRFn8C9/H529WCRVbehi4V820HCqZyNH9vCyyIwCv8yx1dHSztmTWAX
	 Zo6ZrQ3pLGnLrJotyzxYVTTbHolwo1RG5BPxF2NS5I6v/JD2yBikhuDoGgD5cqFPNUw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789328122;
	bh=AOFbHalkCWv/lzVeLUPO+BPE63bdIsrMcxXPYtJi1k0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OKPO5jdsYBWSERSRTxV1Ydew1QjK2dF79XOgkfMbg3GGcbMqW2RsgmzV5crIUdcLM
	 XSwuLxfczRihYtU18M3snHyZsTMBIcKWOS74o7howWw8B5EUQPKL4SW7WSPwf7oNX1
	 yVNG3aM+mLd4WIbX8nN/F4Ej0rIsJWdRu8GnQDfN4jAxMHlBAZYgM3UMxCNGkycf+M
	 /UF0T2cLa/7/9/8uTk86EEISz0YhfXX8hVqhO9JzXqtD2MWOY/+RhzGEv1317uh5dl
	 5wWx5Yl+N62YS470yWXRQTXhqQy2diUJMr2ESkrb+HxzaQ48mZg0jEAlW1nHjuWlQF
	 ikWx9xWe8gAzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48FCB404A2;
	Sun, 13 Sep 2026 19:35:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 61C7C224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F4E14032B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kxAhxth907wY for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 19:35:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 7D8D24015B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789328120;
 b=e67M8DQFG+DxDohj9lzeORrigN6BXTnCTuIXM8Mf0ovAkMJDylJ5cX0nW0pswkZaIH0w
 UAACaF9DEK9+IDVllVjmLSanMN2xicPcGQ5RzLFxsYrfYyJFaWOhWkAnzOZMlEbQ6yzsq
 zl/NYnvuw8fwfcls6Ua0hF6+qzZ/S1mtCmUJrdyxq3qhiyDFrOR3N7KtQfZ6aMf2CGLsl
 tJ9rqe1X/8kTb7TUkDrlZdyqjfr36cVkqz6FGbb5BnjJHImWnQHtANEzCIbBfAeS46RzR
 Y28ItTeyx4k9QJkqadl6msUlRCL+2ohn4EN7RFcSdeX0ZoGJhsu5i7WmckdiligKe6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789328120;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=dPTCxykLDLrR67nQvOhagjCSfhNwihI5wNLxFaZRcnc=;
 b=C9IHdej5nfaCdSfppVWRQDsOrUL8W8WcaNibrTdyhsh3xF+TGncEG4lbrxnzgr2OVLXW
 uU8LFpzijBdPaQYdz+Wu7/DdkIV2VK9LlcScW+in+tPOgGMeSDQ88SokHPvVMlKQ1Ytej
 dBtxqIrIEpfjYfQ6TrgpfQKzodI6svNS8O6NYQOou1+4Sj0b/LXqEashTue2CsxRHboOE
 mdQQpXPmY7Z4btAeYxMLxWyjSkGHQ5jGUHQns7L9kOaQzqH5NvgK9FyQ9N1DxkPkHVNdf
 MYz+e7arDFeH8LrmKoxa+NORldHqefVY6LYRTSSd2RHd0BsIAMUXddQZSXNej57+SRA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="HjJyV/eP"; 
 arc=none smtp.remote-ip=212.27.42.1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D8D24015B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 19:35:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0A8B4B00548;
 Sun, 13 Sep 2026 21:35:15 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 21:35:15 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 21:35:15 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Adam Duskett <adam.duskett@amarulasolutions.com>
In-Reply-To: <20260913162236.1673931-1-thomas.petazzoni@bootlin.com>
References: <20260913162236.1673931-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <4b6839e0fe953213b6168503d8fc5cb3@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/ivi-homescreen: add missing
 BR2_USE_MMU dependencies
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

On 13/09/2026 18:22, Thomas Petazzoni via buildroot wrote:
> - BR2_PACKAGE_IVI_HOMESCREEN_AUDIO_PLAYERS selects gstreamer1, which
>   has a depends on BR2_USE_MMU, but does not propagate it
> 
> - BR2_PACKAGE_IVI_HOMESCREEN_FLUTTER_SECURE_STORAGE_PLUGIN selects
>   libsecret, which has a depends on BR2_USE_MMU, but does not propagate
>   it
> 
> In practice there is no problem since ivi-homescreen depends on glibc,
> and glibc doesn't support any noMMU architecture. But just by walking
> the chain of option dependencies, this is not something that is
> theoretically guaranteed (making automated verification of
> dependencies difficult).
> 
> The other "depends on" from gstreamer1 and libsecret, BR2_USE_WCHAR
> and BR2_TOOLCHAIN_HAS_THREADS are on the other hand already handled by
> the top-level BR2_PACKAGE_IVI_HOMESCREEN option, so there is no
> ambiguity.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
