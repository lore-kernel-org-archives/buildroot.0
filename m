Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54682C369D1
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 07:30:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 004EE80A4D;
	Thu, 24 Apr 2025 07:30:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TBd5FjlCbzKW; Thu, 24 Apr 2025 07:30:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25B4280CDE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25B4280CDE;
	Thu, 24 Apr 2025 07:30:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B34A28C
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 07:29:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B9C940DF2
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 07:29:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mgLs7V1PPt0t for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 07:29:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7AC3140DD4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC3140DD4
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7AC3140DD4
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 07:29:57 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-736e52948ebso728702b3a.1
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 00:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745479797; x=1746084597;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=b46SiaE0SnWXJV/CJvgjFHR/7jBwHZt98e0MVK+aHEY=;
 b=V6dXWUY8RxZhOk5UTi+ya5YzCiZKjkdLrxQOt55vQWwXWAyLGD1esO4TLdjEbThHsD
 xRdgrECOQ9DmTuurbJgC1mFO53z6mVGIyyEM1U5BTIH3hiUbX+s+LexiEz/Kb6RnfuHg
 Tw7+anAgEuiJDz7xUaJn4sM4hsJ/VzOcW3HrfOHut0YSMV9M8HzJRyOwIrA6jYiKZ6v8
 mjlAl+nr/0lxQQNCe4dW9uodUT0sSz+rN09q+IKywHtfnDCiFqzX1mJ1xpq5KdJA8chK
 l3facH3HMzLbX230T1n4jR4N6vOr5W71xSC2wG89+a3JqId06uq2Jvqe8m9rrb9foO8M
 E9hw==
X-Gm-Message-State: AOJu0YwNn3qN8fQdPBHEY1GgVvCVHt0t/3uTPKJtY7cXW/UwMaWSN8RC
 zzDH905KATcE4kXLcghNIHftobdCEkxJQurz5p2Qgi6iaucspMlXkxi7se1SgLvJW+Q1/X0TgN1
 5
X-Gm-Gg: ASbGncuqzj8bo+qvfVdpvknWW4ENwvkDbQsjPjfs90bUJwWmhVtY8QDJk+Iuw3PzbK2
 jXXuKSdXK2cIIu0i6s7EEkxhul89m5mOcrf2N8SlcF0SKb/lFKXFDpJDL/ak+ZWnfV46ULQPpm1
 rsySe4Xvs3oueEK+8r7BplpBA5ZERE0LjzevHUXCyuAfVOM9wkvAqZciUPDGxAVuxlnowSF78ZF
 bgP4DNjBgsfclNE0e9JazVuAkN7+guHpq6jtXdNim4qT13E+489AvdeURXWjCKCXQuFYDgdkWbE
 ug4c8XfN708Coe9x993WVVebZ4wyIhYume0T9EcfylJFq7GLRgzij97T
X-Google-Smtp-Source: AGHT+IFn2Qt/EGMxkgjWIQ6R1U4qz1usplgXPwMBWLL/lROd7LI5m7FHsgZuNusPqXLQHXyCz33QPw==
X-Received: by 2002:a05:6a21:6f87:b0:1f5:8655:3287 with SMTP id
 adf61e73a8af0-20444fc53f7mr2620461637.40.1745479796709; 
 Thu, 24 Apr 2025 00:29:56 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73e25a9feb9sm725663b3a.154.2025.04.24.00.29.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 00:29:55 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 24 Apr 2025 00:29:44 -0700
MIME-Version: 1.0
Message-Id: <20250424-fix_gmp_c23-v1-1-b2474a9585b6@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAGfoCWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMT3bTMivj03IL4ZCNj3WRjc5NUSxODJAMTUyWgjoKiVKA02LTo2Np
 aADLtcXhdAAAA
