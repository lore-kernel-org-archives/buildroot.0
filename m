Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294E5C48260
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 20:09:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7E386069A;
	Fri, 16 Feb 2024 20:09:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fH1JW4tgmm0; Fri, 16 Feb 2024 20:09:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3209606ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3209606ED;
	Fri, 16 Feb 2024 20:09:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD9C31BF300
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 20:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB2A96069A
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 20:09:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4LnhyO_awRhV for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 20:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com;
 envelope-from=vineetg@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8264F605DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8264F605DA
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8264F605DA
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 20:09:36 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1d8da50bffaso15387855ad.2
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 12:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708114176; x=1708718976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NHjZrHQpnSD3csF2dmdeZxRw2LsN9eQ7KmubX62QkZ8=;
 b=WqSiTKNs+sDqdj7HteN2GKXNAEAfempR7DOBwaBIXWD82vwpeSR+1Qn/ISPzcoNJf7
 KtDzHdUsg301YD3wH3r0dzVYT0d54y/ZGGW9CPD4gp3emUgNWAKJAlH6ZAahe+dpsH/L
 ZDJz3Uk38G2MdUnHfqSJ789WSqPKcWTkrqNRBL8k9NEh503i0VYWwoaC5A7S9GTyBY5a
 SnZXr3q2KWWKqHV/rjU4t+PhXh8MQrvVu7kAu8XX+cZ8HMZxJcC/ljjlAAIapTuiMCw/
 TdogtCHv7ZrxRpmMuJvatjHZNl2WIU02EjKbn1vYobbLi09sKEB9Hy5512xN4yhX9UQb
 bQDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO6A0N3W8sf47P6YsKjJ61BCbeSM5Cbi+4UVYC+iSss8IrqEL4FVDrHYpIw4XaFcUAbAmt3DohL6pfHvE53kUGO2nMLLXVfw==
X-Gm-Message-State: AOJu0YxLQl2E+prdX26Vudd+4Pw8LPAZIDTFrENfHd1tWaWEhIstrUnA
 Hh5gPYnd5o0jJTVTu1716pTsKx3Oujzv9YAow+hrZcKAgItEnL+RiaaXbtShki+5PznABH7fhgL
 S
X-Google-Smtp-Source: AGHT+IHpYF6QfLAGb9UDxHp7/Yx9Scf4qAUrEfBLjiGNMj/zw1nQ4ik6F4HNsyQwuWGnwIyly143XQ==
X-Received: by 2002:a17:902:e884:b0:1db:a376:4566 with SMTP id
 w4-20020a170902e88400b001dba3764566mr4551264plg.15.1708114175725; 
 Fri, 16 Feb 2024 12:09:35 -0800 (PST)
Received: from [192.168.50.117] (c-24-5-188-125.hsd1.ca.comcast.net.
 [24.5.188.125]) by smtp.gmail.com with ESMTPSA id
 jc13-20020a17090325cd00b001db37fd26bcsm251208plb.116.2024.02.16.12.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Feb 2024 12:09:35 -0800 (PST)
Message-ID: <ea632a96-92b4-451c-9a0e-8fe2069caf81@rivosinc.com>
Date: Fri, 16 Feb 2024 12:09:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240214224355.551010-1-vineetg@rivosinc.com>
 <20240214230114.551779-1-vineetg@rivosinc.com>
 <2111ebed-d6b8-46d1-b109-9cd468be5ca0@mind.be>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <2111ebed-d6b8-46d1-b109-9cd468be5ca0@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708114176; x=1708718976;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NHjZrHQpnSD3csF2dmdeZxRw2LsN9eQ7KmubX62QkZ8=;
 b=OAevireqYF9xaDxNhs4Yvy4fSAmOqjdh7hQ5T2BhONV151DWLok0npwiADkVmmhPqY
 ZC6+uuMfqpR2Tt5tVfTl21zK6JmNpcqQaPRm/o9ceG/GMEWyiZl6y6U3LmeZDmZZuNhY
 mOXRMpi3TdLNT5b3HKxJJ2r7I8bjLVSFMuEZWSG03Onw77cUY9pYA5XVFhHymdmkFzEF
 bWOpSmtnJqLQD3K/svNGPaZubgKlLAYsPGVX2AqmC4i/kjB6Gqu2hZWDJnVBgtFA1J2G
 4lmmOmjnuRz4oSOiNQt3JfHelm6/u3gD29Ff8eSN0jno7sk/1qGRA9b7Gd3GMgVVgyKt
 K74g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=OAevireq
