Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D9EC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F4FB40D90;
	Sun, 20 Sep 2026 17:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qdaau1uj2peG; Sun, 20 Sep 2026 17:21:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B0E4B40FDE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924911;
	b=NAiDR5wIe1p698ynQnWdZ3XMB3UhRW48eN8RBX7BZkr/CX7dcVtUXweL+i2zK2PLEwJn
	 0XZfwE235/AUZjLmHTu6Hfq9jOTa3bKD1UQwaBZk/2md8CM3j/V4fGsH4gti5ZTgZHzSx
	 tyOxxeZsaGNVUu3/yXpOM02IkO/9WDeBm89eYYZmKYNnzY50fKablrgJ1w64g/leNJtSP
	 YVCoxJaHG3CqqMzPLimJSvsCoAuIstNn9ShIIh/aUNxT6tjL4UqNVlti2Kf0z8xKba0JW
	 Dk1CbeJJR+V2wrI2pFeelOcmWS2EvEdVt1iG30InBFvE1Eyd1MdVUYCaVsOKYaWxsgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	b=Gv7vobL1dzcswxr9Qil8NOIudywgHZlaXOd4QcYnALUcDFsFT/fh5qqCKdsZm5+8+wLI
	 h41InS9DTuJvCeu615KW7Aft4B3/M58J39IPOQKP71pfEAokyWhWBlVMMZFORWM9sG8Pe
	 gDY0pzRPGFGK+9Jp2f3xJu/cRQWOeqh3UREt32Q6InSW4FkOvgeoEwqIHlWk9o+63GoOr
	 HuCsH4FrXq4H+71XNwhIalhQ2mZJ8YdMF0subd3bb+lBGw3gWQTY6K9O6TnYTxgsxlB15
	 TfuaRnmeFu46wd06KYBMzzgh+rQKjGaZ2EHUmTyPjN+StD0aO/k2T/X4EntUoj2R4Pw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b="VFtzdfY/";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924911;
	bh=9px9d3qOtNpqdDl3zCxSkXoN7KMCzOx5Yk4Fzmii2HA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Lzy2mYtrOgJKcJLHbXCDHhwkXj0g2gkgpALpZ32owOb5h3U7mI2ouf/dGdwfgLJIJ
	 L6QA1SEb0Hh4O8hm6Yx3M5tKJMTtfrmoulfSeER0P67exdMaxERMnWg4+JqnGN/eDL
	 gls51J5fJPnqCkrN36JVQGF7s0z44GnQT+dK0+130GVyTLbJC4iBErtWNF+9F0np1h
	 kRinVlzhZY9ZyMCotkb7QftMTO3z2ef4VBljE1z/XEFduBl/c00+pm1OUuKygcW4yi
	 bPudasXlgQQqb3ew7Y/AwmADNcKMYEea7f/6IMPZzoaI5Ga6cVN4VKPeRo0pWnMgjp
	 Kb9CxTY+N2R+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E4B40FDE;
	Sun, 20 Sep 2026 17:21:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67F06B88
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E3A441006
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lD9xyqA8vwMU for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:21:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6606C4100F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924908;
 b=GIHv34DCEOSSYQSgpInQ6xfuNLQgS94qWuU1yNthU02b+fsN+x4Vy+tfhv+HeiaeTBYV
 PZBqarZIGpRvrS4r/LeHJUhzA/JAaefND6ghmBUmEAJETPI/WuKzlPDuEa37DOoh7bsCA
 H1ydjqnAov6pLKQNZ9+1aKrri0nY1XWbqykC2NT4GadVTKy97EoKflc/dGpKHWsQ91LCo
 BB6tIApgCYY4HuE3Gc08dVNm2eGf/jTx2PsvzB5QEGcvl/cN9HEQvg4+hDM0IPNl2g3DV
 3CQW0dhl6VkJtuKr/wazFeatKU+s/8+/IopXs6Eczrv1IqZR6NQMsw4jHF9ViWrrclg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924908;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 b=eUdgr6J7tPHaGFo6q3nV1X7kqXwnDoNlQtKCK1tZCqDZrzwEJTjS3J22+BX3ZNrvLeO3
 e+FVr47o2GRW8C2b8TZSWmIaWyPZJxJRIlrXM4IzXe3ZXzu3VlulxpNivomFmWHilotzT
 Pkj4g7kJxFnoMK0XAUq9/9WJ+wT7FbLGmFkyxx+4hYe4EGKmqc60o+Ut29+/OHDUIrvq0
 LLbmF5uo2SQrkDuKCIZucygp/zLYb7co0bgzN6nQBG8pkvlb3aVq68ltuioI/8qsI4Sfj
 v5s8N224JLDArvvBEqCDSP1jrGyiaxBwjKQtGMBuOnLMtNNOuyK+04PDKhQ/IeqN/DA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="VFtzdfY/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=VFtzdfY/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6606C4100F
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924168;
 bh=40iENv0yBWyNrjjHcKXw07A5F+SLvc356scGKiuAJSs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VFtzdfY/pDyWPRtFiCsXYXNta9xyex86V8XrW2mMW/dCQq2vGE6W6LFQMwSJL3OMs
 GOZu/PGtstgmGxIZ62SZ159+TY9Ar6ks2NvGpAf7T4OtXNrODnm/xquwObHRQe7Mkw
 HOfu9OpO3BJe+PCJBw6H4DqEPBCJcvunVjxx+94aBl6D0T5II/LgntAX9L0AuiPYYT
 oZ4CGsQVbqLfgeDbq9LYoDr8Wzwq01zSh3JMNZlxxTtli7Dkq47T8lB9Q/BN7ZFrWn
 iOaPkFCPdKkXWKx8pL8aUNvcOX1yulVkFasQkQNLZ84pEEjHRwUJRYeg4UCm/ir7F6
 9B/VPefNCiXWA==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:eOp+0nYSSsmfjt0Ciqq8F36Z13E4neFpVpb1iASVP/r14OI6UVvo5oLZ+NsFaERole07EtodMaUzC1fgyZjoPLo+OYDPaTkNi3bsLlQaZh0ygep3r2E1Hws+qL42FewRtNzneGXZd6CDvN0AGCLa/by9g4ZPkD0QvraXCjObtMQoaMpmbeZKr/f7bQqc51XbqcMwwUWzhUBInm9TSRn48QEUx7dsQDfypT464QH6In4YMXUME5LjfLc9b2P6wc9tacCmX/jC984aG/+jHJx9URU4KL7wcNfy+gWM7x+iXnRc15Rb8d3I3K9oIll7sXn2B2clCJdCKhpAuOslIV6HYDTx1iFxSz00UKIOUHeDQiEIy/8Cx8yMVy2aAvWMpXcnHMALg4i+jTsqRgjKoc/I0TYtgJXjRp0tOG1CyTgiivr038YWDSY5VPw8Z1uaWdJ1zhZo497nzYRWM0Uq1vCjl7f5GZ1OG5PXwCumLvPF3k0ysL0hGL/GU0HOaOrL6dryoYBDKECpP1Tusu1uaT5RhYt26P2oIR3FlIWXzF8DBZhKf7T1Tia/+ZMzCLTi4u7PLGq7CcaNBrqhz04aycvXrDW+ET2t2EKrVeuajvL0R14kOw
 GuYl5gH+8Esia8A37Rf8AnRlM23EJBZnYd0mfFCthm2Jo3zN6l+6zysT4L6vDTxDi1EkUmapKzeswi7pwR2/uifdBxFg9MJRgZDPWOt0crIcbfL+8=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1D82DA4C48A7;
 Sun, 20 Sep 2026 19:09:28 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1f-000000000o7-1vwq;
 Sun, 20 Sep 2026 17:08:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:08:01 +0200
