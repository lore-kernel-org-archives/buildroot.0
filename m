Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4B5C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 12:10:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E56442751;
	Fri, 28 Apr 2023 12:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E56442751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrhMJ1Maxo7D; Fri, 28 Apr 2023 12:10:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2439C4274B;
	Fri, 28 Apr 2023 12:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2439C4274B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A5A01BF584
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 12:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0113542748
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 12:10:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0113542748
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10v8CxxIg1Vt for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 12:10:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C53744271F
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C53744271F
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 12:10:29 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f19ab994ccso75548845e9.2
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 05:10:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682683828; x=1685275828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eSBqrL4KSCsX8G/n4pYLhOeUUO1EJimKJQBTRBbKVOk=;
 b=VVY7X/5L95fbqVSZXHz9cQ9p6LhD3OAv8ekvsHK0z1XepeekDDtMoVUb0DOo3zFPY3
 CkjaNTkIw9pKQnpm4VGIu6+m67HnamtASBH9efvyCeUhL+5ZMPtX3TZWJF+H+462a7Xh
 GS0e50q7N/PmNRFW1FacsF5LF+QrkDwLKxRxdUsOQ9w/nw5nLyj9ncASZ3K35cHEygdh
 OuM+XHmbfE1PvpTXjrd4/GgFnJ+SyL1qeiPLdrcCJGXdlVf7D7TMb0ptSX49MtWul6xZ
 /r/xtkJVwyrTXsS+oxQSyYmLbK3ruQZ0oESkFFTzM0+YfGBoGGYfQ2o1sX/Bqw2phjEg
 bsiA==
X-Gm-Message-State: AC+VfDzQkskVmZxIAp/dRwg6WxJBrfJACWxsd8sU6jvmyXTNJ+4p169A
 09WkYSAoVN77uJqIV4JG7NQFpA==
X-Google-Smtp-Source: ACHHUZ7/3Dz6XXtkhQN2PC+bInkhcKCDvTQY8chO9U13ZBiNA6LerZpMFvOrrSK9IBDw4TsOJ/w3kQ==
X-Received: by 2002:a5d:4b0e:0:b0:304:a40c:43c6 with SMTP id
 v14-20020a5d4b0e000000b00304a40c43c6mr4371964wrq.11.1682683827726; 
 Fri, 28 Apr 2023 05:10:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adfe40d000000b002f8d402b191sm20978924wrm.112.2023.04.28.05.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 05:10:27 -0700 (PDT)
Message-ID: <ff13f23f-f1ad-5824-4756-30ee21f060ea@smile.fr>
Date: Fri, 28 Apr 2023 14:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230404153850.2345297-1-sebastian.weyer@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230404153850.2345297-1-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1682683828; x=1685275828;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eSBqrL4KSCsX8G/n4pYLhOeUUO1EJimKJQBTRBbKVOk=;
 b=t6i+bBSi+hCe3ZMQ0lUgMzmg04eQJYxjvrIBcVPaMERzrZIzT/7Kft/r2xgK9p+J4R
 DnFjqPEZ+cH6/FSpOqUBJ3/ezlllNmX6EjIDN+30GXrcrc4P0CLRHmK8z4AWBqvbVnsH
 xZkouY1GvERf06gM2SaTbvTS7LYj40agxgxBq3rV4kIQ+pPmrIJZ+ygyA7HHk0iizl3r
 xdu7rOat/xYuhJz1vLrC5xZC7/Hpw/yHoBxcK7balsfEz0lg51b+P6bKG8lItRD2fjjE
 h4I+z/+BbxLO3AeimBJdOiq06FC3nxt1QXsmyQuIqhBFZoRuTS6AsQuMOVrhCJoH9qyI
 z0gA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=t6i+bBSi
Subject: Re: [Buildroot] [PATCH v3 1/1] configs/qemu: update defconfigs to
 Linux 6.2.9
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@arm.com>,
 Thomas Huth <huth@tuxfamily.org>, Mark Corbin <mark@dibsco.co.uk>,
 Alexander Egorenkov <egorenar@linux.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDQvMDQvMjAyMyDDoCAxNzozOCwgU2ViYXN0aWFuIFdleWVyIGEgw6ljcml0wqA6Cj4gSnVz
