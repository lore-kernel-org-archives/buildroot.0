Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D9D1D1CDC6
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 08:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A6A780EC4;
	Tue,  9 Dec 2025 08:54:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VFkLHEHamC-1; Tue,  9 Dec 2025 08:54:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D12D980DA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765270466;
	bh=P8gIIk2sxRF3vDlF9CfDSqnx4wy9PJsMi4CQoFoWH/w=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=E2XXXE4d7v2Idyegi7N2i3NzVzpK33jPOx+iqNBmoLlRtp/k2nM4+u4PbhD/+nnUI
	 Zoc+y/WheSeKMAwnxrrgvHMtV4oeGiZ94Vp+68VZ0U1bgPDeO05EEsfLFDItHuZ/+5
	 E12LuVTLlp/zEJOMqgmFn0mK872EEG0FSRsCrQj+7+JB548fYCSuRCulP+UtPEyC6B
	 gluH4ciTToFZQy6RavauZVD+7G64Ruq6Eb3nAW6QogPwYY7B8lwetJoy8ioDQcq+Q3
	 T8fpmUVCM0csO6jUAaWyIyX1bPQTwxIn3mOQYTV9v6PSS+Tt89wuzfuUK8d5JBlEQt
	 Vgi+xafZFM7Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D12D980DA4;
	Tue,  9 Dec 2025 08:54:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D9D8E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 050C240D08
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLUX--EkI02Q for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 08:54:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 297234051D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 297234051D
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 297234051D
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2AFE31A2062
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 08:54:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 020F1606E2;
 Tue,  9 Dec 2025 08:54:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3582211930306; Tue,  9 Dec 2025 09:54:19 +0100 (CET)
Date: Tue, 09 Dec 2025 09:54:12 +0100
MIME-Version: 1.0
Message-Id: <20251209-libldns_drill-v3-2-cce588a002f4@bootlin.com>
References: <20251209-libldns_drill-v3-0-cce588a002f4@bootlin.com>
In-Reply-To: <20251209-libldns_drill-v3-0-cce588a002f4@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Bernd Kuhls <bernd@kuhls.net>, nicolas.carrier@nav-timing.safrangroup.com, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765270459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5KypIfLcxm9P3rb9KYsCY5rpDi1oYNs5SWiA3C3piWM=;
 b=yvx2lQIRuU1v/jtgIHk0WIoCb0hyvm/Kuh5uk1kExCKMput1ZGPp4J/XPHLJ9tQKw6figm
 9Bg3cvKGpfbQGVoqhW0EEgizI/s0VIk+W2xjeReAThdyFm3cHVWTj40GCMMCg+oHwVw8un
 ZmiFSgUa3CENMe/RKkckq5C9FQVDgLsO+WxMsM3Rk1dRqL2ZzVYHdqfbFPFAmLA27AtgrC
 cz5GZfYXqfPuY7ADbKrnNPRv73HuQiYTJoIO1UwNA1MGtdyyQ6XIAZBKmf+VWyyBtFLAi5
 IVydPDqFwSEP5zDDplQqdFf7/GUchJQJnHrxenN25IBzqzX5p8zYTLLmxruFYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=yvx2lQIR
Subject: [Buildroot] [PATCH v3 2/2] support/testing: add basic runtime test
 for libldns/drill
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgc2ltcGxlIHRlc3QgZW5zdXJpbmcgdGhhdAotIGxpYmxkbnMgaXMgY29ycmVjdGx5IGJ1
aWx0IGFuZCBpbnN0YWxsZWQKLSBkcmlsbCBpcyBjb3JyZWN0bHkgYnVpbHQgYW5kIGluc3RhbGxl
ZAotIGRyaWxsIGlzIGFibGUgdG8gZXhlY3V0ZSBvbiB0aGUgdGFyZ2V0CgpSZXZpZXdlZC1ieTog
VGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2xpYmxkbnMucHkgfCAyMSArKysrKysr
KysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCgpkaWZmIC0t
Z2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJsZG5zLnB5IGIvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJsZG5zLnB5Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uNmMxYTRkYTNmMjQ5Ci0tLSAvZGV2L251bGwKKysr
IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9saWJsZG5zLnB5CkBAIC0wLDAg
KzEsMjEgQEAKK2ltcG9ydCBpbmZyYS5iYXNldGVzdAoraW1wb3J0IG9zCisKKworY2xhc3MgVGVz
dExpYkxkbnMoaW5mcmEuYmFzZXRlc3QuQlJUZXN0KToKKyAgICBjb25maWcgPSBpbmZyYS5iYXNl
dGVzdC5CQVNJQ19UT09MQ0hBSU5fQ09ORklHICsgXAorICAgICAgICAiIiIKKyAgICAgICAgQlIy
X1BBQ0tBR0VfTElCTEROUz15CisgICAgICAgIEJSMl9QQUNLQUdFX0xJQkxETlNfRFJJTEw9eQor
ICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKKyAgICAgICAgIyBCUjJfVEFSR0VUX1JP
T1RGU19UQVIgaXMgbm90IHNldAorICAgICAgICAiIiIKKworICAgIGRlZiB0ZXN0X3J1bihzZWxm
KToKKyAgICAgICAgY3Bpb19maWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFn
ZXMiLCAicm9vdGZzLmNwaW8iKQorICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoYXJjaD0iYXJt
djUiLAorICAgICAgICAgICAgICAgICAgICAgICAgICAga2VybmVsPSJidWlsdGluIiwKKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG9wdGlvbnM9WyItaW5pdHJkIiwgY3Bpb19maWxlXSkKKyAg
ICAgICAgc2VsZi5lbXVsYXRvci5sb2dpbigpCisKKyAgICAgICAgc2VsZi5hc3NlcnRSdW5Paygi
ZHJpbGwgLXYiKQoKLS0gCjIuNTEuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
