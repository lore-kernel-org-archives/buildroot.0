Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6292AC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15208821F9;
	Tue, 13 Feb 2024 21:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q2Sm7wKMw9nJ; Tue, 13 Feb 2024 21:35:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 234B6821FA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 234B6821FA;
	Tue, 13 Feb 2024 21:35:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 426221BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F9BC4070D
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:35:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 76PvuO8TJ25y for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:35:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8BB2D406FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB2D406FA
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BB2D406FA
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:35:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-411d253098eso4498675e9.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:35:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707860125; x=1708464925;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QiCeqYJjt7qQh1Tn7SIigb4/kyDJ80To++F6ko/ivME=;
 b=GsC/TyHfK4h1DFBxlWXROB/yhCGC5utLHYcD3QDyWKckq18YKenXkOg0hnyzmRi7DZ
 ZILtlqDHycJBCHT6ngJO/euNvv0oar2XRSLRc8CJ93csoQ6z823tQNkHVLQQ7gVznKYP
 FLsWHTR30uTvUNLekAu13YMX+BtC3DlHH6SD3plk5gpCasigdH/AvSx+LhRYsyyKJrlV
 NoqyEgieqNTAV9oxZ903rYJ7zjGv8bGMeUbDVu0kkyTr++FgOB7E+jauUNvYVseI5VRm
 unoErTJfTBqY4Jfe+kj/L7bO/8tlB440uHWpM1f7vIbz/tfL65TEfZ3IvH2NqFlYxwwU
 aW0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAA/Eu6/Pkdx8dv8yPz3odz97O1dUV+fx8qfh1qZAG7ffx51eaNagOOQOFzrjmmVUiNd5BNeTWc5MlBoXYg+gVetMw6xFdJg==
X-Gm-Message-State: AOJu0Yz6+I2yBObWtc2n/hie34scCYlEXDBFdQVKn+e0kP0Qpp7alJfm
 Y3CZR3EQo2UKDriAXB/yKEWGH7Qydaw7t/CjhRcO8NCCvKuNnjtYLtpqAh2bPaPwJf8xilwXocJ
 /
X-Google-Smtp-Source: AGHT+IECUGrLRtfCZnWYUIJ72EBk8t6GOOnPvs7AM9svstrynWl/x2903ohSWUdeaWh/4VdLeTdq4A==
X-Received: by 2002:a05:600c:49a2:b0:410:bb99:af83 with SMTP id
 h34-20020a05600c49a200b00410bb99af83mr620139wmp.23.1707860125009; 
 Tue, 13 Feb 2024 13:35:25 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKUjVejOeTxHc+vHrW+F71fCL+l5Gf1BKOFghf0U1SGVX23uNsq0syJ8VUgVwBIfsW8vDAdNv5GH6i+Ds9n7HqK01EyveT5DpR8AeUbaodsNjZDaDdxRs=
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a7bcb86000000b00410df4bf22esm6364564wmi.38.2024.02.13.13.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 13:35:24 -0800 (PST)
Message-ID: <7e3c7380-a550-4e54-b395-eb568e834a42@smile.fr>
Date: Tue, 13 Feb 2024 22:35:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, buildroot@buildroot.org
References: <20240213172817.2872849-1-romain.naour@smile.fr>
 <20240213172817.2872849-22-romain.naour@smile.fr>
 <f53ae1240335f3004bfe4cd116b7c9fe9853babd.camel@gmail.com>
Content-Language: fr, en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <f53ae1240335f3004bfe4cd116b7c9fe9853babd.camel@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707860125; x=1708464925;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QiCeqYJjt7qQh1Tn7SIigb4/kyDJ80To++F6ko/ivME=;
 b=OJ1Pk5Jie62UXx/DndURaPBBN5qpNx4B7KH3xSrUpEz223fdem//gK6/qUJxetAy5k
 PuLytRztAr4rjBO53rmE27iMsvLGIbB7YyVKIOftCzdmlvMPHB5kgu6hIj5Zj9+CII9a
 cOW8IvJ+6FYwYJwXIO6ixCuOH7WBwmL/7TbADgpwEsTcwfWWo330u+2xTd5Pn1TMNKhP
 +8mGTmg9z8PhDE292YBPnF77cZijnH+TrMDM1/5tcLunsR2mFkyv7CmIsNpdYSqySwnE
 8U+rG3A/iWlD/0lriV8ej8SGM9m38zVHN1UnZXJXMJbPIhikXSOx/qbJRGW3kEdRy+BS
 rmrw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OJ1Pk5Ji
