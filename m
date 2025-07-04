Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25DAC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 16:55:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8832C409BD;
	Fri,  4 Jul 2025 16:55:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IQtnouM15qHX; Fri,  4 Jul 2025 16:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 619BA407D3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 619BA407D3;
	Fri,  4 Jul 2025 16:55:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00FC212E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E724340653
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5SsuROutMXZh for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 16:55:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 239F44063E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 239F44063E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 239F44063E
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 16:55:01 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c6da.dip0.t-ipconnect.de [79.214.198.218])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48D3DA4C37A0
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 18:54:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52094)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uXjgh-0000000062m-13HC
 for buildroot@buildroot.org; Fri, 04 Jul 2025 16:54:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  4 Jul 2025 18:54:58 +0200
Message-Id: <20250704165458.3698634-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1751648099;
 bh=vRQ2H2bLu6xyV3IyLto9zMk/o7GV9w9qn1ZK0bJQgA8=;
 h=From:To:Subject:Date:From;
 b=eHp/SrZxIuMoNTp09z98G7LSEumlfDJhopbtedQGU071thpIQ+0m4Fp/BVvMbGeOm
 sbAR8WQfFTw/OsP/ROyqBSIuoljWxGaKmLfhWHuhcYSzmEHBc2IaBN7IDTthCoqoGk
 lnqPkV/W0/WmZWT8aZ4clnBWFI9dCJdRUkEy4qglj0BGZHNu7tZlR1nUrzob1L/3Me
 EZE+vE1f45ZLPeN9AqH2fEvk1W0mp7L+dOtycGohAH3yymxt9kIDSPibmIdbSdKFWg
 OuULsR6ZNN8vWrqaW+7xEI+PDWSyOsOQT4eCJKHXIgyVS3oArPlvJ3kinKqQUHiR7w
 TQi5rGlvlBy6A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=eHp/SrZx
Subject: [Buildroot] [PATCH 1/1] package/taglib: bump version to 2.1.1
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

Release notes:
https://taglib.org/#taglib-211-release---june-30-2025
https://taglib.org/older.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/taglib/taglib.hash | 2 +-
 package/taglib/taglib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/taglib/taglib.hash b/package/taglib/taglib.hash
index bbf5dd26d5..f3fc31beea 100644
--- a/package/taglib/taglib.hash
+++ b/package/taglib/taglib.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  0de288d7fe34ba133199fd8512f19cc1100196826eafcb67a33b224ec3a59737  taglib-2.0.2.tar.gz
+sha256  3716d31f7c83cbf17b67c8cf44dd82b2a2f17e6780472287a16823e70305ddba  taglib-2.1.1.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
 sha256  53692a2ed6c6a2c6ec9b32dd0b820dfae91e0a1fcdf625ca9ed0bdf8705fcc4f  COPYING.MPL
diff --git a/package/taglib/taglib.mk b/package/taglib/taglib.mk
index 4ac51cf162..60ca045886 100644
--- a/package/taglib/taglib.mk
+++ b/package/taglib/taglib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TAGLIB_VERSION = 2.0.2
+TAGLIB_VERSION = 2.1.1
 TAGLIB_SITE = https://taglib.org/releases
 TAGLIB_INSTALL_STAGING = YES
 TAGLIB_DEPENDENCIES = utfcpp
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
