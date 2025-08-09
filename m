Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66939C87FCF
	for <buildroot@archiver.kernel.org>; Sat,  9 Aug 2025 21:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 209C360DF8;
	Sat,  9 Aug 2025 21:53:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37EECyqsyk4z; Sat,  9 Aug 2025 21:53:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49231606C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49231606C6;
	Sat,  9 Aug 2025 21:53:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D35F41D3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B983940811
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A_pCr2y7_Dec for <buildroot@buildroot.org>;
 Sat,  9 Aug 2025 21:52:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9AE3D407A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AE3D407A3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9AE3D407A3
 for <buildroot@buildroot.org>; Sat,  9 Aug 2025 21:52:58 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so25552655e9.3
 for <buildroot@buildroot.org>; Sat, 09 Aug 2025 14:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754776376; x=1755381176;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ccK3VQfMh5G34YfOPPHjFfpW+wK9+lJq+hZPRKSOGfw=;
 b=vhrezT2x9OS+6mcCs4fuMzY5ZJhDjCg5A6WpDBwRpxp79t8IeAtzQ2dSLRxZeWDmg6
 TbSYMLOr38N0dd6eVcQAeCBoNRCHMhggX9Ui6+a1fW71uOo4o1QSrvmXJQTYzYxTxUBe
 Cxr9OGgqDTf8yiiKHdVqFRyOew9saeCBdPKDdyYLhLc3g7zZuzWOdYV8FdUV8D0+czR3
 q+BzIQBQB5PYyWK19p4tPMhm4IQ7RzY28T/NIHxhbymtqB6xuv255VPU3Ovsp0UQsB23
 wmftlSaFghNqPzKBrleLOyDvAKzKyKDSNF2ZFH02yg/sgHscOEJZd0tWANjYvz+n3eTq
 Rw1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsQo7KFj/Tub/CkLJdcDalgskvFHFLuMuEt4U+loCqOlu3oxujFZcn/gPB0ZRMLY1aXZmlFglouOA=@buildroot.org
X-Gm-Message-State: AOJu0Yy8BEODWNwtSV3qsm9g4aAcoj8KpqWhS9KRua2fxO96EZpoerS1
 hQOxJkEW662s+61kL+5P/x3l2VqpY3SCafgI8v/Lye+CVTXdg6GrWywklsI5SzNlKRg=
X-Gm-Gg: ASbGncvF5FP6LHCS5UZgb8Qqqv4YknGb0rGpHLI4YaLbvSOnLW72e1sfWKkNQMYCm4u
 YgEAKgzHNeKsiBtY8vRi8+z0leAPrvmKZmDGoa0I5oUf7JnlQxL4T3WWlXX0vgCa0BWVqAt1Sbe
 s8Q9FQqqFdgj4PBpuqMEA7/pjl+TjMOF2nDzUYsuojiuzXqqUW8xZhdGNh0dwjb/IYrfE3uEL2O
 wWFHv9mZ1d2ji4jArwCximZ94MjoeXBWP09NlpcpRa83kmbJWcMO9CUY6upxXIx7YXQFNnSJetQ
 rlBOFsUvdMjlty2j0vkL4MJWPLJHsMV60hm1TwVzeigV4mvj7QTSx5tSyaYqDUDKbCnrahMDgb6
 3yMnEEh0nPJ8JsUYvlvWtA1zOMtm29Dq47hw++XO1DLBCmz/kvN9gCGG8mN5pesVXvEtWVHKWWS
 ROfrB1ekh8P9Dp0ZBYtgfGhRvXkkVR1+oxTywkxK1qgqleq0P0RfJU3dhrX7lY
X-Google-Smtp-Source: AGHT+IEzlWGd11bNAAEm9gyB6LpdgFT0sfY9WC1LUfSzX7SRReD23cHermW4ic99TdiPTbZu4MydqQ==
X-Received: by 2002:a05:600c:4e94:b0:456:1752:2b43 with SMTP id
 5b1f17b1804b1-459f4f0f0d2mr50463035e9.21.1754776376583; 
 Sat, 09 Aug 2025 14:52:56 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5869cccsm210357975e9.17.2025.08.09.14.52.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Aug 2025 14:52:56 -0700 (PDT)
