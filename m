Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082B0C282D1
	for <buildroot@archiver.kernel.org>; Mon,  3 Mar 2025 16:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1CA440D81;
	Mon,  3 Mar 2025 16:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BypKAY6f6h-F; Mon,  3 Mar 2025 16:03:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B56740D84
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B56740D84;
	Mon,  3 Mar 2025 16:03:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03CA0D2
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A4D440D81
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b6K0sjMiAIjs for <buildroot@buildroot.org>;
 Mon,  3 Mar 2025 16:03:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=mickael.tansorier@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AD5A40D8B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD5A40D8B
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AD5A40D8B
 for <buildroot@buildroot.org>; Mon,  3 Mar 2025 16:03:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso31854235e9.2
 for <buildroot@buildroot.org>; Mon, 03 Mar 2025 08:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741017810; x=1741622610;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7ODsw5+gpP9NiRC17q69WhiTBrB1kRFASonSlXawA5w=;
 b=tNpK8E2NKzCGOyLKbTCE/AVZGxoOawyvBqwAk41u7VZABYTjDYUpmGEimvbQVVgmxd
 BvU4mCEjGTtG8Cq8o57qenSXR2SomotZEIch32R+wxRHBhq5626S9pU71kV9BZjiSBDH
 iAxcadeZQJUwH/1RVzyBwBLsK5xmflKyR5Qpi9Cw72gQlBhoJvF3zXOAdaWMEJrVRd0f
 8sBTAwBYFxGoGGXv5N6JgldPDhtvZGo/Ly2HLAE1g4fXIomm0WU+6MDUIfmqpDVbAL4c
 TKYTytlfLIkAPlHIcCXWtuvixdDRQtj/MQB7XNTI5qO3UPBbbnaKJx7MFBQjbmgKagJZ
 GxOQ==
X-Gm-Message-State: AOJu0Yw+7aKFRjm0S8pf35RET1hlGZuqQ2nROXcbO1Z6FqaIBkBNK8BY
 8ABHBG5QaEMi4aZLLtTYHDG8BXCTgbc5CMrEJqs5bQpv3ShoOJbmdopVQ+1RPvU2RozwznnLgt0
 y
X-Gm-Gg: ASbGncuR9jXZxmuFiqeY99+Ci9ePD9+KEe4Ug+fvoC1+EZ3VxlT9mgeRsVF1yr8e8nU
 gLG6MyIK0J1cBhLcAFiLwvVYeF+Mzgy2mcEYcbMy8zSZUnzKdolURa8gtgl7cnic1SAm/J7em3t
 KL82Etqn67k6zK6Z6qqtL0AWdt80n0a3rz77YWspfmGjZxInI4TijJCaM8ZDD5ZvvI70u5V0sxa
 gIuKiMoO8QJjh/9VKN3Hs+x4j3+UzXrdFYCELNjoXrZ1FbCMfD8qFQZbL1/G47Qngq0BxvbjQNH
 c8TJCmpc4IljpceUN/djtLlWajSSEbOfNyvVz7k21ljNfS1lkYz/ig/jw5OjzTUVzVFrBMbwHEb
 iZl/LYbNA8n/Gp7DAmYVj2HWPXK28ZvC83BGkEJZF90bR
X-Google-Smtp-Source: AGHT+IHmsM9079IgX0ss2fA7igdB9oq9UK8Lc7BwNf24zkMROVSyCuxU8plJZwhpTAWL//0Q8e0r7w==
X-Received: by 2002:a7b:cd96:0:b0:43b:bf6f:6ef8 with SMTP id
 5b1f17b1804b1-43bbf6f70c3mr43228675e9.0.1741017809595; 
 Mon, 03 Mar 2025 08:03:29 -0800 (PST)
Received: from baku.localdomain
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43b736f8034sm171018495e9.4.2025.03.03.08.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 08:03:29 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Date: Mon,  3 Mar 2025 17:03:24 +0100
Message-ID: <20250303160326.122921-1-mickael.tansorier@smile.fr>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1741017810; x=1741622610; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7ODsw5+gpP9NiRC17q69WhiTBrB1kRFASonSlXawA5w=;
 b=2UCPEVRAwy6GLISc/Fiv/t2kWdV2kPnusdpWDu4mf97WVv0444yvHvUTUyf+IfbVtW
 hKrFEZG3GEJWS029JruXD/HrazvcUzB/+aDb+d1S0j6ozHsLt09oz4MYxZS2ruYosclO
 5PyP0X6bYMxM7rip3pTMrqRcZ+ysPvTPWtp+0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=2UCPEVRA
