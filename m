Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4E6CD6E56
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CDBB60DA8;
	Sun, 31 May 2026 17:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GgK1G4pdCByo; Sun, 31 May 2026 17:29:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454DF60DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780248561;
	bh=z1TjA/fClklYBMOA/tNWTGzcZt2+waV7atVAImFNI4A=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Gn9x5jlBesHdgbOYCeZtSkbet9wXAwabJi0IfD5VAmob1tKZ/nvT/auSAvlJxWrGZ
	 ojBSDwsL3P62YUhTiGAQFrOvtSmEmVWdfDsbAxjrl2vUVf31yACiIsaIY61jU2/7ly
	 /BReKrvW939radGnwX4p4COLfvqTUYb0540aKY7KfrZw4tj0UTwhgvOi10+7nnkv5a
	 ZBWksWVXVZziiqqIKV1xVZek/A3+Q/3Kihce5v89ozODW7zufHY3rMKA0SsRDjPzW+
	 pG2Ha1E3RL8xwyY7Un0FijbgzR87xhivSMCEL7qCka/tgQ95R1FCeNU3/vd9DicEpi
	 9xRoRaJ/LpVMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 454DF60DC7;
	Sun, 31 May 2026 17:29:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C80F8F4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:29:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9762405E7
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:29:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YqNUrIPMD-pp for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:29:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F08A74057A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F08A74057A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F08A74057A
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:29:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A477DA4C2C3F
 for <buildroot@buildroot.org>; Sun, 31 May 2026 19:29:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49234)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTjyO-000000005OJ-2yO3
 for buildroot@buildroot.org; Sun, 31 May 2026 17:29:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 19:29:16 +0200
Message-ID: <20260531172916.1678206-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780248556;
 bh=GN58LBK+YEvg5UtOPXEK8HiciRirhUewhBRcz2qeg3A=;
 h=From:To:Subject:Date:From;
 b=LfREUJqIRUqG7ANEIuJYBwYuDWcTNLYN9fdD8WAznNFc+pjo0NGbWEkrtF5gX0XSO
 FTuzhP1pXkBoVk/8gXN6gaZ+kBnr9v/JI1kPKWvTs2eZd5f+WosopfqrsGeLhvsu68
 NShOz1VWhfSc0bS9ZukYmKKzP33wpaOIVi+neefUkcb70tIn85KlImojlmatcXhhwi
 T4UmhYVZmiWIVIh42X1ybj9m0HD6+KATC06t/0vesiHJSTndKafLmfBHqoHcoTkNqm
 pwzs6bSDaf2kx1G3NhGWIMH5mv7g9iHiYu5FzQwb/g3oySbSP0pVYwNwLL4hSSJR+g
 LEy4KHx+Zkz2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LfREUJqI
Subject: [Buildroot] [PATCH v2 1/1] package/cppdb: remove stale patch
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

Remove a stale patch which was not removed when the cppdb package was
removed by buildroot commit b7143b2e22dc6d5f6bc0f7fe745118db7dbcb787.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: rephrased commit message

Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/pipelines/2565571223

 ...s.txt-fix-compatibility-with-CMake-4.patch | 24 -------------------
 1 file changed, 24 deletions(-)
 delete mode 100644 package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch

diff --git a/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch b/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
deleted file mode 100644
index 3bba81f563..0000000000
--- a/package/cppdb/0002-CMakeLists.txt-fix-compatibility-with-CMake-4.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 27003c60a05dd3921538323a53b1650e289cba8c Mon Sep 17 00:00:00 2001
-From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Date: Wed, 17 Dec 2025 22:27:33 +0100
-Subject: [PATCH] CMakeLists.txt: fix compatibility with CMake 4
-
-Upstream: N/A, dead upstream
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 5e81b09..32ff3a6 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 2.6)
-+cmake_minimum_required(VERSION 3.5)
- project(cppdb)
- 
- set(CPPDB_MAJOR 0)
--- 
-2.52.0
-
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