Subject: Re: [Buildroot] [PATCH v2] glibc: build: honor toplevel
 BR2_TARGET_OPTIMIZATION
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
Cc: Charlie Jenkins <charlie@rivosinc.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMi8xNC8yNCAyMzo1MywgQXJub3V0IFZhbmRlY2FwcGVsbGUgd3JvdGU6Cj4KPiBPbiAxNS8w
Mi8yMDI0IDAwOjAxLCBWaW5lZXQgR3VwdGEgd3JvdGU6Cj4+IGdsaWJjIHRob3VnaCBwYXJ0IG9m
IHRvb2xjaGFpbiBpcyB0ZWNobmljYWxseSB0YXJnZXQgYmluYXJ5IGFuZCB0aHVzCj4+IG5lZWRz
IHRvIGJlIGJ1aWx0IHdpdGggQlIyX1RBUkdFVF9PUFRJTUlaQVRJT04gaW4gY2FzZSB1c2VycyB3
YW50IHRvCj4+IGZvcmNlIGEgY2VydGFpbiBidWlsZCB0b29nbGUgZnJvbSB0b3AgbGV2ZWwuCj4g
ICBCUjJfVEFSR0VUX09QVElNSVpBVElPTiBpcyBlbmNvZGVkIGluIHRoZSB0b29sY2hhaW4gd3Jh
cHBlciwgYW5kIGFzIGZhciBhcyBJIAo+IGNhbiBzZWUgZ2xpYmMgaXMgYnVpbHQgd2l0aCB0aGUg
dG9vbGNoYWluIHdyYXBwZXIuLi4gSSBoYXZlbid0IChyZSl0ZXN0ZWQgaXQsIAo+IGJ1dCBpdCBz
aG91bGQgYmUgdGhlIGNhc2UuLi4KCkluZGVlZCB0aGUgdG9nZ2xlcyBhcmUgZWZmZWN0aXZlbHkg
YmVpbmcgdXNlZCBpbiB0aGUgYnVpbGQsIGV2ZW4gaWYgbm90CnZpc2libGUgaW4gdGhlIGJ1aWxk
IGxvZ3MsIHdoaWNoIGlzIHdoYXQgdHJpcHBlZCBtZSB1cCBpbiB0aGUgZmlyc3QKcGxhY2UuIEFu
ZCBiZWZvcmUgc2VuZGluZyB0aGUgcGF0Y2ggSSBkaWQgd29uZGVyIGhvdyBidWlsZHJvb3QgY291
bGQKaGF2ZSBzdWNoIGFuIG9idmlvdXMgZGVmaWNpZW5jeSBmb3Igc28gbG9uZy4gSW4gdGhlIHBh
c3QgSSd2ZSBteXNlbGYKc2VudCBhIGZldyBwYXRjaGVzIHRvIGRlZmNvbmZpZ3MgdG8gYWZmZWN0
IHN1Y2ggYnVpbGQgdG9nZ2xlcyBpbiBmaXJzdApwbGFjZSA7LSkKCsKgwqAgMjAyMS0wMS0xNiAz
MjExM2M4YTI1YzAgY29uZmlncy9zbnBzX2FyY2hzMzhfaHNka19kZWZjb25maWc6IHVzZQpoYXJk
LWZsb2F0IMKgCgoKPiAgIEJSMl9UQVJHRVRfT1BUSU1JWkFUSU9OIHdhcyBhZGRlZCB0byB0aGUg
d3JhcHBlciBpbiBjb21taXQgCj4gYjk1ZTQzNmVlMGM5ZTQ2MzhkYzc5NzY2ZGEwZDE3OTI3YzY2
NDFjZSBpbiAyMDExLgo+Cj4gICBUaGUgd3JhcHBlciB3YXMgYWRkZWQgdG8gaG9zdC1nY2MtaW5p
dGlhbCAod2hpY2ggaXMgdXNlZCBpbiB0aGUgZ2xpYmMgYnVpbGQpIAo+IGluIGNvbW1pdCA5MTlj
MDZjMjgyOTVmMTljYTQ5NDU5Yjk4ZDg5NTQxNDhiMzgxMzYwIGluIDIwMTUuCgpJIHN0aWxsIHRo
aW5rIHRoYXQgYW4gZXhwbGljaXQgY29tbWVudCBzdWNoIGFzIGJlbG93IHdpbGwgaGVscCBhIHBv
b3IKbG9zdCBzb3VsIG9mIGZ1dHVyZSBnb2luZyBnaXQgZ3JlcC4KCi0tLS0tLS0tLS0+CkZyb20g
NWI4MmUxNjlhYTIxOTE2ODMzYjYyZmU1MTIyYzg0NGNlYzYyZjQ4NiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKRnJvbTogVmluZWV0IEd1cHRhIDx2aW5lZXRnQHJpdm9zaW5jLmNvbT4KRGF0ZTog
RnJpLCAxNiBGZWIgMjAyNCAxMjowNzowNyAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGdsaWJjOiBi
dWlsZDogYWRkIGNvbW1lbnQgYWJvdXQgQlIyX1RBUkdFVF9PUFRJTUlaQVRJT04KClNpZ25lZC1v
ZmYtYnk6IFZpbmVldCBHdXB0YSA8dmluZWV0Z0ByaXZvc2luYy5jb20+Ci0tLQrCoHBhY2thZ2Uv
Z2xpYmMvZ2xpYmMubWsgfCAzICsrKwrCoDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2dsaWJjL2dsaWJjLm1rIGIvcGFja2FnZS9nbGliYy9nbGli
Yy5tawppbmRleCBkMTk4ZDZmMDRjYjIuLmZhY2FkMGIyOTk1OCAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9nbGliYy9nbGliYy5taworKysgYi9wYWNrYWdlL2dsaWJjL2dsaWJjLm1rCkBAIC04MCw2ICs4
MCw5IEBAIEdMSUJDX0lOU1RBTExfU1RBR0lORyA9IFlFUwrCoArCoEdMSUJDX0lOU1RBTExfU1RB
R0lOR19PUFRTID0gaW5zdGFsbF9yb290PSQoU1RBR0lOR19ESVIpIGluc3RhbGwKwqAKKyMgTm90
ZSB0aGF0IEJSMl9UQVJHRVRfT1BUSU1JWkFUSU9OIHRvZ2dsZXMgYXJlIGltcGxpY2l0bHkgcGFz
c2VkCisjIGhlcmUgdmlhIHRoZSB0b29sY2hhaW4gd3JhcHBlciBzZXR1cAorCsKgIyBUaHVtYiBi
dWlsZCBpcyBicm9rZW4sIGJ1aWxkIGluIEFSTSBtb2RlCsKgaWZlcSAoJChCUjJfQVJNX0lOU1RS
VUNUSU9OU19USFVNQikseSkKwqBHTElCQ19FWFRSQV9DRkxBR1MgKz0gLW1hcm0KLS0gCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
