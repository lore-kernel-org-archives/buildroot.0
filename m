Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D637C83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 16:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D780E80E6D;
	Sun,  6 Jul 2025 16:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYoox--ZGTrO; Sun,  6 Jul 2025 16:03:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CDC4880E79
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CDC4880E79;
	Sun,  6 Jul 2025 16:03:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7919115F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F9E840068
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:03:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kiChG9SAA5jg for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 16:03:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2F9754005F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F9754005F
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F9754005F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 16:03:00 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so2146172f8f.2
 for <buildroot@buildroot.org>; Sun, 06 Jul 2025 09:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751817779; x=1752422579;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1FQJQKexIyMIORLkqiFMZMndpn5pyPXgNS6j1aHuVQA=;
 b=Ac0bxCITbg+9gN44J5EnnRfcX0hc5ZoFHS1BUifOjy28fw2wJFcvpnvyh/XQYbFBOt
 dUzNmixMFSmeZO7ufExgH0S9IpNr82/UPxyyZFKvx5+bCdNVwTkqAstHmT6eKRRlDl2D
 G4808KObclNP7rZTjj0RR45zdjD3Oh15x1UgZCW4Ec8HtaM6DbynCdX8LA/qVuL5d76d
 Hk4/3EeIkyt3PN8UAocczGoIpVnmpZ52Qg8q4YMHs6DdZVp2TsIYAxAKMflFVJlcypQj
 58R8r4abE8ppy7LMZSIDMoJSD3+a3olFZK1upImf3KVD/TBp6B2mpX+UGPA03fETVD+g
 hnLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3M9X4M0gxEREuCuL1ii6Vr64rHXwPVAVyh7NgTQGDUQzSutxgOWVkXpOadsfBbi8VPL1djQ5RIM0=@buildroot.org
X-Gm-Message-State: AOJu0YzN9T/9vlFAIAqzxBuFVhSNA3Q5xK88MS67WWrH8HpXeSc/FJz9
 JHnKhR3ZE8ztRR5m2ZAXBGOurp3vOTg+gBAe54RpNOpwMS6heM3yr4FpkF9vKt3ZAnw=
X-Gm-Gg: ASbGnctLWEYlZG216dC2UdXoAIFpPqfuEPo3+HchWQQwSVq5s3UWeob6bkjQizBFYWX
 DNcs/1C+vCt1hu/JfF9GsIUCtrnH84RXW/aflyB5ncdBRr7XRxuPJUJIipy4SO+OEBH6+du0QOM
 4SqeDTYHWtZVYWtSzIGVWpCgrLk3loBObFAO/TwrZdFcbkbfWz0wHQo1+xUBP1KC+eNXobcGTc7
 j9U7Rl27ek+MRC36jEVlbyQ4hrDaCb76kNv4O1qqcYyAaTYEuxmi8KYTgXFXQ2yY1xSaE2BX2H3
 wvXzFzpbIwtEGyxhxmVg+rSkKuKCxCel8NffjFAfbA9VBAlpr2Aq3Tn0bsCMrpVO6mZSaV4Y0/W
 FeHpuo7qB7KHsTMsYRKJ4JVwDFKbC2Vb2nLOM2nOXOe0tsJDQBaERCgN2OPaQUOPVU0JWVgOqne
 /RfhWYwfWhG5bvP9tuCWUs6emL
X-Google-Smtp-Source: AGHT+IF4qDjLjc2fp3ZRFnoAEzJR5iH+IaCOKajqBcPHCVcVN8fml+qNGIZdXkkBBlq4EQu6kAE1qw==
X-Received: by 2002:a05:6000:4708:b0:3a9:dc5:df15 with SMTP id
 ffacd0b85a97d-3b497008ef4mr6734785f8f.13.1751817779007; 
 Sun, 06 Jul 2025 09:02:59 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b161e8dbsm86603565e9.5.2025.07.06.09.02.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Jul 2025 09:02:58 -0700 (PDT)
