Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53797CDB47F
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 12:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C419A81F67;
	Wed, 24 Jun 2026 12:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mJU-m8k1f5r; Wed, 24 Jun 2026 12:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08FDD81F60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782304326;
	bh=IT11oHsEeegHMxq0GUccHbxEDFJYnRVilq6vjTfLrWE=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S13kasvMVSu+hx97tQ+MM2vQBW50vyVIOFsYVM71yUCkoCJWaeifVM/8aqgbsDLGb
	 xOOdS5oAXBVllmIBU+Y3+m1VdtpQVwZxPpiNTMygQ3ROYht/Qytjh1MOIEovkGz5tV
	 bcq4PHSe2Gt/9vEuA0P0vv34DjSGycPX9xbGpUosJsp5fXKeYEe3JZT4Ql61jhurO+
	 gCXHfY50VXK/M1ChEW4ylegQ+rI43NyYubexsyM43DE7MleXq3AyZ+wBdFusHVrdBA
	 pFqV6F1YanMFcgJAjaMCkwpm9iPYtSre4fgBcn8B5k+7oPo5uIGda9/vEkDd7ppHk9
	 KtnQj44Wz+NXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08FDD81F60;
	Wed, 24 Jun 2026 12:32:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C32A3367
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A79E081F5E
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATyJ56i32eHW for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 12:32:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AA2D281F60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA2D281F60
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AA2D281F60
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 12:32:01 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-befee9e5ef7so118357866b.0
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 05:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782304319; x=1782909119;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9mWgFnKk24Fcnl6aZxdRkhZldiiBsiFXrDy9vIGfwvo=;
 b=QUpTRy1VuU6aqHUsh2dDmOsVOA8QjrKtsoXw6buY9tjDIdlS36d5XJ39tqfHZ0ghjm
 T1fHR5pqe677btxKIpFiTVhE66M1fBruupSSHAEolMGs+QIM5L7OczdgnlFwzLg4dvXf
 oDw32+18IUVBa1Fi9pudqTHh0VXdUEt3id6EDT+OqbEkoi3JN5iYGIdGHyvFzl/TmdTJ
 avFLJ2FzsXdnAsFd0muL9D8VSDRNtldukG4hX8pW6y96qZV8mO+c8e/FK0wJl5EkZNhb
 OmeV2mykN4vC4l1PbmMiW0PsJ0n3CPzPZaC1+IX6OmZTkpIbrf52Oon4Bhc42hYOIhC8
 +e0w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9YBLW+XvQAVEnyFTiU3sDOdBLeb6wzZpkJgZ1djAD8UdjYLpeFc49Bnykcb8wnQqQ86IvLrW/Rrzg=@buildroot.org
X-Gm-Message-State: AOJu0YxLgl8qK0X4Z80Jqk61D/ysOeJMVom7DlhQ9gvauRnd9n7ESwfb
 5IVvCCKxmXHOfXLR1chzvW4x09qSGYsDPzKZlJ/QtR6uJlEgMwruutUer3CBjvGwYmU=
X-Gm-Gg: AfdE7ck6PHfmBT/iS8pblgiSFUgBh2R3ZBQ91GAGfjVApQ+glAJ7eHursZg7JELdpod
 rg5aPxJlvAlh8xwBihkheveb6/wKb6X3PoJR4G4c+MuwvZFBfxver5Hj1kFX0AcJqRI1n/wVAy0
 M+O180Tz6KKdQdJH0/hDX6332P4XFrqgagoD2PurSV+agni9HRLaYSxS6F9A/S4AMtSG7RF59fY
 OmqZtqtmimOZrhi65WSUc7oKrtBG+aYZo2IE42cAqG1oLceoeRMI6zWIRwb8D5axKnt06jY0r+5
 W42Ewxk3InbFCfUlo5y0n9ZwdSBNEYgg8ebciPMX4Prtnag4vQ77chhnsqo+UyLKQUp/lBa9h3l
 WAYuRspo3wlDgzSDMQVuZ+gmHVodMf2lywaGZ6rwqLyaB/yRcmaNF6Lhr6znvINE1YRxxAbzWcH
 MPQL8P8q/2xeCOyzvD1dFhbZ2VSmKwJbTEZlyvt5c5emkSUR6r0XIe5aRy7WGUTezPmJnrxTZMu
 T8H
X-Received: by 2002:a17:907:97d6:b0:c07:5ee3:cede with SMTP id
 a640c23a62f3a-c119de5e407mr161621866b.2.1782304319270; 
 Wed, 24 Jun 2026 05:31:59 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840f4bsm6745091f8f.4.2026.06.24.05.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2026 05:31:58 -0700 (PDT)
