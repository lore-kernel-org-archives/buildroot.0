Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F01CC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 06:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DDE4608E3;
	Thu,  3 Jul 2025 06:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ucu5owPgUoMi; Thu,  3 Jul 2025 06:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0AD161163
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0AD161163;
	Thu,  3 Jul 2025 06:30:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C71D6128
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 06:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4259608E3
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 06:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iD8YikKKUpnB for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 06:30:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7DD94606D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DD94606D4
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7DD94606D4
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 06:30:00 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4537deebb01so27585405e9.0
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 23:30:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751524198; x=1752128998;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jSCo65K8ZcNBl514FotT132PsgjsJysjohsmd+MoNE0=;
 b=hwXO41zgfVpAP6zPDC3WV3C0cRz1EANBc5bjTJW7jHTLqyU3ltv6JP7r+Ix2QpH32+
 j4N/o/xh3dqM/yTbYPJcqDRpuZX3+ANhIV2lIWq6Dnzi7bXbsnY0pruIPxIfJNtnSyUZ
 DlUhGZBJHGrqkuv8JDzGoYP5yNVzSuKX2/sUdbDxoD/x/GQsbwSZkgUCLwplO19Xaf9T
 t5gymj8x4coHblb7ugfLYej+lliQF38kECK6iwMDcg/0+Z+5q5x42OgZKzWx438jyPqv
 50YYdWI5P9i3jTeE/ht9WH+Du4HYCOjket4bJVzYGhyhoNEZd12cNZLjvl+uEUTO6Le3
 XtoQ==
X-Gm-Message-State: AOJu0YwoG0VdllSfILeSmifmR5Skcvmq6X2DZTU3q1kT3fmu0DPYM8zS
 OlJZj5vGKmnqW63M+eKi/mtEUVI1M6cqMHsKfh118F6JUr8C1oTRRUiXhyw3gn+4r88gaKni60K
 VEJUg8ic=
X-Gm-Gg: ASbGnctLsu75y/OFUjMYOBQqEnTh0cd0LNg4aP3pKOnt8AeIQwwjoPi/JxPAP/58OAd
 9VJCIY0UTYAbg+0SU9iW2yVJ42XnnWM+UHDhD4WsEZChdRcQlWSSnUpl0CyCGnV5sX7cYnVXQ/O
 hU9Qo9qwCGr6EvqFowKUNHyAaUdeWqLTUJwbETS6lmXEINhmaeKCDWZdllWRSrGSeNSUo+XIS8h
 GvmXy/tWBZklbF+VGCEy6X6+pjWwB1bhzZin+i+zSP4/I/+gGOMx1K2sKiSgvC2x7VGteHM05Fr
 /e8ysJn98xjmWYBz7lIy1xQr0SxyFK4kQxnsnctosYHfiT29Wk7vZyW5zbHXv9g=
X-Google-Smtp-Source: AGHT+IHqREPh7AgXjfA6IXmIGMKjaqzIuR7Bkpsrf8ZMR3l9Yyj6mQAGh8WhsY66EA4sN03BoQKaaw==
X-Received: by 2002:a05:6000:4807:b0:3a6:d579:ec21 with SMTP id
 ffacd0b85a97d-3b1fe5beeeemr4715773f8f.12.1751524197700; 
 Wed, 02 Jul 2025 23:29:57 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fab15sm17997619f8f.33.2025.07.02.23.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 23:29:56 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8EDE35F8AE;
 Thu, 03 Jul 2025 07:29:55 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org,  Joseph Kogut <joseph.kogut@gmail.com>,  Romain
 Naour <romain.naour@gmail.com>,  Daniel Lang <dalang@gmx.at>,  Valentin
 Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <7ee26828-4b3d-4942-8c30-8293455c59fc@smile.fr> (Romain Naour's
 message of "Thu, 3 Jul 2025 00:37:07 +0200")
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-4-alex.bennee@linaro.org>
 <7ee26828-4b3d-4942-8c30-8293455c59fc@smile.fr>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Thu, 03 Jul 2025 07:29:55 +0100
