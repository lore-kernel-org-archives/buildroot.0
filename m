Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB3CAE7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 19:06:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86347611FB;
	Wed, 11 Dec 2024 19:06:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nm3aILeFZVQC; Wed, 11 Dec 2024 19:06:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B70BA611F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B70BA611F8;
	Wed, 11 Dec 2024 19:06:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16AF8ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0315611F6
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:06:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKl7WzYTyhjj for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 19:06:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BBDF611F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BBDF611F1
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BBDF611F1
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 19:06:45 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-43618283dedso18209245e9.3
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 11:06:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733944004; x=1734548804;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hTJ89qalmFO1q6g1H4Ybod4gfNt3RzQqISo4/pE7/Fw=;
 b=kTUSn0BGvm4say+6Ja/rSwPgWZWBQ2jAcTb4MfAxGGzYfJ8z+FnNyBnWmHipP3XWFa
 11P0GZrK6G3p+lPKmAOsbPlTODBv23HvyAv7fKyTBSDr9CHi8oflNiE1ezw0z8ht0ppA
 d3Taqsj5Z07Do+5eWf4EbPZcUj6LeDwVKuhGWKnDNjPqM7/4/K+2m0naTRpwH+c/duti
 YbhmTdpTlTSFansACYLINmFDaOc4SeQiPh+OFNclw5nafcCS89hS8UF6p3mSycfkxft1
 556jMa2QaaJo2CRsj8Ie2e4zcJqshdEpE20xqdIQ3YeBMfpH9f+DzEF9TPQAZg3qzkrk
 GXng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbqxfA7YrnDFGcmLpjCuWJ1h0nmtSGhPEuORR8ZFDGDnPOUysm+1jNnXApw9wTVcCMLnZl8aOzxG8=@buildroot.org
X-Gm-Message-State: AOJu0YwJlbepsvRx2uu2VfMc4aKcLlk2x4JpABdJutCxPAgwE033CaG/
 YQNeEkOOvNHJ2iisk95ANa8J6XrffeKRRjJbaK0lwL4m5UF20SIkeG8/+8sdbcompnYuuPTkZhb
 awfmE4g==
X-Gm-Gg: ASbGnctoRSuTGTqwbB4pv+/JoH/emv6npYSOwVsaiF/h5kCYutT0FdKkqvitX+lomwI
 7E4eL5en3CAjJ45D33tGOeC+Ux/4hK6s0TwZB/uJI40AmNMyZRNB9QN67cTwooJZ1ErkqgEXrgw
 IpIRHlXCNRb/WN7hAvBSKyev48g47xyPuR8Xup1IOs2Wya0dya19+AAf1UypnRGVFo6kroKE6BA
 ES7myaAlhBEGP0bAqtmKS2lDtevNLseU0nsiBn6gmmRRs9WEyc8PEU1ct5ndCJZm+4nI6rlps3J
 QKboBbUAm6LVAPEBnAlZriXnM1Ol/pVxsWjIH6xiBILOaPfeQ/e8C3pQDx3noD3JFfHzLEVr+w4
 tHHqz9seQa+5CEg==
X-Google-Smtp-Source: AGHT+IHUvukKO7DF5WnvsR7kOhaMnvLSqaZLXTN5s1nFQVHDE41YlcYZ27VLAf7aMd4r4ecvPF4yZw==
X-Received: by 2002:a05:600c:1d15:b0:435:1a2:2633 with SMTP id
 5b1f17b1804b1-43622842810mr8379335e9.15.1733944003794; 
 Wed, 11 Dec 2024 11:06:43 -0800 (PST)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434f99eab5esm109304835e9.6.2024.12.11.11.06.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Dec 2024 11:06:43 -0800 (PST)
Message-ID: <c4759881-c7b1-47be-b640-3a45d856fc7e@smile.fr>
Date: Wed, 11 Dec 2024 20:06:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
References: <20241208214748.524923-1-geomatsi@gmail.com>
 <675c239b-5d11-4f07-be59-86f6f046da1d@smile.fr>
