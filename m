Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93BFE748ED
	for <buildroot@archiver.kernel.org>; Sun,  1 Oct 2023 13:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5298E408EC;
	Sun,  1 Oct 2023 13:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5298E408EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNoCZHyN9Mos; Sun,  1 Oct 2023 13:32:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48F5E40C10;
	Sun,  1 Oct 2023 13:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48F5E40C10
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F37001BF5AA
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 13:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5EDB40C10
 for <buildroot@lists.busybox.net>; Sun,  1 Oct 2023 13:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5EDB40C10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bg9RujIPNwB for <buildroot@lists.busybox.net>;
 Sun,  1 Oct 2023 13:32:10 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B85D408EC
 for <buildroot@buildroot.org>; Sun,  1 Oct 2023 13:32:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B85D408EC
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4056ce55e7eso125847725e9.2
 for <buildroot@buildroot.org>; Sun, 01 Oct 2023 06:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696167127; x=1696771927;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fv8LnjOGzGgtowYEBn5iJLxb8m0sC24dPv1qNYIhw1o=;
 b=otrhhLctCWwkL+vdZYr6yE56cwz1rg8ZkOpVmBKxk9fuXZdjZEAmkWmepKvfl86R25
 pv/SyK9iyaYM3MCJROdbZLAXUPxIClI3kJCqya4P8QECKheycCIjC984BlCE2uZ955Eh
 EswV7F8raiJk2nbmw0heSqISegho7saeJOF+mTKiKCpvR9W1l9kYtqRHqE2/nIVCG+in
 WTen8uHoSEo/ordkIgsA8DGoaqoMp8tgnoiC76qJwBUcnlVMLBQaRufjSgyAN4/O61nU
 xZml8R0y5zMOPaNeJe0WbGW31Auj8OsIoAGeoo6Ze3tcFTolgGNLJGmlXB1Lf1MIL1fb
 aLlQ==
X-Gm-Message-State: AOJu0Yxm/WnWLlo/yp5vuoAziefvEfLNVRQggfUwCyyz4g9dWrHrSfG/
 ohFh/InSNMO75D+992iDtyJosg==
X-Google-Smtp-Source: AGHT+IELnFWEUZoXL4biV2GPXQPFjeCXh5HLE76Z6uU6E7+HGahSL/7s0DAzwcv8ZIlmyx6sYfRYHg==
X-Received: by 2002:a05:600c:4f45:b0:404:7462:1f6f with SMTP id
 m5-20020a05600c4f4500b0040474621f6fmr7880866wmq.8.1696167127467; 
 Sun, 01 Oct 2023 06:32:07 -0700 (PDT)
Received: from ?IPV6:2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6?
 (2a01cb0404ad0b000ca75da681015ca6.ipv6.abo.wanadoo.fr.
 [2a01:cb04:4ad:b00:ca7:5da6:8101:5ca6])
 by smtp.gmail.com with ESMTPSA id
 12-20020a05600c024c00b004051f8d6207sm5265496wmj.6.2023.10.01.06.32.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Oct 2023 06:32:07 -0700 (PDT)
Message-ID: <5e9b4a43-e16c-b2d5-09b7-cb1582a4b513@smile.fr>
Date: Sun, 1 Oct 2023 15:32:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: fr, en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20230922211816.13469-1-giulio.benetti@benettiengineering.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230922211816.13469-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696167127; x=1696771927;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fv8LnjOGzGgtowYEBn5iJLxb8m0sC24dPv1qNYIhw1o=;
 b=UXDxomtvPumByugPQ/awM7OpWXrnfS0l/DQTsGJXJJVrIXIRPFVsMO0GTkO2RggSXB
 ijAeQPVZXXHcr4KzQ/oK0MSKtkV1P3F35ufYabCq0tfdgAw98ffOopOlnixtrDFUgp7z
 Y4WVdGfAJtX7n39DkT4rzC7L/n1mo5R39C+6r/GI8yXVm+nSuxElpMFKXryDIXwOjS88
 +WU3h6tNMe0tLTfjvCUysqG5iYbzfc100ze9jGeS6ox7+Lz4JOcZtzNZ3dY2o3erSoX6
 Liz6ECpsD+0qWQVpTpLRufXvGSdvQPtIcCNI/Oa1kGzoBOdPJdJqjreo5C/w0cFUZ4IG
 JTrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UXDxomtv
