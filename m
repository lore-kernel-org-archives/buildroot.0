Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE16E67485
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 22:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 828E780AFE;
	Thu, 31 Oct 2024 22:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMl2Fb2S5Thj; Thu, 31 Oct 2024 22:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 776B480AF6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 776B480AF6;
	Thu, 31 Oct 2024 22:11:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD475E4F
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B2A5606CC
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:11:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xzg16IkovhPK for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 22:11:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9664360611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9664360611
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9664360611
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 22:11:16 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4315839a7c9so12277135e9.3
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 15:11:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730412674; x=1731017474;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=noTF0Tc8/DiTcTfXHncS0k+9IJLuE+z2RxaGpPMyNBU=;
 b=cMDVeQ8dePCtHFQAcXpAZzi347DRHdhAbR8xZrlv+OJvHfvxXeNSmuamsuqIvWvn+S
 EvH4pOTtuJfWf1srn1AgpiypqKUj3+deeamBo0fx+9I4hs2xpYUXdvUNXlKcDXaBEaT4
 J7A4gwYBsTAOEhXllyY4DJHi7AcST2mF2sGRgvFOp1dpqMHibs78ImgSWB6K4ZYmEHVf
 uAl4DUBhUm3iVjTeVO0SsvzXAMUeGkqRh6c1acSUZFVSCpO0b7rG7MGdCfJjnV+OOae3
 ZF3EbIdXU40ZJ5mjmodBalTqSsXqq6ckCZMDZlxWjo5NL0JCecNa4aE4GaaqulPFCndc
 TWcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7buSwPutjungpbmJFNIW5kxiOgsTaTCJmtFPJIWjAkxr9eSqWE2wtfqs/1Wg4Rs1T5fjWxNyFbwg=@buildroot.org
X-Gm-Message-State: AOJu0Yy+FwNoPm1LxbHMPwWoD4JwX0hSyHYA7vryv0ioX2ZxFlDOAy2q
 7QM1sx2pol69E9sJhUt7Y1m9ADPVmIaH0TSJqXQdchEGcT/VQnP3serBCW6wE9tY5b01RkGEWTw
 /
X-Google-Smtp-Source: AGHT+IFijFGYpIJLVUZp7ibD70F+38bfH3olRcO1zZvTxfk8stJ9lUnnnRhYx/KttYKWWaU0kRlH2g==
X-Received: by 2002:a05:600c:354c:b0:426:6455:f124 with SMTP id
 5b1f17b1804b1-4319ab8dfeemr182001045e9.0.1730412674608; 
 Thu, 31 Oct 2024 15:11:14 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431bd91093csm72075965e9.15.2024.10.31.15.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 15:11:14 -0700 (PDT)
Message-ID: <95e1bc8e-6908-4eec-a4f4-446bfbe5e575@smile.fr>
Date: Thu, 31 Oct 2024 23:11:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
References: <20241031213348.2057705-1-ju.o@free.fr>
 <20241031213348.2057705-8-ju.o@free.fr>
Content-Language: fr
In-Reply-To: <20241031213348.2057705-8-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730412674; x=1731017474; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=noTF0Tc8/DiTcTfXHncS0k+9IJLuE+z2RxaGpPMyNBU=;
 b=KSXoOBc20+hYZYnY0PvLIp31YRT+Zl4Q+4011E7CiiWbjqUF9uS9kYF8TXexDWSAEK
 8st9DQ/ThWlVEZrYUoDbM6bsHmF3dTOth5dMPejBexT5FOXjznwx6RCF4LL+0rDt+09B
 3Bgv+YDZuZ76SkVoScH6DTotBRttktOtsWKU8=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=KSXoOBc2
