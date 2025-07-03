Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DD6C83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 11:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C84C60D79;
	Thu,  3 Jul 2025 11:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LGbSMmsa6-hk; Thu,  3 Jul 2025 11:09:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FB9E60C1E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FB9E60C1E;
	Thu,  3 Jul 2025 11:09:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EBA4675
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D209960C1E
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:09:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id frnckHvAQCz0 for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 11:09:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F42260B51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F42260B51
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F42260B51
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 11:09:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a588da60dfso3444789f8f.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 04:09:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751540965; x=1752145765;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jkvFHhbTo7Mxma/v4+TUYjhKG+R2RvfCvaRglrsN1MU=;
 b=flFxH4k4sWXMt5PA9yhBzsVBNx+nQRLJXj+CxaGHwyD2Yw8I3kJnJ+1GhaQps/IXXA
 TfmXsw/kZL4AYbXH37ihEsxzL9jxengXRftS9Iq1Rwz0/+ExFAgqxj9ldHoq0py+hefM
 BzffXzFYGAmK+PyJeDZ2mGdMXWYpH12Mth0fuHneXeNNZljinXBsE+bPfedtt5O1PNQs
 7cyZkvLc6tvsGgnW8M6eraoNrUIgihExEGWsRN2Cpniff6ObQaveICHXlpEMzXWXLlhe
 yhwTwCInx0gadBRPtmZgVA6aobCldh12pLmlfp5BfEXtIYtCPYfyf7DmI0GLBqXBpIFk
 KZRw==
X-Gm-Message-State: AOJu0YzRCA+7TSGZXKw7e3oofxP8H6sW+9Ld1rH4ZNpIMTOfu95fmflr
 7giR9zuCy83PugG41Pvhyddmbx8BZEnQCyvo0E9omi+xif8ja8u9qwyg0DzbuPx/u9E=
X-Gm-Gg: ASbGnct3Lk/xKkYtBdARYxUuL4ifCyKmI3eeu9nFRlKCm5yDI2SLQJm1CmoFWQf9IJ4
 JZaM+kNiyqqSYa9sS9lxxWNt9/gt/bj2GC7KrgkqKgIqr5fIkn27w8tHnd2KlhqkmMDyYU3j4Zj
 saADVQCbs93EaXZpZwzmZY6t71zDS9FDaUQ0GN3GG2FRcFK8ufculEP/y/uTGUWJyiD1CJxGDHm
 TDYm1b0cE0ZvBKBLzoFT2U3GPqxWNP5dfEZXRzU7+dBHZ33gDbLO/v1MgwXkYyVAaSWTOWZ8yDG
 zHFb6xYv48TqnXjrV84fPZz5aIUnW5Af3uajAG+v3SXEVTZpZxjS+0cy2e2VQwKy8IwhREVU8DD
 iCiStOQDc7ohgdMkdMETecbXWm9Xrt+tgu8HOWFTdD2Ztn3ZeBw/3ENpwvUzZWaImdPQxStpMI3
 KCzWjGKDttfBMdKQj8ieaJum7i
X-Google-Smtp-Source: AGHT+IH56NrhJ/OIuwtypjoXPxp18z/39VqFLXNwORKwTlNU5QlGjRLmdFLZz702v4ihgE8fIxDNFg==
X-Received: by 2002:adf:b64e:0:b0:3a5:2d42:aa17 with SMTP id
 ffacd0b85a97d-3b32db890damr1622529f8f.31.1751540965352; 
 Thu, 03 Jul 2025 04:09:25 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c80b516sm17949036f8f.41.2025.07.03.04.09.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 04:09:25 -0700 (PDT)
Message-ID: <6d55950e-280c-46dc-9e4c-c24cf2387eb3@smile.fr>
Date: Thu, 3 Jul 2025 13:09:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Daniel Lang <dalang@gmx.at>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-4-alex.bennee@linaro.org>
 <7ee26828-4b3d-4942-8c30-8293455c59fc@smile.fr>
 <87qzyxdb8v.fsf@draig.linaro.org>
