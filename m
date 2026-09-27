Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A844C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0872940D94;
	Sun, 27 Sep 2026 10:58:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aqyRoBJEifO5; Sun, 27 Sep 2026 10:58:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2065040D85
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506714;
	b=IkQpokPk/V5MKgt3uKprxkrP5GGYFdpkZ2uajD9LJ8evuweJkHSuw8EU5lHHgQVRYaFo
	 kYqoMzKFV4KGgScykAFPcHXY0VGzJ/BkqBMHG4kT/4BdiVbuYGz0jz6Xd5kggGa32cqbi
	 fO/cTortnKIFcmEqQeqa7gW8P8yYeRrNG8Rqs3eJKFMTTFLC4lt3ciD1ksYc+kw+jTsme
	 gM9/uOsLS7ENjR+0ehVuJZidiZ1J7AZ5DEJTlpTC45UQBDTkDkPn7LwmmMrWRS+p/B/nt
	 PVHR5kVqPU0DIlw+hP0amQ+FPG/CB+9kjmThu/b/SKb3Y+kP4lKwFwykFrgKdtdboJQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506714;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	b=q7NYfjcsmlDBpt0OcLyAkrIhJ1vtFBDHKJ8qvpEKeYagh6IWQIBEzvmEwyODPmoerazZ
	 cRbHLVqUPWn0h7nv55MI22wc7bWK7frlb1Nw0SpNHkcEe8EsE6ufSQsEbfQriZH/Q9svy
	 pBanZ7HxQZZpf/SD3Ko4bmRHbKQ/OhwxyxLDmRsD99CVnLKzbTrqcnCTQYU/trMnVcmcl
	 4Q/ALh/2VOFSY7xYHyaYDN3SNDK3MySThzeMuNavd1RR53Eun7kqj2rjzQZWlPBtYhoNx
	 +rIKQLkeqflu3yC2AJoXoem6oq7ylQv0C8LLDWkTQXCFr4tc/uHO/Z8qVqdc5w649Dw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506714;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=B5jGtfUISuoWlxJpEjTavvNI9IzNg9eXe8Crpk3PPhoe1KPY9FWE6gQ+oLaqECMVQ
	 R24B0k23a4dVnTVI1zBYjmW+XYKqxECJmIni+YMynw3gD9Mc+1dSJQbaIXEsux+uMn
	 /TvrqXMrMkW5/elYiIx6BL5NyWJPicAPTCtg3XN6wRObGZuj+ZshIagotk8qAqGOaS
	 /yFOSlzAM5RLVYQ/cSZ4k7F3N0o4KjkKB6F0582BHkkpDwZwLBIEcsjVeQ2k2I7lWZ
	 Rvx8sejGDGBnxecMkidycw1CTvv9+d+M1PupNAz38MKKH7n7OgL8qIxpgowt1CZVZj
	 z/NkiPVzY1tvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2065040D85;
	Sun, 27 Sep 2026 10:58:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDAA2335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF0A480FB4
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fm8c2fIv0xl3 for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:58:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DDC4A80FAE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506712;
 b=JEXV21QSCfFtRFHzRHOGI20/IvPL25+9/q1rO/bmOKNyrbhq8Aam7Wo7VfXQwSmVcTSg
 C0/FG/sOk9FyBTqpYSkDzCnkPdgzEPgPrKbpCddP4aP4dZFKYQV+//qE7+2s4yKCOwMLm
 uWsC0BMaxcUNIBLfiIQpPe71xjXGFxRWKkvbMVyJdmT4E1dZIv1bIVW8XRVBoWOTDukG2
 978wYSxFiX4WiTw0uu0K8cLlIkphzqP0blIB2s9+0hXVHHQHct6FPN4oeU0Ikb+yKkDX0
 WeVBXExwc6I7Nw6kXd0k/TxSNL0AoV1qwWBEkRqxOUWmWd7dq1arbMxT4PK9En7hKuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506712;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 b=nQ94VjjRsvK+bJk1e6MyzDb4l9SdiWdw8kH351NozjdAd2CV66KRBS2sHaf9vEIXyrbA
 RWPKDDDR6/Eqwwy91Mzxj2Es3Y8XAUsIWfKTTP5qNqZhGn4xbmRvP4KS0tNtZXf8x03+2
 9+4IYSJ0ce6Pct36825S3uoSzfjYBDR11B52ZcdyAWNfwov94t4PNc04utA2ZK3bB8ToW
 1w2pWPV6kMzf0SKYyHSowo3jhehdhEqU9UFQEY+n7oIvYJ07zdKrpn3EETA0H9gNRIcmM
 IwBy/VlqHfpN2HGAej8+T3qykFBH4dltrj7poRyMraJ9QFOVOXTusIRRFMU32cIbI2g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=JwP5c2kN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=JwP5c2kN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DDC4A80FAE
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505867;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=JwP5c2kNKrPLgOTMxEzjZVW4QpjGA1ZUabtyp+Ak55yjK14Hr3zcDX/QrSC4Nf0zs
 NaNxzsfF8Lb9jZh+Sr7ntNNqGjL9rjctasMoSvlwAUich4h0DOlv0qKtyeL5p/uEAk
 +Itkc7mDKnMldtJUHFen63h2gpeNPWpjxeJwAtsvsP6jCLKJ9+kqQIewHcjI1ZYVct
 835pikz5vb+Al7vRPu1q3nbXdDZ5bCHBvNN0WtpjnP+OR7fQiSPjJxSDqGMRBvhxeX
 tyaIIC3aDtAkcY+smM2qJCeAbLWqjOg6DJ+aDH/qb/Ag7wE7QTd/Iqp51n6HaNfQCj
 nbxxAadfmhazQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 GlXVPGhdPUY8O2vcoRgPlySm6kPmrXx/gU+t2/db0NGZSVY0eR+8Ra8HGo2Lcv8wpc0WUng1Jpl
 POTyaxZUUgU8fQYt1GtmCw7+Rv3aVOBa5/6Q5Z6kE354ytt3ii3Lti9Xdxy3j+VIFrdSDHO+jfc
 /jvXnXlPJQFJxS6dK/uDsPMNn3OrdskEzi52z0/n/Btkis3UR/NlEdVX5p0rt+MmVYTfk3XKqJs
 DPf8HdCgFHiwuHHr07h70i24aK8a0HSAEbz4xPpROLfohZDuNYZ4X/IyenQjPc1EYCV6gmN6i0I
 pO8Q1CgUV3tp4MHS9IP3VKCieibfJjFw8wDrRnKrJ5oqLwGYZkN8zHM4z7DGgiiaSc6OU8wVeGT
 fL5XTTFr544hgRf99dxE5O40Vu7sAWnHUp9eYWu7eOfgPt+i5wlChC6X2M/rGyK3Y4sL524qi7c
 A5HAx+rGLuHjm+nts6Dk/q1iCKp5DojF4gmjHJUTngMabfbnH2bSEIO27U2x7nPDLP8kiReLZDC
 uvPyS7trUy+n1/MSEHnP+ieOvarILkWEiqLy7cuh/q3+pKJ455S/jFJ/A85T3RRmz6Cepg63wFG
 oc5rdnd0wTzTY8OYSH5o0jBqTjQrb8bTdkhpzseDSQXQXqaEpoCiAfhEy6VdB4iap8lJtcMCzUU
 Oy9JH3ibOHIzFjR9+AKjb
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 82F1DA4C508E;
 Sun, 27 Sep 2026 12:44:27 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLd-0000000007a-3ON8;
 Sun, 27 Sep 2026 10:43:10 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:26 +0200
Message-ID: <20260927104301.1801638-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 48/82] package/ibrdtnd: Fix build with
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
