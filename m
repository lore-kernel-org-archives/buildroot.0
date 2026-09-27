Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0316FC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F4540B3F;
	Sun, 27 Sep 2026 10:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s5r1KQkvM6UV; Sun, 27 Sep 2026 10:55:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DECFB40B1A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506531;
	b=UMEIELbc2DqiV0M3VMk+vmHbrSAngaHG8VHnqibyavJBwZvPqdZ2Jau2KsY3e6zYWqh0
	 va+Xor7ILav1x3CUT3/rsCrsRLakrO6nEwEa28KjJqvpwm+/LWIR17uFT/ZHeJ6k+kiws
	 SEh2D8zc5wH1dD3EG7T1UKthVJWJewoRaH1Usc7kq1qkAvbIP71y5tD3n7aypsgmY1i/a
	 z9joLB6YmzSEjZulGXuDgGsvmVbsWsSzMtrdcsF8Ot9qEBpRumJ0SdHk/6gMT2EDnOwqK
	 EFmOU6n5Yho5GOrh9MAZpmTdAN0z1G0HSQPZGXRR9iDqv0s+7WVmwYlO6BjKA1oszIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506531;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	b=YiyVz3vBsSz1LC+q+n5kHJbAqCvwZgXYdqgIxGhPH3egMsWqo7D8JJ9wNXCz+d3wuoBz
	 A/UxZVjXLeivaHvYAr+VjIuQJA/qgvc26j8w/be0nRapC7QQ89TK6u36T1U2fz12m9sBY
	 2JF01ORtPG3SLFnDdDYVKbrO2lH/S47N3UwctfiuEwuyK69lHzbC1MgXGnJaej46LJTEv
	 GSxbWgu/+YWbIGuM0Mcz52pZAkX6ypoQYjR4WX8LJ/0tX4VdA1jv7d+PTTJN372vBfUMq
	 gQOTAtrTMx1mZg+9TkHSL5RYtjyMIBQonM+tB98dJ24hzAO8hhBQZuOc5ievXvLytJA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506531;
	bh=LpyLtAY2fSQgR0lWnwio1zrifcCR4YIeA/TJKBomggA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Hb2PcCLF25jdVhJ4d/OK270l4PrT+FGBdfrle+lorr8oFqcQk1Q0PqToQLgn8Vk9i
	 UvYYn1dilkd4ZYBwQw03s91I9tDdxKEVV9If2OZ1TMgMQKvYjApzbUGHsybcixKrhD
	 e6wF1fD+1kZsOiT5J1u7MdBP4nWAXpAUaHIttRqmEVqmuOYEwTuE4rKRW9bcCh1nrA
	 +I7lhTNnfVwsrWHs7GDT7EiJUB0235kMbKn47bnBLFVcaVscFl0i95d34d0Fi8r5EF
	 bp9SeXWkBRnbl+8kJ5e8+fQ/TRpgsdNJjKsOhLiikuHlCoUg26xSHKkP3R5cL1RutP
	 4+YPhWsYMIEOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DECFB40B1A;
	Sun, 27 Sep 2026 10:55:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F6C5335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30B9B606C0
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O46Ec7cGwx-r for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:55:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 09DEE606BD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506529;
 b=HNAvr2DV8UL2toVp/aipaTaGZSzLDcQJ9nyND4qlYAwduXH/unbDXnbIUnHUHkXWDfmA
 h844bBU3sB8kl775J4qKBCUhaKC0XMB/UnAXW3BD5dhfnTkmW6CuXzo2tuq4+fyaM9SQT
 PfJRBnFoHdNupOALEPXYXpzlH5VyEwOzEm2Z1uirvP7+FzJjGYBO4AXMTy/i55IknS39d
 iloBAouxiNBn73jNzVWAu7pcPy8IYj9EJwKmmw9HtHnTsW3sRW/5LxLvDr8AHqO25wuJa
 BeaWGoA8dUi4lGXxzCtEdawSjc/5adZerBdSlvPEDGfOSecEd8Ig7tW1BV3FCDF/pBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506529;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 b=C3TH420HqzJABLtlY5nT9qEKDzjsN/MUBVqz0Gq6F+FeS0ZxygycQ9xucozjF8YVpVbX
 V7tzYetsTatd5lWzH9X9RzPicOcNVa+Peo9ulQz1lJFJUJD9H8Vxzwmh1PEs3kqKHCv5Z
 JElEBdmiFpMTAZ0Tzq/3mmGpNu6Gq2WWIoynEkMcgYDvjbYAAisVzoNWtmcMxSmhEN8Rw
 zSr7iFjb7qIcguoY3vOKjnfsS9wC0ZkVHLT29WOl+iepjOG1C1iB9mWnmc6MkWOZmnsy7
 XmpzlVi4UJ6LIwt9pKX+gaJpG+BEm16Bkj0sTlwmfNJUjCNfr3cA3pMOTkP+2h8IogQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=OAbNukOO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=OAbNukOO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09DEE606BD
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505859;
 bh=qTHGGacAtr2t20XSONANlL5M2PMzNzbczNnmQfl6x9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OAbNukOO8oepocla7fv7SaJU9VN3oGH3k1GGRHapqAsf5KAzWs7Xu3N3TbdKU65Bv
 flUh7orbsUk2hVIXlXOm61L8z3P2E4iiYRXd7HaWXBBIDNu31L8L2RtRSt6/y5KxvG
 vSbVbUQY5OudqDIOwqlDbujtEnV6X6xvElxyk0/nJZPDMUL2K83hc8cE4yglzwwgP3
 YQdrDWHntrfzPFFnKCJU49Fz26H5mtzkVwR3V43ZrinuHl3clZOAr+claGLJwzf8vU
 EBIBe9sowcjLYV/Fwb/lFhKtU6ApeNxhqQobyTgIFiqOx2Bkur725edKtvnfSRpiL2
 S+zIEBgpRxGmQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 0R8NXefEH17z9Ng0odmn1CJHnQyyZGbY2dDTmSjAAf+itjWjTiSfO6Q2qrb1+HhbiVDrBX++74E
 if75HdksdMV3c8NWGIPmYkNgn2AswCc9dm10Lks/0d7z7zyFx8K1BZlW/EiDa0OxTLQwhHnyLgM
 pw99L7zOLp5MbAJwy+2kzqwJS12da9+33IWiPQNP3mCoern6KYOYTSnVBt3+eOKoqc3gRiW9Uis
 ssPPERNJJwjApf865r5BE8AD2DTHvFAwsUCvd3Hu9A5KsYPlbrdz4TQHn9RiKtSOPbgVePyWFSk
 2GhBCmNwQ67ha4WLqXL2tAWONg29g27GAl8Wx4FCCrny16MxjZtc8kVsKoEMBLOyj+NWYYLGgKF
 TjX0Non/j23XervSwTXvN8SDvr2m6psRKWw8jChqul2V7HnWDKz6DuXpXWVsw4bzh2tRyM4cfit
 9PwP9neVoSwYia5GYli74t6zJBSJw25hJh5Onqoieq3ctwYFeY1ad61T8raezhOLLgZpZGXo3G4
 AA3qFcXjHpeFgOj6jGlOkFwbpZWBwPs5jqCuNRiTmEGM5MKab1if4iEEwcmPerDuVL7CekFZHeD
 0TRAVwvEXbWXKyakdH091MANK36ym8KVIm5RYKPitkC4iU3JIOUiMbOjMWhcTc/Fyc1wnSrIZRz
 4GMESB87sc7MXj78mKs5A
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6F041A4C4FE2;
 Sun, 27 Sep 2026 12:44:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLb-0000000007a-3zT6;
 Sun, 27 Sep 2026 10:43:08 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:10 +0200
