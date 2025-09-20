Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D09DCAC5A7
	for <buildroot@archiver.kernel.org>; Sat, 20 Sep 2025 15:58:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0949C83C3E;
	Sat, 20 Sep 2025 15:58:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qorRqwIR5foL; Sat, 20 Sep 2025 15:58:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F93083C2C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F93083C2C;
	Sat, 20 Sep 2025 15:58:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 36FAFD7F
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 15:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1CF8040060
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 15:58:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lpb-O8toqkm for <buildroot@buildroot.org>;
 Sat, 20 Sep 2025 15:58:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::443; helo=mail-wr1-x443.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D545D4002D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D545D4002D
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D545D4002D
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 15:58:08 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso1501906f8f.3
 for <buildroot@buildroot.org>; Sat, 20 Sep 2025 08:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758383886; x=1758988686;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jr8+NDAiO0NFRV0aHPgMwpVmqwIqcptKanoi37/Jujw=;
 b=woO/Gy95tvmwvNBOa9aeK9PuWtKPdh0KS5BDrPvlrVU+xHTo4kUcKaOW/D8Rpj4ZYy
 NwYSvZNjXn0NeWICRZuoFssZ1WhumF45OxlHuDit0NnbKuP4FU4Q3JIC7krtYWQFSfTg
 SOganugnwYCQEcHXfwVL9M5ErF/wzj+8Ds7ZuaEbjyoqjGaLVSCoTMB1QlHyZhJfiT1T
 2cG5gIJ2FYeOxV799B3kDvjhMeWjuAkGRWV2Tm9fwvj+lNQMvC+L7MM1ANSsJP6q5YSd
 Y4WMOVDF00QUvgMAi4mnr/UO6cWEjbIRBjnZ4da56qCIImkPacpqJVFEm9emWpmkkiWC
 Llug==
X-Gm-Message-State: AOJu0Yxr+W4kTrbvifZAPGWoJh32MNN3BJxHZqqV06EECwQ6Z24y73/7
 SbMjSgxNJfI1CNCP7QJMmmMgzqfTif1iB3vuJ8Zt5ljmTNhLijhA/llP8uZS0+lAIF7GNgQonC2
 wzJYyXTj4yA==
X-Gm-Gg: ASbGnctxRB9yFs+ZPfaUhZawEQsJ1I3aVgVXLaqRo7/8oqK/vdKDEHxV5P/uiXjDHGH
 hArp8OwdHv8kfqak+zYlbSqxAYH8vkL59theS1HvmGSVHVFNSHxZJucqrYUmK+NPULrEw+68i2w
 MCQxrzQoEr6mUrhlGoKYKjhQD7baaCijk91cqRe1m3FQp1FZ+OLzvmfb9Gl0fsUs+1qkLrEBP0a
 2KaGoAbSDCiffanu8aNRwgdwMxEzbR/PewUXmzNIBRpFcwlmDroEdy0Lq7bJLHE3PiP51KG2Rl1
 OINzuizNilga06tqGSkI/pUnU2k30TE2yDHUj/fMYNVzCzacBkm6GCugaDUv9tS2PeWuvLmguvv
 k5N8alv2ZzgPb/qrGbFHrMGogyXQCcjXq+I4vzfqkBQJQcSBrbsySPlP3TSKS3B6bTzm+3smZlA
 Ia0hTxcKrxCicnKYvPrvX7uQ==
