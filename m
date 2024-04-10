Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8CFCD11C2
	for <buildroot@archiver.kernel.org>; Wed, 10 Apr 2024 22:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D98F60EA9;
	Wed, 10 Apr 2024 22:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YrQHfTyyk7iH; Wed, 10 Apr 2024 22:01:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BACE60EAA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BACE60EAA;
	Wed, 10 Apr 2024 22:01:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 227D51BF4D6
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F0464046C
 for <buildroot@lists.busybox.net>; Wed, 10 Apr 2024 22:01:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id foFdyS9Cp45E for <buildroot@lists.busybox.net>;
 Wed, 10 Apr 2024 22:01:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEC4A4036A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEC4A4036A
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEC4A4036A
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 22:01:36 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-345b857d7adso2466689f8f.1
 for <buildroot@buildroot.org>; Wed, 10 Apr 2024 15:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712786495; x=1713391295;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQp72xER5eferOcj9/4t8P+DUXeIen/ZssLocHQq6ro=;
 b=XRRQnTN5kIcThKYVtJl5P2pcklO8LFbAiOnx3jV94HqtRVr6SpCa6q03gI/QucMbjd
 9SirWiZih2U9GgRXN+ghHg/v/QGCma3oLxB5T+dgeSpQ/yZW0N5oZTHePPOQ8bwXJAzD
 mhTyS0W+x2T6q3128TSLYoGEhLFzOgmfnwnt7/u4HCTSC2/MbVL0lBf6GfziI9i64JyZ
 rjASq3G9BI1x9OZPHYXol3hQDD5thq3BzcPXeeG+KePgE7w4S73AfvRAVKqyYJDZPQNd
 wk7pTtgzBBWK3SiJnr8uShxZ7qAfVhfNvDtcxBCtWwsjCYYj8Xn9jSovC9jM5ttvHh02
 W44w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWwyl5OqIyY7fSAQmegTswtnS45mgy1aiANvZlVKtZJc10hvUTVYXgy9irYX6+q2EeHpYqJAgCwb/PPQozIhx9qBcaiALDqg==
X-Gm-Message-State: AOJu0YzIDPmh8w4ZSQBXsL2BG+lGjvNiaH0rughCuWZlkhO9C9q6NMNU
 l460RO1NwtrpCNsH2+2ur/jRuq3Iulr0bLkVy3MSJG3S+rq9X/FnZ+59EC4UAAM=
X-Google-Smtp-Source: AGHT+IGpKStmWe+51VGUtpQkfL00LpmzNnNpP+X4eQ7lGvHxVtPW0AM25AdAv5YpO1eMTn/owGm0RA==
X-Received: by 2002:adf:e259:0:b0:33e:cc16:387 with SMTP id
 bl25-20020adfe259000000b0033ecc160387mr2544088wrb.54.1712786494702; 
 Wed, 10 Apr 2024 15:01:34 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d630b000000b0034659d971a6sm202495wru.26.2024.04.10.15.01.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Apr 2024 15:01:34 -0700 (PDT)
Message-ID: <abd3eeaa-8db8-4cc5-b951-3852ec4a0099@smile.fr>
Date: Thu, 11 Apr 2024 00:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
References: <20240404081714.1190807-1-heiko.thiery@gmail.com>
 <20240404081714.1190807-2-heiko.thiery@gmail.com>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240404081714.1190807-2-heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1712786495; x=1713391295;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RQp72xER5eferOcj9/4t8P+DUXeIen/ZssLocHQq6ro=;
 b=0L6uzHBXfZnr5MXnlntIzvaNBYgdQsFFsoalbWRrMeR3y3juV78Rz+E7T5I9VJSEre
 S1C0iHjNexvZjohbDtI1wEShzASTlF6uB2rHIuL66XzrsiWK/lOy5Qy2VzJIMjNejUaI
 yeeq4DD4c9SYFWbR3Od7TCGaaL6zK4/gEdB66Fqu4SjRQ+dbcrPviMpvtJs9dpznrhy9
 JRZNhO5KcT1YREWnEmTMVBwRDdpJE1ZkApJrQUbm7R9yBYoW9UVkB0x2qmXVAgeyuZFR
 2LohZqTvyKFMT46ZhfhlSiC+TcTstyI3wpIO+TVC1fQisIiXbD+OOyj1IO5ttJS2xO3H
 3epw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=0L6uzHBX
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/ti-k3-r5-loader: add dependency
 to yamllint
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: michael@amarulasolutions.com, Michael Walle <michael@walle.cc>,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andreas Dannenberg <dannenberg@ti.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSGVpa28sCgpMZSAwNC8wNC8yMDI0IMOgIDEwOjE3LCBIZWlrbyBUaGllcnkgYSDDqWNy
aXTCoDoKPiBTaW5jZSBVLUJvb3QgMjAyNC4wNCBbMV0gYmlubWFuIGFsc28gdXNlcyB5YW1sbGlu
dCBhcyBkZXBlbmRlbmN5IFsyXS4KPiAKPiBbMV0gaHR0cHM6Ly9zb3VyY2UuZGVueC5kZS91LWJv
b3QvdS1ib290Ly0vY29tbWl0LzEwZmVlODhkNDJmCj4gWzJdIGh0dHBzOi8vc291cmNlLmRlbngu
ZGUvdS1ib290L3UtYm9vdC8tL2Jsb2IvdjIwMjQuMDQvdG9vbHMvYnVpbGRtYW4vcmVxdWlyZW1l
bnRzLnR4dD9yZWZfdHlwZT10YWdzI0wzCgpEb24ndCBmb3JnZXQgdG8gdXBkYXRlIHRoZSB0d28g
dXJsIGluIHRpLWszLXI1LWxvYWRlci5tawoKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vYmxvYi9tYXN0ZXIvYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUt
bG9hZGVyLm1rP3JlZl90eXBlPWhlYWRzI0wzOAoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEhlaWtvIFRoaWVyeSA8aGVpa28udGhpZXJ5QGdtYWlsLmNvbT4KPiAt
LS0KPiAgYm9vdC90aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLm1rIHwgMSArCj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L3RpLWsz
LXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIubWsgYi9ib290L3RpLWszLXI1LWxvYWRlci90aS1r
My1yNS1sb2FkZXIubWsKPiBpbmRleCBiM2M0ODEwOWM4Li4zZjEwMDBjYWFkIDEwMDY0NAo+IC0t
LSBhL2Jvb3QvdGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+ICsrKyBiL2Jvb3Qv
dGktazMtcjUtbG9hZGVyL3RpLWszLXI1LWxvYWRlci5tawo+IEBAIC00OCw2ICs0OCw3IEBAIFRJ
X0szX1I1X0xPQURFUl9ERVBFTkRFTkNJRVMgPSBcCj4gIAlob3N0LXB5dGhvbi1weWxpYmZkdCBc
Cj4gIAlob3N0LXB5dGhvbi1weXlhbWwgXAo+ICAJaG9zdC1weXRob24tc2V0dXB0b29scyBcCj4g
Kwlob3N0LXB5dGhvbi15YW1sbGludCBcCj4gIAl0aS1rMy1ib290LWZpcm13YXJlCj4gIAo+ICBU
SV9LM19SNV9MT0FERVJfTUFLRSA9ICQoQlIyX01BS0UpCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
