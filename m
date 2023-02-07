Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15A5C636CC
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 21:57:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62D2B61063;
	Tue,  7 Feb 2023 21:57:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62D2B61063
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPhYzGcCvDvO; Tue,  7 Feb 2023 21:57:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5C26105A;
	Tue,  7 Feb 2023 21:57:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B5C26105A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED7291BF377
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C668F4093F
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 21:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C668F4093F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NpKdKdZdLLN7 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 21:57:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 352204091C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 352204091C
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 21:57:06 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so103894wma.1
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 13:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5nmYj//DbXx6YOD4wY+LLYd8wNPgyOrRd7L3EtuTV/c=;
 b=XEjkR87W81vzCU1kK28ZZwDL0RS9YQJAh6qvued7KUvqVcIVBo0rp7v6CLVpCcQNEl
 svxLNbkS1GexkbcSL0z5DBgwAZ96M9SldXgnq6pMqZjqB8O0QkPi0J6Fin4iYZGlWGno
 39UAkCV1bJT4bnJvOkqAnpylvuOkNzM3+xts0yqIBhuf0mbyYeu9208T7cETQZmISLVN
 KMYUcYcud67nOan/BBnW4PGYw/i3Kk4YvoKz2cAn1rZla8XHHdb3Xdbwia8dd4mGdTyx
 ZB0dsnqzv0K6aI+0wlIcZEW8sbLsYJ65TGD00LyKPNqxmSJCuicAs+nfRFi7lLGWt5hs
 cM0g==
X-Gm-Message-State: AO0yUKVg64pZdVrcblsoEwy9Xdmu4w825drHTAH3RgRrWYDDIIusSYrw
 pNwE460EHHgzepnMmJKMsWBlcQ==
X-Google-Smtp-Source: AK7set/nD2emeiudhCjdihSZ1pfFK/L81ztI6kqXrjDVptRhbclVjb5a2HBR3bYqel6Mw8X5RAoytg==
X-Received: by 2002:a05:600c:1714:b0:3dc:5a7c:f8ad with SMTP id
 c20-20020a05600c171400b003dc5a7cf8admr5739765wmn.21.1675807024355; 
 Tue, 07 Feb 2023 13:57:04 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 j40-20020a05600c1c2800b003dc4480df80sm38429wms.34.2023.02.07.13.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 13:57:03 -0800 (PST)
Message-ID: <d171cfa3-b5ad-35d2-7a7e-016dc5f8513a@smile.fr>
Date: Tue, 7 Feb 2023 22:57:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1675805584.git.yann.morin.1998@free.fr>
 <393e263cc9e0f72b237b6bf5cda86101ded50101.1675805584.git.yann.morin.1998@free.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <393e263cc9e0f72b237b6bf5cda86101ded50101.1675805584.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5nmYj//DbXx6YOD4wY+LLYd8wNPgyOrRd7L3EtuTV/c=;
 b=rqOu+eGDDnSp+mA4lWPtHQFjusjPpC1NVmCpHO3D5lsqDprNb8iFlQQHOPtBf5w1yT
 aVJJoSa3pqCjnAf1++LvTN1Y4Cn7VOvCKZBtIFgzBbDlMFU/Wu5rIR9WMDEZIDT4ySmn
 YNYlviwgz9R1PajzqTfyrg3XaR/0XxDlKKulZipp2hdNL3f3s+MVhVAmMJtNUVLZaPWA
 u3KWJkdc26gYZFQmZODjL18/AmlThS15UGaRAI1W1UoYLVRMef5F9iHUuJkCLvlbYtF7
 MSaEAPdFLal1MVKCS2aQuF1Y9alc7Tv6gw+XfjZlhOAkU0AApM5d1cg4ofFUSG1ycwBa
 s1ug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=rqOu+eGD
