Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FC1C3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 14:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F313340919;
	Mon, 15 Jul 2024 14:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MeEdG0CmP3gU; Mon, 15 Jul 2024 14:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF77640734
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF77640734;
	Mon, 15 Jul 2024 14:48:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A5C311BF3AD
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FC4C401F7
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 14:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QtTr6U1q8dhO for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 14:48:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F3963401B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3963401B4
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3963401B4
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 14:48:37 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3680667d831so1631212f8f.3
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 07:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721054916; x=1721659716;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XH4AWR46CmE/HMLzw5ouwpGBFcmduFBLwtbIog/t8Fg=;
 b=bM6O/LjXNtrjfkIE5uBo7PzPYHiUC+v6BFBBrB7BJc1juhWttnAtqnDI01bZlHotiq
 OE4pO7EMiydfhodVTs5vmS/lk4JLXzHDNE5NYK0T/0jKJWij9NnBmhmd5Q67upbirS2U
 XvimcMXDql7aC5yIYcSO9DQpwZZ8CE4lX/7mcCglyFqsHuc6iuGB1Nqie/5+RNV3E84D
 tYotrgNWw9lNMytMJk0G9Q7UWUujM4gVvRWDdR9UmhyOiUpD6N9yp6lYA+wGSG7xOIqp
 ZV6o6fku3l5qsxYUkjNvdEWM6Uo7/W9cl6JUmEz7UsFs3YsnJ+J63l+YbYkqRf4zsM/T
 rsSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFC6bRZ3EEgZ75MksKFmls938HI/mV1mNP6eL+WrQgFR17pYEP2l4qknRPFjremWs1kK/hsTijwl6Yw0w7JfajpZeMdc43Mw==
X-Gm-Message-State: AOJu0YxGxFivD180jB159A44C+4On6655WtCmkcWSx438WWmf+1CvnDW
 TmVEGb3b98gGAxsoUaHSbu9VA2pn2pLX7HkUomT/EI/BrWLWlAl2DzVtRolaEAU=
X-Google-Smtp-Source: AGHT+IHrO4PDF33DCo8/kPpGvxskYK3XFzIWst8vKruXgxfDYRsPxLfNPGhrDgLLVeG21VsV0axRfQ==
X-Received: by 2002:a5d:6da6:0:b0:367:94a7:12c8 with SMTP id
 ffacd0b85a97d-367cea46deamr15909611f8f.6.1721054915854; 
 Mon, 15 Jul 2024 07:48:35 -0700 (PDT)
Received: from [10.8.0.42] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680db047c4sm6629028f8f.108.2024.07.15.07.48.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 07:48:35 -0700 (PDT)
Message-ID: <c8cb842c-a60c-43c1-b5b6-82c80be65d24@mind.be>
Date: Mon, 15 Jul 2024 16:48:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
References: <20240715-uboot-default-env-v2-1-8a585679ba0a@bootlin.com>
Content-Language: en-GB
In-Reply-To: <20240715-uboot-default-env-v2-1-8a585679ba0a@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721054916; x=1721659716; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XH4AWR46CmE/HMLzw5ouwpGBFcmduFBLwtbIog/t8Fg=;
 b=fOnJmhZ+VSt4iFPziVFW/XXuYXU1svPJ+SzrCpG1UXS28Dg8Qa98kPW7dB2cqzv7Bv
 63jzz152t+waPisSxSsxskyMxBXYvIk6LEZFVbYdm9yXM6upAGtmYpta4upBlny/vwXj
 sju2iB6aDVPFUMo5HYasp1QrSZeD+4WIU23lGzcjfC6W9pCWuWHQ4wGZ+MWZggluMbw1
 LzMufFzmTrC2RXflSAyhjW7tLiMJ5/bAblaJZQEI2QiN0Y15GSCAJBqLx03Ufb3jK4bJ
 hC7V7BJ3r+HC/3Gtpnp2CNPcKNYwnWJwAHgqkLvyanolnygyqrKh9g0GsqKKX28f3LF2
 NQYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fOnJmhZ+
