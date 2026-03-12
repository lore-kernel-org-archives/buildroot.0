Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D0EFED2CC
	for <buildroot@archiver.kernel.org>; Thu, 12 Mar 2026 05:26:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73B1A61CBF;
	Thu, 12 Mar 2026 05:26:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bauE1LmW4EjR; Thu, 12 Mar 2026 05:26:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9290361CC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773293202;
	bh=M6+91c/ccUcrWG45ZsKtqD83ShmPjGZTFDLRTSmaVAQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=by1gkscFbYk1qGeXk6WL696dtnvdiDP12K3QEOdIzfxvKvA6+eS0uA5JEqnoPRYP7
	 KIkW2vZUDg31IB8ExphzaaQ9nMdwm0fZbXmoRmzI1ASImnKODzc6UccU648HwPH/zS
	 5OrYqAAjdeVT9lG9LUgxX/T2wAcFagRRi+MSU7uZe2JW7+qamyaIjljtkRl22qHv/g
	 nd1HA2GK454ljp2G4xfj+fKHNNGzNcSWzjXa0ysFk7sphFYXBuJga16D2m4CpWcEcq
	 cktbnarT8GaV0Bm4EadD5N4kcHjUOsn583bWLqAghcH80ZscaaDY1R5fy470P9pBti
	 svOYD79YuKeiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9290361CC8;
	Thu, 12 Mar 2026 05:26:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6693B282
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 05:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C88E8133B
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 05:26:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-cK8B-1zR3V for <buildroot@buildroot.org>;
 Thu, 12 Mar 2026 05:26:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4E78811E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E78811E7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4E78811E7
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 05:26:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0199.dip0.t-ipconnect.de [91.58.1.153])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01333A4C0337
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 06:26:22 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54452)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w0YYw-000000001zG-2wRc
 for buildroot@buildroot.org; Thu, 12 Mar 2026 05:26:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 12 Mar 2026 06:26:22 +0100
Message-ID: <20260312052622.486465-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260312052622.486465-1-bernd@kuhls.net>
References: <20260312052622.486465-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773293183;
 bh=0A3e1g/Dmgb1LehDLOp4yRKLWFAoPfisExQXNTVjr6g=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=KsgjLGypV0TgArLPFOROhj9DO2SPW1PsMFcOPJ+29vMe6PZtmk4YLHb7U+RoYIPRl
 rAAYSNIKtpJeZkNoyXhr6im4eGmH15RrZdqu+wMJUeTaXIozFGbkPrvjAp5eomRN7l
 IDi0vkL4k/P2+hIHWghRItRfMEkG/6nINa/PFq4RSueamz2fxDw2eFz4IOnpRSLe8U
 pq69LivfReoIbMgmwTShFl/fZFLUzNqqoNnde3W0mQYmD6yewwNwhXU4syoaEjHnpU
 h/5NBDjYibXcXx8S99UZjs8aC2jGa9IU6sKquYX2QOvs7r7zPZS/3EGiJsaeHZVNkM
 fboJg75QxEICw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=KsgjLGyp
Subject: [Buildroot] [PATCH 2/2] package/kodi-screensaver-rsxs: remove
 dependencies to gli & glm
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

Upstream commit
https://github.com/xbmc/screensavers.rsxs/commit/a00a3cce3c5f24ea7274968b5b16c8d2db656a8b
added the code of gli & glm in-tree and removed the usage as external
packages.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-screensaver-rsxs/Config.in                | 2 --
 package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/kodi-screensaver-rsxs/Config.in b/package/kodi-screensaver-rsxs/Config.in
index e88df1fe49..8185f3c424 100644
--- a/package/kodi-screensaver-rsxs/Config.in
+++ b/package/kodi-screensaver-rsxs/Config.in
@@ -2,8 +2,6 @@ config BR2_PACKAGE_KODI_SCREENSAVER_RSXS
 	bool "kodi-screensaver-rsxs"
 	depends on BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 	select BR2_PACKAGE_BZIP2
-	select BR2_PACKAGE_GLI
-	select BR2_PACKAGE_GLM
 	help
 	  RSXS screensaver add-ons for Kodi
 
diff --git a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
index 10539b4c37..54d054ebb4 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -8,6 +8,6 @@ KODI_SCREENSAVER_RSXS_VERSION = 22.0.4-Piers
 KODI_SCREENSAVER_RSXS_SITE = $(call github,xbmc,screensavers.rsxs,$(KODI_SCREENSAVER_RSXS_VERSION))
 KODI_SCREENSAVER_RSXS_LICENSE = GPL-2.0+
 KODI_SCREENSAVER_RSXS_LICENSE_FILES = LICENSE.md
-KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 gli glm kodi
+KODI_SCREENSAVER_RSXS_DEPENDENCIES = bzip2 kodi
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
