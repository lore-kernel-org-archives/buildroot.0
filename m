Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D122C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Mar 2022 15:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A1D4404F8;
	Mon, 14 Mar 2022 15:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E3-FK4o_PYHh; Mon, 14 Mar 2022 15:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7564404AA;
	Mon, 14 Mar 2022 15:33:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 437311BF395
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30FB660D66
 for <buildroot@lists.busybox.net>; Mon, 14 Mar 2022 15:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MNKvPkFZGlzp for <buildroot@lists.busybox.net>;
 Mon, 14 Mar 2022 15:32:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6EBBD60C21
 for <buildroot@buildroot.org>; Mon, 14 Mar 2022 15:32:56 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9237760005;
 Mon, 14 Mar 2022 15:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647271973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IZMiMRMjpxtlrVtyH/3SOvcFHpSjdEY+6RtwLb8PDeg=;
 b=aHfFqr0fFB5K0Zgmfn/RTrkXvMRHfVv9yJqyhY/McMC7wVKhMRX0UL6ICuJwudENQF1zz3
 j17T4HMRpHgFbMuOumuPxPSII8MocvAKnKecEPgcSqx7aHstQS+uQoyLOJzuYTlkSP95df
 bwPJvWnqMAQFGWS3ZBUypGzv/fSPX951LB04JlR4kDdGVzSvu3PNGHpi/99lMQ/FK30YOV
 reF+rN9rYS3nWEonIrnKjXNhuIJJD3DyG5Hus8ojfTuBXeVEhbt7lX8oXk1Rmqi80MF5KK
 ywRnVBbiYXcQV46b85FBRHwwfgsMgm6Si34i4TSITm1DLm6JBqtIBwyMUu8ehQ==
To: buildroot@buildroot.org
Date: Mon, 14 Mar 2022 16:31:04 +0100
Message-Id: <20220314153111.1390512-2-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220314153111.1390512-1-clement.leger@bootlin.com>
References: <20220314153111.1390512-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/8] boot/optee-os: add option to select DTC
 dependency
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

U29tZSBwbGF0Zm9ybXMgKHN0bTMyLCBzYW0pIG5lZWRzIERUQyB0byBidWlsZCB0aGUgcGxhdGZv
cm0KZGV2aWNlLXRyZWVzLiBBZGQgQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19EVEMgY29uZmln
dXJhdGlvbgpvcHRpb24gdG8gc2VsZWN0IGhvc3QtZHRjIHBhY2thZ2Ugd2hlbiBidWlsZGluZy4K
ClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlbWVudC5sZWdlckBib290bGluLmNv
bT4KLS0tCiBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgIHwgNyArKysrKysrCiBib290L29wdGVl
LW9zL29wdGVlLW9zLm1rIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9ib290L29wdGVlLW9zL0NvbmZpZy5pbiBiL2Jvb3Qvb3B0ZWUtb3Mv
Q29uZmlnLmluCmluZGV4IDA5NzQ1Nzg0ODQuLjJmNjE0M2YxZjQgMTAwNjQ0Ci0tLSBhL2Jvb3Qv
b3B0ZWUtb3MvQ29uZmlnLmluCisrKyBiL2Jvb3Qvb3B0ZWUtb3MvQ29uZmlnLmluCkBAIC00OCw2
ICs0OCwxMyBAQCBjb25maWcgQlIyX1RBUkdFVF9PUFRFRV9PU19DVVNUT01fUkVQT19WRVJTSU9O
CiAKIGVuZGlmCiAKK2NvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX0RUQworCWJvb2wg
Ik9QLVRFRSBPUyBuZWVkcyBkdGMiCisJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfRFRDCisJaGVs
cAorCSAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIHlvdXIgT1AtVEVFIE9TIHBsYXRmb3JtIGNvbmZp
Z3VyYXRpb24KKwkgIHJlcXVpcmVzIHRoZSBEZXZpY2UgVHJlZSBjb21waWxlciB0byBiZSBhdmFp
bGFibGUuCisKIGNvbmZpZyBCUjJfVEFSR0VUX09QVEVFX09TX1ZFUlNJT04KIAlzdHJpbmcKIAlk
ZWZhdWx0ICIzLjE1LjAiCWlmIEJSMl9UQVJHRVRfT1BURUVfT1NfTEFURVNUCmRpZmYgLS1naXQg
YS9ib290L29wdGVlLW9zL29wdGVlLW9zLm1rIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawpp
bmRleCAxNjZiNWU2OTNjLi45Zjc2ZDg0NTBlIDEwMDY0NAotLS0gYS9ib290L29wdGVlLW9zL29w
dGVlLW9zLm1rCisrKyBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKQEAgLTIzLDYgKzIzLDEw
IEBAIGVuZGlmCiAKIE9QVEVFX09TX0RFUEVOREVOQ0lFUyA9IGhvc3Qtb3BlbnNzbCBob3N0LXB5
dGhvbjMgaG9zdC1weXRob24tcHljcnlwdG9kb21leCBob3N0LXB5dGhvbi1weWVsZnRvb2xzCiAK
K2lmZXEgKCQoQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19EVEMpLHkpCitPUFRFRV9PU19ERVBF
TkRFTkNJRVMgKz0gaG9zdC1kdGMKK2VuZGlmCisKICMgT24gNjRiaXQgdGFyZ2V0cywgT1AtVEVF
IE9TIGNhbiBiZSBidWlsdCBpbiAzMmJpdCBtb2RlLCBvcgogIyBjYW4gYmUgYnVpbHQgaW4gNjRi
aXQgbW9kZSBhbmQgc3VwcG9ydCAzMmJpdCBhbmQgNjRiaXQKICMgdHJ1c3RlZCBhcHBsaWNhdGlv
bnMuIFNpbmNlIGJ1aWxkcm9vdCBjdXJyZW50bHkgcmVmZXJlbmNlcwotLSAKMi4zNC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
