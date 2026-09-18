Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAD9C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CE240B43;
	Fri, 18 Sep 2026 18:52:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yf2DXAqZ_opW; Fri, 18 Sep 2026 18:52:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 07CD140AE3
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757561;
	b=SiMPjfrn9toL+Yz7jk541vEfVzrrekUw9KILJAH/tCHAUXOgcJwjLwMjB95QJdb0VFjZ
	 Y13nJAwSrZOGg6i0lBOKvFCQFlZ9TYZ8lcSeaQuD0eBmi9jNp/86F2m87UQWKrS+W1RQk
	 p8CTrMX29DD1qyCkSkwIiT5wRKUlSF+6WR34ueBOUrXsHDrp7S39vyRArzUT+LHEnJ6Zx
	 VczSikMXl759ZdABs3/olsAcTny5E/2WlsqHCHc264lmYwqRAb67+bfBuIg/NZjvS7aCJ
	 9QpbgKSXbu/TDIyB4+YZSRc3m6HJn9DN0+u1s6AUaNDTfljiOBglXClWkhXFvevlwkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	b=PBYE+cZu3sFWsMRLnprFJjOtRsSa0mGtqYcYU3t/pwlkumt6qzhNvmK6fAi/X+hcFE1p
	 Q/xI7TPanK1P/MRtRY2uLSbzgPkcbB+FyAU4N2V3hUdgEV8j8JcXCM9vRp/VLPI5KiTew
	 oxEupdANJ+2AGQiQirC+VtaIhdUhX/BqqbA8LmhiP+CutmX/GiO95OeRuzlhoISAjKjJa
	 kcYB8/fVq822cmKjFAGQFaDrjfYjggLoZdH6jacSf/6T5MmlcJHYskQYf+SGGYUDxUjQh
	 n4n7AGsYzJesXd1nQcY0l9I7XMbn6lObQPAytnvibPnpNqdlhl5tT6panJFbHzP8akA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=r8l2RSXJ;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757561;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rX7rLikUqTNrHTUilM0wmoKXrnSCG+VJa5PjHaaF3m3U7+WTq48zWDGfc2PGn/vw+
	 N08BfISI7gpaVVRCzCKbTLZuv3DMwwTBvEwf5WGx8A+ILwM/5OW+Xj+M683N/z9e+V
	 DSKEGpldHyVNSh4TC1JxKHrKtPTJdQ+goeFOyZyrsBTmfs7tBFXinYOhVCDliR9qGb
	 +oPF4ckoViB6yyBX8t08Ef6iMesTB5uidO1/KmU89uV4PHdDRMsZArwg1D5VzvSTwM
	 4Jg66EFKcgp1SMNZSIoy5Iq5g9K3yoU+mw0t9E4pEynO86tb+lXTkHPOFt3jYKIvlo
	 DDoZbVAWp4TtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07CD140AE3;
	Fri, 18 Sep 2026 18:52:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB48C237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CF6B40AE3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Turv1MBHjfuX for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:52:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA40240ABD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757559;
 b=qpJNTMQ7O20iI1vnGktBRR+hr0R+2fykiPVa/yk2xTi22DMVQAY1VuCJS/KKm4dhL2+h
 PI9Yb0xvI9eLRgChzLRcxGsiBEnGeXaMPFrVHgqIlFxflHx+CU+UTRrAAFqP+HoUy1pLD
 4aH2vA1krkZQbe6hMh/WJ8CtfV/lOIht71hI7mwzCrBh8pmAj+WOdWEY7I6qninRWCy19
 GTPDc1Dbn4IWNvOG+/R0iSMAxF8ZI1OTOxAXRC/G6kvtosAdKnFqmOp1jaO/JtTCniJVx
 VL+QFteOqzRYDWyiUulWNqZ139/sfUq/4FEdMXDAqiBkchSUdjT+eK2slkv+lYhe6Qw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757559;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 b=fVepNpoKdRgvwWf03zPRTrwKxmMAdxJ8xGC6DnaRkFdvxqYAoCTVbD1qv4tz/SLCMSNj
 LLgf+vrjSmtUioD5kT8aJQfcTwZ+dka0h75NTb0FASvCU4sJpHA53n355nwtk9VKTQoUH
 oYaWyiLwhw8dCoixrdOmx08kmYPMEclY/dabcjMVmIXzcTjqT9bpNT5bos9HF3oWoMANQ
 B4vMmrtB1bNjNnPyN3akV1Y09zYbWntytzSM0uuYryW2qRwSGfOJ92rRVscOdQqDN7wWw
 1ILakyhE0oV/nDy6n4UPiGBGMA87w5TWnnUfkSP83fZR6erS4dqJg67YAzM1+IVs/kw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=r8l2RSXJ; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=r8l2RSXJ
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BA40240ABD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756940;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=r8l2RSXJgi30Jkfsmix3T0XtsHKS1Uk7lyQzrDpZtOLDG3xBlsTEC+uQ6Hyxil3rM
 25BsAOH2gwvZcB1cebNV2V0qPcCFzbmbGp+gR9C/njTGMaO6lbe8avBpiwbdEvNFtC
 m/JuN/MsBWE5IEwdkphseslcg8Sh408VzOVgaT3RFINjBGobQ+I4d70J1EAFAfSRP1
 BtUSvHK2VAhz2TQqmoSvi6GHrVdVXDyLm7nC3fwSqDOExOT0zkR+SpZzl7K37Y6gm+
 s4yv9aVJeANTlCfpYetJqbdkYMOtN+Ys9g38GT/Xs+L1y18uSuywVUWMPZ6qrrG7Ft
 oik/LFmIpru9g==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:EWAz3N+uUv+ElESLN0avpRoHbX+FvlxJ00k1JTr6oKBcx8G4pcZWQ7APJ15JYQ/njulgeBVHULGKmrJOn+QVdFqWtm4gLui+s+2ktwglaw9MzzDcnoXsMj4tPoEzV/9JfLOd9cG/FLDjVUiVUcRIuXtY/AROZ5UxgJTSCaf6NHDri2O6ynZtYYXRnMP6Gd4d1gMjvKCcOouVcAkT4FXvbmCKhMFTKIfoaHWbg+UqKmZb7w3+5yYnPz+3B7sMSqCWCWNWaViVH69kMyJVK8POqPqi6twBm5gNCJpXFhk+Lxle+nv7TvJEl9AB3cWPyjlUOZcf4ig3Y9PHJjLFLrVD34VEfZzY/umEd36D4YDMJaAHIRySxHI9XeF8ODCBh7zW2gnJvm4kEwu679/TIt938gBguppFwiqSNlHZna+INa9P+Ef+tpS7MzA67X4VWPmaynEUxUVMrea/0+kumZa+gMRlUXX7Q6/G5yr6Y260YNWjKX59so0DMRbRTj3eCCgDpoerUWs1ZZEivy32fM1l4tuZJrflIMNHsi0+BXlx3BGQhWpNh42uzIb+gGVhGuC7PJdtwmjkgmD+FdlnDoNnzK6/5unyhki03buA3/CNX0P4U+
 TEXStV/tXbEFTW5Qid51+CZmXioz7uQU/OOva+lHIyUH+D6bAHTPyLTZnB4k2eSnoQqahknWLc
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B696DA4C473B;
 Fri, 18 Sep 2026 20:42:20 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWw-000000007cB-1UCe;
 Fri, 18 Sep 2026 18:41:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:05 +0200
Message-ID: <20260918184140.3631274-44-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 43/77] package/ibrdtnd: Fix build with OpenSSL
 4.0.0
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
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
