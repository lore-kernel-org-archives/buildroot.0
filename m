Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876DDC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5435560E48;
	Fri, 18 Sep 2026 18:52:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J011rQSrjPU8; Fri, 18 Sep 2026 18:52:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4ECEC60E52
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757573;
	b=bb/1P75maxd2D6UqCGCI+7D21W5eQx5bzRrAv6V58ZUSTCX50ilyB2bY3oxbyi/vYezx
	 TuejjRIeY7AUrrEHxuwiXrsi8/8THxBmQeY15dDPb+5hUjEzADkSskG1JSOzl2BjbXqN3
	 3tPc32O8YIPnI2WFYihzhz0qeht4Cy+0QVMONzzC+8+bc5qnje4ua+VyxYTRmCXFQ8ZpQ
	 uGpHCIGQ1rK2+s0i4WZ9gtfZL1qxyyGQQXYWIBgvRxx4F5ukjc+kVSYbyMDMuONQ86Tz1
	 3qI/VwL7j4DOoHdl1ZG/EdDsh003xVcNRDChY15MbH624vsDQ2vLqH9DDL0n4hpS7kQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757573;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	b=mM2esNNgtZCYnd+eMn8h9/jf7MudkRQ2beT9/luqFpt8pdM7sUw8Dnn97yZhtlLlPUpC
	 ZEbD6KILxdeZQZoAlYMH3H1MfhavlRy9NkyZQHZkikbOc2JfV2V5HxoN4EgqpPPDwsEI3
	 zBm+QwSRMbvY+rvYY1ziREEtsqsYwMjEvHJ7KD8XPtNWAuaqv+E0XxIZzKWrdz39XxNQ0
	 GbuBgpibRvF2g5mbzFcTmkQsoczQs2Ze5a7U8kUzIWohpdfZWjbruzZ4HgmHNBt2/on1n
	 BKhCYAsqPxfxGigeY84GbfHd6U4hm9GKGt3dBmrfdSo3MY1wIWo/5o/8mQdeQLDZdBg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757573;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pWCPqCSrg5wh+YQ0Oy8CAJJAMPOvZAMfynhT8lxA6Kui0sSXol1dOeilGSUMYR2Q5
	 oqSC3asnvYekuU1gi2uDzhAsdk0dQ5wqQrU3nBvZzRVy+gLCsRTnqCVQLqiTkE1DO8
	 uqvvWAuQ+JdZ/+1b7RMCR8DRgNPyMT5cdPoVqO6awGMA40fbGNcsI2jA8/xxVTvTGC
	 hG0Z7VILPOCsBmWONx1mjIwVqw+2UNo02J7lUM3KyAjqQrY4Vg0Xc18CUJyO3pa3E4
	 WRtZhdPXunMqAeRjip3Kb1B1QcW0hhUpB+Z5YMqiDIlZSB6mnviT/x802VCUpMlmWo
	 NAFnPQfpbKPqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ECEC60E52;
	Fri, 18 Sep 2026 18:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 71A21237
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58907400CE
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2uJPRLJK5Wl for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 5F3B34006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757571;
 b=YID/UYCR2PrpqbP97pXtRIswBNR7h4HPluPhKNMEL18g3xV/y/3mTvLtl4RqpvXksrqn
 4sYcw+F0RJarU0yO6UpFAekDQFRap+gnbW0FXp9O+PuwgNlX+XauWzqYtaaK2g2x+oFN4
 m6CEhj/vgD1la3EPMq3+iJvz/+DcT09Qj3O/wRCbl8yrBzQ6H6LvVfgs7aQWQhcVRstwK
 yZOd99oFcfMaNiUTQ0Ykhp0MxtuX9LmzhEs2V/tIUjzfx9tlb0kL6Amyofdvs8oTEmTzF
 +VLAPe1zysjrxbUwkGnJCxrwGu2bCQax0ptTkWMthmi0zIHLIPN4EtXoUVEJjiCFAKQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757571;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 b=QeqK/0b/7oJukqDmb2Te6MIeB0AvuWdZ+Qd563/CRcPDmKD1BofrVYIIuUWPIxalkXWG
 Zf/sHxk+3I7kvTyNFP1fEOLh6IqyfI+MdwYKT2b9Zp4xl3mYUYpRf3GMJ5QTB+McDUAMx
 I/uOsxCk5fkinu8mBT8UDtm8JPIy/O8ynkKrX1N9Gfolaq/0E26DUcumbgm6H7AHz/vxS
 M9yG5xVMI0PLk4U0y0DfMO0MhsD9JEPXpJ/YVTvHai0KeudygruNuwt1Y4rzrTDBlKV/V
 mJbLVrq0eQ/PeSAjjukWsLFZl1jbNoZvpLh13iUT1hxexT7IH5K7395VxyIP2Jmt8+g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=DZ0s1l8Q; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=DZ0s1l8Q
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F3B34006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756941;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DZ0s1l8Qgm3osq+VTcpMdMCEN+PpXaVFQBh1YAIpvQMm2mHkChC7PsmRBESRQ3hmc
 70jYTp8Ilz8tAmoYbDIGmv3rzRSxjwYm9zjylsQkyhWn6NvJK8q9UzWpuSe/tQjdGz
 JYB7mqHXlVSht9/guRylZRNb1Fn6qeBgKQaiS10SoP5CQPMCk1/PI9BN9w4uv6nnBP
 Tybf5+GtiuQkrvWoHtdoy9RCH0cSnDKROTZZ4zOPRapzc4N0nwnHwWJZqDkvc2UCLd
 B+shCpN9lmu8Jg1ilKb3rfhIGIyy1QIXM05+jkaWPuVwGG5iNuTl57L3aV597vz+cF
 d23SRekn7iAUA==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:Sfnk/2NdOtf0jgJYJNk2q3JnggRuBL4yrkHs8X0UM5UYXDfnkUTiK3zKaSU8V1cXM2OrgAePZmSm4msQTX52BMi6dRKlV2d0xXUBGXXYdqh+H35nUKXk1p7wyQeh6e6Ld8fA7A0/pxXA9YWYG8ryq28/gxjxB2GcJLt8i9sV/9QdrIhofUIAdjEpQNpW/PqRbn168bfWfr4Fj5vSC4rbBmlC4Rglfh6p8fWCI/EbWJw4gFlFzfnqGJ7MZOOxcRKwY3uUiZQ097lVMcFb7/8pEkUQyRbnR8mygTpiMaH/lhsGnB9K3VMFUgPfjoV3mgtvskUWBOUt6QUDfpJzwSfgLkeEG5FVIoR7AaWfMFClGy9wagGGaOgjUuu8LpdrvEy+2qjeTlPh4NZj/oDgf6JH/kZf02Am9eF8FZb1v8H9rp8arSzswzldZF55B40Enn1ijfy0PNAXC8bi6viDDUNV8ZRRtBq8x0YGlDXQGaoiyqQODhy8c8rBVBi+xzT0czH+XawrbHMLERArNC+LI8+/7uYu/iORp8Qjo3IvIivXdlcDA7pvAUNxWTpRN4Z9vawDNCAt1mNXpjJkccEpY04Ld78q1FeIJSZAwuuCNnyfZS7Qld
 U5GdkAwBqXggKb99ziK5dTkQnlbNG6PtFGsWQur+tVokVPELErIFaS5uIhcUNs4CULW+7CPVh+
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3280AA4C473C;
 Fri, 18 Sep 2026 20:42:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWw-000000007cB-1uM0;
 Fri, 18 Sep 2026 18:41:50 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:06 +0200
