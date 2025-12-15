Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826B6D41D74
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 12:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B821810BC;
	Mon, 15 Dec 2025 12:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RiKTxvHKbpEU; Mon, 15 Dec 2025 12:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BB778111E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765800631;
	bh=uqDSt7XkJBoRCKJ5VVMDcj6sZzooEIep1T4VzeZW9Fw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Uyu1iC8dkOLHxDII5LQKZ0wd/PYHjNrjFL3ghOpFen6qf9EOXhMjeKXzKhLtPW7OH
	 FUzEUCqZn6nRorwzBlWrda5hK446ITb4X2TZSJJ/BpiU3xuJU01VIpwCogOaXOVQUV
	 eBlUUpFJYNWVH2DHnj1fQMcsk2af4Eniu5LRCiygB1/jzP04ivhFScTOO9h4CovLVx
	 on6jpWQ4S8K4GrKoiGnT0xvqn545LF9xKkCzURacysIkRt90k3yVal+t/ej2sXttgm
	 0n0F1Ean4IgKAKqtx0LYZD/WRug7KfXVC/a3xBkKV8GvZ3sNVt9wKp4CBGkE/40+Jo
	 hnYGmkkmReNqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BB778111E;
	Mon, 15 Dec 2025 12:10:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A650118
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 12:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87F6B407C5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 12:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30EK3vjJeobV for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 12:10:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C4D5407A7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C4D5407A7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C4D5407A7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 12:10:28 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1675AB0057C;
 Mon, 15 Dec 2025 13:10:25 +0100 (CET)
To: buildroot@buildroot.org
Cc: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Mon, 15 Dec 2025 13:09:41 +0100
Message-ID: <20251215120941.3466860-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765800627;
 bh=COHRUix0kG/CDs4I6Bk2dKmS1cRtziNZTnwRtKMhLL4=;
 h=From:To:Cc:Subject:Date:From;
 b=Wo9kqHWYh3YNXbPkGYL+5C10XmFYORnFuS62qY3qzjuDZOUe9d44r529kDkcPlyra
 fH32iORFewAJlHgxjQHkJJcwif1PVNe5eg1JhUQeXHTSSJwGSAnyvxxIw/cmyjMQj/
 kqUe8T6aFOiO6d4I3UqkMM76iIzQNmqRA8cbP04XtD5UhepPxxdOtrHQgj5+0Mrx+W
 VgM1Eh3dWTg49yygrWUonX395g6mfwjsPxB3a1sbsEWBuBddEksgWUShTBnDNvxBoB
 PHzBSYhknTSTGVEZClAkndj9fhyX3ZYFz3i/qZaWKQEKS1zB2QxTi/0+t7gSTm99aM
 R1X2yhJD0Dt7w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wo9kqHWY
Subject: [Buildroot] [PATCH 1/1] package/dos2unix: bump package to version
 7.5.3
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

COPYING.txt hash updated caused by this commit (updated year)
https://sourceforge.net/p/dos2unix/dos2unix/ci/8379cf345bde0267398f0753173f926dbebf1636/tree/dos2unix/COPYING.txt

Changelog:
https://waterlan.home.xs4all.nl/dos2unix/ChangeLog.txt

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/dos2unix/dos2unix.hash | 6 +++---
 package/dos2unix/dos2unix.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dos2unix/dos2unix.hash b/package/dos2unix/dos2unix.hash
index d4d682cd0cb8..3e9bf7882e3a 100644
--- a/package/dos2unix/dos2unix.hash
+++ b/package/dos2unix/dos2unix.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.2.tar.gz.asc
-sha256  264742446608442eb48f96c20af6da303cb3a92b364e72cb7e24f88239c4bf3a  dos2unix-7.5.2.tar.gz
-sha256  03b60fa2cf28b2c6dd585a13b32377c1f87b8f016db44ce2ab6bc7eb306220e2  COPYING.txt
+# https://waterlan.home.xs4all.nl/dos2unix/dos2unix-7.5.3.tar.gz.asc
+sha256  28a4b0d9f9179da4e44c567b9c01f818b070a20827115fffd96f760dcfa0f3b2  dos2unix-7.5.3.tar.gz
+sha256  bff21c3509fe7348c8327745b2f80d8847b04868073c6d0861bf8c773db66515  COPYING.txt
diff --git a/package/dos2unix/dos2unix.mk b/package/dos2unix/dos2unix.mk
index e30fc999d474..4c57a4de5f9d 100644
--- a/package/dos2unix/dos2unix.mk
+++ b/package/dos2unix/dos2unix.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOS2UNIX_VERSION = 7.5.2
+DOS2UNIX_VERSION = 7.5.3
 DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
 DOS2UNIX_LICENSE = BSD-2-Clause
 DOS2UNIX_LICENSE_FILES = COPYING.txt
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
