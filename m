Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2946CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:11:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0E0360FED
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:11:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0E0360FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B454403D2;
	Mon, 20 Sep 2021 06:11:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDQgBLf1R9H3; Mon, 20 Sep 2021 06:11:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BFC3D40397;
	Mon, 20 Sep 2021 06:11:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C755B1BF3DC
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6A7C82496
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BufAX1lzTvPX for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 06:11:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF9B48248F
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:11:34 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id q11so26761538wrr.9
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 23:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T9joVh67F5F3RurJBsVtCEehDeTDpBuQASqoOjo3U6A=;
 b=dAjPTuRQD8FJhECz5N7LkSeavlB0NfGYxfoCoN9thQaTGDZbM1INL1XV5Ax6OOFyso
 1oB28BLWlKK4BB4w4Joxg3Ph3Geq7gnOINFljM3+4Wjn8qJxySFM6lfGx43PQm7B5zVJ
 oV6l5US/FoWh0lWgwXx73cGzwljlSPAD0RTeyOLysZK2cLrP0bJk7K4IDAKHh+9+hM2e
 hJwncpHb4JqLACBjTDraTwuwVQ/5fDsUMsPNVV+WLhFwJrJ98BClxmF+qd/WFtzDaqQK
 5U6wjhc7d4DihPTydb7OdCJF2H/wx1Tq8kqNgwGSk7WlKTjMddYA+2kUFsjM2/wJnMwJ
 8lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T9joVh67F5F3RurJBsVtCEehDeTDpBuQASqoOjo3U6A=;
 b=TD0uHWLoRaBArbHNzwbtiM157IchRPiAAefq257dvFaOR5acXxpFYXbfANkwjS3M9/
 cgFxMtDyBjECjXxLKcvs3mRToBdkZY1WycLQNGQvy3PK08pQkpMq3rY+Xo17SKfCLiI+
 bmdSq4MuzhZ9AtBCXkxp+E9Zkbe2rl+v75XugFbnYZAmKaOgW6QGSOLGWuK4GKozjaq+
 PZVywtqKuRvgjUah+RpVzLt6jE8wTOYYDkEHcjNQ+jqPtKHz31AMX4Svz8E3eX4H+mjy
 1L7sScXUEbjVI4fUy6qN60b+ykFn5+tGUG86PjsM9UEBSnkJE1VFkjz7D+fbcPtHP1OH
 rWFQ==
X-Gm-Message-State: AOAM531cx01cYCfZ1uHKUrA4pY+pu3S2aS1XfB/VWl6IqV1nD2Rt2pdn
 c996yZPVJJpxLZ3AXD6tgscsAn+vI7w=
X-Google-Smtp-Source: ABdhPJyFbHddW+srkrZxSCCAs13Os8JB1H/5b+gnzEiZMiL5oP5Jjfs0OuWcN+yFmTTuvUhUm2Dlrw==
X-Received: by 2002:adf:b781:: with SMTP id s1mr26335374wre.165.1632118292683; 
 Sun, 19 Sep 2021 23:11:32 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:72db:d93a:e4a7:fd06])
 by smtp.gmail.com with ESMTPSA id o1sm14622480wru.91.2021.09.19.23.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:11:32 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 09:11:22 +0300
Message-Id: <20210920061125.221541-2-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920061125.221541-1-asafka7@gmail.com>
References: <20210920061125.221541-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-beautifulsoup4: bump to
 version 4.10.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Plus, use two spaces for hash file indentation.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 6 +++---
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 8b8c51de4f..665c142d53 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5	be03d778cf61cf6734a480e2010d6657  beautifulsoup4-4.8.1.tar.gz
-sha256	6135db2ba678168c07950f9a16c4031822c6f4aec75a65e0a97bc5ca09789931  beautifulsoup4-4.8.1.tar.gz
+md5  e754242642253dd31d249d00358d552e  beautifulsoup4-4.10.0.tar.gz
+sha256  c23ad23c521d818955a4151a67d81580319d4bf548d3d49f4223ae041ff98891  beautifulsoup4-4.10.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a47ea51236098464fe0b4f559743590b533056d9e00f49ecbf80299fab47e231  COPYING.txt
+sha256  a47ea51236098464fe0b4f559743590b533056d9e00f49ecbf80299fab47e231  COPYING.txt
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index 6364a36677..f729d1051a 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.8.1
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.10.0
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/86/cd/495c68f0536dcd25f016e006731ba7be72e072280305ec52590012c1e6f2
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/a1/69/daeee6d8f22c997e522cdbeb59641c4d31ab120aba0f2c799500f7456b7e
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
 PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = COPYING.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
