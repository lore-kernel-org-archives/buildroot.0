Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BD5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 18:45:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B77610E6
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 18:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07B77610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3A4880E83;
	Mon, 13 Sep 2021 18:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CD73hfb-USfw; Mon, 13 Sep 2021 18:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1A380E88;
	Mon, 13 Sep 2021 18:45:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0E391BF2B9
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 18:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A029E40292
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 18:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SBllFVtb5NTM for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 18:45:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtpfb1-g21.free.fr (smtpfb1-g21.free.fr [212.27.42.9])
 by smtp4.osuosl.org (Postfix) with ESMTP id 250F44028E
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 18:44:58 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtpfb1-g21.free.fr (Postfix) with ESMTP id C80C5DF9BB2
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 20:44:55 +0200 (CEST)
Received: from b52572-12.ea.freescale.net (unknown
 [IPv6:2a01:e0a:43e:e970:52f3:9afd:ecee:3fda])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A72915FFA7;
 Mon, 13 Sep 2021 20:44:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1631558690;
 bh=sujcSens81GloXrmoeSMpYC9LH9JFLGqO4N4eLE9zxM=;
 h=From:To:Cc:Subject:Date:From;
 b=G+R3ylNYgbrsqgwfh9QH9a6m+OfXgN0GZChfFeigvbE/MMPVgOMgUG38TgnanUXmV
 AiP/AnyxQu9ha/xifMj+UCZk/BUyFXwoomcemCNKdFSFHNQ5ZUaCrv/C7NUwPsZjDP
 sWXw7//vdcO3M5wAyYXvKteWCbTpZFUg/+QS1R6c2xEhvYI5D3JP0y0sxQlxmq9oez
 88LyXXfLNnKbONux3kcIBuiRmt+xOEMWajBTP+W5fJd+ORgnwyNbWXSh1vngP9iJZU
 IYtHxs+ah12/lU6sJWPBQmN/nfb4DnmalMLyQX4voHr7aS7CahQUh2U8BDz7/EZJS1
 cIc3IpvDKi2Yw==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 20:44:17 +0200
Message-Id: <20210913184417.3967-1-ju.o@free.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.2.3
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

For change log since v2.2.2, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.3

./utils/test-pkg --package fluidsynth
6 builds, 2 skipped, 0 build failed, 0 legal-info failed

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 65e19438d4..d1fd162fb1 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  695aedbfd53160fef7a9a1f66cd6d5cc8a5da0fd472eee458d82b848b6065f9a  fluidsynth-2.2.2.tar.gz
+sha256  b31807cb0f88e97f3096e2b378c9815a6acfdc20b0b14f97936d905b536965c4  fluidsynth-2.2.3.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index ceb9e574e8..61e0bf8396 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.2
+FLUIDSYNTH_VERSION = 2.2.3
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
