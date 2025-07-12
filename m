Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA81C83F1A
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 06:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8231606EE;
	Sat, 12 Jul 2025 06:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sl9itvNJknlw; Sat, 12 Jul 2025 06:29:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EE93608C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EE93608C1;
	Sat, 12 Jul 2025 06:29:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86DB31CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77F5F82178
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:29:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bE7oOo4GVfMC for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 06:29:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.42;
 helo=mail-ej1-f42.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED3078217A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED3078217A
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED3078217A
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:29:09 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-ae0dd7ac1f5so558595166b.2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 23:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752301748; x=1752906548;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z0bmc1JCcrMD+Fy26dgrt3YtAmHcC+2lV3R6KRCmQ6g=;
 b=BPQlkBbWfbeUXbPdHmC4G4y0kCELmSdqTeUIcjnpyEiq9g7Iz3NIieOKprfVoMGUmN
 4Nobwsmqg4Aw+omzygMzdC5uHJBilzrZ9CoY0yQA/nbaZAUvoYIapqNmVBAqsZ5YiMOH
 fq1mJjT6xajeH1URE5ghaWQP8cNRqpvjlo83nC0lTL5UGPjn29SlJXPW4z71lT6wQbvU
 pAQabKqwJ5CPKf7hQuxfqvP/LY8pCM1yBKLs5fXak/I8Aie75vvVcTCRTK7Eau+Fm8nl
 Zaw+us5j1sD89wStbAfflg5Dn4MyKzLzCVsWnx0ljBVlQSCQ5sZAqwb4GCNa+OO7zrqx
 bNzQ==
X-Gm-Message-State: AOJu0YywD4blOIu34WApE4ZuxBO+TMjrJUJtR5WtfPLPHcC0rlFFCK8e
 Pns3ntedv1PipbfuNGCvT7dVEhh3cpaVk9jmzYftnlW5fT9yhtCMF67c
X-Gm-Gg: ASbGncsK2bcci3Oa3AHcBU8ZcXFtI6T0BqI8dw6R2O0Di7D+tpZRilKUNlqhUuObzlU
 p63uKqBVXsUsEJsmswSZ4bgJS6lLUtDa0I5xF/I/wen/BOLhlB/w7IvHVboUDeO4iMhbc6j+UeS
 6DxY1N/AhuIvZmhOUXdbDHp/QFifSBqNkoqkD4M3bR8awRYSupxGV7gzQh8wl4Tn5KFYufv7/Xa
 nbbY0QnXRtgfHNqED2BRWxLTHo+05MM6ItLuJQkFXxD07tBKvImrT1GcrvC5+VK+fW3rP4etZRd
 pUDk5SQQMMSnYqwW6W5dmeqT6oykYBNM5yo4p3YllyXMBqxZBNRwpVdgwM1IIGm8L4elhxxXIAy
 U6V5v3YU4HzUm8vT+TI0PfDMZqkgrhiS9UfFl9Pf9ikxS7JWW2Wj6Pw==
X-Google-Smtp-Source: AGHT+IENGWpgA+dN2OlOr2qTTLy9gin+Gx960i5WnXFpMnaxyKJEjF5XjlIzY5R2MgF5nEDG8um3AQ==
X-Received: by 2002:a17:907:d716:b0:ae3:7255:ba53 with SMTP id
 a640c23a62f3a-ae6fc1e692cmr595418866b.53.1752301747570; 
 Fri, 11 Jul 2025 23:29:07 -0700 (PDT)
