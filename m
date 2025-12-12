Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4ACD4415B
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 09:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70BA14113A;
	Fri, 12 Dec 2025 09:55:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNfS5XrVkI99; Fri, 12 Dec 2025 09:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAFB54083F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765533327;
	bh=6Xg3rtKBYUdqpwieh3FN/crMJfniGha7vNrHg4ZY1Y8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=F9XK4exNHWEPwvL7l06aPX55IzjfoZoJKXcevt2DZxwL6k+xJzI6k0MdbEmsKR+6Z
	 v1T34P8s+91816AP3ZjmvOngB6ijf/aCTlSw2aXIQOAqeoSHfRlnvabrd5mKQ9x4NJ
	 MpMPfLbYYkS06YCfTRxlAgyBmM42BUzcb2g10Ov2S+/DUOu/WNU5mnCwlvv11nG3Vd
	 0u3Lnbbxw3PJvevCZmuvkNE/8XK7EqyupkC9WYz30BPIlKd7MJCDjwU27L/m6oIjYG
	 vqNfB/ueFn3G011nzVpe7UWE3crmYqsIIyPQxSiPnYxA7COKK3tLh7YkjcbJ9MpBR0
	 4ufiz6Jcspnpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAFB54083F;
	Fri, 12 Dec 2025 09:55:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35FBEE7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1445B404DD
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 09:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_ALay3lqL6y for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 09:55:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1D82740160
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D82740160
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D82740160
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 09:55:24 +0000 (UTC)
Received: from [192.168.178.91] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 84AB02C8920F;
 Fri, 12 Dec 2025 10:55:21 +0100 (CET)
Message-ID: <5a35f447-eafd-40a5-9012-3448dac96845@bubu1.eu>
Date: Fri, 12 Dec 2025 10:55:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org,
 Peter Korsgaard <peter@korsgaard.com>
Cc: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
References: <20251209193951.1000100-1-bernd@kuhls.net>
 <20251209193951.1000100-24-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20251209193951.1000100-24-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1765533321; bh=001Qr5wvivWTnKH2lDvYHCAsXk4hNvqxEg6oV55sfUs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=V9/MFXxpw5965qJ7/1gE7CkW3h3UNI3f6y3uNtaahoNq1rfIJbbWlnd31fIHxuvxD
 WfR1hdWjt4iRI60NtaGmfqNXOShwGVaHeLxSWofV6Ob8SutbaG9GD4oAWBagY6MgtO
 0cG2mY8Km4bayswNNyxcIv0b2PU7gr/wb37rG+ESmpkzT2dKA0F7ya+vIb1JsMmlU0
 bNiWs1iI/rFe8FcKAg3SEj3mKPZIY4gvjIrvkuJpMyw/XqUBhUwDs8xRFgzxjXVBMd
 J4ZeVs0cHN2Flo6t7bogHKQJQ2ZSL5ZdTPD+483+s/2RakeCw/Zhh80MkD4x6cd49a
 +9JXhypxH4Hvw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=V9/MFXxp
Subject: Re: [Buildroot] [PATCH/next 24/31] package/python-brotli: bump
 version to 1.2.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd, Peter

On 12/9/25 20:39, Bernd Kuhls wrote:
> https://github.com/google/brotli/blob/v1.2.0/CHANGELOG.md

This should be marked as security bump: 
https://github.com/google/brotli/blob/v1.2.0/CHANGELOG.md#security

@Peter, there's your bump :)

> 
> Added dependency to host-python-pkgconfig to fix build error which would
> be introduced by this bump.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---

[...]

Best,
Marcus

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
