Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF99C369C2
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 08:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7017960C2C;
	Tue, 22 Apr 2025 08:12:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fx9Ri8qQ1IdW; Tue, 22 Apr 2025 08:12:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E94260908
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E94260908;
	Tue, 22 Apr 2025 08:12:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9188B1BC
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:12:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6FB9D403A4
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Czt6yXSzhKCf for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 08:12:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 695964028B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 695964028B
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 695964028B
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 08:12:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43cf3192f3bso48066065e9.1
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 01:12:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745309573; x=1745914373;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5vKHWVaqFnyJ5xTtY3q0tUcrZjZqI0yaO75s0GY/p94=;
 b=X8OOZfAxTta4dUKOabNL/jRSLvdXpR92pDJnEIutdpDLQc40IOBAlcCHd8awy4SlWh
 KXBZxKtLa0ycPGYZYl1MNNdAeLZBUU1l/Xn1KLeUO7seOnk9LyZlq0cZ0Q5sjFc7Rj1p
 Eh3Q4uf1Z907w2vcskKsRuY9vxyJqaF+AN56OXPg3oB0oM4YT8AeXQzaZkW2bBC+6sWD
 Rvkhvqj67+SfhkChPhWehl8WzeO09vN4on2DmaMIehn34pgH8yoDDZZIA/AAgzKiD5IB
 G263NMSW82SXQAlkojzq+h8cJyeucSOIfMtmBGDmZ4Blwufo8kpOG/DMuwG44i9cM/Ww
 X58A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpGpOG3GcINdRqP8NcRTN/lXXrBOnB3amRbWieRlukj4nk1heuhSE57yycfeMcOZ6roaWYr8sBKeE=@buildroot.org
X-Gm-Message-State: AOJu0Yx4UCAQS5D2teX36/oIF68slB9B3NRaI786X5WJAwhwta73xkS+
 9W0+YAPL+mhKxAG9tyM6zyOfSeyURji0PbtGdn5GYPAXBk/BDuhCGGLYDEgz2b4=
X-Gm-Gg: ASbGnct7sae+4WUgUcehJAOBQ5vPA8dbS7P/ZjGXJkaigZlboIGetAnu9OuMICaDvWq
 mMj7/vh2FoXlhY9t2Cq0+EN0G/zAczrYpWulRvNh1Ne1mrD5JXbsEc+/ucuziBZnFhpiAj8QLcQ
 VS0+vgwN+3VW6z2wUEK590JCVsWtyutfhry8ykesoiYOYyxYqxeKR2xfOyHJjsUapc/Mo5abE8x
 yznsECWNNU2SuWWEf2/vWKZnt2ND4ZIkqWQ1pSxZDoBiGAPgnJsX5SIgX+yX/KVtbEjyZbbViP9
 dF5PV0eCL+Yx9r3Xxtsh6Ph9XkYu/30rsENnKkbBMOptW5W8LHIsUGE/v2+BHwtMStBZQ1SaNTu
 zkgM533joQ5H2/FqsG0grYJuwNLce8p8=
X-Google-Smtp-Source: AGHT+IElwh8oERtOFfeen/zL602wFe8aIsnL9HpTnhrED7zc2BAeOjiX7fjemh8C9BIwGEDG+PnqgQ==
X-Received: by 2002:a05:600c:5007:b0:43c:fad6:fa5a with SMTP id
 5b1f17b1804b1-4407fddd950mr59717075e9.24.1745309573315; 
 Tue, 22 Apr 2025 01:12:53 -0700 (PDT)
Received: from [10.5.90.83]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4406d5acd08sm165011165e9.12.2025.04.22.01.12.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Apr 2025 01:12:53 -0700 (PDT)
Message-ID: <0366b195-9993-47b6-abed-48423bdbccba@smile.fr>
Date: Tue, 22 Apr 2025 10:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret
 <david.pierret@smile.fr>, Danilo Bargen <mail@dbrgn.ch>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 James Hilliard <james.hilliard1@gmail.com>, Sam Voss <sam.voss@gmail.com>,
 Torben Voltmer <mail@t-voltmer.net>, Saeed Kazemi <kazemi.ms@gmail.com>,
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
References: <20250403141538.3769560-1-elmehdi.younes@smile.fr>
 <c45fa3cd-ebc5-4991-8af3-a57b1ae587cd@gmx.de>