Subject: Re: [Buildroot] [PATCH v3 7/8] support/testing: test_fwts: update
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
cyBkaXNhYmxlZC4KPiAKPiBUaGlzIGNvbW1pdCB1cGRhdGVzIEFURiB0byAyLjExLCBhbmQgZW5h
YmxlcyBob3N0LXFlbXUgaW4gdGhlIGJ1aWxkLAo+IHRvIGJlIHVzZWQgYnkgdGhlIHJ1bnRpbWUg
dGVzdCBpbmZyYXN0cnVjdHVyZS4KPiAKPiBUaG9zZSBjaGFuZ2VzIGFyZSBmaXhpbmcgdGhpcyB0
ZXN0LCB3aGljaCBpcyB3aHkgdGhpcyBjb21taXQgcmUtZW5hYmxlcwo+IGl0IGJ5IHJlbW92aW5n
IHRoZSBza2lwVGVzdCgpIGludm9jYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogSnVsaWVuIE9s
aXZhaW4gPGp1Lm9AZnJlZS5mcj4KClNhbWUgcXVlc3Rpb24gYWJvdXQgbmVvdmVyc2UtbjEuCgpS
ZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJl
Z2FyZHMsClJvbWFpbgoKCj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rl
c3RfZnd0cy5weSB8IDggKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9md3RzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9md3RzLnB5Cj4gaW5kZXggMmM5ODczZWU1NC4uNWI3OWExN2UzMyAxMDA2NDQKPiAtLS0gYS9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2Z3dHMucHkKPiArKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2Z3dHMucHkKPiBAQCAtMjYsNyArMjYsNyBAQCBj
bGFzcyBUZXN0Rnd0cyhpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAgIEJSMl9UQVJH
RVRfR1JVQjJfQVJNNjRfRUZJPXkKPiAgICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJ
Uk1XQVJFPXkKPiAgICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NVU1RP
TV9WRVJTSU9OPXkKPiAtICAgICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0NV
U1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi45Igo+ICsgICAgICAgIEJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9InYyLjExIgo+ICAgICAgICAgIEJSMl9U
QVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfUExBVEZPUk09InFlbXVfc2JzYSIKPiAgICAgICAg
ICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0ZJUD15Cj4gICAgICAgICAgQlIyX1BB
Q0tBR0VfRldUUz15Cj4gQEAgLTM0LDEyICszNCwxMCBAQCBjbGFzcyBUZXN0Rnd0cyhpbmZyYS5i
YXNldGVzdC5CUlRlc3QpOgo+ICAgICAgICAgIEJSMl9QQUNLQUdFX0hPU1RfR0VOSU1BR0U9eQo+
ICAgICAgICAgIEJSMl9QQUNLQUdFX0hPU1RfRE9TRlNUT09MUz15Cj4gICAgICAgICAgQlIyX1BB
Q0tBR0VfSE9TVF9NVE9PTFM9eQo+ICsgICAgICAgIEJSMl9QQUNLQUdFX0hPU1RfUUVNVT15Cj4g
KyAgICAgICAgQlIyX1BBQ0tBR0VfSE9TVF9RRU1VX1NZU1RFTV9NT0RFPXkKPiAgICAgICAgICAi
IiIKPiAgCj4gLSAgICBkZWYgc2V0VXAoc2VsZik6Cj4gLSAgICAgICAgc2VsZi5za2lwVGVzdCgi
SW5jb21wYXRpYmxlIFFFbXUgNS4yLjAgKERvY2tlciBpbWFnZSkgLyAiCj4gLSAgICAgICAgICAg
ICAgICAgICAgICAiRURLMiAoc3RhYmxlMjAyNDA1KSB2ZXJzaW9ucy4iKQo+IC0KPiAgICAgIGRl
ZiB0ZXN0X3J1bihzZWxmKToKPiAgICAgICAgICBoZGEgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWls
ZGRpciwgImltYWdlcyIsICJkaXNrLmltZyIpCj4gICAgICAgICAgZmxhc2gwID0gb3MucGF0aC5q
b2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAiU0JTQV9GTEFTSDAuZmQiKQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
