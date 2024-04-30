Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8421C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B626940179;
	Tue, 30 Apr 2024 21:43:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QPtUjTY_Mfv6; Tue, 30 Apr 2024 21:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B277941564
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B277941564;
	Tue, 30 Apr 2024 21:43:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F23911BF2CF
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9AD480C18
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3YQSb3HZjPAo for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:43:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D3F9382028
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D3F9382028
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D3F9382028
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:43:07 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-41a1d2a7b81so1448895e9.0
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 14:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714513386; x=1715118186;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fk0r4gLAXniB1010E8WIoUK1vQFIAtin/GKNzLwKXQw=;
 b=t0KJvcPJ8noujt3FavT+JoWR9RQOhvXb3FXJi/wU7DQZtVug5hLAE85EoeC1AsDpfW
 fSibFQN2wIaYCrTxiYsZKJA2x3vETUgA14CyEsItE/B51i2GLYJWqegqyKJqGIehqSvb
 nIt3s7GAHQj7rYgrc2fadjz+K49Mb0e6TvJfW16ZK7VpeJ2Lqam/GqKIRQDYwHOR6Zd1
 J12d1KPF5LkCE1NT1BxIlB1/ocTTmzzOJn+eBdoxPQWHwoILTmNo3T7fJNIIYWs7twXQ
 zWydEXasmRF7EuGFQ6h1MOrHjE73tP+5ehm91AIMd3KbkYCG8B6gH/osmYTm7hBLDmBd
 t8vg==
X-Gm-Message-State: AOJu0Ywzm+OFS4wBFAEZ+WJblpH0WpYjN37eWOI9S8pLr4OesbNqTlm6
 vuTzbkvnXOZSO28KFpdxnlsmcQUjus/bmzJW/LidJ+SmVx3CPKNDdo8dzV9+ZlfD4LKWxR7vAO1
 1
X-Google-Smtp-Source: AGHT+IHP0iY/SLAQ7L30YogqNgSXaKbTzt69nq28JbDI7YWqeGtssSvOZbXxWQhpbIzpNi8fwaSg5A==
X-Received: by 2002:a05:600c:3590:b0:41b:ed36:e055 with SMTP id
 p16-20020a05600c359000b0041bed36e055mr824254wmq.7.1714513383636; 
 Tue, 30 Apr 2024 14:43:03 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 x35-20020a05600c18a300b0041b61504565sm157924wmp.28.2024.04.30.14.43.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 14:43:03 -0700 (PDT)
Message-ID: <5f725496-6f72-43e1-901b-4b0e589645d7@smile.fr>
Date: Tue, 30 Apr 2024 23:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240424123809.406447-1-romain.naour@smile.fr>
 <20240424123809.406447-2-romain.naour@smile.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240424123809.406447-2-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714513386; x=1715118186;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fk0r4gLAXniB1010E8WIoUK1vQFIAtin/GKNzLwKXQw=;
 b=PGZPR+RODHcoLEP8iaCeHhD/zfZPrxXWylieHpk5e60a2d2yxnSRKD565v2Xyk9TTn
 aUf4txLwFBpdvzD1uDK4ZpVY7grGTeDlc0Hq5EMjurkDcFu0KYgr6ylRhml3DuERgzlo
 gyXUH1FpozkKOmonEFc869it+XhsyIOGScNKpmdeNITCGYjKceHbRWMvPUe6p8eRnWX0
 dVC73cFZYU8Cykq3BCrYa4KU66a0dq7Jw7os0QGR9NnsXgy2/wkp2WPbQLFOAJ7Rm5q3
 FhEB4q+lMMcwidJ6YwsTfKUGviGYX8ag7UggyzkOscaXISSE/w34Mk4RniyBO/oJOxDW
 9iZg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=PGZPR+RO