Subject: Re: [Buildroot] [PATCH 21/21] boot/ti-k3-image-gen: remove package
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
Cc: Xuanhao Shi <X15000177@gmail.com>, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQWxleGFuZGVyLAoKTGUgMTMvMDIvMjAyNCDDoCAyMDowNSwgQWxleGFuZGVyIFN2ZXJkbGlu
IGEgw6ljcml0wqA6Cj4gSGkgUm9tYWluLAo+IAo+IE9uIFR1ZSwgMjAyNC0wMi0xMyBhdCAxODoy
OCArMDEwMCwgUm9tYWluIE5hb3VyIHdyb3RlOgo+PiB0aS1rMy1pbWFnZS1nZW4gdG9vbCBpcyBk
ZXByZWNhdGVkIGFuIHJlcGxhY2VkIGJ5IGJpbm1hbiBbMV0uCj4+Cj4+IEFsbCBkZWZjb25maWcg
dGhhdCB3YXMgdXNpbmcgaXQgaGF2ZSBiZWVuIHVwZGF0ZWQgdG8gdXNlIFUtYm9vdAo+PiBiaW5t
YW4gdG9vbCBpbnN0ZWFkLgo+Pgo+PiBTbywgd2UgY2FuIHNhZmVseSByZW1vdmUgdGktazMtaW1h
Z2UtZ2VuIHBhY2thZ2UuCj4+Cj4+IFsxXSBodHRwczovL2dpdC55b2N0b3Byb2plY3Qub3JnL21l
dGEtdGkvY29tbWl0Lz9pZD04MzU4MTFjZjg1ODY5MjZjZjc4YTk2MWQwOTBmNGU2MTUwNDMyMjM1
Cj4+Cj4+IENjOiBBbmFuZCBHYWRpeWFyIDxnYWRpeWFyQHRpLmNvbT4KPj4gQ2M6IFh1YW5oYW8g
U2hpIDxYMTUwMDAxNzdAZ21haWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIg
PHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4gLS0tCj4+IMKgQ29uZmlnLmluLmxlZ2FjecKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3ICsrCj4+
IMKgREVWRUxPUEVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyIC0KPj4gwqBib290L0NvbmZpZy5pbsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMSAtCj4+IMKg
Ym9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDgx
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IMKgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMt
aW1hZ2UtZ2VuLmhhc2ggfMKgIDMgLQo+PiDCoGJvb3QvdGktazMtaW1hZ2UtZ2VuL3RpLWszLWlt
YWdlLWdlbi5ta8KgwqAgfCA1NCAtLS0tLS0tLS0tLS0tLS0KPj4gwqA2IGZpbGVzIGNoYW5nZWQs
IDcgaW5zZXJ0aW9ucygrKSwgMTQxIGRlbGV0aW9ucygtKQo+PiDCoGRlbGV0ZSBtb2RlIDEwMDY0
NCBib290L3RpLWszLWltYWdlLWdlbi9Db25maWcuaW4KPj4gwqBkZWxldGUgbW9kZSAxMDA2NDQg
Ym9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLmhhc2gKPj4gwqBkZWxldGUgbW9k
ZSAxMDA2NDQgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rCj4+Cj4+IGRp
ZmYgLS1naXQgYS9Db25maWcuaW4ubGVnYWN5IGIvQ29uZmlnLmluLmxlZ2FjeQo+PiBpbmRleCBh
ODY5Mjc5YWY3Li4yYjU5YTY1ZjFjIDEwMDY0NAo+PiAtLS0gYS9Db25maWcuaW4ubGVnYWN5Cj4+
ICsrKyBiL0NvbmZpZy5pbi5sZWdhY3kKPj4gQEAgLTE0Niw2ICsxNDYsMTMgQEAgZW5kaWYKPj4g
wqAKPj4gwqBjb21tZW50ICJMZWdhY3kgb3B0aW9ucyByZW1vdmVkIGluIDIwMjQuMDIiCj4+IMKg
Cj4+ICtjb25maWcgQlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU4KPj4gKwlib29sICJ0aS1rMy1p
bWFnZS1nZW4gcmVtb3ZlZCIKPj4gKwlzZWxlY3QgQlIyX0xFR0FDWQo+PiArCWhlbHAKPj4gKwnC
oCB0aS1rMy1pbWFnZS1nZW4gdG9vbMKgIGhhcyBiZWVuIHJlbW92ZWQgYW5kIHJlcGxhY2VkIGJ5
Cj4+ICsJwqAgVS1Cb290IGJpbm1hbiB0b29sIChyZXF1aXJlcyBVLWJvb3QgPj0gMjAyNC4wMSku
Cj4gCj4gSXMgY29tbWl0IDZkNjIyOGFiOGZlNSAiYW02MmE6IGR0czogYmlubWFuOiBQYWNrYWdl
IHRpYm9vdDMuYmluLCB0aXNwbC5iaW4sIHUtYm9vdC5pbWciCj4gaW4gVS1Cb290IHJlcG8gbm90
IHdoYXQgaXMgYWN0dWFsbHkgcmVxdWlyZWQgKHNpbmNlIHYyMDIzLjEwKT8KPiBBdCBsZWFzdCB0
aGF0J3MgdGhlIHZlcnNpb24gd2hpY2ggd29ya3MgZm9yIG1lLgo+IAoKVGhhbmsgeW91IGZvciB0
aGUgaW5mbywgaW5kZWVkIHYyMDIzLjEwIHNob3VsZCBiZSBnb29kLWVub3VnaC4KCkkgd2FzIGxv
b2tpbmcgYXQgbWV0YS10aSBoaXN0b3J5IFsxXSBhbmQgSSB0aG91Z2h0IHRoYXQgdjIwMjQuMDEg
d2FzIHRoZSBtaW5pbXVtCnUtYm9vdCByZWxlYXNlIGZvciBjb21wbGV0ZSBiaW5tYW4gc3VwcG9y
dCBmb3IgYWxsIFRJIEszIFNvQyB2YXJpYW50LgoKSSdsbCBmaXghCgpbMV0KaHR0cHM6Ly9naXQu
eW9jdG9wcm9qZWN0Lm9yZy9tZXRhLXRpL2NvbW1pdC8/aWQ9NWI1YjhiOTMyNTYxZDc2YzVlZDUw
YTQyMTBhNzI2ZGY4NmM2NDliZgoKQmVzdCByZWdhcmRzLApSb21haW4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
