Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 662CDC001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20E2281FDA;
	Tue, 25 Jul 2023 13:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20E2281FDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cRKdtXFVhm_y; Tue, 25 Jul 2023 13:53:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E2ED81FE4;
	Tue, 25 Jul 2023 13:53:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E2ED81FE4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 01C981BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF5F24016F
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF5F24016F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pm_7reXbDIq0 for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:25 +0000 (UTC)
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 92E924052B
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92E924052B
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso54821085e9.2
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293083; x=1690897883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=433ipGJd90DJFbBO7ph+GWH+g1unRrUytqUJDam1rmA=;
 b=OMSdrwZgdUsoC5C0vESKG87POuKC91s26lSJq1I4bHdERIpkhfX9A2OspD4eiR13uB
 BK4VpgIEZ3xQ9EI9i7QE6+5NnCMg7dg+vhXhf8db1y9VY6R92BJF+otoXwzn1vxw7W/9
 VGWybwj1M7YVzenyLiQhMBb27A9Gdq6c43lbXpiDaQQWzb00shy5GPT581twd19wQl2W
 lyA1b7iPCsYBDxGqCyKnp+JmjaDbgAP64oEErJwErAQVHNZeor7nziZUrKDM0ztKXpPY
 Yov2YlCD0g7rb1kKFkwG5kKCn7Lemg9MszqMOHM6q1cWyL+mWfZ9q/6eYyU0yyECzxt7
 RGdA==
X-Gm-Message-State: ABy/qLbEwUpolcw4sNP5K0wSWVqKNooCOqH2z8beMRQdxS4eu62vVjYc
 cQUNqTRZ0mqok4YMkn4VFENeFrCQmnmV7e8MDH8=
X-Google-Smtp-Source: APBJJlFUMNb67kn7lR8Lo4yCoabPwQO8QjLaidvK+7K+rBjmTMTTwyICu+SoUDAUlj8+tqv5YDzLiw==
X-Received: by 2002:a5d:4210:0:b0:317:5eb8:b1b7 with SMTP id
 n16-20020a5d4210000000b003175eb8b1b7mr5094209wrq.12.1690293083528; 
 Tue, 25 Jul 2023 06:51:23 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:23 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:51:04 +0200
Message-Id: <20230725135105.536310-10-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293083; x=1690897883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=433ipGJd90DJFbBO7ph+GWH+g1unRrUytqUJDam1rmA=;
 b=kAHgwbOZC4J2eN1W+6WCY6m+Lma7/wUjICuuROGvg6rSNxSNX2wdPfuJPzHKgljtTg
 wPh1SB1a2cak8JAjfRL0YB9rAa3C72/JmMFcX7vNlLPPdt4pT5wfrHDaojne2P90Q0Ne
 sqQPGnDqDliDfBmJYgUm7A1+fF++x+zC6TFhnwirG+1h+BAmPWt9NbaSB1VxoX399Wbv
 GxEqpHOa/VBlK0fgxxIknANbj8lrAIuq9ILDU5LajvXQ7WyMm2U+TZIyb30efhjHn4Ol
 mrm25L4CT8XPCatAkuUngJhV0/epyXQhQ5pOlqELctx62ELmplmO9XSExFzimfYUL4j6
 1Xzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=kAHgwbOZ
