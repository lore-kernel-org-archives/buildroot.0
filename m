Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39079C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0453340528;
	Sun, 20 Sep 2026 17:18:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEGjqjceGHiG; Sun, 20 Sep 2026 17:17:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 34BFD40DB8
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924679;
	b=KxGAmX6ipsuO9QSB2971VsmfrLpA6lHmkGJ23uE4MmosatsTkAGXCppuXskUa2rvx2qR
	 SVlcV2ZI3XcpTiArsL1jRpjIKxyCvNm42UQ11vKwkSrHhdJKzMYS0+X6+CbkmCNHEBxXk
	 /s4uiwJMuXpOyOpz5DoAbrNQYX1K6aUZNmQrSPg3sL6Ut+towNESNCDWhOsLdiUM8DJ4/
	 E1iPwpddGY8IzwLHEfnLXCy3ceE62tUyxVUBCdBODLeDleHVwZYA4CikjvcwhWqHqeV1q
	 3WOTjjQzI4+r5rI2jtSvsA26R02yqIjw8iSe1wUzfaPopZVkDuoNvKEvEs3Xv5x+b3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924679;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	b=CGA+C4hXSseibG3RgSUIM35csY5wVSpeSAIUFSTZP3rrZOuyooR4mFO3mO4c+MsI17b2
	 s++lryzLDWK302ZsGnDJaBlKaOILXMgYDs6ow2BkHldG5C5VeSE7H1D4rY2kuc3GD5jgX
	 qViYDj/7IRR+eT2Ja+vfI/HWSqgSrfc+tyYAK/+6W2HSv+hWGROFkJA7jd5j/ac/0aXHL
	 fLzmHwBKJS7z84ksaQLdNoO/rRC7DiikJ+VElKUb91111DwnGqp3YL56ggYGxuwiriNt0
	 XACMQpHTZMZmUBFuulZjO4PIsb/0lpSdtRDk5xEuONcLAUnJ9kvhXu4e1j+h8nyvBmg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=bWUVCY8R;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924679;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IZWtSX3teArR5KC6uCvs26quFAEVGWIZRK+b0ytpOGzT/growa564akiK5NIss86p
	 nsc7XfPs5la2fNV2j84p5tLmQ/IBSlM+uJ8WLrJrJu4vI2HsYO1JSTK8vWDQQPSVB4
	 9ah5JkCMx3hl51OWzKa+Masfc2WMyL8lwmPKMeZ9e8xA65wg4n5hTb3OXrs6/8mJC3
	 XMmedAnOBTyUVxkHV8XhIvG6et32TwsUFCSExhAV4kVs0YxgXMQmNekxOkHMjJITfv
	 ziNf85SCli3NCnJIfgh3RhfdkgZAPCBJjXahJvXmM2r6IodDOeqU5DRufWuNPXJhXO
	 u3Bl31or8l5CQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34BFD40DB8;
	Sun, 20 Sep 2026 17:17:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A376B3FA
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89C0040DB8
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUTyetFlP1ha for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:17:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 817DE40528
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924676;
 b=FOkmgrsQZ8594gGx0muaAOstXgGoQ63KBMZGVSFW8ncdQDq5uU7N2kXW/q+3UadL2AHm
 4Fn2PiJrKXxGd1geRwdzCiivc+7SeMQN8ooVVm9wtNepvjE//lJmJmaWCWxUZ3jM8iZFm
 0QmhzTmeezy5llifCvZahunYWLhOBMYHGuuncVEV3IN7qUu5GhHZ2lmR1Icmf7UQdCX6L
 x2Z8u29CszUDsCr8+MjxzfEINo1UjIrXu95dwv0Yj7EJaoN7eRF46deiVmyQT3t1Ax2hC
 JlCyAQ3rmIYBypGZH9/hYZXZsPn9gN/GxkMxfPYdAID8hVQLoUda1GRm+3LQvW7vxrw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924676;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 b=lLSHj7np5/miJstv7pP3gSN+2xwV6P+b0CDVybftcxmY0MaN4U8ZD3yKA2YyYi8cHEuG
 9AfQAXkPTWXbMnb6WrLq/yVos97ZkbjtCQwoPQCNFSXFo+Z/ttgBD6ciz1Cyna2u0nI4J
 Enq83xAt1IGMSGx8cxHvMYbVptKgkQGYWs+zHDWyBTGdPv7GrjO3hyYQIBogHRdxhwUl3
 ORzCvtfICeYcFzRRNtUaijwKFx7ipT3a+hBu3xpNF7gSk2m1IhXnfAdVcwBI+TOnn4kaV
 VV53oBprXD4Ers3ETVgcaFEy1Q9B5V6zUfft4+/jDFppRLqcvcWxmOf8DS/pbApGhSw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=bWUVCY8R; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=bWUVCY8R
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 817DE40528
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924159;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bWUVCY8RKujZtEUP3HJ8SvuZ9W4n5gp++IYm1A/5P5bKVMmicMdQESYIvVc4INvZ/
 x8Muaq3QqqXlTfIIo3T1q5jDBOd0HPZLZ2Si8Bk9NorJ9sws0Y6umWYnVWE/BeuwZK
 Mef7UruLpq83oPk5K7FsFj2WcWFJ3Db3GFV18TCbkHBqcqTwhwkKmg4jNQMuWBsLig
 R7Gvsw0/oE0N0SMqKcT4mLb6k+jxwieHLCWKmaz+x/8I8scqvwzBR2skdRWGvTzXgo
 dSfQ4AbTnZV+n3agbLg2oi0e/rXqBxCekQGJQMzrx5eQRtC9Zw8f/4wN+ppirzDjAi
 rJsPmzNDbGW4A==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:GtYyIZ6GJm2e0JerqBU+0oeY1rWZoW5WOaYlt75IzHg//0KUOPH5b5TrQi8XThcRZtWTAJSpAt2/owxd3YHoXE4rRIZTQsswwlViuc679U2caCc41wLSm8PqOoHvCWU5soVPEZruJqFDEC0LCn61in7DFEY40GkZ56HiNAeId3YH2IIngVgWITqK9rdAFXVLE68i8GvfOdFaY9Y/clcaGtM5N+I7a+kpUXwmnvN2dfmolc0C+e7fLvS8/X11c6TZkThCHd1s6dzxgEs5rf3iICH/dDxWvdI/9lnwJ+gSnWG2ddXQl4IohlEp+z/HAoYsTUedGIOU19fypl2yl1jCldl/FFBABpbTsuBZK0xdKN2VF0EPjPH6zT4N5m38IoB1g3EmZpUm55lWnIfhYun7K+0URqU6lX8DJPEW1JwafUpix1H9XMdyMI++NiuRaTtEPnFzHJs8QLn6iuCP47WzrRVGj7UiBiJ8dH1su6I5tnrtXVQJ/fCflVxaeBN8C7QVIPycwG6aUYvIIUa8Q7frk/0C+m1C0KENmFKo5QCXmCl7Y5H9MWVGsr/LJmhw/sMslGYosotAIzZtPl09ak7GTIoIdjaCsjb0uwipvIUYo03B7r
 ig1iFrCUeD/Vlg7Szs/MYSP/SBYIWWQRMCYxp3bTVhuveWz5RlcijLLcKptpi0tKdhPMAPKbw=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0FEB7A4C4892;
 Sun, 20 Sep 2026 19:09:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1b-000000000o7-0QMI;
 Sun, 20 Sep 2026 17:08:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:41 +0200