Message-ID: <4e8c6c9e-55d4-4401-b8d8-676042ae6272@smile.fr>
Date: Wed, 24 Jun 2026 14:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: ju.o@free.fr, dowan.gullient@smile.fr
References: <20260621164634.2423931-1-romain.naour@smile.fr>
 <20260621164634.2423931-3-romain.naour@smile.fr>
 <b87e8e5a-4917-44c3-b87a-95c98d4efd1f@gmx.de>
Content-Language: fr, en-US
In-Reply-To: <b87e8e5a-4917-44c3-b87a-95c98d4efd1f@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1782304319; x=1782909119; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9mWgFnKk24Fcnl6aZxdRkhZldiiBsiFXrDy9vIGfwvo=;
 b=RTIGyGNwD2JKotpBM4QtwUHK1jq4wfqlpvLBnXRRt7hTC9VCL4RZKRtwm4ZHyKYrxi
 HGYBQxPPZZ4OJqLT2fiPX/e2YB30tIQB4LhNzGsU9E6MZGBhJF0Eddj7MfMtvGV1hP15
 867kUMEyUmDuP8gGLnM7AqORBQ//0x0mqWiEk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=RTIGyGNw
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: TestIptables: bump
 kernel to 6.18 LTS
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

TGUgMjMvMDYvMjAyNiDDoCAwMjowNCwgRmlvbmEgS2x1dGUgYSDDqWNyaXTCoDoKPiBBbSAyMS4w
Ni4yNiB1bSAxODo0NiBzY2hyaWViIFJvbWFpbiBOYW91ciB2aWEgYnVpbGRyb290Ogo+PiBTaWdu
ZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KPj4gLS0tCj4+
IMKgIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfaXB0YWJsZXMucHkgfCAyICst
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Pgo+
PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9pcHRhYmxl
cy5weSBiL3N1cHBvcnQvdGVzdGluZy8KPj4gdGVzdHMvcGFja2FnZS90ZXN0X2lwdGFibGVzLnB5
Cj4+IGluZGV4IGVlYjRjY2I1ZGQuLmE0YzVlODdkOGQgMTAwNjQ0Cj4+IC0tLSBhL3N1cHBvcnQv
dGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfaXB0YWJsZXMucHkKPj4gKysrIGIvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9pcHRhYmxlcy5weQo+PiBAQCAtMTUsNyArMTUsNyBA
QCBjbGFzcyBUZXN0SXB0YWJsZXMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIEJSMl9UQVJHRVRfR0VORVJJQ19HRVRUWV9QT1JUPSJ0dHlBTUEwIgo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgQlIyX0xJTlVYX0tFUk5FTD15Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBC
UjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPj4gLcKgwqDCoMKgwqDCoMKgIEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMS44MiIKPj4gK8KgwqDCoMKgwqDC
oMKgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjYuMTguMjEiCj4gCj4g
SSdkIHByZWZlciB0byB1c2UgdGhlIGxhdGVzdCBrZXJuZWwgb2YgdGhlIHNlcmllcyAoY3VycmVu
dGx5IC4zNiksIGJ1dCBpdCB3b3Jrcy4KClRydWUsIGl0J3Mgb25seSBiZWNhdXNlIEkgaGF2ZSBp
dCBpbiBteSBETCBkaXJlY3RvcnkuCgpJbiBvdGhlciBoYW5kLCB3ZSBhcmUgZ29pbmcgdG8gaW50
cm9kdWNlIGEgbmV3IHByZWJ1aWx0IGtlcm5lbCBmb3IgYWFyY2g2NC4KU28gbWFueSB0ZXN0IGNh
c2UgKHN1Y2ggdGhpcyBvbmUpIHdpbGwgYmUgdXBkYXRlZCBzb29uIHRvIHNhdmUgc29tZSBidWls
ZCB0aW1lLgoKPiAKPiBUZXN0ZWQtYnk6IEZpb25hIEtsdXRlIDxmaW9uYS5rbHV0ZUBnbXguZGU+
CgpJIGd1ZXNzIEkgY2FuIGtlZXAgaXQgZXZlbiBpZiBJIHVwZGF0ZSB0byA2LjE4LjM2LgoKQmVz
dCByZWdhcmRzLApSb21haW4KCj4gCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBCUjJfTElOVVhfS0VS
TkVMX1VTRV9DVVNUT01fQ09ORklHPXkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIEJSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX0NPTkZJR19GSUxFPSJib2FyZC9xZW11L2FhcmNoNjQtdmlydC8KPj4gbGlu
dXguY29uZmlnIgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgQlIyX0xJTlVYX0tFUk5FTF9ORUVEU19I
T1NUX09QRU5TU0w9eQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