Subject: Re: [Buildroot] [PATCH v2] uboot: allow taking the entire default
 environment from a text file
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wNy8yMDI0IDE1OjUxLCBMdWNhIENlcmVzb2xpIHdyb3RlOgo+IEJ5IGRlZmF1bHQg
VS1Cb290IGJ1aWxkcyBhIGRlZmF1bHQgZW52aXJvbm1lbnQgZnJvbSBpdHMgb3duIGNvbmZpZ3Vy
YXRpb24KPiBhbmQgYSBib2FyZC1zcGVjaWZpYyBzZXQgb2YgdmFyaWFibGVzLiBIb3dldmVyIGl0
IGFsc28gYWxsb3dzIHRvIGJ5cGFzcwo+IHRoaXMgZW50aXJlbHkgYW5kIGRlZmluZSB0aGUgZW50
aXJlIGRlZmF1bHQgZW52aXJvbm1lbnQgZnJvbSBhIHRleHQgZmlsZS4KPiAKPiBFeHBvc2UgdGhp
cyBmZWF0dXJlIHRvIEJ1aWxkcm9vdC4gVGhpcyBhbGxvd3MgdG8gaGF2ZSBhIGZpbGUgZS5nLiBp
bgo+IGJvYXJkLy4uLi91Ym9vdC5lbnYgd2hpY2ggY29udGFpbnMgYW4gZWFzeSB0byBtYWludGFp
biB0ZXh0IGZpbGUgd2l0aCB0aGUKPiB3YW50ZWQgZGVmYXVsdCBlbnZpcm9ubWVudCwgd2l0aG91
dCBwYXRjaGluZyB0aGUgVS1Cb290IHNvdXJjZSBjb2RlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEx1
Y2EgQ2VyZXNvbGkgPGx1Y2EuY2VyZXNvbGlAYm9vdGxpbi5jb20+CgogIEFwcGxpZWQgdG8gbWFz
dGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IC0tLQo+IENoYW5nZXMgaW4gdjI6
Cj4gLSBVc2Ugb25seSBvbmUgc3RyaW5nIHZhcmlhYmxlIChlbXB0eSA9IGRpc2FibGVkKSBhbmQg
bWVyZ2UgaGVscCB0ZXh0cyAoQXJub3V0KQo+IC0gV3JhcCBoZWxwIGxpbmVzIGF0IDYyIGNoYXJz
IChLw7ZyeSkKPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA2
MTctdWJvb3QtZGVmYXVsdC1lbnYtdjEtMS05YWM4OGYwZTE3ODlAYm9vdGxpbi5jb20KPiAtLS0K
PiAKPiBDaGFuZ2VkIGluIHYyOgo+ICAgLSBVc2Ugb25seSBvbmUgc3RyaW5nIHZhcmlhYmxlIChl
bXB0eSA9IGRpc2FibGVkKSBhbmQgbWVyZ2UgaGVscCB0ZXh0cyAoQXJub3V0KQo+ICAgLSBXcmFw
IGhlbHAgbGluZXMgYXQgNjIgY2hhcnMgKEvDtnJ5KQo+IC0tLQo+ICAgYm9vdC91Ym9vdC9Db25m
aWcuaW4gfCAyOSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgYm9vdC91Ym9vdC91
Ym9vdC5tayAgfCAgOSArKysrKysrKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9u
cygrKQo+IAo+IGRpZmYgLS1naXQgYS9ib290L3Vib290L0NvbmZpZy5pbiBiL2Jvb3QvdWJvb3Qv
Q29uZmlnLmluCj4gaW5kZXggZjM3MDQwYTI4YTk3Li42YjdmOWQ2NzcxYWMgMTAwNjQ0Cj4gLS0t
IGEvYm9vdC91Ym9vdC9Db25maWcuaW4KPiArKysgYi9ib290L3Vib290L0NvbmZpZy5pbgo+IEBA
IC0xMzYsNiArMTM2LDM1IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX0NPTkZJR19GUkFHTUVO
VF9GSUxFUwo+ICAgCSAgdGhhdCB3aWxsIGJlIG1lcmdlZCB0byB0aGUgbWFpbiBVLUJvb3QgY29u
ZmlndXJhdGlvbiBmaWxlLgo+ICAgZW5kaWYKPiAgIAo+ICtjb25maWcgQlIyX1RBUkdFVF9VQk9P
VF9ERUZBVUxUX0VOVl9GSUxFCj4gKwlzdHJpbmcgIlRleHQgZmlsZSB3aXRoIGRlZmF1bHQgZW52
aXJvbm1lbnQiCj4gKwlzZWxlY3QgQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19YWEQKPiArCWhlbHAK
PiArCSAgVGV4dCBmaWxlIGNvbnRhaW5pbmcgdGhlIHZhcmlhYmxlcyB0byBiZSB1c2VkIGFzIHRo
ZSBkZWZhdWx0Cj4gKwkgIGVudmlyb25tZW50IGluIFUtQm9vdC4KPiArCj4gKwkgIElmIGVtcHR5
LCBsZXQgVS1Cb290IGdlbmVyYXRlIHRoZSBkZWZhdWx0IGVudmlyb21uZW50IGZyb20gdGhlCj4g
KwkgIHNvdXJjZSBjb2RlIGFuZCBvdGhlciBVLUJvb3QgY29uZmlndXJhdGlvbiB2YWx1ZXMsIHdo
aWNoIGlzCj4gKwkgIHRoZSBkZWZhdWx0IGJlaGF2aW91ci4KPiArCj4gKwkgIElmIHNldCB0byB0
aGUgcGF0aCB0byBhIGZpbGUsIGluc3RydWN0cyBVLUJvb3QgdG8gZGVmaW5lIHRoZQo+ICsJICBl
bnRpcmUgVS1Cb290IGRlZmF1bHQgZW52aXJvbm1lbnQgZnJvbSB0aGUgcHJvdmlkZWQgZmlsZSwK
PiArCSAgZGlzYWJsaW5nIGFsbCB0aGUgZGVmYXVsdCBiZWhhdmlvdXIuCj4gKwo+ICsJICBGcm9t
IHRoZSBVLUJvb3QgZG9jdW1lbnRhdGlvbjoKPiArCj4gKwkgICAgVGhlIGZvcm1hdCBpcyB0aGUg
c2FtZSBhcyBhY2NlcHRlZCBieSB0aGUgbWtlbnZpbWFnZSB0b29sLAo+ICsJICAgIHdpdGggbGlu
ZXMgY29udGFpbmluZyBrZXk9dmFsdWUgcGFpcnMuIEJsYW5rIGxpbmVzIGFuZAo+ICsJICAgIGxp
bmVzIGJlZ2lubmluZyB3aXRoICcjJyBhcmUgaWdub3JlZC4KPiArCj4gKwkgIEJhc2VkIG9uIHRo
ZSBVU0VfREVGQVVMVF9FTlZfRklMRSBhbmQgREVGQVVMVF9FTlZfRklMRSBVLUJvb3QKPiArCSAg
Y29uZmlndXJhdGlvbiB2YXJpYWJsZXMuCj4gKwo+ICsJICBGb3IgbW9yZSBpbmZvIHNlZToKPiAr
CSAgaHR0cHM6Ly9kb2NzLnUtYm9vdC5vcmcvZW4vbGF0ZXN0L3VzYWdlL2Vudmlyb25tZW50Lmh0
bWwjZXh0ZXJuYWwtZW52aXJvbm1lbnQtZmlsZQo+ICsKPiArCSAgUmVxdWlyZXMgVS1Cb290ID49
IHYyMDE4LjA1Lgo+ICsKPiAgIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX05FRURTX0RUQwo+ICAg
CWJvb2wgIlUtQm9vdCBuZWVkcyBkdGMiCj4gICAJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfRFRD
Cj4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3QubWsgYi9ib290L3Vib290L3Vib290Lm1r
Cj4gaW5kZXggMTlmNGNkYjU1N2U2Li42Y2M4N2IzNWQzZDYgMTAwNjQ0Cj4gLS0tIGEvYm9vdC91
Ym9vdC91Ym9vdC5tawo+ICsrKyBiL2Jvb3QvdWJvb3QvdWJvb3QubWsKPiBAQCAtMzkwLDYgKzM5
MCwxNCBAQCBVQk9PVF9LQ09ORklHX0VESVRPUlMgPSBtZW51Y29uZmlnIHhjb25maWcgZ2NvbmZp
ZyBuY29uZmlnCj4gICAjIG92ZXJyaWRlIGFnYWluLiBJbiBhZGRpdGlvbiwgaG9zdC1jY2FjaGUg
aXMgbm90IHJlYWR5IGF0IGtjb25maWcKPiAgICMgdGltZSwgc28gdXNlIEhPU1RDQ19OT0NDQUNI
RS4KPiAgIFVCT09UX0tDT05GSUdfT1BUUyA9ICQoVUJPT1RfTUFLRV9PUFRTKSBIT1NUQ0M9IiQo
SE9TVENDX05PQ0NBQ0hFKSIgSE9TVExERkxBR1M9IiIKPiArCj4gK1VCT09UX0RFRkFVTFRfRU5W
X0ZJTEUgPSAkKGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9VQk9PVF9ERUZBVUxUX0VOVl9GSUxF
KSkKPiAraWZuZXEgKCQoVUJPT1RfREVGQVVMVF9FTlZfRklMRSksKQo+ICtkZWZpbmUgVUJPT1Rf
S0NPTkZJR19ERUZBVUxUX0VOVl9GSUxFCj4gKwkkKGNhbGwgS0NPTkZJR19TRVRfT1BULENPTkZJ
R19VU0VfREVGQVVMVF9FTlZfRklMRSx5KQo+ICsJJChjYWxsIEtDT05GSUdfU0VUX09QVCxDT05G
SUdfREVGQVVMVF9FTlZfRklMRSwiJChzaGVsbCByZWFkbGluayAtZiAkKFVCT09UX0RFRkFVTFRf
RU5WX0ZJTEUpKSIpCj4gK2VuZGVmCj4gK2VuZGlmCj4gICBlbmRpZiAjIEJSMl9UQVJHRVRfVUJP
T1RfQlVJTERfU1lTVEVNX0xFR0FDWQo+ICAgCj4gICBVQk9PVF9DVVNUT01fRFRTX1BBVEggPSAk
KGNhbGwgcXN0cmlwLCQoQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fRFRTX1BBVEgpKQo+IEBAIC01
MzAsNiArNTM4LDcgQEAgZGVmaW5lIFVCT09UX0tDT05GSUdfRklYVVBfQ01EUwo+ICAgCSQoVUJP
T1RfWllOUU1QX0tDT05GSUdfUE1VRlcpCj4gICAJJChVQk9PVF9aWU5RTVBfS0NPTkZJR19QTV9D
RkcpCj4gICAJJChVQk9PVF9aWU5RTVBfS0NPTkZJR19QU1VfSU5JVCkKPiArCSQoVUJPT1RfS0NP
TkZJR19ERUZBVUxUX0VOVl9GSUxFKQo+ICAgZW5kZWYKPiAgIAo+ICAgaWZlcSAoJChCUjJfVEFS
R0VUX1VCT09UKSQoQlJfQlVJTERJTkcpLHl5KQo+IAo+IC0tLQo+IGJhc2UtY29tbWl0OiA3YmZl
YTkzNzJmMTg0MjI3OWE4ZjU3YjVmYzQ0MjhiYmFlODIyZTkxCj4gY2hhbmdlLWlkOiAyMDI0MDYx
Ny11Ym9vdC1kZWZhdWx0LWVudi00NjY4ODUyMWZiYWUKPiAKPiBCZXN0IHJlZ2FyZHMsCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
