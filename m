Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F47C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 15:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 679CE404F9;
	Mon, 14 Mar 2022 15:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ufeR5SO9PUXc; Mon, 14 Mar 2022 15:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79914404A6;
	Mon, 14 Mar 2022 15:33:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E33271BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFCE260D66
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SgVsPAOykCED for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 15:33:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0901760C21
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 15:33:01 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3D8AB60008;
 Mon, 14 Mar 2022 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647271980;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GZryPo5QNu2QgSgdpyZhT6gLpPPt3+a1cxkxV2X9X3A=;
 b=aa0hvcxTfpwIWSvT72Jl2ETDx3lNrHa3ifeRPxvo2Wg37xKKqO2GO2+Pak/Dh1YElNTXns
 bSuaLXhcyCLP+5KPyNb6g/Tm/7QOrLoOixUaOL2uytZTKiiN4Ga8rKrvuFfkcfcEu/G+rg
 wJdwoKutWZAL5U7JXiEEuD+SQTsf8+ffnT8DWKyhkKam2//Zbujk2oK7bNKKmHHJK4DBOA
 Im9R4zXFFB5pa9x4o9J62EHt2L9AqATd2f7vn9R+hGf8m5cJbQxO5xxktCohZ6XOHjmwEr
 1qdUQwi83V+WY8MB9u/lXYJxmUnm7Jj00587AuOEJWzhQE0+WDa8QxiKEQ09uA==
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 16:31:06 +0100
Message-Id: <20220314153111.1390512-4-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314153111.1390512-1-clement.leger@bootlin.com>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 3/8] boot/optee-os: add support to build with
 python-cryptography
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
From: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TmV3ZXIgdmVyc2lvbiBvZiBvcHRlZS1vcyAoPj0gMy4xNikgdXNlcyBweXRob24tY3J5cHRvZ3Jh
cGh5IGluc3RlYWQgb2YKcHl0aG9uLXB5Y3J5cHRvZG9tZXggaW4gcHl0aG9uIHNjcmlwdHMuIEFk
ZCBzdXBwb3J0IHRvIGJ1aWxkIHRoZXNlCm5ld2VyIHZlcnNpb25zIGJ5IGFkZGluZyBhIG5ldwpC
UjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9DUllQVE9HUkFQSFkgb3B0aW9uIHdoaWNo
IHdpbGwKc2VsZWN0IGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSBkZXBlbmRlbmN5IHdoZW4gYnVp
bGRpbmcgb3B0ZWUtb3MuCgpBY2tlZC1ieTogRXRpZW5uZSBDYXJyaWVyZSA8ZXRpZW5uZS5jYXJy
aWVyZUBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZW1lbnQu
bGVnZXJAYm9vdGxpbi5jb20+Ci0tLQogYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICB8IDkgKysr
KysrKysrCiBib290L29wdGVlLW9zL29wdGVlLW9zLm1rIHwgOCArKysrKysrLQogMiBmaWxlcyBj
aGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvYm9v
dC9vcHRlZS1vcy9Db25maWcuaW4gYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgppbmRleCAyZjYx
NDNmMWY0Li4zOTk2MDM5MTkxIDEwMDY0NAotLS0gYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbgor
KysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgpAQCAtMSw2ICsxLDcgQEAKIGNvbmZpZyBCUjJf
VEFSR0VUX09QVEVFX09TCiAJYm9vbCAib3B0ZWVfb3MiCiAJZGVwZW5kcyBvbiBCUjJfQVJNX0NQ
VV9BUk1WOEEgfHwgQlIyX0FSTV9DUFVfQVJNVjdBCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9I
T1NUX1JVU1RDX0FSQ0hfU1VQUE9SVFMKIAloZWxwCiAJICBPUC1URUUgT1MgcHJvdmlkZXMgdGhl
IHNlY3VyZSB3b3JsZCBib290IGltYWdlIGFuZCB0aGUgdHJ1c3QKIAkgIGFwcGxpY2F0aW9uIGRl
dmVsb3BtZW50IGtpdCBvZiB0aGUgT1AtVEVFIHByb2plY3QuIE9QLVRFRSBPUwpAQCAtNTUsNiAr
NTYsMTQgQEAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfRFRDCiAJICBTZWxlY3Qg
dGhpcyBvcHRpb24gaWYgeW91ciBPUC1URUUgT1MgcGxhdGZvcm0gY29uZmlndXJhdGlvbgogCSAg
cmVxdWlyZXMgdGhlIERldmljZSBUcmVlIGNvbXBpbGVyIHRvIGJlIGF2YWlsYWJsZS4KIAorY29u
ZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQorCWJvb2wg
Ik9QLVRFRSBPUyBuZWVkcyBob3N0LXB5dGhvbi1jcnlwdG9ncmFwaHkiCisJaGVscAorCSAgT1At
VEVFIE9TIHZlcnNpb24gYmVsb3cgMy4xNiB1c2VkIHB5dGhvbi1weWNyeXB0b2RvbWV4CisJICBw
YWNrYWdlIGluIHB5dGhvbiBzY3JpcHRzLiBOZXdlciB2ZXJzaW9uIHVzZXMKKwkgIHB5dGhvbi1j
cnlwdG9ncmFwaHkuIFNlbGVjdCB0aGlzIG9wdGlvbiBpZiBvcHRlZS1vcyBuZWVkcworCSAgcHl0
aG9uLWNyeXB0b2dyYXBoeSB0byBiZSBidWlsdC4KKwogY29uZmlnIEJSMl9UQVJHRVRfT1BURUVf
T1NfVkVSU0lPTgogCXN0cmluZwogCWRlZmF1bHQgIjMuMTUuMCIJaWYgQlIyX1RBUkdFVF9PUFRF
RV9PU19MQVRFU1QKZGlmZiAtLWdpdCBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsgYi9ib290
L29wdGVlLW9zL29wdGVlLW9zLm1rCmluZGV4IDlmNzZkODQ1MGUuLjUzMTNhMWJhZGMgMTAwNjQ0
Ci0tLSBhL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKKysrIGIvYm9vdC9vcHRlZS1vcy9vcHRl
ZS1vcy5tawpAQCAtMjEsNyArMjEsMTMgQEAgZWxzZQogT1BURUVfT1NfU0lURSA9ICQoY2FsbCBn
aXRodWIsT1AtVEVFLG9wdGVlX29zLCQoT1BURUVfT1NfVkVSU0lPTikpCiBlbmRpZgogCi1PUFRF
RV9PU19ERVBFTkRFTkNJRVMgPSBob3N0LW9wZW5zc2wgaG9zdC1weXRob24zIGhvc3QtcHl0aG9u
LXB5Y3J5cHRvZG9tZXggaG9zdC1weXRob24tcHllbGZ0b29scworT1BURUVfT1NfREVQRU5ERU5D
SUVTID0gaG9zdC1vcGVuc3NsIGhvc3QtcHl0aG9uMyBob3N0LXB5dGhvbi1weWVsZnRvb2xzCisK
K2lmZXEgKCQoQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZKSx5
KQorT1BURUVfT1NfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeQorZWxz
ZQorT1BURUVfT1NfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXB5Y3J5cHRvZG9tZXgKK2Vu
ZGlmCiAKIGlmZXEgKCQoQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19EVEMpLHkpCiBPUFRFRV9P
U19ERVBFTkRFTkNJRVMgKz0gaG9zdC1kdGMKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
