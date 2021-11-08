Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AD6C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:22:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325F861361
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 325F861361
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C8C34038A;
	Mon,  8 Nov 2021 22:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcDPgDYi74gg; Mon,  8 Nov 2021 22:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57B954037C;
	Mon,  8 Nov 2021 22:22:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 161E51BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D33BF60867
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:06:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JeOikBgADIvD for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:06:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1C15E60869
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:06:20 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b15so49055472edd.7
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 14:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=d4z8TN7VOGeFM43ouF79gGaPbnaNtzgbA5QJRXMDIwU=;
 b=AurBHtj/3/zfU3mhY3tawHWW6knnEjPXp9Myy2IFQ6nJHCiPvOnGirDcF8XpE30tal
 QTEt2V3rZRIgVk7+rKZHERfJby5SqZNKJ5hqLV5rTEgOvmRiPamDfgaD6SzuVSEU+BTX
 cCxdqg/wSjWpQOFKa3wiKKG2hpQ50ba2r9Dx/b7cuRNtP8iLBxCa5smEM2dzqikDxBgE
 q/c65y6gMcohRioghe3NMjCaViQ0SdcV0Ap5IMmsxPsU9Mz5dX52V7M39Kpiav3FX32f
 yqxgzJG3jctebWMqUDDI3P4dkWP3OOzZoMA8XPKjnfJt9reE0deT3jaHyv/rYhd/r9BF
 OiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=d4z8TN7VOGeFM43ouF79gGaPbnaNtzgbA5QJRXMDIwU=;
 b=Ypx9+1F7CI2BcSF7mGOfYYFeuLUvkDllnxSEHsB85DO7MoVIu3wanShdAuLTbz5eY8
 2zbv/kRhpcVf6omC2fzhppTapoE/N8bot+Fg4ZydjIP2rLxVudo59r+0twV/8iz7SMlw
 EHoLVg+By8sBogUiS8gyFWm65EnOPrJ6lzYqOwOc/b4SixD1pM+3FkDZQlSbX6mDRRjO
 4H0YGbcXQ4T6Wv2WN333NZcS8sevPHyfSzbYjNTOYybTV0B3jyCP6c6m1HQ6EBZ6ZGQ1
 bKp+l3Rtw7fDCLxAxpF4/c7BX3ArTXyXIzsn7opnpERmbMmEaXOg8S1YpmjPOtZx3HAy
 rg+g==
X-Gm-Message-State: AOAM532xeVB0MLnP66gDlZyey0GfgaSz+q23lMEbJdPkDVGUV17GVJpB
 XYllua/tLL4NbURME3OrOa06NQ==
X-Google-Smtp-Source: ABdhPJxiLogeG233w7l3qW7OoNSkGCXFFqG7B7D4xKkQcIAZMSQTaoM828nHAnCRrO8DDBfZdmqAug==
X-Received: by 2002:a17:906:6a0f:: with SMTP id
 qw15mr3049917ejc.463.1636409179383; 
 Mon, 08 Nov 2021 14:06:19 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id g21sm8711649ejt.87.2021.11.08.14.06.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 14:06:19 -0800 (PST)
