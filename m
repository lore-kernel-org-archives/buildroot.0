Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC7510706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DE4B416E8;
	Sat, 14 Mar 2026 14:23:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PuNBDxBKlRWo; Sat, 14 Mar 2026 14:23:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11169416C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498224;
	bh=X2MYp4mGeNcnL5x1DDgNhIqtCxIgiIc6acdALvvY3WI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fek37ay5OycX0ZiQh2L6hD5vt2RIarN03X9CTHZIFx6mKWOPLSvxhe/OE2wRahlRS
	 g6VQJX2LogbNhZpiDECz+HDHtKZOwNA4zEg7F2eeyR4tL2BHDFR/QG82UTk3kR8Q+l
	 /Fn0QBaeE+KIzg6UTg8KJfAwpCgEWqTnn3ycCcsiR2lN3mEWSSdl4Xh2ibrVLCchXO
	 YUrMjJeoUb0Tc1+gbEx/gBMWxn4sFXiYEAtUXoq+Y9e+BJmqPjPedG93+Tw0a6X2Q8
	 wvHcvLFP17Al9/bvruazk/mOeoCC2KOFfVIdJahdG0ZtwYzk6Ka8O1yHPC2P8tmxr4
	 /KnjqnTBnPvWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11169416C2;
	Sat, 14 Mar 2026 14:23:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DEF151B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAE00416BC
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nYnFXzRM46z5 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:23:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B6622416B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6622416B7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6622416B7
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:23:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9B9F4A4C1AD1;
 Sat, 14 Mar 2026 15:07:05 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdU-000000003UM-3442;
 Sat, 14 Mar 2026 14:06:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:38 +0100
Message-ID: <20260314140633.2967249-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497225;
 bh=bmd3ALVMF7kYl/eiR+rRaRo4YTSFKpzoOec+11pRvoY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=a+/MsJhonINZf44tDTouA21vdmW+HyydKVKGfEoypnf3a7DDf34mExtbSa0zXL/Os
 LU8QgzW+jQXQuKC/4W+z6WworsDM06tE3vyrJvrAUzpW3p3tQ2ZGY+6G01mi9gcjc3
 YqpUOmRoBDoMBGTofNL4ocMwkHwjz9tG6gPLWel9LBygiXEyfWoteECnIFccoTJarp
 FKoz5JG1qtTQZkcBGukqCb8pJO82sH3w8PZ/A1N16e5+IvWfb6xj0RbGL7zZ9pksxK
 v330mYIjL+ETrJnMEJamba0SJ4x8bPo6KHnyE51+TA7yNihVQzLvG3MHyizhUY3z/7
 ub22lwvNKQbmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=a+/MsJho
Subject: [Buildroot] [PATCH 42/96] package/python-pkgconfig: bump version to
 1.6.0
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/matze/pkgconfig?tab=readme-ov-file#changelog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pkgconfig/python-pkgconfig.hash | 4 ++--
 package/python-pkgconfig/python-pkgconfig.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pkgconfig/python-pkgconfig.hash b/package/python-pkgconfig/python-pkgconfig.hash
index 2fa57a7be5..7ecb8a9f3e 100644
--- a/package/python-pkgconfig/python-pkgconfig.hash
+++ b/package/python-pkgconfig/python-pkgconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pkgconfig/json
-md5  12523e11b91b050ca49975cc033689a4  pkgconfig-1.5.5.tar.gz
-sha256  deb4163ef11f75b520d822d9505c1f462761b4309b1bb713d08689759ea8b899  pkgconfig-1.5.5.tar.gz
+md5  fe94675a8b78717922de3e7694ee0643  pkgconfig-1.6.0.tar.gz
+sha256  4a5a6631ce937fafac457104a40d558785a658bbdca5c49b6295bc3fd651907f  pkgconfig-1.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cdfc7f89d8c93b15d447c9ed71d5a533b4e44b82ec86daaefb10f6db37b9e13a  LICENSE
diff --git a/package/python-pkgconfig/python-pkgconfig.mk b/package/python-pkgconfig/python-pkgconfig.mk
index fc7e8273fe..4fbf22ab65 100644
--- a/package/python-pkgconfig/python-pkgconfig.mk
+++ b/package/python-pkgconfig/python-pkgconfig.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PKGCONFIG_VERSION = 1.5.5
+PYTHON_PKGCONFIG_VERSION = 1.6.0
 PYTHON_PKGCONFIG_SOURCE = pkgconfig-$(PYTHON_PKGCONFIG_VERSION).tar.gz
-PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/c4/e0/e05fee8b5425db6f83237128742e7e5ef26219b687ab8f0d41ed0422125e
+PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/52/fd/0adde075cd3bfecd557bc7d757e00e231d34d8a6edb4c8d1642759254c21
 PYTHON_PKGCONFIG_SETUP_TYPE = poetry
 PYTHON_PKGCONFIG_LICENSE = MIT
 PYTHON_PKGCONFIG_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
