Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D4AC982DD
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CA060E10;
	Fri, 18 Sep 2026 18:47:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ooxQ8U-fBKpP; Fri, 18 Sep 2026 18:47:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F3ABD60E06
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757233;
	b=OXxF9Pbfn+AqM0fpl0h20DWBfGLGiywq8UmQXq2m4GhZD5ESBYj6qMfqybhzDqwAPMuI
	 IrcW1QL3+bWpyeLEmxpneY4IhJgYraipEdT8mlojQLeDbRpwWOhJVbmC1rsY0Kf/AeYGA
	 hPzih/S3fPreYaeUdaTiW8HCCSiJmpRJsgoW7411y2yRe42CSancb6O47yjb9qfwfmbvT
	 bG3K9dcYYQoeouKcL7rbhr8SFgggb2d1XEOfDMMHQ25pI9ipE8M6wKzBcV/QPq21pPtOt
	 aKoI4VBrK8Dn71XPnbqFiSq5Q4TOSZ915vPtXp1DO6yZVCOkyVtu2EZDaPseCjyJWUg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757233;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	b=XxgwMdu7bfJqUjSsY87HZuwBVmRbdhsrnf84C4/vZ0emkKXo4c534u/Tvdin9NIzuHf0
	 ULAStWNulWqFtaHA0UTVTNk61KnXucAs+u5GudSwvBkovJpNB34O0QiyvvfjGeBS5HUVu
	 VhmezC1y+oSWkQDkIdzvvrTviWkiRvJqYbMYhVFyBRePoy+VQQ/Yhjmy/WTdIYjtYxxiv
	 5w5vOnP4HF86j6D+a5ZFcQF9g2UKXZBFWeOqlXfgI7qeQEmX4PWh9Z4ye25HVrDf4xtwI
	 fQlOK4xQDct65+DdKx6W3sYnTDrr6Oc7Ek8fCS5X2Aig4g+ufXtiyPkBrBvQ6ASL4fg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757233;
	bh=wmEmg7YX6kok3q1pbpCLq82nmdS1hBdrqA61c2dvlUo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LMuY0eXiDdUvfPHIbWbqVHZigzIMdV2K8wHN+gdwiuJVy1mZl13HUnkCdGa4aUsQ5
	 isjnQ/pQERukzHPMdrgV9hmCS8JTeXwPHBhBRUCI20TGHFvnJKra1wUce3aWM4PXFn
	 Mt2Ot55UBHBElSNmT66ZrCdNGE8ON6Yc71TYyKRndEL8L2SyZpoqbJ3EmCnP12oxfc
	 fICbMZwjW99B9uXEsiiLUSUKdfOKUSfLNnm7+9fHEZeJw0kWo+PYoDoGnCh4wN85aC
	 ZzVklLr/z+XvgFEf3IpZyXqakSksSsIbOKC0bqrND/jRPqPt/joQMzKd0wIupJWmoz
	 MJMZyVLhV7u4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3ABD60E06;
	Fri, 18 Sep 2026 18:47:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87186237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 793D74006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m2ZDIXNV-ssR for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:47:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 72CB9400AB
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757230;
 b=a807uWbn1rgi4D8ddKvDYTAu0Hqvf7W1jZvsQM/RkZNDbw0FoyH6afSPfJxGqLNjoXsu
 oY++pP9OO7H1MQc67dfLAQepg48lQp+2gk28Y/Msc2NdhjRh6BUnr19U3RvrGVcYOspFh
 9tQXd6hVnxjNgMqlEDIitCraOBT/k4Hjr8PMBsDU7e/3lEmBMPVVXeECnBOJDbY/Xnrec
 qPT7YIGMrGjTif0G40fdDfLhOWz3BBmwY+4nr3TOfiydCgVFXycDQBp+pKWiHx1L5bxyu
 Y3B7YaCvKfsTBl3911P6txyz/kRLbGmh158THDwY/WVhtLdLR+1G4fXXQ6koCeqgVcg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757230;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 b=LY7Z6SA8oL/TzgEMNvYsqaoIvuhbAY1AxLnvj87POfv13M7WZS5pHYYJ8YJz4ntJR3/4
 EO16PWjUSspkDmCQxPsgRkVS3Fn8bP9/FYwAeN1PA6HPHYt/lVxvrsTwL8xcSxB1mb6lz
 jMwT4b61lb7pkicfdTQLMDhkn+c5iZJCRXCa6CRWaY8uam0G1aT/KKrkRk1sA51n6V9dU
 jNxa9uyV0Mt/C/k+M51JDiE0P2IMWa/Da1OsA0MvOPfkfWAVAQTJwTFGCc9wlPzoTe0uL
 pfB1DMf/y/+rWlXO5dSBtI7DBaaZaFks78pECXn9ebTfyW6cgs1OLs0wjC9G9g1hHDQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=t2ZMeWAG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=t2ZMeWAG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 72CB9400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756927;
 bh=5bSOvAFgQEIp5Vhs2TnSNbtTNJQ9XVCtj1wzIlQ3nd8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=t2ZMeWAGwvlp39+fQphXGMA7F3pkypMorXAOyMQ4kjhCaQQ5PM/4P0atxgVDkJdEg
 nXNqZTlpDqNoz+mOHLRNr8NnI/JsBDEH/s6KDVkssWX0C0SKm8Eb0PRpv0NA2HPccf
 DM3DKIMcR41B6oVR39HMTTUGrkPvAjl0tTcwZz20FLW/O8D4RI/hYrUTtitk7zTLtW
 sd96mimnCEaLOPJfl6XNhkwoFhwzA55CVEygzR/lmrkW+dxiLHq+QzYYy7+FVHdbYG
 yvKAztD2536bGAUmQAxbr1ZFcMKwwdYiGjaIzBvrZRIB1ydrMsKc6J2CCIqP0beLXH
 NXrpRQIV16xDQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:K9pT2uMNtIJgqfU6yl73FiWavQC3QkqLQ4Xf1VtfXcckt6uiQ26YzlPGbNqajq8exlmJM6S+Vj2LIW7ItLFlK25vAjJTv/MjvxjB3srDBnzQ/ssoagTJjAlycj1lLRZ9Nzyp+wayvZ7fv2NQOuPFJG59d7ZRM1ZpKLP4R6OMynzzN0seDKimosaDSw6s+MkGmcBBzrAwAPQWEU3kYwazzUGieFggxzE80cWiO5nw0Ml+gFTPBXA2MPdMGIrXUv/AEDPrptswrP4Cp31isbDwP9430ZK9nkysHp6JZgRwttAA71tyipLaD9uOO85EpJYmbVUewzfCFq4GVIgzfwiStu71ndjs095lDUc51nTGdrNyr+4vWAOOF18HQWclgJzfq27x0Pfi+qwSQn96A7Dfzlk9xQAWnXsmHnKubQ7N97GPM4vX1v1CEnPaRCiWfbLbO1iRKcsSf1fiAXLv/MnagAQfhOSY6TyFLBnll37TMciuAV08mJtnfaTd6/fLW03y6u/BhmQx6A8FWb4dBmSgEbRi77TBPEdLt4EMzObHKzRB/mKz0sWoKmjEsR0wROiEzii+0evfTevC6se2sgFTe4/f1W+zWcslXskcZ6JIXy5QsZ
 merB948IDJI87ngMrWt2dDjIVAn3OOpe7dq0hnnv31PEnb4KlXJUDmKS/N9iJQC31SFqBXTvKY
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4E448A4C4719;
 Fri, 18 Sep 2026 20:42:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX2-000000007cB-3nMN;
 Fri, 18 Sep 2026 18:41:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:38 +0200
Message-ID: <20260918184140.3631274-77-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 76/77] package/znc: Fix build with OpenSSL 4.0.0
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
