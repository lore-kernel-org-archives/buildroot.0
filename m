Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED931C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 20:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A97681586;
	Thu, 23 Feb 2023 20:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A97681586
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Qq8_2CVJfOk; Thu, 23 Feb 2023 20:18:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEF2781471;
	Thu, 23 Feb 2023 20:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEF2781471
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9E81BF3E0
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 20:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB047814C9
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 20:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB047814C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWfuFe-miwlo for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 20:18:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A5CD81452
Received: from server1.martb.eu (server1.martb.eu [195.201.128.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A5CD81452
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 20:18:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 23 Feb 2023 21:18:17 +0100
Message-Id: <20230223201817.224238-1-contact@martb.dev>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=martb.dev; s=mail; t=1677183503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cYwTMvn1mBfA/+uS6O29Z+YFdtdim6HC61gPd6H9fW0=;
 b=kCGPVg0SaiySiU2rTzEDRa/nsS9ULLem8fTB1vH4GcM5PuC9MUX+Q2NCfkgtC0vd5a8ARH
 EdPtVLAbpMie3L1gY7482USymDBmPvQiLTJE1P6F7FgbmCuSagYCXFoGPhGOJPIzqb5dnv
 K/HqWxbU9x6ZLd7WcgviCpGsB9shxO4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=martb.dev header.i=@martb.dev
 header.a=rsa-sha256 header.s=mail header.b=kCGPVg0S
X-Mailman-Original-Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=martin@familie-boeh.de smtp.mailfrom=contact@martb.dev
Subject: [Buildroot] [PATCH 1/1] package/gr-osmosdr: add support for HACKRF
 receivers
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
From: =?utf-8?q?Martin_B=C3=B6h_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Martin=20B=C3=B6h?= <contact@martb.dev>
Cc: =?UTF-8?q?Martin=20B=C3=B6h?= <contact@martb.dev>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogTWFydGluIELDtmggPGNvbnRhY3RAbWFydGIuZGV2PgotLS0KIHBhY2th
Z2UvZ3Itb3Ntb3Nkci9Db25maWcuaW4gICAgIHwgNiArKysrKysKIHBhY2thZ2UvZ3Itb3Ntb3Nk
ci9nci1vc21vc2RyLm1rIHwgNyArKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2dyLW9zbW9zZHIvQ29uZmlnLmluIGIvcGFja2Fn
ZS9nci1vc21vc2RyL0NvbmZpZy5pbgppbmRleCAwNGZhMTBiZTgwLi4wNWI1YzQ2YTYzIDEwMDY0
NAotLS0gYS9wYWNrYWdlL2dyLW9zbW9zZHIvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvZ3Itb3Nt
b3Nkci9Db25maWcuaW4KQEAgLTQzLDQgKzQzLDEwIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9HUl9P
U01PU0RSX1JGU1BBQ0UKIAloZWxwCiAJICBFbmFibGUgUkZTUEFDRSBSZWNlaXZlcnMgc3VwcG9y
dAogCitjb25maWcgQlIyX1BBQ0tBR0VfR1JfT1NNT1NEUl9IQUNLUkYKKwlib29sICJPc21vY29t
IEhBQ0tSRiBzdXBwb3J0IgorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSEFDS1JGCisJaGVscAor
CSAgRW5hYmxlIE9zbW9jb20gSEFDS1JGIHN1cHBvcnQKKwogZW5kaWYKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZ3Itb3Ntb3Nkci9nci1vc21vc2RyLm1rIGIvcGFja2FnZS9nci1vc21vc2RyL2dyLW9z
bW9zZHIubWsKaW5kZXggYjk2YTMyYTIyMS4uNzhjN2ZhMzBkYSAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9nci1vc21vc2RyL2dyLW9zbW9zZHIubWsKKysrIGIvcGFja2FnZS9nci1vc21vc2RyL2dyLW9z
bW9zZHIubWsKQEAgLTU0LDQgKzU0LDExIEBAIGVsc2UKIEdSX09TTU9TRFJfQ09ORl9PUFRTICs9
IC1ERU5BQkxFX1JGU1BBQ0U9T0ZGCiBlbmRpZgogCitpZmVxICgkKEJSMl9QQUNLQUdFX0dSX09T
TU9TRFJfSEFDS1JGKSx5KQorR1JfT1NNT1NEUl9DT05GX09QVFMgKz0gLURFTkFCTEVfSEFDS1JG
PU9OCitHUl9PU01PU0RSX0RFUEVOREVOQ0lFUyArPSBoYWNrcmYKK2Vsc2UKK0dSX09TTU9TRFJf
Q09ORl9PUFRTICs9IC1ERU5BQkxFX0hBQ0tSRj1PRkYKK2VuZGlmCisKICQoZXZhbCAkKGNtYWtl
LXBhY2thZ2UpKQotLSAKMi4zOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qu
b3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9v
dAo=
