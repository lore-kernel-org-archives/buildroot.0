Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A7DCD98E2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jun 2026 17:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BFA6065E;
	Wed, 17 Jun 2026 17:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC7wpi4AdREJ; Wed, 17 Jun 2026 17:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A19F66065A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781716258;
	bh=+HBJeqzxHnPxCwtgLMRN5kP6HFOKRyLfuQriQsIG5gk=;
	h=From:Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=srdZDbld1kLViCCfHAj/Wppx6Ys8SBYhW65TEN/OK9l38d3V2BOzOHjc2yh47K25e
	 CFLq/7811IEmCZRmEEylY2QPS8IXSW3xd3WqkhKuSfavMpsBchNBl1gnM+aTjO3PMf
	 UKtwtCu5lsc6oes0XSStsEmgs++jb1ulJfYLpV3wU8yv06o9ua84jzVD9YoV4I0cW6
	 MqlQ6ckasFNp6Hp67uF73v/KJUA/ONDjOGBQAH3K/rbE03gaxP5JZvruaFVWBYPbAA
	 MnPyzPKoiOhx1RBY98aykpFlAYJqLYBqNvBfg9UEwLLWmZqI9RV818bkReuWBjg4jK
	 vTCS/O+eUR2nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A19F66065A;
	Wed, 17 Jun 2026 17:10:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65409355
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56ADC81127
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ewftvmz1UpfK for <buildroot@buildroot.org>;
 Wed, 17 Jun 2026 17:10:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.140.110.172;
 helo=foss.arm.com; envelope-from=vincent.stehle@arm.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6198181125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6198181125
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6198181125
 for <buildroot@buildroot.org>; Wed, 17 Jun 2026 17:10:55 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DD722E96;
 Wed, 17 Jun 2026 10:10:49 -0700 (PDT)
Received: from [127.0.1.1] (X72Y076X74-2.nice.arm.com [10.34.125.15])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A77573F915;
 Wed, 17 Jun 2026 10:10:53 -0700 (PDT)
From: =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
Date: Wed, 17 Jun 2026 19:10:41 +0200
MIME-Version: 1.0
Message-Id: <20260617-pmem-v1-1-bac54881145c@arm.com>
References: <20260617-pmem-v1-0-bac54881145c@arm.com>
In-Reply-To: <20260617-pmem-v1-0-bac54881145c@arm.com>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>, 
 =?utf-8?q?Vincent_Stehl=C3=A9?= <vincent.stehle@arm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=734; i=vincent.stehle@arm.com; 
 h=from:subject:message-id;
 bh=r8pa+tH/b91m8vokC8pyZerd/YUbvV4YGkg7TwtxsoQ=; 
 b=owEBbQGS/pANAwAKActJ+FZ2owaUAcsmYgBqMtUcHWsIU3ox0E+ZnDdVOdJpNm6m8eVJNpwH2
 hb8OSIy+zCJATMEAAEKAB0WIQTXYBSgjlpQEXB4KmzLSfhWdqMGlAUCajLVHAAKCRDLSfhWdqMG
 lCPiB/0WOewSGcOLVICDibGfPHuEHK49B9gL2k+B5fDQXDI4meKDlz3LsAjBbilIh7F1jX9Xzzl
 K3VZaHhHuihO3P6BNFvtO9v8pp/2Je4pAiUSvxxufzY/fEbHvUBAwaa4856EMtIWh8rM6Xkc212
 pRujmV1k0eL8qLeB2SzLwy3lkxIOFRlgnj/B+6fNQtl7md72wRb5l3cmAv968cdLey0rkDmjqU0
 wH/IFqrTy8ylHblOFx2ww915FPy2QU/oU90YOAXLynYFXTfgbcRP6jzhrY/6vHJ2uhIumlvdIzC
 0cJkwKUbJ89ko54ILlVGKL/ev2+0FGuJypEbXea1bzkj4AcI
X-Developer-Key: i=vincent.stehle@arm.com; a=openpgp;
 fpr=D76014A08E5A501170782A6CCB49F85676A30694
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=arm.com; s=foss; 
 t=1781716254; bh=r8pa+tH/b91m8vokC8pyZerd/YUbvV4YGkg7TwtxsoQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EFuy2yrNYGSBunGzbwJrKV/ZdpTpzLoa24CDIMbHIHa85/0Nouy0g3mwyU2kq62MQ
 G+czzW552q2eUlcHDYI4s7yFXyKxz9Bk5HhHDYNKjgeGrMLB5BNQECO4IMwKrh6ZSN
 BYakXtArwr9k0ngKWfjVqueq9KIn44S/9pjkuyNs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=arm.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com
 header.a=rsa-sha256 header.s=foss header.b=EFuy2yrN
Subject: [Buildroot] =?utf-8?q?=5BPATCH_1/2=5D_DEVELOPERS=3A_add_Vincent_?=
 =?utf-8?q?Stehl=C3=A9_for_aarch64-efi_files?=
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

U2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5jZW50LnN0ZWhsZUBhcm0uY29tPgpD
YzogRGljayBPbHNzb24gPGhpQHNlbnppbGxhLmlvPgotLS0KIERFVkVMT1BFUlMgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvREVWRUxPUEVSUyBi
L0RFVkVMT1BFUlMKaW5kZXggZDU5MWM2MjgwNS4uZWEzMDU1MzU5NSAxMDA2NDQKLS0tIGEvREVW
RUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0zMzU1LDExICszMzU1LDEzIEBAIEY6CXBhY2th
Z2UvbnNzLW15aG9zdG5hbWUvCiBGOglwYWNrYWdlL3V0cF9jb20vCiAKIE46CVZpbmNlbnQgU3Rl
aGzDqSA8dmluY2VudC5zdGVobGVAYXJtLmNvbT4KK0Y6CWJvYXJkL2FhcmNoNjQtZWZpLwogRjoJ
Ym9hcmQvYXJtL2Z2cC1lYmJyLwogRjoJYm9hcmQvY29tcHVsYWIvaW90LWdhdGUtaW14OC1lYmJy
LwogRjoJYm9hcmQvcGluZTY0L3JvY2twcm82NC1lYmJyLwogRjoJYm9hcmQvcWVtdS9hYXJjaDY0
LWViYnIvCiBGOglib2FyZC9xZW11L2FybS1lYmJyLworRjoJY29uZmlncy9hYXJjaDY0X2VmaV9k
ZWZjb25maWcKIEY6CWNvbmZpZ3MvYXJtX2Z2cF9lYmJyX2RlZmNvbmZpZwogRjoJY29uZmlncy9p
b3QtZ2F0ZS1pbXg4X2ViYnJfZGVmY29uZmlnCiBGOgljb25maWdzL3FlbXVfYWFyY2g2NF9lYmJy
X2RlZmNvbmZpZwoKLS0gCjIuNTMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