Subject: Re: [Buildroot] [PATCH v5] package/apache: add option to disable
 server
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
Cc: =?UTF-8?Q?Herv=c3=a9_Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Jim Reinhart <jimr@tekvox.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2l1bGlvLAoKTGUgMjIvMDkvMjAyMyDDoCAyMzoxOCwgR2l1bGlvIEJlbmV0dGkgYSDD
qWNyaXTCoDoKPiBGcm9tOiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGkrdGVrdm94QGJl
bmV0dGllbmdpbmVlcmluZy5jb20+Cj4gCj4gT3RoZXIgcGFja2FnZXMgKGUuZy4gbW9uZ29vc2Up
IGNhbiB1c2UgaHRkaWdlc3QgYW5kIGh0cGFzc3dkLCBidXQgdGhvc2UKPiBhcmUgb25seSBhdmFp
bGFibGUgd2l0aCBhcGFjaGUuCj4gCj4gV2UgZG9uJ3Qgd2FudCB0byBidWlsZCB0aGUgd2hvbGUg
YXBhY2hlIHNlcnZlciBqdXN0IGZvciB0aG9zZSB0b29scywgc28KPiB3ZSBhZGQgYW4gb3B0aW9u
IHRvIGRpc2FibGUgdGhlIHNlcnZlcjsgaXQgaXMgZW5hYmxlZCBieSBkZWZhdWx0IGZvcgo+IGxl
Z2FjeSBwdXJwb3NlcyAoc28gdGhhdCBleGlzdGluZyAoZGVmKWNvbmZpZ3Mgc3RpbGwgd29yayku
Cj4gCj4gSG93ZXZlciwgdGhlcmUgaXMgbm8gd2F5IHRvIHRlbGwgdGhlIGFwYWNoZSBidWlsZHN5
c3RlbSB0byBvbmx5IGJ1aWxkCj4gdGhvc2UgdHdvIHRvb2xzLCBzbyB3ZSBoYXZlIHRvIHByb3Zp
ZGUgY3VzdG9tIGJ1aWxkIGFuZCBpbnN0YWxsCj4gY29tbWFuZHMuCj4gCj4gQ2M6IEppbSBSZWlu
aGFydCA8amltckB0ZWt2b3guY29tPgo+IENjOiBKYW1lcyBBdXRyeSA8amF1dHJ5QHRla3ZveC5j
b20+Cj4gQ2M6IE1hdHRoZXcgTWFyb24gPG1hdHRoZXdtQHRla3ZveC5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogR2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpK3Rla3ZveEBiZW5ldHRpZW5naW5l
ZXJpbmcuY29tPgo+IC0tLQo+IFYxLT5WMjoKPiAqIEhpZGUgIkV4dGVybmFsIEFwYWNoZSBtb2R1
bGVzIiBpZiBCUjJfUEFDS0FHRV9BUEFDSEVfVVRJTFNfT05MWSBpcyBlbmFibGVkCj4gVjItPlYz
Ogo+IGFzIHN1Z2dlc3RlZCBieSBBcm5vdXQ6Cj4gKiBjaGFuZ2UgbmVnYXRpdmUgb3B0aW9uIEJS
Ml9QQUNLQUdFX0FQQUNIRV9VVElMU19PTkxZIHRvIEJSMl9QQUNLQUdFX0FQQUNIRV9EQUVNT04K
PiAqIHNldCBhIGNvbW1vbiBBUEFDSEVfQ09ORl9PUFRTIGFuZCBvbmx5IGFkZCBzcGVjaWZpYyBv
cHRpb25zIGZvcgo+ICAgQlIyX1BBQ0tBR0VfQVBBQ0hFX0RBRU1PTiBlbmFibGVkIG9yIG5vdAo+
IFYzLT5WNDoKPiAqIGRyb3AgLS13aXRoLXN0YXRpYy0qIG9wdGlvbnMgYXMgc3VnZ2VzdGVkIGJ5
IEFybm91dAo+IFY0LT5WNToKPiBhcyBzdWdnZXN0ZWQgYnkgWWFubjoKPiAqIGRyb3AgQlIyX1BB
Q0tBR0VfQVBBQ0hFIGNoZWNrIGluIHBhY2thZ2UvQ29uZmlnLmluIGZvcgo+ICAgcGFja2FnZS9t
b2RzZWN1cml0eTIvQ29uZmlnLmluCj4gKiBtYWtlIEJSMl9QQUNLQUdFX1BIUF9TQVBJX0FQQUNI
RSBkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0FQQUNIRV9EQUVNT04KPiAqIGltcHJvdmUgY29tbWl0
IGxvZwo+IC0tLQo+ICBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgfCAgMiAtLQo+ICBw
YWNrYWdlL2FwYWNoZS9Db25maWcuaW4gICAgICAgfCAgOSArKysrKysrKysKPiAgcGFja2FnZS9h
cGFjaGUvYXBhY2hlLm1rICAgICAgIHwgMjAgKysrKysrKysrKysrKysrKystLS0KPiAgcGFja2Fn
ZS9tb2RzZWN1cml0eTIvQ29uZmlnLmluIHwgIDIgKy0KPiAgcGFja2FnZS9waHAvQ29uZmlnLmlu
ICAgICAgICAgIHwgIDIgKy0KPiAgNSBmaWxlcyBjaGFuZ2VkLCAyOCBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2th
Z2UvQ29uZmlnLmluCj4gaW5kZXggY2M5OWJlMzlmYi4uZGI2Y2Y0MzJlMyAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTIyNzks
MTEgKzIyNzksOSBAQCBtZW51ICJOZXR3b3JraW5nIGFwcGxpY2F0aW9ucyIKPiAgCXNvdXJjZSAi
cGFja2FnZS9hbGZyZWQvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2FvZXRvb2xzL0Nv
bmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9hcGFjaGUvQ29uZmlnLmluIgo+IC1pZiBCUjJf
UEFDS0FHRV9BUEFDSEUKPiAgbWVudSAiRXh0ZXJuYWwgQXBhY2hlIG1vZHVsZXMiCj4gIAlzb3Vy
Y2UgInBhY2thZ2UvbW9kc2VjdXJpdHkyL0NvbmZpZy5pbiIKPiAgZW5kbWVudQo+IC1lbmRpZgo+
ICAJc291cmNlICJwYWNrYWdlL2FyZ3VzL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9h
cnAtc2Nhbi9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvYXJwdGFibGVzL0NvbmZpZy5p
biIKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9hcGFjaGUvQ29uZmlnLmluIGIvcGFja2FnZS9hcGFj
aGUvQ29uZmlnLmluCj4gaW5kZXggMjcwMjk2YmNlNC4uNWU5ZTRjNWY5ZCAxMDA2NDQKPiAtLS0g
YS9wYWNrYWdlL2FwYWNoZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2FwYWNoZS9Db25maWcu
aW4KPiBAQCAtMTcsNiArMTcsMTQgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0FQQUNIRQo+ICAKPiAg
aWYgQlIyX1BBQ0tBR0VfQVBBQ0hFCj4gIAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfQVBBQ0hFX0RB
RU1PTgo+ICsJYm9vbCAiYXBhY2hlLWRhZW1vbiIKPiArCWRlZmF1bHQgeQo+ICsJaGVscAo+ICsJ
ICBQcm92aWRlIGVudGlyZSBBcGFjaGUgZGFlbW9uLCBvdGhlcndpc2Ugb25seSBodGRpZ2VzdCBh
bmQgaHRwYXNzd2QKPiArCSAgd2lsbCBiZSBidWlsdCBhbmQgaW5zdGFsbGVkLgo+ICsKPiAraWYg
QlIyX1BBQ0tBR0VfQVBBQ0hFX0RBRU1PTgo+ICBjaG9pY2UKPiAgCXByb21wdCAiTXVsdGktUHJv
Y2Vzc2luZyBNb2R1bGUgKE1QTSkiCj4gIAlkZWZhdWx0IEJSMl9QQUNLQUdFX0FQQUNIRV9NUE1f
V09SS0VSCj4gQEAgLTQwLDYgKzQ4LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0FQQUNIRV9NUE1f
V09SS0VSCj4gIAkgIEltcGxlbWVudHMgYSBoeWJyaWQgbXVsdGktdGhyZWFkZWQgbXVsdGktcHJv
Y2VzcyB3ZWIgc2VydmVyCgpXaGF0IGFib3V0IGFwcGFybW9yIHBhY2thZ2U/CnBhY2thZ2UvYXBw
YXJtb3IvYXBwYXJtb3IubWs6aWZlcSAoJChCUjJfUEFDS0FHRV9BUEFDSEUpLHkpCgppdCBzZWVt
cyB3ZSBuZWVkIHRvIHVzZSBCUjJfUEFDS0FHRV9BUEFDSEVfREFFTU9OIHdpdGggdGhpcyBjaGFu
Z2UuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gIAo+ICBlbmRjaG9pY2UKPiArZW5kaWYKPiAg
Cj4gIGVuZGlmCj4gIAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FwYWNoZS9hcGFjaGUubWsgYi9w
YWNrYWdlL2FwYWNoZS9hcGFjaGUubWsKPiBpbmRleCAzMjBhNmFkMjBlLi45OTQ4NDJiNDU1IDEw
MDY0NAo+IC0tLSBhL3BhY2thZ2UvYXBhY2hlL2FwYWNoZS5tawo+ICsrKyBiL3BhY2thZ2UvYXBh
Y2hlL2FwYWNoZS5tawo+IEBAIC0xMiw4ICsxMiw2IEBAIEFQQUNIRV9MSUNFTlNFX0ZJTEVTID0g
TElDRU5TRQo+ICBBUEFDSEVfQ1BFX0lEX1ZFTkRPUiA9IGFwYWNoZQo+ICBBUEFDSEVfQ1BFX0lE
X1BST0RVQ1QgPSBodHRwX3NlcnZlcgo+ICBBUEFDSEVfU0VMSU5VWF9NT0RVTEVTID0gYXBhY2hl
Cj4gLSMgTmVlZGVkIGZvciBtb2RfcGhwCj4gLUFQQUNIRV9JTlNUQUxMX1NUQUdJTkcgPSBZRVMK
PiAgIyBXZSBoYXZlIGEgcGF0Y2ggdG91Y2hpbmcgY29uZmlndXJlLmluIGFuZCBNYWtlZmlsZS5p
biwKPiAgIyBzbyB3ZSBuZWVkIHRvIGF1dG9yZWNvbmY6Cj4gIEFQQUNIRV9BVVRPUkVDT05GID0g
WUVTCj4gQEAgLTMyLDEwICszMCwxNiBAQCBBUEFDSEVfTVBNID0gd29ya2VyCj4gIGVuZGlmCj4g
IAo+ICBBUEFDSEVfQ09ORl9PUFRTID0gXAo+IC0JLS1zeXNjb25mZGlyPS9ldGMvYXBhY2hlMiBc
Cj4gIAktLXdpdGgtYXByPSQoU1RBR0lOR19ESVIpL3VzciBcCj4gIAktLXdpdGgtYXByLXV0aWw9
JChTVEFHSU5HX0RJUikvdXNyIFwKPiAgCS0td2l0aC1wY3JlPSQoU1RBR0lOR19ESVIpL3Vzci9i
aW4vcGNyZTItY29uZmlnIFwKPiArCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfQVBBQ0hFX0RBRU1P
TikseSkKPiArIyBOZWVkZWQgZm9yIG1vZF9waHAKPiArQVBBQ0hFX0lOU1RBTExfU1RBR0lORyA9
IFlFUwo+ICsKPiArQVBBQ0hFX0NPTkZfT1BUUyArPSBcCj4gKwktLXN5c2NvbmZkaXI9L2V0Yy9h
cGFjaGUyIFwKPiAgCS0tZW5hYmxlLWh0dHAgXAo+ICAJLS1lbmFibGUtZGJkIFwKPiAgCS0tZW5h
YmxlLXByb3h5IFwKPiBAQCAtMTIxLDUgKzEyNSwxNSBAQCBkZWZpbmUgQVBBQ0hFX0lOU1RBTExf
SU5JVF9TWVNURU1ECj4gIAkkKElOU1RBTEwpIC1EIC1tIDY0NCBwYWNrYWdlL2FwYWNoZS9hcGFj
aGUuc2VydmljZSBcCj4gIAkJJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lzdGVtL2Fw
YWNoZS5zZXJ2aWNlCj4gIGVuZGVmCj4gK2Vsc2UKPiArZGVmaW5lIEFQQUNIRV9CVUlMRF9DTURT
Cj4gKwkkKFRBUkdFVF9NQUtFX0VOVikgJChNQUtFKSAtQyAkKEBEKS9zdXBwb3J0IGh0ZGlnZXN0
IGh0cGFzc3dkCj4gK2VuZGVmCj4gKwo+ICtkZWZpbmUgQVBBQ0hFX0lOU1RBTExfVEFSR0VUX0NN
RFMKPiArCSQoSU5TVEFMTCkgLW0gMDc1NSAtRCAkKEBEKS9zdXBwb3J0L2h0ZGlnZXN0ICQoVEFS
R0VUX0RJUikvdXNyL2Jpbi9odGRpZ2VzdAo+ICsJJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQp
L3N1cHBvcnQvaHRwYXNzd2QgJChUQVJHRVRfRElSKS91c3IvYmluL2h0cGFzc3dkCj4gK2VuZGVm
Cj4gK2VuZGlmCj4gIAo+ICAkKGV2YWwgJChhdXRvdG9vbHMtcGFja2FnZSkpCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2UvbW9kc2VjdXJpdHkyL0NvbmZpZy5pbiBiL3BhY2thZ2UvbW9kc2VjdXJpdHky
L0NvbmZpZy5pbgo+IGluZGV4IGZiMWJmYzk2MGUuLjQwYzVmYzU1YmMgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9tb2RzZWN1cml0eTIvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9tb2RzZWN1cml0
eTIvQ29uZmlnLmluCj4gQEAgLTEsNiArMSw2IEBACj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9NT0RT
RUNVUklUWTIKPiAgCWJvb2wgIm1vZHNlY3VyaXR5MiIKPiAtCWRlcGVuZHMgb24gQlIyX1BBQ0tB
R0VfQVBBQ0hFCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0FQQUNIRV9EQUVNT04KPiAgCXNl
bGVjdCBCUjJfUEFDS0FHRV9MSUJYTUwyCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfUENSRTIKPiAg
CWhlbHAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9waHAvQ29uZmlnLmluIGIvcGFja2FnZS9waHAv
Q29uZmlnLmluCj4gaW5kZXggNjliNDI2OGMxZC4uM2E5ZTM3ZGFiNiAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL3BocC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL3BocC9Db25maWcuaW4KPiBAQCAt
MzYsNyArMzYsNyBAQCBpZiBCUjJfUEFDS0FHRV9QSFAKPiAgCj4gIGNvbmZpZyBCUjJfUEFDS0FH
RV9QSFBfU0FQSV9BUEFDSEUKPiAgCWJvb2wgIkFwYWNoZSBpbnRlcmZhY2UiCj4gLQlkZXBlbmRz
IG9uIEJSMl9QQUNLQUdFX0FQQUNIRQo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9BUEFDSEVf
REFFTU9OCj4gIAloZWxwCj4gIAkgIEFwYWNoZSBtb2R1bGUKPiAgCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
