Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA40EFF885C
	for <buildroot@archiver.kernel.org>; Sun, 26 Apr 2026 09:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF13844CF;
	Sun, 26 Apr 2026 09:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBOOVsVHoxTL; Sun, 26 Apr 2026 09:31:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0555844D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777195913;
	bh=DVmW3ajCY/Q26HY74QtQC03P4dLdv5jv++NR6Vbcz08=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Uf3EKqn1h6eS2LtVHl20PSLs7ST71PRNmNsERhmeyCKxRDwecKepckJmj6kVH4e52
	 JcDBuL1ozbbhhmP4LFBbK/cjiQ85XgVJpDRozI3SXmHUshrRU736wccx9N8ZYmc8wj
	 yb0fmHo5WTQbm7DN7l11VMl7iBk4FFv7JGyNDOlLVNDbESHr7DRqe7PBx/Q9/5xqMn
	 D9omzPmldiv1JBHXefMjkrH6udSDSqjPv+2sWBwSyhWZwdtqiBZ6eq/BFh/3D6N46C
	 2nFoddrDq9RmBRFYta3bEe/4iaQoFnmN1VkghhLl34wCCHxSpbVUwRqpdqK3MutlD+
	 EJ+D/RS2696iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0555844D0;
	Sun, 26 Apr 2026 09:31:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B17CA231
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A2CA5844D0
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UeWF3-A8Z2Og for <buildroot@buildroot.org>;
 Sun, 26 Apr 2026 09:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3A084844CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A084844CF
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A084844CF
 for <buildroot@buildroot.org>; Sun, 26 Apr 2026 09:31:51 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c5b2.dip0.t-ipconnect.de [79.214.197.178])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46E29A4C0CEB;
 Sun, 26 Apr 2026 11:31:49 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55922)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wGvq8-000000003gW-27yg;
 Sun, 26 Apr 2026 09:31:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 26 Apr 2026 11:31:48 +0200
Message-ID: <20260426093148.2744165-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777195909;
 bh=YRkmpmRNL41SZ7TL/XLqBGbDvRBDiJVZeaZol6oixzQ=;
 h=From:To:Cc:Subject:Date:From;
 b=PKffafnBVmtRzG3gPEmcTS7PvdQWXntCBcb67xt05Q8lT7jhnaUpwrUE2ufPXh3rJ
 z/x4D8BAOcyjHqxiTJ93qtuFTlYRg4icGc2tAoSapip5JR+DapXjaHL/Sr8y+DEDLm
 VOXh010QH4gCbiZAnycl4msFcRmIoqZrEFTmIUlLl8WvCtkN4oSc5LhiORhcABPyz2
 v+CUAMtS5Z2hgsgBDx32oySZpBfsIA55mAptuG7AMoq5tKNJXGm3A9cN8ZAnuja5yL
 efy3oTZKVyVqKn2/e/Os9rHEoOGvScYu1Iklb8OvAY8thnPXu6Tz/Bmbrg3LBaEHQQ
 8MvTOmtaQuVsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=PKffafnB
Subject: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.19
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

https://littlecms.com/blog/2026/04/17/lcms2-2.19/
https://github.com/mm2/Little-CMS/blob/lcms2.19/ChangeLog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lcms2/lcms2.hash | 8 ++++----
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index e2277ba610..0ff881158f 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.18
-sha1  3917db04b8d19b62ea6c9d8f4ff0404d145aca4a  lcms2-2.18.tar.gz
-# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.18
-sha256  ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347  lcms2-2.18.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.19
+sha1  bedb39ede32b76bc2cb24ee531d7433cf787b319  lcms2-2.19.tar.gz
+# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.19
+sha256  49e7e134e4299733dd0eda434fa468997a28ab3d33fa397c642b03644f552216  lcms2-2.19.tar.gz
 # Locally computed:
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 4ffad41014..32a78a4f35 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.18
+LCMS2_VERSION = 2.19
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
