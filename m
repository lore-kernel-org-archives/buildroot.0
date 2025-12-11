Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3062CD43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0118F815CD;
	Thu, 11 Dec 2025 19:56:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyF_1XCvpZEI; Thu, 11 Dec 2025 19:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1CD381583
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765482981;
	bh=Pdhm767d9sXxgiHFEhoUm+xWb/ufLqcr3KilFXCtVPM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LDaoSFVLy2ylAS8L86Zh3eCH2A9uDcIGIrgpLdCvqw5d6uVTyfbdhNlZ7vjDb4FM0
	 frjRqexFKV6PSgKCrFRrJENU0M4JS5k/qtCxF4WNBdUnWcFcoFCGqGV086190xvslx
	 REaosBUL1QIZov9z/UX+Vt5n71p1A0UXtz/OBIrYkqztFiXC+2PIi8sz3z4F8dV/0H
	 PYqqhUROUUXEZKhXtWlQd/sQfLfr25OyOFHBmxJ/OFVeYVcZYw2erNnIb3XWgi8sdq
	 wxImv28WoONjKQpKfwgKq/2DVJfaozgGNbXGr2BdzJV/5hwjGZZdnKdKh7lggQDEmN
	 MVbOh45L2dJSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1CD381583;
	Thu, 11 Dec 2025 19:56:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 871722C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E18240419
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8t-_hqbXMRv for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5C10640405
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C10640405
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5C10640405
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 2E62DA4C35C6;
 Thu, 11 Dec 2025 20:55:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-24KW;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:12 +0100
Message-ID: <20251211195527.3276900-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482935;
 bh=6erc4lUzlh5Sv/JPr1/LHtsk986uMAjBXe/CqkSY7gE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=AaAD217KdRSmP2X6OBoyAkGRu2nz3zr6Xbe10U9nOyv9xS29jaOvE8fhOpyb7lF4A
 8PMtcTY4gdqactdeZ4ZJh6jTTh1mixqrQgIdH9lthZGnpmauzgaR75qKO2ivF40RNA
 UyoZ4jh/eOcSJckSVD6j1EXca9qZnAcz+yMbPQE6WS+Nhqyy5wlPtEf8dWWKgSdYk3
 QjEBlH+GdPIzhTcIRAGjCjOfGzZ/3Ax6kYPtdtbsPWXipFAk+AV7eB8Xxg055x3RHq
 K7mtv90qs0KA1Jra37x3ZMup3XyeBuQidB6h+oQKI1OLK6bUhvEPFMkcdr4wcS7Vt2
 T+CFVBEaPtOcA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=AaAD217K
Subject: [Buildroot] [PATCH/next 06/21] package/python-docutils: bump
 version to 0.22.3
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
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://docutils.sourceforge.io/RELEASE-NOTES.html#release-0-22-3-2025-11-06

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-docutils/python-docutils.hash | 4 ++--
 package/python-docutils/python-docutils.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index f79d418efa..7f3ad929d6 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  c4064e1e0e3cd142951fd2b95b830874  docutils-0.21.2.tar.gz
-sha256  3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb109deff6ebfa986f  docutils-0.21.2.tar.gz
+md5  98a6168e7f4719c9fd90184e88157656  docutils-0.22.3.tar.gz
+sha256  21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd  docutils-0.22.3.tar.gz
 # Locally computed sha256 checksums
 sha256  534edf7641abde69fc500f228c09751812c0589815eef0c082bc6ba317d646ac  COPYING.txt
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 1f1e043c15..450406f4a8 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.21.2
+PYTHON_DOCUTILS_VERSION = 0.22.3
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/ed/aefcc8cd0ba62a0560c3c18c33925362d46c6075480bfa4df87b28e169a9
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/d9/02/111134bfeb6e6c7ac4c74594e39a59f6c0195dc4846afbeac3cba60f1927
 PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, ZPL-2.1, GPL-3.0+ (emacs mode)
 PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
 PYTHON_DOCUTILS_SETUP_TYPE = flit
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
