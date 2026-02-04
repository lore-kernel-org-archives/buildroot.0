Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABF9E9D408
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 16:11:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EEA040435;
	Wed,  4 Feb 2026 16:11:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5B0yr0u8Kpvz; Wed,  4 Feb 2026 16:11:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F8DF404A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770221475;
	bh=zOw4dXyLEy2a0WEkiKJ4cbbR06jx2w8KuUXXMqWPGhI=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RxGPbQW8uTPCN2HQOUB1yjpPFiiMHrtTcltU7lCfoxSrWj4ujaYo32R9THOXG5rms
	 o+jq405wbIckmmg1hUdVSPOVunArrz18GuIAvaZncaFiG74tNeVEbFF5QaI7Cr8GSA
	 nrhXqqqv5LNWm51McS5NxKaQir5KQ3FnofQHR3hfHHfy+O8gGSRi+kaME+baOsdMFq
	 Y1eRg9f6DEFLe8sAuP44SPfyHdzFuSWqihpUxD7YOAAzi7R41LEkc+8e0HwQzJ0K/N
	 GHZq7HjTDvJg6d55VOsTxf3LzxqLhUemu1jhQx7eVXs56tN3BhNOCN2U+ZxdnWOdzM
	 +zNx06gj2q3ZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F8DF404A8;
	Wed,  4 Feb 2026 16:11:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2601D17A
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:11:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07EC860AE1
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqpYLxDXfoix for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 16:11:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.48;
 helo=mail-wm1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF57360DC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF57360DC5
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF57360DC5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 16:11:12 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so56801005e9.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 08:11:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770221470; x=1770826270;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iaphov0q/K/LGKi5Hh+TqPsmwXIsxf/U+hwkDvnrKyY=;
 b=rrTi725Ve0B0sAqPzaaTSFckBpthHg4U8mXTPartoLADAjPJTNcp+AkhgDAmrMV18W
 6uq+UB8mCBQY9V0S3FecZoSli8dd4brZSFgyKe1thM+UZJJyFow3KNSCENcGQfKVUhFu
 +kqkxYXMp29an0U+DOQ2DfgW1ddtp7X2z1I+mWsJVH3BZkV0T3BMmTtA5eIK6MfEs8j/
 4W/20oiYaeyRlURixPMwgkOudKDcGASDc8Dn7nnKWYar5+RRHK/PH7hBgIF113a8yStx
 egZhLNzA82V0dfQrFhT0wiDcBtRkTrzf0FQsp/ObqnyNQSi2Rs58EO5ZcIxQaVh+MEvj
 Ns9Q==
X-Gm-Message-State: AOJu0Yyd81dYgtkaUozxHARC077TiVAh+IX19Bn4iY2FVgqUVJZwgSCQ
 PE/WKDgFFlgyLltqdBDVhT83yaDWBriSck+m/YXm38SmQkTr+fSTcnC/ugovs+svB8o=
X-Gm-Gg: AZuq6aIZTYHTShw1dimgxb7ImG05mufGePv+j2eQwelIc/4eRfI2ZHVyrlH0LLCI6Z3
 Iw6JiyPnbnIo4Pj2W07P5DgwjoXvjX7S8gMKdtz22U+BRCgctG3rzYqElRXMHTXrsWDLdwzqqbm
 0DxePm6D9zFUGidv+v9CYn8reFGCynHqeVv4mWXSfDPUgF9aiJd9zY8RDjEKIoP0BRF58/guAl2
 ZK6dm4AGno4Ctj8ueC+ntZygvVIprwgyVbuZ3zoLzqhHtyC4TYwLtYqrEIOboFEMNsx65h3mqZJ
 ZiItkK/oC6fbPnsdNhnOTvZiw3XMg2n7yUkCzR7hLzaZ10QnExn6sqbAWQSWQcbI2/HGvdD7j2w
 GBImiBHWRidffMZpDVRyxwry2/upIltrATkmETLTc2HfEyZ+d/h+mrqzw+fIvmsR6ncaw1DVtgk
 yftzIMZ1+qaUJTfGScQm4ZwheUdnfAiUfMg5790SJhOKArQ9cwL762z4JnThURj/M7O0HcBXOri
 O6ZFvKJm/q8F8Q1yA==
