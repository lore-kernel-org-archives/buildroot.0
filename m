Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F2A6C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE53D4100B;
	Sun, 20 Sep 2026 17:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4afGhsT4IN7; Sun, 20 Sep 2026 17:20:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 092A240FD6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924850;
	b=b4u3BBu1TRt4Z3WvGKKMzkq+mD7azA9r43aPJhRjsiUeR6FicT6Z6ZXs/gtFU4hQKWd+
	 SYJl59rILBpNCJsnzk0h4uf8KkjuXqhCHUZUWSHOuq7bSEX8snnez4c9R1v7dCkkOyM9f
	 Mo3zqHkM8ojwdBZXInCmgL6Oq+sq3WtDPAKRjnvKhD01V82Suo0Fk5yJvjZLY5+j3hHSC
	 vZCvl7GGkzkjkrttwzAz7AkppBZlcTSBZn344Ezl54D885dXjm6lje4+tw6Vdy1mZotEK
	 lLBvQGfUAC3EetlKCPcXiH2ZtIKMgBYAUbiQcsGP2/GZNmU5o03cLRIlXuZ3rlo/dcQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924850;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	b=LMmD4eQQ2eyPIPNF9TN+DNT/4S9+gimFv4kNCZbxzf1VLDswZ9ik1lrdKkeM5TW0wOTZ
	 FgoylBVKcQGqZdprF8OAjPbfkJn0E/onOG6mJsYN9kCMq7mz8+5vF5VptYbdW1ROfaIw/
	 yiTRPo94zKHtnI/k5/GfoEcNoYevTe70VaxvB+HqkS4ym4zDsgG8qo5Wx0U9yJzZTK+r8
	 oR7G13eGLNHi/nxcADLMooN4roq2AtGUECIWW9KTBMQQmhF7JPcv938e/8qFmsW0/CtNg
	 brPqc5jPxfOLEyfwhoYkUf04l4NRmtbfNx1wkd/gBxCILVgb6WkG8iPyTKMmDyil5lQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924850;
	bh=qiQKStrA40G4SArxLaN/JzI51Ew3tfCx7j06ahMPDKM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mGROa9cPKSQNhWasNmKspBaHoIWBlzo/r9eiMj8g2cjGVqdbAkP59A4ipD6nbMTWy
	 3Kq/yRqEj+9C5n2pAP798cX/MPFgphsvYGxi3rKJ8hlHWvMhArjTs6yNvMGHLlHwSf
	 a6X8QKoj36IfPb512kDedBbufl238mMLHqUuCkchKwqS7l2rLPNBmEZnBnCqmVk1zv
	 EBJcLP+Xqmt+G3+R0IpQ03UPO4lB/vrv12lgb/uhTxmtWoje2ZR7FG275JZd7v1khy
	 9wKpHGT1GVmf6RXmz0/eE93wbE5QAzTbW6E4r6stFrFn48k12NmKUSMKxWtQKbHsHw
	 ElaHBgsmVMRGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092A240FD6;
	Sun, 20 Sep 2026 17:20:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D83C83FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEB174007E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4EnVpMmZ_pE for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:20:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9D1DA40022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924848;
 b=XbZuen2EECa0I9eijrPkR0zOBdnG1Y2RopmBDDjqifIKfDB1yNCdq/ZO29kKzxXiC8CX
 6x0AAOmCJcrxLwY1Ll/jeEZ9rjSHOnZf6Z4zxRviM49PvVINj81GlO6JrB1pHJeC6Xmp9
 0rmTFPCNtO+cXC8hITGV02AVPsNW/ziXN7+3ca9Qw//3Sl5sEQPyQlQ85XRkxp++c8Hv/
 K4VWIF4zInNVmxI486wis6LwaubIZtcf2v0HSXVh9MuvD+3xL0rlxKduVmacXElNCgI4d
 c8CkCgBIIFY84eSJD4LPZysJ1GxK9DNiTRzkATY1ZYVq9GO80tb8Dxa3OJRhBcET0uQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924848;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 b=UE5H4XANGsw9RUJByCaFeUn0eLVPkF1cblXncoJ8ymmg+gXUDbcBYMyKBRkcSNrLBOI9
 2hWw/50oXAdnZz7NHmr9qj3sCSE7Iv8O0MjrfuCy5vY1+UlCtwy4rBSG6VwAxcpNTdvRZ
 Yw66TUY+x4LDr4/I5XiX3hirgALqu2qlumiL3JPfDKOfEvAtafS8iyTGW5p07h8KeTqps
 FRBe+8f3pL9BfKccHUuKdp+3TAQsaVr3Xl2Yx+py2akusCtdxRHi8a8NNZbc7I5+UCEEj
 9ux7kIN09kBq1cAcytkJTdkKUiqEU5IrV5rpzh627pTnsQx+Gp0RFKUYUqmP0gCa6cw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=BThGOyVX; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=BThGOyVX
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D1DA40022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924165;
 bh=UZryQBhtYyydy4yNnfN5L/lXDnvcBV14QpvNULqux90=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BThGOyVXyGF6obL7AXgF0O9/DTCrb+rN4jjLo4g6hw1lEwDEpYM76Ay+MXiFePM3T
 Kn+i2+X2Y2XX2qtun6x8cXdHjNkIzXk3OS+jD4O799gICRB5la1Kww4OhNgrTzniBK
 EgQxsdwX2Ls8gEdi16Q2700Bof5jqIpYUYfRkB++hVqPPc/eT1kmKHyuxP0ge2h1TY
 lGbMBALYyFHQTXInRZap8LHEqq0mwBtGQQidkfeGv2nPYMYuRYSumC8Z3BPFzAVB+E
 +3TsPQENBPDEU70W6xIRomFpqy+hB4Wt/19Gu5tVYeGPV3ZKHqeuUIyscy6x8HTjWB
 FiLMZg4ScCCEA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:uJ6kqr5ChFSh/WFwYIOXzrzn3kSnFKEKMxQnvH0AQW/9X7RqAfrBRH8Na9lMnmkDu3iznGdZlMano1AMbO5RjGTswYYjtanHyomd5Z8te5LOQRWaK6BEe/tktfL3ANOPYBaRgOzfKYb7NkyOqPeiXn3uc200gC2yKrXZMQFIEuVfg7HBJMFmiYTrma4+tsVB3Ddj8nXLNGZ52GlS5/EZ7oenS8L/8mI9Jyd0/s+J+d/W+7Y17zG77wJw33VfHxPdQYe8GWaCaR4F2h+aEiAHvwIbtnEE7lnBzdBDo/OROPZ264nrEdzu30yZl1AYtE1DwFBae4yXiOdqTT4lyRmdd2ApuEaq5BhZN4+em5OVqLMd5jhX5nhC3alL5C6k6LLvyBdV10+y6Xfm83y95s6ilxbSmc1pNsGBQYZssiCCpMuQwm2MbdO0MPkAdV4K8j0UKgQ2EqOF5pfi+TLQF9UWlkxOhG6Y0ffuCoY3seoF+jna6bjVnfMPQXUcT9Nbt0DYM4pB9tDl6rOE2kzNPnrdyuGAgNT5/pZC6Im9+aN7tlHdNJx0s4MG6vOQxFmKAzRqXfaGisDmg+ZmUyx+3iDYkt2Gs1iUy0URoxDvez+xzOuKqN
 IbJdlQOBsofZ8/J+NH8ECgYpanBC88k/KmIy2GRIt51SQ6LiIvFiWVebs7iLS22c+b0LUPHv8=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A253AA4C48A2;
 Sun, 20 Sep 2026 19:09:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1d-000000000o7-3hVF;
 Sun, 20 Sep 2026 17:08:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:55 +0200
