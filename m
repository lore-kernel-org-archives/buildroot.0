Return-Path: <SRS0=O81Z=N4=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1626C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 21:52:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43BB26103D
	for <buildroot@archiver.kernel.org>; Mon,  6 Sep 2021 21:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43BB26103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3D8E404F0;
	Mon,  6 Sep 2021 21:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j4XzF709g3m2; Mon,  6 Sep 2021 21:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 359A6404E8;
	Mon,  6 Sep 2021 21:51:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2271BF407
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 21:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 842F86070F
 for <buildroot@lists.busybox.net>; Mon,  6 Sep 2021 21:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LrV3uDv03wBg for <buildroot@lists.busybox.net>;
 Mon,  6 Sep 2021 21:51:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
 by smtp3.osuosl.org (Postfix) with ESMTP id D8D4A60705
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 21:51:52 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtpfb1-g21.free.fr (Postfix) with ESMTP id EC4A3DF8555
 for <buildroot@buildroot.org>; Mon,  6 Sep 2021 23:51:48 +0200 (CEST)
Received: from b52572-12.ea.freescale.net.net (unknown [37.173.80.142])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 143665FF27;
 Mon,  6 Sep 2021 23:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1630965102;
 bh=m5u60dZ3QM2Y0oKF8WhXxkBlCkBTc7fODLWWrzlY8fI=;
 h=From:To:Cc:Subject:Date:From;
 b=gwRxjqUqNL7hcJJBWvXlABdSXwursINIEB0k/fhYY/SJldlEAZURiYW6PRmXUhfPk
 z2ZgM+dI9L3bTwTB4Fv39nOL9DEznGX4jRtm9G993ij78i5h6ZlwLhGqTRBXAei7xX
 52HBvEZKiEdbAUG+5wZ4FwzDrQ8gxrek1nI7neRpfJ5V3uMBodX9VhALKM5fSXShRI
 TiaUucjxh3Ji9dVNMwhtA9lO8kqWfBstMmdM+nnTLGf6bbUnGpgBARVxojFU9xWWui
 qZ7nKvL14uoA1wquyzdMs3EUbNcldr+RnfjDbrEKbRdY/F5TA+AE8ea0ucPAEVKwuQ
 pPNgc5pXu6TqA==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Sep 2021 23:51:30 +0200
Message-Id: <20210906215130.563038-1-ju.o@free.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2021.02.x] package/fluidsynth: security bump to
 version 2.1.9
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fixes the CVE-2021-21417 security issue:
https://github.com/FluidSynth/fluidsynth/security/advisories/GHSA-6fcq-pxhc-jxc9
https://github.com/FluidSynth/fluidsynth/issues/808

See changelog since v2.1.5:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.6
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.7
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.8
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.1.9

./utils/test-pkg --package fluidsynth
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 17e37e2479..fc6961dd0d 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b539b7c65a650b56f01cd60a4e83c6125c217c5a63c0c214ef6274894a677d00  fluidsynth-2.1.5.tar.gz
+sha256  365642cc64bafe0491149ad643ef7327877f99412d5abb93f1fa54e252028484  fluidsynth-2.1.9.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index e3269f5300..c3ff645326 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.1.5
+FLUIDSYNTH_VERSION = 2.1.9
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
