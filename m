Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7587CD98CF
	for <buildroot@archiver.kernel.org>; Mon, 15 Jun 2026 18:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A52D3413D6;
	Mon, 15 Jun 2026 18:29:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6qXzpugEJ70l; Mon, 15 Jun 2026 18:29:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4523417C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781548188;
	bh=/2pwjx1TfTnQ5FArCHsadqZc52KFwLBq3wg0NpwMyug=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QvPem5kP5qzTEr9DzI4y2p7QiFp33uv1z+EylL4VYde4emqncP/c+Yj4nFjTlBhZh
	 CM0gg7sTeSDsVDCtizzp/LIde9gQH9SKrZU3z0LkQo/DMXXK//IWOBxZykS8YnCAAw
	 UC6YYR4QvCPOX/ak2Q0kfTB+S832LsKxp2zPUd24IqHMdOMB3YcGTip6VbX0GDEyKV
	 4TWhHJZHyzy8o01va6NszzPmrneT8bz6gEbDEis3myUGGXgiSlPhbrhTJURTmx/MmS
	 Rmlfb32BHAgXllsFwv9whVgjVAB9rwtyIPh1xi4Tt4ocBjBm3ZU2xFEdzJA6iISnhf
	 IFGgt/YBHf2gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4523417C9;
	Mon, 15 Jun 2026 18:29:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 51CA22B8
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43CE841367
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:29:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zjgYn7B8Kg_A for <buildroot@buildroot.org>;
 Mon, 15 Jun 2026 18:29:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3BFEE4031A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BFEE4031A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BFEE4031A
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 18:29:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04de.dip0.t-ipconnect.de [91.58.4.222])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 49E00A4C322F
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:29:16 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50112)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZC3f-000000006g5-3xys
 for buildroot@buildroot.org; Mon, 15 Jun 2026 18:29:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Jun 2026 20:29:13 +0200
Message-ID: <20260615182915.1888004-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260615182915.1888004-1-bernd@kuhls.net>
References: <20260615182915.1888004-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781548156;
 bh=danEeEsJtTRetwMMYbK13CAOuY1laeOb3+HcoFckzyE=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Vnj8T4pqwj0E2ovQx7bBRQ7fl58P5cGW4BaLVHsJ+uyAGWsie60RPIr2vp4jFWqlf
 FvCfeYeNU/fPp1W+wWe5xaDEiHKtq0UyOilxJUALrIkwbS3yyW57ts1+3pQ8zJ5I/r
 prqlXsOfs6Y/lxoFlF2OcSlyY3GLckyRDvVl+himsP8pTrpG31oWHhzBldEA1+N0An
 IonkZUlu8XqwHb/NJix/YAqNR0KnutTBmsR/fdu8c1gnJQoAr0l/w41WYpQ+FkhNEB
 1RCICOnV9CLb/AlX+U7ZNqME8Eg9bpmnyCBdKIv4Rac2MGFSK1wfBrQ5doMgGYZnkf
 ilrAmYr1bSZQA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Vnj8T4pq
Subject: [Buildroot] [PATCH 2/4] package/kodi-screensaver-rsxs: remove
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
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ad40439fbf81d306cc35d33bf35e93c320dbefa8

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
index ff554a2e1a..dcca031b51 100644
--- a/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
+++ b/package/kodi-screensaver-rsxs/kodi-screensaver-rsxs.mk
@@ -8,6 +8,6 @@ KODI_SCREENSAVER_RSXS_VERSION = 21.1.2-Omega
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
