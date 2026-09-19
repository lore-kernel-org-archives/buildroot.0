Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61796C982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 16:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2801C40B32;
	Sat, 19 Sep 2026 16:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zz4vecyPw68w; Sat, 19 Sep 2026 16:13:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B335540B3F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789834412;
	b=NykWTjcoTvQxoQacpzsKhUZ0adx5G6+Zht9DBOF9oc29Kdle23QiNaeDN5Jz0eePh1aE
	 1eau1yfj13zXxq0QDxcfoXavNe4gAWFbZTTwmlXdtiqQsGsQobgYz7rrnMijSDoEODvjI
	 0CxxntGIX8bzl4/HrO489cjvVXEVVjR0MLhTLkw9/erz0OY7HTIp8kBj0XMaz1HCwMl5M
	 I7qSGaoW4hYuR4BeWbfV1zf/xwZlYgK1JzSzIHToCl8KNRJAyww/wJc0eXR2PwJZPvJ2F
	 mK8Pe12TmFd1nHsESG715EEeMjr+FmoyunTcral08z0dFb54ZE8TBstcs6t7xHksHhw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789834412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aOZaAPaoDUu3vp1ZSb4N6SyebkGK02fFyavprPvbI/s=;
	b=RZIUqBqyR0LkEYYhQ7ZNRhGc8qfRngWuibNVKdXZWUV2XRii8gqhtvXhSUQwEPq2jaF4
	 Z6EHzeIB7HuO5DDmNOUwYUyxwoJJnPMNySQJs8lyc4Qj7kWgr8QeW46gI9Uyl7Sv6Yzet
	 vtJgmz8S4GRdGk+nInMo2I5O/A6eiWuxMPC9RpcmuLorBPHn/2uq60SoiuMkohd094j8x
	 NJexFw3Wv5crqYyqqwo4Nj5TX8kadIiCjlR5N0Vo9VZHdy8M3kfC6sd041ZFB4geQZ12U
	 UXx0x16clh5s6QjbqFPXXdx6NiUsZvv4bCXWTqDGucRpX6w8LjiRFSEGDwB91PCZD2w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pArSBGgF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789834412;
	bh=aOZaAPaoDUu3vp1ZSb4N6SyebkGK02fFyavprPvbI/s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=XzRyj815DykfoZzQX8DnfR+JT7iOb5ptng89jG6O7SZJFAJHfSbNNQPdSqUVOWMtz
	 DIYq6aNV01DIIKOGsXEcqg9FMhLvHsG5kf9RCAqh+K9lMeECKO+H+dMHENvsdEyFA7
	 qMMjqiWgTVIl6th1YI3UXj6v+pcyjmmbU3swsFsr92xmD637zcox/njsefbCrBv3A/
	 CiBnxZF5JiLT3twuL8t4TJuz+Wp4u4mFmb8tLfkDdhuN+ye6rkjh8uju8ZjXRec0Xa
	 un2mOEg4/O+ZeKUrkSZWsvCgTt665xR9rgD486zMa3pXuyKFzIvDeStNnq0AVVDKLB
	 pAgRA5dW5dkCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B335540B3F;
	Sat, 19 Sep 2026 16:13:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A869333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50BD140B32
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2ade9VucY85 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 16:13:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AC61B40D37
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789834409;
 b=TZp8utllvx89PrSJMyLhvxLpyDwCRKBdQJxxfQDFc/gqEui4eQlEvPsTpVVBlyApPv8j
 rnjYAsq5y+zzW17ic7I4uKeDEXahYXs8JZd7oLcgBehI91W5WN6KBEIOfyzA0I3u3K8I6
 Ov36rgqHPmxvxDC2o8dv+BcOpWjSmUpzYKtcMXszvnzohw6OHS6ExgHHJhzWsGYqwBbSJ
 4OH0/3C6LnXC+YJHmMT71Den13C3pORR3uy1A6n3K3W6/M/DqQUlYzutXTujefzz0MmjZ
 Irmtxk8c3tdF1ffeVS6q4CR4XzjeplgZhLF6c5KaJzLZ2Imo/Vvvrx8EYX4dZUiyWFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789834409;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0UNFLQmWWaDo+6KsJ5KF7DS7cJA+hqLv/9gCwAg2G/A=;
 b=MYC5VlNNaI4Gdpe6+NxaCErl4Xb6noNBhsM/2rzp8qW/QVLEV4f74OuoqQKV9Znxd11+
 bpQLNRBNiq8R6Ihupery0LzN8yWlIkm1wfnNSHcPq8moZfRkCgCLtGNs5NLak3VM5VOkA
 5pOMWpRdLNFma7ofb8T7IonbDd01td2rOAf3t5+ggX4VEyjJc4L+O+W7tV8TbdDFYspja
 D1zW4GuciTfNjvBUuD2oyXgmFwa97oV5XPYmu5QHNgNcmXeE9qyxtpJI+mbpxvGMwwrl5
 kUyn2Is+Qq8sOFLgF4m58OO+pDoRvRCmJuZkyXlCvKdjKnDbij5+9PXqrt/YP+L/PbA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pArSBGgF; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pArSBGgF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC61B40D37
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 16:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789833557;
 bh=0UNFLQmWWaDo+6KsJ5KF7DS7cJA+hqLv/9gCwAg2G/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pArSBGgF1/IuBXMb8CUC+rCZqNtKEhaBUeQbCgRPq1m9nc4RT1m4uONdF1y79xQ0r
 g+gdurB6P9DHnXeFI1XlxFANeIuGv5jhG20WKS7rXv9MywBTDjnFFzxrVN1tNtCPWx
 eYOm6eG7CPd7mxtebSSPtrNALp1yC+NcMmO7B36FPX+VS+DmvwMYp3L1NLu+49xe6G
 /5Db4jbOmY3pUUqYifEMbzP42mIO4vJIhAD8WVcXfdEt5hKLM1WHoe5UL0MukvFYlg
 9MNHllUmSvTTXlZpj0oGckfbREDUOUt/+cmkzzBJwlG6AR0Nep71ZH65ANYxi491j8
 fgtGMadyvNU1Q==