Message-ID: <20260927104301.1801638-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 32/82] package/daq3: bump version to 3.0.27
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/snort3/libdaq/blob/v3.0.27/ChangeLog.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/daq3/daq3.hash | 2 +-
 package/daq3/daq3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/daq3/daq3.hash b/package/daq3/daq3.hash
index 524c0eb868..a81ae595b4 100644
--- a/package/daq3/daq3.hash
+++ b/package/daq3/daq3.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  651e38a2737d179a224bcb01d8a06300667708ee614d19a8b411fdd212cc035d  daq3-3.0.25.tar.gz
+sha256  03fac3da27e3230a7d26262f2480cd65a409cee3596c6758a7f9eacb7f24601c  daq3-3.0.27.tar.gz
 
 # Hash for license files:
 sha256  64601289158eddad72cb4de72652f9e64dc886942c910b38ddee93ba13b0db26  COPYING
diff --git a/package/daq3/daq3.mk b/package/daq3/daq3.mk
index ec3f4ba670..43139ee065 100644
--- a/package/daq3/daq3.mk
+++ b/package/daq3/daq3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DAQ3_VERSION = 3.0.25
+DAQ3_VERSION = 3.0.27
 DAQ3_SITE = $(call github,snort3,libdaq,v$(DAQ3_VERSION))
 DAQ3_LICENSE = GPL-2.0
 DAQ3_LICENSE_FILES = COPYING LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
