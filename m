Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B244E77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4949D82112;
	Wed,  4 Dec 2024 20:04:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Uwx0dEfiAkhD; Wed,  4 Dec 2024 20:04:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D7782129
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47D7782129;
	Wed,  4 Dec 2024 20:04:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECD7E1DD9
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:04:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDD13606E1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DSYzoMvMR5Dm for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:04:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74762605B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74762605B1
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74762605B1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:04:25 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so826864f8f.0
 for <buildroot@buildroot.org>; Wed, 04 Dec 2024 12:04:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733342664; x=1733947464;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0YLVRMWE9cUTldawpKeFFyS2ZKoUZu3tamEgo6nLGfE=;
 b=mfycFU9aqyf4DVnXZnGINqptA6pv9jcNksqPukKC93asyLJ03IBr8KRuMuD2x2TZrd
 UYVDRrEYYfxGqR69bnXbwuwT/eGbzXTW1WlPstxUKAlOqFBQo67lMSpeBZViBf7w24uT
 x/GKVyb68RD55iEteWZcU5AamxYwB4RZJ+TjkHSWaPlnNU7QiDzjKzJYUv5+s/sh9Qbn
 rrKP7ZLux5WNuQhLRUNHMnlX76h5U/W04Qfglx1gQxdEabbeilyTsPe64PtGt/0Neb7a
 VRTgfjFtLUEOk//Sg+WPT8zJ2ONNZz7OSFR078kYzt4cGUstn4Nhmy31L1N920tf7nQ3
 m/mQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtZvjUxc7t1liYLTh58cAAGvK63pTOCwitIIkOKjD2FTmOUz7F76NsEt2N9EmVFnLylYnfCtbIW84=@buildroot.org
X-Gm-Message-State: AOJu0YxvNqEQZ5Yu0aggsH+j7YaeKUHWvzhzTlun7xzZHrVseDPvNnHL
 f9U9yZ6G/8u3YBnGE1VrCdWnjiC2a8bmHhzXPc+CcwwRQkHov7/9ysvia9ZyixA=
X-Gm-Gg: ASbGnctRmb6fskiV6Z46x6ElC9kaYQOb/tVApEiBsgaKM0CBoGikpA+8NJC87Uq7a43
 lygxmuuOtr9xr3CzommYuVuF0uofDWtUFrT2OwyWCzKLctK9VRw6oS3cfSX56dwct+lwUBLg9tG
 2VXTGT7zx7ZYT1Ln+k6YBfiUKp8pDrKxSM15SmCkeqIH1xauEJ4iwmTfw1nd28/YTFQYLFPq/SS
 j+K2R4vqnkrYxbylb3vSuaOrwN5N0l/2H9duqalOsc4K2U6ZzBfNwNf86h507uLVLZSX6aNURCa
 OVoCnrFdE2Kb5LOhZ46te7TvaxUxukG6bVvAbHD5tJS7D/FGG2KLJSQAaAF9qjtleZUahEOreXf
 7XcM5
X-Google-Smtp-Source: AGHT+IFgq0p22hDq/Gw/v9bew9wBVFGavLvhD6RkpwFS773u5HtyeTRZfS69PaOMMmFup09dkOAUnA==
X-Received: by 2002:a5d:64a1:0:b0:385:fb8d:865c with SMTP id
 ffacd0b85a97d-3861bb7b96cmr420177f8f.12.1733342664110; 
 Wed, 04 Dec 2024 12:04:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd3a522sm19062750f8f.52.2024.12.04.12.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 12:04:23 -0800 (PST)
Message-ID: <0f55a317-5146-4397-926f-8964842cca3e@mind.be>
Date: Wed, 4 Dec 2024 21:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241023-microblaze-v1-1-7ad68e2f271c@gmx.net>
Content-Language: en-GB
In-Reply-To: <20241023-microblaze-v1-1-7ad68e2f271c@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733342664; x=1733947464; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0YLVRMWE9cUTldawpKeFFyS2ZKoUZu3tamEgo6nLGfE=;
 b=KS0pRd7TEAjlywXeTOG7vEVtc6bo8ZaPbDDuaCIyAeoipmpS8jSYlkYXivJFR0TENo
 yKTmMI6c3piufHf/LNiXUWoiM+8IKaADdwwkHA9K7QtkVf1KrYZUFrF4tzuBQ1dNdJBs
 cB3/ZgwEjtT1OWIWsrlyDopPfkk5watl6qdavfOk0qn06m9FSXv2jVULPaZAS9nJuyyq
 IUEDwZNzY9Rjfas5hj7aRmmUmpv77Ju7Pd51Bbrrq47CItnoYh+GCU8C8+ockj6JcPiI
 k+VkG7iluAFGUhb1BN2sce2KgFBI8bYclOmbFOthduulOSgr1Dq/kZmJWAuv+TixJ6w5
 5rhg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KS0pRd7T