Content-Language: fr, en-US
In-Reply-To: <675c239b-5d11-4f07-be59-86f6f046da1d@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1733944004; x=1734548804; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=hTJ89qalmFO1q6g1H4Ybod4gfNt3RzQqISo4/pE7/Fw=;
 b=Lh4LhiOwetVfKt59F0gHqfvvv0q5x7b2tV/BhTQSYfpxbu3q3jglXMoz+MU6DWzz50
 GdX9nvH2CV907Qm//DJmHtWsvVwoR7HJk+RiX2gwoFVOflyAXlxOS550u3jeklucB1M9
 75US+qlBAZ5+6W9IDbR7wiUoNtxfeSQPJAo4I=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Lh4LhiOw
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxsLAoKTGUgMTEvMTIvMjAyNCDDoCAxNDo0MywgUm9tYWluIE5hb3VyIGEgw6ljcml0
wqA6Cj4gSGVsbG8gU2VyZ2V5LAo+IAo+IExlIDA4LzEyLzIwMjQgw6AgMjI6NDYsIFNlcmdleSBN
YXR5dWtldmljaCBhIMOpY3JpdMKgOgo+PiBIaSBUaG9tYXMsIEJlcm5kLCBhbmQgYWxsCj4+Cj4+
IEkgaGF2ZSBiZWVuIHdhaXRpbmcgZm9yIHRoZSBuZXcgTFRTIExpbnV4IHY2LjEyIGluIEJ1aWxk
cm9vdCB0byBzdGFydAo+PiBzZW5kaW5nIENocmlzdG1hcyB1cGRhdGVzIGZvciBzb21lIG9mIG15
IE9yYW5nZVBpIGJvYXJkcy4gTm93IHY2LjEyLjMKPj4gaXMgYWxyZWFkeSBhdmFpbGFibGUsIGJ1
dCB0aGUgbGF0ZXN0IGtlcm5lbCBpcyBzdGlsbCBoYXZlIDYuMTEueC4KPj4gU28gSSBkZWNpZGVk
IHRvIHVuZGVydGFrZSBhIGNvcHktcGFzdGUgZXhlcmNpc2UgdXNpbmcgdGhlIGxhdGVzdCBrZXJu
ZWwKPj4gYW5kIGhlYWRlcnMgdXBkYXRlIHNlcmllcyBieSBCZXJuZC4gSG9wZSBJIGRpZG4ndCBt
aXNzIGEgdGhpbmcgdGFraW5nCj4+IGludG8gYWNjb3VudCB0aGF0IHRoaXMgaXMgYSBuZXcgTFRT
Lgo+IAo+IEV2ZXJ5dGhpbmcgc2VlbXMgZ29vZCBzbyBmYXIgOikKCkV4Y2VwdCBJIG1pc3NlZCB0
aGUgZGlzY3Vzc2lvbiBhYm91dCB0aGUgb3V0IG9mIHRyZWUgRFRCcyBpc3N1ZSByZXBvcnRlZCBi
eQpDaHJpcyBQYWNraGFtIGFuZCBFZGdhciBCb25ldCBbMV0gOi0oCgpbMV0KaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvYnVpbGRyb290L2RjYmQzZjc3LWU3MzctNDFhMi05ZjIzLTg3MTQxZDBiZGY5
YkBncmVub2JsZS5jbnJzLmZyLwoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEFwcGxpZWQg
dG8gbWFzdGVyLCB0aGFua3MuCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+IAo+Pgo+
PiBSZWdhcmRzLAo+PiBTZXJnZXkKPj4KPj4gU2VyZ2V5IE1hdHl1a2V2aWNoICgzKToKPj4gICB7
dG9vbGNoYWluLCBsaW51eC1oZWFkZXJzfTogYWRkIHN1cHBvcnQgZm9yIDYuMTIgaGVhZGVycwo+
PiAgIGxpbnV4OiBidW1wIGxhdGVzdCB2ZXJzaW9uIHRvIDYuMTIKPj4gICBwYWNrYWdlL2xpbnV4
LWhlYWRlcnM6IGRyb3AgNi4xMS54IG9wdGlvbgo+Pgo+PiAgQ29uZmlnLmluLmxlZ2FjeSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDcgKysrKysrKwo+PiAgbGludXgvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDYgKysrLS0tCj4+ICBsaW51
eC9saW51eC5oYXNoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+PiAg
cGFja2FnZS9saW51eC1oZWFkZXJzL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgIHwgMTYgKysr
KysrKysrKy0tLS0tLQo+PiAgdG9vbGNoYWluL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDUgKysrKysKPj4gIC4uLi90b29sY2hhaW4tZXh0ZXJuYWwtY3VzdG9tL0Nv
bmZpZy5pbi5vcHRpb25zICB8ICA2ICsrKysrLQo+PiAgNiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
