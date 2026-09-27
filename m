Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5D5C9833E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89AC04050A;
	Sun, 27 Sep 2026 10:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OPEe96LYyd4g; Sun, 27 Sep 2026 10:50:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9D66B408C4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506219;
	b=WCyPUHDGsndM2l/gQrfvYYLrcJ0aV7XcHSpp52kOh74EChgI6TBcTgkDLU5CSnb/79wO
	 c0X5RrOInKGzDbAGGeNVg60mt9bKU89jucOeJi0xSxlPIS7wbXgIMp8a7RgIjlFluSha1
	 TXyndwaYTnnhvWiXn7xZb9bauLWggWqux8wN9/OJhUB2rPVXvx5E6XD83zvlwatgzmXYg
	 Vu88AdmbZn8utkzxJ06omQw+S8OW8QJSV95puuwNKsLPAT4M58+nPnYhYwwF2mEbqUX5P
	 mE7mgf3qq4PlfygGyEghDOACAlCioNv5aFgGL4U3JnlhRAdQK81bTkcX+J+GheqZ9Ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506219;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	b=WnL0OtW08UBEHKr1pu1vuH78YSwbBFCnkwdq9ETF90xvTcWCyE2498Aa8sV9pg1oaChX
	 5IUpL0BjTin5fvfFHrdilWChEsHKf/TY91C4oU4C7ETlVfuIz6evQcd9srWWQCBreJ9qX
	 uMcMWDOsUjy/SA/jCC9n1kpKNnP8KD6FBw/FRSQDB299AZAsgxSqlOMNCjXHDsdzISoco
	 pccprWSvSjNZpgXtmI9TqQpzrULEWthgNTXAm8BTMLmMU5Wcg2/Y//sE6suE81kvi5DIH
	 jqba3PDG3EsKJLEdnxvH7cBLCDu4fv5POYR6+TCqiQ2oUZPJvZ6drBbKCShfbpMyQwQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="KGNp/sZF";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506219;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=G5CAkQybq+iXJ3MEtwc0Gb76wcy4UH+hT0UoFCMihhTX08cHPgPyZVoSBx814Aot0
	 vkbo8EkCc/Met9Yozlyl/+jDmFTkWbwpLBo6IViK4AxTvIwmQTezJQuwoiMXOp0kis
	 rXgBRdTVxgDWeRHvpoy4RhHCpOF08xUCWgToQUpjKlagImBDYqAUhZG/3EUrgFssKz
	 SQomreqLlCn6wxMx1LumcFgsl5R0Bc16NjBXNXkan57AfNSs6enn+7umovA6RhfOkO
	 bi3yW/00I99E+peJoVmZYqTb4U/2CmXbWAY/qTQAViAetadCnAJ4AQzf7sWhU7Iuj0
	 LYJQPvL9vNEZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D66B408C4;
	Sun, 27 Sep 2026 10:50:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D9A2D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5EF6B4050A
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uTnd-oyKYVPc for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6119C40944
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506216;
 b=JHRI/z5Ergpo3g4XR5utPec4X+YDEUO6nPYTAwDNA+QD6E+aBjOceNxJ++S6gdEKpSHm
 8WG5BgxCkFB/s8sF3wDIJm56M7Ls+1RBhcp2WB4XGxXdHbZlXimksGTV2+yQISNbWHZmK
 M/mv2MMAeTzZJ1KWhm/OytrVK3hmqU+kNAgWOZLGhPXycmNdx+HY3GWhKoeifbbU938iY
 n0Y3A047dCBfpOpP7N0N206fYuSL0JkDwNKYc86kDnlXYk3ZwO9DlIzcwsB+mVI9RQPkJ
 I9ZgVqIJl9FxjNF8LIsW6XoYvqSl6bdbKU8GxcUIJsdRN7x7hVNAMz3VT48EL0DTV5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506216;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 b=nwo+hjyl6SIqCSIB9WsJr8Q1G3+gVvO1G199fIas1RQd4iswoojporiy2mqGtw6MzI5g
 PDXnEGJ4sposcq4tUYnug+QBHSW+mZtUGb3xoRfovlm7R0PIgUzs27aPcoto4Jo2BCtsN
 +p98qLkq7Vx2kOcBvElBHnKa/xS52c9/nrgrGK1vFF+pwlpibndN+oONsrxCoEf0CSQPF
 pfhudkpMfIL4WcHykQpEybAZ1DMs5kMGvJTQIRjwnkvPorozIK1Pbg0j5VspVb0awyiH2
 rx3DzqNnM8niMPN/hhI8UGW2qErT/ltcio1GaV8weoQZPurx35acR2wWhalp2u3e3vg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="KGNp/sZF"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=KGNp/sZF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6119C40944
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505844;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KGNp/sZFLvx5tgvIUKMOg598pwf6MF9mVCXZU6AmgfVQlY6g5GEcXuSCRJi+FIwI4
 cJ9+eFFmdeiLr70x6PKBenq17YUBtGQy39NzBDQsHYUxiagy5I33Bp45G2fHKdvmce
 WFytuTezqFYn3q1dXNqnr5WstIRZ6Ang8hkJf0oSJtsFiYnBBWkWG9T4XllYh+21UI
 DH83ALWtxK8Oof0sEloPbWmAhCtnDrbtFTt8fsWFHt7FIyp5dzMknmoyL0xO2tBgL+
 zPNOHvbbluFYUMLEew3iay3RTk6CRMlsc8Jzl4A+pt0xQBAGMZzBjrlkoXCqJaBNLl
 pkBXx7F/SFvwQ==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 X7l1vPIf0SdxPDbexAedGDlThFgAnKh2/qnfFEjXE+Fuld9q2E+zm2GXaFjQkyGA6MOq1npB0Zu
 mHQuZ5s0WYwJRGANs6+gzNCDnHd9G3toXdrM9Z8oV0eBDn1iKjtQwByrwc0WkKRci3EmXKmyEQr
 XPQ5m8b0JdgoAxpCxIO+DTViYLpjWRtVsOZyOVryH3oDpM8QLZPd2WGrU8Lsq5iwahSz3EL5MEx
 Kza4bQ+TIF3tw4CyImRqtGc7HJwLQdt4h1s+6NHcnBeoJGMUVBWbd9sNU9RMRrkULB4PDbD9Uf/
 Rdh6gWA/oCato1XTU6hEsfdnRSKyjANWWal+XEqRAD5Hr/wIK8rmSoXzR8flo2w8eCh15sEkjZP
 J+jf/pebjZP5XBh4C5m5hJwzhjtUdI3wXLNRcKyj6ayOsTE9ClfiHGqtqLO+1+Q9gH0VqtR/PFU
 yAWvtMVMYvxitm19o7XTD+92AA2cXMjhWq7IJkxBU4FrPzKZDXHkdLdCH1b7qIkQ208/tQBAYTN
 gWwxCCZu6HYvjrbSuJMEJNUdRQ0rFlYRyLFUcrP90ljkkaaDYxyoBv06i/OSJmselnfo8MMHqcB
 0ZCRhZErp9ot0iCUwi5b1GRlNBVhd+DhLvRC2FzGzv9ptdm1/M3vyNJ46oCE+nLZU2SAaN4061v
 7Kg2gzbJTCRr1Vi+8z+UZ
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EFE02A4C4F97;
 Sun, 27 Sep 2026 12:44:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLk-0000000007a-0z26;
 Sun, 27 Sep 2026 10:43:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:59 +0200
