Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2E0CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 352918117B;
	Tue, 29 Sep 2026 18:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhUefQ-JUT02; Tue, 29 Sep 2026 18:46:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 46B2B8116E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707567;
	b=jlC0oVFjItqnwz2V2cFw3PIzA1AtZ8py8jcVNZaplQolYekofP/2kfLyDKwoldRBQyBT
	 boe4qf434oAJyTUZNZOq8gPxTPZTpqaqhe+15LnbRcoSW349YCf2otvSq0c9K2jp3oSnc
	 LTkqBZ2A3DGJlzCCfk6b4axT2bMJQohtJ1BzghRDDQgv7QGEuv1MJ9B3Wk5G/oVwYDQZE
	 UQTlPm+IgpdXvcAX7myPrMvWqK/v8Kw4nD6d9p9cM7g5a64B3KHQYKvb1SNjnZVR98dKm
	 HxKfQOjMnXemS9VyTzTHYL6AahaeAyxF3p5vGOx3bwSjZd/4sbks587S4u7uS9l29xw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707567;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	b=BtgzSZTiq2Hwgp3FM1afyaUxwZkTK90tQkfUopMaLJMvQFqb4rTSLlJd7aiTBwrECsWF
	 vGMLcOXku+EUh30XcV0Y/1GvNFXZN3Nm4Hjw5HeQbuXgB3emtoZ1Wy/IIuBrGJAxtXEZZ
	 Y1X9IMpVRXg+vPMAy44OcRwud7EeVnU/VzKMS1en9TSg2ZmWw4+xCNqE/RimgOiXiDNrv
	 PD4mIG5bWwQSfyKMzGqp5zoM3WzPm2ylJaG01i3EtOR8tOjgLYMPZAeCBXCdC3KfVXsW9
	 Ss8HjPBlehzGIOnhlbb4fBEFr99fGthj4gPLDBmk4/00DaFTQEHtA7ZdyWOhAIgqAAA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707567;
	bh=g8tVQiuMwG52nIjyxnR4EmoabN4tRkWOFX/HJd4kkgU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nWyNKpKqdgYoRKUI5G2ciU12ie2Gh8rrJHWBNlXOnnt6Jn2sFKOSkHme3gzE0s9F3
	 h+17QVkAsIbA5fxKB2dbi3MgGXdllH/VBDtOSCXszDtYKvQv8iHBei3wCb+HpeQ5ZE
	 ZyhtrauPq+qZNCJDpDXefq4sZM/8Yn2hGI4vEuCtlFLh3aCgbaIT+EugNwa3HCd7xz
	 LJCTBt3y8grc+Kss1QbeU0BbOs0YSYtgVa3awq7Vm423hDDCKqALi85LJLs+QX6dh5
	 saDrsgN7k5MUIGgzy8gCm1/g3HXc23AYg7hVdjA1nmmFGjecAkXUX5BHDfun0PG283
	 8j8yceBfNpyPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46B2B8116E;
	Tue, 29 Sep 2026 18:46:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F9D514C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 358FC406DF
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zm69XEI-jVOw for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:46:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 58ADD4069F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707565;
 b=cVZnF3564TVIErHQrVsOsxJKcLuIe+djx7hf3w8yxHq32imee/3QHwyIqSpqCkemE8dt
 utJyRAzK0fJqspl+hScHNjsjcrW2ucUqa8apqx80gtdQaFBSzFlaNl1ohEIqbODc+RH/N
 L6bhQVKkEIRyUvt7dHE8v47JfPB/9byLTmLyqQcl3eNKSB5EO6eMEvsVEdxjuiCCyk8dk
 QNAIxIIFRWsumQX+QUNywdTcmi3jsrc/GavLlWzWO1yZmSae2J2OfT20jrMr/5phuk71V
 0ZQgwGtKsmSJj3x3NiU75NWRzn5sz7BnbvS5DAQYqhTglh3EaL+DBSE0yuTzxNjCXfQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707565;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 b=jSBXRIvBSUEIz/fIP8v00s90H8JH7e1cTXWF1rb8wTzh15XcTYFnekvwXuJpPS/RYO7O
 TOLhd8jAqtEaGfGeLoueh6DEd0jgI6XovR4ULTTSDCVcvRw66UOqeBGZ+ba4Rz4xb0Dy7
 uX+voLPGe5CYsGKViX0aOszAB1TjubSwsbolb7Mhk8cf+zvA+LH/Zh6OdzUr3SNWucwxQ
 /Nx7k31QOdQNYZt+Ls/QTGgPuLmLiQy8QVfbGwynyQnu9JJWDXk61uYFbHFmrI1oE2ja8
 wtkB0JtrxwIcZ9W+c5W0IleS9/RdX72IcxQNP/OJd7LKb6T1tvIVADprQGzs+15OJJQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jZVflpCT; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jZVflpCT
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 58ADD4069F
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707030;
 bh=bM6cLKun4UwhERBhTrpF8m29RT/h4Gu82Jk0sYFAuTU=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jZVflpCTM1WWTq2VyXSX06NXG3ese+hg6Z1kdKH0L1/T3HSjeI1xyN03tj4zKRDKG
 Y/ekBa+zuAGzyS1bham/IoXmi7RGqbEsaPn9cYnK+wDWasPuuDCmb480Ux7IlRdR6E
 7ZyqFUj6kx4AkZwWxVXELiyO32thOcb+Ranh1x8bIx7eoIa+MU5TkabBxdNTpz61sC
 /1dHDyPdRZM7F0CHJwO+OvqhoY23nWzcAm//J6GIO/nIuoK+d3BGjbDv+aAzs7j9Bb
 0Ug8mLqrQU0vptO2prZDzD9F24mQQuR7lSeNziJFbE3U9YQ8Bu5f3shy6dg6qE/Y6P
 xP0FogzGe6UZQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 0Sx/KjgR68+Zn5UYM5w4xfArPlNZAekouPnhrWwKPTUaFq9pp7zZ0eEcNZ7na71keCy9E6rjf/s
 5aLtRVdrl9V63bI4tMRZ+JbfIdzd8QesGCq8Ki6wakYJ1y8hgGBKb3hLnwoQZYbi2b2AKGEuwIM
 Sj2Vcgf6xm0mMtd/EzUvS+PPPLv/ZoMTzTmGLNKnR7Lqiocf3b1tp3iG3BDI/fVzBPrU0hgeKl/
 pzN1xB50NLStw+/6MICsW6wnDZW8UY/JgE5O/fAp6Cuft2Vogs+7TEwPd/Y0I/QttctkM6sNSIA
 45y52BzuaBSUXKPFnpEgH6c6mf76sxS/pAfYsJ9h5u1YQlQh9wzS21iXjIPEi1Pqq+Ef9C9lBQf
 wkffmLrf4iARsG23bTV2bhNwDGTDNWOI76myxvGiCXfxJMbI2m3fiS2ipvgdthjOFz16r46svpz
 /qoNkmOLYZ6Nne7GhrHomrS7R9EH53sjKXdJEGQX0zKl1kbXVdhd5/BHHc+k5tXHdWOAR4ZaTzW
 6QtMkmnoUd9vbLZW1bXxWiyJTlnrl9CzZWaYQjCTyFC92RxRVWT24cryLW+bRRFDeAb9AlZukqK
 Sf8DNiw=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 160D8A4C51E5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-2z3j
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:38 +0200
Message-ID: <20260929183607.1849293-40-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 39/66] package/ibrdtnd: Fix build with
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
