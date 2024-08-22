Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00988C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 13:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1D5560DFE;
	Thu, 22 Aug 2024 13:02:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MK1jrfHlllb0; Thu, 22 Aug 2024 13:02:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C45C60E2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C45C60E2E;
	Thu, 22 Aug 2024 13:02:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84F5E1BF3DF
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 727AF402DE
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 13:02:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SViF-sQP4eCo for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 13:02:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 29666402A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29666402A5
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29666402A5
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:02:28 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a80eab3945eso88358766b.1
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 06:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724331745; x=1724936545;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3HSZv/cNQ2WkSq9JPgHeGqUeyGnv02QF9ajHKuYgkFI=;
 b=oEbWLnLrV+7M5Dvm0kw+uf8XOxegc/Ml7Pjdmc5EWWbaN9VexB6szevgOfDGHVWSAm
 D/LPtdUKoLkdiRHWK2rU0U4lnCcZWF8SaJTUT3x2hah+NXyF4jBBh0b9dSu9ZaNppr/1
 Cv9uxh2/0jX99YcOBBQPEp3GYCogUQuDYRcq2VAAOq8quYDE7CfLzSy7uXNSOL7yZJVd
 iEkFrDk7/mQRZ6BvN2S9Wd/SJ/lB3nGEMY8nkwuPDd726JG8oRN2kI2voFir9AsQwl4B
 NmLn4GRG4llz8pv0XZXprxiZZrfE22cuZQ6b4ldjBDAmZ9SISV8diLIQTKucwj5GwObY
 HbnQ==
X-Gm-Message-State: AOJu0YxZz51NF8L3f/XsLKPbLZUjH+GOVuqHra8EcZ1MiP4SvJ00PuIk
 YcHLJfR997YQ68laQuQ80L35S7QT0xsblBna5McwbkEC5pkRis973BZl3Pzs7zmc/cUwLzZ2LJD
 z
X-Google-Smtp-Source: AGHT+IHNJHCfkulSn15ymLW6IGoEBl7pfIsdt/OKIXp3eO5PXCBXFkjb0StdENOEPeUntPNr6ohHnw==
X-Received: by 2002:a17:907:940e:b0:a7a:8378:625e with SMTP id
 a640c23a62f3a-a866f2f9d1dmr367393266b.26.1724331744567; 
 Thu, 22 Aug 2024 06:02:24 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f29a4e0sm117518766b.58.2024.08.22.06.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 06:02:23 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id ABEDB5F956;
 Thu, 22 Aug 2024 14:02:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 14:02:20 +0100
Message-Id: <20240822130220.4135741-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822130220.4135741-1-alex.bennee@linaro.org>
References: <20240822130220.4135741-1-alex.bennee@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724331745; x=1724936545; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3HSZv/cNQ2WkSq9JPgHeGqUeyGnv02QF9ajHKuYgkFI=;
 b=r8nQCsUw+1XcpiusycgSIWnbpOHXRLKq+U25qhFKwSa8FvaMY3Z15D/YHFFXRz65Gm
 aCqLclyOLXBdG7DOSvc9iUxbMqc0Ib6z8maU2IXYOhVR7UH6Kf3x/tjzXbzsrCJO2lyf
 WthnN0XODN1AusIds0DhOxuKGX4hcx95C2UfVrixazvhm/Uyuuo2ehCaDq++w1LPN0zI
 IxpRXgrFtveBMLSYFhuMt9J7qtWbup6yBOg+3WovUZDYwrncHGSXgNseCsbczXKh5nii
 ac7ZNNawdZlOqzfzKsWjSwneVO9o4AAF0DZtzGfikkW3HG935MniEvvsOs8ZtaelsyUm
 ZI4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=r8nQCsUw
Subject: [Buildroot] [PATCH 4/4] package/mesa3d: bump to 24.2.0
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
Cc: Romain Naour <romain.naour@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

