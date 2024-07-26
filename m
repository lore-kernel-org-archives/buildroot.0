Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D7B7C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E54F2605E1;
	Fri, 26 Jul 2024 16:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rY47x53S8E4W; Fri, 26 Jul 2024 16:45:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E76D3607B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E76D3607B6;
	Fri, 26 Jul 2024 16:45:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6FF9B1BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69D4B40979
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:45:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6yOToboX8an for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:45:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C001C407BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C001C407BC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C001C407BC
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:45:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba5c.dip0.t-ipconnect.de [84.161.186.92])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BCE61A4C3149;
 Fri, 26 Jul 2024 18:45:22 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57732)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1sXO4I-000000005a6-2Ik0;
 Fri, 26 Jul 2024 16:45:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:45:22 +0200
Message-Id: <20240726164522.73606-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1722012322;
 bh=57ecRJh+aHrCCFUPGtnlyNPkfTergAZHDDhCnyHqJkw=;
 h=From:To:Cc:Subject:Date:From;
 b=DQSy5bgYuh35efrHfPM6oucTLvYqHqxZVEy2fNgKVNKkCIjmTwpeJk/4XDcwSZ7oc
 8FpciCw9OIoSBtwqnmx5KQy/d4PhLdnbzkTDfiY9gTL3ETDiG20rD6m79YdJJUViNo
 vSUP/TglsnEPhPaDFFwBoQTJ9vlVFcMZIUUiFJ2+ZgOQTE3se5TB3+Be7qcEot5Ze8
 xeaBLz/gja6w8KGqsRE178oqoUpMNUV2GGmESaunREsKZzwyn+1OKZQjhQh4ItGKi3
 DTjkunltbLbSyWMzVdVzuz1nEmU87o4HLpA7JgUUV6P8csgBp4FP41QJXdHw4vk9C5
 Agk1elf03m7lQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=DQSy5bgY
Subject: [Buildroot] [PATCH 1/1] package/dtv-scan-tables: bump version
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dtv-scan-tables/dtv-scan-tables.hash | 2 +-
 package/dtv-scan-tables/dtv-scan-tables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtv-scan-tables/dtv-scan-tables.hash b/package/dtv-scan-tables/dtv-scan-tables.hash
index fd2edb13c8..f110bb6dee 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.hash
+++ b/package/dtv-scan-tables/dtv-scan-tables.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  6bf3e1839f3c4ab9c63994043c1a5dfd3e2b9a6f717fd1db3db0e7a53baf5518  dtv-scan-tables-57ed2982275045ea5e92ef2a40b9fa58255852e5-git4.tar.gz
+sha256  a6ffaeec227c35d8afe79b9d7b7a2dd9d3367c33dc1c3d5d5729cebd4973ef48  dtv-scan-tables-7098bdd27548eaf3e5d9485fc68575f88e362daf-git4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  4fd46f32582c29007657e2daad8d0a6d954cf4e9d2e47bae8f8d8c32765fc987  COPYING.LGPL
diff --git a/package/dtv-scan-tables/dtv-scan-tables.mk b/package/dtv-scan-tables/dtv-scan-tables.mk
index 45264a41c5..d9e6910abd 100644
--- a/package/dtv-scan-tables/dtv-scan-tables.mk
+++ b/package/dtv-scan-tables/dtv-scan-tables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTV_SCAN_TABLES_VERSION = 57ed2982275045ea5e92ef2a40b9fa58255852e5
+DTV_SCAN_TABLES_VERSION = 7098bdd27548eaf3e5d9485fc68575f88e362daf
 DTV_SCAN_TABLES_SITE = https://git.linuxtv.org/dtv-scan-tables.git
 DTV_SCAN_TABLES_SITE_METHOD = git
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