Subject: [Buildroot] [PATCH 1/3] package/minetest: bump to version 5.9.1
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
From: =?utf-8?q?Micka=C3=ABl_Tansorier_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Micka=C3=ABl=20Tansorier?= <mickael.tansorier@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VXBkYXRlIG1pbmV0ZXN0IHZlcnNpb24KClNlZToKaHR0cHM6Ly9kb2NzLmx1YW50aS5vcmcvYWJv
dXQvY2hhbmdlbG9nLyM1OTAtLTU5MQoKSXJybGljaHRNdCBoYXMgYmVlbiBtb3ZlZCBpbnRvIHRo
ZSBtYWluIE1pbmV0ZXN0IHJlcG9zaXRvcnkgZHVyaW5nIE1pbmV0ZXN0IDUuOSBkZXZlbG9wbWVu
dC4gWzFdCgpbMV0gaHR0cHM6Ly9naXRodWIuY29tL21pbmV0ZXN0L2lycmxpY2h0L2Jsb2IvbWFz
dGVyL1JFQURNRS5tZAoKU2lnbmVkLW9mZi1ieTogTWlja2HDq2wgVGFuc29yaWVyIDxtaWNrYWVs
LnRhbnNvcmllckBzbWlsZS5mcj4KLS0tCiBwYWNrYWdlL21pbmV0ZXN0L0NvbmZpZy5pbiAgICAg
fCAgMyAtLS0KIHBhY2thZ2UvbWluZXRlc3QvbWluZXRlc3QuaGFzaCB8ICA0ICstLS0KIHBhY2th
Z2UvbWluZXRlc3QvbWluZXRlc3QubWsgICB8IDE5ICsrKy0tLS0tLS0tLS0tLS0tLS0KIDMgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL21pbmV0ZXN0L0NvbmZpZy5pbiBiL3BhY2thZ2UvbWluZXRlc3QvQ29uZmlnLmlu
CmluZGV4IDRlMTM5YWMzZTIuLmMxNDc2ODAxNmIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWluZXRl
c3QvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvbWluZXRlc3QvQ29uZmlnLmluCkBAIC0xLDEwICsx
LDcgQEAKIGNvbmZpZyBCUjJfUEFDS0FHRV9NSU5FVEVTVAogCWJvb2wgIm1pbmV0ZXN0IgotCWRl
cGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQICMgaXJybGljaHRNdCAoYnVuZGxlZCkKIAlk
ZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzUgIyBDKysxMQogCWRlcGVuZHMg
b24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwotCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfWE9S
RzcgIyBpcnJsaWNodE10IChidW5kbGVkKQotCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFTX0xJ
QkdMICMgaXJybGljaHRNdCAoYnVuZGxlZCkKIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xVQUpJ
VAogCXNlbGVjdCBCUjJfUEFDS0FHRV9HTVAKIAlzZWxlY3QgQlIyX1BBQ0tBR0VfSlNPTkNQUApk
aWZmIC0tZ2l0IGEvcGFja2FnZS9taW5ldGVzdC9taW5ldGVzdC5oYXNoIGIvcGFja2FnZS9taW5l
dGVzdC9taW5ldGVzdC5oYXNoCmluZGV4IGVjNjdkNDEzNmQuLjVkODU5Mzg0Y2EgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvbWluZXRlc3QvbWluZXRlc3QuaGFzaAorKysgYi9wYWNrYWdlL21pbmV0ZXN0
L21pbmV0ZXN0Lmhhc2gKQEAgLTEsNiArMSw0IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hh
MjU2ICAxNDQwNjAzZTE5ZGNhNzBlMjY5MWU4NmE3NGM4MjJlZTJjNGEzNmZjZWVlMzJiMmQ4NWFl
NzQ3NzIxNDllOWEzICBtaW5ldGVzdC01LjYuMS50YXIuZ3oKLXNoYTI1NiAgMjc1OTQyNDJkYThj
N2NjMWU1ZWY0NTkyMmUxZGZkZDEzMGMzN2Q3NzcxOWI1ZDkyNzM1OWViNDc5OTIwNTFlMCAgaXJy
bGljaHQtMS45LjBtdDgudGFyLmd6CitzaGEyNTYgIGY4MTczNDM2NzgyYjVhMjU0NGFhMTljNTRm
NTcyYTgxODMxYjZjZmM4OTQ4MDczN2NjZjY3Njg5OTJjNjUxZWEgIG1pbmV0ZXN0LTUuOS4xLnRh
ci5negogCiBzaGEyNTYgIGIzOGM4ZDQyOGNlZGRmOGU5YjQ5ZGNhNjM2MTBjNzQ0OTlkOTUyODk1
ZDc1NmI3ZWFiNWY1ZDRjZWYyOTU0ZjYgIExJQ0VOU0UudHh0Ci1zaGEyNTYgIGNhMzhmMWJhNGFi
OTAxMTExZjZlZWU1MDAwOWJkNDZkYmQ4NjZlNmJlYjk4ZDU5MmQ4NDNmN2MxNjJkNzM0MDkgIGxp
Yi9pcnJsaWNodG10L2RvYy9pcnJsaWNodC1saWNlbnNlLnR4dApkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9taW5ldGVzdC9taW5ldGVzdC5tayBiL3BhY2thZ2UvbWluZXRlc3QvbWluZXRlc3QubWsKaW5k
ZXggMzkwNGJkNjg3Yy4uYjA3ZWE1N2VhNyAxMDA2NDQKLS0tIGEvcGFja2FnZS9taW5ldGVzdC9t
aW5ldGVzdC5taworKysgYi9wYWNrYWdlL21pbmV0ZXN0L21pbmV0ZXN0Lm1rCkBAIC00LDI3ICs0
LDE0IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1NSU5FVEVTVF9WRVJTSU9OID0g
NS42LjEKK01JTkVURVNUX1ZFUlNJT04gPSA1LjkuMQogTUlORVRFU1RfU0lURSA9ICQoY2FsbCBn
aXRodWIsbWluZXRlc3QsbWluZXRlc3QsJChNSU5FVEVTVF9WRVJTSU9OKSkKLU1JTkVURVNUX0xJ
Q0VOU0UgPSBMR1BMLTIuMSsgKGNvZGUpLCBDQy1CWS1TQS0zLjAgKHRleHR1cmVzIGFuZCBzb3Vu
ZHMpLCBabGliIChpcnJsaWNodCkKLU1JTkVURVNUX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4
dCBsaWIvaXJybGljaHRtdC9kb2MvaXJybGljaHQtbGljZW5zZS50eHQKK01JTkVURVNUX0xJQ0VO
U0UgPSBMR1BMLTIuMSsgKGNvZGUpLCBDQy1CWS1TQS0zLjAgKHRleHR1cmVzIGFuZCBzb3VuZHMp
CitNSU5FVEVTVF9MSUNFTlNFX0ZJTEVTID0gTElDRU5TRS50eHQKIE1JTkVURVNUX0NQRV9JRF9W
RU5ET1IgPSBtaW5ldGVzdAogCiBNSU5FVEVTVF9ERVBFTkRFTkNJRVMgPSBnbXAganNvbmNwcCBs
dWFqaXQgc3FsaXRlIHpsaWIgenN0ZAogCi1NSU5FVEVTVF9JUlJMSUNIVE1UX1ZFUlNJT04gPSAx
LjkuMG10OAotTUlORVRFU1RfRVhUUkFfRE9XTkxPQURTID0gJChjYWxsIGdpdGh1YixtaW5ldGVz
dCxpcnJsaWNodCwkKE1JTkVURVNUX0lSUkxJQ0hUTVRfVkVSU0lPTikpL2lycmxpY2h0LSQoTUlO
RVRFU1RfSVJSTElDSFRNVF9WRVJTSU9OKS50YXIuZ3oKLQotZGVmaW5lIE1JTkVURVNUX0lSUkxJ
Q0hUTVRfRVhUUkFDVAotCW1rZGlyIC1wICQoQEQpL2xpYgotCSQoZm9yZWFjaCBmLCAkKG5vdGRp
ciAkKE1JTkVURVNUX0VYVFJBX0RPV05MT0FEUykpLCBcCi0JCSQoY2FsbCBzdWl0YWJsZS1leHRy
YWN0b3IsJChmKSkgJChNSU5FVEVTVF9ETF9ESVIpLyQoZikgfCBcCi0JCQkkKFRBUikgLUMgJChA
RCkvbGliICQoVEFSX09QVElPTlMpIC0KLQkpCi0JbG4gLXNmIGlycmxpY2h0LSQoTUlORVRFU1Rf
SVJSTElDSFRNVF9WRVJTSU9OKSAkKEBEKS9saWIvaXJybGljaHRtdAotZW5kZWYKLU1JTkVURVNU
X1BPU1RfRVhUUkFDVF9IT09LUyArPSBNSU5FVEVTVF9JUlJMSUNIVE1UX0VYVFJBQ1QKLQogTUlO
RVRFU1RfQ09ORl9PUFRTID0gXAogCS1EREVGQVVMVF9SVU5fSU5fUExBQ0U9T0ZGIFwKIAktREVO
QUJMRV9HTEVTPU9GRiBcCi0tIAoyLjQ4LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
