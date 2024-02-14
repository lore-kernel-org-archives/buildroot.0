Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC383C48BC1
	for <buildroot@archiver.kernel.org>; Wed, 14 Feb 2024 15:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6755D823AB;
	Wed, 14 Feb 2024 15:47:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WatvacSxFVC7; Wed, 14 Feb 2024 15:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63C94824DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63C94824DF;
	Wed, 14 Feb 2024 15:47:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0300C1BF313
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 15:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F182C416C1
 for <buildroot@lists.busybox.net>; Wed, 14 Feb 2024 15:47:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jyk1HtanGr4i for <buildroot@lists.busybox.net>;
 Wed, 14 Feb 2024 15:47:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EAD45416E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAD45416E7
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAD45416E7
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 15:47:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-33b4e6972f6so2876760f8f.2
 for <buildroot@buildroot.org>; Wed, 14 Feb 2024 07:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707925628; x=1708530428;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7dMm4CXp6uRyU1aOKzjyX1Dphoe6mwu9hvmr3nKFolA=;
 b=Zrt4xHOGxvwIY4WUKmnUZrKz5cnilkWbI1dE1bKFAyCcW0fq2jAGemDtIRkJIRscDY
 HtVqCBhSM3Eet7uFcY16JwWKJpSEgXzwiCwCi0dUyjDuIrPAzi4ogaHm4LbNvOkTR2eR
 cru4ESOvXWhk8YeSvYlmt7LOQVqiesqxVnjqT1GAUTzHoaVDeVKBZdK8Tt35Mpd5uEjj
 5afH0wznCQ5r+Iv163ds84ztfIiZmme/r3vtzWamgGYeIsjAR59hXONKj84cNwqHTvon
 bTSztbkwo9BDYa51bpYdlK1hw5Bymgy3MNa4RuPirEEE++o03rVqzOTbOTnJAGU0gKSB
 GnGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzLnYIMr6AvzaTUhzXJmWRXqV+abF2/AXjytzJDsmTaTsgofX6eLKT3tRIb/Dv231GjgN6XXHQ9XEBakxNHB6r3wuejMmjnA==
X-Gm-Message-State: AOJu0Yx/B+iqGVWh5nlDaarUqRt9X9mtvhXn0sOVSWT504QOH2hoabAJ
 8C39GEQJYOd1e+CjAk9KTddkZuQOrNWomVQYRHMKc1AlBeiakw6Z65P1Ko1vet4=
X-Google-Smtp-Source: AGHT+IHKZ22jmWtZn3Uer9WiuB3emRNvAEAyQ1U/4Izbcma7TebNJ1AWAhB487qK4Zp2GaNUwLrzog==
X-Received: by 2002:adf:f885:0:b0:33c:dd02:f652 with SMTP id
 u5-20020adff885000000b0033cdd02f652mr2016803wrp.10.1707925628439; 
 Wed, 14 Feb 2024 07:47:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWknLTz0cMzENzPoeIfTjIzrLjhkb7pdUsfamzddadiLNfUHRLIQKVDmAF7xCpeb0D6kcjnMbY38vCk2VuMfBeEJKpfjpy3kD3DZVxyDn+HJfOJQFjx/8/GTEZ5pymtVhcsrzsucajCkRSzg7iHvOJmymwg7YnyI0ne37wicyFOxpNN64KqJto9qJzSXDXu+JpRRea6jS36ymPzvvZUJrHYmHwZXOUJ4AwP/Gu+9p1PgYv2fyrI66piQHsw/Y/pxUh+HaCT531GqvTm92hOqKGrQjRVedyyqHWDW6aI78XjnK8CWqz/LRCEFzGkRRMA37rdPtmMj1CRcjzVxNh937InNoinkCJgglhvp274nROWVDsX+xcHe6Gazgd1ibBQLh0cUzh591Z1SG0bxqWUzw+9wPpGZ2En5eItYWQ2L66ylJ3MHwrhrGIb2wkajTwxDIRo4le1SSCIae2sNJAXyzcG8NjqLLKN8Pe7KzPz28Kok9pTGF+S42v06z+naAN9K5Vv034F4TSEA9yQ1dnrlBCMZT1NGHeOhhzVbhfN2QVTvd7JU1HmsmPPTC89pzog2Bbes6kzVgIrtSlrJhQ6mpgVXAOpPXIzdRxinhYZPlRkNWMJNoYAuDN9QZjTc0GlHCZsiu401WxrTTPsoog9XWzzIklEK4PVMp1BvPmgj6RKUBng9ppn0vtCkLwsqJYlY4nCBBMa4hgf0Zu8Dg==