dCB1cGRhdGluZyBhbGwgcWVtdSBkZWZjb25maWdzIHRvIHRoZSBsYXRlc3QgS2VybmVsIHZlcnNp
b246Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3Rh
YmxlL2xpbnV4LmdpdC9jb21taXQvP2g9bGludXgtNi4yLnkmaWQ9ZTEyOGNlMTJlMjljNWE2ZDlh
ODhjN2I4YTFjOGUwNzQwMmMzOGZlZAo+IAo+IFRlc3RlZCB1c2luZyBleHRlcm5hbCB0b29sY2hh
aW5zOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9Eb2NTZXBwL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy84
MjYwMDgzNzIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gV2V5ZXIgPHNlYmFzdGlhbi53
ZXllckBzbWlsZS5mcj4KPiAtLS0KPiB2MjoKPiAgICAgLSByZW1vdmUgS2VybmVsIGhlYWRlciB2
ZXJzaW9uIGZyb20gY29tbWVudCBpbgo+ICAgICAgIHFlbXVfcmlzY3Y2NF9ub21tdV92aXJ0X2Rl
ZmNvbmZpZwo+ICAgICAtIHVzZSBrZXJuZWwgdmVyc2lvbiA2LjIuOSBpbnN0ZWFkIG9mIDYuMS4x
MQo+IAo+IHYzOgo+ICAgICAtIGZpeGVkIGxlYWRpbmcgd2hpdGVzcGFjZSBpbiBxZW11X2FhcmNo
NjRfdmlydF9kZWZjb25maWcgdGhhdCBicm9rZQo+ICAgICAgIHRoZSBidWlsZAo+IAo+IFRoZSBw
aXBlbGluZSB1c2VkIGhlcmUgeWllbGRlZCB0aGUgc2FtZSByZXN1bHRzIGFzIFJvbWFpbidzIGZv
ciB0aGUKPiBwcmV2aW91cyB2ZXJzaW9uIG9mIHRoZSBwYXRjaDoKPiBodHRwczovL2dpdGxhYi5j
b20va3VidTkzL2J1aWxkcm9vdC8tL3BpcGVsaW5lcy83NzYzMTkxMjQKPiBXaXRoIHRoZSBleGNl
cHRpb24gdGhhdCB0aGUgZGVmY29uZmlncyBoZSByZW1vdmVkIGFyZW4ndCByZW1vdmVkIGZvciB0
aGUKPiBuZXcgcGlwZWxpbmUKPiAtLS0KPiAgY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9kZWZj
b25maWcgICAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X2FhcmNoNjRfc2JzYV9kZWZjb25m
aWcgICAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X2FhcmNoNjRfdmlydF9kZWZjb25maWcg
ICAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X2FybV9lYmJyX2RlZmNvbmZpZyAgICAgICAg
ICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X2FybV92ZXJzYXRpbGVfZGVmY29uZmlnICAgICAg
fCA0ICsrLS0KPiAgY29uZmlncy9xZW11X2FybV92ZXhwcmVzc19kZWZjb25maWcgICAgICAgfCA0
ICsrLS0KPiAgY29uZmlncy9xZW11X2FybV92ZXhwcmVzc190el9kZWZjb25maWcgICAgfCA0ICsr
LS0KPiAgY29uZmlncy9xZW11X202OGtfbWNmNTIwOF9kZWZjb25maWcgICAgICAgfCA0ICsrLS0K
PiAgY29uZmlncy9xZW11X202OGtfcTgwMF9kZWZjb25maWcgICAgICAgICAgfCA0ICsrLS0KPiAg
Y29uZmlncy9xZW11X21pY3JvYmxhemViZV9tbXVfZGVmY29uZmlnICAgfCA0ICsrLS0KPiAgY29u
Zmlncy9xZW11X21pY3JvYmxhemVlbF9tbXVfZGVmY29uZmlnICAgfCA0ICsrLS0KPiAgY29uZmln
cy9xZW11X21pcHMzMnIyX21hbHRhX2RlZmNvbmZpZyAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9x
ZW11X21pcHMzMnIyZWxfbWFsdGFfZGVmY29uZmlnICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11
X21pcHMzMnI2X21hbHRhX2RlZmNvbmZpZyAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X21p
cHMzMnI2ZWxfbWFsdGFfZGVmY29uZmlnICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X21pcHM2
NF9tYWx0YV9kZWZjb25maWcgICAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X21pcHM2NGVs
X21hbHRhX2RlZmNvbmZpZyAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X21pcHM2NHI2X21h
bHRhX2RlZmNvbmZpZyAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X21pcHM2NHI2ZWxfbWFs
dGFfZGVmY29uZmlnICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X25pb3MyXzEwbTUwX2RlZmNv
bmZpZyAgICAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X29yMWtfZGVmY29uZmlnICAgICAg
ICAgICAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X3BwYzY0X2U1NTAwX2RlZmNvbmZpZyAg
ICAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnICAg
ICAgfCA0ICsrLS0KPiAgY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnICAg
fCA0ICsrLS0KPiAgY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcgICAgfCA0
ICsrLS0KPiAgY29uZmlncy9xZW11X3BwY19iYW1ib29fZGVmY29uZmlnICAgICAgICAgfCA0ICsr
LS0KPiAgY29uZmlncy9xZW11X3BwY19lNTAwbWNfZGVmY29uZmlnICAgICAgICAgfCA0ICsrLS0K
PiAgY29uZmlncy9xZW11X3BwY19nM2JlaWdlX2RlZmNvbmZpZyAgICAgICAgfCA0ICsrLS0KPiAg
Y29uZmlncy9xZW11X3BwY19tYWM5OV9kZWZjb25maWcgICAgICAgICAgfCA0ICsrLS0KPiAgY29u
Zmlncy9xZW11X3BwY19tcGM4NTQ0ZHNfZGVmY29uZmlnICAgICAgfCA0ICsrLS0KPiAgY29uZmln
cy9xZW11X3Jpc2N2MzJfdmlydF9kZWZjb25maWcgICAgICAgfCA0ICsrLS0KPiAgY29uZmlncy9x
ZW11X3Jpc2N2NjRfbm9tbXVfdmlydF9kZWZjb25maWcgfCA2ICsrKy0tLQo+ICBjb25maWdzL3Fl
bXVfcmlzY3Y2NF92aXJ0X2RlZmNvbmZpZyAgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVf
czM5MHhfZGVmY29uZmlnICAgICAgICAgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVfc2g0
X3IyZF9kZWZjb25maWcgICAgICAgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVfc2g0ZWJf
cjJkX2RlZmNvbmZpZyAgICAgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVfc3BhcmM2NF9z
dW40dV9kZWZjb25maWcgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVfc3BhcmNfc3MxMF9k
ZWZjb25maWcgICAgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVfeDg2XzY0X2RlZmNvbmZp
ZyAgICAgICAgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVfeDg2X2RlZmNvbmZpZyAgICAg
ICAgICAgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVfeHRlbnNhX2x4NjBfZGVmY29uZmln
ICAgICAgICB8IDQgKystLQo+ICBjb25maWdzL3FlbXVfeHRlbnNhX2x4NjBfbm9tbXVfZGVmY29u
ZmlnICB8IDQgKystLQo+ICA0MiBmaWxlcyBjaGFuZ2VkLCA4NSBpbnNlcnRpb25zKCspLCA4NSBk
ZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X2FhcmNoNjRfZWJicl9k
ZWZjb25maWcgYi9jb25maWdzL3FlbXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZpZwo+IGluZGV4IGUz
MTU3MDg5YTkuLmU1NzE0YzFlZDUgMTAwNjQ0Cj4gLS0tIGEvY29uZmlncy9xZW11X2FhcmNoNjRf
ZWJicl9kZWZjb25maWcKPiArKysgYi9jb25maWdzL3FlbXVfYWFyY2g2NF9lYmJyX2RlZmNvbmZp
Zwo+IEBAIC02LDEyICs2LDEyIEBAIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJk
L3FlbXUvcG9zdC1pbWFnZS5zaCBib2FyZC9xZW11L2FhcmNoNjQtZWJici9wCj4gIEJSMl9ST09U
RlNfUE9TVF9TQ1JJUFRfQVJHUz0iJChCUjJfREVGQ09ORklHKSAtYyBib2FyZC9xZW11L2FhcmNo
NjQtZWJici9nZW5pbWFnZS5jZmciCj4gIAo+ICAjIExpbnV4IGhlYWRlcnMKPiAtQlIyX1BBQ0tB
R0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV82XzE9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJ
TlVYX0hFQURFUlNfQ1VTVE9NXzZfMj15Cj4gIApCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURF
UlNfQ1VTVE9NXzZfMiBkb2Vzbid0IGV4aXN0IHlldCBpbiBCdWlsZHJvb3QsIHlvdQpoYXZlIHRv
IGFkZCBpdCBmaXJzdCBvdGhlcndpc2UgeW91IHdpbGwgZ2V0IGEga2VybmVsIGhlYWRlcnMgY2hl
Y2sgZmFpbC4KCk5vdGU6IHRoZSBrZXJuZWwgNi4xIGlzIGFuIExUUyByZWxlYXNlIHNvIGl0IHdp
bGwgYmUgbWFpbnRhaW5lZCBmb3IgYSBsb25nIHRpbWUKdW5saWtlIHRoZSA2LjIuCgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
