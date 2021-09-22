Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40450C433F5
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:33:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD0A61156
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 04:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAD0A61156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE8760AC7;
	Wed, 22 Sep 2021 04:33:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DynnKFSvlHz4; Wed, 22 Sep 2021 04:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0CE060AC1;
	Wed, 22 Sep 2021 04:33:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0EC1BF41E
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4337540245
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 04:33:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TkjTgkc9f4Kv for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 04:33:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 446FF40017
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:33:05 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id h9so1334341ile.6
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 21:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q360LS9pwvOOnjzTCcc2Hi4hApfONytifN6PJ6gEvhA=;
 b=TLnXCwsCi78zTvWY3y3CFdLM35250W8eKzlupWyGbVA6TlJZsXAa+sYi4085bP91dP
 LMvF/LXkmz2NuKPCkxNn3J4P9im2wg9kK7zr5YwknqT/beftZruKAiehOTmblyTEu/Mq
 3UIJroCpd7yQTFF9hUXo5mxA0/KD/VIm47kIzbUO8Cdr60xrhO50FbhgiQ8p6v93YBj1
 GYc78gCRESS9N7YlamAZ1yqm9yJPIJUWX5kELO1KeZ9p+C7uNNBvHe0Oq6HWmQ05IxyX
 M951+GfThhuiYMk5sYLNbKcOrXq81IW/zVW/UETBxEI2ywm1jZ/qhPk+Pk8rMOzslFPU
 Zoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q360LS9pwvOOnjzTCcc2Hi4hApfONytifN6PJ6gEvhA=;
 b=FzC8AgWrGY7lLWSe8vgDFV/USGgw5LY7ulnq1yeK/8HHj2AQyLyRELlVbI693vaQam
 2R/B/xiswuJaPnYJ914ukO7wfldd8+nHWREY8BWqE83u7XyGRvUBgCZ+1ci7LI8SB115
 ooSz37JSOaNf5eolEG9THBbc3p+0Z2HOVjOLVlC/kSpNHvw49hs4iqbEeAVuivwg+10B
 CZOG8NNoWcWBwMh+0PrWtpMzQ5z6mls/yAJrRMAtzFTE9fhELSqY3djTQTwI7/Rb8ewt
 fcp71boJmA3qYGDxOtDnuCeJkl/8U36T6z5frqMgORverCHVSADVIf5x2uxRUSjv+uSN
 mxyw==
X-Gm-Message-State: AOAM533lJmhMChkZeR+vqOF/ngRACIn64FftXO2GsVSSuee6wdFHfgef
 8pU3POlM/VRoPWA4y2o5mVHn+0ho/Oo=
X-Google-Smtp-Source: ABdhPJzJvYx8wDFqY58WbG6zXbdAR6J0iyrAQH2N+w1pWT/c6Xb596xtB6lm9wlxUOidxUt5VkQH6g==
X-Received: by 2002:a05:6e02:12a6:: with SMTP id
 f6mr24673731ilr.38.1632285184203; 
 Tue, 21 Sep 2021 21:33:04 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id b1sm486479ilf.43.2021.09.21.21.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:33:03 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Sep 2021 22:32:54 -0600
Message-Id: <20210922043254.3997308-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-aioredis: bump to version
 2.0.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

License hash change due to name being added:
https://github.com/aio-libs/aioredis-py/commit/10b82dd9d8c804f088d80b277527597fa11306ff

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aioredis/python-aioredis.hash | 6 +++---
 package/python-aioredis/python-aioredis.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
index 7162890c4c..ca3f64d1e5 100644
--- a/package/python-aioredis/python-aioredis.hash
+++ b/package/python-aioredis/python-aioredis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aioredis/json
-md5	950d2092ad96bb1145e9af7bd780fe38  aioredis-1.3.1.tar.gz
-sha256	15f8af30b044c771aee6787e5ec24694c048184c7b9e54c3b60c750a4b93273a  aioredis-1.3.1.tar.gz
+md5  343a451df2381b9ea368e12b9075caa5  aioredis-2.0.0.tar.gz
+sha256  3a2de4b614e6a5f8e104238924294dc4e811aefbe17ddf52c04a93cbf06e67db  aioredis-2.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a288b4f41b5531ff7e9e2df9cd3f17a1844badebc52d7a9205b131f8b8a50744  LICENSE
+sha256  183b21f240e41af611c951d01d4f36793d470a82d5fd79efc21f25ae4cf68543  LICENSE
diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
index 750f37b6b2..21a8a349c5 100644
--- a/package/python-aioredis/python-aioredis.mk
+++ b/package/python-aioredis/python-aioredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOREDIS_VERSION = 1.3.1
+PYTHON_AIOREDIS_VERSION = 2.0.0
 PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
-PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2c/2a/662e5e79dde5d00964b995d50e38ecdefeeeb09b37edafff193c7e850f46
+PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/92/60/a3cb5fadc254cc6e709ba14a02531870b02386b8c7bb147bf80a2be93f76
 PYTHON_AIOREDIS_SETUP_TYPE = setuptools
 PYTHON_AIOREDIS_LICENSE = MIT
 PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
