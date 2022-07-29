Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83BAC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 07:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D94083FAA;
	Fri, 29 Jul 2022 07:12:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D94083FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id depqqpNzYRMW; Fri, 29 Jul 2022 07:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A29A83F1E;
	Fri, 29 Jul 2022 07:12:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A29A83F1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3EB111BF31B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 192F7408F3
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:12:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 192F7408F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zE6OA4dBBI8 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 07:12:53 +0000 (UTC)
X-Greylist: delayed 00:14:57 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8DC04033F
Received: from smtpout2.mo529.mail-out.ovh.net
 (smtpout2.mo529.mail-out.ovh.net [79.137.123.220])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E8DC04033F
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 07:12:52 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.156.48])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 8079411B281EC;
 Fri, 29 Jul 2022 08:55:40 +0200 (CEST)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:55:38 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <efb786de-7e67-5a7f-047c-2a0241fa9af2@kaod.org>
Date: Fri, 29 Jul 2022 08:55:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-10-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-10-joel@jms.id.au>
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: fbaca8df-363a-4c69-8378-f45d88f34d37
X-Ovh-Tracer-Id: 9542001713593092902
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpoffvtefjohhsthepmhhohedvle
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003c5226a62-b7f4-4f7b-a795-07eb533795c8,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 9/9] package/openblas: Add Power9 and
 Power10 targets
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNy8yOS8yMiAwMjowOSwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IE5vdyB0aGF0IGJ1aWxkcm9v
dCBzdXBwb3J0cyB0aGVzZSBDUFVzIHNldCB0aGUgdGFyZ2V0IHR5cGUuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5hdT4KClJldmlld2VkLWJ5OiBDw6lkcmlj
IExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgoKVGhhbmtzLAoKQy4KCj4gLS0tCj4gICBwYWNrYWdl
L29wZW5ibGFzL0NvbmZpZy5pbiB8IDIgKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuYmxhcy9Db25maWcuaW4gYi9wYWNr
YWdlL29wZW5ibGFzL0NvbmZpZy5pbgo+IGluZGV4IDAxNDRlOTNhM2ZhZi4uMWQ0MDNjNDMyZTg4
IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvb3BlbmJsYXMvQ29uZmlnLmluCj4gKysrIGIvcGFja2Fn
ZS9vcGVuYmxhcy9Db25maWcuaW4KPiBAQCAtMjIsNiArMjIsOCBAQCBjb25maWcgQlIyX1BBQ0tB
R0VfT1BFTkJMQVNfREVGQVVMVF9UQVJHRVQKPiAgIAlkZWZhdWx0ICJQT1dFUjYiICAgICAgIGlm
IEJSMl9wb3dlcnBjX3Bvd2VyNgo+ICAgCWRlZmF1bHQgIlBPV0VSNyIgICAgICAgaWYgQlIyX3Bv
d2VycGNfcG93ZXI3Cj4gICAJZGVmYXVsdCAiUE9XRVI4IiAgICAgICBpZiBCUjJfcG93ZXJwY19w
b3dlcjgKPiArCWRlZmF1bHQgIlBPV0VSOSIgICAgICAgaWYgQlIyX3Bvd2VycGNfcG93ZXI5Cj4g
KwlkZWZhdWx0ICJQT1dFUjEwIiAgICAgIGlmIEJSMl9wb3dlcnBjX3Bvd2VyMTAKPiAgIAlkZWZh
dWx0ICJQUENHNCIgICAgICAgIGlmIEJSMl9wb3dlcnBjXzc0MDAgfHwgQlIyX3Bvd2VycGNfNzQ1
MAo+ICAgCWRlZmF1bHQgIlBQQzk3MCIgICAgICAgaWYgQlIyX3Bvd2VycGNfOTcwCj4gICAJZGVm
YXVsdCAiUFBDNDQwIiAgICAgICBpZiBCUjJfcG93ZXJwY180NDAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