Message-ID: <20260920170815.240247-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v5 54/67] package/socat: Add support for OpenSSL
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
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
 ...penSSL-4.0-use-ASN1_STRING-accessors.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch

diff --git a/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
new file mode 100644
index 0000000000..6c53500d02
--- /dev/null
+++ b/package/socat/0002-Fix-build-with-OpenSSL-4.0-use-ASN1_STRING-accessors.patch
@@ -0,0 +1,35 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Thu, 13 Aug 2026 07:00:00 +0000
+Subject: [PATCH] Fix build with OpenSSL 4.0: use ASN1_STRING accessors
+
+OpenSSL 4.0 made ASN1_STRING opaque. Direct access to struct members
+(->data, ->length) is no longer possible. Use the accessor functions
+ASN1_STRING_get0_data() and ASN1_STRING_length() instead.
+
+These accessors have been available since OpenSSL 1.1.0, so this change
+is backward compatible.
+
+Upstream: Submitted [socat@dest-unreach.org]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Downloaded from https://github.com/openembedded/openembedded-core/commit/aa435ebaaf7446ec07a88586f2de4109e02a2d38
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ xio-openssl.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/xio-openssl.c
++++ b/xio-openssl.c
+@@ -1898,8 +1898,8 @@
+ 		  case GEN_IPADD:
+ 		     {
+ 			/* binary address format */
+-			const unsigned char *data = pName->d.iPAddress->data;
+-			size_t len = pName->d.iPAddress->length;
++			const unsigned char *data = ASN1_STRING_get0_data(pName->d.iPAddress);
++			size_t len = ASN1_STRING_length(pName->d.iPAddress);
+ 			char aBuffer[INET6_ADDRSTRLEN]; 	/* canonical peername */
+ 			struct in6_addr ip6bin;
+ 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