Message-ID: <20260927104301.1801638-82-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 81/82] package/znc: Fix build with OpenSSL
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
 ...-Fix-build-error-with-OpenSSL-4-2024.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch

diff --git a/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch b/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
new file mode 100644
index 0000000000..1dc7eb28fb
--- /dev/null
+++ b/package/znc/0001-Fix-build-error-with-OpenSSL-4-2024.patch
@@ -0,0 +1,57 @@
+From 94bcf919e1163564e637df8d437585bc7b55e7aa Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <rks1986@gmail.com>
+Date: Mon, 29 Jun 2026 20:03:27 +0200
+Subject: [PATCH] Fix build error with OpenSSL 4 (#2024)
+
+More details here https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1138356
+
+Upstream: https://github.com/znc/znc/commit/94bcf919e1163564e637df8d437585bc7b55e7aa
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/SSLVerifyHost.cpp | 4 ++--
+ src/Utils.cpp         | 5 ++++-
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/SSLVerifyHost.cpp b/src/SSLVerifyHost.cpp
+index ccc20898..99b215bc 100644
+--- a/src/SSLVerifyHost.cpp
++++ b/src/SSLVerifyHost.cpp
+@@ -306,8 +306,8 @@ typedef enum {
+ static HostnameValidationResult matches_common_name(const char* hostname,
+                                                     const X509* server_cert) {
+     int common_name_loc = -1;
+-    X509_NAME_ENTRY* common_name_entry = nullptr;
+-    ASN1_STRING* common_name_asn1 = nullptr;
++    const X509_NAME_ENTRY* common_name_entry = nullptr;
++    const ASN1_STRING* common_name_asn1 = nullptr;
+     CONST_ASN1_STRING_DATA char* common_name_str = nullptr;
+ 
+     // Find the position of the CN field in the Subject field of the certificate
+diff --git a/src/Utils.cpp b/src/Utils.cpp
+index ed2c9c83..744f61d1 100644
+--- a/src/Utils.cpp
++++ b/src/Utils.cpp
+@@ -129,7 +129,8 @@ void CUtils::GenerateCert(FILE* pOut) {
+     sEmailAddr += "@";
+     sEmailAddr += sHostName;
+ 
+-    X509_NAME* pName = X509_get_subject_name(pCert.get());
++    X509_NAME* pName = X509_NAME_new();
++    if (!pName) return;
+     X509_NAME_add_entry_by_txt(pName, "OU", MBSTRING_ASC,
+                                (unsigned char*)pLogName, -1, -1, 0);
+     X509_NAME_add_entry_by_txt(pName, "CN", MBSTRING_ASC,
+@@ -137,7 +138,9 @@ void CUtils::GenerateCert(FILE* pOut) {
+     X509_NAME_add_entry_by_txt(pName, "emailAddress", MBSTRING_ASC,
+                                (unsigned char*)sEmailAddr.c_str(), -1, -1, 0);
+ 
++    X509_set_subject_name(pCert.get(), pName);
+     X509_set_issuer_name(pCert.get(), pName);
++    X509_NAME_free(pName);
+ 
+     if (!X509_sign(pCert.get(), pKey.get(), EVP_sha256())) return;
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
