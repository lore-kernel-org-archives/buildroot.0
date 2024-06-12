Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B763C27C53
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 19:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6086D400B9;
	Wed, 12 Jun 2024 19:22:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qBJ8CKu5YO5W; Wed, 12 Jun 2024 19:22:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 26DA441304
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26DA441304;
	Wed, 12 Jun 2024 19:22:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D22251BF369
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BFC9C810CF
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 19:22:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id txf-iJGz61BF for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 19:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1025080E2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1025080E2E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1025080E2E
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 19:22:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cd5a.dip0.t-ipconnect.de [79.214.205.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6EA0CA4C3196
 for <buildroot@buildroot.org>; Wed, 12 Jun 2024 21:21:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35246)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sHTXe-000000007h4-3lS1
 for buildroot@buildroot.org; Wed, 12 Jun 2024 19:21:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 12 Jun 2024 21:21:51 +0200
Message-Id: <20240612192154.52253-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240612192154.52253-1-bernd@kuhls.net>
References: <20240612192154.52253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1718220115;
 bh=OPeVwzP9JDLCadY/cTUpOS54A0+BGZtIf/aBiDmSDXI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qlL16z1uJ2rND9Rna4LwTvJcCIvZ6KMaDNzqNZTTfYxKS7ppICfQKGVmoxkdvWjk6
 URrC2xQ3a/6yxf4EorXvqavNYsHzm8JCoNOF6+UMfUFDhFJUiZvGVIr8XQ1sZ8xhru
 WxgjlJ9ATb48UNEYsgbAMQKjZF7RLBP0ITy2kxUUm8soe3K3D6+96zpDvIeC3vWyI8
 e9y4V23iYSY2uIy5YhzBcHgmRmIi0TI4LbagDZhkwEH+X0Z5h/ONZ9a7wrsSAMPV77
 aezqFG3kqimSHtYGLWWJ3RSASQ25GK+B5ix7CemZlVS9Yv1VlmBmYQssj84tJ/lamn
 OkSnMjVvJeHuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202406071026 header.b=qlL16z1u
Subject: [Buildroot] [PATCH 3/6] package/kodi-pvr-hts: bump version to
 21.2.4-Omega
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
index 27aa9a0729..3c9f7d87b3 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3bb04e48e9eca97fbd72b6285b110f3bebbd842ee7017423aa446259763e0d0b  kodi-pvr-hts-21.2.3-Omega.tar.gz
+sha256  5c8dd796735d5af7dddfc6fe56c8b2d8268fd43be50098f60b8fa537ff02956d  kodi-pvr-hts-21.2.4-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index e1531fa1df..7f73c0565e 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 21.2.3-Omega
+KODI_PVR_HTS_VERSION = 21.2.4-Omega
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
