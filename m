Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9262BC369AB
	for <buildroot@archiver.kernel.org>; Thu, 24 Apr 2025 19:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F41C841580;
	Thu, 24 Apr 2025 19:17:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DaeDTRgOluRH; Thu, 24 Apr 2025 19:17:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34460415F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34460415F2;
	Thu, 24 Apr 2025 19:17:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56A27968
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48F4660F68
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADq3zTeRXYPp for <buildroot@buildroot.org>;
 Thu, 24 Apr 2025 19:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 126AF60B4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 126AF60B4F
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 126AF60B4F
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 19:17:35 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-22c33e5013aso18871145ad.0
 for <buildroot@buildroot.org>; Thu, 24 Apr 2025 12:17:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745522255; x=1746127055;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3XJCcfzSgF6jKoyowoSkuPPyD/9nG8u+BFnoaDEYknw=;
 b=KTog2ckgXzr0ex5wdMVpCJ1W2GUS4N4gcEOr1QZaiCQKnA4xRkcwRYITfHkzZq9f2F
 CTwZIBMJwS5EkM4dtV8eoiSb7/bLuWA5z9BjC2DY4vhtGQDC15HTsohRex1jsg1OKxri
 VEwNXeQifhnNSkuMadOyyPAXm215HTuU4jM5DVVqytTvopgH3q7V3kUpOAoL6vcu5kdX
 9it67gH0VgKqsNHJeHxNk1n83UG0k7/cEjtaI/IGjss4+vqHtLsx4qssETgWoaXXbcjx
 CFGHVrsAuKv/fhGQiWKNwpbbdLRlLd/2zj/CQ9W15dmej1irX4SKzfUGGcev1K8dE29K
 oTPg==
X-Gm-Message-State: AOJu0Ywc2uiT5di+LZ6Jti9o7PbUT1F7e2Gwm95JbJghTSMjN4FnNDgB
 aW4H6iyqm4Zi72oRjhjUtY8LBXWcxVOSnEPgy4BpTMoG3cbFaus7t7gq2TwAlN9t1j2a1SWRRv3
 d
X-Gm-Gg: ASbGncv3EVEdqKwpwpMKHMsLTDIi/PCW8tcoxxKu8ShYwH5RcndaFiGHws4+fQHiSdN
 F60ZSuVu2Z5J4eFewowUORyByAzlmXQ+M2UgdZOioJ5yiDp/kI+LKnFzYmBNjkf2/lnoHEXPCQe
 rOm1vT/9EtIiSu5qyXZAzEDFzdT5LHYWjci7EMeABmAO4aqCvftPqPZqs0KtNlKaMB16wZimCW7
 gIujtAm20UJxiJR4Nd5l+baYAClwUMmq+4Is7B9suf/aLQOR3FZOufYgK6GFJsoXcmtYCbkI6nj
 gsV0sLqFfq/7oqMeCHITae2bFUCmKp7kqP7OWv5VxV1u7JSnD44iqXL9wwdEuJMj0ZQ=
X-Google-Smtp-Source: AGHT+IGhDn3UMsv9UDqwQZ9QMXev84hJ8Nf2SpRtAMxJyO1P1UU4KHD5MVSJAb8ahbzP1pvUAPLk6w==
X-Received: by 2002:a17:90a:f94e:b0:2f8:4a3f:dd2d with SMTP id
 98e67ed59e1d1-309f554b804mr1185101a91.15.1745522254890; 
 Thu, 24 Apr 2025 12:17:34 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-309ef146f92sm1805121a91.40.2025.04.24.12.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 12:17:34 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 24 Apr 2025 12:17:26 -0700
MIME-Version: 1.0
Message-Id: <20250424-fix_gmp_c23-v2-1-a03fc808a87c@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAEWOCmgC/22MQQ6CMBBFr0JmbU07TEVYeQ9DCK0VZgElrWk0p
 He3snb5/s97O0QX2EXoqh2CSxzZrwXwVIGdx3Vygh+FASVqSUjiye9hWrbBYi1s3ZBrSRpJGoq
 xBVfuo3bvC88cXz58jnhSv/V/JymhhEFqaGz1VZvLLXDykVd7tn6BPuf8BXQumqipAAAA
