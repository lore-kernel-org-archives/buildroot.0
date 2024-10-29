Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC98D2AB11
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 09:56:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADAB360709;
	Tue, 29 Oct 2024 09:56:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FIJSC86UkyHs; Tue, 29 Oct 2024 09:56:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A634A606F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A634A606F3;
	Tue, 29 Oct 2024 09:56:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CF575E4E
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7871E60709
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 63Zu6U5jiiqj for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 09:56:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE0FF606F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE0FF606F3
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE0FF606F3
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 09:56:47 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-37d47b38336so3729566f8f.3
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 02:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730195805; x=1730800605;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D0dUWlXWdrUzRK2Fl2DYqH12ja5FrqLwdH8oN2U9syU=;
 b=CVCM1xoPKifL66eSX7VrPUxqOb1ivv85X0qJy1DttPeanL+xHHQsUTFLfDAXUD9oQ6
 YFVeVJS+BxOA9Z4QZM2+7zz7yklT9Ftroaq+syFUIouIETURYSyLgkHGiUSKAyfSv8S4
 8+emshiCkrY61yUeCmVnfvqeFnjacx+z12XVYyDOL/dxFijiC2TMj6TptvN2mZxB6ZLj
 Lg9eII10w8Lowzg9YtcyC9LrhfW8/iM+K4eAkte59bjeSIFQ4yO9KPxTaA/VXZQdpDGA
 cJOsnSId5mG7W//WcPbDxPmvU0wvn8P5ZQp/K457cUwYOVYEf18OFiMOjJSaQtc8WWVN
 zxeg==
X-Gm-Message-State: AOJu0Yz58OmvDBiBCtbSD7sHyh2EjTx5WvSdH5j1CEAhMOwM/qJ5JmRq
 E+5uT2YK+ie0Vj2D2fDbisFR5d5Yf1z/di9ns9tZV7tiajgx6Gp8E8AOeehZ7RQ=
X-Google-Smtp-Source: AGHT+IG1riY+CCB8fIR65QjWTh13I4Kt5CV4CgnIRK0EX/cqtLgibknD+ZtU3ZkAdMlPXG6l2290rA==
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id
 ffacd0b85a97d-3806113a07emr8201207f8f.13.1730195805285; 
 Tue, 29 Oct 2024 02:56:45 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b3bb4csm11974695f8f.33.2024.10.29.02.56.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2024 02:56:45 -0700 (PDT)
Message-ID: <a0addb27-54e4-4e13-b511-302eb40661af@smile.fr>
Date: Tue, 29 Oct 2024 10:56:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20241027194337.2444930-1-romain.naour@smile.fr>
 <20241027194337.2444930-2-romain.naour@smile.fr>
 <cefe2b8e2bcf392b1db0eddc3a38b2bc@free.fr> <20241028221254.37434add@windsurf>
Content-Language: fr, en-US
In-Reply-To: <20241028221254.37434add@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730195805; x=1730800605; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D0dUWlXWdrUzRK2Fl2DYqH12ja5FrqLwdH8oN2U9syU=;
 b=Rfi34ybE3T8RlWIhBtFJ+1DmF8kqPm3nHGIN6qUikJAeg8KkBxo49QEfTxf4MStsbJ
 eNLbPmk0yDslKw/3aPyBSsh7DLV5d+OcekreReZGnwP4KB3AtL3yEdEP0QEYOOWdCB53
 c9mTBRLnlKzBkCzAfzCFoZfqSI9H7kPN/BZqA=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Rfi34ybE
Subject: Re: [Buildroot] [PATCH v2 2/3] boot/edk2: bump to version
 edk2-stable202405
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