X-Google-Smtp-Source: AGHT+IFHdTXxACSpPqN4PyPFJLHHocY95/j7ReQfnl2ZbOV2UfK20OyHfaTVpAcE2xvqXh9di56oDQ==
X-Received: by 2002:a05:6000:184b:b0:3e7:46bf:f8bd with SMTP id
 ffacd0b85a97d-3ee7d685723mr7118964f8f.23.1758383886474; 
 Sat, 20 Sep 2025 08:58:06 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb0594a2a2002ad9827a59cb148a.ipv6.abo.wanadoo.fr.
 [2a01:cb05:94a2:a200:2ad9:827a:59cb:148a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45f325a32f6sm102747935e9.2.2025.09.20.08.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Sep 2025 08:58:06 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 20 Sep 2025 17:58:03 +0200
Message-ID: <20250920155803.829424-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1758383886; x=1758988686; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jr8+NDAiO0NFRV0aHPgMwpVmqwIqcptKanoi37/Jujw=;
 b=T09RZxW0KrLscKEbX0Ohki/W7Uy1Ri38eXt4XL3CBlkm2l5tCEZmiU/lIPs1ov2GPw
 bjAj8Prc70W3jyHujsqcHdudgTsP/nfubyDukjCCKxjX/d9BHY9UG+MXfF/XRgSxNbJH
 XDh9PMbhsq3Zo14BAJsFC6wSexDhhJo+ZtGSA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=T09RZxW0
Subject: [Buildroot] [PATCHv2] support/testing: TestZfsUclibc: use internal
 backend for uClibc-ng toolchain
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QXMgcmVwb3J0ZWQgb24gdGhlIG1haWxpbmcgbGlzdCBbMV0gd2hpbGUgaW52ZXN0aWdhdGluZyB0
aGUKVGVzdFpmc1VjbGliYyBHaXRsYWItQ0kgZmFpbHVyZSwgdGhlIHB5dGhvbiAzLjEzIGludGVy
cHJldGVyIGl0c2VmCnNlZ2ZhdWx0IGF0IHJ1bnRpbWU6CgogIEZhdGFsIFB5dGhvbiBlcnJvcjog
X1B5VGhyZWFkU3RhdGVfQXR0YWNoOiBub24tTlVMTCBvbGQgdGhyZWFkIHN0YXRlCiAgUHl0aG9u
IHJ1bnRpbWUgc3RhdGU6IHByZWluaXRpYWxpemVkCiAgVGhyZWFkIDB4U2VnbWVudGF0aW9uIGZh
dWx0CgpUaGlzIGlzc3VlIGlzIHJlbGF0ZWQgdG8gdGhlIHB5dGhvbiAzLjEzIHZlcnNpb24gYnVt
cCBbMl0gd2VyZSBzZXZlcmFsCmludGVybmFsIGNoYW5nZXMgd2VyZSBhZGRlZCBbM10gdG8gc3Vw
cG9ydCBQRVAgNzAzIFs0XS4KUEVQIDc5MyBpcyBhYm91dCBDUHl0aG9u4oCZcyBnbG9iYWwgaW50
ZXJwcmV0ZXIgbG9jayAo4oCcR0lM4oCdKSByZW1vdmFsCmZvciBtdWx0aS10aHJlYWRzIHN1cHBv
cnQgdGhhdCByZXF1aXJlcyBhIHdvcmtpbmcgQzExICJ0aHJlYWRfbG9jYWwiCmZvciB0aHJlYWQt
bG9jYWwgc3RvcmFnZSBbNV0uCgpUaGUgbmV3IHVjbGliYy1uZyAxLjAuNTUgcmVsZWFzZSBjb250
YWlucyBhIGZpeCBmb3IgdGhpcyBpc3N1ZSBbNl0uCgpTaW5jZSB0aGUgcHJlYnVpbHQgQm9vdGxp
bmcgYWFyY2g2NCB1Y2xpYmMgc3RhYmxlIDIwMjUuMDgtMSBpcyBiYXNlZApvbiBwcmV2aW91cyB1
Q2xpYmMtbmcgcmVsZWFzZSAoMS4wLjU0KSB3ZSBoYXZlIHRvIHVzZSB0aGUgaW50ZXJuYWwKdG9v
bGNoYWluIGJhY2tlbmQgdG8gYnVpbGQgYSBuZXcgdUNsaWJjLW5nIHRvb2xjaGFpbiB1c2luZyB1
Y2xpYmMtbmcKMS4wLjU1LgoKRml4ZXM6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3Jn
L2J1aWxkcm9vdC8tL2pvYnMvMTEyNzExMjQ4NTkgKFRlc3RaZnNVY2xpYmMpCgpbMV0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290LzdhNGQyNDVkLTE1NTYtNDNjOS04OTk3LTZiMWY3
OTFhZmJmZUBnbWFpbC5jb20vIChUZXN0WmZzVWNsaWJjKQpbMl0gZDYzZTIwN2ViODY5MDYzZjgy
Yzg2NzY1ODY3NmMyOTAzYmViMDhjYgpbM10gaHR0cHM6Ly9naXRodWIuY29tL3B5dGhvbi9jcHl0
aG9uL2NvbW1pdC82ZTk3YTk2NDdhZTAyOGZhY2IzOTJkMTJmYzI0OTczNTAzNjkzYmQ2Cls0XSBo
dHRwczovL3BlcHMucHl0aG9uLm9yZy9wZXAtMDcwMy8KWzVdIGh0dHBzOi8vZ2NjLmdudS5vcmcv
b25saW5lZG9jcy9nY2MtMTUuMS4wL2djYy9UaHJlYWQtTG9jYWwuaHRtbApbNl0gaHR0cHM6Ly9n
aXRodWIuY29tL3dieC1naXRodWIvdWNsaWJjLW5nL2NvbW1pdC85NGMxMjk3ZDUyMjYzZTIwY2Q5
NzE1NjAxYWZhMzdmNDlkMDA4ZDkzCgpDYzogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2
YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+CkNjOiBXYWxkZW1hciBCcm9ka29yYiA8d2J4QG9wZW5h
ZGsub3JnPgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBzbWlsZS5m
cj4KLS0tCnYyOiBGb2xsb3dpbmcgdGhlIHVDbGliYy1uZyAxLjAuNTUgcmVsZWFzZSwgdXBkYXRl
IFRlc3RaZnNVY2xpYmMgY2hhbmdlcwogICAgdG8gdXNlIGludGVybmFsIHRvb2xjaGFpbiBiYWNr
ZW5kLgogICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L2FNMmZETDFJSGd4WDdh
cnpAd2FsZGVtYXItYnJvZGtvcmIuZGUvVC8jdQotLS0KIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3Rlc3RfemZzLnB5IHwgMTMgKysrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3pmcy5weQppbmRleCAxYjkwN2FjNGRlLi5jMjE4Y2MzNmE4IDEwMDY0NAotLS0g
YS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQorKysgYi9zdXBwb3J0
L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3pmcy5weQpAQCAtNzQsOSArNzQsMTggQEAgY2xh
c3MgVGVzdFpmc0dsaWJjKFRlc3RaZnNCYXNlKToKIAogCiBjbGFzcyBUZXN0WmZzVWNsaWJjKFRl
c3RaZnNCYXNlKToKLSAgICBjb25maWcgPSBUZXN0WmZzQmFzZS5jb25maWcgKyBcCisgICAgIyBU
aGUgQm9vdGxpbmcgYWFyY2g2NCB1Y2xpYmMgc3RhYmxlIDIwMjUuMDgtMSBuZWVkcyB0byBiZQor
ICAgICMgcmVidWlsZCB3aXRoIHVDbGliYy1uZyAxLjAuNTUuCisgICAgIyBTZWU6IGh0dHBzOi8v
Z2l0aHViLmNvbS93YngtZ2l0aHViL3VjbGliYy1uZy9jb21taXQvOTRjMTI5N2Q1MjI2M2UyMGNk
OTcxNTYwMWFmYTM3ZjQ5ZDAwOGQ5MworICAgIGNvbmZpZyA9IFRlc3RaZnNCYXNlLmNvbmZpZy5y
ZXBsYWNlKCdCUjJfVE9PTENIQUlOX0VYVEVSTkFMPXlcbicsICcnKQorICAgIGNvbmZpZyA9IGNv
bmZpZy5yZXBsYWNlKCdCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0JPT1RMSU49eVxuJywgJycpICsg
XAogICAgICAgICAiIiIKLSAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOX0FB
UkNINjRfVUNMSUJDX1NUQUJMRT15CisgICAgICAgIEJSMl9UT09MQ0hBSU5fQlVJTERST09UX1VD
TElCQz15CisgICAgICAgIEJSMl9LRVJORUxfSEVBREVSU181XzQ9eQorICAgICAgICBCUjJfVE9P
TENIQUlOX0JVSUxEUk9PVF9MT0NBTEU9eQorICAgICAgICBCUjJfUFRIUkVBRF9ERUJVRz15Cisg
ICAgICAgIEJSMl9UT09MQ0hBSU5fQlVJTERST09UX0NYWD15CisgICAgICAgIEJSMl9HQ0NfRU5B
QkxFX09QRU5NUD15CiAgICAgICAgICIiIgogCiAgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgotLSAK
Mi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