X-Change-ID: 20250424-fix_gmp_c23-c374e940b045
To: buildroot@buildroot.org, Baruch Siach <baruch@tkos.co.il>
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3307; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=+ijw66BBy2QpSstWZ7Ph6GOhVusURE8j/wk5X1wQz40=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQwZXn/tGUddPIstVwqYt+HCp/MX0o4eZvkTs0lrgvEZh0
 TLr4ISVHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAExkWgEjw/fS49uW+1xSM/KZ
 ceqOm+3rzQ1zd+w9LHji6OL62Q/e/XZg+J/Cla3KyT3ph/csKdMdZguFrs+oE/w5r33SJr2Wx2y
 zDbgA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745522255; x=1746127055;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3XJCcfzSgF6jKoyowoSkuPPyD/9nG8u+BFnoaDEYknw=;
 b=wLRWcsDkh02a5oyQ8aGZQTMAHtRG/cvUcyBLA98dRMEN5LK22TmbQhTxQcjsFoWrJU
 WroxFhWg56OyZCG/+5j7wiMb4ohuxShe9sEwCgjMwNRQosaaGuJxTmgKtA+7F+IkAGso
 YXKVoy8Z6UWcxBs/GcgAF8IEYImwyYpQ2FePMqlTc7/wi8m/cXX6rUarSdSWq4foIj+N
 2+IXc8w7QSNVglO8yvzk+Ynt7nPxqLNzdD/+JzNO5jbH0Ufyil5MKkrX9WdDsVcRb0OK
 IgqvGOHvAPcaaVkK2VqFAazMAeZe5InO/sT6e2BDbuSTYXTMkyfDEIiBsG+JKX9EL8uE
 nWlw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=wLRWcsDk
