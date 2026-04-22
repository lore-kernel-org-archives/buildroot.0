Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40219F9B60E
	for <buildroot@archiver.kernel.org>; Wed, 22 Apr 2026 10:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEE6A61704;
	Wed, 22 Apr 2026 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxLhzMuYkdAX; Wed, 22 Apr 2026 10:36:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BF0B61705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776854168;
	bh=AdYWd4We5zh9YaNz4ajpMDOsk208B1cwHtg2YTzVTPI=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=prlMLu/K9WaXsMNZir/7drdVQxFA3NPDgZUv3+wU1fbLJdpB9v2Mkk8F4esXD5Usw
	 lv91vyZioncF9pQZNPmSGgJmbErsh/T66Asaa/AQVyWWjjq/WuaYX6hEKfQYo8a2MT
	 uWl9Lv+v6IO7xUZrkOAI0nleyhJzJ/Hz+aMw3fGH5IO8tLgKR1enE+mFTzDznQYYuQ
	 xcYgvfP+PHK8oyBbjAH+LN0X9sQdOcD4+klXXLPpjFkZB4heNjdV+p3/5QEBIC1i8z
	 tNn+O2rI6Z/mIG/8dntYsDqKbCMJAOjDwTte/XAx2UfsJpqH3S1aBIIJ20XWmwY9Zj
	 fPlYYhS7wsIiw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BF0B61705;
	Wed, 22 Apr 2026 10:36:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 080C8183
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 10:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1371403AE
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 10:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1TCFZuPYjwy for <buildroot@buildroot.org>;
 Wed, 22 Apr 2026 10:36:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 027D740093
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027D740093
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 027D740093
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 10:36:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id EC2B5C5C9BB
 for <buildroot@buildroot.org>; Wed, 22 Apr 2026 10:36:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 349165FA8F;
 Wed, 22 Apr 2026 10:36:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 17C5A10460700; 
 Wed, 22 Apr 2026 12:36:00 +0200 (CEST)
Date: Wed, 22 Apr 2026 12:35:54 +0200
MIME-Version: 1.0
Message-Id: <20260422-frr_service-v1-1-b9aa85034931@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBBA0avIrDWpIU24iohQU8YCmSIS6d0Vy
 7f4/wZPwuShSm4QOtnzukRkaQJ26paRFA/RgBqNLhCVE2ljc7IlVQ4lmg4NutxALDYhx9d3q5v
 f/uhnsvu7gBAeQvFC9m8AAAA=
X-Change-ID: 20260422-frr_service-9d926a262f36
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vadim Kochan <vadim4j@gmail.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1776854162; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=tDcEfPrJWt6610QAv8+cbu4NxhI5FdDdZO+M0AdGn40=;
 b=MDCZFP5jEhkb0nmTJItH8pGsiR40QTYUzYOpZ0Y3mI2ekaSnfahfS1dkNypr9MkesPg8Yk
 eSynEvDS/7DkgE46IQCOnyHqK1PlMALYeavZZsLHbL82yyqXtBKMCtjIsvh5jO/vHcnjNb
 xkAn8pLnqcd6+bDQqyO+sMbizABGTObcILMQtoOCTtGpupGcGPh2gw/Xlo453aVgFzv5EC
 B0M2qk8YW610+2bDhQS0WoE0vgCh5Tv2d3H87xQtMdOl0lM94PoqiyatXrIv9AxQu6W/MA
 unP2+MV7YyeGn8IkuF9KR2X+vGhEGPsI5fzatQNEJ3JwtMDEy6DzaI4ucl0lnQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=MDCZFP5j
Subject: [Buildroot] [PATCH] package/frr: install systemd service files
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

VGhlIEZSUiBwYWNrYWdlIGN1cnJlbnRseSBvbmx5IGluc3RhbGxzIHN5c3RlbXYgc2VydmljZXMg
ZmlsZXMuIFRoZQp1cHN0cmVhbSBwYWNrYWdlIGFsc28gcHJvdmlkZXMgYSBzeXN0ZW1kIHNlcnZp
Y2UgZmlsZSBhbmQgYSBzZXJ2aWNlCnRlbXBsYXRlIGZpbGUuIEluc3RhbGwgdGhvc2Ugd2hlbiBz
eXN0ZW1kIGlzIHNlbGVjdGVkIGFzIGFuIGluaXQKbWFuYWdlci4KClNpZ25lZC1vZmYtYnk6IEFs
ZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogcGFja2FnZS9m
cnIvZnJyLm1rIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9mcnIvZnJyLm1rIGIvcGFja2FnZS9mcnIvZnJyLm1rCmluZGV4
IDYxYTM0ZGU0ZDM2Yi4uYzVhMTJmNjk5MjQxIDEwMDY0NAotLS0gYS9wYWNrYWdlL2Zyci9mcnIu
bWsKKysrIGIvcGFja2FnZS9mcnIvZnJyLm1rCkBAIC0xMzEsNSArMTMxLDEyIEBAIGRlZmluZSBG
UlJfSU5TVEFMTF9JTklUX1NZU1YKIAkJJChUQVJHRVRfRElSKS9ldGMvaW5pdC5kL1M1MGZycgog
ZW5kZWYKIAorZGVmaW5lIEZSUl9JTlNUQUxMX0lOSVRfU1lTVEVNRAorCSQoSU5TVEFMTCkgLUQg
LW0gNjQ0ICQoQEQpL3Rvb2xzL2Zyci5zZXJ2aWNlIFwKKwkJJChUQVJHRVRfRElSKS91c3IvbGli
L3N5c3RlbWQvc3lzdGVtL2Zyci5zZXJ2aWNlCisJJChJTlNUQUxMKSAtRCAtbSA2NDQgJChARCkv
dG9vbHMvZnJyQC5zZXJ2aWNlIFwKKwkJJChUQVJHRVRfRElSKS91c3IvbGliL3N5c3RlbWQvc3lz
dGVtL2ZyckAuc2VydmljZQorZW5kZWYKKwogJChldmFsICQoYXV0b3Rvb2xzLXBhY2thZ2UpKQog
JChldmFsICQoaG9zdC1hdXRvdG9vbHMtcGFja2FnZSkpCgotLS0KYmFzZS1jb21taXQ6IGY2ZDE5
Njc5OGQyNzE0YTNiMDk0ZGJiMjNiNDdiZWZjMTY5MmNiNDAKY2hhbmdlLWlkOiAyMDI2MDQyMi1m
cnJfc2VydmljZS05ZDkyNmEyNjJmMzYKCkJlc3QgcmVnYXJkcywKLS0gIApBbGV4aXMgTG90aG9y
w6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
