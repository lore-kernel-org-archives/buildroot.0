Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A42C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:57:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07C3760EB4
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 21:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07C3760EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB10E40359;
	Sun, 25 Jul 2021 21:57:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W2OvA0xPNNiN; Sun, 25 Jul 2021 21:57:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0BA714035A;
	Sun, 25 Jul 2021 21:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C51411BF312
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4AEB4035A
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 21:57:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f0WKnZIH-yUC for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 21:57:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B761440359
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 21:57:14 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 u15-20020a05600c19cfb02902501bdb23cdso2042519wmq.0
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 14:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHWnuCnYSx6fi4WuYY/4oO3t7EQUE3DaAyTnXwTSPzE=;
 b=mOvOsw/YJLmlkkV4f71/7oljFiNUHLh8ZZFBhIyIqy77wVYjp+wlIKniLWzZejhKhI
 mH/yncSCSNoLxzv/TgXc4l9+s8jaUtlWUJGcAY/ac3G/r3ofCYYk9hbmrkQpkFwEQi67
 erIc912xq4Ok2GL1mSe6SiF7gk47vuzy162/2miTGtHDX2twSi3ZXYHsm23KZHK3a+7F
 mpM3gU1NQctEPst7kcX6HB1Ao7p6wIAS00ueHrDpWslYg7ReNwcEE3gb1IYs82ohMBOY
 EskovXdnXZY2z5kydWUPfMFwQnN+9DYoWj0tWmjuSNjGcdzXklzgtmW6meA4nB0MUmod
 aXLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pHWnuCnYSx6fi4WuYY/4oO3t7EQUE3DaAyTnXwTSPzE=;
 b=NZOhLmi8wqqMWzMB2FbLziW3YYwkUrPdgwwMsYfhkoUgSbnOb/hcXkAhxsm+udx/Zy
 b3LKF2G2b4cqoc51jBaP7miQgL1zdWJFL8099dYXIn7qNHY365g3y6UCBtib3qmSROKm
 PeMJ+4e49rvC5RethdJ5Ee/johArua7qGeGvt1O0kd5ZiF64SAk/PbrQ6rWqmgPJTprH
 QlYEuWMoNLNLxrdMf/VzjEDnF8mpD12/ZTo4YrFQzKMnCDG9GWMfsjV+XLumC605krrv
 Qozbd6jxiH5/Hi2tRefU3fmJMeHv2eqwDJAjBD4+41jo7+ojw9CgWwgO975ZgqHYBKA1
 oPsA==
X-Gm-Message-State: AOAM533XFzQDO0JVcJuOsmwbT3KGOt6as4xY56VLJc/0Qwqqh5A7cBLz
 utWHDlVVrwyq7qVqaYLpqza74DZbz7jmfg==
X-Google-Smtp-Source: ABdhPJyvuzft2h4Tb7hGLAPwwRcZ5rp2ppAy8emv4Afv2hvpi7GSED2fbf0iy506qRoruDTA9lm+WQ==
X-Received: by 2002:a1c:2282:: with SMTP id
 i124mr14295893wmi.166.1627250232691; 
 Sun, 25 Jul 2021 14:57:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id e6sm47274113wrg.18.2021.07.25.14.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 14:57:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 23:57:04 +0200
Message-Id: <20210725215704.1262234-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/brickd: bump to version 1.2.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: David Lechner <david@lechnology.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This bump will fix a build failure raised since bump of vala to version
0.52.4 in commit a6855bb94a815de820374d5ee95d6a4a0af66b3d

https://github.com/ev3dev/brickd/releases/tag/v1.2.2

Fixes:
 - http://autobuild.buildroot.org/results/c162e518ad614a4c21346a3ad44e2f5c6622c889

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/brickd/brickd.hash | 2 +-
 package/brickd/brickd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brickd/brickd.hash b/package/brickd/brickd.hash
index e9be1b10b0..be9ad9ed90 100644
--- a/package/brickd/brickd.hash
+++ b/package/brickd/brickd.hash
@@ -1,5 +1,5 @@
 # Locally computed hash
-sha256  205f581103512599cb10992275da8c7207ed732e1a686600877c51b7a742de73  brickd-ev3dev-stretch_1.2.1-br1.tar.gz
+sha256  8469b6959a7e32c4b39a56e1a4f7479f785d83e6db3269487f5312f3cf1df382  brickd-v1.2.2-br1.tar.gz
 
 # Hashes for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE.txt
diff --git a/package/brickd/brickd.mk b/package/brickd/brickd.mk
index 7fe28daf78..f42b3c9956 100644
--- a/package/brickd/brickd.mk
+++ b/package/brickd/brickd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BRICKD_VERSION = ev3dev-stretch/1.2.1
+BRICKD_VERSION = v1.2.2
 BRICKD_SITE = https://github.com/ev3dev/brickd
 BRICKD_SITE_METHOD = git
 BRICKD_GIT_SUBMODULES = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