X-KAS-Sym: v3:f51bdf72230551df:gmt39DKOa2A41oLFzswc1ak3jJsAy8EKrWYvfkLHTUlP5oBvqhD3SonKR0eCjPDaVkHbtraobmntqgA2CLBBFKi84wi5F2j1ScmOQFzcxDjuD3phZHAssDCx9WZqanntRoYpLogm4rtzjdJapTMxHJxDWQI3Fozz7DrQtNoavUgMfggZ/wpgTHWTNaUG9mA2RKjmYRHmYAUksqtKBePefmpisQbVjO1OHIUZY/59P/gZ43yJbG7q6xpZc3z0u9aLEbL0D61rENpFpAa63AfIDRCewB/vpO97JrlrkKrXMvg6akriPYi1+SiTfhgy1c+iG83rzhag072zLXLQsF4b3g==:3GBloar2N5xpH6BUKqOebYYAtSIVImTW1f44sPRKjeDsky15PdunT7g2M/AAHWyr/Uct7tzORTUnwkS+fUwsTjmEblWApWKMfCer0gahDuxU6J31Nemby3RnwYHWhR2uutfrlaGJvPQ94n1Jc2tvDuWeFTuJARSLk7WTh1QvHPm4zL1lgFlFtloRB+nuGw/7tTTzHq7ovWQy1zZe91glbB3uHE3puDLDsPCOvsqQxAZ5mHRcP5y2po9sDN9pX//RP8ng+cUnFsc8MeVuyMMhm4yDOH+87ZngD5fLzBfkvTv/ZW5P21W/fLRlr3JVwdbwijO6k3SrikiJ4vqfuKHkKA8iKo1fWxOuiB2s/JAYlxcNty+TlRsfP1oqsUGA8tAP7aeX555pNEHl+MJaLC+J4pNvZoWn2DG/nr8ugBG82L9NrSn6UcnW4ZTwrn2nhl4G0sHC7MxFO8IQB342sP9A3G/ZDOwnUyhY4ZowASZRjS+moH2APMZQrz9ycCj+MNQs6Nco1+s5nKpMZhTTiDqdRxcohOm9x8MtEI8jUXq19Z5E4bnxMO3kBGXjVoq0h5mtoltXYn675A7FOYcVR7XeC2hb122GG6auHI47TL6EtXL+Tr
 70eaLtqlA1by95aSZ708qXzFurG8lLHaw93DVJBEs5cfgbTrj/FtAPevkLXAxJnSJxEMV6vckrGOJPxqgDNamp9d6JAXP8L9mt6s1yXC4ktUwgvgrLRIxjRjYFsaGvhtj7IvcSXKsX/4+4DE2MNS2Gkn8R
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4FDF1A4C4858;
 Sat, 19 Sep 2026 17:59:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44948)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7xSv-000000005Jx-3aqd;
 Sat, 19 Sep 2026 15:59:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 19 Sep 2026 17:58:31 +0200
