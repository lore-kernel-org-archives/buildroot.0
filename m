Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9D6C8303C
	for <buildroot@archiver.kernel.org>; Sat,  5 Jul 2025 20:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07D5612E3;
	Sat,  5 Jul 2025 20:54:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dbv_GYAFngtZ; Sat,  5 Jul 2025 20:54:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C75E605E6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C75E605E6;
	Sat,  5 Jul 2025 20:54:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86DFC12E
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 788AE8156B
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5rLQy5LZO0M for <buildroot@buildroot.org>;
 Sat,  5 Jul 2025 20:54:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80D2C815CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D2C815CF
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80D2C815CF
 for <buildroot@buildroot.org>; Sat,  5 Jul 2025 20:54:43 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3ab112dea41so974435f8f.1
 for <buildroot@buildroot.org>; Sat, 05 Jul 2025 13:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751748881; x=1752353681;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bRT7xz/hw/WXA3nA0ffpKkSPlr2rf6nrqzyxo+lRk2Q=;
 b=HghaCqUJf3dEVPs5/e2k5echELahaEqPjWr3vbdAOS1Jrywz/HLMRGawMQUqh8edwK
 FO3HU2R+Fj52V1eolFw1DY5Dy0FUpJZR8e2nYxBR89msiErdpaf+54L/PwLB2TlwJWAW
 mb6jCLEHu3T0L88zEBBpWUQhzmBy6YPwsR2QjxH7msJUl2tlUaZkolg64/E9ehALHivq
 1XOFc/Nqfy/9tgP/2ZL9ZWYs5uBBMkf4z9bvNCXbrvmGNhRP4EHjbmkSeZnvGjR61R4Y
 yQoKlrq8tzL80Hgbop3RRIMcNYMc9T9qZJuxdznId2bFSfwCqUwzGXiAbiraiZlp1Ru9
 eiFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgCEAumCvTOHcR+Ge2ESTieXl7UoYvZFhUV4QfbhJeYH90x58Y8aKp+eeY7YSfJDFYUGVMfzVkZiE=@buildroot.org
X-Gm-Message-State: AOJu0YxXHKHH7i6Tfag05j9eTxyRdFoWx45+INPx1hFlDa3BZDX/WI/Y
 iWRB0ngjfvUInt+r2OidiRjtXjrkTakA/1qWy+a0z9WNNiy36dPEIs4LxBfmpYpNoRc=
X-Gm-Gg: ASbGnctyHfn7K5e7vjZ2PcAEyo49xQ/MzOBZm5+h234UPnFSXCOl3PXIp3hmKDr0IB/
 zNGKzwGKItWXRwq5GwPZ2PceNx8EufGCy6hPbSbX2ZK/gCMb2qovwPbRYaexsvtdCKBMTM25n6K
 KQWzg385aMIJXtoWe540ZRL2jJcafKM6WoMMnZDPV5IvkLate3fB4cIRAIzz6pWbmOzmNf0P+8F
 gg9NzQf04wQk2LV7E6LRi4wr/6OEtY5C3LdlTiokvYteXRobp/rHQEHWYG7R2bSRomb2IFdDQQI
 MG7Rk92I7X/U9rOWFUC1TXeLdxzDW2pwALfgr1H97x18oZ1suyt1D2XXUBXRa+CWErJWGVqSvvf
 snR+rFDsltXhN8IHUqfGV/mlxzbP1sQOgLPUX9GwJ5Hc27JJJbo9P9TYWsFD8ej+pAdERqLZ0GJ
 KjltGY5tk6u+QD7VpVOkktxCWx
X-Google-Smtp-Source: AGHT+IG/TJqZUadnHJyZThB9ENY+WeELOdjoSVro01OZi/sQnh3G9la12ZsfvAmnzac/yON8uKuDNQ==
X-Received: by 2002:a5d:5d0a:0:b0:3a5:2f23:3783 with SMTP id
 ffacd0b85a97d-3b49aa35309mr1914450f8f.24.1751748881451; 
 Sat, 05 Jul 2025 13:54:41 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:c97d:3b73:4a46:d823?
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b47285d3bbsm5911768f8f.96.2025.07.05.13.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Jul 2025 13:54:41 -0700 (PDT)
Message-ID: <e7adc32b-004b-45ad-96de-06dd8dd17247@smile.fr>
Date: Sat, 5 Jul 2025 22:54:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
References: <cover.1751377540.git.yann.morin@orange.com>
 <71793243b832c0c9f397911ce0bdf08e03f660b4.1751377540.git.yann.morin@orange.com>
Content-Language: fr
In-Reply-To: <71793243b832c0c9f397911ce0bdf08e03f660b4.1751377540.git.yann.morin@orange.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1751748881; x=1752353681; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bRT7xz/hw/WXA3nA0ffpKkSPlr2rf6nrqzyxo+lRk2Q=;
 b=tSDxx0X2unURPJwuTClZM0VH708BT3Lgokc5LImX46nNEo176srETs5cqU/tBB5hap
 m2Q3ulfZmQydGd/Zhu9HjoU+0O7Z8Kp+dcQvn4nNe6k6Law0bPrlFg/OFVRaqDbj+9xz
 WW9v51OEnmIgQ08I2KSMKv98grxQTjqZyDOrs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=tSDxx0X2
