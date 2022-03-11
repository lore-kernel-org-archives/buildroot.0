Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11127C433FE
	for <buildroot@archiver.kernel.org>; Fri, 11 Mar 2022 12:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF6284378;
	Fri, 11 Mar 2022 12:38:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R9zBRAG6aHkp; Fri, 11 Mar 2022 12:38:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE4FA84384;
	Fri, 11 Mar 2022 12:38:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E32671BF9AA
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB80540286
 for <buildroot@lists.busybox.net>; Fri, 11 Mar 2022 12:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pNoBVONcRiuf for <buildroot@lists.busybox.net>;
 Fri, 11 Mar 2022 12:38:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5572F401F2
 for <buildroot@buildroot.org>; Fri, 11 Mar 2022 12:38:04 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2BE18C0012;
 Fri, 11 Mar 2022 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1647002282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X93163lv7Epf4rAqaEe0/EuD4C9x2fpM/zqqhGidW8o=;
 b=mVauStWgRAEivcGJeFaknu/m0tMx5IcG1eD8WB7xKzS4NaeQumlVXT9eJv4QsIq69FnkqP
 TqNxHEvpkdXMyCk5IuzrRd25WG355KmfSBKYYGSef5aHTm4r4Re9bniWC5bScK5sdkzv+S
 N6EoI5znNWA0rsUai9XK9d7XoRap5S7Gn0x+GQuV/IDCizSqAnul8q9CDRseSLz1BVCCRT
 upccuFGAXOKBYChHUNheDOu8HY/VTSUiUDUPgUcFr7vwmA+I2fqDRnnmngI37hIx/wS0X3
 SRTBw8UemtiXVOHXklVZS8j5rCcHEuKT0XhwtnglJlTQYrGgvlRUjMP/kuMdhw==
To: buildroot@buildroot.org
Date: Fri, 11 Mar 2022 13:36:31 +0100
Message-Id: <20220311123636.13415-3-clement.leger@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311123636.13415-1-clement.leger@bootlin.com>
References: <20220311123636.13415-1-clement.leger@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/7] boot/optee-os: add support to build with
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
bGVnZXJAYm9vdGxpbi5jb20+Ci0tLQogYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gICB8IDggKysr
KysrKysKIGJvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsgfCA3ICsrKysrKy0KIDIgZmlsZXMgY2hh
bmdlZCwgMTQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Jvb3Qv
b3B0ZWUtb3MvQ29uZmlnLmluIGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KaW5kZXggMDk3NDU3
ODQ4NC4uZjg0MjZmOWFiMiAxMDA2NDQKLS0tIGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KKysr
IGIvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4KQEAgLTQ4LDYgKzQ4LDE0IEBAIGNvbmZpZyBCUjJf
VEFSR0VUX09QVEVFX09TX0NVU1RPTV9SRVBPX1ZFUlNJT04KIAogZW5kaWYKIAorY29uZmlnIEJS
Ml9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX0NSWVBUT0dSQVBIWQorCWJvb2wgIm9wdGVl
LW9zIG5lZWRzIGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeSB0byBidWlsZCIKKwloZWxwCisJICBP
UC1URUUgdmVyc2lvbiBiZWxvdyAzLjE2IHVzZWQgcHl0aG9uLXB5Y3J5cHRvZG9tZXggcGFja2Fn
ZQorCSAgaW4gcHl0aG9uIHNjcmlwdHMuIE5ld2VyIHZlcnNpb24gdXNlcyBweXRob24tY3J5cHRv
Z3JhcGh5LgorCSAgU2VsZWN0IHRoaXMgb3B0aW9uIGlmIG9wdGVlLW9zIG5lZWRzIHB5dGhvbi1j
cnlwdG9ncmFwaHkgdG8KKwkgIGJlIGJ1aWx0LgorCiBjb25maWcgQlIyX1RBUkdFVF9PUFRFRV9P
U19WRVJTSU9OCiAJc3RyaW5nCiAJZGVmYXVsdCAiMy4xNS4wIglpZiBCUjJfVEFSR0VUX09QVEVF
X09TX0xBVEVTVApkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tayBiL2Jvb3Qv
b3B0ZWUtb3Mvb3B0ZWUtb3MubWsKaW5kZXggMTY2YjVlNjkzYy4uNTdmOWExN2JiNiAxMDA2NDQK
LS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5taworKysgYi9ib290L29wdGVlLW9zL29wdGVl
LW9zLm1rCkBAIC0yMSw3ICsyMSwxMiBAQCBlbHNlCiBPUFRFRV9PU19TSVRFID0gJChjYWxsIGdp
dGh1YixPUC1URUUsb3B0ZWVfb3MsJChPUFRFRV9PU19WRVJTSU9OKSkKIGVuZGlmCiAKLU9QVEVF
X09TX0RFUEVOREVOQ0lFUyA9IGhvc3Qtb3BlbnNzbCBob3N0LXB5dGhvbjMgaG9zdC1weXRob24t
cHljcnlwdG9kb21leCBob3N0LXB5dGhvbi1weWVsZnRvb2xzCitPUFRFRV9PU19ERVBFTkRFTkNJ
RVMgPSBob3N0LW9wZW5zc2wgaG9zdC1weXRob24zIGhvc3QtcHl0aG9uLXB5ZWxmdG9vbHMKK2lm
ZXEgKCQoQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRIT05fQ1JZUFRPR1JBUEhZKSx5KQor
T1BURUVfT1NfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLWNyeXB0b2dyYXBoeQorZWxzZQor
T1BURUVfT1NfREVQRU5ERU5DSUVTICs9IGhvc3QtcHl0aG9uLXB5Y3J5cHRvZG9tZXgKK2VuZGlm
CiAKICMgT24gNjRiaXQgdGFyZ2V0cywgT1AtVEVFIE9TIGNhbiBiZSBidWlsdCBpbiAzMmJpdCBt
b2RlLCBvcgogIyBjYW4gYmUgYnVpbHQgaW4gNjRiaXQgbW9kZSBhbmQgc3VwcG9ydCAzMmJpdCBh
bmQgNjRiaXQKLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