Received: from tpx1 (ltea-047-064-115-149.pools.arcor-ip.net. [47.64.115.149])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e7e9105csm425671966b.20.2025.07.11.23.29.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 23:29:07 -0700 (PDT)
Date: Sat, 12 Jul 2025 08:29:05 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>, jesse@rivosinc.com
Message-ID: <20250712082905.347c10dd@tpx1>
In-Reply-To: <20250711164407.799041-6-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
 <20250711164407.799041-6-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [RFC PATCH v2 5/7] package/kvm-unit-tests: bump to
 2025-06-05
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gRnJpLCAxMSBKdWwgMjAyNSAxNzo0NDowMyArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IFVwZGF0ZSB0byB0aGUgY3VycmVudCB2ZXJzaW9u
IG9mIEtWTSB1bml0IHRlc3RzLiBJbXBvcnRhbnRseSBjaGFuZ2VzCj4gdGhlIGRlZmF1bHQgcGFn
ZSBzaXplIHRvIDRrIChpbnN0ZWFkIG9mIDY0aykgd2hpY2ggbWlnaHQgZXhwbGFpbiB0aGUKPiBk
aWZmaWN1bHR5IGluIHJ1bm5pbmcgdGhlIHRlc3RzIHVuZGVyIEhWRiBvbiBBcHBsZSBTaWxpY29u
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9y
Zz4KPiAtLS0KPiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5oYXNoIHwg
MiArLQo+ICBwYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1rICAgfCAyICst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhhc2gg
Yi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLmhhc2gKPiBpbmRleCBkNGRi
OWYyYjc1Li5hZDA5MjJkZjU5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMv
a3ZtLXVuaXQtdGVzdHMuaGFzaAo+ICsrKyBiL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVu
aXQtdGVzdHMuaGFzaAo+IEBAIC0xLDQgKzEsNCBAQAo+ICAjIExvY2FsbHkgY29tcHV0ZWQKPiAt
c2hhMjU2ICA4NjM2OTk0ZTEwMjQwNzA1ZjEwYTkxNTBlZjY4OGFlNjgzMmQwZWEwZGNjODg2MGM4
MjZjNjQ1ZWNmYzExNjlmICBrdm0tdW5pdC10ZXN0cy12MjAyNC0wMS0wOC50YXIuYnoyCj4gK3No
YTI1NiAgNjAwMTViMDIzZjM0MjYxYzEzNGQ3MTRmNDY3MDkyNmFjODE0ODNlMjg2YTE2NDc1ZWI0
YTVjZWRhYjAwZWVmYSAga3ZtLXVuaXQtdGVzdHMtdjIwMjUtMDYtMDUudGFyLmJ6Mgo+ICBzaGEy
NTYgIGIzYzljYTllMjU3ZjJlYWFlMDcwY2YwY2NkZjg3NzA3NjRmMDVhOTQ3YTM5YTgzNWU2MzM0
MTM3NTBhNTc3N2IgIENPUFlSSUdIVAo+ICBzaGEyNTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYx
ODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAxMDUyMWI4ODA2NDMgIExJQ0VOU0UKPiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayBiL3BhY2th
Z2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQtdGVzdHMubWsKPiBpbmRleCA3M2QyMGQ2YjJlLi44
MDhlYTBkNDBiIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uva3ZtLXVuaXQtdGVzdHMva3ZtLXVuaXQt
dGVzdHMubWsKPiArKysgYi9wYWNrYWdlL2t2bS11bml0LXRlc3RzL2t2bS11bml0LXRlc3RzLm1r
Cj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4g
LUtWTV9VTklUX1RFU1RTX1ZFUlNJT04gPSAyMDI0LTAxLTA4Cj4gK0tWTV9VTklUX1RFU1RTX1ZF
UlNJT04gPSAyMDI1LTA2LTA1Cj4gIEtWTV9VTklUX1RFU1RTX1NPVVJDRSA9IGt2bS11bml0LXRl
c3RzLXYkKEtWTV9VTklUX1RFU1RTX1ZFUlNJT04pLnRhci5iejIKPiAgS1ZNX1VOSVRfVEVTVFNf
U0lURSA9IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy8t
L2FyY2hpdmUvdiQoS1ZNX1VOSVRfVEVTVFNfVkVSU0lPTikKPiAgS1ZNX1VOSVRfVEVTVFNfTElD
RU5TRSA9IEdQTC0yLjAsIExHUEwtMi4wCgpGWUksIHRoZXJlIHdhcyBhbm90aGVyIHBhdGNoIGRv
aW5nIHRoaXMgYWxyZWFkeSwgd2hpY2ggYWxzbyBlbmFibGVkIFJJU0MtVjoKCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRyb290LzIwMjUtSnVuZS83ODExNzUuaHRt
bAoKKGhvd2V2ZXIsIEkgY2Fubm90IHNwb3QgdGhlIG9yaWdpbmFsIHBhdGNoIGluIHRoZSBsaXN0
IGFyY2hpdmUsIG9ubHkgbXkKcmVwbHksIHNvIG1heWJlIHRoZSBvcmlnaW5hbCBuZXZlciBtYWRl
IGl0IHRvIHRoZSBsaXN0PykKCkFueXdheSwgbWF5YmUgaXQncyBiZXR0ZXIgdG8gc3BsaXQgdGhl
IFJJU0MtViBlbmFibGVtZW50IGZyb20gdGhlIHZlcnNpb24KdXBkYXRlIGFueXdheSwgc28gZm9y
IHRoaXMgcGF0Y2ggaGVyZToKClJldmlld2VkLWJ5OiBUaG9tYXMgSHV0aCA8aHV0aEB0dXhmYW1p
bHkub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
