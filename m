Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 801C0E67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 22:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D7860D6D;
	Thu, 31 Oct 2024 22:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHGRwb4zqgUJ; Thu, 31 Oct 2024 22:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49A7860D6E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A7860D6E;
	Thu, 31 Oct 2024 22:09:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12C5B5E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E84BF60D72
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8IyoAJxkIooI for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 22:09:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA43860D6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA43860D6D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA43860D6D
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:09:41 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so15168515e9.1
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 15:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730412580; x=1731017380;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9qSE9ZZfg0h3ms+CQ29acRPf7vbLtlyaDe0l+sHLwJY=;
 b=CEJaPpAfnES8GGfw/Wf6L4Coldf5gXcB4yuW1Ge7LEZ2brHkfZO8YXWoR9L7bTkqaY
 7bSuvVIt3djC9xLb/5O8WI+sgZnYcFBrS29WEP5pyucOTNZwE0mNRQYsPoVw2qZcxkQd
 0Sn3+QtaVF3ZlnNvpMh5WaTll76dR41OTOVZEGSJyvCaidqTmjJFfBIxuwhm4jo7u07/
 0tTfhQKZnYdj4hrEofvo4AE0wwjwKnyECh+p8jly4jj24EOg2kJ3IYkt17tu2v8QBKZd
 /98c5+KTSst8sQM+DCpdMBYWjN0cbpjBFDOOzoViYZADwGJIcjvW3KdB/yOhL5r2dII2
 h5+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqk7ZKwWNyzeWhhywusToDuuwkj+8FqfIQcMLAftt7kq0x6RUyXPUeFtrLWqELwJgw0j1pb7zuE8c=@buildroot.org
X-Gm-Message-State: AOJu0YwtNQsW04fh1JcrLDwLQY1u24tjENmgcIXC3BBn6ETsnYS7UHGh
 7rKbUKovVGUqdHTRhgh4io8uVASer5wajoir/vgLfRpC83nDFVSPwmjG8i0/MuA=
X-Google-Smtp-Source: AGHT+IHwjxZjDsPYMYc1hBuuFYAMiDpSnZuZ5dadUHoFOLFMiJ0G2h0nY1n1J9U+FsbO2R7TLPw9FA==
X-Received: by 2002:a5d:5a04:0:b0:37c:cfa4:d998 with SMTP id
 ffacd0b85a97d-381c7ae0cf8mr1467896f8f.49.1730412579774; 
 Thu, 31 Oct 2024 15:09:39 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c116ae82sm3234221f8f.93.2024.10.31.15.09.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 15:09:39 -0700 (PDT)
Message-ID: <62b6862c-a837-4267-8aa1-f54ab5acb667@smile.fr>
Date: Thu, 31 Oct 2024 23:09:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-7-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241031213348.2057705-7-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730412580; x=1731017380; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9qSE9ZZfg0h3ms+CQ29acRPf7vbLtlyaDe0l+sHLwJY=;
 b=ePAKVtDAnxIVl/3OayF2RXnPzfhN25hrddTNJtVuNswvDCIdqU74hUBvw7biyBjhe9
 NyzoAHvTPlAnsL+K9MeSK3VEFz6s6aKn25DxayS158yLQ07xSxSDKdpTLC6Vv3rzWrG7
 uPdXWfV7e4AKhH7LxaFFTpNWBDp9WEOJ++PmQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ePAKVtDA
Subject: Re: [Buildroot] [PATCH v3 6/8] support/testing: test_edk2: update
 and re-enable the test
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

