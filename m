Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65837C98324
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AD8540574;
	Sun, 27 Sep 2026 10:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jO38HtsJAp6C; Sun, 27 Sep 2026 10:57:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 5AA4140635
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506678;
	b=Rby9KEdrmoW0Bix5T0Oi5RyWAMIOJ9gOvPeSauIQaGkC30VvT+NloO+f8wkvGsQVl4Wd
	 Hupl7BzzeaoFjwuduHqim3LRSdrCwb7pQdoglax0hhp5vVsCfspbBMsST33Ov5vrqQu6n
	 s3ATAwDzHhSPkMS+197Uq9lzXb/ATwzeQBatlalnH0BlifpjJ2bFBVDV2im6Z8qlE8fXv
	 lMvt9vn6AssS0zKLo8q0RODiGMOt9tkz7OHhaT/J1vtun7JlemRuszi9DhDG1wokKTBNj
	 meHdi74QRR4JnH4wOc3VnvX/EEZivqJskUVeyy/78aqTEXXv7cp3qD8xBsBObRu4XjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506678;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	b=lH/TTidmAr12XSChi8cS6XqfD9w4j3Z4V/z9qfe2u6i2kdTMXeZw8I5l32hd1gC9iqjS
	 Je1rcM9OK5y/JC6UB3XIwXffdBN/TFfVJ5ydo4RExZsxQGC0iqhAXCHsCDOSgaAGOoaOx
	 xCZmKvfh5Y13LwLRIavDBM59VC1uBcMEQ/DqjL8qMEEq7LjsVRlB1r9918P9xg9r3i5Jy
	 Eos2XvMXO5FYjMLm/iDb5eC1OFN7hzhTzuL5HvIf2j8bit4clbWhTEdQyJ0GF6hneN3qy
	 mzopLVc5Li1ViIZNVhk4c0BLoy1fUcwQjd3tWmIJEZT9eTEE8Kz9DmKSfwD5XGFlmLA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506678;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=R2btFoX/J3gT/51vNKVbuKJ3mSi9rii5at6HR0L2PDzyr9GNHVSRUfo5HbV6nI+Xq
	 /CdkxGR07wI13tKuuGPS7z+aUwKIHtYYOUyE5jHg21JwZ8aylGURW5VqrUh3uUSSGH
	 kArG4mCIu8V1WN2K89dr6pXKxwb6XO9RhWW5WCTkiXTb7012QiUJ+DszjrbSJ9eX5K
	 rw1CtwnWmVpEFjruvLAZAZl9XSg633RocyHypUib9CxhKpwHAxCTB8CUm9OIzOSBMK
	 FnGbbTdh95W80OBsTNjBQnrTeIVG4RiB73IYpEKWGJoRieof2Gs8M5RfwGyRYdl5PC
	 S6vo3vy0jPgsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5AA4140635;
	Sun, 27 Sep 2026 10:57:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36AEF335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2873160698
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1QtabLotida for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:57:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 74A1B6061D
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506676;
 b=YwvxHzsRSLYnFsEtkTbPTvWXfHDiJHftnhHQbdKaxf7+S8WMAs6Dbp2a+Pk75KWsWus0
 LoWj1l27WOKqCKR/RbHL2xSMKJeK+DOiu6/6E9B25cRYN0PxV5L3bwQGN/FHqOyjPb1gj
 Upew5xzZ1yMtdWYcW9aq2HCwUErIUx3J+Ifk+rEF9mrcDzNFDdTkGdvQxlLqdAq4F+kxM
 nAmaAyOqdxynh8Hmbk+kn1SecU23ExY0H472+f+U0r8uBlS8xIT7AooLrUTgjG0ylE9Rd
 fuAB3h0ONhtoXR4MBFPly3qYdlY1pOsFOSfha2LSRmtDLPW6ILLJK5d98iDQ3bDS8HA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506676;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 b=YpvqcxkePDXv4LIVmFVD9LHNlbpZtbvAKd9Xj4Om3+uhzUYSbsTespIMETyuGLYC7zSu
 QE8KHdPLGx8ZIUG/ghiHl2pcpdg2MImBs2GeGcKOaKIeG4Mr62Dqa/4kcXrzZ37xProWo
 +RZP0SgwzkEK+1ZQhtcrCGGtFDOvHf1ZbwNZSksCanIoPu/ybW7XVe03sILhVimSjzcMX
 a5Nd9Q4QLfnRSoQG0jCjaDi4wGsfJiz7T4o6v3yUysZpTpRaXd3cNOSujJ8gL6R4azn4V
 7lUcVU4+ANH8NAcv94tXD4TpZkjsAqi/tUNlBL647FYOay6bD8sgxRYkj43JnC+DC9w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=p8NiQddm; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=p8NiQddm
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74A1B6061D
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505866;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=p8NiQddmzaG9hZ1h2qfcnJkz2XSqiQxad2L3FvzPRbT/IZAqqMjF6EJuTlZKLCPjj
 CT9A3ItR/nrLbdMFHZ8vrXOVfWSP4MVFyPCLU9mpDLpAEcIhXNU3BQ8YL+2WNw/oSb
 cdLu4ETBiQqnZs2OtSiyTdJMBH1JekjN17AfD+ZZqH16KuVtX7zwKN0b0c3KuJ2E4V
 xs6igXTiE0+itSlGpZfCyBwH2EOog8ebigeu+gvMDhDbFM+mV9EPYr9jtFeic6/mWv
 va4toM/BpCzqVVvQwrLr48mBsfcmJb8gaUbae0knagoP7EtNEvnKzDXU05IMtigGPw
 KpyAvlPmYkSZA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 zRurPc6fxaimwM82ZfyJIL/3f5DSm0TxcAGgI9SUlhuHh4q+ZCmtNOCPS0CVvrscYKfA23dz3nK
 HHSeunEEGM70ZtDnp8MRVCb0QX9SasM5OfyO/tpdqdcb1bPOdPCrR48AvIMYBBlOo4m+HaovPjC
 q4xaXaf6U/VHvYlmZ/Y/ndccrJZgTqrv6A0OiwQOeR1OhpSKeMW8potu1d6+UXSQsdZXdyIcVSz
 89FGNZWfkBNRirBcgaJavKZK8LpcdOrPh2Mmn7o5RGf5cA7xHPnzNv/z9Y4h1W91SVLHE8uoshj
 kSMaAHqd9PT/6SpMo7IdGm86eJjaOH6fpgSD8i2bRkorUqvJoHrQSaI6iEx2e4qS61YZX7Y8NHC
 4IYIwQ7Vlp9LbOUg5Euz+f4YGA1iVtcdmi4YKeWI2fQc3ekp9yFx7JFE6rnkWb5h0VSFPgVBa53
 ExCwlyYVtXQmlyre+3hK3EQ/AoksneOj16r/w/QDDWLzxdRR7PFuGsEvi29VW0r8xIV6re2SKG5
 a3NBNumDt+2VPCq6CFJQ4En0/PDgywD/BMXjQz67LZTFCSyXODMPJqvPHov4fkT7Wkg47FExRJ4
 VJ+0xXTUCgkJ4I0PL6g4P//F+KSnxEy5HZdVPIim4yK7tV9zd6sSH+4iGwRtuILgb8RIl/Xa5iJ
 WSV7VQiByqve3ACQo83ZA
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5562EA4C508A;
 Sun, 27 Sep 2026 12:44:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLd-0000000007a-1N8g;
 Sun, 27 Sep 2026 10:43:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:23 +0200