Message-ID: <bb6b38a0-ef8b-4e52-8934-7813994da85e@smile.fr>
Date: Sat, 9 Aug 2025 23:52:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Bonnefille <thomas.bonnefille@bootlin.com>, buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?Q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>,
 Wade Berrier <wberrier@gmail.com>, Florian Weimer <fweimer@redhat.com>
References: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
Content-Language: fr, en-US
In-Reply-To: <20250802-fix_ngrep-v1-1-03dbe4c6b0ce@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754776376; x=1755381176; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ccK3VQfMh5G34YfOPPHjFfpW+wK9+lJq+hZPRKSOGfw=;
 b=J8a0AANlsuiBxxhbb8idyHDwoYDiDiB/EhoxWl76mC842rnejZ0m+KG1W91QXI7Rov
 rqJmw4JSyZq9Cesf0BAQHad6Kvo9K9CfjHm+m8zNLXPqR06GmvNVdimiM3XBDuYlyAdY
 Cks6ZCjr+08a/UcPt3wiMOdFknjgTN4W5r/jY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=J8a0AANl
Subject: Re: [Buildroot] [PATCH] package/ngrep: fix implicit function
 declaration
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAwMi8wOC8yMDI1IMOgIDEzOjM3LCBUaG9tYXMgQm9ubmVm
aWxsZSB2aWEgYnVpbGRyb290IGEgw6ljcml0wqA6Cj4gRml4ZXM6IGh0dHBzOi8vYXV0b2J1aWxk
LmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8yMGIvMjBiOTI0YzVjOTZiM2Y0M2UzODFkODdlNTlmYjE2
MGJhOGQzZGNkMC8vCgpQbGVhc2UsIGNhbiB5b3UgcHJvdmlkZSB5b3VyIGFuYWx5c2lzIG9uIHRo
aXMgaXNzdWU/CgpGcm9tIHRoZSBwYXRjaCwgSSB1bmRlcnN0YW5kIHRoYXQgaXQncyBhbiBlcnJv
ciBnZW5lcmF0ZWQgYnkgZ2NjLTE0IChhbiBuZXdlcikuCkJ1dCBuZ3JlcCBwYWNrYWdlIGZhaWwg
dG8gYnVpbGQgb25seSB3aGVuIEJSMl9QQUNLQUdFX0xJQk5FVCBpcyBzZWxlY3RlZC4KCkkgdXBk
YXRlZCB0aGUgY29tbWl0IGxvZyB3aXRoIGEgZGVmY29uZmlnIGFuZCB0aGUgbWluaW1hbCBnY2Mg
dmVyc2lvbiB0bwpyZXByb2R1Y2UgdGhlIGlzc3VlLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBCb25uZWZpbGxlIDx0aG9tYXMuYm9ubmVmaWxsZUBi
b290bGluLmNvbT4KPiAtLS0KPiBUaGlzIHBhdGNoIGNhbiBiZSBiYWNrcG9ydGVkIHRvIDIwMjUu
MDIueCBhcyB0aGlzIGlzc3VlIGlzIHJlcHJvZHVjaWJsZQo+IG9uIHRoZSBjdXJyZW50IHZlcnNp
b24gb2YgdGhlIExUUy4KPiAtLS0KPiAgLi4uLmgtYW5kLXRjcGtpbGwuaC10by1hdm9pZC1pbXBs
aWNpdC1mdW5jdGkucGF0Y2ggfCA0NCArKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmdyZXAv
MDAwNi1JbmNsdWRlLWVyci5oLWFuZC10Y3BraWxsLmgtdG8tYXZvaWQtaW1wbGljaXQtZnVuY3Rp
LnBhdGNoIGIvcGFja2FnZS9uZ3JlcC8wMDA2LUluY2x1ZGUtZXJyLmgtYW5kLXRjcGtpbGwuaC10
by1hdm9pZC1pbXBsaWNpdC1mdW5jdGkucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjZkNTk2YmZlMzc5
MWEzMzk5NDE3OTQ5NGU4YzA4ZWM3YTk0Mzk5NzUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFj
a2FnZS9uZ3JlcC8wMDA2LUluY2x1ZGUtZXJyLmgtYW5kLXRjcGtpbGwuaC10by1hdm9pZC1pbXBs
aWNpdC1mdW5jdGkucGF0Y2gKPiBAQCAtMCwwICsxLDQ0IEBACj4gK0Zyb20gNTI1MTViYWUzNzdm
MjIxYjU0NzNkOTA0MGY1ZjQzYWIxYzY3MjY3MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAr
RnJvbTogRmxvcmlhbiBXZWltZXIgPGZ3ZWltZXJAcmVkaGF0LmNvbT4KPiArRGF0ZTogTW9uLCAx
OSBEZWMgMjAyMiAxMTo0OTowNiArMDEwMAo+ICtTdWJqZWN0OiBbUEFUQ0hdIEluY2x1ZGUgPGVy
ci5oPiBhbmQgInRjcGtpbGwuaCIgdG8gYXZvaWQgaW1wbGljaXQgZnVuY3Rpb24KPiArIGRlY2xh
cmF0aW9ucwo+ICsKPiArSW1wbGljaXQgZnVuY3Rpb24gZGVjbGFyYXRpb25zIGFyZSBhIGhpc3Rv
cmljIGxhbmd1YWdlIGZlYXR1cmUgdGhhdAo+ICt3ZXJlIHJlbW92ZWQgZnJvbSBDIGluIDE5OTku
Cj4gKwo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2pwcjUvbmdyZXAvcHVsbC8yOAo+
ICsKPiArU2lnbmVkLW9mZi1ieTogVGhvbWFzIEJvbm5lZmlsbGUgPHRob21hcy5ib25uZWZpbGxl
QGJvb3RsaW4uY29tPgo+ICstLS0KPiArIG5ncmVwLmMgICB8IDEgKwo+ICsgdGNwa2lsbC5jIHwg
MSArCj4gKyAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ICsKPiArZGlmZiAtLWdp
dCBhL25ncmVwLmMgYi9uZ3JlcC5jCj4gK2luZGV4IDNkZjkzODkuLmIyZmNjZWIgMTAwNjQ0Cj4g
Ky0tLSBhL25ncmVwLmMKPiArKysrIGIvbmdyZXAuYwo+ICtAQCAtOTgsNiArOTgsNyBAQAo+ICsg
I2VuZGlmCj4gKyAKPiArICNpbmNsdWRlICJuZ3JlcC5oIgo+ICsrI2luY2x1ZGUgInRjcGtpbGwu
aCIKPiArIAo+ICsgCj4gKyAvKgo+ICtkaWZmIC0tZ2l0IGEvdGNwa2lsbC5jIGIvdGNwa2lsbC5j
Cj4gK2luZGV4IDUzODhlYzUuLmFjOGZkMmUgMTAwNjQ0Cj4gKy0tLSBhL3RjcGtpbGwuYwo+ICsr
KysgYi90Y3BraWxsLmMKPiArQEAgLTE0LDYgKzE0LDcgQEAKPiArICNpbmNsdWRlIDxzdGRsaWIu
aD4KPiArICNpbmNsdWRlIDx1bmlzdGQuaD4KPiArICNpbmNsdWRlIDxzdHJpbmcuaD4KPiArKyNp
bmNsdWRlIDxlcnIuaD4KPiArICNpbmNsdWRlIDxsaWJuZXQuaD4KPiArICNpbmNsdWRlIDxwY2Fw
Lmg+Cj4gKyAKPiArLS0gCj4gKzIuNTAuMQo+ICsKPiAKPiAtLS0KPiBiYXNlLWNvbW1pdDogZjUx
MDE2MzhiOWY5MTdkYzRjNTY5ODI4ZmYzZmVlMGM0ODZiYThmOAo+IGNoYW5nZS1pZDogMjAyNTA4
MDItZml4X25ncmVwLTU5YWI3NWJmNTkxOQo+IAo+IEJlc3QgcmVnYXJkcywKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
