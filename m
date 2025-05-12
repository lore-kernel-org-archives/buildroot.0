Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46F8C3ABCB
	for <buildroot@archiver.kernel.org>; Mon, 12 May 2025 21:47:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D10D40C0F;
	Mon, 12 May 2025 21:47:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOg1NhOwCzI7; Mon, 12 May 2025 21:47:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B61F240C0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B61F240C0E;
	Mon, 12 May 2025 21:47:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42BDE150
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 264528104C
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfciHVjhG2RV for <buildroot@buildroot.org>;
 Mon, 12 May 2025 21:47:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D249780F49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D249780F49
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D249780F49
 for <buildroot@buildroot.org>; Mon, 12 May 2025 21:47:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c66e.dip0.t-ipconnect.de [79.214.198.110])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36E94A4C055D
 for <buildroot@buildroot.org>; Mon, 12 May 2025 23:47:45 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33252)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uEazv-000000000GP-0QHa
 for buildroot@buildroot.org; Mon, 12 May 2025 21:47:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 May 2025 23:47:43 +0200
Message-Id: <20250512214743.439158-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1747086465;
 bh=EZq7/Nk/NAUYp5BgeiNGBGNDSbiYe2eMMNj+ZI5yUHs=;
 h=From:To:Subject:Date:From;
 b=evnC4Py3vqx15pv3kAjSvwMDDiUhlV6y18rTcwkSqvxQcuH4BP0sWtjEMGD1aY2/I
 D4L5Pgd2gELN14VH9eMfiFHDjJdZCtRfqLCNKLyAjB8hFDXkV9+RHKl32WwDF8l1H9
 xGFr8vmLIUWfKdp2VyzhXkREaezB6dhLO2JoOWr92kLOOYhmcAYqlUE/WRxom9xHCW
 eB531DXm+Eh27J2HR8JF2uutDanxDeY81XD7+xh4HV/8YIiCu+CWq6mLYwKC7wnBsC
 MwZS+rydhHG28dx4TB7OXET8VY/WDDRqp7idTByQhHKczjBh68pPJPsOjDqaM3wkk5
 95/i32JiAU6cA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=evnC4Py3
Subject: [Buildroot] [PATCH] package/berkeleydb: fix build with gcc-15.x
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

Inspired by
https://src.fedoraproject.org/rpms/libdb/c/c250c61cc3d56c5cff7ba59308f46245a32bdc69

"GCC 15 defaults to C23.  The last release of this package was over a
 decade ago, and it is no longer maintained, therefore it should not be
 expected to compile to the latest standards."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/berkeleydb/berkeleydb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 1c121370db..b2d4b689f3 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -26,6 +26,7 @@ BERKELEYDB_BINARIES = db_archive db_checkpoint db_deadlock db_dump \
 define BERKELEYDB_CONFIGURE_CMDS
 	(cd $(@D)/build_unix; rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
 		$(TARGET_CONFIGURE_ARGS) \
 		../dist/configure $(QUIET) \
 		--target=$(GNU_TARGET_NAME) \
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
