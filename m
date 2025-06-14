Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82A36C71135
	for <buildroot@archiver.kernel.org>; Sat, 14 Jun 2025 13:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 535D2810BE;
	Sat, 14 Jun 2025 13:14:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zy6nN8bCaiX1; Sat, 14 Jun 2025 13:14:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77B64810B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77B64810B9;
	Sat, 14 Jun 2025 13:14:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F7DF151
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CCC240743
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bodQQDmZMz5h for <buildroot@buildroot.org>;
 Sat, 14 Jun 2025 13:14:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82DFD4073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82DFD4073A
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82DFD4073A
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 13:14:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a510432236so2429491f8f.0
 for <buildroot@buildroot.org>; Sat, 14 Jun 2025 06:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749906878; x=1750511678;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0XuUTTuIfYaxqiK3S0Kt/86N9sCarRYowPsD5Js4YwQ=;
 b=QKPA1AKXoP1CdILUf+AHJSccxgg6f+1b2sXISPUu9JpwJQ8apjz87Ld/sEZEvAhn/N
 XSbZA+3HjdAilgSv5kH1i5lQTvZPtSI/Usa/McZPqZWwPIE8u7hn8V7vVOL3J6x4osYE
 kMvbp8RNS9Nw+ikmjrABE/crrryiNEtkXUFt2mWgAe1POS5rAmVU/cvl+5bjnkc2O4xn
 yncq/IMYZqOma3ITYRIg0bsCTZAF7FEm1/Ig6NFihnGISdoIAHgrCgmx8VtvbTrGQyaB
 nGb1izZEUfd9nl/wOweSy7GH+JeXt5SyShfqDYXvgeEEIKTk2OvTd7jm754igxTcYX4Y
 Qpqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUy7zsAJuh2GCrInbAXTvxb/HXeHjUOc4+rRTNsOmjHntDGQELbb1BXAIeIY7PFw9lHt0IUiZmAMCQ=@buildroot.org
X-Gm-Message-State: AOJu0YxL/HTHMcGcvOrYm4cmhYd8eIUzU3I1s/4dhlKy1kL6l5wBXSDu
 pHoJVyjcErbbVISbmST9RTTB422S8U0KsP5hPtCKkjLxitQSoWfydylH33xS1ZBv6ss=
X-Gm-Gg: ASbGncsknLlguGOmafxeHc5kX35c1GQBfU28stLre7ILRzTxUN6To2Lj0hnZBAp5nhc
 uE5ZDtFAdVgaVIiKRJs0UlFrR09Sh0yznM5srcWjdIav+zCtKr1KxK/2drZdY5EwFdFg7d26AwW
 nyAxYJSggl9+4zPz1Repf/Y20kZOaR2FO/5hLUkpvJGOV+a8haQdw0VIQeePBL4lDKOoJIINscV
 j3YLH1nxblkvcFsL488e0ric9qUHFT/xwEA/ZXV6Tz6SSnqGIC2xMhBVXfXMQpVXElkhO0KO2Nl
 fY6wescS+xRfd8bJI4oTZCoD0L64dyJMcmfHcpn8W1JKsI57FUuUz5Kun8GmIT3IY35sv0Lznff
 5bltZ42lkdf4huVI2RahbhkII2QGTdA+/HPAei1PN9yrnpjCf7u82wQkxOniKS3Mkno4Cl/trgt
 9v8S8x1tbG1Y0ZnT9CvYx2DUGfhr8kdq1CH3c=
X-Google-Smtp-Source: AGHT+IEy6maFyzgmJxnWZy57O2frprg8EfQyLr3D9y799pcL2p8UbDKtrWxBi8UOjn6M2zQbX6+9mw==
X-Received: by 2002:a05:6000:40c9:b0:3a4:ef70:e0e1 with SMTP id
 ffacd0b85a97d-3a572e897camr2851746f8f.55.1749906878465; 
 Sat, 14 Jun 2025 06:14:38 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a568a63a42sm5177849f8f.28.2025.06.14.06.14.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jun 2025 06:14:38 -0700 (PDT)
Message-ID: <1d9dc31d-2503-4fa9-9d0b-b0b2ad42876e@smile.fr>
Date: Sat, 14 Jun 2025 15:14:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dick Olsson <hi@senzilla.io>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
 <20250607-loongarch-v2-6-90bc4fda9080@flygoat.com>
