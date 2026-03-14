Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D0710706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2865340A33;
	Sat, 14 Mar 2026 14:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stAJo738mxrw; Sat, 14 Mar 2026 14:12:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C8D340A3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497524;
	bh=yH3eC5pIBP/cTJds4UVmkBNu1Jn6pBNwPUiYZet3oAE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=FIj46mcLE7NS30lu1wSbyiN+QBRKPpI5+DPgXLCg8ta4qhb/ypvcTn1du2Sa5bU76
	 VKmS8RMKaBy0PvR1obGAzXiSweEc9dGv/oDBIF472F8KLT2f1P/L2O1cQsiFzKFHxN
	 z6COH55qtgRehKDIw9TpsF3ldTFm4PQGNSxRvwDu7ttbgNInl933WFkb9wBXqch1za
	 OzhgXKpWowmV//rmgwp6dBlS7Cjc0GWkg1XY1gC4SqaK1L7QSpbA0jM7D3kCz0iO8e
	 RFdedLZL9ZamVSjHZsb4xqjhH5ezqwPEXDSBR7mIjbN/G9ifbTwllMXDbmeJPcl3kE
	 MvfWa84faBKew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C8D340A3B;
	Sat, 14 Mar 2026 14:12:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA600201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7BCD401CA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bRrrHr32dtsi for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA1F1400F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA1F1400F9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA1F1400F9
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01CEAA4C1456;
 Sat, 14 Mar 2026 15:06:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdX-000000003UM-3jzZ;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:13 +0100
Message-ID: <20260314140633.2967249-77-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497211;
 bh=3949IFTU+Xf7KavU1nj/N0zeuOQKLgW8IU53GAoWkeE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=py8SiiCSpbOsVzxl1Ul9Ara/s1odRq9U0rDUNcso75q4jexNBsxXwFJYnyjdINHhp
 nycHiIvM4chFxLkMFPWrN5/nATcNdsDXQXtqGgU7C8DWPldg67WcWSkFwbV5xpJIZv
 DYz1BlMwvEPtMCuNmR7Yb+hd7fUBTw1tZCffew4nWJOSck7ifi4bCcg2Zvd4hB7Zgk
 YCYYkW3QBzIdT8lwJjjucgHR8997d+iCe1078VOj5jHFLcxAw+5K40zef8/ZC+aRwi
 3rdWuX4Yb9klcn260SiK60ibNp9HL5NnB9lgt7DYff15YsCRELZeyL5dyuFIDW8HiJ
 84CJGrsGh0jWQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=py8SiiCS
Subject: [Buildroot] [PATCH 77/96] package/python-tortoise-orm: bump version
 to 1.1.6
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

https://github.com/tortoise/tortoise-orm/blob/1.1.6/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 0bb4224a9e..77144495f8 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  5c143e93e4c35dfd8cd19dfdbc064d6d  tortoise_orm-1.1.5.tar.gz
-sha256  d4074a7c34a8445fcca19ec865189d80ea7a00b29e4b12778460fcab67a5ce74  tortoise_orm-1.1.5.tar.gz
+md5  c3278bf834e12f7bcfef071ba52c0dbd  tortoise_orm-1.1.6.tar.gz
+sha256  30095a77aa7c3eb3ede1baf4b390a66b994dc7c4d0d06a609d23a16c50e55d0c  tortoise_orm-1.1.6.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index 18ad37d5d9..e0190eb9ff 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 1.1.5
+PYTHON_TORTOISE_ORM_VERSION = 1.1.6
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/f3/b0/2b3962847aad793d32646c6e43e7fab6f845f34a5502da5722fe704ec847
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/40/76/629a5d69c170605dbdc10f3f3416d124fae05836860686ccd9e06726810c
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