Message-ID: <87wm8pdbx8.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751524198; x=1752128998; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jSCo65K8ZcNBl514FotT132PsgjsJysjohsmd+MoNE0=;
 b=P+RE65onqe8pDcPxb7E0eP6/pGZ6hHn4PCJq3e4i3nDnXSXV7CkTapFLRgP/lS0RyJ
 eroKKve9RPZjpA+ym+Y/c3yj//XG2b/36Kt056UwwZ9x5VIgG6EirzS5eZbrCJnkq3cZ
 AN8rUHzYiG05Lvryfi48RKbAEhpXllNslnTBB1xLDh4lzYqG4f50tzEIJbqWushmX+Fj
 IjPlt9qAmPY73qBqSo2fRUBGJFl4uk680nh8tg2I+jbIkSYrg4SFDk0ExUilmIMBpaDR
 WDRrkkDMangiO9i/GXfTqjDCtlBStfLqEcHnqH5BkEc0pvrWVJnqz5Q4xcewvmCRBkc3
 JyMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P+RE65on
Subject: Re: [Buildroot] [RFC PATCH 3/3] package/llvm-project: reduce the
 build size of llvm
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyaXRlczoKCj4gSGVsbG8gQWxl
eCwgQWxsLAo+Cj4gTGUgMjYvMDYvMjAyNSDDoCAxMzoxNiwgQWxleCBCZW5uw6llIGEgw6ljcml0
wqA6Cj4+IEFsdGhvdWdoIHdlIHJlcXVlc3QgYSBSZWxlYXNlIGJ1aWxkIHRoZSBkZWZhdWx0IENN
QUtFIGZsYWdzIGluCj4+IHRvb2xjaGFpbi5jbWFrZSBpbmNsdWRlIC1PZyAtZzMgd2hpY2ggZW5h
YmxlcyBkZWJ1ZyBzeW1ib2xzIGZvciB0aGUKPj4gYnVpbGQgaW5mbGF0aW5nIHRoZSBvdmVyYWxs
IHNpemUgb2YgdGhpbmdzLgo+Cj4gQnkgZGVmYXVsdCwgLU8yIC1nMCBpcyB1c2VkIGJ5IEJ1aWxk
cm9vdC4gSWYgeW91IGhhdmUgLU9nIC1nMyBpbiB0b29sY2hhaW4uY21ha2UKPiBnZW5lcmF0ZWQg
YnkgQnVpbGRyb290LCBpdCBtZWFucyB0aGF0IEJSMl9FTkFCTEVfREVCVUcsIEJSMl9ERUJVR18z
IGFuZAo+IEJSMl9PUFRJTUlaRV9HIGhhdmUgYmVlbiBzZWxlY3RlZCBpbiB0aGUgQnVpbGRyb290
IGNvbmZpZ3VyYXRpb24gKGJ5Cj4gdGhlIHVzZXIpLgoKQWhoIHllcyAtIEkgZGlkbid0IHJlYWxp
c2UgdGhlcmUgd2FzIGEgZ2xvYmFsIGRlYnVnIHNldHRpbmcgdGhhdCB3YXMgb24KaW4gbXkgY29u
ZmlnLiBJJ2xsIHJlLXRlc3Qgd2l0aG91dCB0aGUgcGF0Y2hlcyBhbmQgY2hlY2sgdGhlIGJ1aWxk
IHNpemUuCgo+Cj4+IAo+PiBGb3Igbm93IGp1c3QgY29weSB0aG9zZSBkZWZhdWx0cyBpbnRvIHRo
ZSBwcm9qZWN0IG1rIGZpbGUgYW5kIGRyb3AgdGhlCj4+IC1PZyBhbmQgLWczIGxpbmVzLiBUaGlz
IGRyb3BzIHRoZSBzaXplIG9mIHRoZSBsbHZtIGJ1aWxkIGRpcmVjdG9yeSBvbgo+PiBteSBhcm02
NCBidWlsZCBmcm9tIDE3R2IgdG8gYSBtb3JlIHJlYXNvbmFibGUgNC40R2IuCj4+IAo+PiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Cj4+IC0tLQo+
PiAgcGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rIHwgMTAgKysrKysrKysrKwo+PiAg
MSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPj4gCj4+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZt
L2xsdm0ubWsKPj4gaW5kZXggNzhhYTZmZTQ2Ny4uMDM2ODQwODRjNCAxMDA2NDQKPj4gLS0tIGEv
cGFja2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rCj4+ICsrKyBiL3BhY2thZ2UvbGx2bS1w
cm9qZWN0L2xsdm0vbGx2bS5tawo+PiBAQCAtMTY3LDYgKzE2NywxNiBAQCBMTFZNX0NPTkZfT1BU
UyArPSAtRExMVk1fSEFWRV9URkxJVEU9IiIKPj4gIEhPU1RfTExWTV9DT05GX09QVFMgKz0gLURD
TUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgLUcgTmluamEKPj4gIExMVk1fQ09ORl9PUFRTICs9IC1E
Q01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4+ICAKPj4gKyMgUmVkdWNlIHRoZSBv
cHBvcnR1bml0eSBmb3IgZGVmYXVsdCBbQ3xDWFhdX0ZMQUdTIHRvIGZhdHRlbiB0aGUgYnVpbGQK
Pj4gK0hPU1RfTExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VOQUJMRV9BU1NFUlRJT05TPU9GRgo+
PiArTExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VOQUJMRV9BU1NFUlRJT05TPU9GRgo+PiAKPiBM
TFZNX0VOQUJMRV9BU1NFUlRJT05TIGlzIE9GRiBieSBkZWZhdWx0IGV4ZXB0IGZvciBkZWJ1ZyBi
dWlsZHMuCj4KPiArCj4+ICtIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ19GTEFHUz0i
LURfTEFSR0VGSUxFX1NPVVJDRSAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgLURfRklMRV9PRkZTRVRf
QklUUz02NCAtRF9GT1JUSUZZX1NPVVJDRT0xIgo+PiArTExWTV9DT05GX09QVFMgKz0gLURDTUFL
RV9DX0ZMQUdTPSItRF9MQVJHRUZJTEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9G
SUxFX09GRlNFVF9CSVRTPTY0IC1EX0ZPUlRJRllfU09VUkNFPTEiCj4+ICsKPj4gK0hPU1RfTExW
TV9DT05GX09QVFMgKz0gLURDTUFLRV9DWFhfRkxBR1M9Ii1EX0xBUkdFRklMRV9TT1VSQ0UgLURf
TEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfRk9SVElGWV9TT1VS
Q0U9MSIKPj4gK0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX0ZMQUdTPSItRF9MQVJHRUZJ
TEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1E
X0ZPUlRJRllfU09VUkNFPTEiCj4KPiBJJ20gbm90IHN1cmUgYWJvdXQgdGhpcyBjaGFuZ2UsIHNp
bmNlIGl0IGFsc28gY2hhbmdlIGZvciBvdGhlciBCUjJfT1BUSU1JWkVfeAo+IG9wdGlvbnMgYW5k
IHdoZW4gQlIyX0VOQUJMRV9ERUJVRyBpcyBkaXNhYmxlZC4gV2Ugd2FudCB0byBrZWVwIHRoZSBv
cHRpbWl6YXRpb24KPiBsZXZlbCBzZWxlY3RlZCBieSB0aGUgdXNlci4KPgo+IFdoYXQgYWJvdXQg
c29tZXRoaW5nIGxpa2Uga2V4ZWMgcGFja2FnZSBbMV0gdG8gZm9yY2UgdGhlIG9wdGltaXphdGlv
biBsZXZlbCB0byBhCj4gbWluaW11bT8KPgo+IEkgcmVtZW1iZXIgKGJhY2sgaW4gMjAxOCkgbGx2
bSBjcmFzaGluZyB3aXRoIERlYnVnIGJ1aWxkIHR5cGUsIHRoYXQncyB3aHkgaXQncwo+IGZvcmNl
ZCB0byBSZWxlYXNlIHR5cGUgYnV0IHRoZSBkZWZhdWx0IGJ1aWxkIG9wdGlvbnMgd2VyZSB1c2Vk
ICgtTzIgLWcwKS4KPgo+IFsxXQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1
aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL3BhY2thZ2Uva2V4ZWMva2V4ZWMubWs/cmVmX3R5cGU9aGVh
ZHMjTDIzCj4KPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4KPgo+PiArCj4+ICAjIENvbXBpbGUg
bGx2bSB3aXRoIHRoZSBDKysxNCAoSVNPIEMrKyAyMDE0IHN0YW5kYXJkKS4KPj4gIEhPU1RfTExW
TV9DT05GX09QVFMgKz0gLURDTUFLRV9DWFhfU1RBTkRBUkQ9MTQKPj4gIExMVk1fQ09ORl9PUFRT
ICs9IC1EQ01BS0VfQ1hYX1NUQU5EQVJEPTE0CgotLSAKQWxleCBCZW5uw6llClZpcnR1YWxpc2F0
aW9uIFRlY2ggTGVhZCBAIExpbmFybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
