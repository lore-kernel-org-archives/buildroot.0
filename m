Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA16C433EF
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:12:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EB9261168
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1EB9261168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0014834C6;
	Wed,  8 Sep 2021 20:12:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMuYtSdOu4L6; Wed,  8 Sep 2021 20:12:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F24883438;
	Wed,  8 Sep 2021 20:12:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6A41BF870
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EFE15404E8
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:11:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2dezK06TCJUF for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 20:11:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1E3940284
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 20:11:57 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id i28so5072351wrb.2
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 13:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L5K9yIPLT6mwOB0p2Bj7ld/ZpthokhwPVj5EBXpItic=;
 b=ozbuAEOFommw4oJ4ITtM5MbnHoWkGE9nseUoQZHmNcABttr7m6mwvbNOJfECyG79D9
 9u2IMyioLsJlenZu/ot/DVdw9fxM3trTbAua5inwQM+jYHMMmqw9IwNeGpBeJtXe/oLQ
 h+cW4PQLxUx1LkgRMXPe+pT4PP3sDXm3Iqgyh6JnwsiOhPyMIEM/A7sl0NaMxhH528fY
 gM/ItmCVWI9MSYv9LtJPHy+eibVsNQCAeVvymA81hP0gqPj6q4PvRY1idy9OJuSC8DiD
 vswqBs9iJuh7W4VJM/YO+ST7FYGgR+92dAhRfiL8aWFc8CSk3m6m5bIL5tA5dx/+zoDm
 1T+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L5K9yIPLT6mwOB0p2Bj7ld/ZpthokhwPVj5EBXpItic=;
 b=4CyrhkoI1CSfsQn+jIrahLpoEfDWRri6h1QfMGsTb4GIsbBSLE6oZ5teLebMYU03B3
 tG7xJ+N756JKB//IwmPZS0+3e5W4nId1AGWD4J/4kly0l2j4GsgYh/SzMDUz9czPY95D
 rrBNCMK2wrp1WaQ+P3ggEV9tzTCRfBQ/CkpjsyMftdXyqcktvQpi/Y0m1JypPbSJPSrK
 vgHXwJl2Yc8WdlivK8hyS1Ikf5FTFX+7CZp4gaH3NSeRRfOewiYMMZpFiImbTkEQo+wt
 jsGnzd2wx5luqsXkqqRwC1FLZQReSLYcGTQargOxtxAsDPjuPIxhPJLyKsYK8QUZrpUW
 vITA==
X-Gm-Message-State: AOAM530c8C6+2buK2e6/9Ptbp8vFJqJ6QVZzzWxORy1vZ0WdK8hxD7yp
 Ir+dg0oOeUfdAdti0Vg1Cdt8YgKekDA=
X-Google-Smtp-Source: ABdhPJxpKSpn6P18fkaHNpJSeEe1Fn/YqHgNiGY84JckE5ZsdjflVDUbSv0eA2P7a6/koFyEe6U2Og==
X-Received: by 2002:a5d:456b:: with SMTP id a11mr77230wrc.291.1631131916127;
 Wed, 08 Sep 2021 13:11:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id t18sm90678wrp.97.2021.09.08.13.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 13:11:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Sep 2021 22:11:52 +0200
Message-Id: <20210908201152.729124-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/i2pd: bump to version 2.39.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

https://github.com/PurpleI2P/i2pd/releases/tag/2.39.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/i2pd/i2pd.hash | 4 ++--
 package/i2pd/i2pd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/i2pd/i2pd.hash b/package/i2pd/i2pd.hash
index da44d51e1b..4eceddba0a 100644
--- a/package/i2pd/i2pd.hash
+++ b/package/i2pd/i2pd.hash
@@ -1,4 +1,4 @@
-# From https://github.com/PurpleI2P/i2pd/releases/download/2.38.0/SHA512SUMS
-sha512  01e160394dc07621b3d236fcc13d78b46e109290f59dbb77f282c05f4d80fdfa01c9b062de5ca91d6d6e739beb8a5b6f731508b48d9483f1a132a93a71d88e6f  i2pd-2.38.0.tar.gz
+# From https://github.com/PurpleI2P/i2pd/releases/download/2.39.0/SHA512SUMS
+sha512  6b38e6e2e763e94ffe9d11eb2f9a0e9554560bb4fec95891240adf5bc0a9639f879dac4ff3712a9f8e00895b7bbeabc854887e61fe9f9755c33f96899e20aa76  i2pd-2.39.0.tar.gz
 # Locally computed:
 sha256  9c87aff490b272254d716475e3c4973f5f64af1d18f9f6962c1e61e252e1ad9a  LICENSE
diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
index e6df5ca34c..348311277d 100644
--- a/package/i2pd/i2pd.mk
+++ b/package/i2pd/i2pd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2PD_VERSION = 2.38.0
+I2PD_VERSION = 2.39.0
 I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
 I2PD_LICENSE = BSD-3-Clause
 I2PD_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
