Return-Path: <SRS0=49zi=O7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F822C433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:08:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C50860F43
	for <buildroot@archiver.kernel.org>; Mon, 11 Oct 2021 21:08:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C50860F43
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBBF2404C8;
	Mon, 11 Oct 2021 21:08:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ptWyHJhNXa74; Mon, 11 Oct 2021 21:08:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 163A6404CB;
	Mon, 11 Oct 2021 21:08:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB241BF865
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:08:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 058C740467
 for <buildroot@lists.busybox.net>; Mon, 11 Oct 2021 21:08:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uyoKPSYUy4Kt for <buildroot@lists.busybox.net>;
 Mon, 11 Oct 2021 21:08:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB3E440425
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 21:08:01 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id z20so72495950edc.13
 for <buildroot@buildroot.org>; Mon, 11 Oct 2021 14:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7BYXeVqPWt7f+J4g/qRoinwmpR+SY85ppP0LrTarrtk=;
 b=hIE05zOl9sEf5xKNk/XaD9CdlYga0hqrepm5uNbNOX2FLZq0/uei0Ko3YRudEDRbpr
 tOTDP85O3rKMh6vEx/k19X8DZCFpOY6PKbDiPuV2QVVc8O62NHy7YDJ4rkaXehVKQuMB
 6Wzmna6Kl7ZVv+X4AosxAC1Qzx0jTpvFsg6gYnrJHv90H0jP0h9tw0GfddjcjN1oFp2L
 XotwIpIqFBHd9iCdTx90jbqpn5zcFKzoOWnOAvzOYJuI6kZ286mdpWPwb2yDaXamjIrN
 jTqWNyvY11MpOHxrfSZWQrr9qmMJbVzHiKHxGLXHHPyIh/PJNaVwmtMcHR+ODfvy7/b7
 VpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7BYXeVqPWt7f+J4g/qRoinwmpR+SY85ppP0LrTarrtk=;
 b=6oAjRcY8jWCMkiyesgqPEc4dCyG3ypnRRGDJZop9JAm4TarP00lqyTGVWXISPdf2cD
 md1ItZGyme74uoxuCWVhgRAz/pMFhBP0hzVhR3qrtBgOnRY8J04dhKBBVzKVWuRSru/r
 Xf5bcmkY+47c4Hx4EuguX4jExvGHIpYLkqzMFpL10ZfhlkQPw2elF5Mx5oqvt8RyDuhG
 MyTpK1E+VhmdR8cCcM0ly5iGNSyPBHgxXMi74M/YHELjlz7kqN5SkeFo1tAwmZ1UYtxD
 Pm6vViMaFIOH91UNxLNo9Mtq5cNvmR5jyxDu3DKxJ0+VBb4m4q7oifYymf7YFk7uCFV0
 8Tzw==
X-Gm-Message-State: AOAM533hbTLgvyS7tlPN93/CI8pp7cyfGq6gTCjoYxj6pzTPoEIkU7Sn
 LSF8xpZ0d26tZKPBD+OMhj/jgEoyX80EmbHx
X-Google-Smtp-Source: ABdhPJxTy6I2OKrqdsywpH8CtV95vNgVoXkGWMoaauAsG6QNtzD2Hf7fb3UFl70tWKZUQDCNYGKRHQ==
X-Received: by 2002:a05:6402:5114:: with SMTP id
 m20mr44788100edd.256.1633986480044; 
 Mon, 11 Oct 2021 14:08:00 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id zg6sm3949386ejb.102.2021.10.11.14.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Oct 2021 14:07:59 -0700 (PDT)
