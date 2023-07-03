Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0DCC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 20:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E3460E0A;
	Mon,  3 Jul 2023 20:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14E3460E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VV0W0V58-r4v; Mon,  3 Jul 2023 20:20:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6676060B0D;
	Mon,  3 Jul 2023 20:20:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6676060B0D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0B2821BF357
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D6240497
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 20:20:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D6240497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 806vVUluJP29 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 20:20:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13EA7400D1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13EA7400D1
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 20:20:15 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9C50FA4C0160
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 22:20:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43374)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qGQ1r-0003MQ-1M
 for buildroot@buildroot.org; Mon, 03 Jul 2023 22:20:11 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 22:20:11 +0200
Message-Id: <20230703202011.1995452-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688415611;
 bh=Lh2njAG2BwE2OC7dKmVQc16DhDxAhe6aHRdZhgZdCxA=;
 h=From:To:Subject:Date:From;
 b=W701+7JBZUEtvO+NiSHMomL4+rueaZcLvBN8TGcrmF+j4ldJoXTlqVy7TE2+Ltpmu
 su1tUe4PNJdMEJ5cbKqen+/sZLI6gGyvee+28Cs0/ksIFRY7KIRQ7ST/817qVsCkYf
 Lu1jkhpSy1peSsWdwFhcBYxcpbslA04SS+SJQrwK1b31X4KL9SQ8A3bL5tx4N9M5mz
 mvP1FgItMzHdrx4rz8hUn9cGQa1BeK8197CFzJ2nozAG/IUkLhj2z8mCVI0jsHyZeG
 DlldHkBWHtfD0/ouj/oick2tVoP631bUvx67j7Cksv587AQKGD3ymHsFX9ld3csNpg
 iQSwnwbm9UfFw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=W701+7JB
Subject: [Buildroot] [PATCH 1/1] package/libnatpmp: fix header install
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

Upstream renamed declspec.h to natpmp_declspec.h
https://github.com/miniupnp/libnatpmp/commit/1d113363980a98a5868ff2c2b05d7c94e3a18a70

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libnatpmp/libnatpmp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libnatpmp/libnatpmp.mk b/package/libnatpmp/libnatpmp.mk
index 3a625ea0fe..99d46d814a 100644
--- a/package/libnatpmp/libnatpmp.mk
+++ b/package/libnatpmp/libnatpmp.mk
@@ -18,7 +18,7 @@ endef
 define LIBNATPMP_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		PREFIX=$(STAGING_DIR) \
-		HEADERS='declspec.h natpmp.h' \
+		HEADERS='natpmp_declspec.h natpmp.h' \
 		$(TARGET_CONFIGURE_OPTS) install
 endef
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
