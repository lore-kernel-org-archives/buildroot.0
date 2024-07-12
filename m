Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1413C3DA4B
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:04:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B273A409E0;
	Fri, 12 Jul 2024 14:04:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DBvvQG9dTy6I; Fri, 12 Jul 2024 14:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D9AE40B4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D9AE40B4B;
	Fri, 12 Jul 2024 14:04:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E74091BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4A0A606F8
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gt8mrXNCLoeW for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:04:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C12E160604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C12E160604
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C12E160604
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:04:46 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4266fcb311cso13966105e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720793085; x=1721397885;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Qr1RETpRd5rEr5qRSondkQeMQ+ZJRilI/7X0H9e2/jk=;
 b=K+HdMAITcbdFCjSD1cWaqf6B+6fNho79uv06YGOXpdVPyHuohd61lGv+saF1XVfUR6
 xJRcC7km497xKg/vg5PT5fclDXMyDk4mjPzdmClQmbrDy/v0VEwvX2ezgeSSro8Cm5/J
 za3Nsat2j4Xrxl8mbniK7SJFc6sCSVANvEX2pD200lD/0FaYQVeWCYSMxpwcaWgqDeKV
 eorr3ipcA/x9TQs4ELpwpSZdZsDVbIMg26854ThdfHoGhm5D3BEAg93GMk4o7plVO2Ri
 3Qxled9qU75DO8kCLiB0Kr4GSQJLlATIg8ksOL5GBipphhbNY9FB9+gRqrgBgg349cJ5
 TD3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZuj1+IcbgJp39y4IOqGWjdpeU9D9gWj7NFxV393qdiD9HylOz/UCKgpcS/CLzvFlSgm5dvaD+5n+uaNV6ejt63P/uNuTo0Q==
X-Gm-Message-State: AOJu0YwP0VIF5/JkMuX9n3Wguz0TJlbbdsyzQaJNmPHfS9vi8IDV8gc/
 sCDV/7Ah0PROBb/yHzyLuoVD/b6EBURFF1kPWiAjaEtvgzhgNbThcvLhKK2KOtI=
X-Google-Smtp-Source: AGHT+IH2mIyUX8932+9Yp48f4JrU6N5Am5ohy6CXR2cWwN+gY2rrIqR105hH/zxnPQ/Kn8LcBBiqaQ==
X-Received: by 2002:a5d:634d:0:b0:360:7506:2b8 with SMTP id
 ffacd0b85a97d-367ceacb21emr7902484f8f.52.1720793084742; 
 Fri, 12 Jul 2024 07:04:44 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:f9c8:f443:ffd:1bed?
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde7dedfsm10376056f8f.24.2024.07.12.07.04.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jul 2024 07:04:44 -0700 (PDT)
Message-ID: <e4177115-8b28-41b8-bed4-30d41f16ec85@smile.fr>
Date: Fri, 12 Jul 2024 16:04:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
References: <20240524-loongarch64-v1-0-d24078d79cd5@flygoat.com>
 <20240524-loongarch64-v1-6-d24078d79cd5@flygoat.com>
Content-Language: fr
In-Reply-To: <20240524-loongarch64-v1-6-d24078d79cd5@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720793085; x=1721397885; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Qr1RETpRd5rEr5qRSondkQeMQ+ZJRilI/7X0H9e2/jk=;
 b=N1NS77KGSsI+3vuYAFy1SoMwDSvYb/ft5NPNo1MCB0skiMPsA7glfwHSDjOv7kPmiB
 CA62obHdxiK9Jk/qgYrcHTA5cN4MU8ewHVQ3P63orl40QH0mqhyfTw2DGM0zeiryVc0H
 cLVoLTRolpM7Op0+X/Yous6rkit/785raK1/U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=N1NS77KG