Received: from [192.168.178.20] (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 bs25-20020a056000071900b0033b406bc689sm12872348wrb.75.2024.02.14.07.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Feb 2024 07:47:07 -0800 (PST)
Message-ID: <70f20edd-f97e-4bb4-925a-9c0295a80fe1@mind.be>
Date: Wed, 14 Feb 2024 16:47:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
 <20240213211512.3918044-21-james.hilliard1@gmail.com>
Content-Language: en-US
In-Reply-To: <20240213211512.3918044-21-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707925628; x=1708530428; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7dMm4CXp6uRyU1aOKzjyX1Dphoe6mwu9hvmr3nKFolA=;
 b=NujWQytVmqVr99Aj0P+YtKHHeDagpPcc1fxlRmDebWSxSNfakti4A0EU2HAjwv0aFl
 K8WHkVVUxPQ7KAq8E7EDcZvED2dDwl+82t8HndD9/ZAs/ZfHRao3XDY+UR6MK6JGGqvN
 Jli9Yy5PJuA112ikkagcDKUqb67tjAoqD/Gw+Ni6YNBShDqxjhcvP1J6xIfcBshWTag7
 aN2MirGhqLVc3lhRmqv/iXpaRYaggd+EcBGvVbgQQkfUY5emJwq16iWFp1rsrq3lW/p4
 WOCxRXBEspjRK0mWADI/6qz+DeP/dlI7FjJQoWSPtFX7NrMsB6CR0WwHRrI/4h7FkA3P
 cc5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NujWQytV
Subject: Re: [Buildroot] [PATCH v8 21/26] package/python-rsa: migrate to
 poetry core pep517 build backend
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?Q?Fl=C3=A1vio_Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>, "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsIGFsbAoKT24gMi8xMy8yNCAyMjoxNSwgSmFtZXMgSGlsbGlhcmQgd3JvdGU6Cj4g
V2UgbmVlZCB0byBtaWdyYXRlIHB5dGhvbi1yc2EgdG8gdGhlIHBlcDUxNyBwb2V0cnktY29yZQo+
IGJhY2tlbmQgYXMgc2V0dXB0b29scyBpcyBub3Qgc3VwcG9ydGVkIHdoZW4gYnVpbGRpbmcgd2l0
aCBhIHBlcDUxNwo+IGZyb250ZW5kLgo+IAo+IFRoaXMgcGFja2FnZSBjdXJyZW50bHkgYnVpbGRz
IHVzaW5nIHNldHVwdG9vbHMgYXMgd2UgZG8gbm90IHlldAo+IHVzZSBzZXR1cHRvb2xzIHdpdGgg
YSBwZXA1MTcgYnVpbGQgZnJvbnRlbmQuIFRoZSBwYWNrYWdlIGNvbnRhaW5zCj4gYSBzZXR1cHRv
b2xzIGZhbGxiYWNrIHdoaWNoIG9ubHkgY2FuIGJlIHVzZWQgd2hlbiB1c2luZyBzZXR1cHRvb2xz
Cj4gd2l0aG91dCBhIHBlcDUxNyBmcm9udGVuZCBhcyB0aGUgcGVwNTE3IGZyb250ZW5kIHdpbGwg
b25seSB1c2UgdGhlCj4gYnVpbGQgYmFja2VuZCBzcGVjaWZpZWQgaW4gdGhlIHBhY2thZ2UgcHlw
cm9qZWN0LnRvbWwgd2hpY2ggaXMKPiBwb2V0cnktY29yZSBhbmQgbm90IHNldHVwdG9vbHMuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+CgpJIHJhbiB0aGUgYXNzb2NpYXRlZCBydW4tdGVzdHMgdGVzdCBvbiBteSBzaWRlIChvbmx5
IGZvciBweXRob24tcnNhIHNvIGZhciksIGl0IGxvb2tzIGdvb2QgdG8gbWUuCgpUZXN0ZWQtYnk6
IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KCj4gLS0tCj4gICBw
YWNrYWdlL3B5dGhvbi1yc2EvcHl0aG9uLXJzYS5tayB8IDMgKystCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvcHl0aG9uLXJzYS9weXRob24tcnNhLm1rIGIvcGFja2FnZS9weXRob24tcnNhL3B5dGhvbi1y
c2EubWsKPiBpbmRleCBkODRiYThiNDMxLi42OWE2MzA5YjE5IDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvcHl0aG9uLXJzYS9weXRob24tcnNhLm1rCj4gKysrIGIvcGFja2FnZS9weXRob24tcnNhL3B5
dGhvbi1yc2EubWsKPiBAQCAtNyw5ICs3LDEwIEBACj4gICBQWVRIT05fUlNBX1ZFUlNJT04gPSA0
LjkKPiAgIFBZVEhPTl9SU0FfU09VUkNFID0gcnNhLSQoUFlUSE9OX1JTQV9WRVJTSU9OKS50YXIu
Z3oKPiAgIFBZVEhPTl9SU0FfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9w
YWNrYWdlcy9hYS82NS83ZDk3M2I4OWM0ZDIzNTFkN2ZiMjMyYzJlNDUyNTQ3ZGRmYTI0M2U5MzEz
MWU3Y2ZhNzY2ZGE2MjdiNTIKPiAtUFlUSE9OX1JTQV9TRVRVUF9UWVBFID0gc2V0dXB0b29scwo+
ICtQWVRIT05fUlNBX1NFVFVQX1RZUEUgPSBwZXA1MTcKPiAgIFBZVEhPTl9SU0FfTElDRU5TRSA9
IEFwYWNoZS0yLjAKPiAgIFBZVEhPTl9SU0FfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAgIFBZ
VEhPTl9SU0FfQ1BFX0lEX1ZBTElEID0gWUVTCj4gK1BZVEhPTl9SU0FfREVQRU5ERU5DSUVTID0g
aG9zdC1weXRob24tcG9ldHJ5LWNvcmUKPiAgIAo+ICAgJChldmFsICQocHl0aG9uLXBhY2thZ2Up
KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