Subject: Re: [Buildroot] [PATCH] package/musl: Fix -ztext build failures on
 microblaze
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8xMC8yMDI0IDIzOjQzLCBKLiBOZXVzY2jDpGZlciB2aWEgYnVpbGRyb290IHdyb3Rl
Ogo+IFRoZSBwYXJ0aWN1bGFyIGNvbWJpbmF0aW9uIG9mIExWTTIgKHdoaWNoIGVuYWJsZXMgLVBJ
RSksIG11c2wtbGliYyB3aXRoCj4gZHluYW1pYyBsaW5raW5nIChhbmQgdGh1cyAtenRleHQsIGJh
bm5pbmcgVEVYVFJFTHMpLCBhbmQgbWljcm9ibGF6ZQo+IGxlYWRzIHRvIGFuIGVycm9yIGJlY2F1
c2UgYSBURVhUUkVMIGlzIHByb2R1Y2VkIGluIG11c2wtbGliYydzIFNjcnQxLm8uCj4gCj4gVGhl
IHVwc3RyZWFtIHBhdGNoIGFkZGVkIGluIHRoaXMgY29tbWl0IGZpeGVzIChvciB3b3JrcyBhcm91
bmQpIHRoZQo+IHByb2JsZW0uCj4gCj4gRml4ZXM6IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290
Lm5ldC9yZXN1bHRzLzViYjI4M2VmZjRiNGEyYjE3ZDEwMjhiYmUwYjNlMWJlYThmYmViYTgvCj4g
U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCiAg
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gLS0tCj4g
ICAuLi52aXNpYmlsaXR5LWZvci1DLWVudHJ5LXBvaW50LWZ1bmN0aW9uLV9zdC5wYXRjaCB8IDQy
ICsrKysrKysrKysrKysrKysrKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA0MiBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbXVzbC8wMDAzLXVzZS1oaWRkZW4tdmlzaWJp
bGl0eS1mb3ItQy1lbnRyeS1wb2ludC1mdW5jdGlvbi1fc3QucGF0Y2ggYi9wYWNrYWdlL211c2wv
MDAwMy11c2UtaGlkZGVuLXZpc2liaWxpdHktZm9yLUMtZW50cnktcG9pbnQtZnVuY3Rpb24tX3N0
LnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwLi5jM2Y0ZjFkZWYwNTAwMjAwZTdmNjE2YzU2Y2M0MTgzZDZi
MTQ0MGY4Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbXVzbC8wMDAzLXVzZS1oaWRk
ZW4tdmlzaWJpbGl0eS1mb3ItQy1lbnRyeS1wb2ludC1mdW5jdGlvbi1fc3QucGF0Y2gKPiBAQCAt
MCwwICsxLDQyIEBACj4gK0Zyb20gOWM3ODU1N2FmMGE1ZTUyMWNkYjQ2YTRjYTc2MzBmMjk4N2Qy
NTIzZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiArRnJvbTogUmljaCBGZWxrZXIgPGRhbGlh
c0BhZXJpZmFsLmN4Pgo+ICtEYXRlOiBTYXQsIDEwIEF1ZyAyMDI0IDE5OjQ5OjI0IC0wNDAwCj4g
K1N1YmplY3Q6IFtQQVRDSF0gdXNlIGhpZGRlbiB2aXNpYmlsaXR5IGZvciBDIGVudHJ5IHBvaW50
IGZ1bmN0aW9uIF9zdGFydF9jCj4gKwo+ICt0aGUgZmlsZS1sZXZlbCBjcnRfYXJjaC5oIGFzbSBm
cmFnbWVudHMgZ2VuZXJhbGx5IG1ha2UgZGlyZWN0Cj4gKyhub24tUExUKSBjYWxscyBmcm9tIF9z
dGFydCB0byBfc3RhcnRfYywgd2hpY2ggaXMgb25seSB2YWxpZCB3aGVuCj4gK3RoZXJlIGlzIGEg
bG9jYWwsIG5vbi1pbnRlcnBvc2FibGUgZGVmaW5pdGlvbiBmb3IgX3N0YXJ0X2MuIGdlbmVyYWxs
eSwKPiArdGhlIGxpbmtlciBpcyBleHBlY3RlZCB0byBrbm93IHRoYXQgbG9jYWwgZGVmaW5pdGlv
bnMgaW4gYSBtYWluCj4gK2V4ZWN1dGFibGUgKGFzIG9wcG9zZWQgdG8gc2hhcmVkIGxpYnJhcnkp
IG91dHB1dCBhcmUgbm9uLWludGVycG9zYWJsZSwKPiArbWFraW5nIHRoaXMgd29yaywgYnV0IGhp
c3RvcmljYWxseSB0aGVyZSBoYXZlIGJlZW4gbGlua2VyIGJ1Z3MgaW4gdGhpcwo+ICthcmVhLCBh
bmQgbWljcm9ibGF6ZSBpcyByZXBvcnRlZGx5IHN0aWxsIGJyb2tlbiwgZmxhZ2dpbmcgdGhlCj4g
K3JlbG9jYXRpb24gZm9yIHRoZSBjYWxsIGFzIGEgdGV4dHJlbC4KPiArCj4gK3RoZSBlcXVpdmFs
ZW50IF9kbHN0YXJ0X2MsIGNhbGxlZCBmcm9tIHRoZSBzYW1lIGNydF9hcmNoLmggYXNtCj4gK2Zy
YWdtZW50cywgaGFzIGFsd2F5cyB1c2VkIGhpZGRlbiB2aXNpYmlsaXR5IHdpdGhvdXQgcHJvYmxl
bSwgYW5kCj4gK3NlbWFudGljYWxseSBpdCBzaG91bGQgYmUgaGlkZGVuLCBzbyBtYWtlIGl0IGhp
ZGRlbi4gdGhpcyBlbnN1cmVzIHRoZQo+ICtkaXJlY3QgY2FsbCBpcyBhbHdheXMgdmFsaWQgcmVn
YXJkbGVzcyBvZiB3aGV0aGVyIHRoZSBsaW5rZXIgcHJvcGVybHkKPiArc3BlY2lhbC1jYXNlcyBt
YWluIGV4ZWN1dGFibGUgb3V0cHV0Lgo+ICsKPiArVXBzdHJlYW06IGh0dHBzOi8vZ2l0Lm11c2wt
bGliYy5vcmcvY2dpdC9tdXNsL2NvbW1pdC8/aWQ9OWM3ODU1N2FmMGE1ZTUyMWNkYjQ2YTRjYTc2
MzBmMjk4N2QyNTIzZQo+ICtTaWduZWQtb2ZmLWJ5OiBKLiBOZXVzY2jDpGZlciA8ai5uZXVzY2hh
ZWZlckBnbXgubmV0Pgo+ICstLS0KPiArIGNydC9jcnQxLmMgfCAyICstCj4gKyAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiArCj4gK2RpZmYgLS1naXQgYS9j
cnQvY3J0MS5jIGIvY3J0L2NydDEuYwo+ICtpbmRleCA4ZmU4YWI1ZC4uMTA2MDEyMTUgMTAwNjQ0
Cj4gKy0tLSBhL2NydC9jcnQxLmMKPiArKysrIGIvY3J0L2NydDEuYwo+ICtAQCAtMTEsNyArMTEs
NyBAQCB3ZWFrIHZvaWQgX2ZpbmkoKTsKPiArIGludCBfX2xpYmNfc3RhcnRfbWFpbihpbnQgKCop
KCksIGludCwgY2hhciAqKiwKPiArIAl2b2lkICgqKSgpLCB2b2lkKCopKCksIHZvaWQoKikoKSk7
Cj4gKwo+ICstdm9pZCBfc3RhcnRfYyhsb25nICpwKQo+ICsraGlkZGVuIHZvaWQgX3N0YXJ0X2Mo
bG9uZyAqcCkKPiArIHsKPiArIAlpbnQgYXJnYyA9IHBbMF07Cj4gKyAJY2hhciAqKmFyZ3YgPSAo
dm9pZCAqKShwKzEpOwo+ICstLQo+ICsyLjQ1LjIKPiArCj4gCj4gLS0tCj4gYmFzZS1jb21taXQ6
IDRhOWE0YzNjZDVmNDE2YjQ0YjhhYjZjM2M3Y2RmYzNjYzk5MWE1ZGUKPiBjaGFuZ2UtaWQ6IDIw
MjQxMDIzLW1pY3JvYmxhemUtMDI4ZjAxNWIyZWQ0Cj4gCj4gQmVzdCByZWdhcmRzLAo+IC0tCj4g
Si4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
