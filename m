Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD03DD5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B174140A42;
	Mon, 15 Dec 2025 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WjrhSJOnVxx9; Mon, 15 Dec 2025 19:15:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D613140792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826101;
	bh=awVP54ubj8j7vu99991mCCXtvNvzGhLDtVtunKpg7aA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VmCjcw4KBqLhtlCEEmpmYMPOCQSF6CE1vpZ7cQ7wnM7vtP6lMDiSa8QtOKZVNnbda
	 N8ktp8uOxGr5hNlxObj8qQdk5jRsKiJDvlGrn/6bXxwN4Mk5iGQZOVTn0zRaGe2/fA
	 cZN5JmZJxEUMxZsCepswpY40g+lmyIJ2PJvdKegAPiP0HaX49d402n7KPpQ8hP1sFW
	 hgODAa5b6jwuZ7YeIZfXOP9kAroSZ8xsbMWYHvjtq7aV027wTSX6grcK02R42eRYYo
	 GBYGaUv8MVGEWh4le4dH0n4+05O7HxwvLplLYOTMc8lczVR3WsY8nQcPP72WDrH1aA
	 NnGpJFGl8+xlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D613140792;
	Mon, 15 Dec 2025 19:15:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BD316151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A424880767
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LaD1593WWI6l for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4631E807D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4631E807D0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4631E807D0
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0034BA4C426C;
 Mon, 15 Dec 2025 20:14:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-3mq3;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:10 +0100
Message-ID: <20251215191416.421755-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826066;
 bh=cqUlAzYrjYmCzdCHvUIK637wgsBDRJJXEsDiygpE/vY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iOo13UjO5XpkdtGS8QqnvY0HQrrPSFpYLpQvRmL9qrrQYJouZIdTmkvzIu0C92CEJ
 uSkbCHgN4PX+/GuFe6XIgLW01H1148hMvRGGClLNxA/ynR/YIJcsYThzNtuqEm14oi
 NmH7zHoDIFxNsSysj0KPWrxsUcOCuYQSh+Wd2Nc/emLGEYtqR8ntckG1a6nWoV9frh
 sLIAnYG+sHB/78V/91fNjdWje2uaCZxMZ4RkvPl+KF59RZDJj6cenXnhAzQIfjTlcg
 0ONz7VGCkPLMDeSP0Gac3zPhvyd0tHdC1W2MI+NAWDjfYmk36gsbbY67tFbM+5D57Y
 fiyJM+ggyyOzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=iOo13UjO
Subject: [Buildroot] [PATCH 21/27] package/python-referencing: bump version
 to 0.37.0
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/python-jsonschema/referencing/blob/v0.37.0/docs/changes.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-referencing/python-referencing.hash | 4 ++--
 package/python-referencing/python-referencing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
index 9cbd5e60a5..e407997e98 100644
--- a/package/python-referencing/python-referencing.hash
+++ b/package/python-referencing/python-referencing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/referencing/json
-md5  9d116186b2c5225c4e55254b94b2cd8e  referencing-0.36.2.tar.gz
-sha256  df2e89862cd09deabbdba16944cc3f10feb6b3e6f18e902f7cc25609a34775aa  referencing-0.36.2.tar.gz
+md5  bc9d24d5aec035c707b107cc2d43196b  referencing-0.37.0.tar.gz
+sha256  44aefc3142c5b842538163acb373e24cce6632bd54bdb01b21ad5863489f50d8  referencing-0.37.0.tar.gz
 # Locally computed sha256 checksums
 sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
index cabc9afa23..b998779132 100644
--- a/package/python-referencing/python-referencing.mk
+++ b/package/python-referencing/python-referencing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REFERENCING_VERSION = 0.36.2
+PYTHON_REFERENCING_VERSION = 0.37.0
 PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
-PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/2f/db/98b5c277be99dd18bfd91dd04e1b759cad18d1a338188c936e92f921c7e2
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/22/f5/df4e9027acead3ecc63e50fe1e36aca1523e1719559c499951bb4b53188f
 PYTHON_REFERENCING_SETUP_TYPE = pep517
 PYTHON_REFERENCING_LICENSE = MIT
 PYTHON_REFERENCING_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
