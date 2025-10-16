Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52AFCCD195
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 14:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6859827C5;
	Thu, 16 Oct 2025 14:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RyErxz_TW-nu; Thu, 16 Oct 2025 14:56:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D818C8352B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D818C8352B;
	Thu, 16 Oct 2025 14:56:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CF022961
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5B0F8352B
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5OhrnYSZKUD for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 14:56:24 +0000 (UTC)
X-Greylist: delayed 565 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 16 Oct 2025 14:56:23 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA7AD827C5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA7AD827C5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA7AD827C5
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 14:56:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 10BE4C041C9;
 Thu, 16 Oct 2025 14:46:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4781A6062C;
 Thu, 16 Oct 2025 14:46:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 13FE4102F2317; 
 Thu, 16 Oct 2025 16:46:55 +0200 (CEST)
Date: Thu, 16 Oct 2025 16:46:38 +0200
MIME-Version: 1.0
Message-Id: <20251016-openscap-v3-5-d7b28e958f5f@bootlin.com>
References: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
In-Reply-To: <20251016-openscap-v3-0-d7b28e958f5f@bootlin.com>
To: buildroot@buildroot.org
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1760626015; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=rhrWJvnOCzfxCAYp1DTAiq7XqpsNd/IS87i31luItx4=;
 b=dZEuPUccFZQ5SURd4gh16zaNtaF3qmek1pW4DV7baKtojjYryCImv6je6aLHG7344PMv/Q
 ofyhewwlFd56g/0meYIfvkV+hQsIvFoJs+iJq2PfT55l92VIvqxuaFK3XFKAM1cnEnfw4b
 9MeUBHbOxs5v5E7A8+PvK4a5ZWCFTEjSjX8LZnF5Fw8ZdsFqdVNkyAv5VO21myi8ZdOdGJ
 Y+iMBDLXcHYrIwbhcV3fZXwQbLCDw+qztBhjLvs8OeE83CVeehRUbF44tMlDzK43IwkPV3
 hCAdgkecs9wlpNm5gpEgfvedKNu0NCl1YZSyzdjMcSxkmKy/uj5XoHmG9eepvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=dZEuPUcc
Subject: [Buildroot] [PATCH v3 5/5] support/testing: add runtime testing for
 compliance-as-code
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
Cc: tim.hammer@nav-timing.safrangroup.com,
 nicolas.carrier@nav-timing.safrangroup.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIHNvbWUgYmFzaWMgcnVudGltZSB0ZXN0aW5nIGZvciBvcGVuc2NhcC9jb21wbGlhbmNlLWFz
LWNvZGUuIEJ5CnJ1bm5pbmcgYSBzaW5nbGUgY29tbWFuZCwgd2UgdGVzdCB0aGF0OgotIHRoZSBv
c2NhcCBiaW5hcnkgaXMgaW5zdGFsbGVkIGFuZCBjYW4gZXhlY3V0ZQotIHRoZSBjb21wbGlhbmNl
LWFzLWNvZGUgcG9saWN5IGZpbGVzIGFyZSBwcm9wZXJseSBpbnN0YWxsZWQKLSBvc2NhcCBjYW4g
cGFyc2UgYSBwb2xpY3kgZmlsZSwgYW5kIHNvIHRob3NlIGFyZSBjb3JyZWN0bHkgYnVpbHQKClNp
Z25lZC1vZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+
Ci0tLQpDaGFuZ2VzIGluIHYyOgotIG5ldyBjb21taXQKLS0tCiBERVZFTE9QRVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIC4uLi90ZXN0cy9wYWNrYWdl
L3Rlc3RfY29tcGxpYW5jZV9hc19jb2RlLnB5ICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysr
KysrKwogMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvREVW
RUxPUEVSUyBiL0RFVkVMT1BFUlMKaW5kZXggYzFkMDkwMTljM2E3MDVkNDViMDI4NDQzYWFjNTA4
YTY5MDhhNzBmMS4uMzQ4ODU4M2Q5MjA2YWQ0NjNhNTViN2Y3OGRjY2NiZjk1Y2RlN2IzYyAxMDA2
NDQKLS0tIGEvREVWRUxPUEVSUworKysgYi9ERVZFTE9QRVJTCkBAIC0xNTcsNiArMTU3LDcgQEAg
TjoJQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KIEY6CXBhY2th
Z2UvbGlieG1sc2VjMS8KIEY6CXBhY2thZ2Uvb3BlbnNjYXAvCiBGOglwYWNrYWdlL2NvbXBsaWFu
Y2UtYXMtY29kZS8KK0Y6CXN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfY29tcGxp
YW5jZV9hc19jb2RlLnB5CiAKIE46CUFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyQGFsaXN0YWly
MjMubWU+CiBGOglib2FyZC9zaWZpdmUvCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X2NvbXBsaWFuY2VfYXNfY29kZS5weSBiL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfY29tcGxpYW5jZV9hc19jb2RlLnB5Cm5ldyBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjEwYTUz
YzEyZDBjMjZkY2YxMjRlZTY0ZDI2MGFiNmFkYjQ3NjVjMGUKLS0tIC9kZXYvbnVsbAorKysgYi9z
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2NvbXBsaWFuY2VfYXNfY29kZS5weQpA
QCAtMCwwICsxLDIzIEBACitpbXBvcnQgb3MKK2Zyb20gaW5mcmEuYmFzZXRlc3QgaW1wb3J0IEJS
VGVzdCwgQkFTSUNfVE9PTENIQUlOX0NPTkZJRworCisKK2NsYXNzIFRlc3RDb21wbGlhbmNlQXND
b2RlKEJSVGVzdCk6CisgICAgY29uZmlnID0gQkFTSUNfVE9PTENIQUlOX0NPTkZJRyArIFwKKyAg
ICAgICAgIiIiCisgICAgICAgIEJSMl9QQUNLQUdFX0NPTVBMSUFOQ0VfQVNfQ09ERT15CisgICAg
ICAgIEJSMl9QQUNLQUdFX0NPTVBMSUFOQ0VfQVNfQ09ERV9QUk9EVUNUUz0iZGViaWFuMTIiCisg
ICAgICAgIEJSMl9UQVJHRVRfUk9PVEZTX0NQSU89eQorICAgICAgICAjIEJSMl9UQVJHRVRfUk9P
VEZTX1RBUiBpcyBub3Qgc2V0CisgICAgICAgICIiIgorCisgICAgZGVmIHRlc3RfcnVuKHNlbGYp
OgorICAgICAgICBjcGlvX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5idWlsZGRpciwgImltYWdl
cyIsICJyb290ZnMuY3BpbyIpCisgICAgICAgIHNlbGYuZW11bGF0b3IuYm9vdChhcmNoPSJhcm12
NSIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAorICAgICAg
ICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1pbml0cmQiLCBjcGlvX2ZpbGVdKQorICAg
ICAgICBzZWxmLmVtdWxhdG9yLmxvZ2luKCkKKworICAgICAgICAjIENoZWNrIHRoYXQgb3NjYXAg
Y2FuIHBhcnNlIHRoZSBnZW5lcmF0ZWQgZGF0YXN0cmVhbQorICAgICAgICBzZWxmLmFzc2VydFJ1
bk9rKAorICAgICAgICAgICAgICAgICJvc2NhcCBpbmZvIC9ldGMvb3BlbnNjYXAvc3NnLWRlYmlh
bjEyLWRzLnhtbCIsIHRpbWVvdXQ9MTApCgotLSAKMi41MS4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