Message-ID: <20260920170815.240247-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v5 48/67] package/pkcs11-helper: Add support for
 OpenSSL 4.0.0
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...1-crypto-openssl-use-ASN1_TIME_to_tm.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch

diff --git a/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
new file mode 100644
index 0000000000..d8149330e1
--- /dev/null
+++ b/package/pkcs11-helper/0001-crypto-openssl-use-ASN1_TIME_to_tm.patch
@@ -0,0 +1,48 @@
+From 59cc22b8d65669da599f1c435fdfe35d4e07db0e Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Thu, 4 Jun 2026 12:49:44 +0200
+Subject: [PATCH] crypto-openssl: use ASN1_TIME_to_tm
+
+Introduced in openssl-1.1.1 and is required for openssl-4.
+
+Upstream: https://github.com/OpenSC/pkcs11-helper/commit/59cc22b8d65669da599f1c435fdfe35d4e07db0e
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/_pkcs11h-crypto-openssl.c | 16 +++++-----------
+ 1 files change, 5 insertions(+), 11 deletions(-)
+
+diff --git a/lib/_pkcs11h-crypto-openssl.c b/lib/_pkcs11h-crypto-openssl.c
+index 05af65e..aa58722 100644
+--- a/lib/_pkcs11h-crypto-openssl.c
++++ b/lib/_pkcs11h-crypto-openssl.c
+@@ -148,21 +148,15 @@ __pkcs11h_crypto_openssl_certificate_get_expiration (
+ 		notBefore != NULL &&
+ 		notAfter != NULL &&
+ 		X509_cmp_current_time (notBefore) <= 0 &&
+-		X509_cmp_current_time (notAfter) >= 0 &&
+-		notAfter->length >= 12
++		X509_cmp_current_time (notAfter) >= 0
+ 	) {
+ 		struct tm tm1;
+ 
+ 		memset (&tm1, 0, sizeof (tm1));
+-		tm1.tm_year = (notAfter->data[ 0] - '0') * 10 + (notAfter->data[ 1] - '0') + 100;
+-		tm1.tm_mon  = (notAfter->data[ 2] - '0') * 10 + (notAfter->data[ 3] - '0') - 1;
+-		tm1.tm_mday = (notAfter->data[ 4] - '0') * 10 + (notAfter->data[ 5] - '0');
+-		tm1.tm_hour = (notAfter->data[ 6] - '0') * 10 + (notAfter->data[ 7] - '0');
+-		tm1.tm_min  = (notAfter->data[ 8] - '0') * 10 + (notAfter->data[ 9] - '0');
+-		tm1.tm_sec  = (notAfter->data[10] - '0') * 10 + (notAfter->data[11] - '0');
+-
+-		*expiration = mktime (&tm1);
+-		*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		if (ASN1_TIME_to_tm (notAfter, &tm1)) {
++			*expiration = mktime (&tm1);
++			*expiration += (int)(mktime (localtime (expiration)) - mktime (gmtime (expiration)));
++		}
+ 	}
+ 
+ cleanup:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
