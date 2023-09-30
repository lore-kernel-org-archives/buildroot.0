Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12377E77371
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:53:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A689683D0D;
	Sat, 30 Sep 2023 13:53:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A689683D0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M1FK8mcuOgY5; Sat, 30 Sep 2023 13:53:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B390F83CF8;
	Sat, 30 Sep 2023 13:53:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B390F83CF8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F56C1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 679F240C0A
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 679F240C0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id awyYjdI1-kcy for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:53:38 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 050D84047B
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:53:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 050D84047B
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4054496bde3so133063745e9.1
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 06:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696082016; x=1696686816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=flunM9BplHu2j7dK5+z2uOvBRjox25eMnVWOAT/Scf8=;
 b=XI9aNBG8AE6gjMmvAHKmPINXvq34WfzxYUgOTuwZPztAYv35w3l8kFni43HTua1Jq3
 4U2JyX7fSXxvzWCKCQcNsQf1Z4Slox9pXBiCmquTmocQ6RvlthUsMVDzVpli3uOZ43YM
 BM4IFmH3wsZe9GAjaBTtu8Tp4HDPS7wj2vTQIxVEbdelasFLvORVTgnNt8QyI/03ux/1
 FSKtav5Lzv0iBNt5i6UsegtL+4EqULoa2jRCZ66bdgTGi2xMifBr4tW3WcSNRnU4ElOh
 8YYRNyMvQVtcsO/f8GBAAcQzs0QiUBAn2gHj21rUVoZw9vXwp0KC9r/RA0B9slG72MgA
 iWlA==
X-Gm-Message-State: AOJu0YwrwGQ3DGcSvRgWTZPjotbUkiKRENOyO1x7TAY8ndETFPjluswk
 ROrQX2GkN9lhxPrVOrgsT4KIYg==
X-Google-Smtp-Source: AGHT+IFnVx4NmKyEqcskJ1fOVXXnyBnUhbyz8L1tuu6eAwWYbaQdnJcz48cCweNo35nFjpH14jeelQ==
X-Received: by 2002:a05:600c:2146:b0:405:458d:d54 with SMTP id
 v6-20020a05600c214600b00405458d0d54mr6356474wml.33.1696082015967; 
 Sat, 30 Sep 2023 06:53:35 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c00c500b004047ac770d1sm3464066wmm.8.2023.09.30.06.53.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Sep 2023 06:53:35 -0700 (PDT)
Message-ID: <0e2be250-aa17-46aa-1938-19c36efce6a1@smile.fr>
Date: Sat, 30 Sep 2023 15:53:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20230929222724.2372985-1-peter@korsgaard.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230929222724.2372985-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696082016; x=1696686816;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=flunM9BplHu2j7dK5+z2uOvBRjox25eMnVWOAT/Scf8=;
 b=byyuVYZzKLQkDcjZ0JGBh07rBhlJogISjPTJmEJ/bFVYoFYHors4+oQp08YoFQjDGw
 VQtlYU0N1nyFK7eYDhV8xdxW4Uw1MtqJZWCUbbkkdG/fsQtgiqCtFidjPU3GpixQBrST
 56h9IqFK33dwAdsoYcZDNVfTwedhtfKGvrUgSpVCELuw0OYzEwwH5ZE3ry0alvdXQ1kD
 WsoQ1VnvptDBqEEisoF1ZtO8sNVUoL0AZOykhsoT7vCY33zJYLFr6f56B7QwPeeYDlhD
 ZU8AWbBdWoGS2wni3niAzZuK1X6lUkuy7z0U/d2AOz57f5ub/hpHcA+qkQeqGh5NNiY+
 Cphg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=byyuVYZz