Message-ID: <09bf7012-8f77-58f7-54fe-d74c83c82898@mind.be>
Date: Mon, 8 Nov 2021 23:06:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211107020336.3056910-1-giulio.benetti@benettiengineering.com>
 <de0870fd-2afe-b5f8-d245-fe8c8e6599ca@mind.be>
 <23ab705a-1e0b-ef3c-cdfb-d48df40b6c1a@benettiengineering.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <23ab705a-1e0b-ef3c-cdfb-d48df40b6c1a@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 016/102]
 board/bananapi/bananapi-m64/genimage.cfg: beautify file
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwOC8xMS8yMDIxIDIzOjA1LCBHaXVsaW8gQmVuZXR0aSB3cm90ZToKPiBPbiAxMS84LzIx
IDExOjAyIFBNLCBBcm5vdXQgVmFuZGVjYXBwZWxsZSB3cm90ZToKPj4KPj4KPj4gT24gMDcvMTEv
MjAyMSAwMzowMywgR2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+PiBCZWF0aWZ5IHRoaXMgZ2VuaW1h
Z2UgLmNmZyBmaWxlIHRvIGhhdmUgY29uc2lzdGVuY3kgd2l0aCBhbGwgZ2VuaW1hZ2UgLmNmZwo+
Pj4gZmlsZXMgaW4gQnVpbGRyb290Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5l
dHRpIDxnaXVsaW8uYmVuZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+Pj4gLS0tCj4+PiDC
oMKgIGJvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW02NC9nZW5pbWFnZS5jZmcgfCA1ICsrKy0tCj4+
PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+
Pgo+Pj4gZGlmZiAtLWdpdCBhL2JvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW02NC9nZW5pbWFnZS5j
ZmcgCj4+PiBiL2JvYXJkL2JhbmFuYXBpL2JhbmFuYXBpLW02NC9nZW5pbWFnZS5jZmcKPj4+IGlu
ZGV4IDk3MzBkOGZhYWMuLjUyMTI3MTY3Y2UgMTAwNjQ0Cj4+PiAtLS0gYS9ib2FyZC9iYW5hbmFw
aS9iYW5hbmFwaS1tNjQvZ2VuaW1hZ2UuY2ZnCj4+PiArKysgYi9ib2FyZC9iYW5hbmFwaS9iYW5h
bmFwaS1tNjQvZ2VuaW1hZ2UuY2ZnCj4+PiBAQCAtNiw2ICs2LDcgQEAgaW1hZ2UgYm9vdC52ZmF0
IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImJvb3Quc2NyIgo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfQo+Pj4gwqDCoMKgwqDCoMKgIH0KPj4+ICsKPj4+IMKgwqDCoMKgwqDC
oCBzaXplID0gNjRNCj4+PiDCoMKgIH0KPj4+IEBAIC0xNiwxNCArMTcsMTQgQEAgaW1hZ2Ugc2Rj
YXJkLmltZyB7Cj4+PiDCoMKgwqDCoMKgwqAgcGFydGl0aW9uIHNwbCB7Cj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpbi1wYXJ0aXRpb24tdGFibGUgPSAibm8iCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpbWFnZSA9ICJzdW54aS1zcGwuYmluIgo+Pj4gLcKgwqDCoMKgwqDCoMKgIG9mZnNldCA9
IDgxOTIKPj4+ICvCoMKgwqDCoMKgwqDCoCBvZmZzZXQgPSA4Swo+Pj4gwqDCoMKgwqDCoMKgIH0K
Pj4+IMKgwqDCoMKgwqDCoCBwYXJ0aXRpb24gdS1ib290IHsKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGluLXBhcnRpdGlvbi10YWJsZSA9ICJubyIKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlt
YWdlID0gInUtYm9vdC5pdGIiCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBvZmZzZXQgPSA0MEsK
Pj4+IC3CoMKgwqDCoMKgwqDCoCBzaXplID0gMU0gIyAxTUIgLSA0MEsKPj4+ICvCoMKgwqDCoMKg
wqDCoCBzaXplID0gOTg0SyAjIDFNQiAtIDQwS0IKPj4KPj4gwqDCoCBTaW5jZSB0aGVyZSdzIG5v
IHdheSB5b3UgYWN0dWFsbHkgdGVzdGVkIHRoaXMgb24gYSBib2FyZCwgYW5kIHRoZXJlJ3MgYSBz
bGlnaHQKPj4gcmlzayB0aGF0IG9uZSBvZiB0aGVzZSBkZWZjb25maWdzIGFjdHVhbGx5IG5lZWRz
IHRoZSBmdWxsIDFNQiByYXRoZXIgdGhhbiA5ODRLLAo+PiBJJ3ZlIHJldmVydGVkIGFsbCBvZiB0
aG9zZSB0byAxTS4KPj4KPiAKPiBPaywgSSB3YXMgdW5jZXJ0YWluIG9uIHRob3NlLCB0aGVyZSBh
cmUgMy80IGFzIEkgcmVtZW1iZXIgbGlrZSB0aGF0LgoKICBUaGVyZSBhcmUgMTAgb2YgdGhlbSwg
YWN0dWFsbHkgOi0pCgogIFJlZ2FyZHMsCiAgQXJub3V0Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
