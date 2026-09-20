Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C58C982E1
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59394081E;
	Sun, 20 Sep 2026 14:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 26ikkmc_Buux; Sun, 20 Sep 2026 14:51:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED09240A93
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915905;
	b=Z4jbjlKmSASXOVssFIR4JYHi/fuzyX77zfgS6bwx1IdhBEL+xpDWxd/rRDu1AibIs+z0
	 jkDL3BHYM6VKjlUk+E3NncS/BfmCCgc9yB09j6efzWLmhvKc5aRDaDfOeKP8g0pqfrIU9
	 btboNkMfbFbpTydfaCzhJJVCaEP/jW/6XXf78O13CavpaArbthmfor9i3v6GOyk5zTSgQ
	 DL3cjrc57b21YZ8pVboBU4+v1rLyYs1JoEIi/CVRvjjEzNVNrFzmIxeUnVCh7x2m3Fp9e
	 cntInK/hdW3W5wfPF6bM8oZwhNxTfxTNingqXneaZbZ+8RQp79Me4Tm116qA8qzE7ww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915905;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	b=BtYKDOaDOAfsAerCu0XXCxhSsUnXUUENsf+69Rl0xWHxlSqdWf6f762lvudvVRgFjBhJ
	 mY5opbLTVMYcLVO57Qnqjw8Q+wDJ/J10y3kdPKe0zILVeo3r7rdf+Jt1v/MRNayKSPj4P
	 BSsIaKJtaJ2/R5Q7WVUGrQxTSMNgWxnD5cWviQwFLH6621tMRGG/XYT9e2opNjyB8gZ6p
	 C3evd552JhgqiDoqLLsKxTsUO2YNk7RgIkpWZ/8lvBC2yAyVcdg/wNt14PoalZU59JO8e
	 YwW3eSicAgEaJ8JUTx0WSGCUEtU0ESbpD5tF7qem4lG6yMAWash2DahDuuiA/Fbz37g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=CvNa1c9O;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915905;
	bh=WlGHSYqaqW6NA1iJ5vhYQ9U0DyQfsQwxaHvambouax0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qP6QMBUb/kAj8tcixd6wn5JaH1s0VOSYwWhf+3a02yeLQc5Yi2rMTr/cwS64EXoID
	 GFSEdkZHRJFJMaBHQrL2WA4bedpg2BO118zivvsNerwVrtj1Tt7m/CaaE+PltgM5Tx
	 INrGvDLsz41QmzYitSFf0+h+C02keGYHzKl8ZbPHuThpROYY89UjjQNd8NTR1Zz4O9
	 4pUMEEY80rPxMx6uatFAHgbpRebSkbUuOD4pl1+l5uqGvnOnmZS5AO6ReqrKAcNiu4
	 bVATM258RQdNxo3uj2AwZzmTrCPAULN0n0n+937CUUL8C4WNsNGPwyf38DUDuNrSmc
	 zHv0iMsRbwDJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED09240A93;
	Sun, 20 Sep 2026 14:51:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B473424D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AA3C40E94
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id joWTGuotqJwI for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:51:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org A705E4081E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915901;
 b=lv4PsVeixRYiS8xvb2P2pnCJ2SWJZmUT7W+YSIr86c/R3NmNnkGV3sr08YJCb9ODeAPb
 JVhUB4kjaM4S4a8ZayGIYrp58A1tnqB2X/GINTC18VrG0iK61EoHfNBlDIiIh8d1vXvdp
 XgrygW55mBGzB5hPFRut/PguR9dukJJ4gLEaiRRlUasRZhv8msDHPJ61lGfrMiOdHF59G
 NvbHuOE0AXh5qVGoMhngltbKqbCRc9XpRoNCHN9BYPDjQyj3A0xFRJhJtc7axx35dUoPV
 Hk6OIoh/eB3Z4TYJriU9OtWtJs62sFQ7ibF86SDLFHRDk6NYPPB83eVHZ1XzylqsTSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915901;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 b=hoCc6+brqfm0oQeTY1tZZtNopW5LAj6yjfjmXI35H2wjleOCICyz4GTnJUlTH9RsiLZ+
 0xZ4l6dKWdVgVsprLeHIMobjV76TDcY7Af0jY1CEYJs8FrurxQt8eHTceWktH/qQ3n/a/
 eAuvHVYprTunYfAUXEg2SNFZ7Wn07A5ltAuA8g2jTEeA7e8f30Re5a7Vxt3GYe5sRvRod
 Lax4IU4ILntyX1ayKrXiXe/tV8RCeafn9ouN9P2eiFSAMxOELipve7p4V+K/QEU7xLmZx
 7qZchbf5rJE9bHlHgUCHyLkXlNdGu7K8SD3NzwsETxS3hQzhUyp44vQsuoKAPQ9YFIA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=CvNa1c9O; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=CvNa1c9O
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A705E4081E
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915503;
 bh=ZCz9Mm2R+/TZ6AuG54GXRS+f/UieJLdE+h+hRTFL5jc=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=CvNa1c9Ok3yATxYHZPCJvpDdCCN+vEZirUatyvit0yjn62eE4Q/J+t61QkEWVwne4
 n3BU42M/IE8jyfYbzAxIj4X3tPlcKDtfDJM+nXaBtBajCSfdgzfh0xKaLQ79Vn/waR
 J2tqkPVIDyNxJdh8CFyYGUDjUnOalAnCXQ8z6qP88HQNUVkkUKGm/KiOd7cwUELTHl
 4qFJG87Tl8UKeXKJdZwr3IF44LS4ERRxaEibWxsd2b4JPWKp1wxEJjV4ugFan9vNvT
 mzihNcn6EOl6/BMQDdt+26Qbx9yJpzE677Ko6LYOicnHRioiEYLQuEBjBAULrZDyxV
 wpqJIA2vXS1IA==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:SvDNlrBJjLNJGOk01m4qcWVe5hFyRMN2VWVOeDvWyrdXvvk73VghPNfOhbMnpFU5v0okOiT8hmF1UTeelHqimZKNkR2v6F0anmHSi/cI5zpKzrmuPZB8LDdf8hvLvn3ShpKelE/LXFq/djdUtgclc+dIv76OAH57x2Gplda9efDsu2fPND5KRuq5hS2TsGd7rpnio1pGBZzf5R5+6zKZTyXw1+m02u3RPIhvd8Ux0vu8N60ts1bu2pBfMAxcNerir2gFY16KFTRwyUekaqoLXT+DcyOU30EHomBmEj5rcHazLDIw775tZ9yoaHnKmI5fRhakvIM5Old2Q4j7rcPdKZlUEmz3YOeRy2xnDUrACPWtJmToUlgNjTBQZci0bzrQ8+itSazXf9VTbV6AAOLioWUnBGcYfNx7UK/egSpGoWJ4nuCFf5AIZf0qZyhCJh8HLu2UlKnSJLeFFpC+CFzQE6loUgVZEWIZ3+XbQQzssx6bXZrkIzJO8DQrOI4nFQkGx29rj73eYYGctlm4ikpSw52poXCrk2n+r/ReZZUgGB6dHHFLtWUGfJNDsYQIeIiRRhuPez4UGIgBw/FzSuKrrXzr90qh+nFFc+FsM3XQJXD3TW
 rwj8i4hR7vNW6VPR3V0hGVMu2NcQ==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F532A4C4895
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imj-000000000hB-02q8
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:43:57 +0200
Message-ID: <20260920144428.3009612-37-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 36/66] package/libesmtp: Fix build with
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
 ...-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