Subject: Re: [Buildroot] [PATCH-2023.02.x] package/{glibc,
 localedef}: security bump to 2.36-117
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMzAvMDkvMjAyMyDDoCAwMDoyNywgUGV0ZXIgS29yc2dhYXJkIGEgw6ljcml0wqA6Cj4gRml4
ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6Cj4gCj4gQ1ZFLTIwMjMtNDUyNzogSWYg
dGhlIHN5c3RlbSBpcyBjb25maWd1cmVkIGluIG5vLWFhYWEgbW9kZSB2aWEKPiAvZXRjL3Jlc29s
di5jb25mLCBnZXRhZGRyaW5mbyBpcyBjYWxsZWQgZm9yIHRoZSBBRl9VTlNQRUMgYWRkcmVzcwo+
IGZhbWlseSwgYW5kIGEgRE5TIHJlc3BvbnNlIGlzIHJlY2VpdmVkIG92ZXIgVENQIHRoYXQgaXMg
bGFyZ2VyIHRoYW4KPiAyMDQ4IGJ5dGVzLCBnZXRhZGRyaW5mbyBtYXkgcG90ZW50aWFsbHkgZGlz
Y2xvc2Ugc3RhY2sgY29udGVudHMgdmlhCj4gdGhlIHJldHVybmVkIGFkZHJlc3MgZGF0YSwgb3Ig
Y3Jhc2guCj4gCj4gQ1ZFLTIwMjMtNDgwNjogV2hlbiBhbiBOU1MgcGx1Z2luIG9ubHkgaW1wbGVt
ZW50cyB0aGUKPiBfZ2V0aG9zdGJ5bmFtZTJfciBhbmQgX2dldGNhbm9ubmFtZV9yIGNhbGxiYWNr
cywgZ2V0YWRkcmluZm8gY291bGQgdXNlCj4gbWVtb3J5IHRoYXQgd2FzIGZyZWVkIGR1cmluZyBi
dWZmZXIgcmVzaXppbmcsIHBvdGVudGlhbGx5IGNhdXNpbmcgYQo+IGNyYXNoIG9yIHJlYWQgb3Ig
d3JpdGUgdG8gYXJiaXRyYXJ5IG1lbW9yeS4KPiAKPiBDVkUtMjAyMy01MTU2OiBUaGUgZml4IGZv
ciBDVkUtMjAyMy00ODA2IGludHJvZHVjZWQgYSBtZW1vcnkgbGVhayB3aGVuCj4gYW4gYXBwbGlj
YXRpb24gY2FsbHMgZ2V0YWRkcmluZm8gZm9yIEFGX0lORVQ2IHdpdGggQUlfQ0FOT05OQU1FLAo+
IEFJX0FMTCBhbmQgQUlfVjRNQVBQRUQgZmxhZ3Mgc2V0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBl
dGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29yc2dhYXJkLmNvbT4KClJldmlld2VkLWJ5OiBSb21haW4g
TmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5mcj4KCkJlc3QgcmVnYXJkcywKUm9tYWluCgoKPiAt
LS0KPiAgcGFja2FnZS9nbGliYy9nbGliYy5oYXNoICAgICAgIHwgMiArLQo+ICBwYWNrYWdlL2ds
aWJjL2dsaWJjLm1rICAgICAgICAgfCAyICstCj4gIHBhY2thZ2UvbG9jYWxlZGVmL2xvY2FsZWRl
Zi5tayB8IDIgKy0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ2xpYmMvZ2xpYmMuaGFzaCBiL3BhY2th
Z2UvZ2xpYmMvZ2xpYmMuaGFzaAo+IGluZGV4IDRjZTRjNmY2ZDEuLjFhNjZiNjY5ODQgMTAwNjQ0
Cj4gLS0tIGEvcGFja2FnZS9nbGliYy9nbGliYy5oYXNoCj4gKysrIGIvcGFja2FnZS9nbGliYy9n
bGliYy5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMgTG9jYWxseSBjYWxjdWxhdGVkIChmZXRj
aGVkIGZyb20gR2l0aHViKQo+IC1zaGEyNTYgIDY2NjQ4MmU2NTdjMzE5ZjdlMTM5MTIxMTIxYTBk
OTdkMzAzYzY1MjA3YjlmOTczMGY0MmEzZWU4M2M3OWY2ODYgIGdsaWJjLTIuMzYtODEtZzRmNGQ3
YTEzZWRmZDJmZGM1N2M5ZDc2ZTFmZDZkMDE3ZmI0NzU1MGMudGFyLmd6Cj4gK3NoYTI1NiAgYTQz
NTFlNjBhMzNlODQyMzZjMTg2NmMzOWVlYWIzMjFmNDE5ZGZkYzI3NDQxMWI3ZDI2MTVjOTM4MmFj
ZTM1MSAgZ2xpYmMtMi4zNi0xMTctZzMyOTU3ZWI2YTg2YWNkYmVlYzlmMzhhNjBhN2Q1YTBmZjMy
ZGIwM2QudGFyLmd6Cj4gIAo+ICAjIEhhc2hlcyBmb3IgbGljZW5zZSBmaWxlcwo+ICBzaGEyNTYg
IDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUy
MWI4ODA2NDMgIENPUFlJTkcKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbGliYy9nbGliYy5tayBi
L3BhY2thZ2UvZ2xpYmMvZ2xpYmMubWsKPiBpbmRleCAzNTRmMDM1ZDMzLi40MmRlNTNmZmM1IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvZ2xpYmMvZ2xpYmMubWsKPiArKysgYi9wYWNrYWdlL2dsaWJj
L2dsaWJjLm1rCj4gQEAgLTcsNyArNyw3IEBACj4gICMgR2VuZXJhdGUgdmVyc2lvbiBzdHJpbmcg
dXNpbmc6Cj4gICMgICBnaXQgZGVzY3JpYmUgLS1tYXRjaCAnZ2xpYmMtKicgLS1hYmJyZXY9NDAg
b3JpZ2luL3JlbGVhc2UvTUFKT1IuTUlOT1IvbWFzdGVyIHwgY3V0IC1kICctJyAtZiAyLQo+ICAj
IFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNpb24sIHBsZWFzZSBhbHNvIHVwZGF0ZSBsb2NhbGVkZWYK
PiAtR0xJQkNfVkVSU0lPTiA9IDIuMzYtODEtZzRmNGQ3YTEzZWRmZDJmZGM1N2M5ZDc2ZTFmZDZk
MDE3ZmI0NzU1MGMKPiArR0xJQkNfVkVSU0lPTiA9IDIuMzYtMTE3LWczMjk1N2ViNmE4NmFjZGJl
ZWM5ZjM4YTYwYTdkNWEwZmYzMmRiMDNkCj4gICMgVXBzdHJlYW0gZG9lc24ndCBvZmZpY2lhbGx5
IHByb3ZpZGUgYW4gaHR0cHMgZG93bmxvYWQgbGluay4KPiAgIyBUaGVyZSBpcyBvbmUgKGh0dHBz
Oi8vc291cmNld2FyZS5vcmcvZ2l0L2dsaWJjLmdpdCkgYnV0IGl0J3Mgbm90IHJlbGlhYmxlLAo+
ICAjIHNvbWV0aW1lcyB0aGUgY29ubmVjdGlvbiB0aW1lcyBvdXQuIFNvIHVzZSBhbiB1bm9mZmlj
aWFsIGdpdGh1YiBtaXJyb3IuCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbG9jYWxlZGVmL2xvY2Fs
ZWRlZi5tayBiL3BhY2thZ2UvbG9jYWxlZGVmL2xvY2FsZWRlZi5tawo+IGluZGV4IDY2OTk4NDA4
NTQuLmU3MTQyNDQ5MGIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sb2NhbGVkZWYvbG9jYWxlZGVm
Lm1rCj4gKysrIGIvcGFja2FnZS9sb2NhbGVkZWYvbG9jYWxlZGVmLm1rCj4gQEAgLTcsNyArNyw3
IEBACj4gICMgVXNlIHRoZSBzYW1lIFZFUlNJT04gYW5kIFNJVEUgYXMgdGFyZ2V0IGdsaWJjCj4g
ICMgQXMgaW4gZ2xpYmMubWssIGdlbmVyYXRlIHZlcnNpb24gc3RyaW5nIHVzaW5nOgo+ICAjICAg
Z2l0IGRlc2NyaWJlIC0tbWF0Y2ggJ2dsaWJjLSonIC0tYWJicmV2PTQwIG9yaWdpbi9yZWxlYXNl
L01BSk9SLk1JTk9SL21hc3RlciB8IGN1dCAtZCAnLScgLWYgMi0KPiAtTE9DQUxFREVGX1ZFUlNJ
T04gPSAyLjM2LTgxLWc0ZjRkN2ExM2VkZmQyZmRjNTdjOWQ3NmUxZmQ2ZDAxN2ZiNDc1NTBjCj4g
K0xPQ0FMRURFRl9WRVJTSU9OID0gMi4zNi0xMTctZzMyOTU3ZWI2YTg2YWNkYmVlYzlmMzhhNjBh
N2Q1YTBmZjMyZGIwM2QKPiAgTE9DQUxFREVGX1NPVVJDRSA9IGdsaWJjLSQoTE9DQUxFREVGX1ZF
UlNJT04pLnRhci5nego+ICBMT0NBTEVERUZfU0lURSA9ICQoY2FsbCBnaXRodWIsYm1pbm9yLGds
aWJjLCQoTE9DQUxFREVGX1ZFUlNJT04pKQo+ICBIT1NUX0xPQ0FMRURFRl9ETF9TVUJESVIgPSBn
bGliYwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
