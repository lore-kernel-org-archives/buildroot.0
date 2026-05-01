Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6045CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D29C41F2A;
	Fri,  1 May 2026 12:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZ9NVpbXDDRD; Fri,  1 May 2026 12:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF65841F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638960;
	bh=1S2Wret9qnftMVHHuWDwagABpzksD7o+42Sb0jQMbCU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Xwr7BO8rxwvHmQRdryet68OcpeML1ZZvXCZl9TIOwGE2wn4Q/h/tXgA+8uAClOW5C
	 FognLJ+8lXe7WrnrHqHWg1AutDYgLCNEmVdiWFDNFrjE7C1viUmAHm8DjeRXuBJAXS
	 z9Utg1q6z80uGJXcURHwYvnbXpdVxs+Tnv27imN3zAYcLRzibe6wPSqa31vZbtBITh
	 OxPqOCiazToMdniOTmZVWznmdercNlx+WtmOFRJVMrI+MoHZVBjAEcMkSuzksKexZe
	 XnZ9gFA63w6qVYFpX19glqakrJ3PuSPLy9asqhAz6kGqDbesKFhwsmaRK/wBElejxK
	 7B9o1rB0aMEqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF65841F32;
	Fri,  1 May 2026 12:36:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4152C127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3371A40B1E
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DRBrjtZ48p9d for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:35:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2050C401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2050C401CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2050C401CA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:35:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 45404A4C2EC4;
 Fri,  1 May 2026 14:31:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-3bmN;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:10 +0200
Message-ID: <20260501123100.1918951-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638665;
 bh=IWKNxGmiyUPSHNZUuP5zr6wkH/0stjaz4lit5ve7Ch8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=OMwIltyg6TPhK1llTfVCKuxtBcm8CbCTtD9n7PZWj0D+Z7qgULhSCzwHwOLjgrlKq
 lz/pLZZYqx+tfYcWgK5yDQtrZAvyWopPbLw7b1YNsZqsufoH3WKkMyrIO7V2xqthgz
 lP/fuUmHm7NF+9VzB2QYtpjm/eKQepLp6kx3HYM7Y837+buDd4JtdweM/fsqlBqaYo
 gzmVkJknoZvIq3BtC7Am2KMXZ1JNdUQ/ltLX4mewJotcFfgwJmvMM4r421Vz6t65w5
 9lIxksR2WcP555Y8dEYD3IvbRv6LfEZ+wqvqCgQZ7LFO/+pWDMWsk1Fn8ZxeY2nnq+
 DdZlfL6mO5PyA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=OMwIltyg
Subject: [Buildroot] [PATCH 25/75] package/python-librt: bump version to
 0.9.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-librt/python-librt.hash | 4 ++--
 package/python-librt/python-librt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-librt/python-librt.hash b/package/python-librt/python-librt.hash
index e12bb75949..30ab711042 100644
--- a/package/python-librt/python-librt.hash
+++ b/package/python-librt/python-librt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/librt/json
-md5  977ea89f85bd73d2ec17f5149f165f71  librt-0.8.1.tar.gz
-sha256  be46a14693955b3bd96014ccbdb8339ee8c9346fbe11c1b78901b55125f14c73  librt-0.8.1.tar.gz
+md5  25cc9fb4e0c47582ff60ee5985cacc6d  librt-0.9.0.tar.gz
+sha256  a0951822531e7aee6e0dfb556b30d5ee36bbe234faf60c20a16c01be3530869d  librt-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  88f9e379c684580053c58e75e296ca2eb243b6edcc6e5357f247310e96eeef8a  LICENSE
diff --git a/package/python-librt/python-librt.mk b/package/python-librt/python-librt.mk
index 8f16e762a7..264fe83281 100644
--- a/package/python-librt/python-librt.mk
+++ b/package/python-librt/python-librt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBRT_VERSION = 0.8.1
+PYTHON_LIBRT_VERSION = 0.9.0
 PYTHON_LIBRT_SOURCE = librt-$(PYTHON_LIBRT_VERSION).tar.gz
-PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/56/9c/b4b0c54d84da4a94b37bd44151e46d5e583c9534c7e02250b961b1b6d8a8
+PYTHON_LIBRT_SITE = https://files.pythonhosted.org/packages/eb/6b/3d5c13fb3e3c4f43206c8f9dfed13778c2ed4f000bacaa0b7ce3c402a265
 PYTHON_LIBRT_SETUP_TYPE = setuptools
 PYTHON_LIBRT_LICENSE = MIT
 PYTHON_LIBRT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
