Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AC8C54E49
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6639340217;
	Thu,  7 Mar 2024 17:49:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p2rE3SNKCHPa; Thu,  7 Mar 2024 17:49:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F61C401FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F61C401FB;
	Thu,  7 Mar 2024 17:49:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 474E81BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42F37409E6
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:49:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wqNiFmwwWese for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:49:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29DDE401F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29DDE401F1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29DDE401F1
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:49:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd61.dip0.t-ipconnect.de [84.161.189.97])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 29D77A4C0B02
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 18:49:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36068)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1riHrw-000000005Tn-3mR0
 for buildroot@buildroot.org; Thu, 07 Mar 2024 18:49:24 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:49:24 +0100
Message-Id: <20240307174924.37416-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1709833765;
 bh=osR4pfjz6CxMw1ZRMRcGSr+nx6qxAJadp6Ggya+ITUY=;
 h=From:To:Subject:Date:From;
 b=Ze4Tr7vMd/Yj9RT0NQ2OO/0qmVYtQuEGoXo80QwiMOE4noBa7FEGBRyS6Fhg+ewYn
 JnNKKdnf07CaXi06vW6Or3Jh9BA0Ba+n2dV/j2EDMXev6vAVbZtywrniQ2aBK/ChOu
 BrEsD3HcL7ipEtFG2BqxitB1lyvg0xuSXNQ7B8jXEwN6XgJT49X6pEsefRHJoH5QKh
 CWdftilnMyg1TIrjRkwvpDpuwwono47SE9YcLUb1n0AQ1+Sb+zcjU7oFwvG+TTK2PZ
 270GoJvs9LFqYnaftPMPAR/xS5m6CTkFZp08iB7W83y+iNg0Koyo+5t34jTxVGNcez
 lt+hLXhxurWgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=Ze4Tr7vM
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.45.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Release notes: https://sqlite.org/releaselog/3_45_1.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sqlite/sqlite.hash | 2 +-
 package/sqlite/sqlite.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 38cff902d7..e7b5d2b224 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  1c6719a148bc41cf0f2bbbe3926d7ce3f5ca09d878f1246fcc20767b175bb407  sqlite-autoconf-3440200.tar.gz
+sha256  cd9c27841b7a5932c9897651e20b86c701dd740556989b01ca596fcfa3d49a0a  sqlite-autoconf-3450100.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index b54bd9580c..040d405b8a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3.44.2
-SQLITE_TAR_VERSION = 3440200
+SQLITE_VERSION = 3.45.1
+SQLITE_TAR_VERSION = 3450100
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_TAR_VERSION).tar.gz
-SQLITE_SITE = https://www.sqlite.org/2023
+SQLITE_SITE = https://www.sqlite.org/2024
 SQLITE_LICENSE = blessing
 SQLITE_LICENSE_FILES = tea/license.terms
 SQLITE_CPE_ID_VENDOR = sqlite
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
