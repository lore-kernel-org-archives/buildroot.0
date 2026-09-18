Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CC7C982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76D3B60E64;
	Fri, 18 Sep 2026 18:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xjP6iLNLdf5h; Fri, 18 Sep 2026 18:52:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9FF7660DE5
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757548;
	b=rrXXc4hij1lCimJ/AGgmy01Sid7EH936S5eyfIdQqv0h3UwymZHdO1ry1B6wW6pv0jZE
	 QyRwdfwRnvqnJpXlyuU4YkMvC9fkzZV7PPsL5CCoULL+DrwCpKWa7bwJIiwaU9+4Hqoly
	 HYQhneKaWIvw7wyYBQ/Uzn88hoxhfyAUJSNtaFtFJxFEcC/YmHFr0jc5pFjTUpT+RdP1N
	 wQfRmBqXbDP+BIIVzSPT8OaW8VpuSnpPjLLbj21nFB6KJSivcflHnsxeUzP68VpzBt5Sy
	 3DFznRQIvWj30jzHWMu320AL32pJa+UNwQiOUvi2pxbceBuD/fphR2AP8is0MfD97uQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757548;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	b=FPlfUQxsUzcP70eTTJuFoUMJUZoj/9JEo0iylZTvN7BOLDRbdZOhCSioTU/mVrzlubQn
	 fWl1Gx3gWnmM6xLSu0GtWUhEbVz9Fv4FMwsl06SzaY9/BDDfwl50fRTIL9trBlOFWR2lC
	 rmyA5ea6YbM7oXIyLpx2pEoOu4hLjK8Vsyy8/oQYSqLEoA0InV0nsFEl4SUKECY21Mqut
	 YsL3TtPnZAFyMV1NzAXpim3Nvk4NxtTvytigK2NDNHgucy3123TOMSv67R4HXfIFh9RrG
	 aviR18N/kkJ5LOgBnPbers3pwKaLhMspjkvFDAozyXVWnCX47PG0VwDfN17OioMomGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757548;
	bh=p9L8kF8Nzp3KCRi/r0+rSnV+oz5ZYOsTUT7m57x22uo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PDSPwDYPX6yEst4nf6zRprEoTL5fNajdRRbg+kwJ7vUgGkBwRRBBstnUeL/EhbVFt
	 ep9mPrdLOTWgvSVxs2sDFQSKJZ2iFONrMYiYhQH3pZc2v2VxncKzO4QRncOaaNxSpZ
	 Hb0tyCYT3HbdTM4VeZUKPL+V5h8xSxB2BcRT7ymNDGhsy0uL2rmaLHV1MkQtjLDkYe
	 /+65YAckjbnkEs7VgQ+4KbiMrugSTiKgaEQ8w0fSpM3a+J5kTt3pFvlJNaRm+352BY
	 oDQCa5KE56F3lNrjqulw00Zj8pa9aepDSOESPbOXtGX2QN9KdX2uSRqm3BYIqAofgb
	 DDC+3qCvgwiZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FF7660DE5;
	Fri, 18 Sep 2026 18:52:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 75F1613D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7349340AE3
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Mr8q5oVv5wm for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:52:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A834B40ABD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757546;
 b=cnFP9WgAUZeIyVNpS7eAh8RPknUUOPp4me1sD/GqunFbfoumQtMh6EPL5E+//p856hy6
 Zkqtu0PO4fGxsDqK968zLinHN7jZKvqQoemVslpbHvb0VKTQnnG97d4/kin4W8bPnvnbu
 +t83aCZ5dCgbLKrQ6Km5YG9YVflZ5Sy5+R/EwP1p4+1MeKLq61WnTwLUhcsKY1xeVxSXB
 Acfhwy5C4VjN8MQncUCmfzu4fOOJxoB4VT/ilv2o/NLsQE+LhfBnjbbpLci7CafBL5cIw
 +GJruGMYwds0hBFrch6mfTo2UGl70xNASEPUZo2Znz9ohCf7J4aqZHMJVfo7OOeUZcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757546;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 b=PP9H669qheOod1qSNM+XEOE65QcYPS4vFQsDtOtiLgw72/8PszAKS/SXzoRMAixMpb2X
 DikIIvUcScc4oucz5rI4P+J/aOaW7vhVYd0hmsWKU7vPjDikGmSTCCSCX+9fBNIIi6RN5
 MIT/ZbwnIg8ChcC7nZPmCZbJ8jwlGpIf1RfdMyl1owKU5oJYZctApPho9XZR7qzJXPhgZ
 Qmm+gNfHX75yGeNFwCferSicReHN2zIwhZjijkl2JuXJ7n+Ru7grdUxGGWHn8uI993/Uq
 P6N2lHiuXk/+K37mpWnRYTWA4Glcd1/1tCqIeuu1gI8d+C/PDDiSTkkpB1fKXPQaLAQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=uSOlflBc; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=uSOlflBc
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A834B40ABD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756939;
 bh=dIFh+ZdunTyCcogzTlY9e/HYnSfn0B2UGyOpJK9cMys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=uSOlflBcV0Aiqak3T2OV9e1dTH5pV+TBXx72GPTnf+qSw+Jz5lSnGLjXd7udTA6zf
 AhyrP0oosPeLNNey1Qh2SewTcxykrCL42B2y7MK7YYg7bEobPMngPgLeN0zQ/WHsFe
 O3H9GV1DYimV9ISgkpucR5TC1EP01H49ATq1Ot9/bqfhefPuUD2U2C8tWJ4T2C8mDa
 KMHdNheBFGcmqJ7rajVxaAFS+/sUf+TcmQHTFoVedhd2cXb1nAP930DwVhNf2ImUkO
 2pJu/q9kbj5Uf5425Y7mM4tLxK/YbsEi9WqO2I2edbYOsHOPs3++KitZRigIDoMc0h
 Jzh2sses2jOnQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:BRqf9ylyBCN1NnvLtMkiNPl6vVFiFzhvVmrRLAOT+hVaRKxvyy9Pwj3/NFQNqtlQ+WeHZwJ5pxkgJqgBRNq4HU0c6ANm8M+viT3T1hgfvlQRJkKnPHyLFafsXQ8AiRbR9F52FVi5M66zp6gBQLi/9NmsTUGcRQCozsCi6iqQ91olMEStG5+p/BQf9RZGSBjKa7u0SKhAUSK8np93106+OhlUqPHJN5GDAaO7FXaLv3PRI9IFJ4gAOYWEuxecHeSo4U55WmzoZZOaH7mlLgIF3ga/YNcldrv66lphKogZ58NrFEyxBAqF59JQ9ElFE6Bk246fkRvLOCWbixYHrRoI/oyXQ7jmYU0Wbl+PBMoZlDDV08tvDLib/BM8jSxLhZ46wwf2QNiOOe0qj8oLAEh+TIaJteKcL9gmsEvsQBfDRJRHRZqMGHSNlMHFx6lPaGWxuzNQy2ETQrvxV4euoxAJhgd1aVLZkjf+T8dk0MWCKju7puFnJ1gWSMfQMw0c8pBYenYOldNYqrkWPrB7d4jWhnQG7viLgZ4LnJEBjNNklSAiX0ryC6kgBRl94/aQdH2N/IdwOopaEqcXAGArIRgOdb3pi6g5Qr6FovHoEWTzmOmZIB
 TKy5N0HuHoDVXbpyn2UVp4E0NyG2FF2mMS13pIpakSgN/KZ4XHmo92JCBJeEB4UfGE1j33SV8/
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5F96BA4C4738;
 Fri, 18 Sep 2026 20:42:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dWv-000000007cB-3aYp;
 Fri, 18 Sep 2026 18:41:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:02 +0200
Message-ID: <20260918184140.3631274-41-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 40/77] package/gloox: Fix build with OpenSSL
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
