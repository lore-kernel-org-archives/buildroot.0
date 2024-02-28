Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9839C47DD9
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:38:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 97B56400AB;
	Wed, 28 Feb 2024 21:38:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9Edl2BMaXbC; Wed, 28 Feb 2024 21:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3204B4026F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3204B4026F;
	Wed, 28 Feb 2024 21:38:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 31DAB1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F1B3826E5
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RgmtWBs0XOGY for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:38:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6400F826DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6400F826DF
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6400F826DF
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:38:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33d6bd39470so129012f8f.3
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 13:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709156309; x=1709761109;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PGLKAWIwcE4XylTCFQ6cFDRRHehZiNzGzU+BzRi2XuI=;
 b=lfFvLNF4aJI/VaHTfOI0NWrXoJwNyJcBb1UHiKVtZDXORJs/eiECfOk+w6oa/gmLTZ
 3JQWd25BtoHRcTEvNyYMJBHwR7Eq/9yd99dd6lg06A6RBD6KJ5hbYP+arYY5A1yXShX0
 74aINLooZSoa2FFWLkAe9l/3c1yDhNB2XC/HsJ/uL3hS2Qb2GnFxnyKL7Z9860wY0/xc
 fqymnDZh4gNZofhxF4AlAu3S4VRNpLTtUTfTuR1CVLh3OylZtcaXvSixfSUMPDtHyaKB
 74dhI4YqdGd/wIeHEnPzZzhYzWaGoEYWxA5BGFt4NWH7Wf4CPz4XeRgvEF3mFrQQF7tQ
 fkhw==
X-Gm-Message-State: AOJu0YzQUGiurPpFqyYfdR1N7nvZAIPSch/2DHmIRp4HeNHxuVmz76MS
 q2CxTv9T3TIBt+yqeoEzfX27yud5++7dsRFZns0QxKNZbL20qskB3/gKSaAsoiR+962zM3VSsdq
 F
X-Google-Smtp-Source: AGHT+IGY1nL/e8tUkEZUbIgAMcHNU7RsqW7oQdVNwPpuBLRlQ/ENIfgROJ9fOLinb6vjtIwwApZhkw==
X-Received: by 2002:adf:f884:0:b0:33e:c9b:396d with SMTP id
 u4-20020adff884000000b0033e0c9b396dmr57853wrp.8.1709156309025; 
 Wed, 28 Feb 2024 13:38:29 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o8-20020a056000010800b0033d202abf01sm15498866wrx.28.2024.02.28.13.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 13:38:28 -0800 (PST)
Message-ID: <7badbd15-343d-4ebb-80f7-e143ad6e5c47@smile.fr>
Date: Wed, 28 Feb 2024 22:38:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>
References: <20240227213517.241837-1-ju.o@free.fr>
 <90f5d326-0b04-495e-9b6d-d25ebfa59cb4@smile.fr>
 <f022f3c9135414a00bd69b5c1f41239d@free.fr>
Content-Language: en-US
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <f022f3c9135414a00bd69b5c1f41239d@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1709156309; x=1709761109;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PGLKAWIwcE4XylTCFQ6cFDRRHehZiNzGzU+BzRi2XuI=;
 b=xL6/Dt8YmRkJ3rQchfalI35p6sYmRgSip1+VkdWdL3UT+o5T1Ovx28XLZ35YBNqGI9
 l9DsFHUeiuAH1FT5g2S4BRK1P9HcLltBRjKDEYu4w3ddjWrwX0fACATUxSz9xvowJkTd
 AuF/hC9JGtLRZ3Lg7jSHN86758TnJHOOVN91WiLw+MvC1Zm97/VhZs2phHTRe4TPKtex
 Bk4vMttSqfgNtO3rX/7wOEVHughUzwdO15Vp2agVEsLUdpB5xxM7aaobzJya67N07AAH
 dWbb62OIukEbScVKjeGQuSMuKGsyhJL4M9wN4d1KP5gGXZL9abpsfDdiG+HyIvKXq4QX
 s3Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=xL6/Dt8Y
