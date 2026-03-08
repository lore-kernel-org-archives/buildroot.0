Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB2DF55102
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 10:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0D2C40935;
	Sun,  8 Mar 2026 10:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dsRjleQ5FYIh; Sun,  8 Mar 2026 10:37:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C370540899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772966228;
	bh=0YMnd4X9Mqj1Clqz3CpD7YVsJqOJMv/DuK1dp24+ykw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UKSPUthH+35Ax440YFcmAio78dKVubqVt6yotPsj46p72H3okRho/1xgXZQBYdx0I
	 4dEi8ly5SGKTdtcskIk71TE4c2rCZ5tXjCT3sjZXBrrWienli1X13jc7SU7Lu2BhaZ
	 2Xz6LsF3gITm5CJdX+ECTFVohzWPtsqozHz4q6vUW5xRDSuKKNS5yTpKAEX2AhwaH6
	 fnTKyZahiduwEbaLvR74hb9oUHcZvO5IQeBM8eDY2CgPbq37j/EF7oxBjJ4+ZLHJsg
	 e+uQciY3p86exCTz5d2eD9yivtDO2KVjdysfTgPVHiu0DSqgRZEKTFZP9bGFyKR3CZ
	 V/Fs0q1yndgAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C370540899;
	Sun,  8 Mar 2026 10:37:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16331223
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F041260836
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:37:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rDaKlnxVtdOK for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 10:37:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D85DD60776
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D85DD60776
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D85DD60776
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 10:37:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 03CA2A4C3862
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 11:37:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47354)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vzBVP-000000003Iv-2AhV
 for buildroot@buildroot.org; Sun, 08 Mar 2026 10:37:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  8 Mar 2026 11:37:03 +0100
Message-ID: <20260308103703.1722570-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772966224;
 bh=z3tnQoAetZaOfsHts9zz7ArDNKs98yxCwLJMAHXkdBw=;
 h=From:To:Subject:Date:From;
 b=W04ih6DeoBHS2YTMkCJU7GTvow0JmkXed0xttsq9zBIMZWGu2TToM0rq2Z+yU/MLr
 pUFBUOt39hiECaw1m05joIX9Air+avfcebio7QftF6ku5ndTXlEdl6gYz8rtKzNJxn
 vbFv3NLgTF/NHBSAyRpShd/UzLAi9EJkuKfDq49UJ9xWPcSSgIcMHKzMJMSwYFxqae
 mI2KVjHWg8Fu9o22WO809p7e5M3+hhLqE/oEXLtWsmeppJi1cH5m+IjAQWUW8Xbn9Z
 6sdvFz0GGYcdk2ERS8KxyGIjQShjkMmBOIt8tjqXhu/HK/3xmbr8aqRSqBRiQyWNt8
 3jkUS5YuIUdlg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=W04ih6De
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.52.0
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

https://sqlite.org/releaselog/3_52_0.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 055e935a4e..9ed3781dca 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  fbd89f866b1403bb66a143065440089dd76100f2238314d92274a082d4f2b7bb  sqlite-autoconf-3510200.tar.gz
+sha256  f6b50b0c103392af32a8be15b2b9d25959de9a00a70c3979128aafeaa5338b3f  sqlite-autoconf-3520000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index 795bc32dbf..4b334714ff 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.51.2
-SQLITE_TAR_VERSION = 3510200
+SQLITE_VERSION = 3.52.0
+SQLITE_TAR_VERSION = 3520000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2026
 SQLITE_LICENSE = blessing
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
