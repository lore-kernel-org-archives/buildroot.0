Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B69C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:39:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2765880E45;
	Wed,  7 Aug 2024 10:39:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H4w5tPhZxPya; Wed,  7 Aug 2024 10:39:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3729180E78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3729180E78;
	Wed,  7 Aug 2024 10:39:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B32211BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C42C405A2
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:39:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pcSNNUQui6xp for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:39:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7D406405A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D406405A0
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D406405A0
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:39:03 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 465142C8021C;
 Wed, 07 Aug 2024 12:39:01 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 12:39:00 +0200
Message-Id: <20240807103900.125819-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723027141; bh=Kamqj3SfCWiq//v9/EFUHcIVMkzx3tcFq+8Gl64tT2c=;
 h=From:To:Cc:Subject:Date;
 b=dxX/1+HLM0jNWCZM9LEGbx6VUdCX6KxIG0s37T1M47M+6JpK4Ruiop3YGCzGKQW3v
 AOkfCHhejXh1eK89eUm7/44UpAgxp1aVKPRaU1BB/ffU4XobKxPw26fK2mXV+PLYyg
 JLfujjbIfblijt9J9hPbDAv12r9eSvQRzByD4OORmzyz5zSDdsqZ3zd8X51iHjrImg
 PmRlLK3n8eMwpcSW7aVVHoJGFf50JzhgxwrCICj0nkKF6QzdToXOgM7bkwtX5IWw9C
 lStWnuOilHDNb1etdFdzGoUdnSjTeGbA8O+TKE2MSbKIEowkVCmWKp+9t8T+bkft6b
 PPP5UHOnX6ZAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=dxX/1+HL
Subject: [Buildroot] [PATCH] package/nethogs: needs toolchain with C++
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/nethogs/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/nethogs/Config.in b/package/nethogs/Config.in
index 2d6b44739c..fe5a4cdba4 100644
--- a/package/nethogs/Config.in
+++ b/package/nethogs/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NETHOGS
 	bool "nethogs"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBPCAP
 	select BR2_PACKAGE_NCURSES
 	help
@@ -8,3 +9,6 @@ config BR2_PACKAGE_NETHOGS
 	  do, it groups bandwidth by process.
 
           https://github.com/raboof/nethogs
+
+comment "nethogs needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