X-Change-ID: 20250424-fix_gmp_c23-c374e940b045
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4525; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=sJTjcDG8ov37MmLd2MzoKq1dvoQGjmLoHqaLS5H+LE0=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQwbni5y0XeLV+1NM239oOj0Jt9573UpP+Px5Dy754xI/2
 FiZnkd1lLIwiHExyIopsvBca2BuvaNfdlS0bALMHFYmkCEMXJwCMBEBDkaGDnbe/b7rl2jFs1yf
 Yj4ltcIw/ua2ifpMNfO5/2zcbeE+hZFhSvnFwP2ySy5M/MKRtTebZa26csmFvqN9usae7LMbczc
 xAAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479797; x=1746084597;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b46SiaE0SnWXJV/CJvgjFHR/7jBwHZt98e0MVK+aHEY=;
 b=k74CW8wOsLNPVedO29tkk6pys5Ba/wrh3iYlf9k5ff9L7bnSxRJSys3bi6TDIP/3w4
 cWb7pTkzLMwUclNAt7fyTWGCVTqrH0UbvpLmhFZQpq1gtzUW4fRhvfwe0XobyhO4xyEP
 U9HcEt4C7J6aSweppUv1EfboDPnpeELCCfGdDM8RR6OiBeWxuQIjy9atxH9eTOIjx3xt
 W1mf1DOGLqo/t2pDvF6Zde3oGflc/BxCz/Ks0eDsbrkEhy1kAHY5EZ+xLCmp3ga1h0RZ
 DtOCnrZj+jhuioeoavF4B+XCDJvzRVTauewLlgg38dZk8XXvP0hODbCNNi/vNBJZionU
 c8Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=k74CW8wO
Subject: [Buildroot] [PATCH] package/gmp: Fix for c23
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