Message-ID: <22d20570-ae77-4945-8450-079cc504f14c@smile.fr>
Date: Sun, 6 Jul 2025 18:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Buildroot development <buildroot@buildroot.org>
Cc: Simon Dawson <spdawson@gmail.com>
References: <25376ee6-fd6a-4b7c-9aef-905b6f71b316@grenoble.cnrs.fr>
Content-Language: fr
In-Reply-To: <25376ee6-fd6a-4b7c-9aef-905b6f71b316@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751817779; x=1752422579; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1FQJQKexIyMIORLkqiFMZMndpn5pyPXgNS6j1aHuVQA=;
 b=3D423+BtqF1mf9RVO6lysuGuRSnw+BSeouBoDoVKRbmoVJVY5aVFkkNNerwGOMd0H6
 N4RXBM7b09miTdPZ6foK5+FBkoexJQaHKcwdYeOccX0ES5V+btZJQZz3FvEtchINhBWu
 sy2yff+0Gra+Z2C0O2IlZyUTvLJHqam/j6Oi0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=3D423+Bt
Subject: Re: [Buildroot] [PATCH 1/1] boot/at91bootstrap3: fix build with
 host GCC 15
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

SGVsbG8gRWRnYXIsCgpMZSAwMi8wNy8yMDI1IMOgIDEyOjE1LCBFZGdhciBCb25ldCB2aWEgYnVp
bGRyb290IGEgw6ljcml0wqA6Cj4gQnVpbGRpbmcgYXQ5MWJvb3RzdHJhcDMgd2l0aCBHQ0MxNSBm
YWlscyB3aXRoOgo+IAo+ICAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9yOiDigJhib29s
4oCZIGNhbm5vdCBiZSBkZWZpbmVkIHZpYSDigJh0eXBlZGVm4oCZCj4gICAgICAgIDIzIHwgdHlw
ZWRlZiB1bnNpZ25lZCBjaGFyIGJvb2w7Cj4gICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn4KPiAgICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDigJhib29s4oCZIGlz
IGEga2V5d29yZCB3aXRoIOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKPiAKPiBUaGlzIGlzIGR1ZSB0
byBHQ0MgMTUgZGVmYXVsdGluZyB0byB0aGUgQzIzIGxhbmd1YWdlIGRpYWxlY3QuCj4gCj4gU2ln
bmVkLW9mZi1ieTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+Cj4gLS0tCj4g
Cj4gVGVzdGVkIG9uIGFuIEFjbWVzeXN0ZW1zIEFjcXVhIGJvYXJkLgo+IAo+IEFsc28gYnVpbGQt
dGVzdGVkIHdpdGggYSAyw5cyw5cyIHRlc3QgbWF0cml4Ogo+ICAtIEdDQyB2ZXJzaW9uOiAgICAg
ICAgMTQsIDE1Cj4gIC0gcGF0Y2ggaW5jbHVkZWQ6ICAgICBubywgeWVzCj4gIC0gYm9vdGxvYWRl
ciB2ZXJzaW9uOiB2My4xMC4zLCB2NC4wLjAKPiBhcyBleHBlY3RlZCwgYWxsIHRlc3RzIHBhc3Nl
ZCBzYXZlIGZvciB0aG9zZSB3aXRoIEdDQyAxNSB3aXRob3V0IHRoZSBwYXRjaC4KPiAKPiAgLi4u
Y29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoIHwgNDcgKysrKysrKysr
KysrKysrKysrKwo+ICAuLi5jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0
Y2ggfCA0NiArKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5MyBpbnNlcnRp
b25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L2F0OTFib290c3RyYXAzL3YzLjEwLjMv
MDAwMS1pbmNsdWRlLXR5cGVzLmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQt
LnBhdGNoCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBib290L2F0OTFib290c3RyYXAzL3Y0LjAuMC8w
MDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0u
cGF0Y2gKPiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC4zLzAwMDEt
aW5jbHVkZS10eXBlcy5oLWNvbmRpdGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRj
aCBiL2Jvb3QvYXQ5MWJvb3RzdHJhcDMvdjMuMTAuMy8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25k
aXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLmQ0ZTM3YTg2ZjYKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvYm9vdC9hdDkxYm9vdHN0cmFwMy92My4xMC4zLzAwMDEtaW5jbHVkZS10eXBlcy5oLWNvbmRp
dGlvbmFsbHktZGVmaW5lLWJvb2wtZmFsc2UtYW5kLS5wYXRjaAo+IEBAIC0wLDAgKzEsNDcgQEAK
PiArRnJvbSA5MDhjNjU2Nzg4Njc1NjVhOTM0ZWE1YTk2N2JmZTdlMjA0ZDFjY2FmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQo+ICtGcm9tOiBFZGdhciBCb25ldCA8Ym9uZXRAZ3Jlbm9ibGUuY25y
cy5mcj4KPiArRGF0ZTogV2VkLCAyNSBKdW4gMjAyNSAxMToxMzo0MyArMDIwMAo+ICtTdWJqZWN0
OiBbUEFUQ0hdIGluY2x1ZGUvdHlwZXMuaDogY29uZGl0aW9uYWxseSBkZWZpbmUgYm9vbCwgZmFs
c2UgYW5kIHRydWUKPiArTUlNRS1WZXJzaW9uOiAxLjAKPiArQ29udGVudC1UeXBlOiB0ZXh0L3Bs
YWluOyBjaGFyc2V0PVVURi04Cj4gK0NvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKPiAr
Cj4gK2luY2x1ZGUvdHlwZXMuaCB0eXBlZGVmcyDigJhib29s4oCZIGFuZCBtYWNyby1kZWZpbmVz
IOKAmGZhbHNl4oCZIGFuZCDigJh0cnVl4oCZLgo+ICtIb3dldmVyLCBzaW5jZSBDMjMsIHRoZXNl
IGFyZSBwcmVkZWZpbmUga2V5d29yZHMuIEFzIEMyMyBpcyB0aGUgZGVmYXVsdAo+ICtDIGRpYWxl
Y3QgZm9yIEdDQyAxNSwgYnVpbGRpbmcgd2l0aCB0aGlzIGNvbXBpbGVyIGZhaWxzIHdpdGg6Cj4g
Kwo+ICsgICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBlcnJvcjog4oCYYm9vbOKAmSBjYW5ub3Qg
YmUgZGVmaW5lZCB2aWEg4oCYdHlwZWRlZuKAmQo+ICsgICAgICAgMjMgfCB0eXBlZGVmIHVuc2ln
bmVkIGNoYXIgYm9vbDsKPiArICAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgIF5+fn4K
PiArICAgIGluY2x1ZGUvdHlwZXMuaDoyMzoyMzogbm90ZTog4oCYYm9vbOKAmSBpcyBhIGtleXdv
cmQgd2l0aCDigJgtc3RkPWMyM+KAmSBvbndhcmRzCj4gKwo+ICtGaXggdGhpcyBidWlsZCBmYWls
dXJlIGJ5IG9ubHkgZGVmaW5pbmcg4oCYYm9vbOKAmSwg4oCYZmFsc2XigJkgYW5kIOKAmHRydWXi
gJkgb24gQwo+ICtkaWFsZWN0cyBvbGRlciB0aGFuIEMyMy4KPiArCj4gK1Vwc3RyZWFtOiBodHRw
czovL2dpdGh1Yi5jb20vbGludXg0c2FtL2F0OTFib290c3RyYXAvcHVsbC8xODgKPiArCj4gK1Np
Z25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgo+ICsoY2hl
cnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCA0YWFiNjBlNjM0ZDU4OGRmZmJkMzE1NGZkMGNmY2U3ODI3
MmI3NTBhKQoKVGhpcyBjb21taXQgaXMgbm90IHBhcnQgb2YgdGhlIGF0OTFib290c3RyYXAzIGdp
dCB0cmVlLiBEaWQgeW91IGJhY2twb3J0ZWQgeW91cgpwYXRjaCBmcm9tIHRoZSBQUiAodjQuMC4w
KSB0byB2My4xMC4zPwpNYXliZSBqdXN0IGFkZCBhIGNvbW1lbnQgW0VkZ2FyOiBiYWNrcG9ydCB0
byB2My4xMC4zXSBzaW5jZSB0aGlzIGhhcyBpcyBub3QKc3RhYmxlIHlldCB1bnRpbCBpdCBtZXJn
ZWQuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gKy0tLQo+ICsgaW5jbHVkZS90eXBlcy5oIHwg
MyArKysKPiArIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1n
aXQgYS9pbmNsdWRlL3R5cGVzLmggYi9pbmNsdWRlL3R5cGVzLmgKPiAraW5kZXggMTI0NmE0ZGYu
LjJjMWE0MWNmIDEwMDY0NAo+ICstLS0gYS9pbmNsdWRlL3R5cGVzLmgKPiArKysrIGIvaW5jbHVk
ZS90eXBlcy5oCj4gK0BAIC00Miw4ICs0MiwxMSBAQCB0eXBlZGVmIHNpZ25lZCBsb25nIGxvbmcg
czY0Owo+ICsgdHlwZWRlZiB1bnNpZ25lZCBsb25nIHNpemVfdDsKPiArIHR5cGVkZWYgc2lnbmVk
IGxvbmcgc3NpemVfdDsKPiArIAo+ICsrLyogYm9vbCwgZmFsc2UgYW5kIHRydWUgYXJlIHByZWRl
ZmluZWQgc2luY2UgQzIzLiAqLwo+ICsrI2lmIF9fU1REQ19WRVJTSU9OX18gPCAyMDIzMTFMCj4g
KyB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgYm9vbDsKPiArICNkZWZpbmUgZmFsc2UJMFUKPiArICNk
ZWZpbmUgdHJ1ZQkxVQo+ICsrI2VuZGlmCj4gKyAKPiArICNlbmRpZiAvKiBUWVBFU19IXyAqLwo+
ICstLSAKPiArMi40My4wCj4gKwo+IGRpZmYgLS1naXQgYS9ib290L2F0OTFib290c3RyYXAzL3Y0
LjAuMC8wMDAxLWluY2x1ZGUtdHlwZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNl
LWFuZC0ucGF0Y2ggYi9ib290L2F0OTFib290c3RyYXAzL3Y0LjAuMC8wMDAxLWluY2x1ZGUtdHlw
ZXMuaC1jb25kaXRpb25hbGx5LWRlZmluZS1ib29sLWZhbHNlLWFuZC0ucGF0Y2gKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjc3MmE4MDg2OTAKPiAtLS0gL2Rldi9u
dWxsCj4gKysrIGIvYm9vdC9hdDkxYm9vdHN0cmFwMy92NC4wLjAvMDAwMS1pbmNsdWRlLXR5cGVz
LmgtY29uZGl0aW9uYWxseS1kZWZpbmUtYm9vbC1mYWxzZS1hbmQtLnBhdGNoCj4gQEAgLTAsMCAr
MSw0NiBAQAo+ICtGcm9tIDRhYWI2MGU2MzRkNTg4ZGZmYmQzMTU0ZmQwY2ZjZTc4MjcyYjc1MGEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IEVkZ2FyIEJvbmV0IDxib25ldEBncmVu
b2JsZS5jbnJzLmZyPgo+ICtEYXRlOiBXZWQsIDI1IEp1biAyMDI1IDExOjEzOjQzICswMjAwCj4g
K1N1YmplY3Q6IFtQQVRDSF0gaW5jbHVkZS90eXBlcy5oOiBjb25kaXRpb25hbGx5IGRlZmluZSBi
b29sLCBmYWxzZSBhbmQgdHJ1ZQo+ICtNSU1FLVZlcnNpb246IDEuMAo+ICtDb250ZW50LVR5cGU6
IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKPiArQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzog
OGJpdAo+ICsKPiAraW5jbHVkZS90eXBlcy5oIHR5cGVkZWZzIOKAmGJvb2zigJkgYW5kIG1hY3Jv
LWRlZmluZXMg4oCYZmFsc2XigJkgYW5kIOKAmHRydWXigJkuCj4gK0hvd2V2ZXIsIHNpbmNlIEMy
MywgdGhlc2UgYXJlIHByZWRlZmluZSBrZXl3b3Jkcy4gQXMgQzIzIGlzIHRoZSBkZWZhdWx0Cj4g
K0MgZGlhbGVjdCBmb3IgR0NDIDE1LCBidWlsZGluZyB3aXRoIHRoaXMgY29tcGlsZXIgZmFpbHMg
d2l0aDoKPiArCj4gKyAgICBpbmNsdWRlL3R5cGVzLmg6MjM6MjM6IGVycm9yOiDigJhib29s4oCZ
IGNhbm5vdCBiZSBkZWZpbmVkIHZpYSDigJh0eXBlZGVm4oCZCj4gKyAgICAgICAyMyB8IHR5cGVk
ZWYgdW5zaWduZWQgY2hhciBib29sOwo+ICsgICAgICAgICAgfCAgICAgICAgICAgICAgICAgICAg
ICAgXn5+fgo+ICsgICAgaW5jbHVkZS90eXBlcy5oOjIzOjIzOiBub3RlOiDigJhib29s4oCZIGlz
IGEga2V5d29yZCB3aXRoIOKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKPiArCj4gK0ZpeCB0aGlzIGJ1
aWxkIGZhaWx1cmUgYnkgb25seSBkZWZpbmluZyDigJhib29s4oCZLCDigJhmYWxzZeKAmSBhbmQg
4oCYdHJ1ZeKAmSBvbiBDCj4gK2RpYWxlY3RzIG9sZGVyIHRoYW4gQzIzLgo+ICsKPiArVXBzdHJl
YW06IGh0dHBzOi8vZ2l0aHViLmNvbS9saW51eDRzYW0vYXQ5MWJvb3RzdHJhcC9wdWxsLzE4OAo+
ICsKPiArU2lnbmVkLW9mZi1ieTogRWRnYXIgQm9uZXQgPGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+
Cj4gKy0tLQo+ICsgaW5jbHVkZS90eXBlcy5oIHwgMyArKysKPiArIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKykKPiArCj4gK2RpZmYgLS1naXQgYS9pbmNsdWRlL3R5cGVzLmggYi9pbmNs
dWRlL3R5cGVzLmgKPiAraW5kZXggOTUwYjFhNDYuLjBhZDlhZTYxIDEwMDY0NAo+ICstLS0gYS9p
bmNsdWRlL3R5cGVzLmgKPiArKysrIGIvaW5jbHVkZS90eXBlcy5oCj4gK0BAIC0yMCw4ICsyMCwx
MSBAQCB0eXBlZGVmIHNpZ25lZCBsb25nIGxvbmcgczY0Owo+ICsgdHlwZWRlZiB1bnNpZ25lZCBs
b25nIHNpemVfdDsKPiArIHR5cGVkZWYgc2lnbmVkIGxvbmcgc3NpemVfdDsKPiArIAo+ICsrLyog
Ym9vbCwgZmFsc2UgYW5kIHRydWUgYXJlIHByZWRlZmluZWQgc2luY2UgQzIzLiAqLwo+ICsrI2lm
IF9fU1REQ19WRVJTSU9OX18gPCAyMDIzMTFMCj4gKyB0eXBlZGVmIHVuc2lnbmVkIGNoYXIgYm9v
bDsKPiArICNkZWZpbmUgZmFsc2UJMFUKPiArICNkZWZpbmUgdHJ1ZQkxVQo+ICsrI2VuZGlmCj4g
KyAKPiArICNlbmRpZiAvKiBUWVBFU19IXyAqLwo+ICstLSAKPiArMi40My4wCj4gKwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