V2hpbGUgVmlydElPIFZlbnVzIHN1cHBvcnQgd2VudCBpbiBlYXJsaWVyIHRoaXMgaXMgdGhlIGZp
cnN0IHZlcnNpb24KdGhhdCBpcyBrbm93biB0byB3b3JrIHdlbGwuCgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IEJlbm7DqWUgPGFsZXguYmVubmVlQGxpbmFyby5vcmc+Ci0tLQogcGFja2FnZS9tZXNhM2Qt
aGVhZGVycy9tZXNhM2QtaGVhZGVycy5tayB8IDIgKy0KIHBhY2thZ2UvbWVzYTNkL21lc2EzZC5o
YXNoICAgICAgICAgICAgICAgfCA1ICsrLS0tCiBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgICAg
ICAgICAgICAgICAgIHwgMyArKy0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkLWhlYWRlcnMvbWVzYTNk
LWhlYWRlcnMubWsgYi9wYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFkZXJzLm1rCmlu
ZGV4IDMzYzYwYjI4NWYuLjk4YWZiNzdhOWMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkLWhl
YWRlcnMvbWVzYTNkLWhlYWRlcnMubWsKKysrIGIvcGFja2FnZS9tZXNhM2QtaGVhZGVycy9tZXNh
M2QtaGVhZGVycy5tawpAQCAtMTIsNyArMTIsNyBAQCBlbmRpZgogCiAjIE5vdCBwb3NzaWJsZSB0
byBkaXJlY3RseSByZWZlciB0byBtZXNhM2QgdmFyaWFibGVzLCBiZWNhdXNlIG9mCiAjIGZpcnN0
L3NlY29uZCBleHBhbnNpb24gdHJpY2tlcnkuLi4KLU1FU0EzRF9IRUFERVJTX1ZFUlNJT04gPSAy
NC4wLjkKK01FU0EzRF9IRUFERVJTX1ZFUlNJT04gPSAyNC4yLjAKIE1FU0EzRF9IRUFERVJTX1NP
VVJDRSA9IG1lc2EtJChNRVNBM0RfSEVBREVSU19WRVJTSU9OKS50YXIueHoKIE1FU0EzRF9IRUFE
RVJTX1NJVEUgPSBodHRwczovL2FyY2hpdmUubWVzYTNkLm9yZwogTUVTQTNEX0hFQURFUlNfRExf
U1VCRElSID0gbWVzYTNkCmRpZmYgLS1naXQgYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QuaGFzaCBi
L3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCmluZGV4IGQ1MDZkMzk4YjguLjFmZjExZjliZDgg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5oYXNoCisrKyBiL3BhY2thZ2UvbWVz
YTNkL21lc2EzZC5oYXNoCkBAIC0xLDUgKzEsNCBAQAotIyBGcm9tIGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL2FyY2hpdmVzL21lc2EtYW5ub3VuY2UvMjAyNC1KdW5lLzAwMDc2NC5odG1s
Ci1zaGEyNTYgIDUxYWE2ODZjYTQwNjBlMzg3MTFhOWU4ZjYwYzhmMWVmYWE1MTZiYWY0MTE5NDZl
ZDdmMmMyNjVjZDU4MmNhNGMgIG1lc2EtMjQuMC45LnRhci54egotc2hhNTEyICBkZTJlZTZjOWRm
MWZjMTA2ZWUxMGJlZmUwYTc2YmUxZTljZmU4M2Q2NWRiZGI4M2JhZDZkOGQ3Y2ZhYTA4NTIzMmZi
MTE1MjkzYTFhNzkwYjM3YjUwYjFmZTE0YmQ1OGFhZmJjZmU1YTE1ZTk1M2I1OTAxYTcxMDVkNTc1
NjlhNSAgbWVzYS0yNC4wLjkudGFyLnh6CisjIEZyb20gaHR0cHM6Ly9kb2NzLm1lc2EzZC5vcmcv
cmVsbm90ZXMvMjQuMi4wLmh0bWwKK3NoYTI1NiAgYzAyYmI3MmNlYTI5MGY3OGIxMTg5NWEwYzk1
YzdjOTIzOTRmMTgwZDdmZjY2ZDRhNzYyZWM2OTUwYTU4YWRkZiAgbWVzYS0yNC4yLjAudGFyLnh6
CiAjIExpY2Vuc2UKIHNoYTI1NiAgYTAwMjc1YTUzMTc4ZTI2NDVmYjY1YmU5OWE3ODVjMTEwNTEz
NDQ2YTUwNzFmZjJjNjk4ZWQyNjBhZDkxN2Q3NSAgZG9jcy9saWNlbnNlLnJzdApkaWZmIC0tZ2l0
IGEvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCmlu
ZGV4IGQzYjUwMTA2NDguLjI5ZjI2YzU2NjMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL21l
c2EzZC5taworKysgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKQEAgLTUsNyArNSw3IEBACiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCiAjIFdoZW4gdXBkYXRpbmcgdGhlIHZlcnNpb24sIHBs
ZWFzZSBhbHNvIHVwZGF0ZSBtZXNhM2QtaGVhZGVycwotTUVTQTNEX1ZFUlNJT04gPSAyNC4wLjkK
K01FU0EzRF9WRVJTSU9OID0gMjQuMi4wCiBNRVNBM0RfU09VUkNFID0gbWVzYS0kKE1FU0EzRF9W
RVJTSU9OKS50YXIueHoKIE1FU0EzRF9TSVRFID0gaHR0cHM6Ly9hcmNoaXZlLm1lc2EzZC5vcmcK
IE1FU0EzRF9MSUNFTlNFID0gTUlULCBTR0ksIEtocm9ub3MKQEAgLTIxLDYgKzIxLDcgQEAgTUVT
QTNEX0RFUEVOREVOQ0lFUyA9IFwKIAlob3N0LWJpc29uIFwKIAlob3N0LWZsZXggXAogCWhvc3Qt
cHl0aG9uLW1ha28gXAorCWhvc3QtcHl0aG9uLXB5eWFtbCBcCiAJZXhwYXQgXAogCWxpYmRybSBc
CiAJemxpYgotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
