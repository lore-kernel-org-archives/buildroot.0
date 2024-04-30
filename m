Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304B9C4345F
	for <buildroot@archiver.kernel.org>; Tue, 30 Apr 2024 21:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3FBC400D2;
	Tue, 30 Apr 2024 21:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWU5va59iD_Q; Tue, 30 Apr 2024 21:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1146941564
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1146941564;
	Tue, 30 Apr 2024 21:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D714C1BF2CF
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C215482028
 for <buildroot@lists.busybox.net>; Tue, 30 Apr 2024 21:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jE_XJI82KNb3 for <buildroot@lists.busybox.net>;
 Tue, 30 Apr 2024 21:41:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B633F80C18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B633F80C18
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B633F80C18
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 21:41:49 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e9so35010505e9.3
 for <buildroot@buildroot.org>; Tue, 30 Apr 2024 14:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714513308; x=1715118108;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rMKJAI2O59AzJ+viKHj86fEkyCOVYA2TLhr/rC+HOJY=;
 b=TsPb2yxT87ryZQzydPKkvv5L5CipQfMTY/6IRx/DzrBir7dGFgCQA7FZLqQOdJP18T
 knYC3c1dpCYG0MGtEBv6QGVYTMIzHu2/tlfGEtOQwDopWNCSwqpTMkIh2FD9+C3BQH8m
 638MO6BoN17ViiciddTD4B/K2q7eCUc5ozOcRa4jcE7yX1UX310u2shTkdfYZxPyD1ka
 ig0Ozi+z91RymvBsYO/uMzz1V0KbjyDc2/K9ot5lCPTgunwdKoKVl+0jB8KI8tZvyKk2
 xTBSjM7VFQLsddFcrT2UQmesz7jBvlGg3J9/oXAXiecK6sxqWxbQEnLL6DprCdCOkZaA
 L+aw==
X-Gm-Message-State: AOJu0Yyvdoh8aJw/YtJ16VQ+oHnV/xVeSpXR/ObBJBHtrPlYGEb9g1gF
 bsKEdK1rgWrxBhHNoXTYBsNcTUtJFDm5j6wyQoOrwZLy+THl4ucj1T12TffQ8GEHfq5DuGG8c+R
 e
X-Google-Smtp-Source: AGHT+IGKCBb1t+1XMVj+gBvL6jvogIECWYUYJF1CMw5u6RWgH4xSqmG8sIwSrn9ovl3WKRiqTBnfVg==
X-Received: by 2002:a05:600c:4589:b0:41b:e55c:8de0 with SMTP id
 r9-20020a05600c458900b0041be55c8de0mr521127wmo.22.1714513307828; 
 Tue, 30 Apr 2024 14:41:47 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 c7-20020a05600c0a4700b0041ba0439a78sm146133wmq.45.2024.04.30.14.41.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Apr 2024 14:41:47 -0700 (PDT)
Message-ID: <e5a1f770-f858-4e4d-bbb1-51c7466edc6b@smile.fr>
Date: Tue, 30 Apr 2024 23:41:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240424212056.749427-1-romain.naour@smile.fr>
Content-Language: fr
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240424212056.749427-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714513308; x=1715118108;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=rMKJAI2O59AzJ+viKHj86fEkyCOVYA2TLhr/rC+HOJY=;
 b=lX8sisQactB4uHCEajpd9PzI8wMN60wjfjmeFz9j6cpYKaH4pmgOL+Kp5lrQu2JOJN
 JHgY3OyfFbLBqbwB2LwOvkCTScFL9kodLgwGRIqKmiMQeZxJFOMZj81dwuBtQUKYWqYj
 N2WQLOgVp2exwcbMr+okMshmxTOJBTQbc4bHbk9RHYTvKw+JMGgcE5AkPoxih3A68zl1
 jrSw6YeHydW/TNs+vosKmN93Ghq6vl7asUGRHeEYgDLlg9fhGiSjVab520YXQwOIefJH
 GYDIalcMQYjo15rA4aMHMQRS2Z717FlqPByyKfmU/L/yFQ2VIQv4fm+VobxJo1Pil3ow
 55jA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=lX8sisQa