Subject: Re: [Buildroot] [PATCH 4/4 v2] package/pkg-golang: catch use of
 legacy FOO_INSTALL_BINS
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

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDEvMDcvMjAyNSDDoCAxNTo0NSwgeWFubi5tb3JpbkBvcmFu
Z2UuY29tIGEgw6ljcml0wqA6Cj4gRnJvbTogIllhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluQG9y
YW5nZS5jb20+Cj4gCj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3JpbkBv
cmFuZ2UuY29tPgo+IENjOiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFwZXJ0dXJlLnVz
PgoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPgoKQmVz
dCByZWdhcmRzLApSb21haW4KCgo+IC0tLQo+ICBkb2NzL21hbnVhbC9taWdyYXRpbmcuYWRvYyB8
IDUgKysrKysKPiAgcGFja2FnZS9wa2ctZ29sYW5nLm1rICAgICAgfCA2ICsrKysrKwo+ICAyIGZp
bGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZG9jcy9tYW51
YWwvbWlncmF0aW5nLmFkb2MgYi9kb2NzL21hbnVhbC9taWdyYXRpbmcuYWRvYwo+IGluZGV4IDRl
NjIyNWE5ODcuLjZlY2M5OTI1MDIgMTAwNjQ0Cj4gLS0tIGEvZG9jcy9tYW51YWwvbWlncmF0aW5n
LmFkb2MKPiArKysgYi9kb2NzL21hbnVhbC9taWdyYXRpbmcuYWRvYwo+IEBAIC0yMjIsMyArMjIy
LDggQEAgZnJvbSArLWNhcmdvMisgdG8gKy1jYXJnbzQrLgo+ICBJbiAyMDI1LjA4LCBzdGFydGlu
ZyB3aXRoIHN5c3RlbWQgdmVyc2lvbiAyNTcsIHN5c3RlbWQtbmV0d29ya2QgcmVxdWlyZXMga2Vy
bmVsCj4gIDUuNCBvciBsYXRlci4gSWYgeW91IGFyZSBzdGlsbCB1c2luZyBhIGtlcm5lbCBvbGRl
ciB0aGFuIDUuNCwgcGxlYXNlIHVwZGF0ZQo+ICB5b3VyIGtlcm5lbCBvciB1c2UgYW4gYWx0ZXJu
YXRpdmUgbmV0d29yayBtYW5hZ2VyLgo+ICsKPiArW1ttaWdyYXRpbmctZ29sYW5nLXBhY2thZ2Vz
XV0KPiArSW4gMjAyNS4wOCwgdGhlICtGT09fSU5TVEFMTF9CSU5TKyB2YXJpYWJsZSBmb3IgZ29s
YW5nIHBhY2thZ2VzIGlzIG5vIGxvbmdlcgo+ICtzdXBwb3J0ZWQ7IHRoZSBsaXN0IG9mIGJpbmFy
aWVzIHRvIGluc3RhbGwgaXMgYXV0b21hdGljYWxseSBkZXJpdmVkIGZyb20KPiArdGhlICtGT09f
QlVMRF9UQVJHRVRTKyB2YXJpYWJsZS4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9wa2ctZ29sYW5n
Lm1rIGIvcGFja2FnZS9wa2ctZ29sYW5nLm1rCj4gaW5kZXggZmY4ZDI4YWE3ZS4uZmZkNTBhZGVj
YyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3BrZy1nb2xhbmcubWsKPiArKysgYi9wYWNrYWdlL3Br
Zy1nb2xhbmcubWsKPiBAQCAtNDAsNiArNDAsMTIgQEAgR09fQklOID0gJChIT1NUX0RJUikvYmlu
L2dvCj4gIAo+ICBkZWZpbmUgaW5uZXItZ29sYW5nLXBhY2thZ2UKPiAgCj4gKyMgTGVnYWN5Cj4g
K2lmbmVxICgkJCgkKDIpX0lOU1RBTExfQklOUyksKQo+ICskJChlcnJvciBQYWNrYWdlICQoMSkg
c2V0cyAkKDIpX0lOU1RBTExfQklOUywgd2hpY2ggaXMgbm8gbG9uZ2VyIHN1cHBvcnRlZDsgXAo+
ICtzZWUgdGhlIG1hbnVhbDogaHR0cHM6Ly9idWlsZHJvb3Qub3JnL21hbnVhbC5odG1sI21pZ3Jh
dGluZy1nb2xhbmctcGFja2FnZSApCj4gK2VuZGlmCj4gKwo+ICAkKDIpX0JVSUxEX09QVFMgKz0g
XAo+ICAJLWxkZmxhZ3MgIiQkKCQoMilfTERGTEFHUykiIFwKPiAgCS1tb2RjYWNoZXJ3IFwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
