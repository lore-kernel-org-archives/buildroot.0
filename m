Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA74C433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Nov 2022 21:57:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D5BF822D0;
	Fri, 18 Nov 2022 21:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D5BF822D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BFUmoPKgkTxi; Fri, 18 Nov 2022 21:57:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C5C4822CD;
	Fri, 18 Nov 2022 21:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C5C4822CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 515941BF5E6
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 21:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2718441A35
 for <buildroot@lists.busybox.net>; Fri, 18 Nov 2022 21:56:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2718441A35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id utsod0DCXfh8 for <buildroot@lists.busybox.net>;
 Fri, 18 Nov 2022 21:56:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C79CB41A33
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C79CB41A33
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 21:56:57 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 136so6138852pga.1
 for <buildroot@buildroot.org>; Fri, 18 Nov 2022 13:56:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=how9ae7HbGZI0LhBJi3i5xxUQmKf6b1OWAxUrzDFk/I=;
 b=duJyEoFwaDKd4smqxT+9ExfEWOiXQ/kshE8pK3fDAjKN+fb7cXoKowY8h6zrepeZd+
 RG2lLxyNMfo/K2Xhl2DWb46xwxop80fePgQhrE+W605OPETJr9wk92BvXCZUX1ghLGtJ
 TFWQyc9Jz7JnMchqhTYl4Wtb5/ZTAEdnmmDc5ROmCKjdlWX8aAX4alUsmpzZ/DGClJmV
 oJJXolcDAQT3cgSPcy4jgyM202BPuR3LDt4iaQ+/rsceYNnNJQYP6R38Jm2mFPH7OgWm
 L1W0H33R72832U1l8LEdAxEfDVq+ZvsR58dylpFDNfGDJUSTVdZDFVOHf9nrG+HKUwtz
 4SbQ==
X-Gm-Message-State: ANoB5plSWzu6E/5A1BzITaX8hZtaIUWcPb1GALuayCL/SQtEyBENdXwe
 6p5rffNjnm3R905ooPRJf/E=
X-Google-Smtp-Source: AA0mqf773WshJztt0H3qMj51Biryx59WBk270oQg+S3YeJWKMNh+DsRlLiRkfvhz9zMCrnY2GdQYkQ==
X-Received: by 2002:aa7:8608:0:b0:52f:db84:81cf with SMTP id
 p8-20020aa78608000000b0052fdb8481cfmr9870504pfn.26.1668808616984; 
 Fri, 18 Nov 2022 13:56:56 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id
 kb6-20020a17090ae7c600b001fde655225fsm15031628pjb.2.2022.11.18.13.56.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 13:56:56 -0800 (PST)
Message-ID: <2226aa4a-b744-30ab-699c-c4316c314d4f@gmail.com>
Date: Fri, 18 Nov 2022 13:56:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220917211719.251791-1-fontaine.fabrice@gmail.com>
 <76b0ac3b-7bd4-f9f5-8191-7c39380dda64@gmail.com>
 <CAPi7W80x3ntmmr6xcKasos45siu5WpQzR9oiQB1VKsAf86OweA@mail.gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <CAPi7W80x3ntmmr6xcKasos45siu5WpQzR9oiQB1VKsAf86OweA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=how9ae7HbGZI0LhBJi3i5xxUQmKf6b1OWAxUrzDFk/I=;
 b=gj88PfQk1qMLG4V529IquFaBE63OprDas5ZSlMd3qIsA9xjyHRQ2BsHaKBfjhLpaDU
 OaAjvzOgTtiYAiv6qLXkrHtcnZg0a3DAZu3kGNuPv8daHNj4ROahwLCGvLmznVKJDNex
 ImCIfbxRNmKwN36vv8UwenKfwFTS3uesq+fZAQT8/5jsW2vpUdg6Qlpuk0A/zma0SDJb
 RXAav7NTgb9unpA7MWL5fd0Xcnq4k+61POgKrq+TNrXi6TzkxH2ywMqorJRXSyleBJ23
 ts0W+WFuA4t+bMWKvN0iUNTETZjzwg4NqQEeiVXwkRRbDAZib+pWJUeOjFN00X70jAIx
 j5RA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gj88PfQk