Content-Language: fr
In-Reply-To: <20250607-loongarch-v2-6-90bc4fda9080@flygoat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1749906878; x=1750511678; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0XuUTTuIfYaxqiK3S0Kt/86N9sCarRYowPsD5Js4YwQ=;
 b=h9K1tJiX5YT08h3LqJAYNBRBVfbuhEhQVoNUyi9oHhRdjGXRfcJAVtK1Im+lI2GLzS
 Aqqai7yGZr9wUX7TPvkXOmBOqUgEpX4pVNh19denn64ehMzp5768Mvv+cSGWqA4aDym8
 LQE3PWkGs33hbImOx3cuL+c7yRL9EToV5el2k=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=h9K1tJiX
Subject: Re: [Buildroot] [PATCH v2 6/9] boot/grub2: Introduce
 loongarch64-efi target
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

SGVsbG8gSmlheHVuLCBBbGwsCgpMZSAwNy8wNi8yMDI1IMOgIDIwOjEyLCBKaWF4dW4gWWFuZyBh
IMOpY3JpdMKgOgo+IGxvb25nYXJjaDY0LWVmaSB0YXJnZXQgcHJlc2VudHMgaW4gR1JVQiBjYW4g
YmUgdXRpbGlzZWQKPiBieSBhbnkgRUZJIGNvbXBhdGlibGUgTG9vbmdBcmNoNjQgbWFjaGluZSB0
byBib290IGtlcm5lbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKaWF4dW4gWWFuZyA8amlheHVuLnlh
bmdAZmx5Z29hdC5jb20+CgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJA
c21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIGJvb3QvZ3J1YjIvQ29u
ZmlnLmluIHwgMTAgKysrKysrKysrKwo+ICBib290L2dydWIyL2dydWIyLm1rICB8ICA5ICsrKysr
KysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvYm9vdC9ncnViMi9Db25maWcuaW4gYi9ib290L2dydWIyL0NvbmZpZy5pbgo+IGluZGV4IGVj
ZWU5ZWY3NGNkY2EwODQ3ZDRhZDM4NmEwZGMyODFjZWQwNzcyNWIuLjNhNTBlYzBhZDc0ODk3Y2M4
OTc5M2Q3YzQ5Y2Q5OGViNTNlNzRjZWYgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9ncnViMi9Db25maWcu
aW4KPiArKysgYi9ib290L2dydWIyL0NvbmZpZy5pbgo+IEBAIC01LDYgKzUsNyBAQCBjb25maWcg
QlIyX1RBUkdFVF9HUlVCMl9BUkNIX1NVUFBPUlRTCj4gIAlkZWZhdWx0IHkgaWYgQlIyX2FybQo+
ICAJZGVmYXVsdCB5IGlmIEJSMl9hYXJjaDY0Cj4gIAlkZWZhdWx0IHkgaWYgQlIyX1JJU0NWXzY0
Cj4gKwlkZWZhdWx0IHkgaWYgQlIyX2xvb25nYXJjaDY0Cj4gIAlkZXBlbmRzIG9uIEJSMl9VU0Vf
TU1VCj4gIAo+ICBtZW51Y29uZmlnIEJSMl9UQVJHRVRfR1JVQjIKPiBAQCAtMTEyLDYgKzExMywx
NSBAQCBjb25maWcgQlIyX1RBUkdFVF9HUlVCMl9SSVNDVjY0X0VGSQo+ICAJICA2NGJpdCBSSVND
LVYgcGxhdGZvcm0gYW5kIHlvdSB3YW50IHRvIGJvb3QgR3J1YiAyIGFzIGFuIEVGSQo+ICAJICBh
cHBsaWNhdGlvbi4KPiAgCj4gK2NvbmZpZyBCUjJfVEFSR0VUX0dSVUIyX0xPT05HQVJDSDY0X0VG
SQo+ICsJYm9vbCAibG9vbmdhcmNoNjQtZWZpIgo+ICsJZGVwZW5kcyBvbiBCUjJfbG9vbmdhcmNo
NjQKPiArCXNlbGVjdCBCUjJfVEFSR0VUX0dSVUIyX0hBU19FRklfQk9PVAo+ICsJaGVscAo+ICsJ
ICBTZWxlY3QgdGhpcyBvcHRpb24gaWYgdGhlIHBsYXRmb3JtIHlvdSdyZSB0YXJnZXR0aW5nIGlz
IGEKPiArCSAgNjRiaXQgTG9vbmdBcmNoIHBsYXRmb3JtIGFuZCB5b3Ugd2FudCB0byBib290IEdy
dWIgMiBhcyBhbiBFRkkKPiArCSAgYXBwbGljYXRpb24uCj4gKwo+ICBpZiBCUjJfVEFSR0VUX0dS
VUIyX0hBU19MRUdBQ1lfQk9PVAo+ICAKPiAgY29tbWVudCAiT3B0aW9ucyBmb3IgdGhlIHg4NiBs
ZWdhY3kgQklPUyBvciBBUk0gVS1Cb290IHN1cHBvcnQiCj4gZGlmZiAtLWdpdCBhL2Jvb3QvZ3J1
YjIvZ3J1YjIubWsgYi9ib290L2dydWIyL2dydWIyLm1rCj4gaW5kZXggMjJkNjA5YzAwNDgzNGFk
YzA5ZGEwNjFhYjg4MzlmNGFhNTYxYTJkZC4uNDU2MmU1N2E0ZjJiZmE2YjZmYjA4NmM3ZWJmOGVm
NDMwNDYxNWUzNiAxMDA2NDQKPiAtLS0gYS9ib290L2dydWIyL2dydWIyLm1rCj4gKysrIGIvYm9v
dC9ncnViMi9ncnViMi5tawo+IEBAIC0xMDIsNiArMTAyLDE1IEBAIEdSVUIyX0JVSUxUSU5fQ09O
RklHX3Jpc2N2NjQtZWZpID0gJChHUlVCMl9CVUlMVElOX0NPTkZJR19FRkkpCj4gIEdSVUIyX0JV
SUxUSU5fTU9EVUxFU19yaXNjdjY0LWVmaSA9ICQoR1JVQjJfQlVJTFRJTl9NT0RVTEVTX0VGSSkK
PiAgR1JVQjJfVFVQTEVTLSQoQlIyX1RBUkdFVF9HUlVCMl9SSVNDVjY0X0VGSSkgKz0gcmlzY3Y2
NC1lZmkKPiAgCj4gK0dSVUIyX0lNQUdFX2xvb25nYXJjaDY0LWVmaSA9ICQoQklOQVJJRVNfRElS
KS9lZmktcGFydC9FRkkvQk9PVC9ib290bG9vbmdhcmNoNjQuZWZpCj4gK0dSVUIyX0NGR19sb29u
Z2FyY2g2NC1lZmkgPSAkKEJJTkFSSUVTX0RJUikvZWZpLXBhcnQvRUZJL0JPT1QvZ3J1Yi5jZmcK
PiArR1JVQjJfUFJFRklYX2xvb25nYXJjaDY0LWVmaSA9IC9FRkkvQk9PVAo+ICtHUlVCMl9UQVJH
RVRfbG9vbmdhcmNoNjQtZWZpID0gbG9vbmdhcmNoNjQKPiArR1JVQjJfUExBVEZPUk1fbG9vbmdh
cmNoNjQtZWZpID0gZWZpCj4gK0dSVUIyX0JVSUxUSU5fQ09ORklHX2xvb25nYXJjaDY0LWVmaSA9
ICQoR1JVQjJfQlVJTFRJTl9DT05GSUdfRUZJKQo+ICtHUlVCMl9CVUlMVElOX01PRFVMRVNfbG9v
bmdhcmNoNjQtZWZpID0gJChHUlVCMl9CVUlMVElOX01PRFVMRVNfRUZJKQo+ICtHUlVCMl9UVVBM
RVMtJChCUjJfVEFSR0VUX0dSVUIyX0xPT05HQVJDSDY0X0VGSSkgKz0gbG9vbmdhcmNoNjQtZWZp
Cj4gKwo+ICAjIEdydWIyIGlzIGtpbmQgb2Ygc3BlY2lhbDogaXQgY29uc2lkZXJzIENDLCBMRCBh
bmQgc28gb24gdG8gYmUgdGhlCj4gICMgdG9vbHMgdG8gYnVpbGQgdGhlIGhvc3QgcHJvZ3JhbXMg
YW5kIHVzZXMgVEFSR0VUX0NDLCBUQVJHRVRfQ0ZMQUdTLAo+ICAjIFRBUkdFVF9DUFBGTEFHUywg
VEFSR0VUX0xERkxBR1MgdG8gYnVpbGQgdGhlIGJvb3Rsb2FkZXIgaXRzZWxmLgo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