X-Received: by 2002:a05:600c:6212:b0:479:1348:c614 with SMTP id
 5b1f17b1804b1-4830e9707bbmr45081005e9.26.1770221470338; 
 Wed, 04 Feb 2026 08:11:10 -0800 (PST)
Received: from [172.16.3.27] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4830ffbd1f8sm23385015e9.16.2026.02.04.08.11.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 08:11:09 -0800 (PST)
Message-ID: <626736c7-d9aa-4333-a883-6943928e31c6@devoogdt.com>
Date: Wed, 4 Feb 2026 17:11:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20250626111642.228223-1-alex.bennee@linaro.org>
 <20250626111642.228223-2-alex.bennee@linaro.org>
 <7c6cfb4a-4caf-48fd-a327-a74dbef6e8be@smile.fr>
Content-Language: en-US
From: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <7c6cfb4a-4caf-48fd-a327-a74dbef6e8be@smile.fr>
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: Re: [Buildroot] [RFC PATCH 1/3] package/llvm-project: use ninja to
 build llvm libs
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxleCwgUm9tYWluLCBBbGwsCgoKT24gNy8yLzI1IDIzOjQwLCBSb21haW4gTmFvdXIg
dmlhIGJ1aWxkcm9vdCB3cm90ZToKPiBIZWxsbyBBbGV4LCBBbGwsCj4KPiBMZSAyNi8wNi8yMDI1
IMOgIDEzOjE2LCBBbGV4IEJlbm7DqWUgYSDDqWNyaXTCoDoKPj4gVXNpbmcgbmluamEgaXMgcmVj
b21tZW5kZWQgYXMgaXQgaXMgZmFzdGVyIHRoYW4gdGhlIGRlZmF1bHQgR05VIG1ha2UKPj4gYnVp
bGQgbWV0aG9kLiBNYWtlIHRoZSBzd2l0Y2guCj4gTmluamEgaXMgdXN1YWxseSBmYXN0ZXIgZm9y
IGluY3JlbWVudGFsIGJ1aWxkcyAoZm9yIGxsdm0gZGV2ZWxvcGVycyBbMV0pIGJ1dAo+IHNpbmNl
IHdlIHVzdWFsbHkgdXNlIEJ1aWxkcm9vdCBmb3IgYnVpbGRpbmcgdGFyZ2V0IGltYWdlcyBmcm9t
IHNvdXJjZXMgbmluamEgbWF5Cj4gbm90IHJlYWxseSBmYXN0ZXIgdGhhbiBNYWtlLgo+Cj4gU2lu
Y2Ugd2UgYWRkIGhvc3QtbmluamEgaW4gdGhlIGRlcGVuZGVuY2llcywgaXMgcmVhbGx5IGZhc3Rl
ciBpbiB0aGUgZW5kPwo+IE5vdGU6IG9uIHNvbWUgYnVpbGQgbWFjaGluZSB3aXRoIGEgcmVjZW50
IGVub3VnaCBjbWFrZSB0b29sLCB0aGUgaG9zdC1jbWFrZSBpcwo+IG5vdCB1c2VkLgo+Cj4gWzFd
IGh0dHBzOi8vbGx2bS5vcmcvZG9jcy9HZXR0aW5nU3RhcnRlZC5odG1sCj4KPj4gU2lnbmVkLW9m
Zi1ieTogQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gICBw
YWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsgfCAxMCArKysrKystLS0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGx2bS1wcm9qZWN0L2xsdm0vbGx2bS5tayBiL3BhY2thZ2UvbGx2bS1w
cm9qZWN0L2xsdm0vbGx2bS5tawo+PiBpbmRleCA3NTUyZTM1OTBjLi44ZmU3ZDEwZmUwIDEwMDY0
NAo+PiAtLS0gYS9wYWNrYWdlL2xsdm0tcHJvamVjdC9sbHZtL2xsdm0ubWsKPj4gKysrIGIvcGFj
a2FnZS9sbHZtLXByb2plY3QvbGx2bS9sbHZtLm1rCj4+IEBAIC0xMyw4ICsxMywxMCBAQCBMTFZN
X0NQRV9JRF9WRU5ET1IgPSBsbHZtCj4+ICAgTExWTV9TVVBQT1JUU19JTl9TT1VSQ0VfQlVJTEQg
PSBOTwo+PiAgIExMVk1fSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4+ICAgCj4+IC1IT1NUX0xMVk1f
REVQRU5ERU5DSUVTID0gaG9zdC1weXRob24zIGhvc3QtbGx2bS1jbWFrZQo+PiAtTExWTV9ERVBF
TkRFTkNJRVMgPSBob3N0LWxsdm0KPj4gK0hPU1RfTExWTV9ERVBFTkRFTkNJRVMgPSBob3N0LXB5
dGhvbjMgaG9zdC1sbHZtLWNtYWtlIGhvc3QtbmluamEKPj4gK0xMVk1fREVQRU5ERU5DSUVTID0g
aG9zdC1sbHZtIGhvc3QtbmluamEKCgpXaHkgc2VsZWN0aW5nIGhvc3QtbmluamE/IFRoaXMgaXMg
aGFuZGxlZCBieSB0aGUgcGFja2FnZS9wa2ctY21ha2UubWsgCmluZnJhc3RydWN0dXJlIHdoZW4g
c2V0dGluZyB0aGUgX0NNQUtFX0JBQ0tFTkQgdG8gbmluamEuCgoKPj4gKwo+PiArTExWTV9DTUFL
RV9CQUNLRU5EID0gbmluamEKPiBXaGF0IGFib3V0IG90aGVyIGxsdm0tcHJvamVjdCByZWxhdGVk
IHBhY2thZ2Ugc3VjaCBDbGFuZz8KPgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPgo+Cj4+ICAg
Cj4+ICAgIyBQYXRoIHRvIGNtYWtlIG1vZHVsZXMgZnJvbSBob3N0LWxsdm0tY21ha2UKPj4gICBI
T1NUX0xMVk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfTU9EVUxFX1BBVEg9JChIT1NUX0RJUikvbGli
L2NtYWtlL2xsdm0KPj4gQEAgLTE2Niw4ICsxNjgsOCBAQCBMTFZNX0NPTkZfT1BUUyArPSAtRExM
Vk1fSEFWRV9URkxJVEU9IiIKPj4gICAjIERlZmF1bHQgaXMgRGVidWcgYnVpbGQsIHdoaWNoIHJl
cXVpcmVzIGNvbnNpZGVyYWJseSBtb3JlIGRpc2sgc3BhY2UgYW5kCj4+ICAgIyBidWlsZCB0aW1l
LiBSZWxlYXNlIGJ1aWxkIGlzIHNlbGVjdGVkIGZvciBob3N0IGFuZCB0YXJnZXQgYmVjYXVzZSB0
aGUgbGlua2VyCj4+ICAgIyBjYW4gcnVuIG91dCBvZiBtZW1vcnkgaW4gRGVidWcgbW9kZS4KPj4g
LUhPU1RfTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9CVUlMRF9UWVBFPVJlbGVhc2UKPj4gLUxM
Vk1fQ09ORl9PUFRTICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlCj4+ICtIT1NUX0xMVk1f
Q09ORl9PUFRTICs9IC1EQ01BS0VfQlVJTERfVFlQRT1SZWxlYXNlIC1HIE5pbmphCj4+ICtMTFZN
X0NPTkZfT1BUUyArPSAtRENNQUtFX0JVSUxEX1RZUEU9UmVsZWFzZSAtRyBOaW5qYQoKCldoeSB3
b3VsZCBpdCBiZSBuZWVkZWQgdG8gYWRkIC1HTmluamEsIHRoaXMgc2hvdWxkIGJlIGhhbmRsZWQg
YnkgdGhlIApwYWNrYWdlL3BrZy1jbWFrZS5tayBpbmZyYXN0cnVjdHVyZS4KCgo+PiAgIAo+PiAg
ICMgQ29tcGlsZSBsbHZtIHdpdGggdGhlIEMrKzE0IChJU08gQysrIDIwMTQgc3RhbmRhcmQpLgo+
PiAgIEhPU1RfTExWTV9DT05GX09QVFMgKz0gLURDTUFLRV9DWFhfU1RBTkRBUkQ9MTQKCgpLciwK
CgpUaG9tYXMgRGV2b29nZHQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