Subject: Re: [Buildroot] [PATCH RESEND 6/7] boot/grub2: Introduce
 loongarch64-efi target
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSmlheHVuLAoKTGUgMjQvMDUvMjAyNCDDoCAyMTozNiwgSmlheHVuIFlhbmcgYSDDqWNy
aXTCoDoKPiBsb29uZ2FyY2g2NC1lZmkgdGFyZ2V0IHByZXNlbnRzIGluIEdSVUIgY2FuIGJlIHV0
aWxpc2VkCj4gYnkgYW55IEVGSSBjb21wYXRpYmxlIExvb25nQXJjaDY0IG1hY2hpbmUgdG8gYm9v
dCBrZXJuZWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmlheHVuIFlhbmcgPGppYXh1bi55YW5nQGZs
eWdvYXQuY29tPgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxl
LmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gLS0tCj4gIGJvb3QvZ3J1YjIvQ29uZmlnLmlu
IHwgMTAgKysrKysrKysrKwo+ICBib290L2dydWIyL2dydWIyLm1rICB8ICA5ICsrKysrKysrKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYm9v
dC9ncnViMi9Db25maWcuaW4gYi9ib290L2dydWIyL0NvbmZpZy5pbgo+IGluZGV4IDdjMjM1ZTk2
ZjcxZC4uOGJmMTkzZDRhODZjIDEwMDY0NAo+IC0tLSBhL2Jvb3QvZ3J1YjIvQ29uZmlnLmluCj4g
KysrIGIvYm9vdC9ncnViMi9Db25maWcuaW4KPiBAQCAtNSw2ICs1LDcgQEAgY29uZmlnIEJSMl9U
QVJHRVRfR1JVQjJfQVJDSF9TVVBQT1JUUwo+ICAJZGVmYXVsdCB5IGlmIEJSMl9hcm0KPiAgCWRl
ZmF1bHQgeSBpZiBCUjJfYWFyY2g2NAo+ICAJZGVmYXVsdCB5IGlmIEJSMl9SSVNDVl82NAo+ICsJ
ZGVmYXVsdCB5IGlmIEJSMl9sb29uZ2FyY2g2NAo+ICAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+
ICAKPiAgY29uZmlnIEJSMl9UQVJHRVRfR1JVQjIKPiBAQCAtMTEyLDYgKzExMywxNSBAQCBjb25m
aWcgQlIyX1RBUkdFVF9HUlVCMl9SSVNDVjY0X0VGSQo+ICAJICA2NGJpdCBSSVNDLVYgcGxhdGZv
cm0gYW5kIHlvdSB3YW50IHRvIGJvb3QgR3J1YiAyIGFzIGFuIEVGSQo+ICAJICBhcHBsaWNhdGlv
bi4KPiAgCj4gK2NvbmZpZyBCUjJfVEFSR0VUX0dSVUIyX0xPT05HQVJDSDY0X0VGSQo+ICsJYm9v
bCAibG9vbmdhcmNoNjQtZWZpIgo+ICsJZGVwZW5kcyBvbiBCUjJfbG9vbmdhcmNoNjQKPiArCXNl
bGVjdCBCUjJfVEFSR0VUX0dSVUIyX0hBU19FRklfQk9PVAo+ICsJaGVscAo+ICsJICBTZWxlY3Qg
dGhpcyBvcHRpb24gaWYgdGhlIHBsYXRmb3JtIHlvdSdyZSB0YXJnZXR0aW5nIGlzIGEKPiArCSAg
NjRiaXQgTG9vbmdBcmNoIHBsYXRmb3JtIGFuZCB5b3Ugd2FudCB0byBib290IEdydWIgMiBhcyBh
biBFRkkKPiArCSAgYXBwbGljYXRpb24uCj4gKwo+ICBpZiBCUjJfVEFSR0VUX0dSVUIyX0hBU19M
RUdBQ1lfQk9PVAo+ICAKPiAgY29tbWVudCAiT3B0aW9ucyBmb3IgdGhlIHg4NiBsZWdhY3kgQklP
UyBvciBBUk0gVS1Cb290IHN1cHBvcnQiCj4gZGlmZiAtLWdpdCBhL2Jvb3QvZ3J1YjIvZ3J1YjIu
bWsgYi9ib290L2dydWIyL2dydWIyLm1rCj4gaW5kZXggNmQwZDcxYzQ3ZDA4Li4zNDc5MTU0MzFm
ZDAgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9ncnViMi9ncnViMi5tawo+ICsrKyBiL2Jvb3QvZ3J1YjIv
Z3J1YjIubWsKPiBAQCAtMTAyLDYgKzEwMiwxNSBAQCBHUlVCMl9CVUlMVElOX0NPTkZJR19yaXNj
djY0LWVmaSA9ICQoR1JVQjJfQlVJTFRJTl9DT05GSUdfRUZJKQo+ICBHUlVCMl9CVUlMVElOX01P
RFVMRVNfcmlzY3Y2NC1lZmkgPSAkKEdSVUIyX0JVSUxUSU5fTU9EVUxFU19FRkkpCj4gIEdSVUIy
X1RVUExFUy0kKEJSMl9UQVJHRVRfR1JVQjJfUklTQ1Y2NF9FRkkpICs9IHJpc2N2NjQtZWZpCj4g
IAo+ICtHUlVCMl9JTUFHRV9sb29uZ2FyY2g2NC1lZmkgPSAkKEJJTkFSSUVTX0RJUikvZWZpLXBh
cnQvRUZJL0JPT1QvYm9vdGxvb25nYXJjaDY0LmVmaQo+ICtHUlVCMl9DRkdfbG9vbmdhcmNoNjQt
ZWZpID0gJChCSU5BUklFU19ESVIpL2VmaS1wYXJ0L0VGSS9CT09UL2dydWIuY2ZnCj4gK0dSVUIy
X1BSRUZJWF9sb29uZ2FyY2g2NC1lZmkgPSAvRUZJL0JPT1QKPiArR1JVQjJfVEFSR0VUX2xvb25n
YXJjaDY0LWVmaSA9IGxvb25nYXJjaDY0Cj4gK0dSVUIyX1BMQVRGT1JNX2xvb25nYXJjaDY0LWVm
aSA9IGVmaQo+ICtHUlVCMl9CVUlMVElOX0NPTkZJR19sb29uZ2FyY2g2NC1lZmkgPSAkKEdSVUIy
X0JVSUxUSU5fQ09ORklHX0VGSSkKPiArR1JVQjJfQlVJTFRJTl9NT0RVTEVTX2xvb25nYXJjaDY0
LWVmaSA9ICQoR1JVQjJfQlVJTFRJTl9NT0RVTEVTX0VGSSkKPiArR1JVQjJfVFVQTEVTLSQoQlIy
X1RBUkdFVF9HUlVCMl9MT09OR0FSQ0g2NF9FRkkpICs9IGxvb25nYXJjaDY0LWVmaQo+ICsKPiAg
IyBHcnViMiBpcyBraW5kIG9mIHNwZWNpYWw6IGl0IGNvbnNpZGVycyBDQywgTEQgYW5kIHNvIG9u
IHRvIGJlIHRoZQo+ICAjIHRvb2xzIHRvIGJ1aWxkIHRoZSBob3N0IHByb2dyYW1zIGFuZCB1c2Vz
IFRBUkdFVF9DQywgVEFSR0VUX0NGTEFHUywKPiAgIyBUQVJHRVRfQ1BQRkxBR1MsIFRBUkdFVF9M
REZMQUdTIHRvIGJ1aWxkIHRoZSBib290bG9hZGVyIGl0c2VsZi4KPiAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