R01QIHdpbGwgbm90IGJ1aWxkIGZvciBhIEMgY29tcGlsZXIgY29uZmlndXJlZCBmb3IgYzIzIGJl
Y2F1c2UgaXRzCmF1dG9jb25mIHNjcmlwdHMgdXNlIGRlcHJlY2F0ZWQgZnVuY3Rpb24gcHJvdG90
eXBlcy4gSW5jbHVkZSBhbiB1cHN0cmVhbQpwYXRjaCB0aGF0IGZpeGVzIHRoaXMgaXNzdWUuCgpT
aWduZWQtb2ZmLWJ5OiBDaGFybGllIEplbmtpbnMgPGNoYXJsaWVAcml2b3NpbmMuY29tPgotLS0K
IC4uLm00LUFkZC1wYXJhbWV0ZXItbmFtZXMtaW4tcHJvdG90eXBlLWZvci1nLnBhdGNoIHwgNTYg
KysrKysrKysrKysrKysrKysrKysrKwogLi4uYXRjaC1jb25maWd1cmUtc2NyaXB0LWZvci1jMjMt
ZnVuY3Rpb24tcHIucGF0Y2ggfCAzOSArKysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwg
OTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ21wLzAwMDEtYWNpbmNsdWRl
Lm00LUFkZC1wYXJhbWV0ZXItbmFtZXMtaW4tcHJvdG90eXBlLWZvci1nLnBhdGNoIGIvcGFja2Fn
ZS9nbXAvMDAwMS1hY2luY2x1ZGUubTQtQWRkLXBhcmFtZXRlci1uYW1lcy1pbi1wcm90b3R5cGUt
Zm9yLWcucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMzM5NzE4ODg4ZDBlMWRkNmJmMGMzNjAxNjMyZmNlZWU0
ZWZmNWY4MQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZ21wLzAwMDEtYWNpbmNsdWRlLm00
LUFkZC1wYXJhbWV0ZXItbmFtZXMtaW4tcHJvdG90eXBlLWZvci1nLnBhdGNoCkBAIC0wLDAgKzEs
NTYgQEAKK0Zyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CitEYXRlOiBTYXQsIDE1
IE1hciAyMDI1IDE3OjU4OjQwICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIGFjaW5jbHVkZS5tNDog
QWRkIHBhcmFtZXRlciBuYW1lcyBpbiBwcm90b3R5cGUgZm9yIGcoKS4KKworVGhpcyBhbGxvd3Mg
aXQgdG8gY29tcGlsZSB3aXRoIG9sZGVyIGdjYyBlLmcuIGdjYy0xMAord2hpY2ggZG9lcyBub3Qg
aGF2ZSBhbGxvdyBwYXJhbWV0ZXIgbmFtZSBvbWlzc2lvbiwgaXQgcmVzdWx0cworaW4KKworYS5j
OiBJbiBmdW5jdGlvbiDigJhn4oCZOgorYS5jOjM6ODogZXJyb3I6IHBhcmFtZXRlciBuYW1lIG9t
aXR0ZWQKKyAgICAzIHwgdm9pZCBnKGludCx0MSBjb25zdCosdDEsdDIsdDEgY29uc3QqLGludCl7
fQorICAgICAgfCAgICAgICAgXn5+CisKK3RoaXMgd2FzIGFkZGVkIHRvIGdjYyB2aWEgWzFdIHRo
YXRzIHdoeSBpdCBpcyBzdXBwb3J0ZWQgaW4KK25ld2VyIGdjYy4KKworQWRkaW5nIHRoZSBwYXJh
bWV0ZXIgbmFtZXMgbWFrZSBpdCBjb21wYXRpYmxlIHdpdGgKK29sZCBhbmQgbmV3IGdjYworCitb
MV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9waXBlcm1haWwvZ2NjLWN2cy8yMDIwLU9jdG9iZXIvMzM2
MDY4Lmh0bWwKKworU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtIGF0IGdtYWlsLmNv
bT4KK1Vwc3RyZWFtOiBodHRwczovL2dtcGxpYi5vcmcvbGlzdC1hcmNoaXZlcy9nbXAtZGV2ZWwv
MjAyNS1NYXJjaC8wMDYyOTQuaHRtbAorLS0tCisgQ2hhbmdlTG9nICAgIHwgNCArKysrCisgYWNp
bmNsdWRlLm00IHwgMiArLQorIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9DaGFuZ2VMb2cgYi9DaGFuZ2VMb2cKK2luZGV4IDI5
MDJjZDIuLmRmNDIwNzYgMTAwNjQ0CistLS0gYS9DaGFuZ2VMb2cKKysrKyBiL0NoYW5nZUxvZwor
QEAgLTEsMyArMSw3IEBACisrMjAyNS0wMy0xNSAgS2hlbSBSYWogPHJhai5raGVtIGF0IGdtYWls
LmNvbT4KKysKKysJKiBhY2luY2x1ZGUubTQ6IEFkZCBwYXJhbWV0ZXIgbmFtZXMgdG8gZnVuY3Rp
b24gcHJvdG90eXBlLgorKworIDIwMjMtMDctMjkgIFRvcmJqw7ZybiBHcmFubHVuZCAgPHRnQGdt
cGxpYi5vcmc+CisgCisgCSogVmVyc2lvbiA2LjMuMCByZWxlYXNlZC4KK2RpZmYgLS1naXQgYS9h
Y2luY2x1ZGUubTQgYi9hY2luY2x1ZGUubTQKK2luZGV4IDljZjk0ODMuLjFmZDBkNGYgMTAwNjQ0
CistLS0gYS9hY2luY2x1ZGUubTQKKysrKyBiL2FjaW5jbHVkZS5tNAorQEAgLTYwOSw3ICs2MDks
NyBAQCBHTVBfUFJPR19DQ19XT1JLU19QQVJUKFskMV0sIFtsb25nIGxvbmcgcmVsaWFiaWxpdHkg
dGVzdCAxXSwKKyAKKyAjaWYgZGVmaW5lZCAoX19HTlVDX18pICYmICEgZGVmaW5lZCAoX19jcGx1
c3BsdXMpCisgdHlwZWRlZiB1bnNpZ25lZCBsb25nIGxvbmcgdDE7dHlwZWRlZiB0MSp0MjsKKy12
b2lkIGcoKXt9Cisrdm9pZCBnKGludCBhLHQxIGNvbnN0KiBiLHQxIGMsdDIgZCx0MSBjb25zdCog
ZSxpbnQgZil7fQorIHZvaWQgaCgpe30KKyBzdGF0aWMgX19pbmxpbmVfXyB0MSBlKHQyIHJwLHQy
IHVwLGludCBuLHQxIHYwKQorIHt0MSBjLHgscjtpbnQgaTtpZih2MCl7Yz0xO2ZvcihpPTE7aTxu
O2krKyl7eD11cFtpXTtyPXgrMTtycFtpXT1yO319cmV0dXJuIGM7fQorLS0gCisyLjQzLjAKKwpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9nbXAvMDAwMi1jb25maWd1cmUtUGF0Y2gtY29uZmlndXJlLXNj
cmlwdC1mb3ItYzIzLWZ1bmN0aW9uLXByLnBhdGNoIGIvcGFja2FnZS9nbXAvMDAwMi1jb25maWd1
cmUtUGF0Y2gtY29uZmlndXJlLXNjcmlwdC1mb3ItYzIzLWZ1bmN0aW9uLXByLnBhdGNoCm5ldyBm
aWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAw
MDAwMDAuLmQ2MGM0ZDM5ZjY3MGQ4YzRmOWRjOTM3YjE0NjU5Njk1ZTNjYzM2YTMKLS0tIC9kZXYv
bnVsbAorKysgYi9wYWNrYWdlL2dtcC8wMDAyLWNvbmZpZ3VyZS1QYXRjaC1jb25maWd1cmUtc2Ny
aXB0LWZvci1jMjMtZnVuY3Rpb24tcHIucGF0Y2gKQEAgLTAsMCArMSwzOSBAQAorRnJvbTogQ2hh
cmxpZSBKZW5raW5zIDxjaGFybGllQHJpdm9zaW5jLmNvbT4KK0RhdGU6IFdlZCwgMjMgQXByIDIw
MjUgMjM6NTU6MjUgLTA3MDAKK1N1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlOiBQYXRjaCBjb25m
aWd1cmUgc2NyaXB0IGZvciBjMjMgZnVuY3Rpb24gcHJvdG90eXBlCisKK1RoZSBkaXN0cmlidXRl
ZCBjb25maWd1cmUgc2NyaXB0IGlzIHByZS1nZW5lcmF0ZWQgc28gaXQgd2lsbCBub3QgYmUKK3Vw
ZGF0ZWQgYnkgYWNpbmNsdWRlLm00LiBQYXRjaCB0aGUgY29uZmlndXJlIHNjcmlwdCB0byBhbGxv
dyBnbXAgdG8KK2NvbXBpbGUgd2l0aCBjMjMuCisKK1NpZ25lZC1vZmYtYnk6IENoYXJsaWUgSmVu
a2lucyA8Y2hhcmxpZUByaXZvc2luYy5jb20+CitVcHN0cmVhbTogTi9BIChwYXRjaGluZyBnZW5l
cmF0ZWQgYXV0b2NvbmYgZmlsZXMpCistLS0KKyBjb25maWd1cmUgfCA0ICsrLS0KKyAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQorCitkaWZmIC0tZ2l0IGEv
Y29uZmlndXJlIGIvY29uZmlndXJlCitpbmRleCA3OTEwYWEwLi4yNTlmN2M4IDEwMDc1NQorLS0t
IGEvY29uZmlndXJlCisrKysgYi9jb25maWd1cmUKK0BAIC02NTY4LDcgKzY1NjgsNyBAQCBpZiB0
ZXN0ICIkZ21wX3Byb2dfY2Nfd29ya3MiID0geWVzOyB0aGVuCisgCisgI2lmIGRlZmluZWQgKF9f
R05VQ19fKSAmJiAhIGRlZmluZWQgKF9fY3BsdXNwbHVzKQorIHR5cGVkZWYgdW5zaWduZWQgbG9u
ZyBsb25nIHQxO3R5cGVkZWYgdDEqdDI7Cistdm9pZCBnKCl7fQorK3ZvaWQgZyhpbnQgYSx0MSBj
b25zdCogYix0MSBjLHQyIGQsdDEgY29uc3QqIGUsaW50IGYpe30KKyB2b2lkIGgoKXt9Cisgc3Rh
dGljIF9faW5saW5lX18gdDEgZSh0MiBycCx0MiB1cCxpbnQgbix0MSB2MCkKKyB7dDEgYyx4LHI7
aW50IGk7aWYodjApe2M9MTtmb3IoaT0xO2k8bjtpKyspe3g9dXBbaV07cj14KzE7cnBbaV09cjt9
fXJldHVybiBjO30KK0BAIC04MTg3LDcgKzgxODcsNyBAQCBpZiB0ZXN0ICIkZ21wX3Byb2dfY2Nf
d29ya3MiID0geWVzOyB0aGVuCisgCisgI2lmIGRlZmluZWQgKF9fR05VQ19fKSAmJiAhIGRlZmlu
ZWQgKF9fY3BsdXNwbHVzKQorIHR5cGVkZWYgdW5zaWduZWQgbG9uZyBsb25nIHQxO3R5cGVkZWYg
dDEqdDI7Cistdm9pZCBnKCl7fQorK3ZvaWQgZyhpbnQgYSx0MSBjb25zdCogYix0MSBjLHQyIGQs
dDEgY29uc3QqIGUsaW50IGYpe30KKyB2b2lkIGgoKXt9Cisgc3RhdGljIF9faW5saW5lX18gdDEg
ZSh0MiBycCx0MiB1cCxpbnQgbix0MSB2MCkKKyB7dDEgYyx4LHI7aW50IGk7aWYodjApe2M9MTtm
b3IoaT0xO2k8bjtpKyspe3g9dXBbaV07cj14KzE7cnBbaV09cjt9fXJldHVybiBjO30KKy0tIAor
Mi40My4wCisKCi0tLQpiYXNlLWNvbW1pdDogMWZjNTFhYmMyN2QzN2MyODc0ODIzYWI4NjRkYjBm
MzJhZTc3NGViNgpjaGFuZ2UtaWQ6IDIwMjUwNDI0LWZpeF9nbXBfYzIzLWMzNzRlOTQwYjA0NQot
LSAKLSBDaGFybGllCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
