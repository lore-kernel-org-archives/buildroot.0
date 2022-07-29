Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D4DC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 07:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB7B61032;
	Fri, 29 Jul 2022 07:08:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB7B61032
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id InzfTRJuS96O; Fri, 29 Jul 2022 07:08:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE58607C9;
	Fri, 29 Jul 2022 07:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BE58607C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 88F341BF31B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:08:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B8CB4175B
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 07:08:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B8CB4175B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id deNJimhk8Nzq for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 07:07:55 +0000 (UTC)
X-Greylist: delayed 00:15:21 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E32C415FE
Received: from smtpout3.mo529.mail-out.ovh.net
 (smtpout3.mo529.mail-out.ovh.net [46.105.54.81])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8E32C415FE
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 07:07:55 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.118])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 5B4A011B27E40;
 Fri, 29 Jul 2022 08:52:30 +0200 (CEST)
Received: from kaod.org (37.59.142.105) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Fri, 29 Jul
 2022 08:52:30 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <ee84914c-6701-ab70-6442-f88c94b4c3af@kaod.org>
Date: Fri, 29 Jul 2022 08:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>, <buildroot@buildroot.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-5-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729000904.1295295-5-joel@jms.id.au>
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 6dcf8904-d839-432f-8c99-1c7f1dd4c66f
X-Ovh-Tracer-Id: 9488521466142886694
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduiedgheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeekteejtdelkeejvdevffduhfetteelieefgeefffeugffhfeekheffueefledujeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdpoffvtefjohhsthepmhhohedvle
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-105G0064234f4be-e86d-42e8-8927-80289d30b496,
 FAFF5065920E43DA0D2CF6C40E58A39B80E28978) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 4/9] package/glibc: Use powerpc64le instead
 of power8
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

T24gNy8yOS8yMiAwMjowOCwgSm9lbCBTdGFubGV5IHdyb3RlOgo+IFdpdGggImFyY2gvcG93ZXJw
YzogRW5hYmxlIHBvd2VycGM2NGxlIG9ubHkgb24gQ1BVcyB0aGF0IHN1cHBvcnQgaXQiCj4gd2Ug
Y2FuIHVzZSB0aGlzIHN5bWJvbCB0byBpbmRpY2F0ZSB0aGUgQ1BVIGlzIHN1cHBvcnRlZCBieSBn
bGliYy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgoK
UmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+CgpUaGFua3MsCgpD
LgoKPiAtLS0KPiAgIHBhY2thZ2UvZ2xpYmMvQ29uZmlnLmluIHwgMiArLQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZ2xpYmMvQ29uZmlnLmluIGIvcGFja2FnZS9nbGliYy9Db25maWcuaW4KPiBpbmRleCAy
M2NiZmNkOWFhNGYuLmUwY2U0Njk2ODI3OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dsaWJjL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvZ2xpYmMvQ29uZmlnLmluCj4gQEAgLTEyLDcgKzEyLDcg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX0dMSUJDX0FSQ0hfU1VQUE9SVFMKPiAgIAlkZWZhdWx0IHkg
aWYgQlIyX29yMWsKPiAgIAlkZWZhdWx0IHkgaWYgQlIyX3Bvd2VycGMKPiAgIAlkZWZhdWx0IHkg
aWYgQlIyX3Bvd2VycGM2NAo+IC0JZGVmYXVsdCB5IGlmIEJSMl9wb3dlcnBjX3Bvd2VyOAo+ICsJ
ZGVmYXVsdCB5IGlmIEJSMl9wb3dlcnBjNjRsZQo+ICAgCWRlZmF1bHQgeSBpZiBCUjJfcmlzY3YK
PiAgIAlkZWZhdWx0IHkgaWYgQlIyX3MzOTB4Cj4gICAJZGVmYXVsdCB5IGlmIEJSMl9zaAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
