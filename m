Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91408CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:38:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6750F42461;
	Fri,  1 May 2026 12:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CL2uT5C08zEF; Fri,  1 May 2026 12:38:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95C5042668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639129;
	bh=7ixnPfSEBE4OMTM58WZ3ezxLPDf3uWAJ903vIlGy2us=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=IGya4Q3noLLt1P5xHHpGV3clHLWkaZprj0AcDBGYsdDQV94sy0BXkqJvwdPYqagtC
	 Rcpj48kKyZ1W8gzOfp5UC5k84El/qe8RHkYsQkyZulJGMdEBGvu22Xdjvxtsuy8PbY
	 xffTIWDUyB83pxIX7lLLk5XFosm5IGyDZauqZTS7K4pJ7RJA4hTWw1+k6CvyRCyEjQ
	 pL5ZHoOp/7E7tLoYMr2Drq52KAE+oN/Rksx8RsMlf+IKTYzPEPX7ORncn3DbX2Ssbh
	 XsZHCsOPCeOtorKiiAAEMUiF2u59qweTjChucYMhkokPitJKx2E+S4QsivOk/fX234
	 SMRV+Corsw/hw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C5042668;
	Fri,  1 May 2026 12:38:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F01E127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E9ADF426AB
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTeLDrHgAEKm for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:38:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DE6DB42668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6DB42668
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE6DB42668
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 664CEA4C2EE1;
 Fri,  1 May 2026 14:31:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-49OM;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:00 +0200
Message-ID: <20260501123100.1918951-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638667;
 bh=ZC42xa+jxlp/GrsVxiK8VkP9Q+bcCry1xpynWAlIejE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=bzLPIql9nNnDc+Gq5Lr4HKlBN6KusNGpB/RLN23Srel2jO9xDiYLRO0++QjG0cQtr
 Hpbwk6Ymf9eVkEI9ftq+3SVGs0MxSockgWqQi1udVOORfR7JqkaDKf6UJe2HbACxaE
 +Z2sLzarP0LVwOyLtZJ5o+fFWqY7gMLmtY6pYU+DZcZee9DAqbiClyZFqFKBzIXWrr
 u7sUIXKhX9Ze79QRTTr3pEMpGM/Sos2d5LYNJHvmavy7MjDW0XnCwAagg5kIuqPW9h
 v43Bp3WXT9Fk5zCuM2OMg5b0fNwPAsmkzP9/Lpk0zOucuRpVHHi4B3gzm/EhcarXod
 cHt9iUYl/PAiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=bzLPIql9
Subject: [Buildroot] [PATCH 15/75] package/python-editables: bump version to
 0.6
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

https://github.com/pfmoore/editables/blob/0.6/CHANGELOG.md

Updated license hash due to removal of DOS line endings.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-editables/python-editables.hash | 6 +++---
 package/python-editables/python-editables.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-editables/python-editables.hash b/package/python-editables/python-editables.hash
index a34c7ad20e..e8736170d6 100644
--- a/package/python-editables/python-editables.hash
+++ b/package/python-editables/python-editables.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/editables/json
-md5  520de8c3a9dc5dfb2b365d104541c9de  editables-0.5.tar.gz
-sha256  309627d9b5c4adc0e668d8c6fa7bac1ba7c8c5d415c2d27f60f081f8e80d1de2  editables-0.5.tar.gz
+md5  658e28eab5b342442d8edc42ff4fa3bd  editables-0.6.tar.gz
+sha256  1163834902381c4613787951c5914800fdf155ae08848a373b8ea5006780977c  editables-0.6.tar.gz
 # Locally computed sha256 checksums
-sha256  c73e08a04e1557fdb49525fb7a579f73bcab84a254910b9350ee56daf143932d  LICENSE.txt
+sha256  65f80d840245883efab92f8c70b60cb483d3b734fc95f208364ff69811d602c4  LICENSE.txt
diff --git a/package/python-editables/python-editables.mk b/package/python-editables/python-editables.mk
index e60d50f9d6..116aa228d5 100644
--- a/package/python-editables/python-editables.mk
+++ b/package/python-editables/python-editables.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_EDITABLES_VERSION = 0.5
+PYTHON_EDITABLES_VERSION = 0.6
 PYTHON_EDITABLES_SOURCE = editables-$(PYTHON_EDITABLES_VERSION).tar.gz
-PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/37/4a/986d35164e2033ddfb44515168a281a7986e260d344cf369c3f52d4c3275
+PYTHON_EDITABLES_SITE = https://files.pythonhosted.org/packages/82/f8/02a4e9a0cb961b0feeb431ac96b231c157ecdcbbeacafe9e2fdb4b1dde39
 PYTHON_EDITABLES_LICENSE = MIT
 PYTHON_EDITABLES_LICENSE_FILES = LICENSE.txt
 PYTHON_EDITABLES_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
