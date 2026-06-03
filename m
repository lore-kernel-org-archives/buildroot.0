Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63481CD6E57
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19A2A61B58;
	Wed,  3 Jun 2026 21:01:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEIC1hPkLoRm; Wed,  3 Jun 2026 21:01:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1788F61B53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780520467;
	bh=E3MXcyB7TOPk7fbPLucBMycrFV7HyT/7R+98M4PEGBA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WsoN6hlBk/vjKmzlv6mFpwB0NtZs7z7fysvceSyVJoep+LQT1M3guxbWMNuJKBAm4
	 oRv30wwh8wQ7PDekOa60wzAjWLTnJTccFKZ+vZ4qM1SSJ6G4/AOg5rUTxD5veYwDFu
	 EfwRe7CNOnFNOyq9iPC00j7o9Pg8ncrnLhuHLOazZdNfzQPFjzqTrBu5DCKgTwS5m3
	 5iLhVMEPAJbFxEXEDXh2qgk0De3gTHUkYz29tKx1w/QzCuX9DTPv45wDA6Mfa0ErL1
	 OvaTWrxK5u1La2y7iRY/tbNA/3LWJnBaQ2ueS4Q53ySqLgIldYSZomPSY+LcqIzcCx
	 zbXXtjzB5yYYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1788F61B53;
	Wed,  3 Jun 2026 21:01:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D7B72F5
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 238364236A
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:01:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yPVX22rxnss4 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:01:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B7A5D42366
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7A5D42366
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B7A5D42366
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:01:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0d62.dip0.t-ipconnect.de [91.58.13.98])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB517A4C3AE0
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 23:00:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32806)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wUshv-000000006PJ-24G0
 for buildroot@buildroot.org; Wed, 03 Jun 2026 21:00:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  3 Jun 2026 23:00:59 +0200
Message-ID: <20260603210059.71319-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603210059.71319-1-bernd@kuhls.net>
References: <20260603210059.71319-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780520459;
 bh=y/QbWlIwL0kTnQ54EbqrHOMD24moO52bKXyynidL/PI=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=WU9p8qJEzWLg2IFfP8j49JeOMr46GEPKFDxk4lFdNYAfhpVi0UzAoCkv57UXS2bDi
 2R79TdkYp4w8v66XaWgAPxeRG6qXYfRaD/fP2KMFhq0AlmeOzaTmISFrR3vLqwn4Ob
 KznFJ4e6N8F1UyRF1meQsGlj12zpc/+ELA7CaG9YvELPriSjoC0craE/murd4UYiLN
 7wHCes8GEmTLGTSFT4I84oZTbJTewJ5nKpzcT6zrd8IzoNWtHXWSGsuB4vU9NRLwn+
 MyIbN+C97DNhSM88LXbo1ATEm5Kagqr77ZXSVGwuYVM2rMs4rAr3VrgQw2S75Wmn+b
 F6aLTq+IoBgVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=WU9p8qJE
Subject: [Buildroot] [PATCH/next v2 2/2] package/kodi-screensaver-rsxs:
 remove dependencies to gli & glm
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
v2: Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/0bf318ca986aec68c107a4c8c06fbf36c5a65940

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