Subject: Re: [Buildroot] [PATCH 1/1] package/popt: bump to version 1.19
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Markus Mayer <markus.mayer@broadcom.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMTEvMTUvMjIgMjM6MjUsIEZhYnJpY2UgRm9udGFpbmUgd3JvdGU6Cj4gSGksCj4gCj4gTGXC
oG1lci4gMTYgbm92LiAyMDIyIMOgwqAwMDo0OCwgRmxvcmlhbiBGYWluZWxsaSA8Zi5mYWluZWxs
aUBnbWFpbC5jb20gCj4gPG1haWx0bzpmLmZhaW5lbGxpQGdtYWlsLmNvbT4+IGEgw6ljcml0wqA6
Cj4gCj4gICAgIEhpIEZhYnJpY2UsCj4gCj4gICAgIE9uIDkvMTcvMjIgMTQ6MTcsIEZhYnJpY2Ug
Rm9udGFpbmUgd3JvdGU6Cj4gICAgICA+IC0gRHJvcCBwYXRjaGVzIChhbHJlYWR5IGluIHZlcnNp
b24pIGFuZCBzbyBhdXRvcmVjb25mCj4gICAgICA+IC0gVXBkYXRlIGhhc2ggb2YgQ09QWUlORyAo
bGljZW5zZSBhZGp1c3RlZCB0byB1c2UgdGhlIG9yaWdpbmFsLAo+ICAgICBzdHJhaWdodAo+ICAg
ICAgPsKgIMKgIE1JVCB2YXJpYW50Ogo+ICAgICAgPgo+ICAgICBodHRwczovL2dpdGh1Yi5jb20v
cnBtLXNvZnR3YXJlLW1hbmFnZW1lbnQvcG9wdC9jb21taXQvZGNlYzg2ZGYzY2ZjOTZkM2RkM2Ez
ZTlmN2YxMDg2Yjc2OGQyZDg4ZiA8aHR0cHM6Ly9naXRodWIuY29tL3JwbS1zb2Z0d2FyZS1tYW5h
Z2VtZW50L3BvcHQvY29tbWl0L2RjZWM4NmRmM2NmYzk2ZDNkZDNhM2U5ZjdmMTA4NmI3NjhkMmQ4
OGY+KQo+ICAgICAgPgo+ICAgICAgPgo+ICAgICBodHRwczovL2dpdGh1Yi5jb20vcnBtLXNvZnR3
YXJlLW1hbmFnZW1lbnQvcG9wdC9jb21wYXJlL3BvcHQtMS4xOC1yZWxlYXNlLi4ucG9wdC0xLjE5
LXJlbGVhc2UgPGh0dHBzOi8vZ2l0aHViLmNvbS9ycG0tc29mdHdhcmUtbWFuYWdlbWVudC9wb3B0
L2NvbXBhcmUvcG9wdC0xLjE4LXJlbGVhc2UuLi5wb3B0LTEuMTktcmVsZWFzZT4KPiAgICAgID4K
PiAgICAgID4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmlj
ZUBnbWFpbC5jb20KPiAgICAgPG1haWx0bzpmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4+Cj4g
Cj4gICAgIFdlIHJlY2VudGx5IHVwZ3JhZGVkIGZyb20gYnVpbGRyb290IDIwMjIuMDggdG8gMjAy
Mi4xMS1yYzEgd2hpY2gKPiAgICAgY29udGFpbnMgdGhpcyBjaGFuZ2Ugb2YgeW91cnMgYW5kIHRo
aXMgY2F1c2VzIGdwdGZkaXNrJ3Mgc2dkaXNrIHRvIG5vdAo+ICAgICBiZSBhYmxlIHRvIG9wZW4g
dGhlIGRldmljZXMgcGFzc2VkIGFzIGFyZ3VtZW50LCBzdGVwcyB0byByZXByb2R1Y2UKPiAgICAg
d291bGQKPiAgICAgYmUgYXMgc2ltcGxlIGFzOgo+IAo+ICAgICAjIHNnZGlzayAtcCAvZGV2L3Nk
YQo+ICAgICBQcm9ibGVtIG9wZW5pbmfCoCBmb3IgcmVhZGluZyEgRXJyb3IgaXMgMi4KPiAgICAg
VGhlIHNwZWNpZmllZCBmaWxlIGRvZXMgbm90IGV4aXN0IQo+IAo+ICAgICBNYXJrdXMgbG9va2Vk
IGF0IHRoZSBzdHJhY2Ugb3V0cHV0IGFuZCBmb3VuZCB0aGUgZm9sbG93aW5nOgo+IAo+ICAgICBz
dHJhY2UgLWYgc2dkaXNrIC1wIC9kZXYvc2RhCj4gICAgIFsuLi5dCj4gICAgIGJyayhOVUxMKcKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgPSAweDU1ODFmNGQw
MDAKPiAgICAgYnJrKDB4NTU4MWY2ZTAwMCnCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoD0gMHg1NTgxZjZlMDAwCj4gICAgIGJyaygweDU1ODFmOGYwMDApwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqA9IDB4NTU4MWY4ZjAwMAo+ICAgICBvcGVuYXQoQVRfRkRDV0Qs
ICIiLCBPX1JET05MWSnCoCDCoCDCoCDCoCDCoCA9IC0xIEVOT0VOVCAoTm8gc3VjaCBmaWxlIG9y
Cj4gICAgIGRpcmVjdG9yeSkKPiAgICAgd3JpdGUoMiwgIlByb2JsZW0gb3BlbmluZyAiLCAxNlBy
b2JsZW0gb3BlbmluZyApwqAgwqAgwqAgwqAgPSAxNgo+ICAgICB3cml0ZSgyLCAiIGZvciByZWFk
aW5nISBFcnJvciBpcyAiLCAyMyBmb3IgcmVhZGluZyEgRXJyb3IgaXMgKSA9IDIzCj4gICAgIHdy
aXRlKDIsICIyIiwgMTIpwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgPSAxCj4g
ICAgIHdyaXRlKDIsICIuXG4iLCAyLgo+ICAgICApwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgPSAyCj4gICAgIHdyaXRlKDIsICJUaGUgc3BlY2lmaWVkIGZpbGUgZG9lcyBub3QgZXhp
cyIuLi4sIDM1VGhlIHNwZWNpZmllZCBmaWxlCj4gICAgIGRvZXMgbm90IGV4aXN0IQo+ICAgICAp
ID0gMzUKPiAgICAgZXhpdF9ncm91cCgyKcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgPSA/Cj4gICAgICsrKyBleGl0ZWQgd2l0aCAyICsrKwo+IAo+ICAgICB0aGUgb3Bl
bmF0KCkgc3lzdGVtIGNhbGwgaXMgcGFzc2VkIGFuIGVtcHR5IHN0cmluZyB3aGljaCBpcyB0aGUg
cmVhc29uCj4gICAgIGZvciBzZ2Rpc2sgdG8gZmFpbCBvcGVuaW5nIHRoZSBzcGVjaWZpZWQgZGV2
aWNlLiBSZXZlcnRpbmcgbGlicG9wdCBiYWNrCj4gICAgIHRvIDEuMTggYnV0IGtlZXBpbmcgZXZl
cnl0aGluZyBlbHNlIHRoZSBzYW1lIHJlc29sdmVzIHRoZSBpc3N1ZS4KPiAKPiAgICAgSXMgdGhp
cyBpcyBhIGtub3duIHByb2JsZW0/IFRoYW5rcyEKPiAKPiAKPiBZZXMsIHRoaXMgaXMgYSBrbm93
biBpc3N1ZSByYWlzZWQgYmVjYXVzZSB0aGUgdmFsdWUgcmV0dXJuZWQgYnkgCj4gcG9wdEdldEFy
ZygpIGRvZXNuJ3QgbGVhayBhbnltb3JlOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9ycG0tc29mdHdh
cmUtbWFuYWdlbWVudC9wb3B0L2lzc3Vlcy84MCAKPiA8aHR0cHM6Ly9naXRodWIuY29tL3JwbS1z
b2Z0d2FyZS1tYW5hZ2VtZW50L3BvcHQvaXNzdWVzLzgwPgo+IAo+IEknbGwgc2VuZCBhIHBhdGNo
IHRvIGFwcGx5IHRoZSBncHRmZGlzayBwYXJ0aWFsIGZpeCBtZW50aW9uZWQgYWJvdmUuCgpUaGFu
a3MgbXVjaCBhcHByZWNpYXRlZCEKLS0gCkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