Message-ID: <20260927104301.1801638-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v6 45/82] package/gloox: Fix build with OpenSSL
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
 .../0001-Fix-build-with-OpenSSL-4.x.patch     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch

diff --git a/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..bae3319115
--- /dev/null
+++ b/package/gloox/0001-Fix-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,43 @@
+From 69c49c945aa3847eb12a995f949d97a2a99642f6 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Wed, 9 Sep 2026 23:27:07 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.x
+
+Upstream: dead
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tlsopensslbase.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/tlsopensslbase.cpp b/src/tlsopensslbase.cpp
+index bfa1fd9..a71ff11 100644
+--- a/src/tlsopensslbase.cpp
++++ b/src/tlsopensslbase.cpp
+@@ -224,12 +224,12 @@ namespace gloox
+   int OpenSSLBase::ASN1Time2UnixTime( ASN1_TIME* time )
+   {
+     struct tm t;
+-    const char* str = reinterpret_cast<const char*>( time->data );
++    const char* str = reinterpret_cast<const char*>( ASN1_STRING_get0_data(time) );
+     size_t i = 0;
+ 
+     memset( &t, 0, sizeof(t) );
+ 
+-    if( time->type == V_ASN1_UTCTIME ) /* two digit year */
++    if( ASN1_STRING_type(time) == V_ASN1_UTCTIME ) /* two digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 10;
+       t.tm_year += ( str[i++] - '0' );
+@@ -237,7 +237,7 @@ namespace gloox
+       if( t.tm_year < 70 )
+         t.tm_year += 100;
+     }
+-    else if( time->type == V_ASN1_GENERALIZEDTIME ) /* four digit year */
++    else if( ASN1_STRING_type(time) == V_ASN1_GENERALIZEDTIME ) /* four digit year */
+     {
+       t.tm_year = ( str[i++] - '0' ) * 1000;
+       t.tm_year += ( str[i++] - '0' ) * 100;
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