Subject: Re: [Buildroot] [PATCH 2/2] gitlab-ci: fix pipelines
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCklzICJmaXggcGlwZWxpbmVzIiB5b3VyIFdJUCBwYXRjaCBzdWJqZWN0ID8K
ImdpdGxhYi1jaTogaWdub3JlIG93bmVyc2hpcCBvZiB0aGUgZ2l0IHRyZWUiIHNlZW1zIGJldHRl
cj8KCkxlIDA3LzAyLzIwMjMgw6AgMjI6MzMsIFlhbm4gRS4gTU9SSU4gYSDDqWNyaXTCoDoKPiBX
aGVuIGdpdGxhYiBwcmVwYXJlcyBhIGpvYiB0byBydW4sIGl0IGNoZWNrcyBvdXQgdGhlIHJlcG9z
aXRvcnkgd2l0aCBhCj4gbm9uLXJvb3QgdXNlciwgYW5kIHNwYXducyBhIGNvbnRhaW5lciB0aGF0
IHJ1bnMgYXMgcm9vdCwgd2l0aCBzb21lIFVJRAo+IG1hcHBpbmcgdGhhdCBtYWtlcyB0aGUgZmls
ZXMgYmUgb3duZWQgYnkgcm9vdCBpbiB0aGUgY29udGFpbmVyLiBIb3dldmVyLAo+IG91ciBwaXBl
bGluZXMgcnVuIGFzIGEgbm9udC1yb290IHVzZXIuCj4gCj4gQ29tbWl0IGJkZTE2NWY3YWQgKC5n
aXRsYWItY2kueW1sOiB1cGRhdGUgRG9ja2VyIGltYWdlIHRvIHVzZSkgdXBkYXRlZAo+IHRoZSBk
b2NrZXIgaW1hZ2UgdGhhdCBpcyB1c2VkIHRvIHJ1biBpbiBvdXIgcGlwZWxpbmVzLgo+IAo+IFRo
YXQgbmV3IGltYWdlIGluY2x1ZGVzIGEgZ2l0IHZlcnNpb24gdGhhdCBpcyBzdHJpY3RlciBhYm91
dCB0aGUKPiBvd25lcnNoaXAgb2YgdGhlIGdpdCB0cmVlIGl0IGlzIGFjdGluZyBpbjogZ2l0IGFi
b3J0cyBpbiBlcnJvciB3aGVuIHRoZQo+IHVzZXIgcnVubmluZyBpdCBkb2VzIG5vdCBvd24gdGhl
IHJlcG9zaXRvcnkuCj4gCj4gV2UgdXNlIGBnaXQgbHMtdHJlZWAgcXVpdGUgYSBsb3QgaW4gb3Vy
IGNoZWNrLXtmbGFrZTgscGFja2FnZSxzeW1ib2xzfQo+IHJ1bGVzLCBzbyB0aGV5IGFsbCBmYWls
IChpbiB2YXJpb3VzIHdheXMpLgo+IAo+IFRvIGZpeCB0aGlzLCB3ZSBlaXRoZXIgbmVlZCB0byBm
aXggdGhlIG93bmVyc2hpcCBvciB0ZWxsIGdpdCB0byBpZ25vcmUKPiB0aGUgc2l0dWF0aW9uLgo+
IAo+IEl0IGlzIG1vc3QgcHJvYmFibHkgaW1wb3NzaWJsZSB0byBjaGFuZ2UgdGhlIG93bmVyc2hp
cCBvZiB0aGUgZmlsZXM6IHdlCj4gcnVuIGFzIG5vbi1yb290LGFuZCB0aGUgZmlsZXMgYmVsb25n
IHRvIHJvb3QgKGluIHRoZSBjb250YWluZXIpLiBTbwo+IHdlJ3JlIHN0dWNrLgo+IAo+IFRoZSBh
bHRlcm5hdGl2ZSwgaXMgdG8gZG8gYXMgZ2l0IHN1Z2dlc3QsIGFuZCB0ZWxsIGl0IHRvIGlnbm9y
ZSB0aGUKPiBzaXR1YXRpb24uIEluIGEgbG9jYWwgc2V0dXAsIHRoaXMgd291amxkIGJlIHZlcnkg
aW5zZWN1cmUsIGJ1dCBpbiB0aGUKPiBwaXBlbGluZXMsIHRoaXMgaXMgaW4gYSB0aHJvdy1hd2F5
IGNvbnRhaW5lciwgd2VocmUgYSBzaW5nbGUgdXNlciBleGlzdHMKPiBhbmQgaXMgcnVubmluZywg
c28gd2UgZG9uJ3QgY2FyZSBtdWNoIChpZiBhdCBhbGwpLgo+IAo+IEFkZCBhIGdsb2JhbCBiZWZv
cmVfc2NyaXB0IHRoYXQgcmVnaXN0ZXJzIHRoZSBnaXQgY29uZmlnIHRvIGlnbm9yZQo+IG93bmVy
c2hpcCBpc3N1ZXMgaW4gdGhlIGJ1aWxkcm9vdCByZXBvc2l0b3J5OyBzZWUgWzBdIGZvciB0aGUg
ZGVmaW5pdGlvbgo+IG9mIHRoZSBDSV9QUk9KRUNUX0RJUiB2YXJpYWJsZS4gTm90ZTogdW5saWtl
IHdoYXQgaXMgc2FpZCBpbiB0aGVyZSwgYW5kCj4gaW4gWzFdLCB0aGUgdmFsdWUgYWN0dWFsbHkg
c2VlbiBpbiBDSV9QUk9KRUNUX0RJUiBpcyBhbHJlYWR5IHByZWZpeGVkCj4gd2l0aCBDSV9CVUlM
RFNfRElSICh0aGUgZG9jdW1lbnRhdGlvbiBpcyB1bmNsZWFyIGFib3V0IHRoYXQgcG9pbnQpLgo+
IAo+IFswXSBodHRwczovL2RvY3MuZ2l0bGFiLmNvbS9lZS9jaS92YXJpYWJsZXMvcHJlZGVmaW5l
ZF92YXJpYWJsZXMuaHRtbAo+IFsxXSBodHRwczovL2RvY3MuZ2l0bGFiLmNvbS9ydW5uZXIvY29u
ZmlndXJhdGlvbi9hZHZhbmNlZC1jb25maWd1cmF0aW9uLmh0bWwjdGhlLXJ1bm5lcnMtc2VjdGlv
bgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKCj4g
Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+
Cj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkgPGFybm91dEBtaW5k
LmJlPgo+IENjOiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4gQ2M6IFRo
b21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gLS0tCj4gIHN1
cHBvcnQvbWlzYy9naXRsYWItY2kueW1sLmluIHwgMyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnlt
bC5pbiBiL3N1cHBvcnQvbWlzYy9naXRsYWItY2kueW1sLmluCj4gaW5kZXggOWMxZmFmMGQ1Zi4u
MzhhY2EzMWZiNSAxMDA2NDQKPiAtLS0gYS9zdXBwb3J0L21pc2MvZ2l0bGFiLWNpLnltbC5pbgo+
ICsrKyBiL3N1cHBvcnQvbWlzYy9naXRsYWItY2kueW1sLmluCj4gQEAgLTEsMyArMSw2IEBACj4g
K2JlZm9yZV9zY3JpcHQ6Cj4gKyAgLSBnaXQgY29uZmlnIC0tZ2xvYmFsIC0tYWRkIHNhZmUuZGly
ZWN0b3J5ICR7Q0lfUFJPSkVDVF9ESVJ9CgpOb3RlOiBJIGNoZWNrZWQgaWYgd2UgaGF2ZSB0aGUg
aXNzdWUgdXNpbmcgdGhlIHV0aWxzL2RvY2tlci1ydW4gZGlyZWN0bHksCmVuYWJsaW5nIHNhZmUu
ZGlyZWN0b3J5IGlzIG5vdCBuZWNlc3NhcnkuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKwo+
ICAuY2hlY2stY2hlY2stcGFja2FnZV9iYXNlOgo+ICAgICAgc2NyaXB0Ogo+ICAgICAgICAgIC0g
cHl0aG9uMyAtbSBweXRlc3QgLXYgdXRpbHMvY2hlY2twYWNrYWdlbGliLwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