Subject: [Buildroot] [PATCH v2] package/gmp: Fix for c23
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
Q2hhbmdlcyBpbiB2MjoKLSBVc2UgYXV0b3JlY29uZiBpbnN0ZWFkIG9mIHBhdGNoaW5nIGNvbmZp
Z3VyZQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNTA0MjQtZml4
X2dtcF9jMjMtdjEtMS1iMjQ3NGE5NTg1YjZAcml2b3NpbmMuY29tCi0tLQogLi4ubTQtQWRkLXBh
cmFtZXRlci1uYW1lcy1pbi1wcm90b3R5cGUtZm9yLWcucGF0Y2ggfCA1NiArKysrKysrKysrKysr
KysrKysrKysrCiBwYWNrYWdlL2dtcC9nbXAubWsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKIDIgZmlsZXMgY2hhbmdlZCwgNTcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvZ21wLzAwMDEtYWNpbmNsdWRlLm00LUFkZC1wYXJhbWV0ZXItbmFtZXMtaW4t
cHJvdG90eXBlLWZvci1nLnBhdGNoIGIvcGFja2FnZS9nbXAvMDAwMS1hY2luY2x1ZGUubTQtQWRk
LXBhcmFtZXRlci1uYW1lcy1pbi1wcm90b3R5cGUtZm9yLWcucGF0Y2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMC4uMzM5
NzE4ODg4ZDBlMWRkNmJmMGMzNjAxNjMyZmNlZWU0ZWZmNWY4MQotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvZ21wLzAwMDEtYWNpbmNsdWRlLm00LUFkZC1wYXJhbWV0ZXItbmFtZXMtaW4tcHJv
dG90eXBlLWZvci1nLnBhdGNoCkBAIC0wLDAgKzEsNTYgQEAKK0Zyb206IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+CitEYXRlOiBTYXQsIDE1IE1hciAyMDI1IDE3OjU4OjQwICswMTAwCitT
dWJqZWN0OiBbUEFUQ0hdIGFjaW5jbHVkZS5tNDogQWRkIHBhcmFtZXRlciBuYW1lcyBpbiBwcm90
b3R5cGUgZm9yIGcoKS4KKworVGhpcyBhbGxvd3MgaXQgdG8gY29tcGlsZSB3aXRoIG9sZGVyIGdj
YyBlLmcuIGdjYy0xMAord2hpY2ggZG9lcyBub3QgaGF2ZSBhbGxvdyBwYXJhbWV0ZXIgbmFtZSBv
bWlzc2lvbiwgaXQgcmVzdWx0cworaW4KKworYS5jOiBJbiBmdW5jdGlvbiDigJhn4oCZOgorYS5j
OjM6ODogZXJyb3I6IHBhcmFtZXRlciBuYW1lIG9taXR0ZWQKKyAgICAzIHwgdm9pZCBnKGludCx0
MSBjb25zdCosdDEsdDIsdDEgY29uc3QqLGludCl7fQorICAgICAgfCAgICAgICAgXn5+CisKK3Ro
aXMgd2FzIGFkZGVkIHRvIGdjYyB2aWEgWzFdIHRoYXRzIHdoeSBpdCBpcyBzdXBwb3J0ZWQgaW4K
K25ld2VyIGdjYy4KKworQWRkaW5nIHRoZSBwYXJhbWV0ZXIgbmFtZXMgbWFrZSBpdCBjb21wYXRp
YmxlIHdpdGgKK29sZCBhbmQgbmV3IGdjYworCitbMV0gaHR0cHM6Ly9nY2MuZ251Lm9yZy9waXBl
cm1haWwvZ2NjLWN2cy8yMDIwLU9jdG9iZXIvMzM2MDY4Lmh0bWwKKworU2lnbmVkLW9mZi1ieTog
S2hlbSBSYWogPHJhai5raGVtIGF0IGdtYWlsLmNvbT4KK1Vwc3RyZWFtOiBodHRwczovL2dtcGxp
Yi5vcmcvbGlzdC1hcmNoaXZlcy9nbXAtZGV2ZWwvMjAyNS1NYXJjaC8wMDYyOTQuaHRtbAorLS0t
CisgQ2hhbmdlTG9nICAgIHwgNCArKysrCisgYWNpbmNsdWRlLm00IHwgMiArLQorIDIgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9D
aGFuZ2VMb2cgYi9DaGFuZ2VMb2cKK2luZGV4IDI5MDJjZDIuLmRmNDIwNzYgMTAwNjQ0CistLS0g
YS9DaGFuZ2VMb2cKKysrKyBiL0NoYW5nZUxvZworQEAgLTEsMyArMSw3IEBACisrMjAyNS0wMy0x
NSAgS2hlbSBSYWogPHJhai5raGVtIGF0IGdtYWlsLmNvbT4KKysKKysJKiBhY2luY2x1ZGUubTQ6
IEFkZCBwYXJhbWV0ZXIgbmFtZXMgdG8gZnVuY3Rpb24gcHJvdG90eXBlLgorKworIDIwMjMtMDct
MjkgIFRvcmJqw7ZybiBHcmFubHVuZCAgPHRnQGdtcGxpYi5vcmc+CisgCisgCSogVmVyc2lvbiA2
LjMuMCByZWxlYXNlZC4KK2RpZmYgLS1naXQgYS9hY2luY2x1ZGUubTQgYi9hY2luY2x1ZGUubTQK
K2luZGV4IDljZjk0ODMuLjFmZDBkNGYgMTAwNjQ0CistLS0gYS9hY2luY2x1ZGUubTQKKysrKyBi
L2FjaW5jbHVkZS5tNAorQEAgLTYwOSw3ICs2MDksNyBAQCBHTVBfUFJPR19DQ19XT1JLU19QQVJU
KFskMV0sIFtsb25nIGxvbmcgcmVsaWFiaWxpdHkgdGVzdCAxXSwKKyAKKyAjaWYgZGVmaW5lZCAo
X19HTlVDX18pICYmICEgZGVmaW5lZCAoX19jcGx1c3BsdXMpCisgdHlwZWRlZiB1bnNpZ25lZCBs
b25nIGxvbmcgdDE7dHlwZWRlZiB0MSp0MjsKKy12b2lkIGcoKXt9Cisrdm9pZCBnKGludCBhLHQx
IGNvbnN0KiBiLHQxIGMsdDIgZCx0MSBjb25zdCogZSxpbnQgZil7fQorIHZvaWQgaCgpe30KKyBz
dGF0aWMgX19pbmxpbmVfXyB0MSBlKHQyIHJwLHQyIHVwLGludCBuLHQxIHYwKQorIHt0MSBjLHgs
cjtpbnQgaTtpZih2MCl7Yz0xO2ZvcihpPTE7aTxuO2krKyl7eD11cFtpXTtyPXgrMTtycFtpXT1y
O319cmV0dXJuIGM7fQorLS0gCisyLjQzLjAKKwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nbXAvZ21w
Lm1rIGIvcGFja2FnZS9nbXAvZ21wLm1rCmluZGV4IDdlOGRhOTAyNWM5M2I5OGI1ODIwZjI5N2I2
ZWEzNTQ5NTk3Mzk1YTUuLmZmZjIxMWE0ZjYxYWNjY2UzMjc2MDg4NWJjYTJkMzJjZTk5YzQ3MDEg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ21wL2dtcC5taworKysgYi9wYWNrYWdlL2dtcC9nbXAubWsK
QEAgLTcsNiArNyw3IEBACiBHTVBfVkVSU0lPTiA9IDYuMy4wCiBHTVBfU0lURSA9ICQoQlIyX0dO
VV9NSVJST1IpL2dtcAogR01QX1NPVVJDRSA9IGdtcC0kKEdNUF9WRVJTSU9OKS50YXIueHoKK0dN
UF9BVVRPUkVDT05GID0gWUVTCiBHTVBfSU5TVEFMTF9TVEFHSU5HID0gWUVTCiBHTVBfTElDRU5T
RSA9IExHUEwtMy4wKyBvciBHUEwtMi4wKwogR01QX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HLkxF
U1NFUnYzIENPUFlJTkd2MgoKLS0tCmJhc2UtY29tbWl0OiAxZmM1MWFiYzI3ZDM3YzI4NzQ4MjNh
Yjg2NGRiMGYzMmFlNzc0ZWI2CmNoYW5nZS1pZDogMjAyNTA0MjQtZml4X2dtcF9jMjMtYzM3NGU5
NDBiMDQ1Ci0tIAotIENoYXJsaWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
