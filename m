Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DBDCA0FF9
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 13:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADFF0615EE;
	Fri, 29 Aug 2025 13:13:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cRy7Kfkea_sN; Fri, 29 Aug 2025 13:13:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3758E6142A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3758E6142A;
	Fri, 29 Aug 2025 13:13:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D00C46C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B662B415DD
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nVHVVWfuvLpk for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 13:13:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E539F415BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E539F415BA
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E539F415BA
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:13:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id AB7D8C8F1C2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 13:12:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 345BA606B9;
 Fri, 29 Aug 2025 13:13:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0B0B61C228B17; 
 Fri, 29 Aug 2025 15:13:11 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 29 Aug 2025 15:13:01 +0200
Message-ID: <20250829131304.1845147-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1756473192; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=EYeh0dXXkUlZ+SqID2ucB91hhFGIvEdB+wZsGmoaYDU=;
 b=d+qLJrpLxCbdCy8EP1GL2kurnrawC6i/RU0ebr8E8plYgYV3T6Ez5Pp6VKHm+PV9o1jSlo
 I/rOH7UB9f5CQglLjhU9LoS6HvOib0BBdBs58lOeCtclZoUdBs2hf7CoyCCvSggYQ7gIHD
 QmMQx5DgDaoOq7msVlhQIr4Zj449Nd5kleWJyyzvPfnpf39N0O+YKfxMCjq/Q3qfa0LUIe
 4GyMtLWX95Fxq25DRx8nFqc9jEt1peGyaH1SNdq3qzPJ1T5wcD8KJea+EIMbDsChS9YCwT
 2wngVeRLEUnOIH88ezGGnsi1J3hojtC+8vXwUy5kn4+1uuoOOMVFmT3f3xwEiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=d+qLJrpL
Subject: [Buildroot] [PATCH 1/2] package/apitrace: fix build with GCC 15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6CgogIC9ob21lL3Rob21hcy9idWlsZHJvb3QvYnVpbGRyb290L291dHB1dHMvYWxsL2J1
aWxkL2FwaXRyYWNlLTEwLjAvcmV0cmFjZS9tZXRyaWNfd3JpdGVyLmNwcDo1MDo3MDogZXJyb3I6
IOKAmHVpbnQ2NF904oCZIGRvZXMgbm90IG5hbWUgYSB0eXBlCiAgIDUwIHwgICAgICAgICBjYXNl
IENOVF9OVU1fVUlOVDY0OiBzdGQ6OmNvdXQgPDwgIlx0IiA8PCAqKHJlaW50ZXJwcmV0X2Nhc3Q8
dWludDY0X3QqPihkYXRhKSk7IGJyZWFrOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+CgpG
aXhlczoKCiAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNmU0LzZlNGU4
NDFiNGYwYmUyOTk1NmZkZmFkNDNhNDA2ZDJkYWIzMDAzZjMvYnVpbGQtZW5kLmxvZwoKUGF0Y2gg
aXMgYmFja3BvcnRlZCBmcm9tIHVwc3RyZWFtLgoKU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6
em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiAuLi4vMDAwMy1FeHBsaWNp
dC1oZWFkZXItc3RkaW50LnBhdGNoICAgICAgICAgfCA0MiArKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2UvYXBpdHJhY2UvMDAwMy1FeHBsaWNpdC1oZWFkZXItc3RkaW50LnBhdGNoCgpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9hcGl0cmFjZS8wMDAzLUV4cGxpY2l0LWhlYWRlci1zdGRpbnQucGF0Y2ggYi9w
YWNrYWdlL2FwaXRyYWNlLzAwMDMtRXhwbGljaXQtaGVhZGVyLXN0ZGludC5wYXRjaApuZXcgZmls
ZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5lZmQ3NTIyMzE0Ci0tLSAvZGV2L251bGwK
KysrIGIvcGFja2FnZS9hcGl0cmFjZS8wMDAzLUV4cGxpY2l0LWhlYWRlci1zdGRpbnQucGF0Y2gK
QEAgLTAsMCArMSw0MiBAQAorRnJvbSAzY2M4OTU2OTk1ZDZkNzAyYTJjM2VmMGQ3ZjkxNTAwYzZh
Y2NiZmFkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogTmljb2xhcyBQQVJMQU5UIDxu
aWNvbGFzLnBhcmxhbnRAcGFyaHVldC5mcj4KK0RhdGU6IEZyaSwgMjEgTWFyIDIwMjUgMDU6MDI6
MjMgKzAwMDAKK1N1YmplY3Q6IFtQQVRDSF0gRXhwbGljaXQgaGVhZGVyOiBzdGRpbnQKKworRml4
IGJ1aWxkaW5nIHdpdGggR0NDLTE1LiBJdCBubyBsb25nZXIgaW5jbHVkZXMgaXQgYnkgZGVmYXVs
dC4KKworU2lnbmVkLW9mZi1ieTogTmljb2xhcyBQQVJMQU5UIDxuaWNvbGFzLnBhcmxhbnRAcGFy
aHVldC5mcj4KK1Vwc3RyZWFtOiA5NTJiYWQxNDY5ZWE3NDcwMTJiZGM0OGM0ODk5M2JkNWYxM2Vl
YzA0CitTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJv
b3RsaW4uY29tPgorLS0tCisgZnJhbWV0cmltL2Z0X2RlcGVuZGVjeW9iamVjdC5ocHAgfCAxICsK
KyByZXRyYWNlL21ldHJpY193cml0ZXIuY3BwICAgICAgICB8IDEgKworIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9mcmFtZXRyaW0vZnRfZGVwZW5kZWN5
b2JqZWN0LmhwcCBiL2ZyYW1ldHJpbS9mdF9kZXBlbmRlY3lvYmplY3QuaHBwCitpbmRleCBjZjE4
ODVmMS4uNTNiOTEwZDAgMTAwNjQ0CistLS0gYS9mcmFtZXRyaW0vZnRfZGVwZW5kZWN5b2JqZWN0
LmhwcAorKysrIGIvZnJhbWV0cmltL2Z0X2RlcGVuZGVjeW9iamVjdC5ocHAKK0BAIC0yOCw2ICsy
OCw3IEBACisgI3ByYWdtYSBvbmNlCisgCisgI2luY2x1ZGUgImZ0X3RyYWNlY2FsbC5ocHAiCisr
I2luY2x1ZGUgPHN0ZGludC5oPgorIAorIG5hbWVzcGFjZSBmcmFtZXRyaW0geworIAorZGlmZiAt
LWdpdCBhL3JldHJhY2UvbWV0cmljX3dyaXRlci5jcHAgYi9yZXRyYWNlL21ldHJpY193cml0ZXIu
Y3BwCitpbmRleCBlOTIzZWQxZC4uNGU0Y2U3NDggMTAwNjQ0CistLS0gYS9yZXRyYWNlL21ldHJp
Y193cml0ZXIuY3BwCisrKysgYi9yZXRyYWNlL21ldHJpY193cml0ZXIuY3BwCitAQCAtMjQsNiAr
MjQsNyBAQAorICAqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqKioqKi8KKyAKKyAjaW5jbHVkZSA8aW9zdHJlYW0+Cisr
I2luY2x1ZGUgPHN0ZGludC5oPgorIAorICNpbmNsdWRlICJtZXRyaWNfd3JpdGVyLmhwcCIKKyAK
Ky0tIAorMi41MC4xCisKLS0gCjIuNTAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