Message-ID: <20260920170815.240247-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 34/67] package/ibrdtnd: Fix build with
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
 ...ateManager.cpp-fix-build-with-OpenSS.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch

diff --git a/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
new file mode 100644
index 0000000000..4755409747
--- /dev/null
+++ b/package/ibrdtnd/0003-SecurityCertificateManager.cpp-fix-build-with-OpenSS.patch
@@ -0,0 +1,41 @@
+From 7dce31ed85b2e2299e63e7704ae2ffa7ce08d1c5 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Tue, 1 Sep 2026 22:44:06 +0200
+Subject: [PATCH] SecurityCertificateManager.cpp: fix build with OpenSSL 4.0.0
+
+https://github.com/openssl/openssl/issues/29117
+
+Upstream: https://github.com/ibrdtn/ibrdtn/pull/287
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/security/SecurityCertificateManager.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/security/SecurityCertificateManager.cpp b/src/security/SecurityCertificateManager.cpp
+index f2bbb017..0093d418 100644
+--- a/src/security/SecurityCertificateManager.cpp
++++ b/src/security/SecurityCertificateManager.cpp
+@@ -146,8 +146,8 @@ namespace dtn
+ 				throw SecurityCertificateException("certificate or common-name is empty");
+ 			}
+ 
+-			X509_NAME *cert_name;
+-			X509_NAME_ENTRY *name_entry;
++			const X509_NAME *cert_name;
++			const X509_NAME_ENTRY *name_entry;
+ 			ASN1_STRING *eid_string;
+ 			int lastpos = -1;
+ 			unsigned char *utf8_eid;
+@@ -188,7 +188,7 @@ namespace dtn
+ 				}
+ 
+ 				/* retrieve the string */
+-				ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
++				const ASN1_STRING *asn1 = X509_NAME_ENTRY_get_data(name_entry);
+ 				if(!asn1){
+ 					IBRCOMMON_LOGGER_TAG(SecurityCertificateManager::TAG, error) << "X509_NAME_ENTRY_get_data returned NULL unexpectedly." << IBRCOMMON_LOGGER_ENDL;
+ 					continue;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