Subject: Re: [Buildroot] [PATCH 1/1] boot/syslinux: fix build with gnu-efi
 >= 3.0.16
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gSnVsaWVuLAoKTGUgMjgvMDIvMjAyNCDDoCAxOToyNywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBIaSBSb21haW4sCj4gCj4gT24gMjcvMDIvMjAyNCAyMzozMSwgUm9tYWluIE5h
b3VyIHdyb3RlOgo+PiBIaSBKdWxpZW4sCj4+Cj4+IExlIDI3LzAyLzIwMjQgw6AgMjI6MzUsIEp1
bGllbiBPbGl2YWluIGEgw6ljcml0wqA6Cj4+PiBDb21taXQgZmE5ODkzYWQ4ZiAicGFja2FnZS9n
bnUtZWZpOiBidW1wIHRvIHZlcnNpb24gMy4wLjE3IiB1cGRhdGVkCj4+PiBnbnUtZWZpLiBUaGlz
IHVwZGF0ZSBpbnRyb2R1Y2VkIHN5c2xpbnV4IGJ1aWxkIGZhaWx1cmUsIGFzIHJlcG9ydGVkCj4+
PiBpbiBbMV0uCj4+Pgo+Pj4gVGhpcyBjb21taXQgYWRkcyBhIHBhY2thZ2UgcGF0Y2ggdG8gZml4
IHRoaXMgaXNzdWUuIEZvciB0ZWNobmljYWwKPj4+IGRldGFpbHMgb2YgdGhlIGlzc3VlLCBzZWUg
dGhlIHBhY2thZ2UgcGF0Y2ggY29tbWl0IGxvZy4KPj4+Cj4+PiBGaXhlczoKPj4+IC0gaHR0cHM6
Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vam9icy82MjU2ODgwOTM3Cj4+
PiAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvNjI1
Njg4MDk0OQo+Pj4KPj4+IFsxXSBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWls
L2J1aWxkcm9vdC8yMDI0LUZlYnJ1YXJ5LzY4NTk3MS5odG1sCj4+Pgo+Pj4gU2lnbmVkLW9mZi1i
eTogSnVsaWVuIE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KPj4+IC0tLQo+Pj4gwqAuY2hlY2twYWNr
YWdlaWdub3JlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB8wqAgMSArCj4+PiDCoC4uLnN0ZGRlZi5oLWFkZC13Y2hhcl90LXR5cGUtZGVmaW5pdGlv
bi5wYXRjaCB8IDU4ICsrKysrKysrKysrKysrKysrKysKPj4+IMKgMiBmaWxlcyBjaGFuZ2VkLCA1
OSBpbnNlcnRpb25zKCspCj4+PiDCoGNyZWF0ZSBtb2RlIDEwMDY0NAo+Pj4gYm9vdC9zeXNsaW51
eC8wMDE5LXN0ZGRlZi5oLWFkZC13Y2hhcl90LXR5cGUtZGVmaW5pdGlvbi5wYXRjaAo+Pj4KPj4+
IGRpZmYgLS1naXQgYS8uY2hlY2twYWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+
Pj4gaW5kZXggYTZjYzU4YzQ0OGMuLmE5OGE1M2ZiZjM2IDEwMDY0NAo+Pj4gLS0tIGEvLmNoZWNr
cGFja2FnZWlnbm9yZQo+Pj4gKysrIGIvLmNoZWNrcGFja2FnZWlnbm9yZQo+Pj4gQEAgLTExOCw2
ICsxMTgsNyBAQAo+Pj4gYm9vdC9zeXNsaW51eC8wMDEzLUZpeC1idWlsZC13aXRoLWdudS1lZmkt
dmVyc2lvbi0zLjAuOS5wYXRjaCBVcHN0cmVhbQo+Pj4gwqAKPj4+IGJvb3Qvc3lzbGludXgvMDAx
NC1GaXgtYnVpbGQtd2l0aC1iaW51dGlscy1ub3RlLWdudS1wcm9wZXJ0eS1zZWN0aW9uLnBhdGNo
Cj4+PiBVcHN0cmVhbQo+Pj4gwqAKPj4+IGJvb3Qvc3lzbGludXgvMDAxNi1Xb3JrYXJvdW5kLW11
bHRpcGxlLWRlZmluaXRpb24tb2Ytc3ltYm9sLWVycm9ycy5wYXRjaAo+Pj4gVXBzdHJlYW0KPj4+
IMKgCj4+PiBib290L3N5c2xpbnV4LzAwMTctUmVwbGFjZS1idWlsdGluLXN0cmxlbi10aGF0LWFw
cGVhcnMtdG8tZ2V0LW9wdGltaXplZC5wYXRjaAo+Pj4gVXBzdHJlYW0KPj4+ICtib290L3N5c2xp
bnV4LzAwMTktc3RkZGVmLmgtYWRkLXdjaGFyX3QtdHlwZS1kZWZpbml0aW9uLnBhdGNoCj4+Cj4+
IFdlIHdhbnQgdG8gcmVtb3ZlIC5jaGVja3BhY2thZ2VpZ25vcmUgaW4gYSBub3QgdG9vIGZhciBm
dXR1cmUsIHBsZWFzZSBhZGQgYW4KPj4gdXBzdHJlYW0gc3RhdHVzIHRhZyBpbiB0aGUgcGF0Y2gg
MDAxOS1zdGRkZWYuaC1hZGQtd2NoYXJfdC10eXBlLWRlZmluaXRpb24ucGF0Y2gKPj4gaXRzZWxm
LiBFdmVuIGlmIHVwc3RyZWFtIGlzIG5vdCB2ZXJ5IGFjdGl2ZSAobGFzdCBjb21taXQgaXMgNSB5
ZWFycyBhZ28pLgo+IAo+IEkgc2VudCBhIHYyIGZpeGluZyB0aGF0Ogo+IGh0dHBzOi8vcGF0Y2h3
b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvcGF0Y2gvMjAyNDAyMjgxODE0MTEuMTAx
NzQtMS1qdS5vQGZyZWUuZnIvCj4gCj4gSSBpbml0aWFsbHkgc2V0IGFuIGV4Y2x1c2lvbiBiZWNh
dXNlIG15IHJlZ2lzdHJhdGlvbiB0byB0aGUgbGlzdCB3YXMgc2xvdy4gSQo+IGFsc28gbm90ZWQK
PiB0aGUgc29tZXdoYXQgc2xvdyBhY3Rpdml0eSBvZiB0aGUgcHJvamVjdC4gV2hhdCB3b3VsZCBi
ZSB5b3VyIHJlY29tbWVuZGF0aW9uIGZvcgo+IHRoZQo+ICJVcHN0cmVhbToiIHRhZywgaW4gdGhl
IGNhc2UgYSBwYXRjaCBkb2VzIGFwcGx5IHVwc3RyZWFtLCBidXQgdGhlIGZpcnN0IHRpbWUKPiBz
dWJtaXNzaW9uCj4gdGFrZXMgYSBiaXQgbG9uZ2VyP8KgIFNvbWV0aGluZyBsaWtlICJVcHN0cmVh
bTogQXBwbGljYWJsZSAoYnV0IG5vdCBwcm9wb3NlZCB5ZXQpIj8KClRoZSB0ZXh0IGFmdGVyIHRo
ZSAiVXBzdHJlYW06IiB0YWcgaXMgYSBmcmVlIGZvcm1hdCBpdCBzZWVtcy4KClVwc3RyZWFtOiBJ
J2xsIHNlbmQgaXQgdG8gdXBzdHJlYW0sIEkgcHJvbWlzZSA6KQoKTWF5YmUganVzdDoKClVwc3Ry
ZWFtOiA8dXJsIG9mIHRoZSBtYWlsaW5nIGxpc3Qgd2hlcmUgdGhlIHBhdGNoIHdpbGwgYXBwZWFy
LCB3YWl0aW5nIGZvcgpmaXJzdCB0aW1lIHN1Ym1pc3Npb24+CgpCZXN0IHJlZ2FyZHMsClJvbWFp
bgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IAo+IEp1bGllbi4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
