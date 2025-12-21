Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EE1E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 123E5821CF;
	Sun, 21 Dec 2025 22:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yZfWO_q0XLJK; Sun, 21 Dec 2025 22:36:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F76F821C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356607;
	bh=/z1WJ8BEHeJBDxzjjdkV/SQJL/8e4n3A8vDB4VITEqo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OyaWlAd43TSR0ybdVzCV0sGYMydpCS26IalGf8FufJwWrwexM4GsD9MRDMmgHioP9
	 JfrDry1HihT+HvUSMXcQ040G+09/nHpJz+toRBCue1i4dbRU8T18qEcZuxHNJ/YTl2
	 jhYtPBRLRyRzFbo0T1O/A/8zsLMqlG3bC5QxxMXYeadaIDDQlQjPzh74B/8FhvtPMg
	 +G8VhKC1D3QBha9PeByf8ts8G4heP9vqvoVg2upZW1MryKXPDrhjXjrUdb0uwseBby
	 tmzy/H/XRyhHpXdJyKlIclUWlTrYeacIg63elTE7LrxhniSOo+s0cPRJkWKr9t3ERy
	 RqKv4KdwKyRzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F76F821C9;
	Sun, 21 Dec 2025 22:36:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A84D195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5171781463
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LVBur6CZVTTt for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:36:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4315581407
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4315581407
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4315581407
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 830DDA4C4E2F;
 Sun, 21 Dec 2025 23:35:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-2Oiv;
 Sun, 21 Dec 2025 22:34:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:22 +0100
Message-ID: <20251221223441.185169-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356504;
 bh=78iKG62GHTDiQf4kavBq6/Jgy4YzGcFDIVkN2+ArHB0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=P6mftPMVKxDSngWPQ++CcnlYNjdoIQ4aPaXEdCj/3MtLb7VSpioEQCTtED4+28fmX
 vjei+WI+kiuZ/KheHq1J0KUM1qMCUtWYtg0FeMFC8XXr8RY1CMKb6+FEm4BjWqZMWr
 mc3f+zbplyAloVNm0NPSlnjBNsxfpJTMvSawP+bH+PRxaYDzV1mB1YFxCM1DhMISBz
 yZ8X30ZHZbHf26NdGF3PjLwKNLj9EI7fKkuC5lVFTNtoFG8CnnS7kduQN4sbO31/Ie
 DeaDaf6ONIDztfchKV4uXxFvgFCohXrSHiua5i+yZRWV1QyunLnYujPkX2A/4Ag0Kv
 lOBMNcLhj0Z4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=P6mftPMV
Subject: [Buildroot] [PATCH v2 04/23] package/python-crccheck: add md5 hash
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-crccheck/python-crccheck.hash | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-crccheck/python-crccheck.hash b/package/python-crccheck/python-crccheck.hash
index 3fb58a7299..b8fb4e3312 100644
--- a/package/python-crccheck/python-crccheck.hash
+++ b/package/python-crccheck/python-crccheck.hash
@@ -1,4 +1,5 @@
-# From https://pypi.org/project/crccheck/#crccheck-1.3.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/crccheck/json
+md5  b70543709102d2edb9159a9b26366706  crccheck-1.3.1.tar.gz
 sha256  1544c0110bf0a697d875d4f29dc40d7079f9d4d402a9317383f55f90ca72563a  crccheck-1.3.1.tar.gz
-# Locally calculated
+# Locally computed sha256 checksums
 sha256  1237ab8ea60caa782d77d9d2ac0cdccd765475e3848b0b91b5751d3f299e9d31  LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