Content-Language: en-US
In-Reply-To: <c45fa3cd-ebc5-4991-8af3-a57b1ae587cd@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1745309573; x=1745914373; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5vKHWVaqFnyJ5xTtY3q0tUcrZjZqI0yaO75s0GY/p94=;
 b=xH4tODgxiznLr3Z8VT/VQTOOevbJE4np0Vtu4IcPXga2+PQ8dHimyHa4KNH3iR3IOn
 L46zGXGkr+wXmBxoYpMSQTwknWQxQpMNQ8j9TexElEqKwX+/fDW6+C4glKIFkOfH3UU1
 bLfnWv7cPwDMi70wmGt7YxlqOya+PLYG8HQl4=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=xH4tODgx
Subject: Re: [Buildroot] 
 =?utf-8?q?=5BPATCH_1/4=5D_package/rust=3A_fix_bootst?=
 =?utf-8?q?rap_with_Rust=E2=89=A51=2E83?=
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRmlvbmEsIGhlbGxvIGFsbCwKCgpUaGFua3MgYSBsb3QgZm9yIHRoZSBmZWVkYmFjayBh
bmQgdGVzdGluZyEKCgpGb2xsb3dpbmcgRmlvbmEncyBjb21tZW50IHJlZ2FyZGluZyB0aGUgb3V0
ZGF0ZWQgaGFzaGVzLCBJJ3ZlIHNlbnQgYSBuZXcgCnBhdGNoIHNlcmllcyB0aGF0IGluY2x1ZGVz
Cgp0aGUgbmVjZXNzYXJ5IHVwZGF0ZXMuCgoKSW4gdGhpcyBuZXcgc2VyaWVzLCBJIGFsc28gYnVt
cGVkIHJ1c3QgdG8gKip2ZXJzaW9uIDEuODYuMCoqIGluc3RlYWQgb2YgCjEuODUuMSBhcyBpbml0
aWFsbHkgcHJvcG9zZWQsIHRvIHN0YXkgYWxpZ25lZCB3aXRoIHRoZSBsYXRlc3Qgc3RhYmxlIApy
ZWxlYXNlLgoKClRoZSBwYXRjaCBzZXJpZXMgc3ViamVjdCBpcyBub3cgOgoKcGFja2FnZS9ydXN0
OiBydXN0IHVwZ3JhZGUgdG8gdmVyc2lvbiAxLjg2LjAKCmh0dHA6Ly9wYXRjaHdvcmsub3psYWJz
Lm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9NDUzNjUxCgoKVGhhbmtzIGFnYWlu
IGZvciB5b3VyIHRpbWUgYW5kIHJldmlld3MhCgoKQmVzdCByZWdhcmRzLAoKRWwgTWVoZGkgWU9V
TkVTCgpMZSAxNC8wNC8yMDI1IMOgIDE3OjA4LCBGaW9uYSBLbHV0ZSBhIMOpY3JpdMKgOgo+IEFt
IDAzLjA0LjI1IHVtIDE2OjE1IHNjaHJpZWIgRWwgTWVoZGkgWU9VTkVTIHZpYSBidWlsZHJvb3Q6
Cj4+IFJ1c3QgaW5jbHVkZXMgYW4gb3B0aW9uIGBkb3dubG9hZC1jaS1sbHZtYCBpbiBjb25maWcu
dG9tbCB0aGF0IGVuYWJsZXMKPj4gZG93bmxvYWRpbmcgcHJlYnVpbHQgTExWTSBiaW5hcmllcyBm
cm9tIFJ1c3QncyBDSSBpbmZyYXN0cnVjdHVyZSBpbnN0ZWFkCj4+IG9mIGJ1aWxkaW5nIExMVk0g
ZnJvbSBzb3VyY2UuIFRoaXMgb3B0aW9uIGhlbHBzIHNwZWVkIHVwIHRoZSBib290c3RyYXAKPj4g
cHJvY2VzcyBhbmQgaXMgZW5hYmxlZCBieSBkZWZhdWx0IHN0YXJ0aW5nIGZyb20gUnVzdCAxLjgz
Lgo+Pgo+PiBIb3dldmVyLCBzdGFydGluZyBmcm9tIGNvbW1pdCBbMV0gdGhlIGJvb3RzdHJhcCBw
cm9jZXNzIHBlcmZvcm1zCj4+IGEgc3RyaWN0IGNoZWNrIHZpYSB0aGUgZnVuY3Rpb24KPj4gY2hl
Y2tfaW5jb21wYXRpYmxlX29wdGlvbnNfZm9yX2NpX2xsdm0oKS4KPj4KPj4gVGhpcyB2YWxpZGF0
aW9uLCBpbXBsZW1lbnRlZCBpbiB0aGUgZnVuY3Rpb24KPj4gY2hlY2tfaW5jb21wYXRpYmxlX29w
dGlvbnNfZm9yX2NpX2xsdm0oKSwgY2hlY2tzIGZvciBhbnkgaW5jb21wYXRpYmxlCj4+IGN1c3Rv
bSBvcHRpb25zIHN1Y2ggYXMgYGxsdm0ubGRmbGFnc2AsIGBsbHZtLmNmbGFnc2AsIGB0YXJnZXRz
YCwgZXRjLgo+Pgo+PiBJZiBhbnkgb2YgdGhlc2UgYXJlIHNldCBsb2NhbGx5IGFuZCBkaWZmZXIg
ZnJvbSB0aGUgdmFsdWVzIHVzZWQgdG8gYnVpbGQKPj4gdGhlIENJLXByb3ZpZGVkIExMVk0sIHRo
ZSBidWlsZCBmYWlscyBpbW1lZGlhdGVseSB3aXRoIHRoZSBlcnJvcjoKPj4KPj4gwqDCoCBFUlJP
UjogU2V0dGluZyBgbGx2bS5sZGZsYWdzYCBpcyBpbmNvbXBhdGlibGUgd2l0aAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgYGxsdm0uZG93bmxvYWQtY2ktbGx2bWAuCj4+Cj4+IEJ1aWxkcm9vdCBleHBs
aWNpdGx5IHNldHMgYGxsdm0ubGRmbGFnc2AgaW4gcnVzdC5tayB0byBlbnN1cmUgcHJvcGVyCj4+
IGhvc3QgbGlua2luZyBkdXJpbmcgdGhlIGJ1aWxkIG9mIGhvc3QtcnVzdC4gUmVtb3ZpbmcgdGhp
cyBzZXR0aW5nIG1heQo+PiBpbnRyb2R1Y2UgcG9ydGFiaWxpdHkgb3IgcmVsaWFiaWxpdHkgaXNz
dWVzIGFjcm9zcyB0b29sY2hhaW5zLgo+Pgo+PiBUbyBhZGRyZXNzIHRoZSBpc3N1ZSB3aXRob3V0
IGNvbXByb21pc2luZyB0aGUgYnVpbGQgZW52aXJvbm1lbnQsIHRoaXMKPj4gcGF0Y2ggZGlzYWJs
ZXMgdGhlIHVzZSBvZiBDSS1wcm92aWRlZCBMTFZNIGJ5IHNldHRpbmc6Cj4+Cj4+IMKgwqAgW2xs
dm1dCj4+IMKgwqAgZG93bmxvYWQtY2ktbGx2bSA9IGZhbHNlCj4+Cj4+IFRoaXMgZm9sbG93cyB0
aGUgcmVjb21tZW5kYXRpb24gZnJvbSB0aGUgUnVzdCBib290c3RyYXAgc2NyaXB0IGl0c2VsZi4K
Pj4KPj4gTm90ZTogdGhpcyBpcyBhIHRlbXBvcmFyeSB3b3JrYXJvdW5kIHRvIHJlc3RvcmUgY29t
cGF0aWJpbGl0eSB3aXRoIFJ1c3QKPj4g4omlMS44My4gT3RoZXIgc29sdXRpb25zIHdpbGwgYmUg
aW52ZXN0aWdhdGVkIHRvIGF2b2lkIGRpc2FibGluZyB0aGUgdXNlCj4+IG9mIHByZWJ1aWx0IExM
Vk0gaW4gdGhlIGZ1dHVyZSwgd2hpbGUgcHJlc2VydmluZyBCdWlsZHJvb3TigJlzIAo+PiByZXBy
b2R1Y2libGUKPj4gYnVpbGQgc2V0dXAuCj4+Cj4+IFsxXSAKPj4gaHR0cHM6Ly9naXRodWIuY29t
L3J1c3QtbGFuZy9ydXN0L2NvbW1pdC85ZGY3NjgwZWNmNjk4YmY3MDg3NjE2YjU5NTc3NGVlMTAy
M2QzYzdiCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEVsIE1laGRpIFlPVU5FUyA8ZWxtZWhkaS55b3Vu
ZXNAc21pbGUuZnI+Cj4KPiBUZXN0ZWQgd2l0aCBhYXJjaDY0L211c2wgYnVpbGQuIFBhdGNoIDMg
KCJwYWNrYWdlOiB1cGRhdGUgYWxsIGhhc2hlcwo+IGFmdGVyIGNhcmdvMyBzd2l0Y2giKSBkb2Vz
bid0IGFwcGx5IGNsZWFubHkgb24gY3VycmVudCBtYXN0ZXIgYmVjYXVzZQo+IHBhY2thZ2UvcHl0
aG9uLW1hdHVyaW4gYW5kIHBhY2thZ2Uva21vbiBoYXZlIGJlZW4gdXBkYXRlZCBzaW5jZSB0aGlz
Cj4gc2VyaWVzIHdhcyBzZW50LCBJIGZpeGVkIHRoYXQgbG9jYWxseS4gV2l0aCB0aGF0IGNhdmVh
dAo+Cj4gVGVzdGVkLWJ5OiBGaW9uYSBLbHV0ZSA8ZmlvbmEua2x1dGVAZ214LmRlPgo+Cj4gZm9y
IHRoZSBzZXJpZXMuCj4KPiBUaGFua3MsCj4gRmlvbmEKPgo+PiAtLS0KPj4gwqAgcGFja2FnZS9y
dXN0L3J1c3QubWsgfCAxICsKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+
Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3J1c3QvcnVzdC5tayBiL3BhY2thZ2UvcnVzdC9ydXN0
Lm1rCj4+IGluZGV4IDI5YzAzNTk0ZDIuLjY0ODFlNDA1NjEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2th
Z2UvcnVzdC9ydXN0Lm1rCj4+ICsrKyBiL3BhY2thZ2UvcnVzdC9ydXN0Lm1rCj4+IEBAIC00OCw2
ICs0OCw3IEBAIGRlZmluZSBIT1NUX1JVU1RfQ09ORklHVVJFX0NNRFMKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGVjaG8gJ1t0YXJnZXQuJChSVVNUQ19UQVJHRVRfTkFNRSldJzsgXAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZWNobyAnY2MgPSAiJChUQVJHRVRfQ1JPU1MpZ2NjIic7IFwKPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGVjaG8gJ1tsbHZtXSc7IFwKPj4gK8KgwqDCoMKgwqDCoMKgIGVjaG8gJ2Rv
d25sb2FkLWNpLWxsdm0gPSBmYWxzZSc7IFwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGVjaG8gJ25p
bmphID0gZmFsc2UnOyBcCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBlY2hvICdsZGZsYWdzID0gIiQo
SE9TVF9MREZMQUdTKSInOyBcCj4+IMKgwqDCoMKgwqAgKSA+ICQoQEQpL2NvbmZpZy50b21sCj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
