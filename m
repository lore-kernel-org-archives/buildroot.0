Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EF6C87FCE
	for <buildroot@archiver.kernel.org>; Sun, 27 Jul 2025 17:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFFFE41589;
	Sun, 27 Jul 2025 17:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ecr7PVt_E_f; Sun, 27 Jul 2025 17:12:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D90A041520
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D90A041520;
	Sun, 27 Jul 2025 17:12:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14E5ADA
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 17:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF995414E5
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 17:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GdybYqr9rya for <buildroot@buildroot.org>;
 Sun, 27 Jul 2025 17:12:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 99B2641505
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99B2641505
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 99B2641505
 for <buildroot@buildroot.org>; Sun, 27 Jul 2025 17:12:38 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 53790440159;
 Sun, 27 Jul 2025 20:10:38 +0300 (IDT)
To: buildroot@buildroot.org
Date: Sun, 27 Jul 2025 20:12:05 +0300
Message-ID: <2ebe19c757f0dd7622c127ec177e3ea391e79959.1753636325.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1753636238;
 bh=L8nIecAEjvrafRlt+d87Z7GTtMyX+3/dL9tv2TVPQqY=;
 h=From:To:Cc:Subject:Date:From;
 b=TpxySp3hU1bzkR10POG1gpTcx2+Sz/kolwUst3uKRFQGIWaib2EfF94BLxPqUV8HZ
 sS2nuBPaVDh17+DR23f9zp9z9VJEcf6ESis+V6F4bAhefOIAK+HjsuXywoGkOtd6uX
 jZOp3xMGF3IoKiU8eHe+KeMYdMuIkUJJanyFBloXgNScx0qzY4XstB0DzOTSDX1mt3
 3re/G/7qiFCE2VilXNDtfC3Nio8YIg2gsVhpcObxHkeOo559Z4UtprJ3McSPNWqnQa
 A3wGDMTnqWXEyej1tEKZHn4f7pQYYLi5BaD2vWMSbL9w13xDyJNOqWo2uJL8Fgz4Mv
 WB+LnlMGtjURQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=TpxySp3h
Subject: [Buildroot] [PATCH] package/daemon: fix build with gcc 15 and musl
 libc
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

daemon provides its own getopt() declaration for non-GNU libcs. This
declaration is compatible with musl provided one with C standards before
C23. GCC 15 defaults to C23 that makes the empty params declaration
equivalent to getopt(void), which is incompatible with musl declaration.

Set C standard to gnu99 to restore the previous behaviour.

Fixes:
https://autobuild.buildroot.org/results/cc3311c86e2b14bf9a9c1ea00056e0b290ec11a3

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/daemon/daemon.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/daemon/daemon.mk b/package/daemon/daemon.mk
index d7709e03eff4..03f2aad649b5 100644
--- a/package/daemon/daemon.mk
+++ b/package/daemon/daemon.mk
@@ -18,7 +18,8 @@ define DAEMON_CONFIGURE_CMDS
 endef
 
 define DAEMON_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99" -C $(@D)
 endef
 
 define DAEMON_INSTALL_TARGET_CMDS
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