Subject: [Buildroot] [PATCH 9/9] package/mesa3d: add experimental RustiCL
 support
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpUbyBidWlsZCBSdXN0
aWNsIHlvdSBuZWVkIHRvIHNhdGlzZnkgdGhlIGZvbGxvd2luZyBidWlsZCBkZXBlbmRlbmNpZXM6
CgogICAgcnVzdGMKICAgIHJ1c3RmbXQgKGhpZ2hseSByZWNvbW1lbmRlZCwgYnV0IG9ubHkgcmVx
dWlyZWQgZm9yIENJIGJ1aWxkcyBvciB3aGVuIGF1dGhvcmluZyBwYXRjaGVzKQogICAgYmluZGdl
bgogICAgTExWTSBidWlsdCB3aXRoIGxpYmNsYyBhbmQgLURMTFZNX0VOQUJMRV9EVU1QPU9OLgog
ICAgU1BJUlYtVG9vbHMKICAgIFNQSVJWLUxMVk0tVHJhbnNsYXRvciBmb3IgYSBsaWJMTFZNU1BJ
UlZMaWIuc28gbWF0Y2hpbmcgeW91ciB2ZXJzaW9uIG9mIExMVk0sIGkuZS4gaWYgeW914oCZcmUg
dXNpbmcgTExWTSAxNSAobGliTExWTS5zby4xNSksIHRoZW4geW91IG5lZWQgYSBsaWJMTFZNU1BJ
UlZMaWIuc28uMTUuCgpTZWU6Cmh0dHBzOi8vZG9jcy5tZXNhM2Qub3JnL3J1c3RpY2wuaHRtbAoK
U2luY2UgcnVzdGljbCBpcyBhbiBpbXBsZW1lbnRhdGlvbiBvZiBPcGVuQ0wsIG1ha2UgaXQgYSBw
cm92aWRlciBvZgpPcGVuQ0wuCgpXZSBuZWVkIHRvIHVzZSBvcGVuY2wtaWNkLWxvYWRlciBpbiBv
cmRlciB0byBiZSBhYmxlIHRvIGNhcHR1cmUgQVBJCmNhbGxzIGFuZCBmb3J3YXJkIHRoZW0gdG8g
dGhlIGNvcnJlY3QgaW1wbGVtZW50YXRpb24gb2YgT3BlbkNMIChSdXN0aUNMCmluIHRoaXMgY2Fz
ZSkKCm9wZW5jbC1pY2QtbG9hZGVyIG5lZWRzIHRvIGJlIGluc3RhbGxlZCBpbiB0aGUgdG9vbGNo
YWluJ3Mgc3lzcm9vdAphcyB3ZWxsIHRvIGJlIGFibGUgdG8gY29tcGlsZSBwYWNrYWdlcyBkZXBl
bmRpbmcgb24gbGlib3BlbmNsIHNpbmNlCm90aGVyd2lzZSB0aGVyZSdzIG9ubHkgZm9yIGV4YW1w
bGUgbGliUnVzdGlPcGVuQ0wuc28gYW5kIG5vCmxpYk9wZW5DTC5zbwoKU2lnbmVkLW9mZi1ieTog
Um9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+ClNpZ25lZC1vZmYtYnk6IFNlYmFz
dGlhbiBXZXllciA8c2ViYXN0aWFuLndleWVyQHNtaWxlLmZyPgotLS0KIHBhY2thZ2UvbWVzYTNk
L0NvbmZpZy5pbiB8IDE5ICsrKysrKysrKysrKysrKysrKy0KIHBhY2thZ2UvbWVzYTNkL21lc2Ez
ZC5tayB8IDIwICsrKysrKysrKysrKysrKysrKystCiAyIGZpbGVzIGNoYW5nZWQsIDM3IGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNhM2QvQ29u
ZmlnLmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCmluZGV4IGM3ZWUyYThkYjAuLjRjNzI1
NzA5ZDEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L21lc2EzZC9Db25maWcuaW4KQEAgLTU2LDYgKzU2LDIzIEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9N
RVNBM0RfT1BFTkNMCiAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkNMQwogCXNlbGVjdCBCUjJfUEFD
S0FHRV9IQVNfTElCT1BFTkNMCiAKKyMgbGliY2xjIGRlcGVuZGVuY2llcyBhcmUgc2F0aXNmaWVk
IGJ5CisjIEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNCitjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNE
X1JVU1RJQ0wKKwlib29sICJSdXN0aUNMIChPcGVuQ0wpIHN1cHBvcnQiCisJZGVwZW5kcyBvbiBC
UjJfUEFDS0FHRV9NRVNBM0RfTExWTQorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfSE9TVF9SVVNU
Q19UQVJHRVRfQVJDSF9TVVBQT1JUUworCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTUVTQTNEX0dB
TExJVU1fRFJJVkVSX1BBTkZST1NUCisJc2VsZWN0IEJSMl9QQUNLQUdFX0hPU1RfUlVTVEMKKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfTExWTV9SVFRJCisJc2VsZWN0IEJSMl9QQUNLQUdFX0NMQU5HCisJ
c2VsZWN0IEJSMl9QQUNLQUdFX0xMVk1fRFVNUAorCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJDTEMK
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfU1BJUlZfVE9PTFMKKwlzZWxlY3QgQlIyX1BBQ0tBR0VfU1BJ
UlZfTExWTV9UUkFOU0xBVE9SCisJc2VsZWN0IEJSMl9QQUNLQUdFX0hBU19MSUJPUEVOQ0wKKwlz
ZWxlY3QgQlIyX1BBQ0tBR0VfT1BFTkNMX0lDRF9MT0FERVIKKwogIyBpbmZvcm0gdGhlIC5tayBm
aWxlIG9mIGdhbGxpdW0sIGRyaSwgZHJpMyBvciB2dWxrYW4gZHJpdmVyIHNlbGVjdGlvbgogY29u
ZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzCiAJYm9vbApAQCAtMzg3LDcgKzQwNCw3IEBAIGNv
bmZpZyBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJHTEVTCiAJZGVmYXVsdCAibWVzYTNkIiBpZiBC
UjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VTICYmICFCUjJfUEFDS0FHRV9MSUJHTFZORAogCiBj
b25maWcgQlIyX1BBQ0tBR0VfUFJPVklERVNfTElCT1BFTkNMCi0JZGVmYXVsdCAibWVzYTNkIiBp
ZiBCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkNMCisJZGVmYXVsdCAibWVzYTNkIiBpZiBCUjJfUEFD
S0FHRV9NRVNBM0RfT1BFTkNMIHx8IEJSMl9QQUNLQUdFX01FU0EzRF9SVVNUSUNMCiAKIGVuZGlm
ICMgQlIyX1BBQ0tBR0VfTUVTQTNECiAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2Ez
ZC5tayBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawppbmRleCA2ZmE1YzFjNjg2Li4zYzdkOTE5
YmI3IDEwMDY0NAotLS0gYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKKysrIGIvcGFja2FnZS9t
ZXNhM2QvbWVzYTNkLm1rCkBAIC01OCwxNiArNTgsMzQgQEAgZWxzZQogTUVTQTNEX0NPTkZfT1BU
UyArPSAtRGxsdm09ZGlzYWJsZWQKIGVuZGlmCiAKLSMgRGlzYWJsZSBvcGVuY2wtaWNkOiBPcGVu
Q0wgbGliIHdpbGwgYmUgbmFtZWQgbGliT3BlbkNMIGluc3RlYWQgb2YKICMgbGliTWVzYU9wZW5D
TCBhbmQgQ0wgaGVhZGVycyBhcmUgaW5zdGFsbGVkCiBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0Ez
RF9PUEVOQ0wpLHkpCiBNRVNBM0RfUFJPVklERVMgKz0gbGlib3BlbmNsCiBNRVNBM0RfREVQRU5E
RU5DSUVTICs9IGNsYW5nIGxpYmNsYworaWZlcSAoJChCUjJfUEFDS0FHRV9PUEVOQ0xfSUNEX0xP
QURFUikseSkKK01FU0EzRF9DT05GX09QVFMgKz0gLURnYWxsaXVtLW9wZW5jbD1pY2QKK01FU0Ez
RF9ERVBFTkRFTkNJRVMgKz0gIG9wZW5jbC1pY2QtbG9hZGVyCisjIERpc2FibGUgb3BlbmNsLWlj
ZDogT3BlbkNMIGxpYiB3aWxsIGJlIG5hbWVkIGxpYk9wZW5DTCBpbnN0ZWFkIG9mCitlbHNlCiBN
RVNBM0RfQ09ORl9PUFRTICs9IC1EZ2FsbGl1bS1vcGVuY2w9c3RhbmRhbG9uZQorZW5kaWYKIGVs
c2UKIE1FU0EzRF9DT05GX09QVFMgKz0gLURnYWxsaXVtLW9wZW5jbD1kaXNhYmxlZAogZW5kaWYK
IAorIyAtRHJ1c3Rfc3RkPTIwMjE6IGtub3duIG1lc29uIGJ1ZyAoaHR0cHM6Ly9naXRodWIuY29t
L21lc29uYnVpbGQvbWVzb24vaXNzdWVzLzEwNjY0KQorIyAgQnkgZGVmYXVsdCBkZXZpY2VzIGFy
ZSBkaXNhYmxlZCBpbiBydXN0aWNsLiBJZiB5b3Ugd2FudCB0byBlbmFibGUgYSBkZXZpY2UsCisj
ICB5b3UgbmVlZCB0byBzZXQgdGhlIGVudmlyb25tZW50IHZhcmlhYmxlIFJVU1RJQ0xfRU5BQkxF
IHRvIHRoZSBkcml2ZXIgeW91CisjICBhcmUgdXNpbmcKKyMgIHJlZjogaHR0cHM6Ly9kb2NzLm1l
c2EzZC5vcmcvZW52dmFycy5odG1sI2VudnZhci1SVVNUSUNMX0VOQUJMRQoraWZlcSAoJChCUjJf
UEFDS0FHRV9NRVNBM0RfUlVTVElDTCkseSkKK01FU0EzRF9QUk9WSURFUyArPSBsaWJvcGVuY2wK
K01FU0EzRF9ERVBFTkRFTkNJRVMgKz0gaG9zdC1ydXN0YyBob3N0LXJ1c3QtYmluZGdlbiBjbGFu
ZyBsaWJjbGMgb3BlbmNsLWljZC1sb2FkZXIgc3BpcnYtdG9vbHMgc3BpcnYtbGx2bS10cmFuc2xh
dG9yCitNRVNBM0RfQ09ORl9PUFRTICs9IC1EZ2FsbGl1bS1ydXN0aWNsPXRydWUgLURydXN0X3N0
ZD0yMDIxCitlbHNlCitNRVNBM0RfQ09ORl9PUFRTICs9IC1EZ2FsbGl1bS1ydXN0aWNsPWZhbHNl
CitlbmRpZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9ORUVEU19FTEZVVElMUykseSkK
IE1FU0EzRF9ERVBFTkRFTkNJRVMgKz0gZWxmdXRpbHMKIGVuZGlmCi0tIAoyLjM0LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