Message-ID: <20260919155845.5776-67-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260919155845.5776-1-bernd@kuhls.net>
References: <20260919155845.5776-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v2 66/77] package/squid: Fix build with OpenSSL
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
 Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>, Marcin Bis <marcin@bis.org.pl>,
 Robert Rose <robertroyrose@gmail.com>,
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
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
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
 .../0001-Fix-OpenSSL-4.0-compatibility.patch  | 368 ++++++++++++++++++
 1 file changed, 368 insertions(+)
 create mode 100644 package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch

diff --git a/package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch b/package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch
new file mode 100644
index 0000000000..38fc0c4a04
--- /dev/null
+++ b/package/squid/0001-Fix-OpenSSL-4.0-compatibility.patch
@@ -0,0 +1,368 @@
+From 144a59fec3d7a4bd7f0c3e71934156e1a56ebabc Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Pavol=20=C5=BD=C3=A1=C4=8Dik?= <pzacik@redhat.com>
+Date: Wed, 6 May 2026 17:18:58 +0200
+Subject: [PATCH] Fix OpenSSL 4.0 compatibility
+
+Replace direct ASN1 structure field access with accessor functions.
+and use ASN1_STRING_set() instead of direct field assignment.
+
+Fix issues caused by X509* API constness changes; in some cases,
+casting the const away is necessary to keep compatibility with
+OpenSSL 3.
+
+Downloaded from Fedora:
+https://src.fedoraproject.org/rpms/squid/blob/rawhide/f/squid-7.5-openssl4.patch
+
+Upstream: https://github.com/squid-cache/squid/pull/2389#issuecomment-5554800393
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../cert_generators/file/certificate_db.cc    |  2 +-
+ src/ssl/gadgets.cc                            | 92 +++++++++++--------
+ src/ssl/gadgets.h                             |  4 +-
+ src/ssl/support.cc                            | 18 ++--
+ 4 files changed, 66 insertions(+), 50 deletions(-)
+
+diff --git a/src/security/cert_generators/file/certificate_db.cc b/src/security/cert_generators/file/certificate_db.cc
+index 4b729b316..35849aa63 100644
+--- a/src/security/cert_generators/file/certificate_db.cc
++++ b/src/security/cert_generators/file/certificate_db.cc
+@@ -335,7 +335,7 @@ Ssl::CertificateDb::addCertAndPrivateKey(std::string const &useKey, const Securi
+     }
+ 
+     const auto tm = X509_getm_notAfter(cert.get());
+-    row.setValue(cnlExp_date, std::string(reinterpret_cast<char *>(tm->data), tm->length).c_str());
++    row.setValue(cnlExp_date, std::string(reinterpret_cast<const char *>(ASN1_STRING_get0_data(tm)), ASN1_STRING_length(tm)).c_str());
+     const auto subject = OneLineSummary(*X509_get_subject_name(cert.get()));
+     row.setValue(cnlName, subject.get());
+     row.setValue(cnlKey, useKey.c_str());
+diff --git a/src/ssl/gadgets.cc b/src/ssl/gadgets.cc
+index 06b8b79dd..100ee6a46 100644
+--- a/src/ssl/gadgets.cc
++++ b/src/ssl/gadgets.cc
+@@ -259,20 +259,31 @@ static bool replaceCommonName(Security::CertPointer & cert, std::string const &r
+     if (cn.length() > 2 && *cn.begin() == '[' && *cn.rbegin() == ']')
+         cn = cn.substr(1, cn.size()-2);
+ 
+-    X509_NAME *name = X509_get_subject_name(cert.get());
++    const X509_NAME *subject = X509_get_subject_name(cert.get());
++    if (!subject)
++        return false;
++
++    X509_NAME *name = X509_NAME_dup(subject);
+     if (!name)
+         return false;
++
+     // Remove the CN part:
+     int loc = X509_NAME_get_index_by_NID(name, NID_commonName, -1);
+-    if (loc >=0) {
+-        X509_NAME_ENTRY *tmp = X509_NAME_get_entry(name, loc);
+-        X509_NAME_delete_entry(name, loc);
++    if (loc >= 0) {
++        X509_NAME_ENTRY *tmp = X509_NAME_delete_entry(name, loc);
+         X509_NAME_ENTRY_free(tmp);
+     }
+ 
+     // Add a new CN
+-    return X509_NAME_add_entry_by_NID(name, NID_commonName, MBSTRING_ASC,
+-                                      (unsigned char *)(cn.c_str()), -1, -1, 0);
++    if (!X509_NAME_add_entry_by_NID(name, NID_commonName, MBSTRING_ASC,
++                                     (unsigned char *)(cn.c_str()), -1, -1, 0)) {
++        X509_NAME_free(name);
++        return false;
++    }
++
++    int ret = X509_set_subject_name(cert.get(), name);
++    X509_NAME_free(name);
++    return ret;
+ }
+ 
+ const char *Ssl::CertSignAlgorithmStr[] = {
+@@ -301,9 +312,9 @@ static void
+ printX509Signature(const Security::CertPointer &cert, std::string &out)
+ {
+     const ASN1_BIT_STRING *sig = Ssl::X509_get_signature(cert);
+-    if (sig && sig->data) {
+-        const unsigned char *s = sig->data;
+-        for (int i = 0; i < sig->length; ++i) {
++    if (sig && ASN1_STRING_get0_data(sig)) {
++        const unsigned char *s = ASN1_STRING_get0_data(sig);
++        for (int i = 0; i < ASN1_STRING_length(sig); ++i) {
+             char hex[3];
+             snprintf(hex, sizeof(hex), "%02x", s[i]);
+             out.append(hex);
+@@ -377,7 +388,7 @@ mimicAuthorityKeyId(Security::CertPointer &cert, Security::CertPointer const &mi
+         X509_EXTENSION *ext;
+         // Check if the issuer has the Subject Key Identifier extension
+         const int indx = X509_get_ext_by_NID(issuerCert.get(), NID_subject_key_identifier, -1);
+-        if (indx >= 0 && (ext = X509_get_ext(issuerCert.get(), indx))) {
++        if (indx >= 0 && (ext = const_cast<X509_EXTENSION *>(X509_get_ext(issuerCert.get(), indx)))) {
+             issuerKeyId.reset((ASN1_OCTET_STRING *)X509V3_EXT_d2i(ext));
+         }
+     }
+@@ -418,8 +429,7 @@ mimicAuthorityKeyId(Security::CertPointer &cert, Security::CertPointer const &mi
+     unsigned char *ext_der = nullptr;
+     int ext_len = ASN1_item_i2d((ASN1_VALUE *)theAuthKeyId.get(), &ext_der, ASN1_ITEM_ptr(method->it));
+     Ssl::ASN1_OCTET_STRING_Pointer extOct(ASN1_OCTET_STRING_new());
+-    extOct.get()->data = ext_der;
+-    extOct.get()->length = ext_len;
++    ASN1_STRING_set(extOct.get(), ext_der, ext_len);
+     Ssl::X509_EXTENSION_Pointer extAuthKeyId(X509_EXTENSION_create_by_NID(nullptr, NID_authority_key_identifier, 0, extOct.get()));
+     if (!extAuthKeyId.get())
+         return false;
+@@ -471,7 +481,7 @@ mimicExtensions(Security::CertPointer & cert, Security::CertPointer const &mimic
+     int nid;
+     for (int i = 0; (nid = extensions[i]) != 0; ++i) {
+         const int pos = X509_get_ext_by_NID(mimicCert.get(), nid, -1);
+-        if (X509_EXTENSION *ext = X509_get_ext(mimicCert.get(), pos)) {
++        if (X509_EXTENSION *ext = const_cast<X509_EXTENSION *>(X509_get_ext(mimicCert.get(), pos))) {
+             // Mimic extension exactly.
+             if (X509_add_ext(cert.get(), ext, -1))
+                 ++added;
+@@ -482,7 +492,7 @@ mimicExtensions(Security::CertPointer & cert, Security::CertPointer const &mimic
+                 // that the more stringent requirements are met.
+ 
+                 const int p = X509_get_ext_by_NID(cert.get(), NID_key_usage, -1);
+-                if ((ext = X509_get_ext(cert.get(), p)) != nullptr) {
++                if ((ext = const_cast<X509_EXTENSION *>(X509_get_ext(cert.get(), p))) != nullptr) {
+                     ASN1_BIT_STRING *keyusage = (ASN1_BIT_STRING *)X509V3_EXT_d2i(ext);
+                     ASN1_BIT_STRING_set_bit(keyusage, KeyEncipherment, 1);
+ 
+@@ -495,8 +505,7 @@ mimicExtensions(Security::CertPointer & cert, Security::CertPointer const &mimic
+                                                 (const ASN1_ITEM *)ASN1_ITEM_ptr(method->it));
+ 
+                     ASN1_OCTET_STRING *ext_oct = ASN1_OCTET_STRING_new();
+-                    ext_oct->data = ext_der;
+-                    ext_oct->length = ext_len;
++                    ASN1_STRING_set(ext_oct, ext_der, ext_len);
+                     X509_EXTENSION_set_data(ext, ext_oct);
+ 
+                     ASN1_OCTET_STRING_free(ext_oct);
+@@ -518,7 +527,7 @@ mimicExtensions(Security::CertPointer & cert, Security::CertPointer const &mimic
+ SBuf
+ Ssl::AsnToSBuf(const ASN1_STRING &buffer)
+ {
+-    return SBuf(reinterpret_cast<const char *>(buffer.data), buffer.length);
++    return SBuf(reinterpret_cast<const char *>(ASN1_STRING_get0_data(&buffer)), ASN1_STRING_length(&buffer));
+ }
+ 
+ /// OpenSSL ASN1_STRING_to_UTF8() wrapper
+@@ -547,7 +556,7 @@ Ssl::ParseAsSimpleDomainNameOrIp(const SBuf &text)
+ }
+ 
+ std::optional<AnyP::Host>
+-Ssl::ParseCommonNameAt(X509_NAME &name, const int cnIndex)
++Ssl::ParseCommonNameAt(const X509_NAME &name, const int cnIndex)
+ {
+     const auto cn = X509_NAME_ENTRY_get_data(X509_NAME_get_entry(&name, cnIndex));
+     if (!cn) {
+@@ -576,7 +585,7 @@ Ssl::ParseCommonNameAt(X509_NAME &name, const int cnIndex)
+ static bool
+ addAltNameWithSubjectCn(Security::CertPointer &cert)
+ {
+-    X509_NAME *name = X509_get_subject_name(cert.get());
++    const X509_NAME *name = X509_get_subject_name(cert.get());
+     if (!name)
+         return false;
+ 
+@@ -610,7 +619,7 @@ static bool buildCertificate(Security::CertPointer & cert, Ssl::CertificatePrope
+     // returns a pointer to the existing subject name. Nothing to clean here.
+     if (properties.mimicCert.get()) {
+         // Leave subject empty if we cannot extract it from true cert.
+-        if (X509_NAME *name = X509_get_subject_name(properties.mimicCert.get())) {
++        if (const X509_NAME *name = X509_get_subject_name(properties.mimicCert.get())) {
+             // X509_set_subject_name will call X509_dup for name
+             X509_set_subject_name(cert.get(), name);
+         }
+@@ -656,7 +665,7 @@ static bool buildCertificate(Security::CertPointer & cert, Ssl::CertificatePrope
+     bool useCommonNameAsAltName = true;
+     // mimic the alias and possibly subjectAltName
+     if (properties.mimicCert.get()) {
+-        unsigned char *alStr;
++        const unsigned char *alStr;
+         int alLen;
+         alStr = X509_alias_get0(properties.mimicCert.get(), &alLen);
+         if (alStr) {
+@@ -667,7 +676,7 @@ static bool buildCertificate(Security::CertPointer & cert, Ssl::CertificatePrope
+         // certificates with CN unrelated to subjectAltNames.
+         if (!properties.setCommonName) {
+             int pos = X509_get_ext_by_NID(properties.mimicCert.get(), NID_subject_alt_name, -1);
+-            X509_EXTENSION *ext=X509_get_ext(properties.mimicCert.get(), pos);
++            X509_EXTENSION *ext = const_cast<X509_EXTENSION *>(X509_get_ext(properties.mimicCert.get(), pos));
+             if (ext) {
+                 if (X509_add_ext(cert.get(), ext, -1))
+                     ++addedExtensions;
+@@ -922,20 +931,23 @@ Ssl::WritePrivateKey(Ssl::BIO_Pointer &bio, const Security::PrivateKeyPointer &p
+ }
+ 
+ Ssl::UniqueCString
+-Ssl::OneLineSummary(X509_NAME &name)
++Ssl::OneLineSummary(const X509_NAME &name)
+ {
+     return Ssl::UniqueCString(X509_NAME_oneline(&name, nullptr, 0));
+ }
+ 
+ bool Ssl::sslDateIsInTheFuture(char const * date)
+ {
+-    ASN1_UTCTIME tm;
+-    tm.flags = 0;
+-    tm.type = 23;
+-    tm.data = (unsigned char *)date;
+-    tm.length = strlen(date);
+-
+-    return (X509_cmp_current_time(&tm) > 0);
++    ASN1_UTCTIME *tm = ASN1_UTCTIME_new();
++    if (!tm)
++        return false;
++    if (!ASN1_UTCTIME_set_string(tm, date)) {
++        ASN1_UTCTIME_free(tm);
++        return false;
++    }
++    int result = X509_cmp_current_time(tm);
++    ASN1_UTCTIME_free(tm);
++    return (result > 0);
+ }
+ 
+ /// Print the time represented by a ASN1_TIME struct to a string using GeneralizedTime format
+@@ -945,14 +957,18 @@ static bool asn1timeToGeneralizedTimeStr(ASN1_TIME *aTime, char *buf, int bufLen
+     // UTCTime has the form YYMMDDHHMMSS[Z | [+|-]offset]
+     // GeneralizedTime has the form YYYYMMDDHHMMSS[Z | [+|-] offset]
+ 
++    const unsigned char *data = ASN1_STRING_get0_data(aTime);
++    int length = ASN1_STRING_length(aTime);
++    int type = ASN1_STRING_type(aTime);
++
+     // length should have space for data plus 2 extra bytes for the two extra year fields
+     // plus the '\0' char.
+-    if ((aTime->length + 3) > bufLen)
++    if ((length + 3) > bufLen)
+         return false;
+ 
+     char *str;
+-    if (aTime->type == V_ASN1_UTCTIME) {
+-        if (aTime->data[0] > '5') { // RFC 2459, section 4.1.2.5.1
++    if (type == V_ASN1_UTCTIME) {
++        if (data[0] > '5') { // RFC 2459, section 4.1.2.5.1
+             buf[0] = '1';
+             buf[1] = '9';
+         } else {
+@@ -960,11 +976,11 @@ static bool asn1timeToGeneralizedTimeStr(ASN1_TIME *aTime, char *buf, int bufLen
+             buf[1] = '0';
+         }
+         str = buf +2;
+-    } else // if (aTime->type == V_ASN1_GENERALIZEDTIME)
++    } else // if (type == V_ASN1_GENERALIZEDTIME)
+         str = buf;
+ 
+-    memcpy(str, aTime->data, aTime->length);
+-    str[aTime->length] = '\0';
++    memcpy(str, data, length);
++    str[length] = '\0';
+     return true;
+ }
+ 
+@@ -996,8 +1012,8 @@ bool Ssl::certificateMatchesProperties(X509 *cert, CertificateProperties const &
+         return true;
+ 
+     if (!properties.setCommonName) {
+-        X509_NAME *cert1_name = X509_get_subject_name(cert);
+-        X509_NAME *cert2_name = X509_get_subject_name(cert2);
++        const X509_NAME *cert1_name = X509_get_subject_name(cert);
++        const X509_NAME *cert2_name = X509_get_subject_name(cert2);
+         if (X509_NAME_cmp(cert1_name, cert2_name) != 0)
+             return false;
+     } else if (properties.commonName != CommonHostName(cert))
+diff --git a/src/ssl/gadgets.h b/src/ssl/gadgets.h
+index e0c60c3a3..4c487596b 100644
+--- a/src/ssl/gadgets.h
++++ b/src/ssl/gadgets.h
+@@ -160,7 +160,7 @@ bool WriteX509Certificate(BIO_Pointer &bio, const Security::CertPointer & cert);
+ bool WritePrivateKey(BIO_Pointer &bio, const Security::PrivateKeyPointer &pkey);
+ 
+ /// a RAII wrapper for the memory-allocating flavor of X509_NAME_oneline()
+-UniqueCString OneLineSummary(X509_NAME &);
++UniqueCString OneLineSummary(const X509_NAME &);
+ 
+ /**
+   \ingroup SslCrtdSslAPI
+@@ -285,7 +285,7 @@ const char *CommonHostName(X509 *x509);
+ SBuf AsnToSBuf(const ASN1_STRING &);
+ 
+ /// interprets X.509 Subject or Issuer name entry (at the given position) as CN
+-std::optional<AnyP::Host> ParseCommonNameAt(X509_NAME &, int);
++std::optional<AnyP::Host> ParseCommonNameAt(const X509_NAME &, int);
+ 
+ /// interprets the given buffer as either a textual representation of an IP
+ /// address (if possible) or a domain name without wildcard support (otherwise)
+diff --git a/src/ssl/support.cc b/src/ssl/support.cc
+index e7872035c..09f268a7e 100644
+--- a/src/ssl/support.cc
++++ b/src/ssl/support.cc
+@@ -272,23 +272,23 @@ ParseSubjectAltName(const GENERAL_NAME &san)
+ 
+         // RFC 5280 section 4.2.1.6 signals IPv4/IPv6 address family using data length
+ 
+-        if (san.d.iPAddress->length == 4) {
++        if (ASN1_STRING_length(san.d.iPAddress) == 4) {
+             struct in_addr addr;
+             static_assert(sizeof(addr.s_addr) == 4);
+-            memcpy(&addr.s_addr, san.d.iPAddress->data, sizeof(addr.s_addr));
++            memcpy(&addr.s_addr, ASN1_STRING_get0_data(san.d.iPAddress), sizeof(addr.s_addr));
+             const Ip::Address ip(addr);
+             return AnyP::Host::ParseIp(ip);
+         }
+ 
+-        if (san.d.iPAddress->length == 16) {
++        if (ASN1_STRING_length(san.d.iPAddress) == 16) {
+             struct in6_addr addr;
+             static_assert(sizeof(addr.s6_addr) == 16);
+-            memcpy(&addr.s6_addr, san.d.iPAddress->data, sizeof(addr.s6_addr));
++            memcpy(&addr.s6_addr, ASN1_STRING_get0_data(san.d.iPAddress), sizeof(addr.s6_addr));
+             const Ip::Address ip(addr);
+             return AnyP::Host::ParseIp(ip);
+         }
+ 
+-        debugs(83, 3, "unexpected length of an IP address SAN: " << san.d.iPAddress->length);
++        debugs(83, 3, "unexpected length of an IP address SAN: " << ASN1_STRING_length(san.d.iPAddress));
+         return std::nullopt;
+     }
+ 
+@@ -856,7 +856,7 @@ Ssl::InitClientContext(Security::ContextPointer &ctx, Security::PeerOptions &pee
+ 
+ /// \ingroup ServerProtocolSSLInternal
+ static const char *
+-ssl_get_attribute(X509_NAME * name, const char *attribute_name)
++ssl_get_attribute(const X509_NAME * name, const char *attribute_name)
+ {
+     static char buffer[1024];
+     buffer[0] = '\0';
+@@ -879,7 +879,7 @@ ssl_get_attribute(X509_NAME * name, const char *attribute_name)
+ const char *
+ Ssl::GetX509UserAttribute(X509 * cert, const char *attribute_name)
+ {
+-    X509_NAME *name;
++    const X509_NAME *name;
+     const char *ret;
+ 
+     if (!cert)
+@@ -933,7 +933,7 @@ const char *
+ Ssl::GetX509CAAttribute(X509 * cert, const char *attribute_name)
+ {
+ 
+-    X509_NAME *name;
++    const X509_NAME *name;
+     const char *ret;
+ 
+     if (!cert)
+@@ -1484,7 +1484,7 @@ void Ssl::InRamCertificateDbKey(const Ssl::CertificateProperties &certProperties
+     if (certProperties.mimicCert) {
+         if (auto *sig = Ssl::X509_get_signature(certProperties.mimicCert)) {
+             origSignatureAsKey = true;
+-            key.append((const char *)sig->data, sig->length);
++            key.append((const char *)ASN1_STRING_get0_data(sig), ASN1_STRING_length(sig));
+         }
+     }
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
