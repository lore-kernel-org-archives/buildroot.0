Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E628C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A2640CB5;
	Fri, 18 Sep 2026 18:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3Bkm_vt4fMC; Fri, 18 Sep 2026 18:46:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 79E9940CA0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757170;
	b=ng+xumNBiJzvFC2/Rzl6h5WeuP/7roGtWIePtUnFC1NszaHxxXleCJcI2NU34QbZiDyk
	 DLSbIz/8rG3rCDO//ufTv/je1e3iE2T3U7+PgiLZyns8EJLG9FjAL7wFGuB1QSQCZubAh
	 9rlNlKgp9leJlA0oUe3CP4rCYZiFIji9kr+wpZkDsOJ3Ry5UGAnXbseO/KT2Yh2Q6JIco
	 0Yih8TUPRRiIWfe2Z+BKa7Xl9IgL71kWZrr3cCoLQp7WxTge1EaYFgXceOedEDxwz1B8e
	 7ETsEaAJF/0gOE82g7HAfVQghurElEbfB9oNY8QsP8b9ySHfQaEu0Ty6TuwOZ0HJ9OQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757170;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	b=UUMlvvKEFfbOdIRfCHP97AVXInIcpg2UI4FYZpByfr3t8/8zxI3Afbv30NBMt6liRlrY
	 ycBhL0PnDwBC6sQiZ7yMFirb4adQwVfHpQauB9W8LV9h/q90cg+ViGq2lwM918n1O3zX7
	 p8i3oUm76ZfT7LKQfhaekO+y6qcX7o758rI6OUhiuGL1q/LQQWC7QUVUQ54yWDVuHsPLN
	 sMwrikvwWkNo6yPnWoM5y07dYBHDZl9xXy+eHBGfm0BHs9J7gBRyQovEncHbPll5IPrno
	 4mgmNmKd5dfyT4lFkLJ7kfo6woMHQGQG44acBQAjuTc5Mc7i8AHLh82HNrR9qB/Auvg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757170;
	bh=235skMEz307yiyV9CXz+xd/ZQkAz+x4P3WQCD2hRQuM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TyMGO98Hp1cUpn2tkI6M05o8hj9SAakKzgGWelUfKeQ4z57BVfg5fbBsDVs3YZ0pG
	 0zx23YDVUHLEJkeKRIcQje7D6+TB7aggMAHoxJNGHmx0V7dw2UwE+4gYAGhWHit8u2
	 jYPoZrkxs/ow3cxWPZYaMOQ5aeTOm9VzgegVtEtT1KIQwopxSO7Fpp4qvcE/RmFeqq
	 EQMT9xk1/OlMsZuI8FoOqOfhhvBW2hOv5BQ25NOpdjNDv8QpcV2tEUsPRGMJFB8UpB
	 dF8dSRgnkVq38TIhKLL/NyuJUegiDC4+yfHadm4+w+Z9CM37T/ZWb43T1SGkxWBRw2
	 uo6Gy2FufXD0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E9940CA0;
	Fri, 18 Sep 2026 18:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90B8F13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76D21400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U9QAqGf4SWVK for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:46:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 657F64006F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757168;
 b=bvREvss92JEpXypfLcxaSCOMgfPz18hBZm1k+EVgwzwtzuV9iq6ucVIuOabbrgVrujLZ
 ksUvntI8jy2DD2VJ4qDirTzKi+Fc1jitpCn/8RkmlE2aG5OoEwjU6P3kBk9Yc3NFIUH/Z
 g4PIIKRKznkicob59lBiBy0H2de6ztDFdXVmfE+fkJHPNw0R7Pn8jEEZopQk6vyxnM4g/
 UdPAb934LJ3PWQUG0zNo6XjTOowcT7RAUoWSLe1w+GiKpB5xYpy6G12JX9oQFOp7mpsD9
 8m21aZbZpLP3VM+VffFwXZ2//3aAnnKIbn7MtyJSMMKaOrimUpvN31qsUn1xRj3PKcw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757168;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 b=YeNqFxuA55+u7Dl+hka1pjHF85+8oeORlQI/kR8Wg6wXzzudTdR6uADlJtiW2wvvqPXT
 VuAdnZ8ljrtlbuPPhXmPXWL+UVy465cPJXYDQat3gzRbral8iG2N63HfckxsLPary2ZAC
 DzAVPneZGkEODb+LCoW2ldaw8mmLofIUzm+JSX0k1Ok9QFUI2fWqP4vslwmsWXe1/CZ5F
 o2GyZ/ILexQvZTT4Rhzo/TgYzvuRpggur+FYofWx8puW0+cojTn3U6EhRr7KYs+NqhP+/
 hBPdzIV38JgBWS9jpTrSqj/XmKRnmy3YYh/b9/j0ipwLEBa/di7ekEG13UJc/ERUAeQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=m3JG6d8r; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=m3JG6d8r
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 657F64006F
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756924;
 bh=3aKZb4LJYzzut3vuILtIB9xtnqzSTwUpR3VdLJSINBs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=m3JG6d8rxoVqbSu733LnXYgypwYgXdMfzZ2+UJgA4RTHU/hUYS2XlwgNFeqRR1s9f
 d4w2RqWBrzhn8/RGoAnpnr7QdSiBLi5haFnLLTQFJHmgwP5I6QUo84swf8sJnhOL7m
 UW3jST3luGglPhtRzgaYTPCepbt5QTX4Yasa0yFVqN39esQhhsVOeTEUgPrKc67EhZ
 z+afow2vEOiL2SegbsTnuBaqcXHmpKWWzTzf+kI82hjkFzF7YQ7KORYXtKD2TxMoMF
 fzwpRfgV2xa4pXL3S0PJFY0beB61MTktk11y4uxRg7+JLBAy0y6SjUzAmPKtBRx3Gs
 PwllbIxhCrvmw==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:X4YOsALoxmHTO2BFuTxAIjsfnVSh5WIj2ZJdijxnTRjZp9vgL3Bc5IbWaHhw9o1Gk+LfeavKwWohUxwHvFNtGILTVqabhZTW6kbu4zpe5e21DaLR8yKFE00yijEu75U+U54qz2GFwv0EpeH+synS9xzRTSFyN/TVAUgJ2fueNOLdarVcBjNsH4AW1EgLFfgPc24z8Ua7/4c8yu+X+6QxrmALKC4ABo4ZUHI1ZSiNbLRhirfbO7s8uQeJRpQS16X3dd9f7fnKiM7gvUfA4nTBAm1a1y2EzAcb6/Lu4AwjKCU0hJwnQHrm7AY+veNdeHhtwp+zpQOJxhY4y/w/OccSuL4c0vxbrePVESwwMPeSBD4m0hUey+bJVHPximj4mQeMvCKhg09+W66sbhYKZ2IUllD1QDinbXY6if74wYmQT/x3T4F5zffsRwacyUSv7A/yELCzY3FnsJKhIEPq9Deyqc0OEMFu15OUx/vyCrMjmo/lQKOQyI7GcRyxRtkTokviSMqMclPdt8Q9ylP7YbrXxQqjYF+Tw/0Qiyhd4tNI18VfUTKvO9b407cpgMICELr1q84c3vfd2GTqGfeDv97awZ80XOeW9Bt9hvk9XCRdY3VxZH
 GnTfMp5oTbfpz9T5mzuhtuuF/vsO4sVRUTBDdVgNYzmnaOAakVqLBpiGo58/a/IfNEwI3R2f8Y
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5E802A4C4710;
 Fri, 18 Sep 2026 20:42:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX2-000000007cB-0bGD;
 Fri, 18 Sep 2026 18:41:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:32 +0200