SGVsbG8gSnVsaWVuLAoKTGUgMzEvMTAvMjAyNCDDoCAyMjozMywgSnVsaWVuIE9saXZhaW4gYSDD
qWNyaXTCoDoKPiBUaGUgRURLMiBidW1wIHRvIHN0YWJsZTIwMjQwNSBpbnRyb2R1Y2VkIGFuIGlu
Y29tcGF0aWJpbGl0eSB3aXRoIHRoZQo+IFFlbXUgdmVyc2lvbiA1LjIuMCBwcmVzZW50IGluIHRo
ZSByZWZlcmVuY2UgRG9ja2VyIGltYWdlLiBGb3IgdGhhdAo+IHJlYXNvbiwgdGhpcyB0ZXN0IHdh
cyBkaXNhYmxlZC4KPiAKPiBUaGlzIGNvbW1pdCB1cGRhdGVzIEFURiB0byAyLjExIGFuZCBrZXJu
ZWwgdG8gNi42LjU4LCBhbmQgZW5hYmxlcwo+IGhvc3QtcWVtdSBpbiB0aGUgYnVpbGQsIHRvIGJl
IHVzZWQgYnkgdGhlIHJ1bnRpbWUgdGVzdCBpbmZyYXN0cnVjdHVyZS4KPiAKPiBUaG9zZSBjaGFu
Z2VzIGFyZSBmaXhpbmcgdGhpcyB0ZXN0LCB3aGljaCBpcyB3aHkgdGhpcyBjb21taXQgcmUtZW5h
Ymxlcwo+IGl0IGJ5IHJlbW92aW5nIHRoZSBza2lwVGVzdCgpIGludm9jYXRpb24uCgpEbyB3ZSB3
YW50IHRvIHN3aXRjaCB0byBuZW92ZXJzZS1uMSA/ClRoZSB0ZXN0IHN0aWxsIHdvcmtzIHdpdGgg
Y29ydGV4LWE1Ny4KCk90aGVyd2lzZToKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQHNtaWxlLmZyPgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+Cj4gLS0tCj4gIHN1cHBvcnQvdGVzdGlu
Zy90ZXN0cy9ib290L3Rlc3RfZWRrMi5weSB8IDEwICsrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL2Jvb3QvdGVzdF9lZGsyLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL2Jvb3QvdGVzdF9lZGsyLnB5Cj4gaW5kZXggN2QzNTBmNTJkOS4uZTZiNzg1NTI4NCAxMDA2
NDQKPiAtLS0gYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIucHkKPiArKysg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIucHkKPiBAQCAtMTYsNyArMTYs
NyBAQCBjbGFzcyBUZXN0RWRrMihpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAgIEJS
Ml9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iLWMgYm9hcmQvcWVtdS9hYXJjaDY0LXNic2EvZ2Vu
aW1hZ2UuY2ZnIgo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUw9eQo+ICAgICAgICAgIEJSMl9M
SU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+IC0gICAgICAgIEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTAuMzQiCj4gKyAgICAgICAgQlIyX0xJTlVYX0tFUk5F
TF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi42LjU4Igo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJO
RUxfVVNFX0NVU1RPTV9DT05GSUc9eQo+ICAgICAgICAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X0NPTkZJR19GSUxFPSJzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvYm9vdC90ZXN0X2VkazIvbGludXgu
Y29uZmlnIgo+ICAgICAgICAgIEJSMl9UQVJHRVRfRURLMj15Cj4gQEAgLTI1LDE4ICsyNSwxNiBA
QCBjbGFzcyBUZXN0RWRrMihpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAgIEJSMl9U
QVJHRVRfR1JVQjJfQVJNNjRfRUZJPXkKPiAgICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVE
X0ZJUk1XQVJFPXkKPiAgICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NV
U1RPTV9WRVJTSU9OPXkKPiAtICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJF
X0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi45Igo+ICsgICAgICAgIEJSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjExIgo+ICAgICAgICAgIEJS
Ml9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExBVEZPUk09InFlbXVfc2JzYSIKPiAgICAg
ICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0ZJUD15Cj4gICAgICAgICAgQlIy
X1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gICAgICAgICAgQlIyX1BBQ0tBR0VfSE9TVF9ET1NG
U1RPT0xTPXkKPiAgICAgICAgICBCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cj4gKyAgICAgICAg
QlIyX1BBQ0tBR0VfSE9TVF9RRU1VPXkKPiArICAgICAgICBCUjJfUEFDS0FHRV9IT1NUX1FFTVVf
U1lTVEVNX01PREU9eQo+ICAgICAgICAgICIiIgo+ICAKPiAtICAgIGRlZiBzZXRVcChzZWxmKToK
PiAtICAgICAgICBzZWxmLnNraXBUZXN0KCJJbmNvbXBhdGlibGUgUUVtdSA1LjIuMCAoRG9ja2Vy
IGltYWdlKSAvICIKPiAtICAgICAgICAgICAgICAgICAgICAgICJFREsyIChzdGFibGUyMDI0MDUp
IHZlcnNpb25zLiIpCj4gLQo+ICAgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+ICAgICAgICAgIGhk
YSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgImRpc2suaW1nIikKPiAg
ICAgICAgICBmbGFzaDAgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdlcyIsICJT
QlNBX0ZMQVNIMC5mZCIpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