Content-Language: fr
In-Reply-To: <87qzyxdb8v.fsf@draig.linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751540965; x=1752145765; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jkvFHhbTo7Mxma/v4+TUYjhKG+R2RvfCvaRglrsN1MU=;
 b=nr5WoJVy18VVc9SzhNhutdzD6IuwHrI+8b7XgbvwtQZdCL/RoYvo4fU/4G885NiJOm
 mVvNwa3tWjvatR7nMal9xNAxwiDaanCIeDaqpOki2cDLw6X+CaNxTxaGQvBQutC3S1KW
 YRPuA7Bg05ft4Yinw/ETmd9/miC7cx/4SZHsI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=nr5WoJVy
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMDMvMDcvMjAyNSDDoCAwODo0NCwgQWxleCBCZW5uw6llIGEgw6ljcml0wqA6Cj4gUm9tYWlu
IE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+IHdyaXRlczoKPiAKPj4gSGVsbG8gQWxleCwg
QWxsLAo+Pgo+PiBMZSAyNi8wNi8yMDI1IMOgIDEzOjE2LCBBbGV4IEJlbm7DqWUgYSDDqWNyaXTC
oDoKPj4+IEFsdGhvdWdoIHdlIHJlcXVlc3QgYSBSZWxlYXNlIGJ1aWxkIHRoZSBkZWZhdWx0IENN
QUtFIGZsYWdzIGluCj4+PiB0b29sY2hhaW4uY21ha2UgaW5jbHVkZSAtT2cgLWczIHdoaWNoIGVu
YWJsZXMgZGVidWcgc3ltYm9scyBmb3IgdGhlCj4+PiBidWlsZCBpbmZsYXRpbmcgdGhlIG92ZXJh
bGwgc2l6ZSBvZiB0aGluZ3MuCj4+Cj4+IEJ5IGRlZmF1bHQsIC1PMiAtZzAgaXMgdXNlZCBieSBC
dWlsZHJvb3QuIElmIHlvdSBoYXZlIC1PZyAtZzMgaW4gdG9vbGNoYWluLmNtYWtlCj4+IGdlbmVy
YXRlZCBieSBCdWlsZHJvb3QsIGl0IG1lYW5zIHRoYXQgQlIyX0VOQUJMRV9ERUJVRywgQlIyX0RF
QlVHXzMgYW5kCj4+IEJSMl9PUFRJTUlaRV9HIGhhdmUgYmVlbiBzZWxlY3RlZCBpbiB0aGUgQnVp
bGRyb290IGNvbmZpZ3VyYXRpb24gKGJ5Cj4+IHRoZSB1c2VyKS4KPiAKPiBXaGVyZSBpcyB0aGUg
bG9naWMgdGhhdCBzZXRzIHRoaXM/IEJlY2F1c2U6Cj4gCj4gICDinpwgIGFnIERFQlVHIC5jb25m
aWcKPiAgIDE3OTpCUjJfVE9PTENIQUlOX0hBU19USFJFQURTX0RFQlVHPXkKPiAgIDMwNjojIEJS
Ml9FTkFCTEVfREVCVUcgaXMgbm90IHNldAo+ICAgMzA3OiMgQlIyX0VOQUJMRV9SVU5USU1FX0RF
QlVHIGlzIG5vdCBzZXQKPiAgIDQxNDY6IyBCUjJfUEFDS0FHRV9PUEVOUE9XRVJMSU5LX0RFQlVH
X0xFVkVMIGlzIG5vdCBzZXQKPiAKPiBCdXQ6Cj4gCj4gICDinpwgIGFnICJCdWlsZHJvb3QgQ0ZM
QUdTIiAuL2hvc3Qvc2hhcmUvYnVpbGRyb290L3Rvb2xjaGFpbmZpbGUuY21ha2UKPiAgIDU3OiAg
c2V0KENNQUtFX0NfRkxBR1MgIi1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09V
UkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLU9nIC1nMyAtRF9GT1JUSUZZX1NPVVJDRT0xIiBD
QUNIRSBTVFJJTkcgIkJ1aWxkcm9vdCBDRkxBR1MiKQoKSXQncyB3ZWlyZCBpbmRlZWQuIEkgaGFk
IHRvIHVzZSBCUjJfRU5BQkxFX0RFQlVHLCBCUjJfREVCVUdfMyBhbmQgQlIyX09QVElNSVpFX0cK
dG8gZ2V0IHRoZSBzYW1lIG9wdGltaXphdGlvbiBsZXZlbCB0aGFuIHlvdS4gT3RoZXJ3aXNlIC1P
MiAtZzAgaXMgdXNlZC4KCkNhbiB5b3Ugc2hhcmUgYSBCdWlsZHJvb3QgZGVmY29uZmlnIGFibGUg
dG8gcmVwcm9kdWNlIHRoaXMgaXNzdWU/CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4+Cj4+
Pgo+Pj4gRm9yIG5vdyBqdXN0IGNvcHkgdGhvc2UgZGVmYXVsdHMgaW50byB0aGUgcHJvamVjdCBt
ayBmaWxlIGFuZCBkcm9wIHRoZQo+Pj4gLU9nIGFuZCAtZzMgbGluZXMuIFRoaXMgZHJvcHMgdGhl
IHNpemUgb2YgdGhlIGxsdm0gYnVpbGQgZGlyZWN0b3J5IG9uCj4+PiBteSBhcm02NCBidWlsZCBm
cm9tIDE3R2IgdG8gYSBtb3JlIHJlYXNvbmFibGUgNC40R2IuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+Pj4gLS0tCj4+PiAgcGFj
a2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rIHwgMTAgKysrKysrKysrKwo+Pj4gIDEgZmls
ZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayBiL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2
bS5tawo+Pj4gaW5kZXggNzhhYTZmZTQ2Ny4uMDM2ODQwODRjNCAxMDA2NDQKPj4+IC0tLSBhL3Bh
Y2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tawo+Pj4gKysrIGIvcGFja2FnZS9sbHZtLXBy
b2plY3QvbGx2bS9sbHZtLm1rCj4+PiBAQCAtMTY3LDYgKzE2NywxNiBAQCBMTFZNX0NPTkZfT1BU
UyArPSAtRExMVk1fSEFWRV9URkxJVEU9IiIKPj4+ICBIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1E
Q01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4+PiAgTExWTV9DT05GX09QVFMgKz0g
LURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UgLUcgTmluamEKPj4+ICAKPj4+ICsjIFJlZHVjZSB0
aGUgb3Bwb3J0dW5pdHkgZm9yIGRlZmF1bHQgW0N8Q1hYXV9GTEFHUyB0byBmYXR0ZW4gdGhlIGJ1
aWxkCj4+PiArSE9TVF9MTFZNX0NPTkZfT1BUUyArPSAtRExMVk1fRU5BQkxFX0FTU0VSVElPTlM9
T0ZGCj4+PiArTExWTV9DT05GX09QVFMgKz0gLURMTFZNX0VOQUJMRV9BU1NFUlRJT05TPU9GRgo+
Pj4KPj4gTExWTV9FTkFCTEVfQVNTRVJUSU9OUyBpcyBPRkYgYnkgZGVmYXVsdCBleGVwdCBmb3Ig
ZGVidWcgYnVpbGRzLgo+Pgo+PiArCj4+PiArSE9TVF9MTFZNX0NPTkZfT1BUUyArPSAtRENNQUtF
X0NfRkxBR1M9Ii1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJ
TEVfT0ZGU0VUX0JJVFM9NjQgLURfRk9SVElGWV9TT1VSQ0U9MSIKPj4+ICtMTFZNX0NPTkZfT1BU
UyArPSAtRENNQUtFX0NfRkxBR1M9Ii1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRf
U09VUkNFIC1EX0ZJTEVfT0ZGU0VUX0JJVFM9NjQgLURfRk9SVElGWV9TT1VSQ0U9MSIKPj4+ICsK
Pj4+ICtIT1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX0ZMQUdTPSItRF9MQVJHRUZJ
TEVfU09VUkNFIC1EX0xBUkdFRklMRTY0X1NPVVJDRSAtRF9GSUxFX09GRlNFVF9CSVRTPTY0IC1E
X0ZPUlRJRllfU09VUkNFPTEiCj4+PiArTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9DWFhfRkxB
R1M9Ii1EX0xBUkdFRklMRV9TT1VSQ0UgLURfTEFSR0VGSUxFNjRfU09VUkNFIC1EX0ZJTEVfT0ZG
U0VUX0JJVFM9NjQgLURfRk9SVElGWV9TT1VSQ0U9MSIKPj4KPj4gSSdtIG5vdCBzdXJlIGFib3V0
IHRoaXMgY2hhbmdlLCBzaW5jZSBpdCBhbHNvIGNoYW5nZSBmb3Igb3RoZXIgQlIyX09QVElNSVpF
X3gKPj4gb3B0aW9ucyBhbmQgd2hlbiBCUjJfRU5BQkxFX0RFQlVHIGlzIGRpc2FibGVkLiBXZSB3
YW50IHRvIGtlZXAgdGhlIG9wdGltaXphdGlvbgo+PiBsZXZlbCBzZWxlY3RlZCBieSB0aGUgdXNl
ci4KPj4KPj4gV2hhdCBhYm91dCBzb21ldGhpbmcgbGlrZSBrZXhlYyBwYWNrYWdlIFsxXSB0byBm
b3JjZSB0aGUgb3B0aW1pemF0aW9uIGxldmVsIHRvIGEKPj4gbWluaW11bT8KPj4KPj4gSSByZW1l
bWJlciAoYmFjayBpbiAyMDE4KSBsbHZtIGNyYXNoaW5nIHdpdGggRGVidWcgYnVpbGQgdHlwZSwg
dGhhdCdzIHdoeSBpdCdzCj4+IGZvcmNlZCB0byBSZWxlYXNlIHR5cGUgYnV0IHRoZSBkZWZhdWx0
IGJ1aWxkIG9wdGlvbnMgd2VyZSB1c2VkICgtTzIgLWcwKS4KPj4KPj4gWzFdCj4+IGh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvbWFzdGVyL3BhY2thZ2Uv
a2V4ZWMva2V4ZWMubWs/cmVmX3R5cGU9aGVhZHMjTDIzCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4g
Um9tYWluCj4+Cj4+Cj4+PiArCj4+PiAgIyBDb21waWxlIGxsdm0gd2l0aCB0aGUgQysrMTQgKElT
TyBDKysgMjAxNCBzdGFuZGFyZCkuCj4+PiAgSE9TVF9MTFZNX0NPTkZfT1BUUyArPSAtRENNQUtF
X0NYWF9TVEFOREFSRD0xNAo+Pj4gIExMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQ1hYX1NUQU5E
QVJEPTE0Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