Message-ID: <20260918184140.3631274-45-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 44/77] package/lftp: Add support for OpenSSL
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
 .../0002-allow-build-with-OpenSSL-4.x.patch   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/lftp/0002-allow-build-with-OpenSSL-4.x.patch

diff --git a/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch b/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..258d08fb2d
--- /dev/null
+++ b/package/lftp/0002-allow-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,56 @@
+From e5d53bcb31b1f3792c6ab321e20d566b9a4ff0a5 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 21 Mar 2026 03:56:46 +0000
+Subject: [PATCH] allow build with OpenSSL 4.x
+
+Upstream: https://github.com/lavv17/lftp/commit/e5d53bcb31b1f3792c6ab321e20d566b9a4ff0a5
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/lftp_ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index f53edf24..49328f74 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -1022,8 +1022,8 @@ const char *lftp_ssl_openssl::strerror()
+ int lftp_ssl_openssl::verify_crl(X509_STORE_CTX *ctx)
+ {
+     X509_OBJECT *obj=0;
+-    X509_NAME *subject=0;
+-    X509_NAME *issuer=0;
++    const X509_NAME *subject=0;
++    const X509_NAME *issuer=0;
+     X509 *xs=0;
+     X509_CRL *crl=0;
+     X509_REVOKED *revoked=0;
+@@ -1436,7 +1436,7 @@ void lftp_ssl_openssl::check_certificate()
+     unsigned char *nulstr = (unsigned char *)"";
+     unsigned char *peer_CN = nulstr;
+ 
+-    X509_NAME *name = X509_get_subject_name(server_cert) ;
++    const X509_NAME *name = X509_get_subject_name(server_cert) ;
+     if(name)
+       while((j = X509_NAME_get_index_by_NID(name, NID_commonName, i))>=0)
+         i=j;
+@@ -1446,7 +1446,7 @@ void lftp_ssl_openssl::check_certificate()
+        UTF8 etc. */
+ 
+     if(i>=0) {
+-      ASN1_STRING *tmp = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(name,i));
++      const ASN1_STRING *tmp = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(name,i));
+ 
+       /* In OpenSSL 0.9.7d and earlier, ASN1_STRING_to_UTF8 fails if the input
+          is already UTF-8 encoded. We check for this case and copy the raw
+@@ -1522,8 +1522,8 @@ int lftp_ssl_openssl::verify_callback(int ok,X509_STORE_CTX *ctx)
+    if(cert!=prev_cert)
+    {
+       int depth          = X509_STORE_CTX_get_error_depth(ctx);
+-      X509_NAME *subject = X509_get_subject_name(cert);
+-      X509_NAME *issuer  = X509_get_issuer_name(cert);
++      const X509_NAME *subject = X509_get_subject_name(cert);
++      const X509_NAME *issuer  = X509_get_issuer_name(cert);
+       char *subject_line = X509_NAME_oneline(subject, NULL, 0);
+       char *issuer_line  = X509_NAME_oneline(issuer, NULL, 0);
+       Log::global->Format(3,"Certificate depth: %d; subject: %s; issuer: %s\n",
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