Subject: Re: [Buildroot] [PATCH] package/llvm-project/compiler-rt: add
 libxcrypt dependency
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMjQvMDQvMjAyNCDDoCAyMzoyMCwgUm9tYWluIE5hb3VyIGEgw6ljcml0wqA6Cj4gV2hlbiBn
bGliYyB3YXMgYnVtcGVkIHRvIHZlcnNpb24gMi4zOSBpbiBjb21taXQKPiBiNTY4MGY1M2Q2MGFj
ZjhmZjYwMTAwODJmODczNDM4YTM5YmQ1ZDk3IGl0IHJlbW92ZWQgdGhlIGRlcHJlY2F0ZWQKPiBs
aWJjcnlwdCBzdXBwb3J0Lgo+IAo+IEJ1dCBjb21waWxlci1ydCBwYWNrYWdlIHN0aWxsIHVzZSBj
cnlwdC5oIGhlYWRlciBhbmQgY3J5cHQoKSBmdW5jdGlvbgo+IGluIHRoZSBzYW5pdGl6ZXIgY29k
ZS4KPiAKPiBVc2UgbGlieGNyeXB0IHVuY29uZGl0aW9uYWxseSBzaW5jZSBjb21waWxlci1ydCBp
dHNlbGYgYWxyZWFkeSBkZXBlbmRzCj4gb24gZ2xpYmMgYmFzZWQgdG9vbGNoYWluLgo+IAo+IEZp
eGVzOgo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMv
NjcwMzIyMjUxMwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3Vy
QHNtaWxlLmZyPgo+IC0tLQo+ICBwYWNrYWdlL2xsdm0tcHJvamVjdC9jb21waWxlci1ydC9Db25m
aWcuaW4gICAgICB8IDEgKwo+ICBwYWNrYWdlL2xsdm0tcHJvamVjdC9jb21waWxlci1ydC9jb21w
aWxlci1ydC5tayB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sbHZtLXByb2plY3QvY29tcGls
ZXItcnQvQ29uZmlnLmluIGIvcGFja2FnZS9sbHZtLXByb2plY3QvY29tcGlsZXItcnQvQ29uZmln
LmluCj4gaW5kZXggZThmMmFjNDIwMS4uMTBmNWQ3OTZiMyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L2xsdm0tcHJvamVjdC9jb21waWxlci1ydC9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL2xsdm0t
cHJvamVjdC9jb21waWxlci1ydC9Db25maWcuaW4KPiBAQCAtMyw2ICszLDcgQEAgY29uZmlnIEJS
Ml9QQUNLQUdFX0NPTVBJTEVSX1JUCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xMVk0KPiAg
CWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDICMgYXNhbiBsaWIgcmVxdWlyZXMK
PiAgCWRlcGVuZHMgb24gQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzcgIyBob3N0LWNsYW5nCj4gKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfTElCWENSWVBUCj4gIAloZWxwCj4gIAkgIEEgY29sbGVjdGlvbiBv
ZiBydW50aW1lIGxpYnJhcmllcyBwcmltYXJpbHkgdXNlZCBieSBjbGFuZyBhbmQKPiAgCSAgbGx2
bSB0byBwcm92aWRlIGJ1aWx0aW5zLCBzYW5pdGl6ZXIgcnVudGltZXMsIGFuZCBwcm9maWxpbmcK
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9sbHZtLXByb2plY3QvY29tcGlsZXItcnQvY29tcGlsZXIt
cnQubWsgYi9wYWNrYWdlL2xsdm0tcHJvamVjdC9jb21waWxlci1ydC9jb21waWxlci1ydC5tawo+
IGluZGV4IDVkOWMzZDhmYTguLmQ0YmM0ZDMwNWIgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9sbHZt
LXByb2plY3QvY29tcGlsZXItcnQvY29tcGlsZXItcnQubWsKPiArKysgYi9wYWNrYWdlL2xsdm0t
cHJvamVjdC9jb21waWxlci1ydC9jb21waWxlci1ydC5tawo+IEBAIC0xMCw3ICsxMCw3IEBAIENP
TVBJTEVSX1JUX1NJVEUgPSAkKExMVk1fUFJPSkVDVF9TSVRFKQo+ICBDT01QSUxFUl9SVF9MSUNF
TlNFID0gTkNTQSBNSVQKPiAgQ09NUElMRVJfUlRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UuVFhU
Cj4gIENPTVBJTEVSX1JUX0NQRV9JRF9WRU5ET1IgPSBsbHZtCj4gLUNPTVBJTEVSX1JUX0RFUEVO
REVOQ0lFUyA9IGhvc3QtY2xhbmcgbGx2bQo+ICtDT01QSUxFUl9SVF9ERVBFTkRFTkNJRVMgPSBo
b3N0LWNsYW5nIGxpYnhjcnlwdCBsbHZtCj4gIENPTVBJTEVSX1JUX1NVUFBPUlRTX0lOX1NPVVJD
RV9CVUlMRCA9IE5PCj4gIAo+ICBDT01QSUxFUl9SVF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKCkFw
cGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