Subject: Re: [Buildroot] [PATCH 2/2] configs/qemu_ppc64*defconfig: add
 missing libelf dependency
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjQvMDQvMjAyNCDDoCAxNDozOCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gV2hpbGUg
YnVpbGRpbmcgdGhlIGtlcm5lbCB0b29scywgbGliZWxmIGhlYWRlciBpcyBtaXNzaW5nOgo+IAo+
IFsuLi5ddG9vbHMvb2JqdG9vbC9pbmNsdWRlL29ianRvb2wvZWxmLmg6MTA6MTA6IGZhdGFsIGVy
cm9yOiBnZWxmLmg6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKPiAgICAxMCB8ICNpbmNsdWRl
IDxnZWxmLmg+Cj4gCj4gU2VsZWN0IEJSMl9MSU5VWF9LRVJORUxfTkVFRFNfSE9TVF9MSUJFTEYg
dG8gYnVpbGQgaG9zdC1saWJlbGYuCj4gCj4gRml4ZXM6Cj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1
aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82NjY0NTg3MjkwIChxZW11X3BwYzY0bGVfcG93
ZXJudjhfZGVmY29uZmlnKQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxk
cm9vdC8tL2pvYnMvNjY1NTExOTk1MSAocWVtdV9wcGM2NGxlX3BzZXJpZXNfZGVmY29uZmlnKQo+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjY1NTEx
OTk0NiAocWVtdV9wcGM2NF9wc2VyaWVzX2RlZmNvbmZpZykKPiAKPiBTaWduZWQtb2ZmLWJ5OiBS
b21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPiAtLS0KPiAgY29uZmlncy9xZW11
X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnICAgIHwgMSArCj4gIGNvbmZpZ3MvcWVtdV9wcGM2NGxl
X3Bvd2VybnY4X2RlZmNvbmZpZyB8IDEgKwo+ICBjb25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVz
X2RlZmNvbmZpZyAgfCAxICsKPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAK
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9xZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnIGIvY29u
Zmlncy9xZW11X3BwYzY0X3BzZXJpZXNfZGVmY29uZmlnCj4gaW5kZXggOGM1OGZlYzI0Zi4uMzUw
MzgwNTc4YSAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25m
aWcKPiArKysgYi9jb25maWdzL3FlbXVfcHBjNjRfcHNlcmllc19kZWZjb25maWcKPiBAQCAtMjMs
NiArMjMsNyBAQCBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAgQlIyX0xJTlVY
X0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42LjE4Igo+ICBCUjJfTElOVVhfS0VSTkVM
X0RFRkNPTkZJRz0icHNlcmllcyIKPiAgQlIyX0xJTlVYX0tFUk5FTF9WTUxJTlVYPXkKPiArQlIy
X0xJTlVYX0tFUk5FTF9ORUVEU19IT1NUX0xJQkVMRj15Cj4gIAo+ICAjIGhvc3QtcWVtdSBmb3Ig
Z2l0bGFiIHRlc3RpbmcKPiAgQlIyX1BBQ0tBR0VfSE9TVF9RRU1VPXkKPiBkaWZmIC0tZ2l0IGEv
Y29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnIGIvY29uZmlncy9xZW11X3Bw
YzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCj4gaW5kZXggMjNhZDU3NzJjMi4uZmQ4OTM2YTFmYSAx
MDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKPiAr
KysgYi9jb25maWdzL3FlbXVfcHBjNjRsZV9wb3dlcm52OF9kZWZjb25maWcKPiBAQCAtMjMsNiAr
MjMsNyBAQCBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiAgQlIyX0xJTlVYX0tF
Uk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42LjE4Igo+ICBCUjJfTElOVVhfS0VSTkVMX0RF
RkNPTkZJRz0icG93ZXJudiIKPiAgQlIyX0xJTlVYX0tFUk5FTF9WTUxJTlVYPXkKPiArQlIyX0xJ
TlVYX0tFUk5FTF9ORUVEU19IT1NUX0xJQkVMRj15Cj4gIAo+ICAjIGhvc3QtcWVtdSBmb3IgZ2l0
bGFiIHRlc3RpbmcKPiAgQlIyX1BBQ0tBR0VfSE9TVF9RRU1VPXkKPiBkaWZmIC0tZ2l0IGEvY29u
Zmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcgYi9jb25maWdzL3FlbXVfcHBjNjRs
ZV9wc2VyaWVzX2RlZmNvbmZpZwo+IGluZGV4IDIwN2U1ZjViNDAuLmViYzNiN2E2ZmQgMTAwNjQ0
Cj4gLS0tIGEvY29uZmlncy9xZW11X3BwYzY0bGVfcHNlcmllc19kZWZjb25maWcKPiArKysgYi9j
b25maWdzL3FlbXVfcHBjNjRsZV9wc2VyaWVzX2RlZmNvbmZpZwo+IEBAIC0yMyw2ICsyMyw3IEBA
IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+ICBCUjJfTElOVVhfS0VSTkVMX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjYuMTgiCj4gIEJSMl9MSU5VWF9LRVJORUxfREVGQ09ORklH
PSJwc2VyaWVzX2xlIgo+ICBCUjJfTElOVVhfS0VSTkVMX1ZNTElOVVg9eQo+ICtCUjJfTElOVVhf
S0VSTkVMX05FRURTX0hPU1RfTElCRUxGPXkKPiAgCj4gICMgaG9zdC1xZW11IGZvciBnaXRsYWIg
dGVzdGluZwo+ICBCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQoKQXBwbGllZCB0byBtYXN0ZXIsIHRo
YW5rcy4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
