Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBD4C5B552
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 11:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B0940A0B;
	Sun,  8 Jun 2025 11:03:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ElJbRNelOkWq; Sun,  8 Jun 2025 11:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 837F6409FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 837F6409FB;
	Sun,  8 Jun 2025 11:03:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E4E8C8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EBB2811BF
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:03:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueWIPP0UWmgb for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 11:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8020180F33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8020180F33
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8020180F33
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:03:29 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 25C10B00548;
 Sun,  8 Jun 2025 13:03:24 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Julien Olivain <ju.o@free.fr>
Date: Sun,  8 Jun 2025 13:03:17 +0200
Message-ID: <20250608110317.16552-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749380607;
 bh=DV7UbB4THPOaoAuryGBu8XPPIwjbAIFMvT1IN3tnqM4=;
 h=From:To:Cc:Subject:Date:From;
 b=LceXM/kJw1WzjtxNuSj2wS96McdBW/CBAV/7Z8ILg4CSOo202jMNWhfyd6Dd1f0dS
 52eP+uU4k7QTcRiEmSL9LiDrc5LHGI69k7VgxjsK8F++ZVzQO/Z/Z6iYnWnAwxhuuF
 yhqENJQl1vUs049MH/nBtLaDCQErlVWjAeit1sJa77wpQpeT+8vbz9gH3I1CbajcaN
 8t5I8zstiCwCeCmalo/8XqYzpK9/ePSEAkdnKx+Wu2LnhbALaDXIV1oWaSLOESoN4n
 cMdHF8aNVkfIumFTyyzSpQHdXmgNSPIep+crwxyFBfXYsegO1qDgiUvXhe6H7OGuD+
 cf+83w2t+6bwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LceXM/kJ
Subject: [Buildroot] [PATCH 1/1] package/dovecot: add missing mariadb
 dependencies for mysql support
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

Buildroot commit [1] removed mysql and replaced it by mariadb in all
packages, but did not propagated all dependencies.

This commit fixes the issue.

Fixes:

    WARNING: unmet direct dependencies detected for BR2_PACKAGE_MARIADB
      Depends on [n]: BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && (BR2_TOOLCHAIN_HAS_ATOMIC [=n] || BR2_TOOLCHAIN_HAS_SYNC_8 [=n]) && BR2_USE_WCHAR [=y]
      Selected by [y]:
      - BR2_PACKAGE_DOVECOT_MYSQL [=y] && BR2_PACKAGE_DOVECOT [=y] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/8708f3a23a7e28fdb04fc57406e13e6b7ff4a337

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dovecot/Config.in | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index 517040fad6..e109ce6be8 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -21,12 +21,16 @@ config BR2_PACKAGE_DOVECOT_MYSQL
 	bool "mysql support"
 	depends on BR2_INSTALL_LIBSTDCPP # mariadb
 	depends on BR2_TOOLCHAIN_HAS_THREADS # mariadb
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8 # mariadb
+	depends on BR2_USE_WCHAR # mariadb
 	select BR2_PACKAGE_MARIADB
 	help
 	  Enable MySQL support.
 
-comment "mysql support needs a toolchain w/ C++, threads"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+comment "mysql support needs a toolchain w/ C++, threads, wchar"
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_USE_WCHAR
 
 config BR2_PACKAGE_DOVECOT_SQLITE
 	bool "sqlite support"
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