Message-ID: <e65eda0e-7321-1197-721d-27503ca5675d@mind.be>
Date: Mon, 11 Oct 2021 23:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Herve Codina <herve.codina@bootlin.com>, buildroot@buildroot.org
References: <20210928154218.2275184-1-herve.codina@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210928154218.2275184-1-herve.codina@bootlin.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/dtbocfg: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyOC8wOS8yMDIxIDE3OjQyLCBIZXJ2ZSBDb2RpbmEgd3JvdGU6Cj4gZHRib2NmZywgd2hp
Y2ggc3RhbmRzIGZvciBEZXZpY2UgVHJlZSBCbG9iIE92ZXJsYXkgQ29uZmlndXJhdGlvbgo+IEZp
bGUgU3lzdGVtLCB3YXMgZGV2ZWxvcGVkIHRvIHNlcnZlIGFzIGEgdXNlcnNwYWNlIEFQSSBvZiBE
ZXZpY2UKPiBUcmVlIE92ZXJsYXkuCj4gCj4gaHR0cHM6Ly9naXRodWIuY29tL2lrd3ptL2R0Ym9j
ZmcKPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZXJ2ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGlu
LmNvbT4KPiAtLS0KPiBDaGFuZ2VzIHYxIC0+IHYyOgo+ICAgIC0gRml4ZWQgaW5kZW50YXRpb24g
aW4gQ29uZmlnLmluIGZpbGUKPiAgICAtIEFkZGVkIHRlc3QgcGFydCB0byBteXNlbGYgaW4gREVW
RUxPUEVSUyBmaWxlCj4gICAgLSBSZW1vdmVkICd2JyBjaGFyIGZyb20gRFRCT0NGR19WRVJTSU9O
Cj4gCj4gICBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArKwo+ICAgcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
IDEgKwo+ICAgcGFja2FnZS9kdGJvY2ZnL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgIHwg
IDggKysrKwo+ICAgcGFja2FnZS9kdGJvY2ZnL2R0Ym9jZmcuaGFzaCAgICAgICAgICAgICAgICAg
IHwgIDMgKysKPiAgIHBhY2thZ2UvZHRib2NmZy9kdGJvY2ZnLm1rICAgICAgICAgICAgICAgICAg
ICB8IDE4ICsrKysrKysrKwo+ICAgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9k
dGJvY2ZnLnB5IHwgMzcgKysrKysrKysrKysrKysrKysrKwoKICBXaXRoIGEgdGVzdCEgTW9zdCBl
eGNlbGxlbnQhCgogIEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgogIFJlZ2FyZHMsCiAgQXJu
b3V0Cgo+ICAgNiBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUgbW9k
ZSAxMDA2NDQgcGFja2FnZS9kdGJvY2ZnL0NvbmZpZy5pbgo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UvZHRib2NmZy9kdGJvY2ZnLmhhc2gKPiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2R0Ym9jZmcvZHRib2NmZy5tawo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHN1cHBvcnQvdGVz
dGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZHRib2NmZy5weQo+IAo+IGRpZmYgLS1naXQgYS9ERVZF
TE9QRVJTIGIvREVWRUxPUEVSUwo+IGluZGV4IDFmOTc3MTkwYWIuLjNlMmVkYzFmM2MgMTAwNjQ0
Cj4gLS0tIGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTE0OCw2ICsxMTQ4
LDEwIEBAIEY6CXBhY2thZ2Uvc3lzcmVwby8KPiAgIE46CUhlbnJpcXVlIENhbWFyZ28gPGhlbnJp
cXVlQGhlbnJpcXVlY2FtYXJnby5jb20+Cj4gICBGOglwYWNrYWdlL2pzb24tZ2xpYi8KPiAgIAo+
ICtOOglIZXJ2w6kgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+Cj4gK0Y6CXBhY2th
Z2UvZHRib2NmZy8KPiArRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9kdGJv
Y2ZnLnB5Cj4gKwo+ICAgTjoJSGlyb3NoaSBLYXdhc2hpbWEgPGtlaS1rQGNhMi5zby1uZXQubmUu
anA+Cj4gICBGOglwYWNrYWdlL2dhdWNoZS8KPiAgIEY6CXBhY2thZ2UvZ21yZW5kZXItcmVzdXJy
ZWN0Lwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmlu
Cj4gaW5kZXggMmY4M2M4NzU4Mi4uMGNlMmY2NGQ4YSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL0Nv
bmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTQ2MCw2ICs0NjAsNyBAQCBl
bmRtZW51Cj4gICAJc291cmNlICJwYWNrYWdlL2RtaWRlY29kZS9Db25maWcuaW4iCj4gICAJc291
cmNlICJwYWNrYWdlL2RtcmFpZC9Db25maWcuaW4iCj4gICAJc291cmNlICJwYWNrYWdlL2R0LXV0
aWxzL0NvbmZpZy5pbiIKPiArCXNvdXJjZSAicGFja2FnZS9kdGJvY2ZnL0NvbmZpZy5pbiIKPiAg
IAlzb3VyY2UgInBhY2thZ2UvZHR2LXNjYW4tdGFibGVzL0NvbmZpZy5pbiIKPiAgIAlzb3VyY2Ug
InBhY2thZ2UvZHVtcDEwOTAvQ29uZmlnLmluIgo+ICAgCXNvdXJjZSAicGFja2FnZS9kdmItYXBw
cy9Db25maWcuaW4iCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZHRib2NmZy9Db25maWcuaW4gYi9w
YWNrYWdlL2R0Ym9jZmcvQ29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAw
MDAwMDAwMDAwLi5jMWU4MzE4ZTVjCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvZHRi
b2NmZy9Db25maWcuaW4KPiBAQCAtMCwwICsxLDggQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX0RU
Qk9DRkcKPiArCWJvb2wgImR0Ym9jZmciCj4gKwloZWxwCj4gKwkgIGR0Ym9jZmcsIHdoaWNoIHN0
YW5kcyBmb3IgRGV2aWNlIFRyZWUgQmxvYiBPdmVybGF5Cj4gKwkgIENvbmZpZ3VyYXRpb24gRmls
ZSBTeXN0ZW0sIHdhcyBkZXZlbG9wZWQgdG8gc2VydmUKPiArCSAgYXMgYSB1c2Vyc3BhY2UgQVBJ
IG9mIERldmljZSBUcmVlIE92ZXJsYXkuCj4gKwo+ICsJICBodHRwczovL2dpdGh1Yi5jb20vaWt3
em0vZHRib2NmZwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2R0Ym9jZmcvZHRib2NmZy5oYXNoIGIv
cGFja2FnZS9kdGJvY2ZnL2R0Ym9jZmcuaGFzaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5k
ZXggMDAwMDAwMDAwMC4uN2RiNjlmOWU1OQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNrYWdl
L2R0Ym9jZmcvZHRib2NmZy5oYXNoCj4gQEAgLTAsMCArMSwzIEBACj4gKyMgTG9jYWxseSBjb21w
dXRlZDoKPiArc2hhMjU2ICBmYWE1M2FlZmQ3Zjc2MzZjNjVlMmI1NmJlYzIyM2QyYmM3Njc2MzU0
ZTNhZDliNWMxNjkxYWNhMzQ5YjliYmI4ICBkdGJvY2ZnLTAuMC45LnRhci5nego+ICtzaGEyNTYg
IGU1N2NiOWYyZWQ2MDdjZDk1YmYxYjY0MzcxMzI1YzUwNWMxYWM4ZmU2NDBhOGM5OTMzZTdmZTc2
MzdhMzg1NjcgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9kdGJvY2ZnL2R0Ym9jZmcu
bWsgYi9wYWNrYWdlL2R0Ym9jZmcvZHRib2NmZy5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4g
aW5kZXggMDAwMDAwMDAwMC4uNjhiZWIxYTQ1ZQo+IC0tLSAvZGV2L251bGwKPiArKysgYi9wYWNr
YWdlL2R0Ym9jZmcvZHRib2NmZy5tawo+IEBAIC0wLDAgKzEsMTggQEAKPiArIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMKPiArIwo+ICsjIGR0Ym9jZmcKPiArIwo+ICsjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICsKPiArRFRCT0NGR19WRVJTSU9OID0gMC4wLjkKPiArRFRCT0NGR19TSVRFID0gJChj
YWxsIGdpdGh1Yixpa3d6bSxkdGJvY2ZnLHYkKERUQk9DRkdfVkVSU0lPTikpCj4gK0RUQk9DRkdf
TElDRU5TRSA9IEJTRC0yLUNsYXVzZQo+ICtEVEJPQ0ZHX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNF
Cj4gKwo+ICtkZWZpbmUgRFRCT0NGR19MSU5VWF9DT05GSUdfRklYVVBTCj4gKwkkKGNhbGwgS0NP
TkZJR19FTkFCTEVfT1BULENPTkZJR19PRl9PVkVSTEFZKQo+ICsJJChjYWxsIEtDT05GSUdfRU5B
QkxFX09QVCxDT05GSUdfQ09ORklHRlNfRlMpCj4gK2VuZGVmCj4gKwo+ICskKGV2YWwgJChrZXJu
ZWwtbW9kdWxlKSkKPiArJChldmFsICQoZ2VuZXJpYy1wYWNrYWdlKSkKPiBkaWZmIC0tZ2l0IGEv
c3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9kdGJvY2ZnLnB5IGIvc3VwcG9ydC90
ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9kdGJvY2ZnLnB5Cj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwLi5kMjViMTY5MmI0Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBi
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZHRib2NmZy5weQo+IEBAIC0wLDAg
KzEsMzcgQEAKPiAraW1wb3J0IG9zCj4gKwo+ICtpbXBvcnQgaW5mcmEuYmFzZXRlc3QKPiArCj4g
Kwo+ICtjbGFzcyBUZXN0RHRib2NmZyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICsgICAgY29u
ZmlnID0gaW5mcmEuYmFzZXRlc3QuQkFTSUNfVE9PTENIQUlOX0NPTkZJRyArIFwKPiArICAgICAg
ICAiIiIKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMPXkKPiArICAgICAgICBCUjJfTElOVVhf
S0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0NVU1RP
TV9WRVJTSU9OX1ZBTFVFPSI1LjEwLjciCj4gKyAgICAgICAgQlIyX0xJTlVYX0tFUk5FTF9VU0Vf
REVGQ09ORklHPXkKPiArICAgICAgICBCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0idmV4cHJl
c3MiCj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfRFRCT0NGRz15Cj4gKyAgICAgICAgQlIyX1RBUkdF
VF9ST09URlNfQ1BJTz15Cj4gKyAgICAgICAgIyBCUjJfVEFSR0VUX1JPT1RGU19UQVIgaXMgbm90
IHNldAo+ICsgICAgICAgICIiIgo+ICsKPiArICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKPiArICAg
ICAgICBpbWcgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJyb290ZnMu
Y3BpbyIpCj4gKyAgICAgICAga2VybmVsID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJp
bWFnZXMiLCAiekltYWdlIikKPiArICAgICAgICBrZXJuZWxfY21kbGluZSA9IFsiY29uc29sZT10
dHlBTUEwIl0KPiArICAgICAgICBkdGIgPSBpbmZyYS5kb3dubG9hZChzZWxmLmRvd25sb2FkZGly
LCAidmV4cHJlc3MtdjJwLWNhOS5kdGIiKQo+ICsgICAgICAgIG9wdGlvbnMgPSBbIi1NIiwgInZl
eHByZXNzLWE5IiwgIi1kdGIiLCBkdGIsICItaW5pdHJkIiwgaW1nXQo+ICsKPiArICAgICAgICBz
ZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYXJtdjciLCBrZXJuZWw9a2VybmVsLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICBrZXJuZWxfY21kbGluZT1rZXJuZWxfY21kbGluZSwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1vcHRpb25zKQo+ICsgICAgICAgIHNlbGYu
ZW11bGF0b3IubG9naW4oKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIm1vZHByb2JlIGR0
Ym9jZmcua28iKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0UnVuT2soIm1rZGlyIC90bXAvY29uZmln
ICYmIG1vdW50IC10IGNvbmZpZ2ZzIG5vbmUgL3RtcC9jb25maWciKQo+ICsKPiArICAgICAgICAj
IENoZWNrIHRoYXQgb3ZlcmxheXMgZGlyZWN0b3J5IGlzIHByZXNlbnQuCj4gKyAgICAgICAgIyBG
cm9tIGR0Ym9jZmcgc2l0ZSAoaHR0cHM6Ly9naXRodWIuY29tL2lrd3ptL2R0Ym9jZmcpOgo+ICsg
ICAgICAgICMgICBJZiAvY29uZmlnL2RldmljZS10cmVlL292ZXJsYXlzIGlzIGNyZWF0ZWQsIGl0
IGlzIHJlYWR5IHRvIHVzZQo+ICsgICAgICAgICMgICBkdGJvY2ZnCj4gKyAgICAgICAgc2VsZi5h
c3NlcnRSdW5PaygibHMgL3RtcC9jb25maWcvZGV2aWNlLXRyZWUvb3ZlcmxheXMvIikKPiAKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