SGVsbG8gSnVsaWVuLCBUaG9tYXMsCgpMZSAyOC8xMC8yMDI0IMOgIDIyOjEyLCBUaG9tYXMgUGV0
YXp6b25pIGEgw6ljcml0wqA6Cj4gT24gTW9uLCAyOCBPY3QgMjAyNCAyMToyNzozMCArMDEwMAo+
IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+IAo+PiBPbiBteSBzaWRlICh0
aGlzIHNlcmllcyBhcHBsaWVkIG9uIHRvcCBvZiBicmFuY2ggbWFzdGVyIGF0IDgxZTc4MDYpLAo+
PiB0aGlzIHBhdGNoIGRvZXMgbm90IGFwcGx5LiBUaGlzIGNhbiBiZSByZXByb2R1Y2VkIHdpdGg6
Cj4+Cj4+ICAgICAgbWFrZSBxZW11X2FhcmNoNjRfc2JzYV9kZWZjb25maWcKPj4gICAgICBtYWtl
IGVkazItcGF0Y2gKPj4KPj4gV2hpY2ggZmFpbHMgd2l0aCBvdXRwdXQ6Cj4+Cj4+ICAgICAgQXBw
bHlpbmcgCj4+IDAwMDEtT3ZtZlBrZy1RZW11VmlkZW9EeGUtYWRkLWZlYXR1cmUtUENELXRvLXJl
bWFwLWZyYW1lYi5wYXRjaCB1c2luZyAKPj4gcGF0Y2g6Cj4gCj4gSSdkIHNheSB0aGVyZSdzIGEg
ZmFpcmx5IGhpZ2ggY2hhbmNlIHRoaXMgaXNuJ3QgUm9tYWluJ3MgZmF1bHQuIEkKPiBoYXZlbid0
IGNoZWNrZWQgYnV0IEkgd291bGQgZ3Vlc3MgdGhhdCB0aGlzIEVESzIgY29kZSBiYXNlIHVzZXMK
PiBET1Mtc3R5bGUgbmV3IGxpbmVzIChcclxuKSwgYW5kIHNvIHRoZSBwYXRjaGVzIGhhdmUgdGhv
c2UsIGJ1dCB0aGV5IGdldAo+IHN0cmlwcGVkIHdoZW4gZ29pbmcgdGhyb3VnaCB0aGUgbWFpbGlu
ZyBsaXN0LCBtYWtpbmcgdGhlIHBhdGNoCj4gdW5hcHBsaWNhYmxlLgoKSW5kZWVkLCB0aGlzIGlz
IG91ciB3ZWxsIGtub3duIGlzc3VlIHdpdGggdGhlIG1haWxpbmcgbGlzdAoKW1RoZSBjb3JyZWN0
IHBhdGNoIGZpbGVdCiQgZmlsZSBib290L2VkazIvMDAwMS1Pdm1mUGtnLVFlbXVWaWRlb0R4ZS1h
ZGQtZmVhdHVyZS1QQ0QtdG8tcmVtYXAtZnJhbWViLnBhdGNoCmJvb3QvZWRrMi8wMDAxLU92bWZQ
a2ctUWVtdVZpZGVvRHhlLWFkZC1mZWF0dXJlLVBDRC10by1yZW1hcC1mcmFtZWIucGF0Y2g6CnVu
aWZpZWQgZGlmZiBvdXRwdXQsIEFTQ0lJIHRleHQsIHdpdGggQ1JMRiwgTEYgbGluZSB0ZXJtaW5h
dG9ycwoKW1RoZSBjb3JydXB0ZWQgcGF0Y2ggZmlsZV0KJCBmaWxlIGJvb3QvZWRrMi8wMDAxLU92
bWZQa2ctUWVtdVZpZGVvRHhlLWFkZC1mZWF0dXJlLVBDRC10by1yZW1hcC1mcmFtZWIucGF0Y2gK
Ym9vdC9lZGsyLzAwMDEtT3ZtZlBrZy1RZW11VmlkZW9EeGUtYWRkLWZlYXR1cmUtUENELXRvLXJl
bWFwLWZyYW1lYi5wYXRjaDoKdW5pZmllZCBkaWZmIG91dHB1dCwgQVNDSUkgdGV4dAoKCgo+IAo+
PiBXaGVuIHdlIGJ1bXBpbmcgYm9vdC9lZGsyLCB3ZSB1c3VhbGx5IGFsc28gYnVtcCBlZGsyLW5v
bi1vc2kuCj4+IFNlZToKPj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRy
b290Ly0vYmxvYi9tYXN0ZXIvcGFja2FnZS9lZGsyLW5vbi1vc2kvZWRrMi1ub24tb3NpLm1rP3Jl
Zl90eXBlPWhlYWRzI0w3Cj4+Cj4+IEV2ZW4gaWYgaXQgaXMgbm90IG5lZWRlZCB0byBmaXggdGhl
IHFlbXVfYWFyY2g2NF9zYnNhX2RlZmNvbmZpZyBvZgo+PiB0aGlzIHNlcmllcywgaXQgd291bGQg
YmUgYmV0dGVyIHRvIGtlZXAgYWxsIHRob3NlIGNvbXBvbmVudHMgYWxpZ25lZC4KPj4KPj4gQ291
bGQgeW91IGNoZWNrIGlmIGVkazItbm9uLW9zaSBuZWVkcyB0byBiZSB1cGRhdGVkIHRvbz8KPj4g
SWYgeWVzLCBjb3VsZCB5b3UgdXBkYXRlIGl0Pwo+PiBJZiBubywgY291bGQgeW91IGFkZCBhIG1l
bnRpb24gdGhhdCBpdCBkb2VzIG5vdCBuZWVkIHRvPwo+Pgo+PiBNYXliZSB3ZSBjb3VsZCBhZGQg
YSBjb21tZW50IGluIGJvb3QvZWRrMi9lZGsyLm1rLCBiZWZvcmUgRURLMl9WRVJTSU9OLgo+PiBT
b21ldGhpbmcgbGlrZToKPj4KPj4gIyBXaGVuIHVwZGF0aW5nIHZlcnNpb24sIG1ha2Ugc3VyZSB0
byBhbHNvIHVwZGF0ZSB0aGUgZWRrMi1wbGF0Zm9ybXMKPj4gIyBhbmQgZWRrMi1ub24tb3NpIHBh
Y2thZ2VzIHRvIHRoZWlyIHJlc3BlY3RpdmUgY29tbWl0IElEIG5lYXJlc3QgdG8KPj4gIyB0aGUg
ZWRrMiByZWxlYXNlLgo+IAo+IEknbGwgbGV0IFJvbWFpbiBhZGRyZXNzIHRoaXMgcG9pbnQgYmVm
b3JlIGFwcGx5aW5nIHRoZW4uCgpUaGVyZSBpcyBubyBpbmZvcm1hdGlvbiBmcm9tIGVkazIgcmVs
ZWFzZXMgYWJvdXQgZWRrMi1ub24tb3NpIGFuZCBlZGsyLXBsYXRmb3JtcwpnaXQgaGFzaGVzIHRv
IHVzZS4gQXQgbGVhc3QgUWVtdSB0ZXN0c3VpdGUgZmlsZXMgY29udGFpbnMgdGhlIGhhc2ggdXNl
ZCBmb3IKdGhlaXIgdGVzdHMgWzFdLi4uCgpBY3R1YWxseSBJJ20gbm90IHN1cmUgaWYgZWRrMi1u
b24tb3NpIHBhY2thZ2UgaXMgcmVhbGx5IG5lZWRlZCBzaW5jZSBpdCBjb250YWlucwptb3N0bHkg
cHJlYnVpbHQgZmlybXdhcmVzLgoKbWV0YS1hcm0gZG9lc24ndCB1c2UgaXQ6CgpodHRwczovL2dp
dC55b2N0b3Byb2plY3Qub3JnL21ldGEtYXJtL3RyZWUvbWV0YS1hcm0vcmVjaXBlcy1ic3AvdWVm
aS9lZGsyLWZpcm13YXJlLmluYz9oPXNjYXJ0aGdhcCNuMTgKCkFjdHVhbGx5IHRoaXMgcGFja2Fn
ZSBpcyBvbmx5IG5lZWRlZCBmb3IgTWFydmVsbCBBcm1hZGEgWzJdCihTaWxpY29uL01hcnZlbGwv
QXJtYWRhN2s4ay9EZXZpY2VUcmVlKSB0aGF0IHdhcyBub3QgdXBkYXRlZCBzaW5jZSAyMDIxIGlu
CmVkazItbm9uLW9zaSByZXBvc2l0b3J5LgoKU28sIG5vIHVwZGF0ZSBpcyByZXF1aXJlZC4KClsx
XQpodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvMjRhN2NkNmE3
YzIxZjgyZjFjZTliZDVlY2Y2ZmI1NGViN2JmNDYwMgpbMl0KaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0Lzk1ZjcyZmI2MWFhZTZhNjRlYTgyMmI1MzVj
ZjlkMmMyZTAxZTZmYzkKCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAKPiBUaGFua3MhCj4gCj4g
VGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
