Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D361C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 06:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B612560707;
	Sat, 12 Jul 2025 06:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qYY61OAOlxbO; Sat, 12 Jul 2025 06:32:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04DEC61298
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04DEC61298;
	Sat, 12 Jul 2025 06:32:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A88106
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7ED3B80B00
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:32:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrRcJMAlUUFn for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 06:32:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.54;
 helo=mail-ej1-f54.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CC63680AF3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC63680AF3
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC63680AF3
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 06:32:55 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id
 a640c23a62f3a-ae3c5f666bfso473613266b.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 23:32:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752301974; x=1752906774;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S1q2avwhL53iwXuMVYfjF2JVxNYtrWDEXZYY+IX6cd8=;
 b=DKTSLaUqpK8BhRfT+zquZIg7ovp7KYbrxKxVYAnehvsvDLWUhF/S6kTqwb54vb3/K9
 s4pQ7m5EVv/LUisRGa6n47pqOAje1yItqg4VJ3ngW+dJNK7U/yWwLQ2N3i9EHhE0WW0W
 wGfs9CCyOAgyKH8xKD/t9wMuEpZvmCdWIvBykbgEBfPvLEHoyC3Jp/G7GBLz3BJhgDP7
 ZLwwveZZ0wwtj2YHXLNSAQ8pqsrzPKEk951bAZhFuC/0ed40Jcsu5iEhia09pAYKb+4i
 KoUeYgUC4uChVSRyD4wHenc6Pm2rf31SZbKOPxf57TTaKIexYE/fj4gzQ0Y/1UghztF3
 Urug==
X-Gm-Message-State: AOJu0Yx5f2bdHHO4SwZGUDDa2G2/X7+LHB3T27jcWwRXvHKGLjIIGFv2
 fw/nqP/r9iWkE9xq9n3J1k/bqps94wIPxUYJHrEv99FVevIr2OOMpzisdvy4CA==
X-Gm-Gg: ASbGnctsJCzSnrNSK/so+PNz/futq5RzufLv8FtiK9qVYa9hAPM7Lme3ZxX5Ej4hQ9I
 cVDjwnLUXWCbVQSR+1ZVnQuvqT6httMjPbnnggJZsPj4++Jn1jOa0kF9RYkyL4QM3eRyKvYaYoC
 WAEf+45TS9dNe0mwdIAvX96DjiCNPa3jGgHJ7N14KeQBfq8cE+t2PrIanJ7j3jsuEnOjbciVY9n
 ZcZBLcPxgbSIMYc208gR8HMLmBgjUXQe0YS3ygDjZwiSnFhJuwP6cvlYN7BhTOc8zJRExbUX2lR
 cQiJCtG/fdLurT+CnrU1yzYGAtYRsenfP7CJKhFkH6Aog865MAaLZhGJ40LwkAUplFGR7oBT9V8
 Y8hxPY8I4eYq/rFDRcmJNx5CD7yWzJ6Tc/2bsrOoPKELry1sAZiRMwA==
X-Google-Smtp-Source: AGHT+IGwhFYmsPPII8+1ZdiK/XW9QyAs2ciS19nmu58Sla5oF6zwI5l5pLGHYSJA5wojG4Wyh72S9Q==
X-Received: by 2002:a17:907:970b:b0:ae3:a78d:a08a with SMTP id
 a640c23a62f3a-ae6fbc23543mr620881166b.6.1752301973491; 
 Fri, 11 Jul 2025 23:32:53 -0700 (PDT)
Received: from tpx1 (ltea-047-064-115-149.pools.arcor-ip.net. [47.64.115.149])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae6e82964a9sm432601466b.141.2025.07.11.23.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 23:32:53 -0700 (PDT)
Date: Sat, 12 Jul 2025 08:32:51 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>
Cc: buildroot@buildroot.org, Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20250712083251.2bc54b34@tpx1>
In-Reply-To: <20250711164407.799041-3-alex.bennee@linaro.org>
References: <20250711164407.799041-1-alex.bennee@linaro.org>
 <20250711164407.799041-3-alex.bennee@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [RFC PATCH v2 2/7] package/kvm-unit-tests: assume
 AArch64 supports KVM
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

QW0gRnJpLCAxMSBKdWwgMjAyNSAxNzo0NDowMCArMDEwMApzY2hyaWViIEFsZXggQmVubsOpZSA8
YWxleC5iZW5uZWVAbGluYXJvLm9yZz46Cgo+IEFsdGhvdWdoIGl0IGlzIHBvc3NpYmxlIHRvIGNv
bmZpZ3VyZSBhbiBBQXJjaDY0IENQVSB3aXRob3V0IHN1cHBvcnQKPiBmb3IgRUwyIGluIHByYWN0
aWNlIGFsbCB0aGUgY29tbW9uIEFBcmNoNjQgaGF2ZSBzdXBwb3J0ZWQKPiB2aXJ0dWFsaXNhdGlv
biBmcm9tIHRoZSBzdGFydC4KPiAKPiBJZiB3ZSByZWFsbHkgd2FudGVkIHRvIGJlIHN0cmljdCB3
ZSBjb3VsZCBibGFja2xpc3Qga25vd24gbm9uLUVMMiBDUFVzCj4gYnV0IEFGQUlDVCBhbGwgdGhl
IGN1cnJlbnQgb25lcyBpbiB0aGUgY29uZmlnIGhhdmUgRUwyLgo+IAo+IEkgc2hvdWxkIGFsc28g
bm90ZSBLVk0gb24gQXJtIGlzIGRlcHJlY2F0ZWQgYW5kIHdhcyByZW1vdmVkIGZyb20gdGhlCj4g
a2VybmVsIGluIHY2LjEwLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXggQmVubsOpZSA8YWxleC5i
ZW5uZWVAbGluYXJvLm9yZz4KPiAKPiAtLS0KPiB2Mgo+ICAgLSBsZWF2ZSBCUjJfY29ydGV4X2E3
NiBhbmQgQlIyX2NvcnRleF9hNzZfYTU1IGluIHBsYWNlIGFzIGNhbiBiZQo+ICAgdXNlZCB3aXRo
IGFybTMyCj4gLS0tCj4gIHBhY2thZ2Uva3ZtLXVuaXQtdGVzdHMvQ29uZmlnLmluIHwgOCArKysr
LS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoK
UmV2aWV3ZWQtYnk6IFRob21hcyBIdXRoIDxodXRoQHR1eGZhbWlseS5vcmc+Cl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
