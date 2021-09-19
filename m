Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C15C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:12:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A51F560E90
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 14:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A51F560E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64F344016C;
	Sun, 19 Sep 2021 14:12:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JRQrIrC8Nqw4; Sun, 19 Sep 2021 14:12:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A6E6C400DE;
	Sun, 19 Sep 2021 14:12:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 747A31BF27A
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62983400D9
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 14:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7ey84K6vjPn for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 14:12:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 77355400DE
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 14:12:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id x6so23836495wrv.13
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ii7t6HpkK3l/vrnoqrO7g4KcUtl9/b9vLGCKYhJ8QdY=;
 b=O3MWu3WC40OJrnR+yTQuU+KjcERNEVsHjhtOH9PZ+NQfTzNDIQcOSuA9LWS4CUU+dh
 fa8eL78lhRDgLf47dfPi1ap1zKPFC+GB0ba3ks0G1taj+bu9WHsNSTp46NBk/poBVL0t
 DuVotux3+YpquehMUTJV0SS4c34eqsQs1w2Ui4h+LbZtKVPZDVsEyjU5wKJ9CaLgHubj
 zbw63yoV/O69IVX8kRSn6HQ2Ou+Rr8VZyLlN1TUUXTnnsjoQAYpcs6xrEphHaaPnbt71
 pKJ0V21gvd7xKK5zlDQAAgzYm2vaQU8k4VN+gm3su3cZriwj0Ad0+M+F1KFJfmEWNVcG
 1t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ii7t6HpkK3l/vrnoqrO7g4KcUtl9/b9vLGCKYhJ8QdY=;
 b=lgXBvqWmwvDkltE1/+F4ooX16d5K+TkbPXkR/rsJQwcPmaUBNmvKscB0PMD9qa6zoa
 ifbrFu5/lN3VaTXEdlm5bSHLH5eZ1FkZ8JTA+8u5aqv+xM56hDF1YwbT7LvomsTQ3iB8
 o0k01Kq9MMOWqfm+h0r9Wf98hZfn1HwZo5Vky0dzB8pBT1zKZ/mQexuusz1wLBHQ9NJX
 2b4JzDFP1+T7Ljpb3WwLlgBk+bHexnsqilvdxguScEI+FGBGt2M4u9dV9v9CwJXlPPHk
 uhErgmXH3yUx6CT5OdJUzWzAIi9lQ8kcun2Zq8Kmy9+qdW58IENC5p41G2p703RKsC3b
 TyCA==
X-Gm-Message-State: AOAM530aHG/DgARLmgPOZLIfdCLK4nX5L2T1T8o+QytzvGzp0mFv76Fc
 3E1GrlmOPyXXgFEi4H5H8w7M/8h49ys=
X-Google-Smtp-Source: ABdhPJz4vG9+mafGEq9wM4Xj14H/7hVraQ/i2p4OljVeUcp8WZLYpogfe2GKY34yW4JGSHIdMQmBSg==
X-Received: by 2002:a5d:6902:: with SMTP id t2mr22223779wru.23.1632060749370; 
 Sun, 19 Sep 2021 07:12:29 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id p5sm14446142wrd.25.2021.09.19.07.12.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 07:12:28 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 16:12:14 +0200
Message-Id: <20210919141214.3283829-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/proj: bump to version 8.1.1
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Update hash of COPYING (Change mention of PROJ.4 to PROJ and change 'I'
pronoun to Frank Warmerdam:
https://github.com/OSGeo/PROJ/commit/b56f39dec5464cecd7bc1dbb24042bb51e5c96e5)

https://github.com/OSGeo/PROJ/blob/8.1.1/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/proj/proj.hash | 8 ++++----
 package/proj/proj.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/proj/proj.hash b/package/proj/proj.hash
index 27cbc38490..96d94e458e 100644
--- a/package/proj/proj.hash
+++ b/package/proj/proj.hash
@@ -1,5 +1,5 @@
-# Fetched from http://download.osgeo.org/proj/proj-7.2.1.tar.gz.md5
-md5  befbafd25e65ddf0c26a8321d8bcdcd2  proj-7.2.1.tar.gz
+# Fetched from http://download.osgeo.org/proj/proj-8.1.1.tar.gz.md5
+md5  f017fd7d35311b0d65b2cf0503844690  proj-8.1.1.tar.gz
 # Locally calculated
-sha256  b384f42e5fb9c6d01fe5fa4d31da2e91329668863a684f97be5d4760dbbf0a14  proj-7.2.1.tar.gz
-sha256  2dcac4af6990093ef48b896bfb81452d46a31b08d46cce34b27e83f93b2e37f6  COPYING
+sha256  82f1345e5fa530c407cb1fc0752e83f8d08d2b98772941bbdc7820241f7fada2  proj-8.1.1.tar.gz
+sha256  6a8f30793e877d32e3f88b972f0970a051a3b5a26cd057d3993cb51e21c43319  COPYING
diff --git a/package/proj/proj.mk b/package/proj/proj.mk
index 03ed9c0a2e..bc924b41fb 100644
--- a/package/proj/proj.mk
+++ b/package/proj/proj.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROJ_VERSION = 7.2.1
+PROJ_VERSION = 8.1.1
 PROJ_SITE = http://download.osgeo.org/proj
 PROJ_LICENSE = MIT
 PROJ_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
