Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0C5CC48BF6
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 08:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A33C822A1;
	Sat, 24 Feb 2024 08:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TcK0eelFJiEy; Sat, 24 Feb 2024 08:03:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 963838230A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 963838230A;
	Sat, 24 Feb 2024 08:03:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3CE571BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 08:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 290BE4012D
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 08:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zaN4F2-b7CKd for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 08:03:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1806C40105
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1806C40105
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1806C40105
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 08:03:18 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BFB33A4C261A
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 09:03:00 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56012)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rdmzs-000000005zs-0sLX
 for buildroot@buildroot.org; Sat, 24 Feb 2024 09:03:00 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 09:02:58 +0100
Message-Id: <20240224080300.23278-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708761780;
 bh=F5Zy6QpPfhFeTm4/myc+aE8IZLyODuPuJEauaKCrJDA=;
 h=From:To:Subject:Date:From;
 b=aLP6RMoP++lpgM8c0QH01q3IJwtDd2n7Wc5oXGQeP+q4q/JQNqiSTWDyNqY+1b65P
 dvDNJCkNowdjRM3Dzuc4YkxAjSlTujT/m5cuE2HCIUB4hqIwJjeJEs5O/tTwW60fB4
 /4x6SgZ/7QG2SShFNoSx/1oJZ4FWKZeiR0gQfF3reBfb2x72jtOHLM3XPQQiR7LUKB
 Y96ooC9IreZlMQ/RcNkF0CIkh4NndHTNQOBuuqbUBiWh99cHfjuD1zeQy0QsxI4Epb
 LwYD8RxBcHzcyPrRCWy7Rn+pzvsErpTkJchJIJQyL85/0qgUmLdNrVduqhIlghmQJl
 UKkjtG1hRduYw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=aLP6RMoP
Subject: [Buildroot] [PATCH 1/3] package/kodi-pvr-hts: bump version to
 20.7.1-Nexus
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index a268940b0e..facfbecc37 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  15d68d928e0794fb42fd0f3483403fb0290c5c94aa3d3b648a8a2f8e8316dfff  kodi-pvr-hts-20.7.0-Nexus.tar.gz
+sha256  d4aa99a8490f6743e950f9ff60522203458f85c86f7d58f54de7144f525e45af  kodi-pvr-hts-20.7.1-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index c56d0e0546..2415b151c3 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 20.7.0-Nexus
+KODI_PVR_HTS_VERSION = 20.7.1-Nexus
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