Message-ID: <20260918184140.3631274-71-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 70/77] package/thrift: Fix build with OpenSSL
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
 ...recated-OpenSSL-API-ASN1_STRING_data.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch

diff --git a/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
new file mode 100644
index 0000000000..279daef4e2
--- /dev/null
+++ b/package/thrift/0003-Replace-deprecated-OpenSSL-API-ASN1_STRING_data.patch
@@ -0,0 +1,35 @@
+From d586077a37e14446cf385893608ea9e60a59d083 Mon Sep 17 00:00:00 2001
+From: Brad Smith <brad@comstyle.com>
+Date: Sun, 23 Aug 2026 01:26:50 -0400
+Subject: [PATCH] Replace deprecated OpenSSL API ASN1_STRING_data()
+
+ASN1_STRING_data() has been deprecated since OpenSSL 1.1.0. Replace
+with ASN1_STRING_get0_data(). ASN1_STRING_data() has been removed
+with OpenSSL 4.
+
+Upstream: https://github.com/apache/thrift/commit/d586077a37e14446cf385893608ea9e60a59d083
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ lib/cpp/src/thrift/transport/TSSLSocket.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+index bb8dfd13f..48b96ebf7 100644
+--- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
++++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
+@@ -770,7 +770,11 @@ void TSSLSocket::authorize() {
+       if (name == nullptr) {
+         continue;
+       }
++#if OPENSSL_VERSION_NUMBER >= 0x10100000
++      const char* data = (const char*)ASN1_STRING_get0_data(name->d.ia5);
++#else
+       char* data = (char*)ASN1_STRING_data(name->d.ia5);
++#endif
+       int length = ASN1_STRING_length(name->d.ia5);
+       switch (name->type) {
+       case GEN_DNS:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
