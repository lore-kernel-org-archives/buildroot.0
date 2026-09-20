Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D75DC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36CD840E0C;
	Sun, 20 Sep 2026 14:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F9icpZ2UH1pR; Sun, 20 Sep 2026 14:16:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5C13840DF6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913762;
	b=HMqNW8uRH1t+15fRX6hR+zZMyGshSvhW56RqMU9N7KjmKBkQ7yFnaq+BimnOkIrWV0Zv
	 NGuLG/n9ZStdoqpxwEku5pUXE88+aQ8HYOh4QL4McSnGQR7NHY+cPMW5+krGby2RtuXq4
	 R9QhhXTYnT8hj3r2Oxi5NeDrAhji3+h22LRrp5Rorm7DYe8srJZl19khsFhwMbpj2qYsj
	 YdguTeo0+ZPD9U4Npl8eqahRYXMe/uzicQNnNW4ZoHhnDOSdUQvl2NeASs5BMlWV7QV4B
	 ICPIkItQyMqdLkZR7wM/XspqsNIsdOtc4L74lLs7isfYj6bs0UPYCmSE5OL0XJqg7Rw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913762;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	b=oJCjGx+jAFXT6+aN1k4Va+A07eMUAJHfVt3z/BrcvZo5hNyxr/nyINJ3CdbF+Ysrkx4d
	 ljigTA7vrt7ZobiGYwGSiAZvmkPMnlQdd0qeVQ/rh5ahuW6n2Hjm83+GCNAv7UerISJ2D
	 H8BO2be3DZQ2hjw1Lg5sPr1W/Se5yOl7l+16z88l5hirql0VvYo9sBBzInyeO98A/Hn9v
	 IEMA2SVx+2hu9xygRBIKtXRrQgDJ34EEVrqflWxXjLab/pUsaIfeiqUwhHvH+uLXEhwiU
	 7mtqTcvZP1Gl0dcdMxYxjTw0MI+RlnhhgjwmKlIClBk1ThvdWQxyWu0LOqKSyohVJ+Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=QHQyYS0F;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913762;
	bh=tH+EW8kcNsdCyYVkZMejNz4pjeMcTH2xewUmSBd8sAI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qzQMgA+pTvCgBhU7rPJmbY0Gp/PrsxXBx+Z5R8pLazhY7g9P7n7ke+1y0SMrlTLtw
	 v9xljdBLNBGdG3mtHqvzYsCewmGJnTU9lLmGsuj+eOAaPPipCFAaKsqTAL5BOeLpn5
	 r4p5CvJIAIKkiu9dB7zBhcrIcADSx/xfIV/MNazDKKWgAPnETCntWwfCviQsfq1mZc
	 y/7S8z1UGlKL40N5T7IAFyqahqL4nOFZ/9rgDDMZzmaee3utQltVDQR+FAbd4WKPfO
	 MNhWDoNI4iavL9NLxy5E/w7jFDrlkHuWpUZftfYpMyA73d7jpHYCUN9pVTYTSKwVaJ
	 UV89b47Vc6gAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C13840DF6;
	Sun, 20 Sep 2026 14:16:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CDA937A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A33140DF0
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZ7d6xsspvm1 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:15:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4D21E40DF6
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913759;
 b=QjYRa0nNCuqhzIebYqovrrSlpbqypFiFHwggII8MSa68E4ZwuKQC4NurwR8YxxlIks//
 UlgOJuHhNr3pXd/CX0wbeBcLp+BuZvb7blpAlVfV3TKGjRi9pOU0z0xl21ZbahkipTasy
 Ica68mgXVpMq6OraBJW1ZgEsqtvKTMR97V02nkJNZfHkr/WkDsNSqwUyDs2UYwt3rY4FN
 lz6OHZPLDQBGeQfFXhaAA374WtfYC1qcc2IIycYd9fSheeJKlQ7Ofh5dUwhRCieVQjYAj
 GnYuGY9neykO4yPfoziFAoTtf+tEqHmGqB6h6J2bQRgi8plvdcaKmO03JIBZZ8JXNLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913759;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 b=o3HiQyDpID6pZhGcO6tUYnIdbFM36qZAAodfHPLx51ABVzhYGdY+Bz3/HC7h1+a4YXOu
 ZwVesfq9gTptVtsRaGVv5X51DuaZuMaBxRpFNfP5CGues4VbYlrbKMvVSMZx+ytqfZfWB
 oqn+f+IW45AJ5l7Kf+KVesmB0D4pa2s7U3RMtBmBQ66HSghlwd98PrfURzgs+BAu1z8Dy
 sSDvRD6PEEvS9NXsswl3/6BLQcP7yD/aFLaXkJ7ec6Z0OfvKancXHdKYk4rhQE3FAhfpW
 n11ZoAiBfURUAAgZ2o4xHaRZjWwLG2CGpCDCftasu0AIyrmLQaogbq27KpIDLRhpN1g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QHQyYS0F; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QHQyYS0F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D21E40DF6
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913239;
 bh=+4EdXqD6TRYywnK0De2ieQHSmJx+VQOLVyo01PSIuGY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QHQyYS0F9slUOt3cd6OrWZB+bgrhy0uC7tLIAwiGzcPf+9yFA3mN9t4r10+Se2UGu
 3BdDhXM/revAiRVcBMs9wkEaOeygaRM5HdjEymb4xLo4fQaF5dk/eHBP9CctS4niWU
 0P/Yc5gmir3Sq+viNJilqar9oyrfjpHIARzhpCKJq4ZDhZIvHZXhKGBaVtXQTM4VYJ
 oSpEzRi1Rfhf9Zrm5ILk46krniXBwLOGrw/bugNT5Fl4Og/m0ibwyTe/eyXdLWrCoz
 BPVfE9J4jetMNgDd/u/Ht1Q7urp70dVglQMp9R4b/Iq03EtzBhPwMOvzuOWjr4bEqI
 ig1FKYwCkSjHA==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:A6C2ls3nOeaY+sujQ5JdpkVxLw1ODwocAQVfiPTKtprK6Xi+CA7gHKQIL/jw90SAKYycQBMUV5k0NU/7XhgxNbcQE2tlk/8MGHKkXXsAQd8NEBOK3CdkauM12BF00nN+TmNa+a3xxgblpnEUuS2NZ9H6Il5eAGXM1s2Qij8fRS+vsvpyFZkxFCsPPhhjDj+5Cq8h0jMrCL29VmPk3IVK+DZA0Db/+9T2iSSVGEQpkNvF+4UoQIcAtqfJD8c9LZYUz3pv9JOCEOVlZ/eIwTVqGE1IOKqdRpIaxN+HKC2kr9j88cDbZWRTZOPF902LWBuGlLypO1UcaJTPNxakBOQ8Qopek/KT5emb06a8O7Wg3S0H04dLndZ3IYqDzTKlJiKKwl5t+nm5R82n0HutpVKRpoXcKtlf7raN5c0N9mz7S/ecoWu3MaGRWeyn3cX0dwDZTFla46i3AXFgwoPwfIVQSICWWvrYNshe8bosKgHdf9X96UV/gt9ofpYDUgSy43pqPkoEFkf0N7vKs8yloirr3Gz85Z7gBH9PQz9OtQ1Y2e5SP6WAbn0wwRGUjY6u+5n6E5OxcBR8ZTXSySQO29+WDLKedsBne36HogVoSuPmFzB3ZQ
 qlTdV37WXNhauI3sv1sDga0xRvEyqf9jvc97BkUxWfuConTwOZtbf07qbAhXtn4GZksIOd3aaa
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C3E2DA4C487D;
 Sun, 20 Sep 2026 16:07:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBJ-000000002J9-1VeJ;
 Sun, 20 Sep 2026 14:06:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:33 +0200
Message-ID: <20260920140605.3005461-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v3 35/66] package/lftp: Add support for OpenSSL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
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
